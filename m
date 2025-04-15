Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE961C369AB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Apr 2025 16:31:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WBifGwplIibBzKzi0odZOOCXZXemNk43fJJCTstApN4=; b=wg/3Ja1aBLBh2C5JC8XNa1rjbk
	jG4fVrN3Mp1lUwkw873u1SAyij9bRYCsfJkWbVXL0/6ekDxxlnlunlLnko+OV+MYKq3fWBFdALmUh
	Ql8Dl3KuRFPTCsUmEw97UneykkGRfEqeCIfj4KhUo3EFXnWq/oOtJz3/QMXG+ZMbJvb4j6Cqfzdog
	iE8Ve2T6J7fm8PwD3mP0o2XQip3u2BcQOppWi5G5q7HYAyoo6hkVqxXu5ZZYtEq1/davIXl55+Oz5
	Ix9jxvHQ2wQpymMIN3CZK+sFdtb3vvLNsQEWlgY79apyRixXoItAsPnFCq4fchuZgHQ8XxQ1Rkgho
	zvFNKdqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4jC1-00000006QGy-3fF2;
	Tue, 15 Apr 2025 16:31:25 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4icr-00000006KRv-1J3W
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Apr 2025 15:55:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id E4C5FA4A474;
	Tue, 15 Apr 2025 15:49:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 297E6C4CEEB;
	Tue, 15 Apr 2025 15:55:00 +0000 (UTC)
Date: Tue, 15 Apr 2025 16:54:58 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Marc Zyngier <maz@kernel.org>
Subject: Re: [BUG][PATCH v8 4/6] arm64: Make _midr_in_range_list() an
 exported function
Message-ID: <Z_6BUgekb7YXOExu@arm.com>
References: <20250221140229.12588-1-shameerali.kolothum.thodi@huawei.com>
 <20250221140229.12588-5-shameerali.kolothum.thodi@huawei.com>
 <3d97e45a-23cf-419b-9b6f-140b4d88de7b@arm.com>
 <865xj5la2q.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <865xj5la2q.wl-maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250415_085505_413501_A04FA308 
X-CRM114-Status: GOOD (  25.14  )
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
Cc: mark.rutland@arm.com, jiangkunkun@huawei.com, eric.auger@redhat.com, cohuck@redhat.com, linuxarm@huawei.com, oliver.upton@linux.dev, yuzenghui@huawei.com, wangzhou1@hisilicon.com, Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>, jonathan.cameron@huawei.com, kvmarm@lists.linux.dev, sebott@redhat.com, will@kernel.org, linux-arm-kernel@lists.infradead.org, anthony.jebson@huawei.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Tue, Apr 15, 2025 at 04:26:53PM +0100, Marc Zyngier wrote:
> On Tue, 15 Apr 2025 11:57:50 +0100,
> Ada Couprie Diaz <ada.coupriediaz@arm.com> wrote:
> > I discovered that this patch breaks boot for some CPUs when building
> > the default defconfig plus KASAN. This is still the case in v6.15-rc1
> > and rc2.
> > 
> > This patch marks `is_midr_in_range_list` as position independent but
> > it isn't, breaking early boot when instrumented with KASAN and
> > `CONFIG_RANDOMIZE_BASE` enabled.
> > 
> > The breaking usage seems to be in `kaslr_requires_kpti()` called in
> > `early_map_kernel()`.
> > My testing on an AMD Seattle board does crash, but newer machines
> > implementing E0PD do not crash as they do not need to check MIDRs in
> > `kaslr_requires_kpti()`.
> > `is_mdr_in_range_list` did work in PI code previously because it was
> > `inline`, which this patch changes.
> 
> OK, this is much more of a pain than I thought.
> 
> I tried bringing the various helpers into the PI section, but it ended
> up being extremely ugly.
> 
> More importantly, this is something that is pretty much at odds with
> the whole idea of the MIDR override -- it happens way earlier than we
> can populate the table.
> 
> The thing is, the only reason we need to do this is that we need to
> support the Cavium SEFAC (Sorry Excuse For A Computer) that cannot run
> with KPTI.
> 
> I can restore harmony with the following hack. But maybe we should
> just prune TX from the kernel and be done with this contraption.

That works for me. Well, we can still keep it around but panic on boot
if kpti is enabled on this platform. Just don't bother checking it via
early_map_kernel() from the PI code.

-- 
Catalin

