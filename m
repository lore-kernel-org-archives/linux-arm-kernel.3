Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A3FCEEB575
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Jan 2026 00:53:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:To:Subject:From:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+QFfUDZLHXqrssXREAMstbEvZEB57K8Jrko24t+VTVM=; b=PZdkT5YJD2gKcYvNtua2vsh3GS
	avG50dIp6JXrx2ZFtLAInNKhNa4J+8KoTN9fhaYmL1JLx8Sx3HQJ4w7zJhtNN/Xje5VUa/AphatyI
	x+XF0j/lNXW6oXp1Dq4fMrE8i32htOsB6e4+Xn+TbFa3ZTjad+3taNro2rr/rW1S4T2W+rP2jHLoE
	W8JxG5nGxf1fozTMxf+xlWrQevetYEHRXJ6/8kKygb+oR/e8FdWAaEXaoQyvcmI7PnIccteuZGdnx
	jSRDc3TVuQMKMhkrRSCkepazXgqGiKJGiAl4pglpHaL2mU3wGjLmCBzASnHh3h4TBN1ffr2Hfxxv6
	KhrGgkqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vb6wO-00000006Tao-1nP8;
	Thu, 01 Jan 2026 00:53:24 +0000
Received: from nick.sneptech.io ([178.62.38.78])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vb6wM-00000006TaN-0rPI
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Jan 2026 00:53:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=philpem.me.uk;
	s=mail; t=1767228768;
	bh=zluA8146THLIKlrNSlXQInf01PFqTRlbIt8H+adc1+4=;
	h=Date:From:Subject:To:References:In-Reply-To:From;
	b=ws46NGomq0YQskPKzX2vY1YbWLQDedCpSdBcQrygdWF5TFJEMkKz/ctutRc8m7qeC
	 Dz7eb+vIhcxx4Ls66C6CNvbZoNVVeRMupdZkmoIL2K1QlhJN4CBlNxHgbaKXuQrppK
	 /qqgGAX86VgNKyPPOS4L5BEpiP8/NzccicD9rHLE=
Received: from wolf.philpem.me.uk (81-187-163-148.ip4.reverse-dns.uk [81.187.163.148])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	(Authenticated sender: mailrelay_wolf@philpem.me.uk)
	by nick.sneptech.io (Postfix) with ESMTPSA id F1C68BD357
	for <linux-arm-kernel@lists.infradead.org>; Thu,  1 Jan 2026 00:52:47 +0000 (UTC)
Received: from [192.168.1.196] (host86-149-125-116.range86-149.btcentralplus.com [86.149.125.116])
	by wolf.philpem.me.uk (Postfix) with ESMTPSA id 9CB715FCF2
	for <linux-arm-kernel@lists.infradead.org>; Thu,  1 Jan 2026 00:52:47 +0000 (GMT)
Message-ID: <b1416419-8315-43bd-8369-8a1fbd8ed85f@philpem.me.uk>
Date: Thu, 1 Jan 2026 00:52:46 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Philip Pemberton <lists@philpem.me.uk>
Subject: Re: EP29xx (TS-7200/TS-7300) board status
To: linux-arm-kernel@lists.infradead.org
References: <022f07dd-9c48-42d8-b5c2-172cf755f30f@philpem.me.uk>
Content-Language: en-US
In-Reply-To: <022f07dd-9c48-42d8-b5c2-172cf755f30f@philpem.me.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251231_165322_410759_387C6E21 
X-CRM114-Status: GOOD (  35.54  )
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

A bit of an update to my previous message, quoted below. And happy new year!

I've put my kernel configs and bootloader patches on Github at:
   <https://github.com/philpem/ts7300/>
and will be adding more to this repository soon.

Most of the issues I had with the TS7300 board seem to be down to a mix 
of the bootloader and a misunderstanding of the memory layout.

The memory layout on the 32MiB SDRAM TS-7300 is non-contiguous:
   - 8 MiB at 0x0000_0000 (to 0x007F_FFFF)
   - 8 MiB at 0x0100_0000 (to 0x017F_FFFF)
   - 8 MiB at 0x0400_0000 (to 0x047F_FFFF)
   - 8 MiB at 0x0500_0000 (to 0x057F_FFFF)

(If anyone has a 64MB or 128MB board it'd be nice to know what chips are 
fitted, and what /proc/iomem says about the RAM layout. Cirrus DS785UM1 
page 13-12/13-13 suggests that this layout holds for 64MiB SDRAM chips 
in a 13x10x4 row*col*bank layout - except that there would be four more 
8MB stripes at 02xx_, 03xx_, 06xx_ and 07xx_)

The TS-SDBOOT code in the 2K SPI EEPROM initialises SDRAM, loads the 
first sector (MBR) of the SD Card and executes it at 0x1000 in ARM Thumb 
mode. The boot sector then loads the kernel and initramfs, builds the 
ATAGS and jumps to the kernel.

The problem is, the kernel is loaded at 0x0021_8000 (2144K into the 
first RAM block): if the kernel image is uncompressed, this limits the 
size of an uncompressed (Image) kernel to 8MB less 2144K = 6048K, and 
the loading base needs to be changed.
With a compressed (zImage) kernel and the default boot loader, the 
uncompressed and compressed images must fit into the same 8MB block!

I patched the boot sector to load the kernel at 0400_0000, giving 8 MiB 
each for the uncompressed zImage, initramfs and compressed kernel. This 
solves the kernel size issue nicely. (another way to go would be 
patching it to load the kernel at 0x8000).

Kernel 6.18.1 (built with Ubuntu arm-linux-gnueabi-gcc 
13.3.0-6ubuntu2~24.04 and Binutils 2.42) seems to work pretty well after 
some configuration to remove unnecessary features and disable strong 
stack guarding (see my previous message).

So far the main issues are:

   * '/sbin/reboot' crashes at "Reboot failed -- System halted" and the 
board hangs. (This may need a kernel patch as I think the only way to 
reboot this board is by tripping the TS-7300 Watchdog)

   * DHCP doesn't pass the NFS server and root path onto NFS - this 
breaks NFS booting. Passing the NFS root on the command line 
(nfsroot=10.1.2.3:/nfs/armroot,v3,nolock,tcp) works as a workaround.

   * There's no SD Card driver, I presume because while TS provided 
source as part of their modified 2.4 kernel, it's flagged "License: 
Proprietary". I need to look at options for this.

   * The kernel needs a DTB to boot, and the bootloader pre-dates Device 
Trees. The easy fix is to use a compressed kernel and 'cat' the DTB onto 
the end, and make sure the relevant CONFIG_ option is set to allow this.

This also seems to happen after a few minutes runtime but it doesn't 
affect the system otherwise and I'm not sure what causes it:

> Unable to handle kernel NULL pointer dereference at virtual address 00000030 when read
> [00000030] *pgd=00000000
> Internal error: Oops: 17 [#1] ARM
> Modules linked in:
> CPU: 0 UID: 0 PID: 24 Comm: kworker/u4:2 Not tainted 6.18.2 #8 NONE 
> Hardware name: Generic DT based system
> Workqueue: events_unbound idle_cull_fn
> PC is at __set_cpus_allowed_ptr+0x48/0x88
> LR is at __set_cpus_allowed_ptr+0x28/0x88
> pc : [<c0047834>]    lr : [<c0047814>]    psr: 60000093
> sp : c611dea8  ip : c143422c  fp : c611debc
> r10: c1408d05  r9 : c06bc59c  r8 : c0696888
> r7 : 00000122  r6 : 00000100  r5 : c142dc00  r4 : c611dec4
> r3 : c06c1a04  r2 : c0698440  r1 : 00000030  r0 : c0698440
> Flags: nZCv  IRQs off  FIQs on  Mode SVC_32  ISA ARM  Segment none
> Control: c000717f  Table: 016f4000  DAC: 00000053
> Register r0 information: non-slab/vmalloc memory
> Register r1 information: non-paged memory
> Register r2 information: non-slab/vmalloc memory
> Register r3 information: non-slab/vmalloc memory
> Register r4 information: 2-page vmalloc region starting at 0xc611c000 allocated at kernel_clone+0xac/0x1f4
> Register r5 information: slab task_struct start c142dc00 pointer offset 0 size 1792
> Register r6 information: non-paged memory
> Register r7 information: non-paged memory
> Register r8 information: non-slab/vmalloc memory
> Register r9 information: non-slab/vmalloc memory
> Register r10 information: slab kmalloc-256 start c1408d00 pointer offset 5 size 256
> Register r11 information: 2-page vmalloc region starting at 0xc611c000 allocated at kernel_clone+0xac/0x1f4
> Register r12 information: slab kmalloc-128 start c1434200 pointer offset 44 size 128
> Process kworker/u4:2 (pid: 24, stack limit = 0x(ptrval))
> Stack: (0xc611dea8 to 0xc611e000)
> dea0:                   20000013 00000000 c1434200 c611df00 c611ded4 c0047940
> dec0: c1434200 c06c1a04 00000000 00000000 61c88647 c0037970 c1434200 c00389cc
> dee0: c0696888 c0696830 00000000 c06a5cd0 c0696888 c0038a68 c1408d00 00000000
> df00: c1434200 c1434200 c1655780 c1655780 c1408d00 c1409000 c069688c c003919c
> df20: 00000000 00000002 c157e300 c157e300 c157e300 c1409000 c1655780 c1655780
> df40: c140902c c1409000 c0039694 c157e300 00000402 c16557ac 00000000 c0039808
> df60: 00000000 c1655a80 c1657920 c157e300 c0039694 c1655780 00000001 00000000
> df80: 00000000 c0040efc c1657920 c157e300 c1657920 c0040d5c 00000000 00000000
> dfa0: 00000000 00000000 00000000 c000834c 00000000 00000000 00000000 00000000
> dfc0: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
> dfe0: 00000000 00000000 00000000 00000000 00000013 00000000 00000000 00000000
> Call trace: 
>  __set_cpus_allowed_ptr from set_cpus_allowed_ptr+0x24/0x30
>  set_cpus_allowed_ptr from unbind_worker+0x38/0xc4
>  unbind_worker from detach_dying_workers+0x2c/0x48
>  detach_dying_workers from idle_cull_fn+0x80/0xb0
>  idle_cull_fn from process_scheduled_works+0x184/0x268
>  process_scheduled_works from worker_thread+0x174/0x1fc
>  worker_thread from kthread+0x1a0/0x1c0
>  kthread from ret_from_fork+0x14/0x28
> Exception stack(0xc611dfb0 to 0xc611dff8)
> dfa0:                                     00000000 00000000 00000000 00000000
> dfc0: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
> dfe0: 00000000 00000000 00000000 00000000 00000013 00000000
> Code: e5943008 e313000e 1a000009 e5943000 (e5911000) 
> ---[ end trace 0000000000000000 ]---
> note: kworker/u4:2[24] exited with irqs disabled

I've no idea what's going on with this but it seems benign?

Cheers
Phil.

On 29/12/2025 21:48, Philip Pemberton wrote:
> Hi,
> 
> I wondered if anyone knew what condition the EP39xx kernel support was 
> currently in, and whether anything special (configuration etc.) was 
> needed to get recent kernels to boot on the TS-7300 hardware?
> 
> The latest kernel I've had working out-of-box was 4.17.19, which gets as 
> far as trying to mount the root filesystem (the initrd the TS bootloader 
> loads doesn't seem to be recognised).
> 4.18.1 also works works, so long as I run "make menuconfig" after "make 
> ep93xx_defconfig" and set CONFIG_STACKPROTECTOR_STRONG=n.
> 
> 4.19.1 and 4.20.9 crash before printing the "Uncompressing Linux" banner 
> and eventually reboot. This holds for every later kernel I've tried.
> I've also seen this error while bisecting from 4.18.1 to 4.19.1:
>    Uncompressing Linux... done, booting the kernel.
>    Warning: Neither atags nor dtb found
> Which doesn't make any sense. But nor did the bad commit:
>    # first bad commit: [9a76aba02a37718242d7cdc294f0a3901928aa57] Merge 
> git://git.kernel.org/pub/scm/linux/kernel/git/davem/net-next
> 
> The boot sector loads the compressed kernel in SDRAM at 0x218000, the 
> initrd at 0x01000000, and the ATAGS end up at 0x100.
> 
> I'm using the gcc-linaro-6.4.1-2017.11-x86_64_arm-linux-gnueabihf 
> compiler as it's a similar vintage to the 4.x kernels and I wanted to 
> rule out issues with the gcc-13 Debian gcc.
> 
> Thanks.

-- 
Phil.
philpem@philpem.me.uk
http://www.philpem.me.uk


