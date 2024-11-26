Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99E00D3B986
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 Nov 2024 11:36:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NRR7eZT3qlgrV3OL1zUPKguoij6kyz5tGLaT+9t1+K0=; b=qYbdf9P4oVwOKy+k4/8GeE06aQ
	E3au7JzGdGVdWtmNMm8tpGw7InXQFBBGXQp7VYAgnPkNjCyEf4YWiUSalfwmbbQx2zCq5s95yLfF7
	oVI9xKf64H6iPO275zyJzAHS2D6O/5uLQRvqMSuUflTdDRaBmWvmZ22mTD5cSLDTPM3W8ACe1EnUk
	dQMYxxY7pLdIv/cYS94CmlFOsMPR7aMgBE0tLEUkiRf3zYjrLla2uKK+IfnzmAXGwLg3knuy0oElj
	gJsUJ7F1pTk5mfRPbvxhu5J7kmdGq0wDuQuKrYKebFVu9qXqLSOEB2IeUGIQGVjXDea28yM+kUYcU
	V9oFmyfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFts0-0000000AQRO-2VhN;
	Tue, 26 Nov 2024 11:36:40 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tFtqp-0000000AQBe-3RoX;
	Tue, 26 Nov 2024 11:35:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1732620925;
	bh=CV+EAh560LJIoimDrOBgkVVzf9cbXH8VFS1iu4pNypc=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=BnJSnDeD2UWN82nsol4KcZwcYGcKpTLWn5VI0kfzd46qp7ZJltWhoiJBn+q7Wx/98
	 bsPB7usIlFjU9YhgPIhjsEcJnzNX8mR4HFm70dm/3nz3WP1MfyB2wX9c5cOSpO/W6s
	 Qb8j4amAmvPIBQhX+W8dnlF7yGuWoiuPGJM2cqyiZy798ZC4pyEOdcpjSTgRngPGua
	 hQq6i+fwon3/Eu9kYfCZR6psQFPGJUGQTa5Ivs2k3RNknJL9N3xUsrXs49gvHN70Zp
	 TluYai6VaROKZmWxY7A3pYvWZCZCAw0kDNcSK1vA8rdUbZLhTZN01LYFpMT//kJGPK
	 GNbXq3Rg4rPgg==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id C4E9317E3625;
	Tue, 26 Nov 2024 12:35:24 +0100 (CET)
Message-ID: <3e485c19-7298-47ab-a2a7-dd94a7ac1a7c@collabora.com>
Date: Tue, 26 Nov 2024 12:35:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] dt-bindings: arm: mediatek: Add MT8186 Starmie
 Chromebooks
To: Wojciech Macek <wmacek@chromium.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Chen-Yu Tsai <wenst@chromium.org>, Rafal Milecki <rafal@milecki.pl>,
 Hsin-Yi Wang <hsinyi@chromium.org>, Sean Wang <sean.wang@mediatek.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20241126103632.419469-1-wmacek@chromium.org>
 <20241126103632.419469-2-wmacek@chromium.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20241126103632.419469-2-wmacek@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241126_033528_038522_6455381E 
X-CRM114-Status: GOOD (  13.34  )
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

Il 26/11/24 11:36, Wojciech Macek ha scritto:
> Add an entry for the MT8186 based Starmie Chromebooks, also known as the
> ASUS Chromebook Enterprise CM30 Detachable (CM3001). The device is
> a tablet style chromebook.
> 
> Signed-off-by: Wojciech Macek <wmacek@chromium.org>
> ---
> Changelog v3-v2:
>   - No changes

Why have you dropped by R-b tag if there's no change here?

Regards,
Angelo

> Changelog v2-v1:
>   - Fixed items/const bidings description in mediatek.yaml
> 
>   Documentation/devicetree/bindings/arm/mediatek.yaml | 13 +++++++++++++
>   1 file changed, 13 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/mediatek.yaml b/Documentation/devicetree/bindings/arm/mediatek.yaml
> index 1d4bb50fcd8d..6191a5320c14 100644
> --- a/Documentation/devicetree/bindings/arm/mediatek.yaml
> +++ b/Documentation/devicetree/bindings/arm/mediatek.yaml
> @@ -263,6 +263,19 @@ properties:
>             - const: google,steelix-sku196608
>             - const: google,steelix
>             - const: mediatek,mt8186
> +      - description: Google Starmie (ASUS Chromebook Enterprise CM30 (CM3001))
> +        items:
> +          - const: google,starmie-sku0
> +          - const: google,starmie-sku2
> +          - const: google,starmie-sku3
> +          - const: google,starmie
> +          - const: mediatek,mt8186
> +      - description: Google Starmie (ASUS Chromebook Enterprise CM30 (CM3001))
> +        items:
> +          - const: google,starmie-sku1
> +          - const: google,starmie-sku4
> +          - const: google,starmie
> +          - const: mediatek,mt8186
>         - description: Google Steelix (Lenovo 300e Yoga Chromebook Gen 4)
>           items:
>             - enum:



