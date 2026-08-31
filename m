Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AC37C624C6
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 31 Aug 2026 13:29:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bSGncVD5qJeowyD9nhbZoeYdhb4eCRI1Fy+X8N6WL3Q=; b=PPPbNik46csgQVmHtlfysWlvyL
	YW8t+R+rQSY+HVinwzcPVkQh+0EGR1RxlP1SOj7qR/SxFlSaLFpyIBA9IwVOmGkvntKTLRMwYLdth
	uPbfdIqP/Ppuj7vXFpilfTduBK8Ncc38FkHh1Q8OPf4+vEJxSKEtSKOwD7VyyQI5GnvuYCCi/FhLc
	24uMoO4UkN+qtCzfpO5LeiD8d7jUC9XC1NqEsZi6LYb2d73hNBkqfi0JcW/33qVWb8JIZdvnK1uFf
	8LCbfZdXPUE//ZMMCYDYIDCzCW8m5wtHikFaO1juVt+CoJPHOYYgEHllWsuVF9krgH9pGxSi6oDpF
	TjoHonEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x124x-00000009Pep-2Nih;
	Mon, 31 Aug 2026 13:29:39 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x124w-00000009PeQ-0UqT
	for linux-arm-kernel@lists.infradead.org;
	Mon, 31 Aug 2026 13:29:38 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 6D5EA403F1;
	Mon, 31 Aug 2026 13:29:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2EFEE1F000E9;
	Mon, 31 Aug 2026 13:29:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788182977;
	bh=bSGncVD5qJeowyD9nhbZoeYdhb4eCRI1Fy+X8N6WL3Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Or94cuh/gVo4Pfz9Y33b8l/4PK/nS1P8FN++kCjxZh3Kbv1W7JjXhW+6wXKAumXku
	 PTFPfgfakVQSLGzE5pg3pjPHOta7nZ4ZM9QnAVsQkAC/48pzYLkZt9cjbKTnsXpJ5F
	 VhbvO2V4gZvV5dDIzclI1yK9xPSg/Kby+r7coUfVXsFRaNWhYJ6nNwm02ilc5rpj+m
	 DkYm6kzwPDzFXm2mfalXnQ3aha4Tv2xoBPoR1dtU2O1eORR1QbkBYlXGbmHPOd8eVt
	 GBasDih2ioiOEoZIfSeZrDi/6zBmmo//q4Yb2c3Y/0R9AznCM2LpFAmYyaodemfUtj
	 VTxXdnoUugbaA==
Date: Mon, 31 Aug 2026 08:29:36 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Bhargav Joshi <j.bhargav.u@gmail.com>
Cc: simona.toaca@nxp.com, linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <brgl@kernel.org>, daniel.baluta@gmail.com,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org, goledhruva@gmail.com,
	Nishanth Menon <nm@ti.com>, linux-spi@vger.kernel.org,
	m-chawdhry@ti.com, devicetree@vger.kernel.org,
	Santosh Shilimkar <ssantosh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 2/2] dt-bindings: spi: ti,davinci-spi: convert to DT
 schema
Message-ID: <178818297576.700625.8066248525340534710.robh@kernel.org>
References: <20260816-ti-davinci-spi-v1-0-a7f57dfd5262@gmail.com>
 <20260816-ti-davinci-spi-v1-2-a7f57dfd5262@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260816-ti-davinci-spi-v1-2-a7f57dfd5262@gmail.com>
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


On Sun, 16 Aug 2026 03:19:32 +0530, Bhargav Joshi wrote:
> Convert the TI DaVinci/Keystone SPI controller binding from text format
> to DT schema.
> 
> Changes during the conversion:
> - Create a separate ti,davinci-spi-peripheral-props.yaml schema to
>   properly define the ti,spi-wdelay peripheral property.
> - Add missing dmas and dma-names properties.
> - Add constraints to ti,spi-wdelay based on the 6-bit width
>   of the SPIFMTn.WDELAY hardware register field.
> - Add constraints to num-cs based on the maximum hardware chip
>   selects available on the DA850 SoC.
> 
> Signed-off-by: Bhargav Joshi <j.bhargav.u@gmail.com>
> ---
>  .../devicetree/bindings/spi/spi-davinci.txt        | 100 -----------------
>  .../bindings/spi/spi-peripheral-props.yaml         |   1 +
>  .../spi/ti,davinci-spi-peripheral-props.yaml       |  25 +++++
>  .../devicetree/bindings/spi/ti,davinci-spi.yaml    | 118 +++++++++++++++++++++
>  4 files changed, 144 insertions(+), 100 deletions(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


