Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59E50D1D483
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Jan 2026 19:22:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dx+UGcerhelmz5eKf/UPFxZV03ERHxJjYWSe2Da3wlw=; b=hKrk50hieFov36MSHV7hlITRzv
	5ZHP6j4h/DpkdTsuwrGxeYk+5K8j8UzzkdZXQ51YtnBfUd+5feNPTOHN8ijHbd3H4Bz3ySn1B9I8P
	1WlncaryaXB9/JqWnS4gSIhoS0HmX2TN6Xf71doCJhxORVMGZhQrCN89EVHG636Qdb6QVhQqd/l2t
	7VgJ/4d6cJBaw/WeSMmkj3ikPkol1bN57grMFNvOHHIMgc5t+kmaxaQGvdaAdhYH0VJ+Wo6Ungbp1
	tNwDwG14LSFD3ztOrF86ox/V0xrDuOpHWMFVryhqIuiNch5SoHkSpik9Y3bpu4H9/L02oWbdP8K8q
	NWeofGVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdvaQ-00000000kZB-05YH;
	Thu, 08 Jan 2026 19:22:22 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdvaN-00000000kXs-3T9l
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 Jan 2026 19:22:21 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EAA0F497;
	Thu,  8 Jan 2026 11:22:09 -0800 (PST)
Received: from arm.com (arrakis.cambridge.arm.com [10.1.197.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 592353F6A8;
	Thu,  8 Jan 2026 11:22:06 -0800 (PST)
Date: Thu, 8 Jan 2026 19:22:01 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: Ben Horgan <ben.horgan@arm.com>
Cc: amitsinght@marvell.com, baisheng.gao@unisoc.com,
	baolin.wang@linux.alibaba.com, carl@os.amperecomputing.com,
	dave.martin@arm.com, david@kernel.org, dfustini@baylibre.com,
	fenghuay@nvidia.com, gshan@redhat.com, james.morse@arm.com,
	jonathan.cameron@huawei.com, kobak@nvidia.com, lcherian@marvell.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	peternewman@google.com, punit.agrawal@oss.qualcomm.com,
	quic_jiles@quicinc.com, reinette.chatre@intel.com,
	rohit.mathew@arm.com, scott@os.amperecomputing.com,
	sdonthineni@nvidia.com, tan.shaopeng@fujitsu.com,
	xhao@linux.alibaba.com, will@kernel.org, corbet@lwn.net,
	maz@kernel.org, oupton@kernel.org, joey.gouly@arm.com,
	suzuki.poulose@arm.com, kvmarm@lists.linux.dev
Subject: Re: (subset) [PATCH v2 00/45] arm_mpam: Add KVM/arm64 and resctrl
 glue code
Message-ID: <176790010619.2057507.2252517783260979848.b4-ty@arm.com>
References: <20251219181147.3404071-1-ben.horgan@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251219181147.3404071-1-ben.horgan@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260108_112219_909003_39CDFE70 
X-CRM114-Status: GOOD (  10.30  )
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

On Fri, 19 Dec 2025 18:11:02 +0000, Ben Horgan wrote:
> As James is otherwise engaged this version of the MPAM missing pieces comes
> from me. I hope this does justice to all his hardwork. The changes that
> I've brought to this version are the handling of systems with SME, some rework
> of the KVM parts, a few small bug fixes and some tidying.
> 
> This may be the first time you are seeing this series as James spared some
> of you as the rfc was posted during merge window.
> 
> [...]

Applied to arm64 (for-next/fixes), thanks!

[01/45] arm_mpam: Stop using uninitialized variables in __ris_msmon_read()
        https://git.kernel.org/arm64/c/c2803bd580db

-- 
Catalin

