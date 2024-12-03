Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 281BBD7833F
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Dec 2024 09:44:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E7GBrH5vFvEKu5WNkLsQsfP2Mnke4S1F8ovM/0F34F4=; b=KelDDzhFEb0yABIEYX74XEGRLs
	seabkUrBKcYICSu3yEGLx0KLv87itShkZdG3JoKGmA8Yu2ld0fjJZT1XF00VM+MBTcXbZS+qTMrUv
	dNDwhjjAPME6vvri/R1ji+SNMkaZ8nwbrBBeVeszZNhwom3zc6lghDHTMsDeJ85Ejj7RaOneOiVGm
	zwhMYA7VuheO5ZYJ3qu8pxDiMmGEnqCr/a2yXE16JOFWcM7Xq30osM4Loj0gGZbSdtyvWaFMS7sTa
	ST1wGTWVbiKIaFRxWZXnLWf0RECDAzb6Lhy71eP15TrAnM3sefczMeliSooOg1VaqMlXPNBHinO4v
	D1MOrzhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIPSQ-00000008wxw-1mkw;
	Tue, 03 Dec 2024 09:44:38 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIPOW-00000008vw8-44Qs;
	Tue, 03 Dec 2024 09:40:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1733218835;
	bh=ZBxVO4lJb5ozsNn8cHJ9HgeI9RyIWRXMkh5uooawYu0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=hgF7n+gmRDy5ZTjkqqntz2ewArwYn6UDghZIoiR7tVDSM/0gk81kP2rEDqjUQLLw0
	 DNSKtKw7LnIPnNjGnO2aJUWUMdzUNxwI0EFsqgwkSvMcxjXGuJE1Ps1ROfwYnr2TZB
	 mAD4UhI435wzv+AaH2q/1HLNku1nt5zYsrkxQR4CGPlycfkgvpZUEX51VonO1tq9p3
	 aS36c5dWVQuLwQe/pSjC4772z+LKP6FM54y+LI+Yp04Q7tm1wgxlAX7UqkhYrUq9+l
	 GwcBY6HXLgqbg94/PedrxUd6Z0v1HADuHT8RkGSWwfhW8lovDwjksTf0OS2NO8eKZb
	 qOUfc91wMsNzA==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 3C44D17E35E9;
	Tue,  3 Dec 2024 10:40:35 +0100 (CET)
Message-ID: <a0137698-43d7-4cb6-a69c-98a5e90b13f8@collabora.com>
Date: Tue, 3 Dec 2024 10:40:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 14/18] arm64: dts: mediatek: mt7988: add pmic on bpi-r4
To: Frank Wunderlich <linux@fw-web.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: Frank Wunderlich <frank-w@public-files.de>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20241202122602.30734-1-linux@fw-web.de>
 <20241202122602.30734-15-linux@fw-web.de>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20241202122602.30734-15-linux@fw-web.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241203_014037_160026_49671FBF 
X-CRM114-Status: GOOD (  15.70  )
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

Il 02/12/24 13:25, Frank Wunderlich ha scritto:
> From: Frank Wunderlich <frank-w@public-files.de>
> 

arm64: dts: mediatek: mt7988a-bpi-r4: Add MediaTek MT6682A/RT5190A PMIC

The BananaPi R4 board has a MediaTek MT8862A PMIC, a rebrand of the
Richtek RT5190A chip, connected to the I2C0 bus.

Add the relevant node and, while at it, also configure the regulators
from this PMIC that are used on this board.

> Bananapi R4 Board contains a MT6682A pmic which is compatible to rt5190a.
> Add its node to the i2 controller.
> 
> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
> ---
>   .../dts/mediatek/mt7988a-bananapi-bpi-r4.dts  | 51 +++++++++++++++++++
>   1 file changed, 51 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dts b/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dts
> index 13ca016d6a67..bc1ec73b8ddd 100644
> --- a/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dts
> +++ b/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dts
> @@ -2,6 +2,8 @@
>   
>   /dts-v1/;
>   
> +#include <dt-bindings/regulator/richtek,rt5190a-regulator.h>
> +
>   #include "mt7988a.dtsi"
>   
>   / {
> @@ -65,6 +67,55 @@ &i2c0 {
>   	pinctrl-names = "default";
>   	pinctrl-0 = <&i2c0_pins>;
>   	status = "okay";
> +
> +	rt5190a_64: rt5190a@64 {
> +		compatible = "richtek,rt5190a";
> +		reg = <0x64>;
> +		vin2-supply = <&rt5190_buck1>;
> +		vin3-supply = <&rt5190_buck1>;
> +		vin4-supply = <&rt5190_buck1>;
> +
> +		regulators {
> +			rt5190_buck1: buck1 {
> +				regulator-name = "rt5190a-buck1";
> +				regulator-min-microvolt = <5090000>;
> +				regulator-max-microvolt = <5090000>;
> +				regulator-allowed-modes =
> +				<RT5190A_OPMODE_AUTO RT5190A_OPMODE_FPWM>;

Does it work like that?

regulator-allowed-modes = <RT5190A_OPMODE_AUTO>,
			  <RT5190A_OPMODE_FPWM>;

If yes, please write it like that - if not, I'm sad - but regardless

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


