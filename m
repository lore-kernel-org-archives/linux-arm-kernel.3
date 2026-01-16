Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8571C982CD
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Jan 2026 15:47:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aofA80EUJUMH/ahTDTbXSee2olDYRrgyugK70ng8Qd0=; b=sQrLfa+YSObK0tO5+ZcLIMcKMe
	yGzs6y/SVrXnlLf3Kj2mRxrH3CP8e0qnLWA/8cz3SwiZyvo5SOQsKYFw9LLeXXWLqBzKClN333hNU
	OFAX65pLAEzprMeM6hwVcmGNHRkwqUOUbZjyJSkZkqWT6AZgM7opbNF8+wnC4gAhEI7QSWljVAZcR
	NnSrjNgY3ZndFLcN9lb91pf0LBEwp8dnCbvz8wVEzJDoA0JPLzDvkHIy3Nk4iRnRVkNrIsQKfRikr
	nlcbt3tUMMelLmyefncWMoUVgtT44rjyPn0PVzOKWSCRm3R2tzsjPr2Jq2DztbivHn8k0wiCC2VjD
	rU+g6DbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgm2t-0000000EOOR-3HwD;
	Fri, 16 Jan 2026 15:47:31 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgm2r-0000000EOO2-0PZ4
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Jan 2026 15:47:30 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 308061515;
	Fri, 16 Jan 2026 07:47:16 -0800 (PST)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4A48A3F59E;
	Fri, 16 Jan 2026 07:47:18 -0800 (PST)
Date: Fri, 16 Jan 2026 15:47:15 +0000
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
Subject: Re: (subset) [PATCH v3 00/47] arm_mpam: Add KVM/arm64 and resctrl
 glue code
Message-ID: <176857842299.2010442.11311136147408507199.b4-ty@arm.com>
References: <20260112165914.4086692-1-ben.horgan@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260112165914.4086692-1-ben.horgan@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260116_074729_180545_EA63AD6D 
X-CRM114-Status: UNSURE (   9.87  )
X-CRM114-Notice: Please train this message.
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

On Mon, 12 Jan 2026 16:58:27 +0000, Ben Horgan wrote:
> This new version of the mpam missing pieces has no major rework from the
> previous version. It's mainly small corrections and code tidying based on
> review and things I spotted along the way. To be able to merge this we need
> review from more people and people to start testing on their platforms and
> giving some Tested-by tags.
> 
> Change list in patches.
> 
> [...]

Applied to arm64 (for-next/fixes), thanks!

[01/47] arm_mpam: Remove duplicate linux/srcu.h header
        https://git.kernel.org/arm64/c/b5a69c486921
[02/47] arm_mpam: Use non-atomic bitops when modifying feature bitmap
        https://git.kernel.org/arm64/c/b9f5c38e4af1

-- 
Catalin

