Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FC83CAC582
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Sep 2025 17:18:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ydbu7qJHjtRGPqaQwej7timA8uDw/j/0HM+Nv6QFz80=; b=ymROoEhCqzPrX1XBZi1szx3Bs+
	zbgDhxlyCOqCKa1fyj93A/Oo0fRR7CH3tLrdjutws+NY96LsEigrkqrCQduuQVRnYwgkGjlObIV7S
	BIApezcxcB8saFT3un1Vfp9lysJayPKplgrndWhU5iFdWYLIcVyIllX1aHACrki5WrGYvT2C08LJh
	WRj+dGvKb4zTtrDOjRp0jV+6W4fjW9CSGSPmrjBcGP/1sB88aQJOldJTyH0bvPcWV99QBox6Y39qT
	g9voER1R7FP1sslsvAmEXM+AmElBUB6wIf3LQ2XkfGvqcmQEedaon+ekd8k7YPOFeZLeuiX5XOpcv
	tx5M37ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw1yt-00000008sW0-349L;
	Tue, 09 Sep 2025 17:18:11 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvy8q-00000007IW6-3rZM;
	Tue, 09 Sep 2025 13:12:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id AC12260226;
	Tue,  9 Sep 2025 13:12:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B97C5C4CEF4;
	Tue,  9 Sep 2025 13:12:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757423530;
	bh=gKJA5qVK6epw+rflk+7KDWhPkkSQ8HIBUNn4mxtldCw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Gp3d7ddsviq3ErlSBbi033LuArTUBYaS5C0afFD1U0Ug2gkTLVzeFPAq/3+Rfke1I
	 K3jxfcIT0zTgDuNhNuGNhqIororwgN/HQwNLPXP7xVnOPa/PCaQgM6XEJuifEkB3y3
	 g+D63JOCvT0mJKpyaC5h7szDkdty0dTk5IwhJ/+BUy+z6VteCzJb8JVncXCim/mCuE
	 L4gjtRR3QyrbH4D+yDjeKPRreF9PIgBHCiTjRMpkkO4Pd4/frN55hEoktz1JXl17Ue
	 aChOQ6lwu/X7poekW/TNKNK7mijz6JpMnrSRlZj6U3ZRdViK9XmueE7UjbAmnpIL3H
	 3hDg1Zy85VDEA==
Date: Tue, 9 Sep 2025 14:12:03 +0100
From: Will Deacon <will@kernel.org>
To: Benjamin Gaignard <benjamin.gaignard@collabora.com>
Cc: joro@8bytes.org, robin.murphy@arm.com, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, heiko@sntech.de,
	nicolas.dufresne@collabora.com, jgg@ziepe.ca,
	p.zabel@pengutronix.de, mchehab@kernel.org, iommu@lists.linux.dev,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, kernel@collabora.com,
	linux-media@vger.kernel.org
Subject: Re: [PATCH v8 3/7] iommu: Add verisilicon IOMMU driver
Message-ID: <aMAno-DkDJumcAtj@willie-the-truck>
References: <20250827090809.34555-1-benjamin.gaignard@collabora.com>
 <20250827090809.34555-4-benjamin.gaignard@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250827090809.34555-4-benjamin.gaignard@collabora.com>
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

On Wed, Aug 27, 2025 at 11:07:59AM +0200, Benjamin Gaignard wrote:
> The Verisilicon IOMMU hardware block can be found in combination
> with Verisilicon hardware video codecs (encoders or decoders) on
> different SoCs.
> Enable it will allow us to use non contiguous memory allocators
> for Verisilicon video codecs.
> 
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
> ---
> changes in version 8:
> - Add API to restore VSI iommu context from decoder driver
> - Fix reported checkpatch issues: add comment in pinlock_t declaration
>   and remove blank line.
> 
>  drivers/iommu/Kconfig     |  11 +
>  drivers/iommu/Makefile    |   1 +
>  drivers/iommu/vsi-iommu.c | 810 ++++++++++++++++++++++++++++++++++++++
>  include/linux/vsi-iommu.h |  21 +
>  4 files changed, 843 insertions(+)
>  create mode 100644 drivers/iommu/vsi-iommu.c
>  create mode 100644 include/linux/vsi-iommu.h

I still object to the duplication with the rockchip driver:

https://lore.kernel.org/all/aH5yR9CkYSJ4PaZV@willie-the-truck/

at least drop me from cc if you're going to ignore my comments, please.

Will

