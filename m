Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3965DC44536
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jul 2026 15:19:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oWrtwNEs2VPgPgKGmLYu2Co32wif3lZ/DlUHbPr9kwA=; b=vEmmSiwQ5sj7gzQL6df8QspFn3
	JEpb69OgSqJnHdtLDV4XD40cCbJedPP+CuG/VnrDvb8ZSk5YZRDi5Mb7fKvyClPr693D09Keum1C8
	ipdZXFhGcac3Dot+pq3Mg71DapJL+lCtIRJNwxN4F0veuVNFggytn0Fw4ixCOsmNi+NEdF9xwMtRF
	WCSu8HXO7N6qb4BnHFqSocZsF5w8OtqQ+HxJoV4ez4BQDZzv/fO8GN8onG+H3y62uQgrPTbs0f4Ga
	LlYnKzKdoMruK0XAreOXpsTfKcMinCvIleIhZkTmA7hlxaydlBg9iS+EodCoK76Z7kgQpDRagxBQG
	9BAiYYnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmYjD-0000000C8Ox-2aUE;
	Wed, 22 Jul 2026 15:19:23 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmYjC-0000000C8Og-0u6S
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Jul 2026 15:19:22 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 7720740087;
	Wed, 22 Jul 2026 15:19:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EFEB21F000E9;
	Wed, 22 Jul 2026 15:19:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784733561;
	bh=oWrtwNEs2VPgPgKGmLYu2Co32wif3lZ/DlUHbPr9kwA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=KZCjs+ycxUN3xWGhLmlSI2g0/IgkrQE8EQPdai87W+kCUKN8uy4Qb+WWSsiFPwybE
	 kc/LIT0hxVGwddFmEE8fAH60L45+5GI18rd/X2HbpCLwE3pxXhH35gSmDe3/MBR2DY
	 MiCAMH4L03ZiTCE08Oy6yhFR++mKRwK51r0AHbrNhdeG6TZ4scJ+WymoN66FBAeWVk
	 K2PSSzeKINCb3zbfB08d5++54DuWBsKMNKBYbWSiOlxChy25Qh6pTojqM+UF0B5tSG
	 C9hE6Bu0zZFGmZxejfPcH+eCUuMQ5J51nZZZoDG5jxIJX75D0mOvvy0yFIq4iOC+R9
	 eiVSoinMsejLg==
Date: Wed, 22 Jul 2026 10:19:18 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Frank.Li@oss.nxp.com
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Fabio Estevam <festevam@gmail.com>,
	linux-stm32@st-md-mailman.stormreply.com,
	Linus Walleij <linusw@kernel.org>, devicetree@vger.kernel.org,
	Frank Li <Frank.Li@nxp.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	Conor Dooley <conor+dt@kernel.org>, imx@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>, Lee Jones <lee@kernel.org>
Subject: Re: [PATCH 2/3] dt-bindings: mfd: st,stmpe: let interrupt property
 optional
Message-ID: <178473165049.888880.17043933154310201822.robh@kernel.org>
References: <20260708-dts-stmpe-v1-0-1f51d15bb358@nxp.com>
 <20260708-dts-stmpe-v1-2-1f51d15bb358@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260708-dts-stmpe-v1-2-1f51d15bb358@nxp.com>
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


On Wed, 08 Jul 2026 15:48:57 -0400, Frank.Li@oss.nxp.com wrote:
> From: Frank Li <Frank.Li@nxp.com>
> 
> Not all boards connect irq lines. So mark interrupt property optional.
> 
> Fix below CHECK_DTBS warnings:
>   arch/arm/boot/dts/nxp/imx/imx6dl-phytec-pbab01.dtb: stmpe@41 (st,stmpe811): 'oneOf' conditional failed, one must be fixed:
>         'interrupts' is a required property
>         'interrupts-extended' is a required property
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>  Documentation/devicetree/bindings/mfd/st,stmpe.yaml | 1 -
>  1 file changed, 1 deletion(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


