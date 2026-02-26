Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2E09FC5903
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Feb 2026 07:32:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DGaN+ivDD437TW35J3DItfV7ezvGR+AGrkRuOvGzo7E=; b=rlXM2q9S4R4YbM0wRiZcacQB8U
	4CPEKZs4LrVFP1UHV4WxaSO7kXZoFkJma3Asd59unv4OK3jBgA5R0dc7S82ATrDqwGhJCNhi/zLDQ
	tImBPGmQ+Hhs77/F3R6WRczHddIFBZwK8qWmUtSTXBWf1iuiVkKV/N8GoW0PV7igWnlJbDTmHIk1z
	UGPMefrFYrGczSQkY6C/udQaHpVptj+84p7fj4Y+SodTL0ix03cl3eYRZlTVPSOwZwBlFwmnyVQ11
	QkIZjj1c6f2DCh9ope1vTM7LMv3XnDFtzMtqAhUfVwZ6tB/2BTcz32o/T1S8dOo6+//MHafOiLc26
	2s7p8aPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvVrB-00000005ZxQ-19c5;
	Thu, 26 Feb 2026 07:32:21 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvVr8-00000005Zwo-3Jxy
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Feb 2026 07:32:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 71615437A3;
	Thu, 26 Feb 2026 07:32:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BFA96C19422;
	Thu, 26 Feb 2026 07:32:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772091138;
	bh=zL14adUa/DsnYa4rgWsBjQbPFunEtFNT2bExglmLGaU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=b3n0/lSXd9m7viw+A9FUsH1klGLdW5/pKS/bLOjjKFJLH4XWELAF2C+zWvd2JbH7S
	 KGEshbHaynvtB73FOGbiuKUiCWVvmn5WIyfXrZaTS+5RLNbkBuh5l+Xvctaf2XebeK
	 Duu1vSej1g+LJVr1HE381Z3pxZ1G1PpH2eyrZxJxnIOlcfFWeqmmK74DVKOT+jp5bY
	 IBS7P0eRNtREnepIaA7wrahB1OaJrRxu7utWB05GMhptX890cpDphJfUw0f8Nj12LR
	 wqaNYO0QwJSFKptTKiiA2kxrhnzEKK31Uk/LyVAgoDzaGUF6zCUlgi07NZPx4yB13D
	 5SQMbvqBuh13w==
Date: Thu, 26 Feb 2026 08:32:16 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Ciprian Costea <ciprianmarian.costea@oss.nxp.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Thomas Gleixner <tglx@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>, 
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Haibo Chen <haibo.chen@nxp.com>, 
	Adrian Hunter <adrian.hunter@intel.com>, Shawn Guo <shawnguo@kernel.org>, 
	Lucas Stach <l.stach@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mmc@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, s32@nxp.com, 
	Christophe Lizzi <clizzi@redhat.com>, Alberto Ruiz <aruizrui@redhat.com>, 
	Enric Balletbo <eballetb@redhat.com>, Eric Chanudet <echanude@redhat.com>, 
	Larisa Grigore <larisa.grigore@nxp.com>
Subject: Re: [PATCH v2 3/7] dt-bindings: arm: fsl: Add NXP S32N79 SoC and RDB
 board
Message-ID: <20260226-sly-fuzzy-parakeet-ea9fb2@quoll>
References: <20260225133858.8026-1-ciprianmarian.costea@oss.nxp.com>
 <20260225133858.8026-4-ciprianmarian.costea@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260225133858.8026-4-ciprianmarian.costea@oss.nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260225_233218_852344_58DC0873 
X-CRM114-Status: GOOD (  15.88  )
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

On Wed, Feb 25, 2026 at 02:38:54PM +0100, Ciprian Costea wrote:
> From: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
> 
> Add device tree binding documentation for the NXP S32N79 automotive SoC
> and the S32N79 Reference Design Board (S32N79-RDB).
> 
> The S32N79 is an automotive-grade SoC featuring eight ARM Cortex-A78AE
> cores organized for high-performance networking and gateway applications
> in vehicles.
> 
> Co-developed-by: Larisa Grigore <larisa.grigore@nxp.com>
> Signed-off-by: Larisa Grigore <larisa.grigore@nxp.com>
> Signed-off-by: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
> ---
>  Documentation/devicetree/bindings/arm/fsl.yaml | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
> index 5716d701292c..415081423a30 100644
> --- a/Documentation/devicetree/bindings/arm/fsl.yaml
> +++ b/Documentation/devicetree/bindings/arm/fsl.yaml
> @@ -1827,6 +1827,12 @@ properties:
>                - fsl,s32v234-evb           # S32V234-EVB2 Customer Evaluation Board
>            - const: fsl,s32v234
>  
> +      - description: S32N79 based Boards
> +        items:
> +          - enum:
> +              - nxp,s32n79-rdb
> +          - const: nxp,s32n79

I believe these are ordered by fallback, so s32v > s32n.

> +
>        - description: Traverse LS1088A based Boards
>          items:
>            - enum:
> -- 
> 2.43.0
> 

