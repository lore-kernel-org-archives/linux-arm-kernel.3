Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7506CCA0EE9
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 Aug 2025 07:51:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KwBmurvB/z1t4z9f6rFLJoe6lSjWF/tP7/GaEKiULio=; b=YPSRfBsxjLufq+6+p66nSpdDWp
	CEOCP8S8Vl41kcpViY+gqtM30rXO/EBs0Ptxl+rQUa0B5fw1U1r1bB2EAHsa0n7vOyMpzitzD6cqu
	3U4QfHXsi1Ey/u0Zx9mL2f35fyfR4g2vE9fRkeA9H7ZaqhqFcBZlMkLyDHNHa76guQfJfbo6rGARj
	RdOx5ur0mUb6YMAmrKBg+0YzuYoUnAykmd9R0ryDvxsfdGffgG2auwE8GcCdJinrTZjsCOCAt9JXm
	tdKXdEkGJbScn7Pbf4WRKgZ9pzCtqt4/giILpwuPp8ufjYZ3erpARciRtpwi0JePGydH48oEaOXTY
	iEPHPtlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unuef-00000006puU-262N;
	Mon, 18 Aug 2025 07:51:45 +0000
Received: from smtpbgau2.qq.com ([54.206.34.216])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unuGv-00000006mhG-38KE;
	Mon, 18 Aug 2025 07:27:15 +0000
X-QQ-mid: zesmtpip3t1755501983te195c171
X-QQ-Originating-IP: Ed+ORawxXpZ6NA7jhmANWyut2oLJqIWX2Q7j4Aj9hhs=
Received: from [IPV6:240f:10b:7440:1:e696:3c18 ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 18 Aug 2025 15:26:19 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 17431412545650112022
Message-ID: <ABB74D9D1E3774F3+5a8c0d7d-fb7f-47c0-8308-e2b69f0628c1@radxa.com>
Date: Mon, 18 Aug 2025 16:26:18 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] arm64: dts: rockchip: update pinctrl names for
 Radxa E52C
To: Chukun Pan <amadeus@jmu.edu.cn>, Heiko Stuebner <heiko@sntech.de>
Cc: Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20250816080030.183931-1-amadeus@jmu.edu.cn>
 <20250816080030.183931-4-amadeus@jmu.edu.cn>
Content-Language: en-US
From: FUKAUMI Naoki <naoki@radxa.com>
In-Reply-To: <20250816080030.183931-4-amadeus@jmu.edu.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpip:radxa.com:qybglogicsvrgz:qybglogicsvrgz8a-1
X-QQ-XMAILINFO: MKbpLBOB35npu3RU/ctuzE+hm7xbZHPJ2wwAbMbVT+X4X0iRIT8KoPyS
	Pvzm5j3MytJCZS7iYJ6WNpiNxTZ45+aMDmsoekRu1lvOeuMnsJfKJt0QhwXSZFfHLJesg6J
	a8wRVrcID52m3wa5jbefVboeaMnx/YN72hTF1Io5C9c9EGpJFTCG9JlUzZJ4lntXdUbXASj
	cqclzqvBA/kaX5PCafgbXtiXboSbrYnk2zxDuAgnQeH6CZO2likKk1zF4udFQTobijzvJiE
	iBCGynEU5t+6pLDTkw+tUKEXTQl32A4MJzZSDeRA8vONKNhYHFkTlIZ/IEzZ5JrSDy13uPV
	yU56/2s/QUwnRKYw4GxUphVkmjy9nDglG8of3DvqUuid51eYpO35sd7+EhHnzmIaO/m0YbJ
	kbQUnqUuQf+0zzGNIR4XEfcmrGSIZmhgA/+XQmoIRFALmgpHxSBso4eatJcXE05E09Bhycl
	zUulg18Qn6j7pBtA9WCijuwVpfUDIDP0RChvNjlu2Hm0Qi/HlVDqaTqimAeYPOpo3XZUHw8
	fa0i9xtXU8xBM6NW9M2GtwFdQsTcxgg48buVJGEpTmD1LLxkeih24YusB7Q7rwjZXra9ROc
	5ZNkzsFzaK4ZZJ7IYMszExdmqbLmR8COnSDEsapzRB0nKv8+ZT8lObLZNSskjcU5DtqxEad
	u+edAGZU6sK61Xnkjxy/WLhJtVhOuLpLbER6vv7eGmdXBsb3IxbcuapqXR2ZpJZouWg+Q6P
	KAam6ZTLzIYB5mvEfbNRyMpUMKD4Aly4Qt15JRl0W6RxN/13buxvM9nA5iz8vLWn8KQuCG2
	hWNYPXUEOtgmILxcady5xcTJKOMOUEGDt/9UbT7BY5A85ebNcV5M//h2KzWcyeNFTeWIRsB
	3NLLCJHGxuBSE3TeEj4voAHA5vddDsTMP4xmcQa/zlO7fPQiNEIVFpnpoWRT0XY+C5n5AIj
	HuZN07ZMMP2505AVLFw5ThiMUolpecARXI/Gt4pnZi1FhKw==
X-QQ-XMRINFO: NI4Ajvh11aEj8Xl/2s1/T8w=
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250818_002714_159064_5D4A279F 
X-CRM114-Status: GOOD (  11.47  )
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

Hi Chukun,

On 8/16/25 17:00, Chukun Pan wrote:
> Updated the pinctrl names of the user key and power LED according
> to the schematic. Also updated the nodenames of other pinctrls.
> 
> Signed-off-by: Chukun Pan <amadeus@jmu.edu.cn>
> ---
>   arch/arm64/boot/dts/rockchip/rk3582-radxa-e52c.dts | 14 +++++++-------
>   1 file changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/rockchip/rk3582-radxa-e52c.dts b/arch/arm64/boot/dts/rockchip/rk3582-radxa-e52c.dts
> index 4a3ae95f122f..f93b129a0032 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3582-radxa-e52c.dts
> +++ b/arch/arm64/boot/dts/rockchip/rk3582-radxa-e52c.dts
> @@ -42,7 +42,7 @@ button-0 {
>   	keys-1 {
>   		compatible = "gpio-keys";
>   		pinctrl-names = "default";
> -		pinctrl-0 = <&btn_0>;
> +		pinctrl-0 = <&pwm15_ir_m1>;
>   
>   		button-1 {
>   			label = "User";
> @@ -55,7 +55,7 @@ button-1 {
>   	leds-0 {
>   		compatible = "gpio-leds";
>   		pinctrl-names = "default";
> -		pinctrl-0 = <&led_0>;
> +		pinctrl-0 = <&power_led>;
>   
>   		led-0 {
>   			color = <LED_COLOR_ID_GREEN>;
> @@ -306,13 +306,13 @@ &pcie2x1l2 {
>   
>   &pinctrl {
>   	keys {
> -		btn_0: button-0 {
> +		pwm15_ir_m1: pwm15-ir-m1 {

"The name of a node should be somewhat generic".

  https://github.com/devicetree-org/devicetree-specification/blob/v0.4/source/chapter2-devicetree-basics.rst?plain=1#L193
  https://lore.kernel.org/all/20241216113052.15696-1-naoki@radxa.com/T/#u

(I don't understand why this only applies to me...)

Best regards,

--
FUKAUMI Naoki
Radxa Computer (Shenzhen) Co., Ltd.

>   			rockchip,pins = <4 RK_PB3 RK_FUNC_GPIO &pcfg_pull_none>;
>   		};
>   	};
>   
>   	leds {
> -		led_0: led-0 {
> +		power_led: power-led {
>   			rockchip,pins = <3 RK_PC4 RK_FUNC_GPIO &pcfg_pull_none>;
>   		};
>   	};
> @@ -328,19 +328,19 @@ pcie20x1_2_perstn_m0: pcie-2 {
>   	};
>   
>   	regulators {
> -		vcc_5v0_pwren_h: regulator-5v0-1 {
> +		vcc_5v0_pwren_h: vcc-5v0-pwren-h {
>   			rockchip,pins = <4 RK_PA3 RK_FUNC_GPIO &pcfg_pull_none>;
>   		};
>   	};
>   
>   	rtc {
> -		rtc_int_l: rtc-0 {
> +		rtc_int_l: rtc-int-l {
>   			rockchip,pins = <0 RK_PB0 RK_FUNC_GPIO &pcfg_pull_none>;
>   		};
>   	};
>   
>   	usb {
> -		usb_otg_pwren_h: regulator-5v0-0 {
> +		usb_otg_pwren_h: usb-otg-pwren-h {
>   			rockchip,pins = <0 RK_PD4 RK_FUNC_GPIO &pcfg_pull_none>;
>   		};
>   	};


