Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74FD3C369BA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Apr 2025 18:48:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qLWj834pnO4HucxhGHrRyn7kR+7xSKKrFw8uSmOQ0WQ=; b=LkRAXlpbogeZwG1ZrFpeX6Labl
	UgPIy7VHS25fY2n+2t+wFteCZuf2m64T3nSo8KZ7BQRiHTj6nTmhCaWgHDqtpAoWiW2J4kW/lwG0o
	bNMR0N0tOjSw3nue4HXNLMg9aqk6iEsZMrgR4GQlAjaRTqUJwIBOIHIRs2Hgp5VSfU9/VYRokauer
	WdOCcvW0H4A0ji5Yh4/UG6ZRoUKrK2852gJUOrq+AHlZDBRL2jgJrAgN/d4MiNkmhvfZM14SfHhGm
	V8j0a2YhoHqBEz7p1f4iD60sHLl4nItGWwHTHoK2HI+vj5/63io1iZy3YTEOjq8QmnuhUWUYDcba4
	DQR6hcYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u57oO-0000000AbvM-3AoC;
	Wed, 16 Apr 2025 18:48:40 +0000
Received: from mout.gmx.net ([212.227.15.19])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u57mX-0000000Aboq-3HLW
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Apr 2025 18:46:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1744829201; x=1745434001; i=wahrenst@gmx.net;
	bh=qLWj834pnO4HucxhGHrRyn7kR+7xSKKrFw8uSmOQ0WQ=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=kptTydNh7IsT2g7COMKcTAt59w+UDfbY7CaiRcsKgvY7AbjCSlmX/E1HyRGr7XHF
	 c+o6sBsbae3PABNeZIgSUFOty9y0ey2Z6Bg+8OWGjnew/dGNsETY3N9NdBmueM38e
	 IVAuVdqpiEfrg9yQxEAWlTXBcCIAgAS7XoIaQmNcSpwGwAyYEpD6v1MVg2kl52fcm
	 yH/ilHvly2/j1O/Uqo2Wi7iSr+GVGTi3V7dEkYdbOYDkpMrB5HBGMfKAsLWePsZQ+
	 pSh8Z2arVNEASN5sNhNwEX05F1Qramh0Cq+FSyZoZFwiNWTKJuYwCaGJCm9VnFRNG
	 6uQ3fstw81n0KQp+GQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.1.107] ([37.4.251.153]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MsYv3-1tB5Ny2QA7-014tYH; Wed, 16
 Apr 2025 20:46:41 +0200
Message-ID: <bc818477-509d-4561-905a-743feeea6a74@gmx.net>
Date: Wed, 16 Apr 2025 20:46:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [net-next v5 1/6] dt-bindings: net: Add MTIP L2 switch
 description
To: Lukasz Majewski <lukma@denx.de>, Andrew Lunn <andrew+netdev@lunn.ch>,
 davem@davemloft.net, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>
Cc: Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>,
 Richard Cochran <richardcochran@gmail.com>, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 Simon Horman <horms@kernel.org>
References: <20250414140128.390400-1-lukma@denx.de>
 <20250414140128.390400-2-lukma@denx.de>
Content-Language: en-US
From: Stefan Wahren <wahrenst@gmx.net>
Autocrypt: addr=wahrenst@gmx.net; keydata=
 xjMEZ1dOJBYJKwYBBAHaRw8BAQdA7H2MMG3q8FV7kAPko5vOAeaa4UA1I0hMgga1j5iYTTvN
 IFN0ZWZhbiBXYWhyZW4gPHdhaHJlbnN0QGdteC5uZXQ+wo8EExYIADcWIQT3FXg+ApsOhPDN
 NNFuwvLLwiAwigUCZ1dOJAUJB4TOAAIbAwQLCQgHBRUICQoLBRYCAwEAAAoJEG7C8svCIDCK
 JQ4BAP4Y9uuHAxbAhHSQf6UZ+hl5BDznsZVBJvH8cZe2dSZ6AQCNgoc1Lxw1tvPscuC1Jd1C
 TZomrGfQI47OiiJ3vGktBc44BGdXTiQSCisGAQQBl1UBBQEBB0B5M0B2E2XxySUQhU6emMYx
 f5QR/BrEK0hs3bLT6Hb9WgMBCAfCfgQYFggAJhYhBPcVeD4Cmw6E8M000W7C8svCIDCKBQJn
 V04kBQkHhM4AAhsMAAoJEG7C8svCIDCKJxoA/i+kqD5bphZEucrJHw77ujnOQbiKY2rLb0pE
 aHMQoiECAQDVbj827W1Yai/0XEABIr8Ci6a+/qZ8Vz6MZzL5GJosAA==
In-Reply-To: <20250414140128.390400-2-lukma@denx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:yIJVMSosfR0X948puKa1FTQoiBsFSBleSPrxxwC7IkCnn453it8
 tfJJHGInT3jzk3q0d7bz8f8Yck4uQ4j3q8/v+Jm1Ohes7CWpWdL6u6GJGOxFwmBPeqZfWs7
 ovdjrTVMlgVvb0vqCsLLdGK6WPIycwXrQwPNqntyDhvXCHn5vWD6OOf80YwDU6sXk4alrcv
 TR78ajNLgYQ1bMnpti0hg==
UI-OutboundReport: notjunk:1;M01:P0:2tIcx4q1Ii8=;2Tgjd/wNrtGfBT6RdSHM3maCjip
 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
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250416_114646_126706_A99C14A2 
X-CRM114-Status: GOOD (  18.59  )
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

Hi Lukasz,

Am 14.04.25 um 16:01 schrieb Lukasz Majewski:
> This patch provides description of the MTIP L2 switch available in some
> NXP's SOCs - e.g. imx287.
>
> Signed-off-by: Lukasz Majewski <lukma@denx.de>
> ---
> Changes for v2:
> - Rename the file to match exactly the compatible
>    (nxp,imx287-mtip-switch)
>
> Changes for v3:
> - Remove '-' from const:'nxp,imx287-mtip-switch'
> - Use '^port@[12]+$' for port patternProperties
> - Drop status =3D "okay";
> - Provide proper indentation for 'example' binding (replace 8
>    spaces with 4 spaces)
> - Remove smsc,disable-energy-detect; property
> - Remove interrupt-parent and interrupts properties as not required
> - Remove #address-cells and #size-cells from required properties check
> - remove description from reg:
> - Add $ref: ethernet-switch.yaml#
>
> Changes for v4:
> - Use $ref: ethernet-switch.yaml#/$defs/ethernet-ports and remove alread=
y
>    referenced properties
> - Rename file to nxp,imx28-mtip-switch.yaml
>
> Changes for v5:
> - Provide proper description for 'ethernet-port' node
> ---
>   .../bindings/net/nxp,imx28-mtip-switch.yaml   | 141 ++++++++++++++++++
>   1 file changed, 141 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/net/nxp,imx28-mti=
p-switch.yaml
>
> diff --git a/Documentation/devicetree/bindings/net/nxp,imx28-mtip-switch=
.yaml b/Documentation/devicetree/bindings/net/nxp,imx28-mtip-switch.yaml
> new file mode 100644
> index 000000000000..6f2b5a277ac2
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/net/nxp,imx28-mtip-switch.yaml
> @@ -0,0 +1,141 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/net/nxp,imx28-mtip-switch.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: NXP SoC Ethernet Switch Controller (L2 MoreThanIP switch)
> +
> +maintainers:
> +  - Lukasz Majewski <lukma@denx.de>
> +
> +description:
> +  The 2-port switch ethernet subsystem provides ethernet packet (L2)
> +  communication and can be configured as an ethernet switch. It provide=
s the
> +  reduced media independent interface (RMII), the management data input
> +  output (MDIO) for physical layer device (PHY) management.
> +
> +$ref: ethernet-switch.yaml#/$defs/ethernet-ports
> +
> +properties:
> +  compatible:
> +    const: nxp,imx28-mtip-switch
> +
> +  reg:
> +    maxItems: 1
> +
> +  phy-supply:
> +    description:
> +      Regulator that powers Ethernet PHYs.
> +
> +  clocks:
> +    items:
> +      - description: Register accessing clock
> +      - description: Bus access clock
> +      - description: Output clock for external device - e.g. PHY source=
 clock
> +      - description: IEEE1588 timer clock
> +
> +  clock-names:
> +    items:
> +      - const: ipg
> +      - const: ahb
> +      - const: enet_out
> +      - const: ptp
> +
> +  interrupts:
> +    items:
> +      - description: Switch interrupt
> +      - description: ENET0 interrupt
> +      - description: ENET1 interrupt
sorry for the late suggestion, but can we have additional=20
interrupt-names here, please?

