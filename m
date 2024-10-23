Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5539CDDE71
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Oct 2024 11:47:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=suD+I1uOfuHNMxA5PW7DafR7un1EK/FadvfnxGu4/JU=; b=T8O1woTUEAAiY9PjkbXspTg+W6
	YXblNy05Tz6Yn/jiEfmMB/hLCKXUICABd6V8BcK0u6+ptxh/3janB89ViPX0rOdmQ1OKLptqxZBtR
	QZG7bCKp7hVwA+v174h089FL7qUxE5iSU1eIH8Ox9PHYQ+xq5vQ8eDJTPLGAO1MbK8Z2QSihA97cb
	o5QJfEwyDeovG+WmB5JZ5CDs2WhPlyYNlZSbku/BWc8p/rLjmdephVOD2Jbmfl+Y8oE1a6/OWw0Hz
	IonBAN9rgaJtcF+E9oL37kglIWrrGrCTZo9OLF1PWxcWJieqQ9Q7BiBk4tkDkCbyD7YmudX5wPY9c
	hAtzausw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3Zpv-0000000ECZy-2Ajy;
	Wed, 23 Oct 2024 11:47:35 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3ZCo-0000000E5Xb-0dH6;
	Wed, 23 Oct 2024 11:07:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1729681628;
	bh=jJv8pUshfT4apsQOdjQNUHnCdLbsPstTncS3AsjLstA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=aC+24G6ja6hENxZJQEW2Cvmejdh47ef2CmrATu9x95xSygdVjmmvb15RkcJKtXGse
	 4xr7G/UEPiPb+7ycQckrd3P7NKRsze7KUWYZvWLmebtBl4I9teM7aK6ctzG8J5auR/
	 7a/sbVvyuqdlaXVSsx1C6cctkk3Ff+ixka1gfAF9PHZ4HaQCxQ2MqV/i2yTc8J608b
	 gPMt01CJ+XnQlBmc5u0Du2Ku+c7NnyePYj2WIyluXODjcrGWPIOkf+nsGxYnxhuTvA
	 RH4HO7u8qALsxeVuu+4jg90gZWv72fe2Yoj7VsJmDU/K7TDtxwDiDdAYS533ZZBa6T
	 CLTG6HFgwNgbA==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id DE4ED17E1543;
	Wed, 23 Oct 2024 13:07:07 +0200 (CEST)
Message-ID: <0cc68449-a11d-466c-b89d-067b1c2fd7e0@collabora.com>
Date: Wed, 23 Oct 2024 13:07:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] arm64: dts: mediatek: mt8395-genio-1200-evk: add
 support for MUX IT5205
To: Macpaul Lin <macpaul.lin@mediatek.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Alexandre Mergnat <amergnat@baylibre.com>
Cc: Bear Wang <bear.wang@mediatek.com>, Pablo Sun <pablo.sun@mediatek.com>,
 Macpaul Lin <macpaul@gmail.com>,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-usb@vger.kernel.org, Chris-qj chen <chris-qj.chen@mediatek.com>,
 Fabien Parent <fparent@baylibre.com>, Simon Sun <simon.sun@yunjingtech.com>
References: <20241023080912.15349-1-macpaul.lin@mediatek.com>
 <20241023080912.15349-2-macpaul.lin@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20241023080912.15349-2-macpaul.lin@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241023_040710_372703_D5F35E32 
X-CRM114-Status: GOOD (  14.96  )
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

Il 23/10/24 10:09, Macpaul Lin ha scritto:
> Add ITE IT5205FN (TYPEC MUX) under I2C2 bus and configure its properties;
> also add references to it5205fn from MT6360 TYPE-C connector for TYPEC
> configuration.
> 
> Signed-off-by: Fabien Parent <fparent@baylibre.com>
> Signed-off-by: Simon Sun <simon.sun@yunjingtech.com>
> Signed-off-by: Macpaul Lin <macpaul.lin@mediatek.com>
> ---
>   .../dts/mediatek/mt8395-genio-1200-evk.dts    | 22 +++++++++++++++++++
>   1 file changed, 22 insertions(+)
> 
> Changes for v2:
>   - This is a new patch in the v2 patch.
> 
> Changes for v3:
>   - No change.
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk.dts b/arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk.dts
> index 83d520226302..4c11c100e7b6 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk.dts
> +++ b/arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk.dts
> @@ -229,6 +229,21 @@ &i2c2 {
>   	pinctrl-0 = <&i2c2_pins>;
>   	pinctrl-names = "default";
>   	status = "okay";
> +
> +	it5205fn: typec-mux@48 {

You don't need the it5205fn phandle, please drop.

> +		compatible = "ite,it5205";
> +		reg = <0x48>;
> +		vcc-supply = <&mt6359_vibr_ldo_reg>;
> +		mode-switch;
> +		orientation-switch;

compatible
reg
mode-switch
orientation-switch
vcc-supply

Please reorder.

After which:

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

> +		status = "okay";
> +
> +		port {
> +			it5205_sbu_ep: endpoint {
> +				remote-endpoint = <&mt6360_ssusb_sbu_ep>;
> +			};
> +		};
> +	};
>   };
>   
>   &i2c6 {
> @@ -369,6 +384,13 @@ mt6360_ssusb_ep: endpoint {
>   							remote-endpoint = <&ssusb_ep>;
>   						};
>   					};
> +
> +					port@2 {
> +						reg = <2>;
> +						mt6360_ssusb_sbu_ep: endpoint {
> +							remote-endpoint = <&it5205_sbu_ep>;
> +						};
> +					};
>   				};
>   			};
>   		};



