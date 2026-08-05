Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61C3AC55174
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Aug 2026 19:12:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tyRd8ZD6r+p9t7J6gdkEQse+PmCQ29MOodm82/aO2r4=; b=QFzntw8sf0P4RDLpCa2X/rtk42
	ER6f6dS6J6IkNfZIMAHlUyUpoHuLiTkM1dJxnHChkSyjQYOyGZM7qhfVUbsIY704NvB6u7QKk5q2A
	vqFcYrUfgsNc+CTGpZlxDPJDRevMopAMFQ6SDQjI9ehvykO9tWS3QajwE445/a0alFDLsnh3Xod1W
	CSKDSBjLB8iDcaDNTzkRd1MqUsgCcLuplUsZp139H6mAtGyNfvsppY2+N5pnn8oWYBB7tiO30p4Ng
	kN2mFYuCOteFPASLWIfxPaoYU2oExin03kCOle1PqL35u+x/WcTvNr7WOK/ntDRhowpjQKtGrsqOX
	U7/2Axag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrh2o-00000004Rez-16BV;
	Wed, 05 Aug 2026 19:12:50 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrh2l-00000004ReQ-1zIi
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Aug 2026 19:12:49 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BBCC6153B;
	Wed,  5 Aug 2026 12:12:38 -0700 (PDT)
Received: from ryzen.lan (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 00CF63F86F;
	Wed,  5 Aug 2026 12:12:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1785957162; bh=lDT7FdGY2Nawl9QrfcHfV2XAF+4ejy8Hdvw2oQGXBP0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=HckXOgkCfhf4HJOjzr50vRBkFepF0fqCy7W8Cy1Xuyzh6BEJCKnCJd18jEG6P8iVg
	 on9QhTJR4q9FfxRhUsYjYhW2ibAPQUO/ofs+rUND/Nm8jgJglz9WBp1gaBnpYTRi4h
	 dyuwAhk/7F3BaO4gJJvDgHOLEkLOoGxGCfBYGSa8=
Date: Wed, 5 Aug 2026 21:08:27 +0200
From: Andre Przywara <andre.przywara@arm.com>
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec
 <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, Maxime
 Ripard <mripard@kernel.org>, linux-spi@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] spi: dt-bindings: sun6i: Add compatibles for A733's SPI
 controllers
Message-ID: <20260805210739.6da82d16@ryzen.lan>
In-Reply-To: <20260805-allwinner-a733-spi-support-v1-1-7bfd1141ebc9@baylibre.com>
References: <20260805-allwinner-a733-spi-support-v1-1-7bfd1141ebc9@baylibre.com>
Organization: Arm Ltd.
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.31; x86_64-slackware-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260805_121247_647423_BEF9A0D3 
X-CRM114-Status: GOOD (  16.22  )
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

On Wed, 05 Aug 2026 15:53:26 +0200
Jerome Brunet <jbrunet@baylibre.com> wrote:

> The A733 has six SPI controllers with the same IP as the A523.
> Like the A523, one of them (spi1) also supports DBI mode.
> 
> Add SoC specific compatible strings, falling back to the A523 ones.

Has this been tested? Can someone confirm? We should avoid adding
bindings prematurely, not that it bites us again as it did for the H616
DE bindings, for instance.

Cheers,
Andre


> 
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> ---
>  Documentation/devicetree/bindings/spi/allwinner,sun6i-a31-spi.yaml | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/spi/allwinner,sun6i-a31-spi.yaml b/Documentation/devicetree/bindings/spi/allwinner,sun6i-a31-spi.yaml
> index 6af4ff233158..be47c6e00409 100644
> --- a/Documentation/devicetree/bindings/spi/allwinner,sun6i-a31-spi.yaml
> +++ b/Documentation/devicetree/bindings/spi/allwinner,sun6i-a31-spi.yaml
> @@ -36,6 +36,13 @@ properties:
>        - items:
>            - const: allwinner,sun55i-a523-spi-dbi
>            - const: allwinner,sun55i-a523-spi
> +      - items:
> +          - const: allwinner,sun60i-a733-spi
> +          - const: allwinner,sun55i-a523-spi
> +      - items:
> +          - const: allwinner,sun60i-a733-spi-dbi
> +          - const: allwinner,sun55i-a523-spi-dbi
> +          - const: allwinner,sun55i-a523-spi
>  
>    reg:
>      maxItems: 1
> 
> ---
> base-commit: dc59e4fea9d83f03bad6bddf3fa2e52491777482
> change-id: 20260805-allwinner-a733-spi-support-e30a9ac057a3
> 
> Best regards,
> --  
> Jerome
> 
> 


