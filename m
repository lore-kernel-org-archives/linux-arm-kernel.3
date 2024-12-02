Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 932A3D7832F
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Dec 2024 15:37:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ztOkXvXowAogGd0DkK78vFvIwzWUXjXleLKRZq6etvY=; b=EU40fGYcqYgWeEwAWnpgFfrI3P
	W+XRgHIxJxRtJmWSftPYapt0jBiyQN6lTOkg/x3klOTRctEMyqgUJuEgjj4IoN+O9OEn0sUzc7gxd
	12DPOemMiZWhtC9GE80Cfvs4bPV4kgrPeOr72tZCkrmWlwWJCNYclZs3uXmLVhEsmEh9XMn+ljvPL
	rZdMZaGY+O1/dIXWiyFApMoiKqU1U8p+45XywYZlaxfEHD10Pj8CMm10CTpgYqhizi7yJs3pw3NIq
	XxuRSVN1Q5ItepPvJSAYIHg9vXIpePC6DP/j4v2iO7i7kH0N5XCxlzXLC8A95uxZoqi4CRPH5QYGp
	S/P9c+dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tI8UI-00000006g5u-2sWr;
	Mon, 02 Dec 2024 15:37:26 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tI8TJ-00000006g06-3Ex8
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Dec 2024 15:36:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id F3FD15C688F;
	Mon,  2 Dec 2024 15:35:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1FA62C4CED1;
	Mon,  2 Dec 2024 15:36:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733153784;
	bh=iZ22iiUsExafvQtlDvstWKo/EY6d5lVZQ/T69ElRhjk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KiodSQrz41/ZRmuf5j7NvGOBBP9vTAk47/R3q7+BjSAfpzbL4JMFN7W254SMYOVuD
	 uGcW20+rAN4S1OJ19X91Hkmfn/OrlI2mq6+v5RoMMLAP9ThERVYVQUChqlIaoETOtd
	 2oQXDCi7tviseHkyIoeGoPMVfPqMX0PmYmF9GCsrlxieVbIzDCcbrpDg9KrIV6K8oX
	 3lfofBKRsbQsb35d21F0bCs+VJJ420iVDBbG9sjTnX0vQnyePKmmGc3f+QlMc7nAKz
	 H2VJQsCfwZkejDw3Aju9MmbhpE3Lhwp+fwd7GMJMVBGHQpyc6zvmlkcXSv2W8zq1ca
	 q0mp5DGY94Ulw==
Date: Mon, 2 Dec 2024 15:36:19 +0000
From: Will Deacon <will@kernel.org>
To: Vitaly Chikunov <vt@altlinux.org>, james.morse@arm.com
Cc: linux-arm-kernel@lists.infradead.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	linux-kernel@vger.kernel.org, maz@kernel.org,
	oliver.upton@linux.dev, mark.rutland@arm.com
Subject: Re: v6.13-rc1: Internal error: Oops - Undefined instruction:
 0000000002000000 [#1] SMP
Message-ID: <20241202153618.GA6834@willie-the-truck>
References: <20241202045830.e4yy3nkvxtzaybxk@altlinux.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241202045830.e4yy3nkvxtzaybxk@altlinux.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241202_073625_896447_9D4FF236 
X-CRM114-Status: GOOD (  14.17  )
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

[+ usual suspects]

On Mon, Dec 02, 2024 at 07:58:30AM +0300, Vitaly Chikunov wrote:
> v6.13-rc1 exhibits a boot failure on aarch64 under KVM. (QEMU 9.1.1, CPU
> Kunpeng-920). Boot log:

I've not tried to repro this locally, but from the log:

> + time qemu-system-aarch64 -M accel=kvm:tcg -smp cores=8 -m 4096 -serial mon:stdio -nodefaults -nographic -no-reboot -fsdev local,id=root,path=/,security_model=none,multidevs=remap -device virtio-9p-pci,fsdev=root,mount_tag=virtio-9p:/ -device virtio-rng-pci -kernel /usr/src/tmp/kernel-image-6.13-buildroot/boot/vmlinuz-6.13.0-6.13-alt0.rc1 -initrd /usr/src/tmp/initramfs-6.13.0-6.13-alt0.rc1.img -sandbox on,spawn=deny -M virt,gic-version=3 -cpu max -append 'console=ttyAMA0 mitigations=off nokaslr  panic=-1 SCRIPT=/usr/src/tmp/vm.SchsIm2FjB earlycon earlyprintk=serial ignore_loglevel debug rddebug'
> [    0.000000] Booting Linux on physical CPU 0x0000000000 [0x481fd010]
> [    0.000000] Linux version 6.13.0-6.13-alt0.rc1 (builder@localhost.localdomain) (gcc-14 (GCC) 14.2.1 20241028 (ALT Sisyphus 14.2.1-alt1), GNU ld (GNU Binutils) 2.43.1.20241025) #1 SMP PREEMPT_DYNAMIC Mon Dec  2 03:33:29 UTC 2024
> [    0.000000] KASLR disabled on command line
> [    0.000000] random: crng init done
> [    0.000000] Machine model: linux,dummy-virt
> [    0.000000] printk: debug: ignoring loglevel setting.
> [    0.000000] efi: UEFI not found.
> [    0.000000] earlycon: pl11 at MMIO 0x0000000009000000 (options '')
> [    0.000000] printk: legacy bootconsole [pl11] enabled
> [    0.000000] OF: reserved mem: Reserved memory: No reserved-memory node in the DT
> [    0.000000] NUMA: Faking a node at [mem 0x0000000040000000-0x000000013fffffff]
> [    0.000000] NODE_DATA(0) allocated [mem 0x13f7f3540-0x13f7f947f]
> [    0.000000] Zone ranges:
> [    0.000000]   DMA      [mem 0x0000000040000000-0x00000000ffffffff]
> [    0.000000]   DMA32    empty
> [    0.000000]   Normal   [mem 0x0000000100000000-0x000000013fffffff]
> [    0.000000] Movable zone start for each node
> [    0.000000] Early memory node ranges
> [    0.000000]   node   0: [mem 0x0000000040000000-0x000000013fffffff]
> [    0.000000] Initmem setup node 0 [mem 0x0000000040000000-0x000000013fffffff]
> [    0.000000] cma: Reserved 256 MiB at 0x00000000f0000000 on node -1
> [    0.000000] psci: probing for conduit method from DT.
> [    0.000000] psci: PSCIv1.1 detected in firmware.
> [    0.000000] psci: Using standard PSCI v0.2 function IDs
> [    0.000000] psci: Trusted OS migration not required
> [    0.000000] psci: SMC Calling Convention v1.1
> [    0.000000] smccc: KVM: hypervisor services detected (0x00000000 0x00000000 0x00000000 0x00000003)
> [    0.000000] percpu: Embedded 34 pages/cpu s100632 r8192 d30440 u139264
> [    0.000000] pcpu-alloc: s100632 r8192 d30440 u139264 alloc=34*4096
> [    0.000000] pcpu-alloc: [0] 0 [0] 1 [0] 2 [0] 3 [0] 4 [0] 5 [0] 6 [0] 7
> [    0.000000] Internal error: Oops - Undefined instruction: 0000000002000000 [#1] SMP

We take an undefined instruction exception in the kernel early during
boot...

> [    0.000000] Modules linked in:
> [    0.000000] CPU: 0 UID: 0 PID: 0 Comm: swapper Not tainted 6.13.0-6.13-alt0.rc1 #1
> [    0.000000] Hardware name: linux,dummy-virt (DT)
> [    0.000000] pstate: 004000c5 (nzcv daIF +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
> [    0.000000] pc : __cpuinfo_store_cpu+0xe8/0x240
> [    0.000000] lr : cpuinfo_store_boot_cpu+0x34/0x88
> [    0.000000] sp : ffff800082013df0
> [    0.000000] x29: ffff800082013df0 x28: 000000000000008e x27: ffff800081e38128
> [    0.000000] x26: ffff800081702190 x25: ffff80008201f040 x24: ffff0000ff7d1d00
> [    0.000000] x23: ffff80008201ec00 x22: ffff800081e39100 x21: ffff8000816f9750
> [    0.000000] x20: ffff800081f55280 x19: ffff0000ff6be2e0 x18: 0000000000000000
> [    0.000000] x17: 0000000000000000 x16: 0000000000000000 x15: 0000000000000000
> [    0.000000] x14: 000000000000002f x13: 000000013f7f9490 x12: 0000008000000000
> [    0.000000] x11: 0000000000000000 x10: 00000000007f8000 x9 : 000000013f808000
> [    0.000000] x8 : 0000000000000000 x7 : 0000000000000000 x6 : 000000013f7f94c0
> [    0.000000] x5 : 0000000000000000 x4 : 0000000000000000 x3 : 1100010011111111
> [    0.000000] x2 : 0000000000000001 x1 : 0000000084448004 x0 : ffff0000ff6be2e0
> [    0.000000] Call trace:
> [    0.000000]  __cpuinfo_store_cpu+0xe8/0x240 (P)
> [    0.000000]  cpuinfo_store_boot_cpu+0x34/0x88 (L)
> [    0.000000]  cpuinfo_store_boot_cpu+0x34/0x88
> [    0.000000]  smp_prepare_boot_cpu+0x30/0x58
> [    0.000000]  start_kernel+0x514/0x9d0
> [    0.000000]  __primary_switched+0x88/0x98
> [    0.000000] Code: f100085f 54000600 f2580c7f 54000060 (d538a482)

... and that's:

   0:	f100085f 	cmp	x2, #0x2
   4:	54000600 	b.eq	0xc4  // b.none
   8:	f2580c7f 	tst	x3, #0xf0000000000
   c:	54000060 	b.eq	0x18  // b.none
  10:*	d538a482 	mrs	x2, s3_0_c10_c4_4		<-- trapping instruction

Which I think corresponds to a read of MPAMIDR_EL1.

It looks like James routed accesses to this register to undef_access()
in 31ff96c38ea3 ("KVM: arm64: Fix missing traps of guest accesses to the
MPAM register") so I'm not really sure how this is supposed to work
given that it's an ID register.

James?

Will

