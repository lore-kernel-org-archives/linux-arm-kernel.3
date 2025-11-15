Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D87FECEB2CC
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 15 Nov 2025 14:39:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pD7kPlhVtoTvdoru97AeKxE8lsFCuqanW9SKi5RQlkA=; b=izQWxD01uJOzv8hSmGQOoPlUmV
	fDi0iuJaEBqL6AtKLZHGN7XohxVymb22mczXGkOJm5OOITVjKUI9DI2QD4hmgiTnQNU/adCcayYpd
	wKrIKMpOtMTzSCdgTfF1/ok0Ob030wKe50gydQAD4CH6lmTwpjzaEilvfuayQJPy0fz3CDtSBrp4D
	mN1YdKkQzf79McjxCraPAZUCFWpQAzzTdMFbrcBOwTw/t20U+pURoa5AOi17ONP4WMD7B/p3RZ2xK
	3d6aG4Xee1F5diAsNKJNZ073meGt27qeSH3U5B6Zynw9gWnQCxjtw/xfMpYBZwRXY07Dw8+1KvPQw
	Ed8GIRAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKHR1-0000000Dr2W-3okx;
	Sat, 15 Nov 2025 14:39:27 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKHQy-0000000Dr1l-3K2d
	for linux-arm-kernel@lists.infradead.org;
	Sat, 15 Nov 2025 14:39:26 +0000
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=[127.0.0.1])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <a.fatoum@pengutronix.de>)
	id 1vKHQu-0008G6-7H; Sat, 15 Nov 2025 15:39:20 +0100
Message-ID: <aafebce6-f369-40b7-81eb-2dccd650fdab@pengutronix.de>
Date: Sat, 15 Nov 2025 15:39:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 4/8] scripts/make_fit: Provide a way to add built
 modules
To: Simon Glass <sjg@chromium.org>, linux-arm-kernel@lists.infradead.org
Cc: Masahiro Yamada <masahiroy@kernel.org>, Chen-Yu Tsai
 <wenst@chromium.org>, Tom Rini <trini@konsulko.com>,
 =?UTF-8?B?SiAuIE5ldXNjaMOkZmVy?= <j.ne@posteo.net>,
 Nicolas Schier <nsc@kernel.org>, linux-kernel@vger.kernel.org,
 =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
References: <20251114142741.1919072-1-sjg@chromium.org>
 <20251114142741.1919072-5-sjg@chromium.org>
Content-Language: en-US
From: Ahmad Fatoum <a.fatoum@pengutronix.de>
In-Reply-To: <20251114142741.1919072-5-sjg@chromium.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: a.fatoum@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251115_063924_995955_A29375B0 
X-CRM114-Status: GOOD (  38.17  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Hello Simon,

On 14.11.25 15:27, Simon Glass wrote:
> Provide arguments to support building a ramdisk from a directory tree of
> modules. This is a convenient way to try out a kernel with its modules.
> 
> This makes use of the cpio tool rather than attempting to use a python
> module or our own code. The list of modules is provided in a file.
> 
> Signed-off-by: Simon Glass <sjg@chromium.org>
> Reviewed-by: Nicolas Schier <nsc@kernel.org>
> Suggested-by: Ahmad Fatoum <a.fatoum@pengutronix.de>

Thanks for taking up the suggestion! I just Cc'd you on a patch that
generates a CPIO with the modules directly as a make target.

I'd prefer going down that route instead as to reuse as much existing code
as possible.

Maybe this even covers Thomas' use case from the other thread?

Thanks,
Ahmad

> ---
> 
> (no changes since v4)
> 
> Changes in v4:
> - Provide the list of modules from the Makefile
> - Reduce verbosity (don't print every module filename)
> 
> Changes in v3:
> - Add a way to add built modules into the FIT
> 
>  scripts/make_fit.py | 98 +++++++++++++++++++++++++++++++++++++++++----
>  1 file changed, 90 insertions(+), 8 deletions(-)
> 
> diff --git a/scripts/make_fit.py b/scripts/make_fit.py
> index 1a74a9dcd85e..3db129f40b20 100755
> --- a/scripts/make_fit.py
> +++ b/scripts/make_fit.py
> @@ -13,11 +13,17 @@ Usage:
>          -r /boot/initrd.img-6.14.0-27-generic @arch/arm64/boot/dts/dtbs-list
>          -E -c gzip
>  
> +    # Build with modules ramdisk instead of external ramdisk:
> +    make_fit.py -A arm64 -n 'Linux-6.17' -O linux
> +        -o arch/arm64/boot/image.fit -k /tmp/kern/arch/arm64/boot/image.itk
> +        -m module1.ko module2.ko module3.ko @arch/arm64/boot/dts/dtbs-list
> +
>  Creates a FIT containing the supplied kernel, an optional ramdisk, and a set of
>  devicetree files, either specified individually or listed in a file (with an
>  '@' prefix).
>  
>  Use -r to specify an existing ramdisk/initrd file.
> +Use -m to build a ramdisk from specified kernel module files.
>  
>  Use -E to generate an external FIT (where the data is placed after the
>  FIT data structure). This allows parsing of the data without loading
> @@ -38,6 +44,7 @@ as U-Boot, Linuxboot, Tianocore, etc.
>  import argparse
>  import collections
>  import os
> +import shutil
>  import subprocess
>  import sys
>  import tempfile
> @@ -83,8 +90,14 @@ def parse_args():
>            help='Specifies the operating system')
>      parser.add_argument('-k', '--kernel', type=str, required=True,
>            help='Specifies the (uncompressed) kernel input file (.itk)')
> -    parser.add_argument('-r', '--ramdisk', type=str,
> +
> +    # Create mutually exclusive group for ramdisk options
> +    rd_group = parser.add_mutually_exclusive_group()
> +    rd_group.add_argument('-r', '--ramdisk', type=str,
>            help='Specifies the ramdisk/initrd input file')
> +    rd_group.add_argument('-m', '--modules', type=str, nargs='+',
> +          help='List of module filenames to include in ramdisk')
> +
>      parser.add_argument('-v', '--verbose', action='store_true',
>                          help='Enable verbose output')
>      parser.add_argument('dtbs', type=str, nargs='*',
> @@ -240,6 +253,60 @@ def output_dtb(fsw, seq, fname, arch, compress):
>          fsw.property('data', compressed)
>  
>  
> +def build_ramdisk(args, tmpdir):
> +    """Build a cpio ramdisk containing kernel modules
> +
> +    Similar to mkinitramfs, this creates a compressed cpio-archive containing
> +    the kernel modules for the current kernel version.
> +
> +    Args:
> +        args (Namespace): Program arguments
> +        tmpdir (str): Temporary directory to use for modules installation
> +
> +    Returns:
> +        tuple:
> +            bytes: Compressed cpio data containing modules
> +            int: total uncompressed size
> +    """
> +    suppress = None if args.verbose else subprocess.DEVNULL
> +
> +    if args.verbose:
> +        print(f'Copying {len(args.modules)} modules to ramdisk')
> +
> +    # Create output-directory structure
> +    outdir = os.path.join(tmpdir, 'initramfs')
> +    modules_dir = os.path.join(outdir, 'usr', 'lib', 'modules')
> +    os.makedirs(modules_dir, exist_ok=True)
> +
> +    # Copy in the specified modules
> +    for module in args.modules:
> +        dest_path = os.path.join(modules_dir, os.path.basename(module))
> +        shutil.copy2(module, dest_path)
> +
> +    if args.verbose:
> +        print(f'Creating cpio archive from {outdir}')
> +
> +    with tempfile.NamedTemporaryFile() as cpio_file:
> +        # Change to initramfs directory and create cpio archive
> +        with subprocess.Popen(['find', '.', '-print0'], cwd=outdir,
> +                              stdout=subprocess.PIPE) as find:
> +            with subprocess.Popen(['cpio', '-o', '-0', '-H', 'newc'],
> +                                  stdin=find.stdout, stdout=cpio_file,
> +                                  stderr=suppress, cwd=outdir) as cpio:
> +                find.stdout.close()
> +                cpio.wait()
> +                find.wait()
> +
> +                if cpio.returncode != 0:
> +                    raise RuntimeError('Failed to create cpio archive')
> +
> +        cpio_file.seek(0)  # Reset to beginning for reading
> +        if args.verbose:
> +            print('Reading ramdisk...' if args.compress == 'none' else
> +                  f'Compressing ramdisk with {args.compress}...')
> +        return compress_data(cpio_file, args.compress), cpio_file.tell()
> +
> +
>  def process_dtb(fname, args):
>      """Process an input DTB, decomposing it if requested and is possible
>  
> @@ -318,11 +385,12 @@ def _process_dtbs(args, fsw, entries, fdts):
>      return seq, size
>  
>  
> -def build_fit(args):
> +def build_fit(args, tmpdir):
>      """Build the FIT from the provided files and arguments
>  
>      Args:
>          args (Namespace): Program arguments
> +        tmpdir (str): Temporary directory for any temporary files
>  
>      Returns:
>          tuple:
> @@ -344,20 +412,29 @@ def build_fit(args):
>  
>      # Handle the ramdisk if provided. Compression is not supported as it is
>      # already compressed.
> +    ramdisk_data = None
>      if args.ramdisk:
>          with open(args.ramdisk, 'rb') as inf:
> -            data = inf.read()
> -        size += len(data)
> -        write_ramdisk(fsw, data, args)
> +            ramdisk_data = inf.read()
> +        size += len(ramdisk_data)
> +    elif args.modules:
> +        if args.verbose:
> +            print('Building modules ramdisk...')
> +        ramdisk_data, uncomp_size = build_ramdisk(args, tmpdir)
> +        size += uncomp_size
> +
> +    if ramdisk_data:
> +        write_ramdisk(fsw, ramdisk_data, args)
>  
>      count, fdt_size = _process_dtbs(args, fsw, entries, fdts)
>      size += fdt_size
>  
> -    finish_fit(fsw, entries, bool(args.ramdisk))
> +    finish_fit(fsw, entries, has_ramdisk=bool(ramdisk_data))
>  
> -    # Include the kernel itself in the returned file count
>      fdt = fsw.as_fdt()
>      fdt.pack()
> +
> +    # Count FDT files, kernel, plus ramdisk if present
>      return fdt.as_bytearray(), count + 1 + bool(args.ramdisk), size
>  
>  
> @@ -365,7 +442,12 @@ def run_make_fit():
>      """Run the tool's main logic"""
>      args = parse_args()
>  
> -    out_data, count, size = build_fit(args)
> +    tmpdir = tempfile.mkdtemp(prefix='make_fit_')
> +    try:
> +        out_data, count, size = build_fit(args, tmpdir)
> +    finally:
> +        shutil.rmtree(tmpdir)
> +
>      with open(args.output, 'wb') as outf:
>          outf.write(out_data)
>  


-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

