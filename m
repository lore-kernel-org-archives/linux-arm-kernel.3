Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73216E6F085
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 Nov 2024 19:57:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BU2dlaLYTdn+AiPbIFiopLQVrAVxR/65SblBI4H3FlA=; b=UtJgCfSwflVOlkGAB4gqPzKwRY
	3E5YpZY4l+XG1YGsI0Wwy33XBMEqrG3omQFT7UWM11VtheycOagmHi5Avqlf3v0UO0L+JzOl+vQvO
	s1vczvxFtiF1XtPq+hYPVqNTHLOKEKkrg+kFx76VQ93bcKd/Gwd3cABgN5d6cFy3Y9Ys6U1G9YChH
	dFZjnEB/WbHX8XyNJwCqs5NEx5CTSHTOZPNey1vPixWSQKiI6ehljyGnsjRygd3frQ7dk9PoEKH4g
	TkR0GFkrmrscecW/DH4vOYrpE37+/YHLt1gype6Jj4WJk8DleIbBfrkPObkwHx0JriAEkg8jt2vCT
	Q8ZWEUbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6xlx-00000008CNY-0Zx9;
	Fri, 01 Nov 2024 19:57:29 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6xkH-00000008CBo-1hb8
	for linux-arm-kernel@lists.infradead.org;
	Fri, 01 Nov 2024 19:55:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id BC5C95C0394;
	Fri,  1 Nov 2024 19:54:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED113C4CECE;
	Fri,  1 Nov 2024 19:55:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730490944;
	bh=5P1Ty7aGq24JHAxPk7/IiX2eHffnbz10gXZws+6PBo8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Xr8Wufq9qLFkuNMXElQveX2JfrYDAi/0glxdgmrAxKVJSVGxKN/ADWrRQibXHNYEy
	 a5zzKFOlGLC7UWbHK1wF6PooQ80w7cMoDxJtHL7gCB8v7z313p1J26BwU5ljGpnoZv
	 SpdaZzVqSFrNhUzyt8HpbvGYsu/rqHeItiPX/mXcZT0KqMMotvAMLwr0PFksqnCexz
	 hSpZVojpbQdo7eFVr9yx9pZZDOPmn+ngftf88iEZ/iARr5RO5YnKTvceSp58NzJ7F0
	 X6p0YgfPH2QPcf1kG64ra5DeZhxqRlP3qukaCsdiOkuSG7Jr+CINobrzjA6SauoVnC
	 +eJb8R+AN4cLQ==
Date: Fri, 1 Nov 2024 14:55:42 -0500
From: Rob Herring <robh@kernel.org>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2 resend] dt-bindings: firmware: imx95-scmi: Allow
 linux,code for protocol@81
Message-ID: <20241101195542.GA4090248-robh@kernel.org>
References: <20241030095555.222143-1-alexander.stein@ew.tq-group.com>
 <20241030095555.222143-2-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241030095555.222143-2-alexander.stein@ew.tq-group.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241101_125545_508607_339A14CE 
X-CRM114-Status: GOOD (  18.48  )
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

On Wed, Oct 30, 2024 at 10:55:52AM +0100, Alexander Stein wrote:
> BBM protocol supports a single power button, supported by driver
> imx-sm-bbm-key.c. By default this is KEY_POWER, but can also be overwritten
> using linux,code. Add a reference to this schema and add linux,code as a
> supported property.
> 
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> ---
> Admittedly, I'm not sure if this is the correct way of referencing the
> linux,code from input.yaml.
> 
>  .../devicetree/bindings/firmware/nxp,imx95-scmi.yaml     | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/firmware/nxp,imx95-scmi.yaml b/Documentation/devicetree/bindings/firmware/nxp,imx95-scmi.yaml
> index 1a95010a546b1..112c3a3eb1980 100644
> --- a/Documentation/devicetree/bindings/firmware/nxp,imx95-scmi.yaml
> +++ b/Documentation/devicetree/bindings/firmware/nxp,imx95-scmi.yaml
> @@ -12,13 +12,18 @@ maintainers:
>  
>  properties:
>    protocol@81:
> -    $ref: '/schemas/firmware/arm,scmi.yaml#/$defs/protocol-node'
> -    unevaluatedProperties: false
> +    type: object
> +    allOf:
> +      - $ref: '/schemas/firmware/arm,scmi.yaml#/$defs/protocol-node'
> +      - $ref: /schemas/input/input.yaml#
> +    additionalProperties: false
>  
>      properties:
>        reg:
>          const: 0x81
>  
> +      linux,code: true

default: ??

> +
>    protocol@84:
>      $ref: '/schemas/firmware/arm,scmi.yaml#/$defs/protocol-node'
>      unevaluatedProperties: false
> -- 
> 2.34.1
> 

