import os
import sys
import re
import pandas as pd


def pad_x_y_tracked_cols(col, zero_fill=6):
    re_match = re.compile(r"(X|Y)Tracked([0-9]+)")
    if re_match.fullmatch(col):
        chunks = re.split(r'([0-9]+)', col, 2)
        if len(chunks) < 2:
            raise ValueError("XTracked or YTracked does not match pattern r'(X|Y)Tracked([0-9]+)'")
        new_col = chunks[0] + str(chunks[1]).zfill(zero_fill)
        return new_col
    else:
        return col


def parse_file(input_file, output_dir):
    df = pd.read_csv(input_file, delimiter='	', header=1, encoding='utf-16')
    new_columns = {col: pad_x_y_tracked_cols(col) for col in df.columns}
    df.rename(new_columns, inplace=True, axis=1)
    df = df.sort_index(axis=1)
    output_file = os.path.basename(input_file.replace('.txt', '.xlsx'))
    output_path = os.path.join(output_dir, output_file)
    df.to_excel(output_path)


def main(input_dir, output_dir):
    for entry in os.scandir(input_dir):
        if entry.is_file():
            parse_file(entry.path, output_dir)

if __name__ == "__main__":
    main(sys.argv[1], sys.argv[2])
