Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C9C2C44501
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jul 2026 09:17:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=I84JgCkBPA2ap7sLC4w/LE5hx1QYu9euEbpPHYVjIFA=; b=FQtyXzDt+44uLH1Fr/mrq4Dbdu
	pHf3YVHSoVwnX0JWUV+UmmzHbI+nGRVmq/18fAUP0Bw/hoO3Mx1lOSH651ktollCunnR885+s62TM
	vubmmPLnMwD7Rx4mvaA1afVKszVLsr314/W9N6DM08EIaLbbGCv4Olj9Ov749oZZ5kA2WxjLe1P8R
	SeVSt5RhDV0x5HmxVUFPlmvUo4Ki3qKV0xUAlatmOutqrbQWJ33RbIcWOFVZ3tIlxTIr5Rs4CpQ5s
	GRx+Y2Wkyh48bAzgxlNHK8+VJt1E9Tdf8tgL2cFfxuNvkRG2SLt9nUETWgy6ckmEn+iFufgmObQB4
	cd8iV3HQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjCmn-00000008hZG-3aTB;
	Mon, 13 Jul 2026 09:17:13 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjCml-00000008hYb-2F2S;
	Mon, 13 Jul 2026 09:17:11 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id DFA0460018;
	Mon, 13 Jul 2026 09:17:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97E6D1F00A3F;
	Mon, 13 Jul 2026 09:17:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783934230;
	bh=I84JgCkBPA2ap7sLC4w/LE5hx1QYu9euEbpPHYVjIFA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=jN+v1q30ltie7Wh6ptwJ1B7gxkVDfklLV4GLf1m7y8XNe03qlMPpOi7HjRuyphRqC
	 Sm29JMxfyDm2Z/jYb02RGUrDwJuNALD3J014XdzYLpdr8kXqZn6cEQ2AN++SRFcaMA
	 s6Ajg0zoNftkg0Lr5HBJM1FFCwRn5hgqny3KnQh+cXOH5gcFakS+CDHp3oGI8/5mBF
	 hwLCl8BS2UX3UiKpkXfzJvTEoAKnXpQZtuth8jM8B5Fq5jcrph+4WdVcn08QbgCP0r
	 AwzW3W15DNICL/xRvy6hHYCfqnTrIE4WQ25y1521tMdyQC/GDxg/u9KlBTKfpLyfZf
	 E10XbyNOO7w4A==
Date: Mon, 13 Jul 2026 11:17:06 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Daniel Drake <dan@reactivated.net>
Cc: "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>, 
	Robin Murphy <robin.murphy@arm.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, iommu@lists.linux.dev, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, nick.hollinghurst@raspberrypi.com, 
	Jason Gunthorpe <jgg@ziepe.ca>
Subject: Re: [PATCH 6/6] arm64: dts: broadcom: bcm2712: Add GPU IOMMU and
 IOMMU cache nodes
Message-ID: <20260713-important-prawn-of-health-9d032a@quoll>
References: <20260712-bcm2712-iommu-submit-v1-0-80e10cdde2ea@reactivated.net>
 <20260712-bcm2712-iommu-submit-v1-6-80e10cdde2ea@reactivated.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260712-bcm2712-iommu-submit-v1-6-80e10cdde2ea@reactivated.net>
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

On Sun, Jul 12, 2026 at 10:18:56PM +0100, Daniel Drake wrote:
> Define the IOMMU and IOMMUC nodes for the Broadcom BCM2712 SoC found in
> the Raspberry Pi 5. Enable use of the IOMMU for the graphics/display
> block.
> 
> Signed-off-by: Daniel Drake <dan@reactivated.net>
> ---
>  arch/arm64/boot/dts/broadcom/bcm2712.dtsi | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
> 

Does not like built with W=1.

Best regards,
Krzysztof


