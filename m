Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EB65D778B0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Jan 2026 19:26:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Oa7iGNimmxf4NkLdFCeEfPikE1lPlYJxPyIsdcse1T4=; b=Y3uNT+VkS5KpCKMlNH7BI5yvbr
	tXrnTZ1JvPCbJ0jvXVe4UqErJqsfBv6blcs0PgEkydd77nUPhVHBSpu6ZY7dkqS3x4eLK4cjEFco8
	jwqOmGT98WhsERnEZdmMnlA5Jez0RgZ8l4BdXowSXpFG46sS2D1rExcyMcfjY2FBVMrQug0jBCQHL
	Aen+0H19ilAAvHMZVh8ac+VPyHzW0i0ejoYfb1+tAuKpIuU8CD7qLHNnP/vv0+u2pzFoRy6cdDyvG
	p6XQynWb7gbxMCV70I5GvfyklYwx7S23guhEIbV3VCQ9B3phD/srFsZedwQ2qHUeDdDJLDNVvI3ja
	3k7zeGag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjMnG-00000009QCt-3yHB;
	Fri, 23 Jan 2026 19:26:06 +0000
Received: from out-172.mta0.migadu.com ([2001:41d0:1004:224b::ac])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjMnD-00000009Q0i-0X4t
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 Jan 2026 19:26:05 +0000
Date: Fri, 23 Jan 2026 13:23:41 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1769196227;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Oa7iGNimmxf4NkLdFCeEfPikE1lPlYJxPyIsdcse1T4=;
	b=D/Odg4pPv448bA8y0YfiFsAHYHxAnTqkRNcAYUpsZzhVdTENW4aD4cedde5+qiGI2BWtMx
	sVIGf+jvSVk79VF9eRThVaBq42D8VC6aqWsqecC7MZup6EwV6wuMfy+XkZhLWyjb+gyQPi
	G50wkMTcVVzzxqeryfqEZP8yYpFQN18=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Andrew Jones <andrew.jones@linux.dev>
To: Joey Gouly <joey.gouly@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, alexandru.elisei@arm.com, 
	eric.auger@redhat.com, maz@kernel.org, kvmarm@lists.linux.dev, 
	Oliver Upton <oliver.upton@linux.dev>
Subject: Re: [kvm-unit-tests PATCH v6 00/14] arm64: EL2 support
Message-ID: <ixq5fcyiey4prwl5luzlemznvjd6hk2pqj73rmlinnl233gfdy@b6mns7sf3dv5>
References: <20260123165053.2250754-1-joey.gouly@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260123165053.2250754-1-joey.gouly@arm.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260123_112603_368771_40E7D213 
X-CRM114-Status: GOOD (  15.77  )
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

On Fri, Jan 23, 2026 at 04:50:39PM +0000, Joey Gouly wrote:
> Hi all,
> 
> This series is for adding support to running the kvm-unit-tests at EL2.
> 
> Changes since v5[1]:
> 	- make debug bp/wp skip on EL2
> 	- fix microbench test
> 	- add to CI
> 	- applied the fixup's Drew talked about in v5
> 
> About this failure in micro-bench:
> 
> 	- micro-bench hits the assert in gicv3_lpi_alloc_tables()
> 		lib/arm/gic-v3.c:183: assert failed: gicv3_data.redist_base[cpu]: Redistributor for cpu0 not initialized. Did cpu0 enable the GIC?	
> 
> in micro-bench.c lpi_prep() looks like this:
> 
> 	static bool lpi_prep(void)
> 	{
> 	        struct its_collection *col1;
> 	        struct its_device *dev2;
> 	        if (!gicv3_its_base())
> 	                return false;
> 
> QEMU by default runs with gic-v2, so gicv3_its_base() should have returned
> false and the lpi tests skipped. However because of the overflow mentioned in
> the first commit (new to v6), the its_data.base was being overwritten to a
> non-zero value.  This meant the test tried to do gic-v3 things on a gic-v2.

Nice work on the micro-bench/gic issue. Unfortunately the timer test still
times out, and that breaks the new CI since that test is listed.

# No EL2

$ ./run_tests.sh -g timer
PASS timer (18 tests)

# EL2

$ EL2=y ./run_tests.sh -g timer
FAIL timer (timeout; duration=10s)

$ TIMEOUT=90s EL2=y ./run_tests.sh -g timer
FAIL timer (timeout; duration=90s)

$ cat logs/timer.log
timeout -k 1s --foreground 90s /usr/bin/qemu-system-aarch64 -nodefaults -machine virt,virtualization=on -accel tcg -cpu max -device virtio-serial-device -device virtconsole,chardev=ctd -chardev testdev,id=ctd -device pci-testdev -display none -serial stdio -kernel arm/timer.flat -smp 1 # -initrd /tmp/tmp.N15fhaPbhB
CNTFRQ_EL0   : 0x0000000003b9aca0
CNTPCT_EL0   : 0x00000000001d3a1f
CNTP_CTL_EL0 : 0x0000000000000000
CNTP_CVAL_EL0: 0x0000000000000000
CNTVCT_EL0   : 0x00000000001d5884
CNTV_CTL_EL0 : 0x0000000000000000
CNTV_CVAL_EL0: 0x0000000000000000
INFO: vtimer-busy-loop: After timer: 0x000000000027ae86
INFO: vtimer-busy-loop: Expected   : 0x000000000027415b
INFO: vtimer-busy-loop: Difference : 450 us
PASS: vtimer-busy-loop: latency within 10 ms
FAIL: vtimer-busy-loop: interrupt received
PASS: vtimer-busy-loop: not pending before
FAIL: vtimer-busy-loop: interrupt signal pending
PASS: vtimer-busy-loop: no interrupt when timer is disabled
PASS: vtimer-busy-loop: interrupt signal no longer pending
PASS: vtimer-busy-loop: interrupt signal not pending
INFO: vtimer-busy-loop: waiting for interrupt...
qemu-system-aarch64: terminating on signal 15 from pid 112137 (timeout)


Thanks,
drew

