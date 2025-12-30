Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1002DE92FE3
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Dec 2025 01:32:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m9O0WnYNLig7hSFxA3xnUYcRHmp/stanqCJPdbC0+wA=; b=YeuK7H9OrUDG0g8myalAyWBJPQ
	aEtVw2K3gWafCKva3pvNuJ7Teap4i+AYfR4ZANNWANR8592X2vosttJLDqk6ra72djBRhDACJPxYF
	oeNhUB53iqDh9dumHwH4gf2lT2AUFIu+zejO14DI//iXbulbUsy4zOyO2RgCf3UOoQPVGe0/iE2+7
	gOfhfbjm1gxePwnOsTgntmrbTrL0labQGfiEaGBQ45ehNfG0FcO5eN4Xtx1QqCgtx5EFEvw+Gh85e
	d6GO6bWnuWqjwG4phgPys6wk3fwQxKf6DrPVzL/978VievK7J3mk0VMklqT1QvRivlhrRw9RoBBTE
	g5gmS7CQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaOb7-00000004GJt-1NwH;
	Tue, 30 Dec 2025 01:32:29 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaOb5-00000004GJT-0fN9
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Dec 2025 01:32:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6364D43BAD;
	Tue, 30 Dec 2025 01:32:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16129C4CEF7;
	Tue, 30 Dec 2025 01:32:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767058346;
	bh=8GC9+1cPgKA6OlXPNo/vqRfC2edlTNPVVVG293aNUF8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=t0gWSqfeZ5wpv1aoDOkKa0nd/G1HAxtAdbI+iNPqRs1+zmOyCOZNucc+Ftxn/Igxt
	 JQVD1uqZEeMDo4iT2QSP/ia54kdSSTiH5HUwQrhoux6B512R1fzshk69Rj9/0bOsI9
	 FbbrLt6fOBtnryWnsTmTR1w+AhWCznx/h9CnSqGRG3oAG6WBP35dzKkXVSsYiEGRC4
	 rqwbdGEvnMUYzT6zE+27R6hZEvBG1LAUeUssqFOLGxZTT+WMeJZitkPMER4ftd50eG
	 DM1JSAfSzrAxFDioeWU1wlretsnK4IMmq3JzptubpbQU0rszNFn0BwckanbfMOBRlT
	 BWX/vMDN8QyAg==
Date: Mon, 29 Dec 2025 19:32:25 -0600
From: Rob Herring <robh@kernel.org>
To: James Calligeros <jcalligeros99@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Shengjiu Wang <shengjiu.wang@nxp.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
	Baojun Xu <baojun.xu@ti.com>, linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	asahi@lists.linux.dev
Subject: Re: [PATCH v2 2/7] ASoC: dt-bindings: update tdm-slot.txt references
 to tdm-slot.yaml
Message-ID: <20251230013225.GA3037280-robh@kernel.org>
References: <20251221-tdm-idle-slots-v2-0-ed4d96413aec@gmail.com>
 <20251221-tdm-idle-slots-v2-2-ed4d96413aec@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251221-tdm-idle-slots-v2-2-ed4d96413aec@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251229_173227_237782_9169FCD4 
X-CRM114-Status: GOOD (  16.66  )
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

On Sun, Dec 21, 2025 at 07:35:58PM +1000, James Calligeros wrote:
> Ensure that all references to tdm-slot.txt have been updated to
> tdm-slot.yaml, and are schema-compliant.
> 
> Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
> ---
>  .../bindings/sound/imx-audio-card.yaml   | 14 ++++++--------
>  .../bindings/sound/simple-card.yaml      | 14 ++------------
>  2 files changed, 8 insertions(+), 20 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/sound/imx-audio-card.yaml b/Documentation/devicetree/bindings/sound/imx-audio-card.yaml
> index 3c75c8c78987..eb702f48d694 100644
> --- a/Documentation/devicetree/bindings/sound/imx-audio-card.yaml
> +++ b/Documentation/devicetree/bindings/sound/imx-audio-card.yaml
> @@ -31,6 +31,12 @@ patternProperties:
>          $ref: /schemas/types.yaml#/definitions/string
>          maxItems: 1
>  
> +      dai-tdm-slot-num:
> +        $ref: tdm-slot.yaml#/$defs/dai-tdm-slot-num
> +
> +      dai-tdm-slot-width:
> +        $ref: tdm-slot.yaml#/$defs/dai-tdm-slot-width

Drop these and add just '$ref: tdm-slot.yaml#' up a level (with 
'properties').

You may need 'unevaluatedProperties' or you can put 
'dai-tdm-slot-num: true' here if you want to define which properties are 
used.

> +
>        format:
>          description: audio format.
>          items:
> @@ -38,14 +44,6 @@ patternProperties:
>              - i2s
>              - dsp_b
>  
> -      dai-tdm-slot-num:
> -        description: see tdm-slot.txt.
> -        $ref: /schemas/types.yaml#/definitions/uint32
> -
> -      dai-tdm-slot-width:
> -        description: see tdm-slot.txt.
> -        $ref: /schemas/types.yaml#/definitions/uint32
> -
>        playback-only:
>          description: link is used only for playback
>          $ref: /schemas/types.yaml#/definitions/flag
> diff --git a/Documentation/devicetree/bindings/sound/simple-card.yaml b/Documentation/devicetree/bindings/sound/simple-card.yaml
> index 533d0a1da56e..a14716b2732f 100644
> --- a/Documentation/devicetree/bindings/sound/simple-card.yaml
> +++ b/Documentation/devicetree/bindings/sound/simple-card.yaml
> @@ -27,14 +27,6 @@ definitions:
>      description: dai-link uses bit clock inversion
>      $ref: /schemas/types.yaml#/definitions/flag
>  
> -  dai-tdm-slot-num:
> -    description: see tdm-slot.txt.
> -    $ref: /schemas/types.yaml#/definitions/uint32
> -
> -  dai-tdm-slot-width:
> -    description: see tdm-slot.txt.
> -    $ref: /schemas/types.yaml#/definitions/uint32
> -
>    system-clock-frequency:
>      description: |
>        If a clock is specified and a multiplication factor is given with
> @@ -115,6 +107,8 @@ definitions:
>  
>    dai:
>      type: object
> +    $ref: tdm-slot.yaml#
> +
>      properties:
>        sound-dai:
>          maxItems: 1
> @@ -133,10 +127,6 @@ definitions:
>        bitclock-master:
>          $ref: /schemas/types.yaml#/definitions/flag
>  
> -      dai-tdm-slot-num:
> -        $ref: "#/definitions/dai-tdm-slot-num"
> -      dai-tdm-slot-width:
> -        $ref: "#/definitions/dai-tdm-slot-width"
>        clocks:
>          maxItems: 1
>        system-clock-frequency:
> 
> -- 
> 2.52.0
> 

