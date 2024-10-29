Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CC0BD3A67A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Oct 2024 18:22:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iT1KZstrKnsyqYo4dg3x0+KOMpIG9DHct4TKVU+Hs3Y=; b=mNlIxODv/ccHzT4evUtAdrFj31
	8Bu/YSZlauwDaMmgMmmTPK3Y4J2Nt2lTwB0ifi8V/HRFxwe7qHKe3CuSpEO6iHG/FJKYcPk1Fo0cc
	rtxJjeEw0iF6KyU3BhxqFKM73ehDCBuTIuTdaRebP7Le3ShM7yjnvMrR5xUhCAV9VV+nB+w7GMMo6
	GzUtOVSztLb0Q+1JEZk+nFdXeRFOwvsBq0B6bF76j+vsMXnjrsl9VZ7okzKcY5IUuLlwQ7CO6v+1E
	im1OD96BnGqiMj87R1DvXDy2CpkA3XTLT1jFU/uRARTRa9/8ef6C8AZfUTwlOy5ZB7EUxf6r6MIXs
	lgShRpcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5qrS-0000000FTSq-2R2Q;
	Tue, 29 Oct 2024 18:22:34 +0000
Received: from mail.andi.de1.cc ([2a02:c205:3004:2154::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5qem-0000000FS0j-0OKG
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Oct 2024 18:09:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=References:In-Reply-To:Cc:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=iT1KZstrKnsyqYo4dg3x0+KOMpIG9DHct4TKVU+Hs3Y=; b=OtcjIpzEOO5bIe4gAfLT5afCNt
	8vvMDAm8BhZplOlA4E5itIHKdRjAhF95wte24BJT6A97atK3LXtUcgH+h7egt+YrexjOfKhEh+PbL
	wDFJLiAo7RJKAIKUm32mfdkLNpKQmqee2ckHjJNcrQ946OZqMvgiOcLkGYY7zIAfu3yygi9+lRGt2
	YEpMFibNW6QuQzMXWMwK0bejU1V/EG0rKbXmhruHQHDEu8lRDafJLVAxq+rbXE8jZMzcN9X88ti9J
	RuhSK2FwjrnhDctFLQb9JaCFeEara1/zXkwqUsUT4O+rHwFm1UuFCK6B/89W6Lg41/M6kvsADya+H
	KuqqEptw==;
Date: Tue, 29 Oct 2024 19:09:19 +0100
From: Andreas Kemnade <andreas@kemnade.info>
To: Fabio Estevam <festevam@gmail.com>
Cc: shawnguo@kernel.org, marex@denx.de, a.fatoum@pengutronix.de,
 kernel@pengutronix.de, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 Fabio Estevam <festevam@denx.de>
Subject: Re: [PATCH v2 2/3] dt-bindings: lcdif: Expand the imx6sl/imx6sll
 fallbacks
Message-ID: <20241029190919.4c615621@akair>
In-Reply-To: <20241029120236.299040-2-festevam@gmail.com>
References: <20241029120236.299040-1-festevam@gmail.com>
	<20241029120236.299040-2-festevam@gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241029_110928_168858_8E0B4F5E 
X-CRM114-Status: GOOD (  14.93  )
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

Am Tue, 29 Oct 2024 09:02:35 -0300
schrieb Fabio Estevam <festevam@gmail.com>:

> From: Fabio Estevam <festevam@denx.de>
> 
> imx6sl.dtsi and imx6sll.dtsi have the following lcdif entries:
> 
> compatible = "fsl,imx6sl-lcdif", "fsl,imx28-lcdif";
> 
> This causes dt-schema warnings as the current binding only
> allow 'fsl,imx6sx-lcdif' as fallback.
> 
> ['fsl,imx6sl-lcdif', 'fsl,imx28-lcdif'] is too long
> ['fsl,imx6sll-lcdif', 'fsl,imx28-lcdif'] is too long
> 
> The imx6sx-lcdif programming model has more advanced features, such
> as overlay plane and the CRC32 support than the imx28-lcdif IP.
> 
> Expand the imx6sl/imx6sll lcdif fallbacks to accept a less specific
> fsl,imx28-lcdif fallback:
> 
> compatible = "fsl,imx6sl-lcdif", "fsl,imx6sx-lcdif",
> "fsl,imx28-lcdif";
> 
> This helps keeping DT compatibility as well as using the more advanced
> lcdif features found on imx6sl and imx6sll. 
> 
> Signed-off-by: Fabio Estevam <festevam@denx.de>
> ---
> Changes since v1:
> - Newly introduced.
> 
>  .../devicetree/bindings/display/fsl,lcdif.yaml     | 14
> +++++++++++++- 1 file changed, 13 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/fsl,lcdif.yaml
> b/Documentation/devicetree/bindings/display/fsl,lcdif.yaml index
> 836955de3bc9..08ce19638fbd 100644 ---
> a/Documentation/devicetree/bindings/display/fsl,lcdif.yaml +++
> b/Documentation/devicetree/bindings/display/fsl,lcdif.yaml @@ -32,11
> +32,23 @@ properties:
>                - fsl,imx8mn-lcdif
>                - fsl,imx8mq-lcdif
>            - const: fsl,imx6sx-lcdif
> +      - items:
> +          - const: fsl,imx6sl-lcdif
> +          - const: fsl,imx6sx-lcdif
> +          - const: fsl,imx28-lcdif
> +      - items:
> +          - const: fsl,imx6sll-lcdif
> +          - const: fsl,imx6sx-lcdif
> +          - const: fsl,imx28-lcdif
> +      - items:
> +          - enum:
> +              - fsl,imx6sl-lcdif
> +              - fsl,imx6sll-lcdif
> +          - const: fsl,imx28-lcdif

What do we need this for? Either imx6sx-lcdif is a useful fallback
compatible or not.  But not sometimes. Looking at the kernel driver: It
is. So IMHO only the three element variants should be allowed.

Regards,
Andreas

