Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E084C021A4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Feb 2025 17:43:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qAjuWHypQuLi4ejF0jBXZGD6Wj+FyEXylbQ6+iV3TTo=; b=4jB9G+MUOMVPCdYW+k+yyU93eZ
	U4/4NjztNHcUWJSqk0JCX3Psg84ISJO+cRyHnuPVUvizrEkRDO3r4Iw6VHjc8vWl2UI1CKPtSO/m0
	TdDQpX7oeZkdsdtr8QdcnpVkt5RrpiqVk9JdvPeTj3Wh0FeHjAMElqZfo5Ep/rNrwld1JLjstyOC6
	De78o1cfPwFYSfH/Jw5xdXCT8Bwj3OiVG8YyL9FCpYYe3oVUKkzQMfBrhSIVK1thfZTUcEd4Mm3Fa
	+Ii77yGxo91RULOxbz+oFpOAJ9PIH9igunuEi6DcwsP9MVAnac3z85ykNXPNwsDs9KG3MAo5oEkq5
	VHF+C7Vg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmcTt-0000000Efaq-2GzT;
	Mon, 24 Feb 2025 17:43:01 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmcLn-0000000Ee3L-0UoX
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Feb 2025 17:34:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id C842F611FA;
	Mon, 24 Feb 2025 17:34:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3560DC4CED6;
	Mon, 24 Feb 2025 17:34:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740418477;
	bh=sCwX7+nI/q81kiD2Y4/3tqSc3VlI4gc1dBG+Icft1Fs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hTQ87Y5EJefkpgjqkOeu0y6B5lNoAOCly/eXwp3K8arYTGs7bcZbVzUX4x9a8zKrE
	 fQMnAJNEPArkOi/b0YFY4zipLp+oj2+sz88wuvfD0yO3p41Pe2e4w5LNDdkuC1oJQy
	 omNqK13szevPn7ITpFrP2LUzwKO/J8sRkcfbpy5Zaeha/9jYHIHOX2cVtpRYD7S21l
	 TOT5v7/SM3B9U/Mxk+NSFxwq6QbA96irjalNyV1JWBXAnP6A6tF4kIsLiY74DmBH92
	 eyLlIJyxOJV96k4y1RNOJQNyw17IoAyXKvuQO8vyOcHWgxlYN05Tcs9xKLHLNatvm6
	 FGbpObWGrs0Lw==
Date: Mon, 24 Feb 2025 11:34:35 -0600
From: Rob Herring <robh@kernel.org>
To: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
Cc: Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>, Marek Vasut <marex@denx.de>,
	Stephen Boyd <sboyd@kernel.org>,
	Shengjiu Wang <shengjiu.wang@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	linux-clk@vger.kernel.org, imx@lists.linux.dev,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/4] dt-bindings: clock: imx8mp: add axi clock
Message-ID: <20250224173435.GA3560337-robh@kernel.org>
References: <20250221190929.31469-1-laurentiumihalcea111@gmail.com>
 <20250221190929.31469-2-laurentiumihalcea111@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250221190929.31469-2-laurentiumihalcea111@gmail.com>
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

On Fri, Feb 21, 2025 at 02:09:26PM -0500, Laurentiu Mihalcea wrote:
> From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
> 
> The AUDIOMIX clock provider takes an additional clock: AUDIO_AXI_CLK_ROOT.
> 

Fixes tag? The commit message should be expanded a bit as this is an ABI 
change.

> Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
> Reviewed-by: Iuliana Prodan <iuliana.prodan@nxp.com>
> ---
>  .../devicetree/bindings/clock/imx8mp-audiomix.yaml     | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/clock/imx8mp-audiomix.yaml b/Documentation/devicetree/bindings/clock/imx8mp-audiomix.yaml
> index 6588a17a7d9a..0272c9527037 100644
> --- a/Documentation/devicetree/bindings/clock/imx8mp-audiomix.yaml
> +++ b/Documentation/devicetree/bindings/clock/imx8mp-audiomix.yaml
> @@ -24,8 +24,8 @@ properties:
>      maxItems: 1
>  
>    clocks:
> -    minItems: 7
> -    maxItems: 7
> +    minItems: 8
> +    maxItems: 8
>  
>    clock-names:
>      items:
> @@ -36,6 +36,7 @@ properties:
>        - const: sai5
>        - const: sai6
>        - const: sai7
> +      - const: axi
>  
>    '#clock-cells':
>      const: 1
> @@ -72,10 +73,11 @@ examples:
>                   <&clk IMX8MP_CLK_SAI3>,
>                   <&clk IMX8MP_CLK_SAI5>,
>                   <&clk IMX8MP_CLK_SAI6>,
> -                 <&clk IMX8MP_CLK_SAI7>;
> +                 <&clk IMX8MP_CLK_SAI7>,
> +                 <&clk IMX8MP_CLK_AUDIO_AXI_ROOT>;
>          clock-names = "ahb",
>                        "sai1", "sai2", "sai3",
> -                      "sai5", "sai6", "sai7";
> +                      "sai5", "sai6", "sai7", "axi";
>          power-domains = <&pgc_audio>;
>      };
>  
> -- 
> 2.34.1
> 

