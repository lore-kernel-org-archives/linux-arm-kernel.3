Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99563E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Dec 2024 10:00:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j/wEyKLCT0HaMsJ+hxZM/LeEs+/IglHvFCLylHtyUyo=; b=s90Tg82i3abpKDlG/d7/yC9Qy1
	oWDFYxBgkN31LXAUdzfBQZMlE010JigoQ1VTSlCEpbSfN5ofgLwhi2t4uNIbVxqHPGuAVnVCsaHAa
	9SNBOxgWlQNp2OUszgiOpWNLQGjcbm0VB6jgXF1mH7WMmouuaOTghWivmtCmqvoEfszObe3TO+dP8
	QqhuSrIzLe203yrBmRDzXIRSUgifsD4TyrOgFo+1S6hwZxWQ8+RcSaVhaD3wC8q6jkAtVL2Vapyod
	b8L9Gz5I/WecWxvd7RgT556B5TMFGcNcfaypbVWDyr4enQUC8B8eFynp/Nw1piYuCf8XML7gaiRp/
	kopWK5DA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLfzc-0000000HZxp-0Q3f;
	Thu, 12 Dec 2024 10:00:24 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLfwy-0000000HZYP-3n6B;
	Thu, 12 Dec 2024 09:57:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1733997459;
	bh=EIy2s9I6WHzZK3FvcYCQrjFobBckSkgRpj7z3oxitPY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=SPWr87xSoeMQkThh2m5MniNqFXTztuhtlzryUoPsCt5oYe33inIHYRG07sjoizb1q
	 ThsfiXhfZpF6ceHzcGos3xSdn+Yj7eT3RsRTZUHWN5cMBSKrzhjLIBfIvTYuWEpXOD
	 v44/+QOKyDUHtqgjKbz4RMzQZos97hbwE2jiwDPxefyECJhsiB8ZoXd8HQjj2IDl51
	 xXem6k62rPiL501890eYyzVVDK1B2lWYmTPpnbx9NBm3cvON4MCKeBC2YLIt9vLzpK
	 Dad5zOzAnV9HTQaH0TCUcluRKO+9ENDVpDFTcSIBiXsGDAg2VvLfDA280/C+nSLKi1
	 Vd0/H5vq5t4NQ==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 7F6C917E35F0;
	Thu, 12 Dec 2024 10:57:38 +0100 (CET)
Message-ID: <1b75d7ee-38d7-47fc-b7df-c46793a85036@collabora.com>
Date: Thu, 12 Dec 2024 10:57:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/8] arm64: dts: mediatek: Drop regulator-compatible
 property
To: Chen-Yu Tsai <wenst@chromium.org>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
Cc: devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20241211052427.4178367-1-wenst@chromium.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20241211052427.4178367-1-wenst@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241212_015741_093651_C3D6E41C 
X-CRM114-Status: GOOD (  12.60  )
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

Il 11/12/24 06:24, Chen-Yu Tsai ha scritto:
> Hi folks,
> 
> This series drops usage of the long deprecated "regulator-compatible"
> property from MediaTek device tree files. The property was introduced
> in 2012, and then subsequently deprecated after two months. It was
> never carried over during the binding YAML conversion.
> 
> Drop the property from the MT6315 regulator binding, and all MediaTek
> device tree files. IMO it should never have been used to begin with.
> This also gets rid of any validation errors [1] related to them.
> 
> Please have a look.
> 

Whole series is

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

> 
> Thanks
> ChenYu
> 
> [1] https://lore.kernel.org/all/173386568696.497617.3727087837255802552.robh@kernel.org/
> 
> Chen-Yu Tsai (8):
>    regulator: dt-bindings: mt6315: Drop regulator-compatible property
>    arm64: dts: mediatek: mt8173-evb: Drop regulator-compatible property
>    arm64: dts: mediatek: mt8173-elm: Drop regulator-compatible property
>    arm64: dts: mediatek: mt8192-asurada: Drop regulator-compatible
>      property
>    arm64: dts: mediatek: mt8195-cherry: Drop regulator-compatible
>      property
>    arm64: dts: mediatek: mt8195-demo: Drop regulator-compatible property
>    arm64: dts: medaitek: mt8395-nio-12l: Drop regulator-compatible
>      property
>    arm64: dts: mediatek: mt8395-genio-1200-evk: Drop regulator-compatible
>      property
> 
>   .../bindings/regulator/mt6315-regulator.yaml  |  6 -----
>   arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi  | 23 -------------------
>   arch/arm64/boot/dts/mediatek/mt8173-evb.dts   | 23 -------------------
>   .../boot/dts/mediatek/mt8192-asurada.dtsi     |  3 ---
>   .../boot/dts/mediatek/mt8195-cherry.dtsi      |  2 --
>   arch/arm64/boot/dts/mediatek/mt8195-demo.dts  |  9 --------
>   .../dts/mediatek/mt8395-genio-1200-evk.dts    |  2 --
>   .../dts/mediatek/mt8395-radxa-nio-12l.dts     |  2 --
>   8 files changed, 70 deletions(-)
> 



