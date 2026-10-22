Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3781F606A31B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Oct 2026 13:01:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=qW70pB7N;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=jX3HYUTM
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=8aJ+ZgjrOzJ2MQ0XsYDbjZR4GMqieJUK4jmHnZipazA=; b=qW70pB7Nf2ZbzODJI3S0osIwQ3
	KNU9SBMUHecCcdbeJ5bYB+WvMIhotmWMRplOySiTUQ2uNLEyhqJ6q/L4xjS3pAI8kkrVvofG5kiWS
	iCSPSUXSbWuzZiMTsvDtV3PnUAEytARoykJhZ+7/O3TCXqZIhQhYK3yhyq1f8S/NsH7OiP9SLuWQm
	YC70hdgXm/PHQsqMk2hirb4ZvsQ11BypX0DBTQ8PzR5y4Di44Wi9s6Pc6WBUofBwowpOfDWLYgYiZ
	b1eggDUHNP85r9sMJJpPoSPRucd8Ql3pNvokRlBRcf4SNuRcmSTWojamesjVhL0tMC+6lNtnDk0Jr
	rDRertZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJsQG-0000000E8GT-3gwI;
	Thu, 22 Oct 2026 13:01:32 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJsQE-0000000E8Fz-0xTs
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Oct 2026 13:01:31 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-4a2001dd4e7so19506815e9.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 22 Oct 2026 06:01:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792674088; x=1793278888; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8aJ+ZgjrOzJ2MQ0XsYDbjZR4GMqieJUK4jmHnZipazA=;
        b=jX3HYUTMuO06SeGcTgdnKhfR8jcYFxQucmQ5oX4Tzo3dN6Ldr33481g5qwTc8zh2BX
         1pcVOBYk+AIbCpDm4jJej11opochCO88IuuxY0RfaECZyLri5KxPu+3FqHUmjCRo9OoZ
         r934eTAzyKdZHFf6DqtBz66A1yz07Yy6UUSgbGbyWKhXMNI1SeoqPO32gnYzu4+3mHcp
         P6VwXoeJSD6nLK3VDYszXoKykZNmprLQ6yxR85+IAK1LC8gPa6jfcXxXCt58Fi+AdKHN
         oqwWosW6pr/XkE2Zc25irvtz8Cgnc4yyJN9zKfyf+jWsKzMoC6DkDdPbJhvlX8BjVnHB
         cF3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792674088; x=1793278888;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8aJ+ZgjrOzJ2MQ0XsYDbjZR4GMqieJUK4jmHnZipazA=;
        b=vFTLvZp/kMynepeijOnej0Vsyv4bsWtw4Mk7G+L9RLTWOmqmIdX7JBAumlJNH4s1PI
         0UHMfBk+hh6wo4NjKlxcu8RkD9sAZXdrTKovUNO7XLfibliLxhYgVhrGg75UD/2/Sbny
         /sAMd8acR0QpUoCa8j4e70KdS76bQBcFDo46fXzuijeQ35MidFX47fbDWcisqAKXofba
         P2jvofa9xAQSPqSMklwpr/TV4eL8tnxyZAUgtW+S1GTxV1Olvg2pmd0Of1eQitNPKJN/
         BvFW9+4l9H003AOn/N+r00VnWdCZZ2IzhyeODxkkIg8NCFbfEhKuHbTlxRyFOnWwe6d3
         pD2A==
X-Forwarded-Encrypted: i=1; AKwUvByWER+QjQ1p2EKNdFeyjLCrFGJTeUOSyMGCo7mYSq4Zw/SAYs1hCrpGSRTcSv4h3hD/aqUEMT9/xUiXkPSKEYub@lists.infradead.org
X-Gm-Message-State: AFq9FYI6H7y9xhqaURgH+uPRBVA1GQ2KglkIzaSKMyIW3AU8p8v4skfT
	RdvlVqSaqMHn0Yls4A8D+ii8or4oEynLiiEAXluYsdjGD9HIW5Hwo3Kr
X-Gm-Gg: AYBFou3rG5Non8I6+9/7HYfz/et0DfC4r+X4/Qk3u35bVKdCxnR9u3cZdV/nnWLdvUx
	A6ej6S3WxQFG+6EvzUtSP+TYGx3fd9kyAWkkk0CqEvSoVrCVLMQ1gvZ6wzjvJceHM5ou38qdRSO
	LYgv2qNEWZFWGYh3PgwGnnPqBOqvEEMCr/KWvnd1ZdC1DYGkN8hB/hS5p0T2c/4k+drn9ZUtw9x
	prliGShC4uyZ9hZiqw3HM+zFERLnIRuOkeYngDQaefu8+KhL1uFl2dxhJqyK9VP7+jAtLWnnsbu
	iYI3Qkt0jY/70qdV4SSXphYx2uvDycCiabJwjd30k55vo9UhzGjy1muKkWaB53P+agljv6Rto5K
	a+u2uRX1Nybx8X6QMFqmI9mcwwrmfVNjVke9n/63RMm+wjwyVLwRMzt3Vhy/EDtBw4XniZbgnAY
	gOtvOvJWBOMDGKQEFs5/oQQ4ZgUleXw8eGOzk3kP9gBQ7Px3Cgfc0kVp2p+jh/fCC6kYRPMi/wb
	7vLSXbgvS9VHf0vg+Vyk5YDVbkK3beqjYGFI69YSXy64tbLDfhT62vVdLVAwYpP+5Z0eR90yeHW
	8UmLb1OOTRHIbTx+nPxt7e0nVKDEWki8qY1n7FhQmrVqN3w7WhcGiVY=
X-Received: by 2002:a05:600c:3548:b0:4a1:e774:370c with SMTP id 5b1f17b1804b1-4a1fdd145edmr104588835e9.30.1792674085847;
        Thu, 22 Oct 2026 06:01:25 -0700 (PDT)
Received: from ernest.hoecke-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1fc1066cfsm116512435e9.1.2026.10.22.06.01.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 06:01:25 -0700 (PDT)
Date: Thu, 22 Oct 2026 15:01:23 +0200
From: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
To: Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>
Cc: imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
Subject: Re: [PATCH 1/3] arm64: dts: freescale: imx8-apalis: Add NAU8822
 Bridge Tied Load
Message-ID: <3hd6y6f2lb73mrz2xi5pgsgzvahzmsmktfbyx7n7uewmobk22i@encqv6tasfzo>
References: <20261001-v1-apalis-colibri-imx8-dtsos-v1-0-21881dc324c1@toradex.com>
 <20261001-v1-apalis-colibri-imx8-dtsos-v1-1-21881dc324c1@toradex.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261001-v1-apalis-colibri-imx8-dtsos-v1-1-21881dc324c1@toradex.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261022_060130_340627_42ED25A8 
X-CRM114-Status: GOOD (  22.05  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Oct 01, 2026 at 10:43:10AM +0200, Ernest Van Hoecke wrote:
> From: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
> 
> The NAU8822 on the Apalis Evaluation Board V1.2 can combine its two
> loudspeaker outputs into a Bridge Tied Load output. Add an overlay to
> select this mode when using the board with the Apalis iMX8.
> 
> The overlay is also combined with the Apalis iMX8QM V1.1 on Evaluation
> Board V1.2 device tree to provide a ready-to-use DTB. The codec and its
> routing are already described by the carrier device tree.
> 
> The overlay supports both Apalis iMX8QP and iMX8QM modules.
> 
> Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
> ---
>  arch/arm64/boot/dts/freescale/Makefile                    |  6 ++++++
>  .../dts/freescale/imx8-apalis-eval-v1.2-nau8822-btl.dtso  | 15 +++++++++++++++
>  2 files changed, 21 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
> index 9971b34f7301..2732b223eb3d 100644
> --- a/arch/arm64/boot/dts/freescale/Makefile
> +++ b/arch/arm64/boot/dts/freescale/Makefile
> @@ -801,13 +801,19 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mq-zii-ultra-zest.dtb
>  imx8mq-tqma8mq-mba8mx-lvds-tm070jvhg33-dtbs += imx8mq-tqma8mq-mba8mx.dtb imx8mq-tqma8mq-mba8mx-lvds-tm070jvhg33.dtbo
>  dtb-$(CONFIG_ARCH_MXC) += imx8mq-tqma8mq-mba8mx-lvds-tm070jvhg33.dtb
>  
> +dtb-$(CONFIG_ARCH_MXC) += imx8-apalis-eval-v1.2-nau8822-btl.dtbo
>  dtb-$(CONFIG_ARCH_MXC) += imx8qm-apalis-eval.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx8qm-apalis-eval-v1.2.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx8qm-apalis-ixora-v1.1.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx8qm-apalis-v1.1-eval.dtb
> +dtb-$(CONFIG_ARCH_MXC) += imx8qm-apalis-v1.1-eval-v1.2-nau8822-btl.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx8qm-apalis-v1.1-eval-v1.2.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx8qm-apalis-v1.1-ixora-v1.1.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx8qm-apalis-v1.1-ixora-v1.2.dtb
> +
> +imx8qm-apalis-v1.1-eval-v1.2-nau8822-btl-dtbs := imx8qm-apalis-v1.1-eval-v1.2.dtb \
> +	imx8-apalis-eval-v1.2-nau8822-btl.dtbo
> +
>  dtb-$(CONFIG_ARCH_MXC) += imx8qm-mek.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx8qm-tqma8qm-mba8x.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx8qm-var-som-symphony.dtb
> diff --git a/arch/arm64/boot/dts/freescale/imx8-apalis-eval-v1.2-nau8822-btl.dtso b/arch/arm64/boot/dts/freescale/imx8-apalis-eval-v1.2-nau8822-btl.dtso
> new file mode 100644
> index 000000000000..b2f9c43d29cd
> --- /dev/null
> +++ b/arch/arm64/boot/dts/freescale/imx8-apalis-eval-v1.2-nau8822-btl.dtso
> @@ -0,0 +1,15 @@
> +// SPDX-License-Identifier: GPL-2.0-only OR MIT
> +/*
> + * Copyright (c) Toradex
> + *
> + * Enable Bridge Tied Load (BTL) speaker mode on the Apalis Evaluation
> + * Board V1.2, combining the two loudspeaker outputs for higher output
> + * power.
> + */
> +
> +/dts-v1/;
> +/plugin/;
> +
> +&nau8822_1a {
> +	nuvoton,spk-btl;
> +};
> 
> -- 
> 2.43.0
> 

Hi Frank,

Patch 1/3 (imx8-apalis: Add NAU8822 Bridge Tied Load) is superseded by
the shared NAU8822 BTL overlay series:
https://lore.kernel.org/all/20261022-imx-nau8822-btl-v2-3-b4221ed43650@toradex.com/

Patches 2/3 and 3/3 are unchanged and still apply to imx/dt64 without
patch 1.

Best regards,
Ernest


