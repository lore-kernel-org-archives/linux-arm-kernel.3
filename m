Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BACAFD63931
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Nov 2024 11:57:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9PkBYhPUMCLmM5xQncyQLo+ZnGoUkZscpRH9k9tcNOc=; b=snB3F6TuuHlkQ8NPK08DIirzCF
	07bbpxZefcdAHpyn+X3eBCbWEpG2JwuruERlubgwK7K+seI5aDr1S65OUeX98AI3MJEjM/8nsqSS4
	X0HxBXQjomzIY+c75ZPHwcLtm+3qVx4JQmI1ftzhKrRqJI1uBOwmR5SAudytbGtfsNV6GPUAv70ee
	OkfQ+1jQ57Om0eJzNErKWoXdVmeIvBnyX0BLkC3WEBGvd3b/VGcWmerr/C6S36tCA5n1k/sTq1hqK
	lRZJj1Ry94TGxmamXay3C6oBLXwdwUsZ0j2j6UDuOTP8R9mc7vnnswVTpwWpAJjGTTvo3rEuEc9GR
	6/Gj57Uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDjKC-0000000FF5d-2mkm;
	Wed, 20 Nov 2024 11:56:48 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tDjJF-0000000FEym-3f8b;
	Wed, 20 Nov 2024 11:55:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1732103747;
	bh=LKKBBEfzE2cUMCjgNuOL1nYgkM/Aqi5ZPzy8Ibang1w=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=EHLA8DMg8yHXcCZHC1W/0qb5Gd5PgwuGQP4kztP6cAfyrDec5pQMq+e2rzxDFWWYK
	 BRy+2eZD0AHqu85dHUvMXdJD9IYjU8E+oFwH6QVZK3ubl5b7xWEW6oAOTJ0WYErzMT
	 USm50NxflDXbHnaQDvl7HVtt/0ncOBoJ66dTs0NJdXFaTzyPaiyvcZPn0jN5fD8IOm
	 5n2tS4TAXd4lHOz6UehGpFmtJoNjc4YORuFaSqxPAGez5dtIAnJeW/X5Gc/+6IwQYH
	 OL5568NmacG/oAEmZYgRn+U0Fn8V59UDqwkUhRTdJ2kh/+Vd/zRu5x8Iyh38gcYnbq
	 8Z7BG3v3lJjhQ==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id DFE3D17E3632;
	Wed, 20 Nov 2024 12:55:46 +0100 (CET)
Message-ID: <e1aa2b69-5c40-44a5-b0b5-2a262bcc72f3@collabora.com>
Date: Wed, 20 Nov 2024 12:55:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] dt-bindings: reset: mediatek: Add mt8188 SMI reset
 control binding
To: Friday Yang <friday.yang@mediatek.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20241120063305.8135-1-friday.yang@mediatek.com>
 <20241120063305.8135-2-friday.yang@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20241120063305.8135-2-friday.yang@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241120_035550_086891_A03DDBB4 
X-CRM114-Status: GOOD (  19.61  )
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

Il 20/11/24 07:32, Friday Yang ha scritto:
> From: "Friday Yang" <friday.yang@mediatek.com>
> 
> To support SMI clamp and reset operation in genpd callback, add
> SMI LARB reset controller in the bindings. Add index in
> mt8188-resets.h to query the reset signal in the SMI reset
> control driver.
> 
> Signed-off-by: Friday Yang <friday.yang@mediatek.com>
> ---
>   .../bindings/reset/mediatek,smi-reset.yaml    | 53 +++++++++++++++++++
>   include/dt-bindings/reset/mt8188-resets.h     | 11 ++++
>   2 files changed, 64 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/reset/mediatek,smi-reset.yaml
> 
> diff --git a/Documentation/devicetree/bindings/reset/mediatek,smi-reset.yaml b/Documentation/devicetree/bindings/reset/mediatek,smi-reset.yaml
> new file mode 100644
> index 000000000000..77a6197a9846
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/reset/mediatek,smi-reset.yaml
> @@ -0,0 +1,53 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +# Copyright (c) 2024 MediaTek Inc.
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/reset/mediatek,smi-reset.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: MediaTek SMI Reset Controller
> +
> +maintainers:
> +  - Friday Yang <friday.yang@mediatek.com>
> +
> +description: |
> +  This reset controller node is used to perform reset management
> +  of SMI larbs on MediaTek platform. It is used to implement various
> +  reset functions required when SMI larbs apply clamp operation.
> +
> +  For list of all valid reset indices see
> +    <dt-bindings/reset/mt8188-resets.h> for MT8188.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - mediatek,mt8188-smi-reset
> +
> +  "#reset-cells":
> +    const: 1
> +    description:
> +      The cell should be the device ID. SMI reset controller driver could
> +      query the reset signal of each SMI larb by device ID.
> +
> +  mediatek,larb-rst:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description:
> +      Phandle of each subsys clock controller. SMI larbs are located in
> +      these subsys. SMI needs to parse the node of each subsys clock
> +      controller to get the register address, and then apply the reset
> +      operation.
> +
> +required:
> +  - compatible
> +  - "#reset-cells"
> +  - mediatek,larb-rst
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    reset-controller {
> +        compatible = "mediatek,mt8188-smi-reset";
> +        #reset-cells = <1>;
> +        mediatek,larb-rst = <&imgsys1_dip_top>;

I don't understand why would you be unable to add the SMI resets to the already
currently supported reset code in the clock-controller driver itself, like done
with literally all of the other clock controllers.

Please clarify.

Regards,
Angelo


