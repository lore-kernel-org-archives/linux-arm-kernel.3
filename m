Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32124E77197
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jan 2025 15:26:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fM2mTi9ijnIKt/WaG+7ChM6iWCo/x4zj92LVibswPyk=; b=cbnPmzqJfV4ZFDzt3whAkt0cvm
	2f20N4sdQZVkzBr5PdAs+QsUTUZJpzTCmBhyXOVx8hZc7o6v/K6Ktc6QBoUPzYAOYnLEuYzs0UV/S
	XLkkgNrrHH97KxYndeglKRtY2sij8jrSuYqcgP6dEnpNu2dedmxvTiTpOjfEMnSYrz5HlJ+ntnbTl
	97wRVsgkDW4qqAcOvZJnBlFIzBdsFyCyu6T6mjin2TMlzOtvDI8T31kbMvJT7G3RUwL3MmUeMXAvI
	36t9+dwmUvJURQHjh9tLfGjrxV/Z4syeDx+9lx4J2qbGM6vd/9eiEf3KFiePmjVtjJTaID2oDB0GL
	tkVlgQCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVuPv-0000000CT4l-06RQ;
	Thu, 09 Jan 2025 15:25:51 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVuNM-0000000CSQx-02O5
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jan 2025 15:23:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 98160A41F77;
	Thu,  9 Jan 2025 15:21:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9681C4CED2;
	Thu,  9 Jan 2025 15:23:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736436190;
	bh=lDqw75XZ4oWnPZ/kMKxph7EvY91mXW9uztS52EpAKaM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QxBD3Q/M4bTGEu1LN0/SHFCSMxQscwoXv5fzu3PrcaslwbNOR/tImw2mmHk7JyfWn
	 qGxEsovqHIN2d34xg/7mjGvYSr2s8XawDCgfGCOHHeDn5ZKqOSYwhWAqEUES+ULixC
	 ZwW0n5X8JacG6C/TAv6Gfj3bTjDblteKgN1QongApMZyR1FBmtupMj3sDAdzHWFUnC
	 6e4SkQpOP5WhWlHNAuD/hMW2QoCfU2ckESprO9UCKpeZVr9j23llZeWtlKpYn3K/LL
	 g12sA7YWEAMxLIx+FK5UBlfX5TtWhpNg/GMBrdqBofjaXyJcjQ/Wu5p63tx65CLvzF
	 XGWY8eOWW64uw==
Date: Thu, 9 Jan 2025 15:23:06 +0000
From: Will Deacon <will@kernel.org>
To: Bruno Goncalves <bgoncalv@redhat.com>
Cc: cki-project@redhat.com, catalin.marinas@arm.com,
	linux-arm-kernel@lists.infradead.org
Subject: Re: =?utf-8?Q?=E2=9D=8C_FAIL=3A_Test_repor?= =?utf-8?Q?t?= for
 for-kernelci (6.13.0-rc6, upstream-arm-next, 577490b6)
Message-ID: <20250109152305.GA10837@willie-the-truck>
References: <88638.125010818430600129@us-mta-121.us.mimecast.lan>
 <20250109142053.GA10705@willie-the-truck>
 <CA+QYu4q9-emHC-HbAwbqjq+rbdpA=OffHFfOZWBMXt2+ewkB4g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CA+QYu4q9-emHC-HbAwbqjq+rbdpA=OffHFfOZWBMXt2+ewkB4g@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250109_072312_186387_048DBBA5 
X-CRM114-Status: GOOD (  27.67  )
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

On Thu, Jan 09, 2025 at 03:30:54PM +0100, Bruno Goncalves wrote:
> On Thu, 9 Jan 2025 at 15:21, 'Will Deacon' via cki-project
> <cki-project@redhat.com> wrote:
> >
> > On Wed, Jan 08, 2025 at 11:43:03PM -0000, cki-project@redhat.com wrote:
> > > Hi, we tested your kernel and here are the results:
> > >
> > >     Overall result: FAILED
> > >              Merge: OK
> > >            Compile: OK
> > >               Test: FAILED
> > >
> > >
> > > Kernel information:
> > >     Commit message: Merge branches 'for-next/core' and 'for-next/perf' into for-kernelci
> > >
> > > You can find all the details about the test run at
> > >     https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1616589950
> > >
> > > One or more kernel tests failed:
> > >     Unrecognized or new issues:
> > >         Boot test
> > >              aarch64
> > >                    Logs: https://datawarehouse.cki-project.org/kcidb/tests/redhat:1616589950-aarch64-kernel_upt_14
> > >                    Non-passing ran subtests:
> > >                        ❌ FAIL distribution/kpkginstall/journalctl-check
> > >              aarch64
> > >                    Logs: https://datawarehouse.cki-project.org/kcidb/tests/redhat:1616589950-aarch64-kernel_upt_37
> > >                    Non-passing ran subtests:
> > >                        ❌ FAIL distribution/kpkginstall/journalctl-check
> > >              aarch64
> > >                    Logs: https://datawarehouse.cki-project.org/kcidb/tests/redhat:1616589950-aarch64-kernel_upt_50
> > >                    Non-passing ran subtests:
> > >                        ❌ FAIL distribution/kpkginstall/journalctl-check
> > >              aarch64
> > >                    Logs: https://datawarehouse.cki-project.org/kcidb/tests/redhat:1616589950-aarch64-kernel_upt_57
> > >                    Non-passing ran subtests:
> > >                        ❌ FAIL distribution/kpkginstall/journalctl-check
> > >              aarch64
> > >                    Logs: https://datawarehouse.cki-project.org/kcidb/tests/redhat:1616589950-aarch64-kernel_upt_65
> > >                    Non-passing ran subtests:
> > >                        ❌ FAIL distribution/kpkginstall/journalctl-check
> >
> > Hmm, this looks bad but I'm struggling to spot the issue in the logs.
> >
> > One thing I don't quite grok, however, is that the logs refer to both
> > "6.13.0-rc6" and "6.13.0-0.rc6.20250107gitfbfd64d25c7a.49.fc42.aarch64)",
> > neither of which correspond to the arm64 for-kernelci branch.
> >
> > There are also some errors from grub, but I don't know whether or not
> > they are expected/benign:
> >
> >  error: ../../grub-core/kern/disk_common.c:26:attempt to read or write outside
> >  of partition.
> >  error: ../../grub-core/kern/disk_common.c:26:attempt to read or write outside
> >  of partition.
> >  error: ../../grub-core/kern/disk_common.c:26:attempt to read or write outside
> >  of partition.
> >  error: ../../grub-core/kern/disk_common.c:26:attempt to read or write outside
> >  of partition.
> >  error: ../../grub-core/kern/disk_common.c:26:attempt to read or write outside
> >  of partition.
> >
> > If there's a log showing a build of for-kernelci failing to boot, then
> > that would be really helpful. Can somebody from the CKI team point us in
> > the right direction, please?
> 
> Hi Will,
> 
> The problem is unrelated to the grub message, but there is some call
> trace during boot that shows in the journalctl [1].
> 
> snip from [2]
> [    0.003428] Remapping and enabling EFI services.
> [    0.004504] smp: Bringing up secondary CPUs ...
> [    0.004729] Detected PIPT I-cache on CPU1
> [    0.004774] GICv3: CPU1: found redistributor 120100 region
> 0:0x00001001005e0000
> [    0.004783] GICv3: CPU1: using allocated LPI pending table
> @0x0000080000c30000
> [    0.004825] arch_timer: Enabling local workaround for ARM erratum 1418040
> [    0.004838] CPU1: Booted secondary processor 0x0000120100 [0x413fd0c1]
> [    0.005044] ------------[ cut here ]------------
> [    0.005046] workqueue: work disable count underflowed
> [    0.005055] WARNING: CPU: 1 PID: 23 at kernel/workqueue.c:4317
> enable_work+0x104/0x120
> [    0.005067] Modules linked in:
> [    0.005072] CPU: 1 UID: 0 PID: 23 Comm: cpuhp/1 Not tainted 6.13.0-rc6 #1
> [    0.005079] pstate: 604000c9 (nZCv daIF +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
> [    0.005085] pc : enable_work+0x104/0x120
> [    0.005091] lr : enable_work+0x104/0x120
> [    0.005096] sp : ffff800080a43cf0
> [    0.005098] x29: ffff800080a43d10 x28: 0000000000000000 x27: 0000000000000000
> [    0.005106] x26: ffff36b13643b128 x25: ffff7cb64e232000 x24: ffff7cb64e232000
> [    0.005112] x23: ffffb9fae8219ec0 x22: 0000000000000001 x21: ffffb9fae8c95398
> [    0.005118] x20: 0000000000000001 x19: ffff36b13644bca0 x18: 0000000000000014
> [    0.005125] x17: 000000008c837bd4 x16: 000000002132b56e x15: 0000000000000000
> [    0.005131] x14: 0000000000000066 x13: 0a6465776f6c6672 x12: 65646e7520746e75
> [    0.005137] x11: 6f6320656c626173 x10: 6964206b726f7720 x9 : ffffb9fae5af64ac
> [    0.005143] x8 : 20656c6261736964 x7 : 0000000000000001 x6 : 0000000000000001
> [    0.005149] x5 : 00000000000bffe8 x4 : 0000000000000000 x3 : 0000000000000000
> [    0.005155] x2 : 0000000000000000 x1 : 0000000000000000 x0 : ffff36a181d52580
> [    0.005161] Call trace:
> [    0.005163]  enable_work+0x104/0x120 (P)
> [    0.005171]  enable_delayed_work+0x18/0x30
> [    0.005178]  vmstat_cpu_online+0xbc/0x150
> [    0.005186]  cpuhp_invoke_callback+0x134/0x6d8
> [    0.005195]  cpuhp_thread_fun+0xb8/0x1a0
> [    0.005203]  smpboot_thread_fn+0x208/0x238
> [    0.005213]  kthread+0xf4/0x110
> [    0.005218]  ret_from_fork+0x10/0x20
> [    0.005226] ---[ end trace 0000000000000000 ]---
> [    0.005595] Detected PIPT I-cache on CPU2
> [    0.005639] GICv3: CPU2: found redistributor 140000 region
> 0:0x0000100100640000
> [    0.005648] GICv3: CPU2: using allocated LPI pending table
> @0x0000080000c40000
> [    0.005691] arch_timer: Enabling local workaround for ARM erratum 1418040
> [    0.005706] CPU2: Booted secondary processor 0x0000140000 [0x413fd0c1]

Ah, that's a known issue in -rc6 and isn't related to the arm64 tree. It
shouldn't prevent the boot though, or is a WARNING enough for the test to fail?

https://lore.kernel.org/lkml/ff6461df-25d1-494f-ad34-763faf249309@lucifer.local/

Thanks,

Will

