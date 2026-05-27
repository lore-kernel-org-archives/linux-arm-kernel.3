Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0C27CD5BDE
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 May 2026 08:35:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M06HIPdd2IUezENrjzGwyWPgmEB4K4h1Br8XdiToDDk=; b=44GzXN7NakemuV8pl0E8XlhTnq
	BLBb8ugcaZmMxZ39U0hyMTuDWGLYJXFag9X77EGhMD44NC1wADbIckpgQtcXUPbXXqXX7EHYF1x9v
	8A2TV23itV2qreeqQlaJiGqAT9epAMhGZ/5+AX0tKRCIMm/kNWblk1SH/sREDC7/zvV1/AoKaSIv5
	VfpC45wa0f0UTLlqAJFcSx5VQLM2/tMrlbeOlM/koJxhcT+5TwryG+arEejPf9EmsQrVhQVbtnLGF
	uMUlZZuQyju1JGaCtpTvcMeSCR5n//JfjzA59bLdly/cnYmYRwFruY4bWIHC/R2WrJcBP7ZKLurX5
	CW9S0evQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wS9jU-00000003YGg-0CtN;
	Wed, 27 May 2026 08:35:20 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wS9jR-00000003YGL-3sfM
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 May 2026 08:35:19 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id EB1D341A2F;
	Wed, 27 May 2026 08:35:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D5EC1F000E9;
	Wed, 27 May 2026 08:35:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779870916;
	bh=M06HIPdd2IUezENrjzGwyWPgmEB4K4h1Br8XdiToDDk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=dgQaaD4TJmo17ETVT65PojO6wY0EUG/abrhQ4Xvi9TA5ZVx/NSC2gr5iSuhMsGm9q
	 vW6tQHRnkTYGJHNeQe7A4iJNzr6rQQnA94UTMequsmN8qsPzTupHX5wbM/naO81/w6
	 gh8uDAA2V7Luz4Y9mpjhPr5YJLOtRC0aIaOVpf5xdIZamc7av7JeEZta6SZyZymx/n
	 MHXnkAfbEB46domYvF2B4pW3uM30q4mel4wk6UHjmFzvjEvOdM1NMIEeXP+TFB7l7Q
	 dXWFoTEdjD+wJXFow0Pi8qqjf8MP1X2U3HJk3hAxDeiEzqJd8PwhiX1bA17ql93bFx
	 11Z6RSE9SGHZA==
Date: Wed, 27 May 2026 10:35:13 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Frank Li <frank.li@nxp.com>, Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, imx@lists.linux.dev, 
	linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, Guoniu Zhou <guoniu.zhou@nxp.com>
Subject: Re: [PATCH v9 1/3] dt-bindings: clock: imx95-blk-ctl: Allow child
 nodes
Message-ID: <20260527-simple-nice-mole-99c909@quoll>
References: <20260526-csi_formatter-v9-0-ca3d8c334c39@oss.nxp.com>
 <20260526-csi_formatter-v9-1-ca3d8c334c39@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260526-csi_formatter-v9-1-ca3d8c334c39@oss.nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260527_013517_986352_3E6BD7E6 
X-CRM114-Status: GOOD (  17.20  )
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

On Tue, May 26, 2026 at 04:57:20PM +0800, Guoniu Zhou wrote:
> Add support for child nodes in the imx95-blk-ctl binding to match
> the driver implementation which calls devm_of_platform_populate().

This is a new device, not a legacy, so you do not have exception to
document things post factum.

> 
> Add #address-cells, #size-cells properties and patternProperties
> to allow child device nodes with their own bindings.
> 
> Signed-off-by: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
> ---
> Changes in v9:
> - New patch to address the issue of formatter acting as a child node of syscon
> ---
>  .../devicetree/bindings/clock/nxp,imx95-blk-ctl.yaml          | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/clock/nxp,imx95-blk-ctl.yaml b/Documentation/devicetree/bindings/clock/nxp,imx95-blk-ctl.yaml
> index 27403b4c52d6..33ad1c15cc9c 100644
> --- a/Documentation/devicetree/bindings/clock/nxp,imx95-blk-ctl.yaml
> +++ b/Documentation/devicetree/bindings/clock/nxp,imx95-blk-ctl.yaml
> @@ -39,6 +39,17 @@ properties:
>        ID in its "clocks" phandle cell. See
>        include/dt-bindings/clock/nxp,imx95-clock.h
>  
> +  '#address-cells':

Use consistent quotes, either ' or "

> +    const: 1
> +
> +  '#size-cells':
> +    const: 1
> +
> +patternProperties:
> +  "^.*@[0-9a-f]+$":
> +    type: object
> +    description: Child nodes with their own bindings

No, you need SPECIFIC children listed here.

Also, description is completely redundant. You did not say anything
useful here.

Best regards,
Krzysztof


