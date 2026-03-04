Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 655E8EB7EB8
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Mar 2026 10:14:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4UJB5Tef4Xa9EPz7ddJaJCyEjLF4LufxiJyl/vDD5jg=; b=VjzmX8UI6iNvTfhR+7pRBkqqT3
	599VEGeL4Q0yctdBth4LDMllih9pTL3tteRUY7iS8abzKNJOxL8w5Fn6SAiYXXuf0kMf7SqSaUWgq
	G1PTwcXVpx8ICVunxtpLELfIe3TiXHSCx4e/J4gt9T2ecH9N3xlpQjMRBWKqsCESf9Aj/uU9qa772
	gxhfg/sAGIReBY9yUKBK20no0WQzACuL0UxLB3JsIB8bLD0ALywV/x8ybTHy82Y9yzbwHbrXdK29a
	7yCWjdl0gxwvFMjZFIeJmHgfQP+8J/XVgZtEIdlRKVxSYxvoLQHXVpwEu2JPhM1gcE7nFjw68O6Yo
	cGFnZmdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxjFI-0000000Gxai-0aQ9;
	Wed, 04 Mar 2026 10:14:24 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxjFF-0000000GxZs-0Z8o
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Mar 2026 10:14:22 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 9BEEA4E42539;
	Wed,  4 Mar 2026 10:14:18 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 6F0655FF5C;
	Wed,  4 Mar 2026 10:14:18 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 7C169103685F1;
	Wed,  4 Mar 2026 11:14:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1772619256; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=4UJB5Tef4Xa9EPz7ddJaJCyEjLF4LufxiJyl/vDD5jg=;
	b=B/fv+zkYhgUMX/YSdxnpxySN1eY9IVSqPBwvk+7Jk/y4L89Diiyi2gNmuiuUXZF8oG3ABu
	leSag3vgWeKHqqglNWPEKXKEg9IH5fvb2/msgpQpFXrLJ8ovugh7lSPdR+K+0p5iTBQgJb
	eCzNrv5jp7cWDwefB+fsTevUgg6VCM91lIzD0AnmDzXQaQ3myCErTR9oF0kDmMO1N3NFOD
	MKowduDmUe3FsOat4B0Z1uB6evRtNc3y2JcqKXA0IbP3rVUMdr27mRABfMnQzdb1AxKbVm
	CadNpF57ZMKmEwa0MvO/Z+pPe6kJyIK6ufJFtAJe2lD4vj2PvsUfPYVAM1M5Bg==
Message-ID: <4a073736-9caf-4973-b7ad-a482d63bb672@bootlin.com>
Date: Wed, 4 Mar 2026 11:14:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 1/2] dt-bindings: net: Add support for Airoha
 AN8801/R GbE PHY
To: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
 Russell King <linux@armlinux.org.uk>
Cc: kevin-kw.huang@airoha.com, macpaul.lin@mediatek.com,
 matthias.bgg@gmail.com, kernel@collabora.com, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260304-add-airoha-an8801-support-v1-0-0ae4ee5a2f9d@collabora.com>
 <20260304-add-airoha-an8801-support-v1-1-0ae4ee5a2f9d@collabora.com>
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
Content-Language: en-US
In-Reply-To: <20260304-add-airoha-an8801-support-v1-1-0ae4ee5a2f9d@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260304_021421_302185_E05060DE 
X-CRM114-Status: GOOD (  16.36  )
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

Hi Louis-Alexis,

On 04/03/2026 10:35, Louis-Alexis Eyraud wrote:
> From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> 
> Add a new binding to support the Airoha AN8801R Series Gigabit
> Ethernet PHY.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
> ---
>  .../devicetree/bindings/net/airoha,an8801.yaml     | 81 ++++++++++++++++++++++
>  1 file changed, 81 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/net/airoha,an8801.yaml b/Documentation/devicetree/bindings/net/airoha,an8801.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..f251c9d2fbbed3675c9fd7ff22174049a13a7b5e
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/net/airoha,an8801.yaml
> @@ -0,0 +1,81 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/net/airoha,an8801.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Airoha AN8801R Series PHY
> +
> +maintainers:
> +  - AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> +
> +description:
> +  The Airoha AN8801R is a low power single-port Ethernet PHY Transceiver
> +  with Single-port serdes interface for 1000Base-X/RGMII; this chip is
> +  compliant with 10Base-T, 100Base-TX and 1000Base-T IEEE 802.3(u,ab)
> +  and supports Energy Efficient Ethernet (802.3az), Full Duplex Control
> +  Flow (802.3x), auto-negotiation, crossover detect and autocorrection,
> +  Wake-on-LAN with Magic Packet, and Jumbo Frame up to 9 Kilobytes.
> +  This PHY also supports up to three user-configurable LEDs, which are
> +  usually used for LAN Activity, 100M, 1000M indication.
> +
> +allOf:
> +  - $ref: ethernet-phy.yaml#
> +
> +properties:
> +  compatible:
> +    enum:
> +      - ethernet-phy-idc0ff.0421
> +
> +  reg:
> +    maxItems: 1
> +
> +  leds: true
> +
> +required:
> +  - reg
> +  - leds

Seems odd to me that leds are required. Any reason for that ?

Maxime


