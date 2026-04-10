Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85776F36BA3
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Apr 2026 02:57:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qi2vzw6d6HoQNG6KJH0rn7DomRDnizKqm/f1kSDuEl0=; b=RezbWuLThbjDsZbzGIrXQEIGKz
	nkxb2zaI9pGiwO+T7zqHWEZ08VCT8ZasDljEgVgoFB0GhjTC7O4BssFjyMHStog7CBhD4xukCMBnd
	V2M4QI8KRM4hxjcCQ4Eal2eTik6QfloA2fofMABJpWqs5OTGpRz7K7GQ1yViFYLrFp9etEgqu+Ivw
	QOokEIcPyodsNKcI/k3iwMnX2hlGtVPaD2DhXpDu0905zeTMgYPpCUhAA9tLXWQqAVi4gBD9+kM3Q
	1MF2qC2wszTwTHfe0QsPP/yctWcIKT5BnM0CBaAbbZFdDhw5XDxxD/XGp8Cbbl5+148BfoTbA2eoZ
	imdF13fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wB23f-0000000BUv6-0x64;
	Fri, 10 Apr 2026 02:57:23 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wB23e-0000000BUuh-0E1F;
	Fri, 10 Apr 2026 02:57:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 8762460103;
	Fri, 10 Apr 2026 02:57:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94145C4CEF7;
	Fri, 10 Apr 2026 02:57:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775789840;
	bh=IKf4EW+QLPbsa3En9V6h7KZYMgwrWGQkMLZPo2Qgp3c=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=NU+tNdyi5LDgN+hZ25/LSwm+Rp0G2W/mqL5UgeESus1izF9V0gMno1z3dyjqul9dG
	 WEjnCgxPoJAvEIfCFl7bM5Aj5EddhGwEZAxKcl9e3vaCBfjVcsGGd1nwKM47vuIf7y
	 Ly+69/lFfA9tnW7q4cKJz/l+TMGVE/ymaBQoem7vJO3EvJbgVEk3Th6dPYh0DTuqEC
	 QKVb3V5rvQ9DzqR2sGUuD3Wyl6rIMLTdPdTtv4TfDGquupFU+StIwt9xMWoTgFltOT
	 rd0S8fOHDCpM042wA+SVAaJGZXNlZ43CLujtOqiSOW61QGpGUT0W3GbFBHM3LlTdIc
	 ykHDPWjqElkDQ==
From: Jakub Kicinski <kuba@kernel.org>
To: lorenzo@kernel.org
Cc: Jakub Kicinski <kuba@kernel.org>,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	pabeni@redhat.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	ansuelsmth@gmail.com,
	benjamin.larsson@genexis.eu,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH net-next v3 01/12] dt-bindings: net: airoha: Add EN7581 ethernet-ports properties
Date: Thu,  9 Apr 2026 19:57:17 -0700
Message-ID: <20260410025717.1809904-1-kuba@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260406-airoha-eth-multi-serdes-v3-1-ab6ea49d59ff@kernel.org>
References: <20260406-airoha-eth-multi-serdes-v3-1-ab6ea49d59ff@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

This is an AI-generated review of your patch. The human sending this
email says "For your consideration."
---
dt-bindings: net: airoha: Add EN7581 ethernet-ports properties

This commit introduces the ethernet-port property to model a net_device
connected via an external arbiter to the GDM3 or GDM4 ports on EN7581
and AN7583 SoCs.

> diff --git a/Documentation/devicetree/bindings/net/airoha,en7581-eth.yaml b/Documentation/devicetree/bindings/net/airoha,en7581-eth.yaml
> index fbe2ddcdd909c..ebbd433e9c9fb 100644
> --- a/Documentation/devicetree/bindings/net/airoha,en7581-eth.yaml
> +++ b/Documentation/devicetree/bindings/net/airoha,en7581-eth.yaml
> @@ -130,6 +130,30 @@ patternProperties:
>          maximum: 4
>          description: GMAC port identifier
>  
> +      '#address-cells':
> +        const: 1
> +      '#size-cells':
> +        const: 0
> +
> +    patternProperties:
> +      "^ethernet-port@[0-5]$":

The commit message states that GDM1 and GDM2 do not support connection
with the external arbiter. However, since this pattern property appears to
be placed inside the generic ^ethernet@[1-4]$ block, does this allow a
device tree to incorrectly configure ethernet-port subnodes on ethernet@1
or ethernet@2 and still pass schema validation?

Could this be restricted to GDM3 and GDM4, perhaps by splitting the
patternProperties or using an if/then block based on the reg property?

> +        type: object
> +        unevaluatedProperties: false
> +        $ref: ethernet-controller.yaml#

Does referencing ethernet-controller.yaml cause a validation conflict here?

The ethernet-controller.yaml schema enforces a strict nodename pattern
of ^ethernet(@.*)?$. Since these new nodes use the -port suffix and are
named ethernet-port@X, will they unconditionally fail the node name
validation enforced by the referenced schema during dt_binding_check?

[ ... ]
-- 
pw-bot: cr

