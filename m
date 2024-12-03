Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A981E6C61E
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Dec 2024 09:13:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rYhbEd+NbfV09OvNgbytP+A4ADOEcGDvdEqyFxz4cSw=; b=cqfbkJvUP1pUy7r9YwoyzZhgsr
	e1ubukFUOcALtsRzV+qoHktBMq1jeifBebrYlOeTPzHISz36JU7HTOCq5u+adWLC8KCXn9id2G+uB
	H2I/Ya1QjMHbogAfbPiyC9AK5VgWI4Rrt7hQVrsPUfjw3bnJEuwVsn7cxztZH+VPknn5I2qF9Wwzm
	Txbb+qpIkS+lV+BSkAzDcIeMfyKaSOoGR3zWNH0HS2BgqM+TfD7i91ab6RaWyKIYycxeBpqdy7mRv
	Vk2cP31Jx0a4sjUQ0yMKD/ObjIj04nvKcLdoXkQKSg4WfP+n5DemWPh/QDqYYcfTAe2v5WfYrucZ8
	wc62jSYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIOyS-00000008pYF-41pA;
	Tue, 03 Dec 2024 09:13:40 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIOuQ-00000008oWX-3CjY;
	Tue, 03 Dec 2024 09:09:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1733216969;
	bh=IEUB6/FeNi9MLZCmRFS4et5QKnXC5lPTq/3qhfvv080=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=KY36np5n2rInUb/hAO8z3V84UptGwrhykUTd5bYv8/sVe1nnet2m/3AyAVZfid4WB
	 Zxb6FmC3czxnpBG/IOLb33CSPnAeG438i3yk+j6PUe7Zc41ftjpAQdE9NB2j5JO/Bn
	 aC3jkEP3CoEVus42DkBzdPaEYj0xBFUgm9MoeKCW2KfA4LZIyUSWzwZMLA4H+KnMpI
	 Sr38XTQMUAq39/9diOlom0nify9BKotRPqG8jpln0ntbrupZLkqS133zhVha4Nz9Wf
	 kyMLUu+mWajIamWDM2L9kKzWUUDY5RJpFOx0rtqTS1QnG7gjnAt4aRLxZTvGFqmBeL
	 7kaTL8XXSRC/Q==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id D5BDB17E35CB;
	Tue,  3 Dec 2024 10:09:28 +0100 (CET)
Message-ID: <1666021a-6840-4bb4-b5e2-225a528302fa@collabora.com>
Date: Tue, 3 Dec 2024 10:09:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/4] dt-bindings: arm: mediatek: Add MT8186 Chinchou
 Chromebook
To: Zhengqiao Xia <xiazhengqiao@huaqin.corp-partner.google.com>,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 matthias.bgg@gmail.com, wenst@chromium.org, hsinyi@chromium.org,
 sean.wang@mediatek.com, dianders@google.com
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20241202032035.29045-1-xiazhengqiao@huaqin.corp-partner.google.com>
 <20241202032035.29045-2-xiazhengqiao@huaqin.corp-partner.google.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20241202032035.29045-2-xiazhengqiao@huaqin.corp-partner.google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241203_010930_951792_E36E0E2D 
X-CRM114-Status: GOOD (  12.14  )
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

Il 02/12/24 04:20, Zhengqiao Xia ha scritto:
> Add an entry for the MT8186 based Chinchou Chromebook, also known as the
> ASUS Chromebook CZ12 Flip (CZ1204F) and CZ12(CZ1204C).
> 
> Signed-off-by: Zhengqiao Xia <xiazhengqiao@huaqin.corp-partner.google.com>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>   .../devicetree/bindings/arm/mediatek.yaml     | 28 +++++++++++++++++++
>   1 file changed, 28 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/mediatek.yaml b/Documentation/devicetree/bindings/arm/mediatek.yaml
> index 1d4bb50fcd8d..3efab59b8a73 100644
> --- a/Documentation/devicetree/bindings/arm/mediatek.yaml
> +++ b/Documentation/devicetree/bindings/arm/mediatek.yaml
> @@ -239,6 +239,34 @@ properties:
>             - enum:
>                 - mediatek,mt8183-pumpkin
>             - const: mediatek,mt8183
> +      - description: Google Chinchou (Asus Chromebook CZ1104CM2A/CZ1204CM2A)
> +        items:
> +          - const: google,chinchou-sku0
> +          - const: google,chinchou-sku2
> +          - const: google,chinchou-sku4
> +          - const: google,chinchou-sku5
> +          - const: google,chinchou
> +          - const: mediatek,mt8186
> +      - description: Google Chinchou (Asus Chromebook CZ1104FM2A/CZ1204FM2A/CZ1104CM2A/CZ1204CM2A)
> +        items:
> +          - const: google,chinchou-sku1
> +          - const: google,chinchou-sku17
> +          - const: google,chinchou-sku3
> +          - const: google,chinchou-sku6
> +          - const: google,chinchou-sku7

Please move sku17 here to keep alphabetical order.
For consistency, please do the same in mt8186-corsola-chinchou-sku1.dts.

After which:

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

> +          - const: google,chinchou-sku20
> +          - const: google,chinchou-sku22
> +          - const: google,chinchou-sku23
> +          - const: google,chinchou
> +          - const: mediatek,mt8186
> +      - description: Google Chinchou360 (Asus Chromebook CZ1104FM2A/CZ1204FM2A Flip)
> +        items:
> +          - const: google,chinchou-sku16
> +          - const: google,chinchou-sku18
> +          - const: google,chinchou-sku19
> +          - const: google,chinchou-sku21
> +          - const: google,chinchou
> +          - const: mediatek,mt8186
>         - description: Google Magneton (Lenovo IdeaPad Slim 3 Chromebook (14M868))
>           items:
>             - const: google,steelix-sku393219




