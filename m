Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83CF8D3B98A
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Dec 2025 19:13:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OVJPVf1v7MJJK+wCUvN5CXoFZ9GC318PJgr9vDNmdts=; b=hfGHwgo4SSh7mYPWnc9JKkj7Ly
	0yiI8QEd+fDPqysRziMJmQcwTYvFm85wLsVA36WsUSjcnN/Htz7FmUykshYbptsctV9k1bYfEisVw
	ZnDS2QvCkWc35pcK1tsH3GB0xgks2LXlNsAdD9z8F0nPWd5QpQQ7UzEZgwnzaRH6bjJu7Fviq/QDi
	X/m0eYOpc4YjrcJ97lNZs6QiKtZNxPr6Is0aG0zNhXkm5u00GtupoFzvoK/ZOF6zMEBgIYPe7kwMT
	GMck2FFs7XiuxKNQ6Fl+brxqwQJpPXk5TjgsFjcoBYKaVSAG4GAWOt3w8seHddXHf+kM4Amv/I6RY
	orgZ4Evg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vT39N-0000000Egeq-15Qt;
	Tue, 09 Dec 2025 19:13:29 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vT39K-0000000EgeN-2UtV
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Dec 2025 19:13:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 00FB740B66;
	Tue,  9 Dec 2025 19:13:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9FEF8C4CEF5;
	Tue,  9 Dec 2025 19:13:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765307605;
	bh=E/h9yRqykG5Tglzcrsb/BCu5betWyxIoDaKz+Xbemzo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tewNc3LLWC40awRaXgJRiR1PXqqGU+Mu32EeTyOs5DCaaPNNiJvPWFvcmlcAvlkfw
	 Q9817VCsC5cNDSTUk7uAk8erpV9uAWCOMiBXE1GZlOObvj5v0b2N9cGFXR5kecTYio
	 MhncKrgNG5CzcIYuwx0LV5T1plm72acYecsGUww9K5maTDpu8Out4kvgbq8/zgxzOQ
	 fdrFTrwppSbao9IIMMMSjJH2kVOi1sdVBmumcCDwvQsTTIi32csbZc/cRH3M2yV5q3
	 Cufl+RxaSwf5TCtJkxHs53oEWm09K7E7q4fzAD8sOLtLE3bAH2MPgfaH6gfHK5NqP0
	 /qrJTGztmzj/A==
Date: Tue, 9 Dec 2025 13:13:23 -0600
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
Subject: Re: [PATCH 2/7] ASoC: dt-bindings: update tdm-slot.txt references to
 tdm-slot.yaml
Message-ID: <20251209191323.GA954261-robh@kernel.org>
References: <20251209-tdm-idle-slots-v1-0-38dabf6bc01e@gmail.com>
 <20251209-tdm-idle-slots-v1-2-38dabf6bc01e@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251209-tdm-idle-slots-v1-2-38dabf6bc01e@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251209_111326_700970_F1023498 
X-CRM114-Status: GOOD (  18.30  )
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

On Tue, Dec 09, 2025 at 07:31:15PM +1000, James Calligeros wrote:
> Ensure that all references to tdm-slot.txt have been updated to
> tdm-slot.yaml.
> 
> Achieved by running "sed -i 's/tdm-slot.txt/tdm-slot.yaml/g' *"
> against the bindings/sound. No other references to the file
> were found in the tree.
> 
> Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
> ---
>  .../bindings/sound/imx-audio-card.yaml   | 4 ++--
>  .../bindings/sound/simple-card.yaml      | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/sound/imx-audio-card.yaml b/Documentation/devicetree/bindings/sound/imx-audio-card.yaml
> index 3c75c8c78987..1df29a556120 100644
> --- a/Documentation/devicetree/bindings/sound/imx-audio-card.yaml
> +++ b/Documentation/devicetree/bindings/sound/imx-audio-card.yaml
> @@ -39,11 +39,11 @@ patternProperties:
>              - dsp_b
>  
>        dai-tdm-slot-num:
> -        description: see tdm-slot.txt.
> +        description: see tdm-slot.yaml.
>          $ref: /schemas/types.yaml#/definitions/uint32
>  
>        dai-tdm-slot-width:
> -        description: see tdm-slot.txt.
> +        description: see tdm-slot.yaml.
>          $ref: /schemas/types.yaml#/definitions/uint32

These should be removed and replaced with a '$ref: tdm-slot.yaml#' at 
the top-level. 

If you have some constraints to add here, then the property can stay.

>  
>        playback-only:
> diff --git a/Documentation/devicetree/bindings/sound/simple-card.yaml b/Documentation/devicetree/bindings/sound/simple-card.yaml
> index 533d0a1da56e..2e1a5b3216c5 100644
> --- a/Documentation/devicetree/bindings/sound/simple-card.yaml
> +++ b/Documentation/devicetree/bindings/sound/simple-card.yaml
> @@ -28,11 +28,11 @@ definitions:
>      $ref: /schemas/types.yaml#/definitions/flag
>  
>    dai-tdm-slot-num:
> -    description: see tdm-slot.txt.
> +    description: see tdm-slot.yaml.
>      $ref: /schemas/types.yaml#/definitions/uint32
>  
>    dai-tdm-slot-width:
> -    description: see tdm-slot.txt.
> +    description: see tdm-slot.yaml.
>      $ref: /schemas/types.yaml#/definitions/uint32

Same here.

>  
>    system-clock-frequency:
> 
> -- 
> 2.52.0
> 

