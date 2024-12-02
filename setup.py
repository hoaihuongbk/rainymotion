from setuptools import setup

setup(
    name="rainymotion",
    version="0.1",
    author="Georgy Ayzel",
    author_email="ayzel@uni-potsdam.de, ayzelgv@gmail.com",
    description=("Python library for radar-based precipitation nowcasting using optical flow techniques"),
    url="https//www.github.com/hydrogo/rainymotion",
    packages=["rainymotion"],
    include_package_data=True,
    install_requires=[
        'opencv-python-headless'
    ],
    license="MIT-License",
    keywords="precipitation nowcasting radar",
    classifiers=[
        "Development Status :: Alpha",
        "Intended Audience  :: Science/Research/Education",
        "License            :: MIT License"]
)