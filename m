Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5B42C369D1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Apr 2025 07:50:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9Xo3qBBEZAM2rR5IGUppfexQEhcexMZF9k8v4O9R/eA=; b=vHMVL5C2w5aIhlKeasdfCDRWrt
	1XNgBPqJ3Faodbuu/mw8lWQXB0ipjyG6VHXebZWzQoJkvRZm094CNYgMOGOwMZz9BCWb2RzWVZpjj
	rbVAO/t9/zSFEPp6eMpc4TIQqb2H1yze71AFqYlkJuoOwFCrK5791GUc+ThV7bKysu7JGPIrMkdRW
	dGKkeVoiCaeIL+LpWFamgvbKGZe7oUznLwT11VUqPT8g/vnZQ4hNlHXpx7ZstDgXgvmllxJw5E9Wh
	9Ij5xPgkBMOOVGFtsoQ9hcTB9zfThauCHm1Y62axN9faXi7xmM8NH3ok8HrdQcR2rBtZ2psZUdo3T
	7ODnIsOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8DpG-0000000GF1s-196b;
	Fri, 25 Apr 2025 07:50:22 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8DnL-0000000GEOn-2xwL
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Apr 2025 07:48:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id BF7065C6428;
	Fri, 25 Apr 2025 07:46:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3F0AC4CEE4;
	Fri, 25 Apr 2025 07:48:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745567302;
	bh=jpBGvqF1vhLelKCM+qa40XIBkSN7Xd7BZS/mEIX6rmg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Q1Z9LDOLe8KEKfAKnMyLYXFqw1Ao+8PnjVcu3u87fGhcykICD0LzaBHMw792sdjnQ
	 9CkZFsnFkTUWmFtbtrvpqHuo7CSVX5YXJBASK5avvKhaZTUHLxW3KEkMwDOf/mQI9Y
	 RtLwSlTKnd/jtQ4xPsby2lOx47vi1I2BYPsrZj6dKAuzQ8apes2/Zlp1BAEkWlAEs/
	 tA/mexzcFSn8NDWQ7+GeysL9OAyqOfGYRY+UVBZZV1Lpctq+zeNQ6PQcYsj33FUDvC
	 OYwdFfPpnWWSghVEkpekzvxikVSWK1KRaAQ6pxXEEYrEVV3vXPsmNhoXw5sCgZ8d5v
	 5mPZKjd7ucYkA==
Date: Fri, 25 Apr 2025 09:48:19 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Judith Mendez <jm@ti.com>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Nishanth Menon <nm@ti.com>, 
	Adrian Hunter <adrian.hunter@intel.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>, 
	Josua Mayer <josua@solid-run.com>, linux-mmc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Francesco Dolcini <francesco@dolcini.it>, Hiago De Franco <hiagofranco@gmail.com>, 
	Moteen Shah <m-shah@ti.com>, stable@vger.kernel.org
Subject: Re: [PATCH RESEND v3 1/3] dt-bindings: mmc: sdhci-am654: Add
 ti,suppress-v1p8-ena
Message-ID: <20250425-agile-imported-inchworm-6ae257@kuoka>
References: <20250422220512.297396-1-jm@ti.com>
 <20250422220512.297396-2-jm@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250422220512.297396-2-jm@ti.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250425_004823_799625_7401743D 
X-CRM114-Status: GOOD (  18.03  )
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

On Tue, Apr 22, 2025 at 05:05:10PM GMT, Judith Mendez wrote:
> Some Microcenter/Patriot SD cards and Kingston eMMC are failing init
> across Sitara K3 boards. Init failure is due to the sequence when
> V1P8_SIGNAL_ENA is set. The V1P8_SIGNAL_ENA has a timing component tied
> to it where if set, switch to full-cycle timing happens. The failing
> cards do not like change to full-cycle timing before changing bus
> width, so add flag to sdhci-am654 binding to suppress V1P8_SIGNAL_ENA
> before changing bus width. The switch to full-cycle timing should happen
> with HIGH_SPEED_ENA after change of bus width.
> 
> Signed-off-by: Judith Mendez <jm@ti.com>
> ---
>  Documentation/devicetree/bindings/mmc/sdhci-am654.yaml | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/mmc/sdhci-am654.yaml b/Documentation/devicetree/bindings/mmc/sdhci-am654.yaml
> index 676a74695389..0f92bbf8e13b 100644
> --- a/Documentation/devicetree/bindings/mmc/sdhci-am654.yaml
> +++ b/Documentation/devicetree/bindings/mmc/sdhci-am654.yaml
> @@ -201,6 +201,11 @@ properties:
>        and the controller is required to be forced into Test mode
>        to set the TESTCD bit.
>  
> +  ti,suppress-v1p8-ena:

Do not tell what the drivers should do, but tell what is the issue with
the hardware, e.g. some cards do not like full-cycle.... and this will
also hint you that it should be most likely generic, not specific to
this device.

> +    $ref: /schemas/types.yaml#/definitions/flag
> +    description:

Best regards,
Krzysztof


