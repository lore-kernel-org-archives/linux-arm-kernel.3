Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15BB0D3B7C1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 Nov 2024 08:53:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rsBgmXC8Lxt1vcy1ZFTWTQKcqqXKnK76ZqW0NYYxWpU=; b=147Gwbspt/ZuMZD5ZcHGy1UUOP
	/dCp3D0zDdZgHw6yZzilClp/N4hY8F/a781mfjEPim4GR1h/rQCmZnjEgFFTVVsQ+vJdsfOv5BYSt
	f8Ym000/nrdTlAj/KYbfhfOeLq51j13GAbJeY1CFlzLqAokPH9blModtwfHW7ZXc6LfK6vgpZPQ35
	CUdGmZetrLbE3RwP2negbnXxg+B2zrlq81RKEBTBjBvkN/TYkF25s0JrvdW7cZLGSZru/ZvCXpU3F
	pVO9IMQ6J15qzCsxsVczsDgYGS6E2OhLB+80smuxhzOFobz1Lxj0CQrTTL/r6Pxit8qQtZBjWGmQG
	7K6uelKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFrJd-0000000A0YO-1YxS;
	Tue, 26 Nov 2024 08:53:01 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tFrIg-0000000A0NK-0F5n;
	Tue, 26 Nov 2024 08:52:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1732611120;
	bh=ZNiXeKu3VMMs+mJ7Uwi6rVoXAummZLmskjT7q9ZCRRY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=UgSfkvuohiJ/eL0XEasFCiJVAiiPRbwOzbGyu6aUkpF5x2Hlo46RU8rF8X8wbUAMd
	 bAorUi1ky8OaHMZZ3WmJ/m6Zqx4KN3jDhE5d1dhRzEbtvSD0grHRlCh8z40IINJ/KF
	 0jMu4emeu5GM/bVZA38Xk2Hg6Y/0e/uxtvrcObaLdHs+H2CVDH5dHT5Hruk30HDQcZ
	 Ml4w9+BDleTqVxnxP5y0fCd8m428B+sbgLoA1omHdCG6v9nNP5K1S5tvuaEYWJyoV2
	 OPU4RHrISvl6sgIA79t6xor1PO+XzW6YOV7nuEmlEJy8uqIYWObBJQ6A80kWEsHZkY
	 Th/0Kia2KLO3Q==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id EB63117E1366;
	Tue, 26 Nov 2024 09:51:59 +0100 (CET)
Message-ID: <4901ecf5-8cd1-4d82-a240-f56794f46429@collabora.com>
Date: Tue, 26 Nov 2024 09:51:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: phy: mediatek,xsphy: add property to set
 disconnect threshold
To: Chunfeng Yun <chunfeng.yun@mediatek.com>, Vinod Koul <vkoul@kernel.org>,
 Rob Herring <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-phy@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20241126025859.29923-1-chunfeng.yun@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20241126025859.29923-1-chunfeng.yun@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241126_005202_244313_98B21275 
X-CRM114-Status: GOOD (  12.90  )
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

Il 26/11/24 03:58, Chunfeng Yun ha scritto:
> Add a property to tune usb2 phy's disconnect threshold.
> And add a compatible for mt8196.
> 

Is this a board-specific property? If so, can you please describe the reason?

Thanks,
Angelo

> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> ---
>   Documentation/devicetree/bindings/phy/mediatek,xsphy.yaml | 8 ++++++++
>   1 file changed, 8 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/phy/mediatek,xsphy.yaml b/Documentation/devicetree/bindings/phy/mediatek,xsphy.yaml
> index a9e3139fd421..2e012d5e1da1 100644
> --- a/Documentation/devicetree/bindings/phy/mediatek,xsphy.yaml
> +++ b/Documentation/devicetree/bindings/phy/mediatek,xsphy.yaml
> @@ -49,6 +49,7 @@ properties:
>         - enum:
>             - mediatek,mt3611-xsphy
>             - mediatek,mt3612-xsphy
> +          - mediatek,mt8196-xsphy
>         - const: mediatek,xsphy
>   
>     reg:
> @@ -129,6 +130,13 @@ patternProperties:
>           minimum: 1
>           maximum: 7
>   
> +      mediatek,discth:
> +        description:
> +          The selection of disconnect threshold (U2 phy)
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        minimum: 1
> +        maximum: 15
> +
>         mediatek,efuse-intr:
>           description:
>             The selection of Internal Resistor (U2/U3 phy)




