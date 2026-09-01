Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29A7EC61DD6
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Sep 2026 08:44:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nWVnKg9MLKgmRi+FrsceWTa+c5GkaZWyU4XQHMrCz/E=; b=ikjRADwH2LqvtnN0zlYA0Ku/cd
	ABGvPl8OHJ/O6TsXe3lMf8U81fFSWlOiQ+Q/IcK2iSakIyv3DjWSB1ypnWSsUPH3fI0LUdLUZLAU2
	qBGvueYdkWtUm3KCYDyt7BrPABUzYY4WrGtjEJMsiMO2O9rabJnr98Nu2gJlIV8X6C+ZWh6NU3nbe
	zxZW8/MD6zlaEF4AY8UI6Z2y0ZxLtCK/YROlH/A9LwPVJAQljSlF0yDy8cCWvVcUJ0CORLQtzWe0+
	8janT2aCIh34BXKgs59pVsaD9Sqd7QCD9nfYOyTH6qWP6tirj1821g679KB26wyhKSITtZ1n03lhu
	+zGm0Sqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1K6a-0000000BK68-2BnY;
	Tue, 01 Sep 2026 08:44:32 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1K6Y-0000000BK5O-3XTQ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Sep 2026 08:44:30 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 6922B4197A;
	Tue,  1 Sep 2026 08:44:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4E3B1F00A3D;
	Tue,  1 Sep 2026 08:44:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788252270;
	bh=nWVnKg9MLKgmRi+FrsceWTa+c5GkaZWyU4XQHMrCz/E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=fVHIjT7EzW3w5KsGUaNKdS3cC/LRF22hV9DAPH8PNyUt2YriP1NcEOBLsiYmh3CkH
	 MQhkg8sfLbHvlJfwwS+fAlet/QILfaIgR7+88OUAmyjLL7+ViYZZZ2DQrjHfvzPunZ
	 zGDvmHJk70l3rEV62rfwKsaExIE9ei43psS/eNz2QQBM4hq0b4jEedxSDF5swszF2F
	 H6+lFlEU9GoExd81STzxk5tKMbikN+cNHI72kisumndOASJjtbJJpL579tKAHFO3iO
	 NI6bfzvqfC8+WwP4VRmfvOBBRl2t+PacGG8MLMVGH2pzeGzME/eWEgcelJXNkj7Ejm
	 Wbg61PdKrcPBQ==
Date: Tue, 1 Sep 2026 10:44:26 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Steffen Trumtrar <s.trumtrar@pengutronix.de>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>, 
	=?utf-8?B?U8O4cmVu?= Andersen <san@skov.dk>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v8 4/5] dt-bindings: arm: fsl: add compatible for new
 Skov i.MX8MP variant
Message-ID: <20260901-awesome-mahogany-starfish-e90aa5@quoll>
References: <20260831-v7-0-topic-imx8mp-skov-dts-jutouch-7inch-v8-0-e2e635452ba9@pengutronix.de>
 <20260831-v7-0-topic-imx8mp-skov-dts-jutouch-7inch-v8-4-e2e635452ba9@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260831-v7-0-topic-imx8mp-skov-dts-jutouch-7inch-v8-4-e2e635452ba9@pengutronix.de>
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

On Mon, Aug 31, 2026 at 10:17:41AM +0200, Steffen Trumtrar wrote:
> In preparation for adding a new device tree variant with a different 7"
> panel, describe the DT compatible in the binding.
> 
> Signed-off-by: Steffen Trumtrar <s.trumtrar@pengutronix.de>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  Documentation/devicetree/bindings/arm/fsl.yaml | 1 +
>  1 file changed, 1 insertion(+)

Just squash these two patches. Adding compatible per patch is just
churn.

Best regards,
Krzysztof


