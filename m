Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD53BE77188
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jan 2025 10:35:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zcQgamb15ozjrv56u+Y1FDfB5xTe3Us2mSgxCRrPrfs=; b=JVmLgL7/A6w0Dbb93Vb207QVIy
	vX8KC69qdjM8K6J2eDtaCG6a/d+7f2DRv9lvn8BIqczBiUb7YbBISPYmUclA9PMKLTKV7K74767ml
	W/dGuYc/+INEcoUgyqYJYTJF769nbBy52Jy8zejCUe4reg64HpwcWUXffKTKnHm53KA416nErqZSp
	P1QVuHuJODNLwPIKa5cSfTbNdynoVXWU3vrdxOJHj7RjyIdRU7PaYBAfZWwN8boCks7/CGLbZ/+hO
	qqF/ngAnQFCsGpHIfPW40rKzCqEu3GVUK8dcWELGnlD64Anj/5ONrpoDsaXdeE498U/6xi48N9Zxh
	8tTgP76w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXeG9-000000087B7-3mAg;
	Tue, 14 Jan 2025 10:34:57 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXeDk-000000086lZ-0T3x;
	Tue, 14 Jan 2025 10:32:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1736850746;
	bh=i6Mcj9q1p4UBYKeh3HAX0U/Icv+ABLJke6uy3OaX3bU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=UmOqlKPQY5VQH3N3NMxOVvfTRvi7mfYbt7tq74IQbWIe4kMQ9tT/m/XpHyuKmsBmH
	 p8iQwGuMn3UUennqZNuZxSJ+oGlEKjW+2x7PHzAB2L1F1m3AuM8dqErNp5a1GHEuxd
	 vzo7UC+fZJFZOHq9D02t6m/Nf6alrzXfXS7bhkr5QdybHxI8rewIbCsFusWntWkdYQ
	 QyOvxsskagcPCOrGXkrUAJph9EoEY438+Oxevg0fwbfCPdRU+DFU5JyxeCrojB94Bh
	 8F1GgtnxmE7OqZUdS8qrPX5k2+uyFNx6e+qapqeD8rg1vEz1EKIRTSb9JBQQotsdPF
	 bKCOMjyIavYOw==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 2057917E0DF3;
	Tue, 14 Jan 2025 11:32:26 +0100 (CET)
Message-ID: <c4000cde-e889-46ef-8b56-ffa18c9fe004@collabora.com>
Date: Tue, 14 Jan 2025 11:32:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] arm64: dts: mediatek: add support for MT8370 SoC
To: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Sean Wang <sean.wang@mediatek.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 kernel@collabora.com
References: <20250114-dts_mt8370-genio-510-v1-0-8517ee0fdbe8@collabora.com>
 <20250114-dts_mt8370-genio-510-v1-2-8517ee0fdbe8@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250114-dts_mt8370-genio-510-v1-2-8517ee0fdbe8@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250114_023228_299047_3D33A2F6 
X-CRM114-Status: GOOD (  19.57  )
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

Il 14/01/25 08:38, Louis-Alexis Eyraud ha scritto:
> This commit add the support of the Mediatek MT8370 SoC.
> It is a less powerful variant of MT8390 SoC and their
> main differences are:
> - Arm Cortex-A55 cores number (4 vs 6)
> - Arm Cortex-A78 core speed (2.0 GHz vs 2.2 Ghz)
> - Arm Mali-G57 GPU core number (2 vs 3)

You're mentioning the number of GPU cores, but you're not adding any variation
in mt8370.dtsi: this is fine because the GPU is disabled by default, but please
either add it, or mention in the commit message that the override will be done
in a later commit.

> 
> Like MT8390, MT8370 hardware register maps are identical to MT8188.
> 
> Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
> ---
>   arch/arm64/boot/dts/mediatek/mt8188.dtsi |  8 ++--
>   arch/arm64/boot/dts/mediatek/mt8370.dtsi | 64 ++++++++++++++++++++++++++++++++
>   2 files changed, 68 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8188.dtsi b/arch/arm64/boot/dts/mediatek/mt8188.dtsi
> index 338120930b819645662465fa7b3c6be6491764ff..5d78f51c6183c15018986df2c76e6fdc1f9f43b4 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8188.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8188.dtsi
> @@ -492,7 +492,7 @@ cpu_little0_crit: trip-crit {
>   			};
>   
>   			cooling-maps {
> -				map0 {
> +				cpu_little0_cooling_map0: map0 {
>   					trip = <&cpu_little0_alert0>;
>   					cooling-device = <&cpu0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
>   							 <&cpu1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> @@ -530,7 +530,7 @@ cpu_little1_crit: trip-crit {
>   			};
>   
>   			cooling-maps {
> -				map0 {
> +				cpu_little1_cooling_map0: map0 {
>   					trip = <&cpu_little1_alert0>;
>   					cooling-device = <&cpu0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
>   							 <&cpu1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> @@ -568,7 +568,7 @@ cpu_little2_crit: trip-crit {
>   			};
>   
>   			cooling-maps {
> -				map0 {
> +				cpu_little2_cooling_map0: map0 {
>   					trip = <&cpu_little2_alert0>;
>   					cooling-device = <&cpu0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
>   							 <&cpu1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> @@ -606,7 +606,7 @@ cpu_little3_crit: trip-crit {
>   			};
>   
>   			cooling-maps {
> -				map0 {
> +				cpu_little3_cooling_map0: map0 {
>   					trip = <&cpu_little3_alert0>;
>   					cooling-device = <&cpu0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
>   							 <&cpu1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> diff --git a/arch/arm64/boot/dts/mediatek/mt8370.dtsi b/arch/arm64/boot/dts/mediatek/mt8370.dtsi
> new file mode 100644
> index 0000000000000000000000000000000000000000..cf1a3759451ff899ce9e63e5a00f192fb483f6e5
> --- /dev/null
> +++ b/arch/arm64/boot/dts/mediatek/mt8370.dtsi
> @@ -0,0 +1,64 @@
> +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
> +/*
> + * Copyright (c) 2025 Collabora Ltd.
> + * Author: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
> + */
> +
> +/dts-v1/;
> +#include "mt8188.dtsi"
> +
> +/ {
> +	compatible = "mediatek,mt8370";
> +
> +	cpus {
> +		/delete-node/ cpu@400;
> +		/delete-node/ cpu@500;
> +
> +		cpu-map {
> +			cluster0 {
> +				/delete-node/ core4;
> +				/delete-node/ core5;
> +			};
> +		};
> +	};
> +};
> +
> +&cpu6 {
> +	clock-frequency = <2200000000>;
> +};
> +
> +&cpu7 {
> +	clock-frequency = <2200000000>;
> +};
> +
> +&cpu_little0_cooling_map0 {
> +	cooling-device = <&cpu0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +				<&cpu1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +				<&cpu2 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +				<&cpu3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;

Please fix the indentation:

	cooling-device = <&cpu0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
			 <&cpu1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
			 <&cpu2 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
			 <&cpu3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;

Other than that, looks good.

Cheers,
Angelo

> +};
> +
> +&cpu_little1_cooling_map0 {
> +	cooling-device = <&cpu0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +				<&cpu1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +				<&cpu2 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +				<&cpu3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
> +};
> +
> +&cpu_little2_cooling_map0 {
> +	cooling-device = <&cpu0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +				<&cpu1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +				<&cpu2 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +				<&cpu3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
> +};
> +
> +&cpu_little3_cooling_map0 {
> +	cooling-device = <&cpu0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +				<&cpu1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +				<&cpu2 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +				<&cpu3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
> +};
> +
> +&ppi_cluster0 {
> +	affinity = <&cpu0 &cpu1 &cpu2 &cpu3>;
> +};
> 




