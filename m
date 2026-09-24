Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C284C98317
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Sep 2026 11:18:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yHPqNG4NRn26PyaHCNCam2O10MXS3Lwf0C6oo6ygoq4=; b=VCXAr5yqeubxu5Ozwn3I4+vllY
	hFgp73vpLF7fPzqB8eZMVQk+T0ohcii8FnUPI9usSjq8BmnH5Yfis2A47BLPSe5lRUyrdv8X4FTe3
	oZKkPx/0+w8qtNbyiskMT+LfDL90esqR1FwxWh+JVkcLYeapjYcnIpZaYDc+xnnvLVdppBtHD41qh
	aSaeaxjebbnwdqhnQBTe5KzcDksv4JF5CyRnjHj0UE4pedOup7iSchvswg4zDV1/uyaWwrR7DuIdo
	PNbSLGqlyJdiZoNj7UE1kYY0seQEXHurD9H+epTkt7+TXS4k10cavpOzHnbafGW3+C7xpSs6U248v
	OQe5b8tA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9hTE-0000000Aq8U-1sj4;
	Thu, 24 Sep 2026 11:18:32 +0000
Received: from mail.8bytes.org ([85.214.250.239])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9hTA-0000000Aq78-0tJW
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Sep 2026 11:18:29 +0000
Received: from 8bytes.org (p200300f6af404a00e4ccc4fdbbd66590.dip0.t-ipconnect.de [IPv6:2003:f6:af40:4a00:e4cc:c4fd:bbd6:6590])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id B33E11C7465;
	Thu, 24 Sep 2026 13:18:25 +0200 (CEST)
Date: Thu, 24 Sep 2026 13:18:24 +0200
From: "Joerg Roedel (AMD)" <joro@8bytes.org>
To: markuss.broks@gmail.com
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, 
	Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Peter Griffin <peter.griffin@linaro.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/4] IOMMU driver improvements for modern Exynos SysMMUs
Message-ID: <arUG8gG8Fx3es8Hj@8bytes.org>
References: <20260820-exynos-iommu-fixes-v1-0-6bbcd673bb15@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260820-exynos-iommu-fixes-v1-0-6bbcd673bb15@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260924_041828_402844_38CB5E4E 
X-CRM114-Status: UNSURE (   7.05  )
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

On Thu, Aug 20, 2026 at 10:12:04PM +0300, Markuss Broks via B4 Relay wrote:
> Markuss Broks (4):
>       iommu/exynos: detect SysMMUs without BLOCK mode
>       iommu/exynos: fix the enable sequence for no-block SysMMUs
>       iommu/exynos: fix TLB invalidation for no-block SysMMUs
>       iommu/exynos: decode the v7 fault transaction info

Applied, thanks.

