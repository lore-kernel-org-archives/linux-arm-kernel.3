Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93EDECD4F25
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 May 2026 14:22:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mt9FeFSXuY+5ZNksdcVOSgLU6/oDihFQ8sIYU5CyybQ=; b=B1Nx0cTUGgEbgCWbUZrwDztphJ
	kuweqWRQ+iLG21pR1HqMbaYK0WzMkf31kp0dn4eFBFV2/7XVhGaeE/q5UmTykbtJFh1ACKz0J2sr1
	HB4Tr29TpRgMKHIDO4W/UOfpkwDa3/5KChpekMW8uYmZKj7dBZ7XHaytwtEMXXxrgEtqAs5DtBL1w
	nm1OaLtd8Ug9Nu2KlStGWdEEzMtqWwqv3O7hJ2wK+yUlHW9KFnrDaunx6hPb2jZy+KC+QXmhVI4Vs
	Vipnsh2ZKeCs++Ez+dJCG6EuZWhRXQFXOloCwHnorxWolXfa+CFvQjcKjBI3ysmyn5TBGC8z2dXH9
	eBOm7Jxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNWx3-00000005hVe-2B8S;
	Thu, 14 May 2026 14:22:13 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNWx1-00000005hV7-24GT
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 May 2026 14:22:13 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B5E541596;
	Thu, 14 May 2026 07:22:04 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E5C2F3F7B4;
	Thu, 14 May 2026 07:22:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1778768530; bh=jn0zV61/doOPQNK4OQIglceav/z+X7+0bmexe6PpHME=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=l+2R1CoUx58cpy4/3QYINPN6/LC9yL+32Zxj1VL4lz2WFweVo0ndf5/20AmjCWw6k
	 TNq1D46yx7i6KtZsZu97GRt3OaCqhnupEQCg4q4KOBWYJkkBofmk5wumMe9WyV00YG
	 4zkiYyhwRuSMZHNvHrzHd1SyEZR1jMUlgAUE2pQ8=
Date: Thu, 14 May 2026 15:22:04 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: James Morse <james.morse@arm.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	zengheng4@huawei.com, wangkefeng.wang@huawei.com,
	xry111@xry111.site, yang@os.amperecomputing.com,
	reinette.chatre@intel.com, will@kernel.org, thuth@redhat.com,
	ben.horgan@arm.com, mrigendra.chaubey@gmail.com,
	fenghuay@nvidia.com, ahmed.genidi@arm.com
Subject: Re: [PATCH v3 3/4] arm64: cpufeature: Add support for the MPAM v0.1
 architecture version
Message-ID: <agXajDtWt9RmgOXT@arm.com>
References: <20260508162341.3762549-1-james.morse@arm.com>
 <20260508162341.3762549-4-james.morse@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260508162341.3762549-4-james.morse@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260514_072211_651563_3B192F75 
X-CRM114-Status: GOOD (  14.63  )
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

On Fri, May 08, 2026 at 05:23:40PM +0100, James Morse wrote:
> From: Zeng Heng <zengheng4@huawei.com>
> 
> According to the MPAM spec [1], the supported architecture versions are
> v1.0, v1.1 and v0.1. MPAM versions v0.1 and v1.1 are functionally
> identical, but v0.1 additionally supports the FORCE_NS feature.
> 
> ID_AA64PR | ID_AA64PR | MPAM Extension | Notes
> F0_EL1.   | F1_EL1.   | Architecture   |
> MPAM      | MPAM_frac | version        |
> ---------------------------------------------------------------------------
> 0b0000    | 0b0001    | v0.1           | MPAM v0.1 is implemented.
>           |           |                | MPAM v0.1 is the same as MPAM v1.1
>           |           |                | with FORCE_NS which is
>           |           |                | incompatible with MPAM v1.0.
> ---------------------------------------------------------------------------
> 0b0001    | 0b0000    | v1.0           | MPAM v1.0 is implemented.
> ---------------------------------------------------------------------------
> 0b0001    | 0b0001    | v1.1           | MPAM v1.1 is implemented.
>           |           |                | MPAM v1.1 includes all features of
>           |           |                | MPAM v1.0.
>           |           |                | It must not include FORCE_NS.
> 
> FORCE_NS is a feature that operates in EL3 mode. Consequently, the current
> Linux MPAM driver is also compatible with MPAM v0.1. To support v0.1, the
> existing driver which only checks ID_AA64PFR0_EL1.MPAM for the major
> version needs to examine ID_AA64PFR1_EL1.MPAM_frac for the minor version
> as well.
> 
> [1] https://developer.arm.com/documentation/ddi0598/db/?lang=en
> 
> Signed-off-by: Zeng Heng <zengheng4@huawei.com>
> Reviewed-by: James Morse <james.morse@arm.com>
> Signed-off-by: James Morse <james.morse@arm.com>

Not sure how this will go in for 7.2, so:

Acked-by: Catalin Marinas <catalin.marinas@arm.com>

