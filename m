Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C03F4C282DE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Mar 2025 08:28:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Hz3VRjd6xtEj1MI5LpZhQNCI1bHlcl7oEVEC1XUFvW4=; b=FY5m3ulSoMIwoR1b/qDwLAyO/n
	AVBZEtsE+xYZWh6OaiaNIe3eJ4ysuznkv9A6yAiCPmaesiYZ0xB36Mf6pF2nuiytIGWi26oWwF35H
	6H8DKAeymSTXZUHLI9j8XDWlwn+gwcwA9oeWh5qzRMF4JBSjqTYe5dDpwB8J6N4AM0cLnG+Y+O4Bj
	KGrwHE8bQ3Owqv/OlDA1MpZMFwFQCKfSSX/7eEjF3uFOE90hQqBpjCEPKUqBYWQoNVeK5hesAyA1M
	r/RxPN8p4pDrKNRcg5+8GNVz1xxOh9Qc/cGWXUZB7+bVbXKe1Ltn7vC2tsTxczszzCeTlHRbOeb3P
	IclbTJmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trYUv-00000001ufN-1MPg;
	Mon, 10 Mar 2025 08:28:29 +0000
Received: from mail.8bytes.org ([2a01:238:42d9:3f00:e505:6202:4f0c:f051])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trYTE-00000001u3a-1in8
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Mar 2025 08:26:46 +0000
Received: from 8bytes.org (p4ffe03ae.dip0.t-ipconnect.de [79.254.3.174])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id 687D345229;
	Mon, 10 Mar 2025 09:26:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
	s=default; t=1741595200;
	bh=bE01/5HtYQ+8KrJnIhvUfa6n4CzDCTpfid7pjy+W+BE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FFkQWUmFfWfepYBo/07hceo5T4Pq9/ordsitcigm4MztDsEYQsIjKQeLEN/kN6GD+
	 klLprkMo4MTJ6Rn/zYTAuwVcyCixdbgFJRGVmUZHMZJ2FqJBrlxX4mFTZU/noyeNfS
	 8WBajjZcCha47RqIm+8uhGfSS4wb2qa/GMfkRlXflKToMST+qRcGdhjq0fPWe+JCUH
	 J9xCgJsVJiPD4kDY/Oq/pcxUX5szf3hm87LEAeOMYCQ2D3auNpxXCqR3S2kyffSlRE
	 qyve6Nb9bJkAqjggMNJIrNN8793QFgh1Fn7zfMla3gD3dnFnw5RIRGDdl/jk//Oh37
	 GoDhO8nrCGS0A==
Date: Mon, 10 Mar 2025 09:26:39 +0100
From: Joerg Roedel <joro@8bytes.org>
To: Robin Murphy <robin.murphy@arm.com>
Cc: will@kernel.org, iommu@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, yong.wu@mediatek.com,
	thierry.reding@gmail.com, vdumpa@nvidia.com
Subject: Re: [PATCH] iommu: Unexport iommu_fwspec_free()
Message-ID: <Z86iP6_qe5HwndM7@8bytes.org>
References: <36e245489361de2d13db22a510fa5c79e7126278.1740667667.git.robin.murphy@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <36e245489361de2d13db22a510fa5c79e7126278.1740667667.git.robin.murphy@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250310_012645_241885_1E50F882 
X-CRM114-Status: GOOD (  16.38  )
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

On Thu, Feb 27, 2025 at 02:47:47PM +0000, Robin Murphy wrote:
> The drivers doing their own fwspec parsing have no need to call
> iommu_fwspec_free() since fwspecs were moved into dev_iommu, as
> returning an error from .probe_device will tear down the whole lot
> anyway. Move it into the private interface now that it only serves
> for of_iommu to clean up in an error case.
> 
> I have no idea what mtk_v1 was doing in effectively guaranteeing
> a NULL fwspec would be dereferenced if no "iommus" DT property was
> found, so add a check for that to at least make the code look sane.
> 
> Signed-off-by: Robin Murphy <robin.murphy@arm.com>
> ---
>  drivers/iommu/arm/arm-smmu/arm-smmu.c |  1 -
>  drivers/iommu/iommu-priv.h            |  2 ++
>  drivers/iommu/iommu.c                 |  1 -
>  drivers/iommu/mtk_iommu_v1.c          | 14 ++++----------
>  drivers/iommu/tegra-smmu.c            |  1 -
>  include/linux/iommu.h                 |  5 -----
>  6 files changed, 6 insertions(+), 18 deletions(-)

Applied, thanks.

