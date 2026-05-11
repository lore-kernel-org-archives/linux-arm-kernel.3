Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F281FCD37AC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 May 2026 08:02:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ODNKmgtFDXJfn1eHzypx7G1poPtmkR0de0oN7e1HZJQ=; b=wBecIKrAaa7TZLE6L+2pcnv3+o
	lQE4KPdi4LXXj9nwP3kZ5PsUcq6ptL6YuXOAhP3rRcU9yqRoeaopOfQs836/NXU+kqZemLKa+4bLj
	A5ck9ZP6fjsomZwtHNzuXMBzFHAgl2+Z7FgKt0iLcbLBwYsBGpa8l/jfTZAPtnb0U7jdVOROG2uTT
	QDIAmGSZSRqzYMXNQjz8nAvkK3Sc+BFkj/pNvLYokLK+u0DbKSnHbLOuAduIm223qpzOiqHFg7HLC
	gEp5eSaHaFTQ0dE4sbGNB5evKKAJrHbRP/tFpubGPKC1RkZkFuUwy47tWL09XLPgx3eCpGXEVkAw3
	o6xwJICg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMLaY-0000000CghH-10JA;
	Mon, 11 May 2026 08:02:06 +0000
Received: from mail.8bytes.org ([2a01:238:42d9:3f00:e505:6202:4f0c:f051])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMLaV-0000000CggC-01EN;
	Mon, 11 May 2026 08:02:04 +0000
Received: from 8bytes.org (p200300f6af1d9600f5faa5cebd6c042e.dip0.t-ipconnect.de [IPv6:2003:f6:af1d:9600:f5fa:a5ce:bd6c:42e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id 723AC1C41F2;
	Mon, 11 May 2026 10:02:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
	s=default; t=1778486521;
	bh=C4+jOE7NnKqR3CmE/a0VMxJT4JgooAYRBeQzipN8SAk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lHkPDpLOV9pYetKrrbAwRHCkzRl6i8mpLC6SS8PPg0h7g0QdV1s/ZQie2S+0lr1yz
	 Cc4DXNqfNTWcrDPeR0uwQHZIoJ9wLPiLX5knWOOdAbrUSWERFQW/VtVdFU4Wg+WKUG
	 sCwYDeh3if9B28GGoTCzG8QFUL8bThS1lWi7WviANes8QwJjxBgoQCRPKh2Z3HInWS
	 f6B6aX1MnPCniGWkMaPdJR7bMpj7OeECgY4gVTA2O0toQlILbjpE+Qe8pYkjFyo00V
	 vU1r3i6U3U+aFFjIOsIlCgKFL8a75vbjbD8eC5+3NLvH5B/WwlwI4m7T3fIeDg/pR9
	 EgAPWkXCqYuCA==
Date: Mon, 11 May 2026 10:01:59 +0200
From: =?utf-8?B?SsO2cmcgUsO2ZGVs?= <joro@8bytes.org>
To: Benjamin Gaignard <benjamin.gaignard@collabora.com>
Cc: will@kernel.org, robin.murphy@arm.com, krzk+dt@kernel.org, 
	conor+dt@kernel.org, heiko@sntech.de, iommu@lists.linux.dev, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, kernel@collabora.com
Subject: Re: [PATCH v14 0/5] Add support for Verisilicon IOMMU used by media
 codec blocks
Message-ID: <33nsz23rcstwznq6dnsuibndbwtoc767evshltj35kgysdg63r@fxhwobu53cww>
References: <20260415072349.44237-1-benjamin.gaignard@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260415072349.44237-1-benjamin.gaignard@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260511_010203_286424_0AC47512 
X-CRM114-Status: GOOD (  10.17  )
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

On Wed, Apr 15, 2026 at 09:23:36AM +0200, Benjamin Gaignard wrote:
> Benjamin Gaignard (5):
>   dt-bindings: vendor-prefixes: Add Verisilicon
>   dt-bindings: iommu: verisilicon: Add binding for VSI IOMMU
>   iommu: Add verisilicon IOMMU driver
>   arm64: dts: rockchip: Add verisilicon IOMMU node on RK3588
>   arm64: defconfig: enable Verisilicon IOMMU for Rockchip RK3588
> 
>  .../bindings/iommu/verisilicon,iommu.yaml     |  71 ++
>  .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
>  MAINTAINERS                                   |   8 +
>  arch/arm64/boot/dts/rockchip/rk3588-base.dtsi |  11 +
>  arch/arm64/configs/defconfig                  |   1 +
>  drivers/iommu/Kconfig                         |  11 +
>  drivers/iommu/Makefile                        |   1 +
>  drivers/iommu/vsi-iommu.c                     | 796 ++++++++++++++++++
>  8 files changed, 901 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/iommu/verisilicon,iommu.yaml
>  create mode 100644 drivers/iommu/vsi-iommu.c

Applied to the new verisilicon branch.

