Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21A06CAC597
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Sep 2025 04:54:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vw5q9DvjhhGOyeVfiHY3GKwPIlp0etaPTlu/iuodJus=; b=eNW1E7UuahbzKIRoKGdZC4pTPX
	dgtmEO/dFZ/TbGjQIC1H5HAJyHxnX71L7E1bhwFq/CzJec/yAQKM+tTENKai/biUrHfl7PZB+p55D
	kduy3r7CYlgVSjcHObZRLry0x8WeqlwtLE6hnQ3uAwFsmZdkbwYzNN1DFlhrb3rPQeWaLIH3MOmey
	MjYBf2589b48DivUW3JRfOUsoxFH4xWQB9hMsYOjePBqfERaXpcYdwsBwa3rO87h2CoV065m4KdO/
	wT9SSrYLi4+S2lVBEH7xQFas+7N147ezOeCAFRL7jcOcOtgXhWXWDyETSNOFAUCo7onZeyj0l/jqQ
	w4LL1LjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uz6en-0000000GFKh-2SZK;
	Thu, 18 Sep 2025 04:54:09 +0000
Received: from smtpbg154.qq.com ([15.184.224.54])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uz6ej-0000000GFJ9-3erC;
	Thu, 18 Sep 2025 04:54:07 +0000
X-QQ-mid: zesmtpip2t1758171201td36bd396
X-QQ-Originating-IP: ldqFtcIMZ+EgBaSl1BCRznrhOpJNPLuubIRCzJEENoI=
Received: from [IPV6:240f:10b:7440:1:d0ed:66b8 ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 18 Sep 2025 12:53:16 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 16889541168818514109
Message-ID: <FBB5B30DE8FEABD7+59ee6f48-2ad1-45dd-8cf1-8b58a03513a9@radxa.com>
Date: Thu, 18 Sep 2025 13:53:15 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] arm64: dts: rockchip: correct uart mux for Radxa ZERO
 3
To: Ed Wildgoose <lists@wildgooses.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250917114932.25994-1-lists@wildgooses.com>
 <20250917114932.25994-2-lists@wildgooses.com>
Content-Language: en-US
From: FUKAUMI Naoki <naoki@radxa.com>
In-Reply-To: <20250917114932.25994-2-lists@wildgooses.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpip:radxa.com:qybglogicsvrgz:qybglogicsvrgz8a-1
X-QQ-XMAILINFO: OfaQ+Y0DiXSPHOPAZx8dtXZUGvx+pCqiXxJh/52cnVVTQVTaU5vvBQHe
	TPSwle0VT3U0z1kOOqGviMfl0yEVBpkH5P6RFvZxalcal+KCxia6mF7MTxaooFymIF+iz04
	/6JZYbthd2d0B6b4phnoGD5frNUreKsKGXoZfPdx9wRWg+mCDqL0U06uK4DxXbDBgWLL15k
	FBXh2qgEqZXXEXkvsJvh2IkfzQGDYUIQcnZPFm7xsTWep9Eg8A90IiTd6GK8giA2FKE7gkx
	AAeYd20mJ5GCVjcrcts6YuQJ2oxcyoI0xf6I2obxCFl9g0pFq//IA9+aHLybDQackWVbYOB
	QTQT0SxUiNJ4oyPpncqN4fwhX1gLTflwTqjGhD2reaxFlZCBM1Ox7/oaIetpAOiZufT/ecE
	D0fKxm4QrUqu4LyH93ttGX2b4cjun2+q1l6mYwMNFN+iH9rVoRoSAQFSgJV3w0Ivp3Oyi8L
	DmpI95qLa1Dp8dNPeChwiwmJiiENCAczav2It3LEDw8Y93GGMQDAyeGtR5+u27MrhcFIqNR
	v0moO0nw5YJbZxepfT7qs4Txop90FhsW2mGxLflSSVaX59WrMj0qDlPiL65IvTSXnP34EY3
	W4mI+moudhoo7jabiIPCQm96rAdqxgzlI/29y1QSWokPMwuHwZp8UPAr4m/SqlnBCPA/4xm
	nHkmCY+PqJiS+D9tMFSc6o+Zw/TQ8+QBA/Wta3G4XVi6MHqDW2VSjzc8HbApu8gEPQW/NIW
	+ykdvrQ7ZJ71qIdRaJzht1hks2f+pd6cgJn15bw0JWKYKvZUXjXR/LYZCnA+pM3si6Gz5aZ
	oRJc5wW9q54SGtvzzhRmvk7giQdXgrfEASo7STHFrtVEqeftbeyjei9fEt7qcI11LYN2Xyj
	IkHG10wr1oVqYN9tP7HMWoBQ+WGsfjKsB1F0AM8fAph1rNyNJ7lQ8nhbQG+YjQhzizSgWHT
	n2Mq/TLhooILZ3ebF1RJ/6R/x4UqgEOGC0N0NSHQNHGAu65Uxm/TYOhzvKUJGdk/zgxSyof
	dZ6gX47GXjDyf/7RPKesSmAu65Q20=
X-QQ-XMRINFO: Mp0Kj//9VHAxr69bL5MkOOs=
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250917_215406_609759_B4487AD7 
X-CRM114-Status: GOOD (  17.20  )
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

Hi Ed,

Thank you very much for your work.

On 9/17/25 20:49, Ed Wildgoose wrote:
> The rk3566 has multiplexed pins and the uarts can be moved to a choice
> of 2 pin groups. The default rk356x-base.dtsi appears to default to mux0
> for all uarts, however, specific hardware might choose to implement
> alternatives
> 
> The Radxa zero 3 shows that is uses M1 for uarts:
> - uart4
> - uart5
> - uart9
> 
> These aren't normally enabled, but we should at least correct the
> default pinctrl definitions. Without these changes there will be
> conflicts with mmc0/mmc1, leading to the SD or eMMC going missing.

Sorry, but why do we need these definitions for disabled nodes?

Or why don't we do similar definitions for nodes other than uart?
For example, PWM12, I2S3, and SPI3 also use M1. Are they not related to 
SD/eMMC and therefore don't need to be defined?

If users want to use UARTs on pin headers, they will refer to the 
correct documentation[1] to determine which pins are UARTs and will of 
course write the correct pinctrl definition.

[1] 
https://docs.radxa.com/en/zero/zero3/hardware-design/hardware-interface#gpio-interface

Best regards,

--
FUKAUMI Naoki
Radxa Computer (Shenzhen) Co., Ltd.

> 
> Signed-off-by: Ed Wildgoose <lists@wildgooses.com>
> ---
>   .../boot/dts/rockchip/rk3566-radxa-zero-3.dtsi    | 15 +++++++++++++++
>   1 file changed, 15 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/rockchip/rk3566-radxa-zero-3.dtsi b/arch/arm64/boot/dts/rockchip/rk3566-radxa-zero-3.dtsi
> index 1ee5d96a4..41b3c4403 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3566-radxa-zero-3.dtsi
> +++ b/arch/arm64/boot/dts/rockchip/rk3566-radxa-zero-3.dtsi
> @@ -492,6 +492,21 @@ &uart2 {
>   	status = "okay";
>   };
>   
> +&uart4{
> +    pinctrl-names = "default";
> +    pinctrl-0 = <&uart4m1_xfer>;
> +};
> +
> +&uart5 {
> +    pinctrl-names = "default";
> +    pinctrl-0 = <&uart5m1_xfer>;
> +};
> +
> +&uart9 {
> +    pinctrl-names = "default";
> +    pinctrl-0 = <&uart9m1_xfer>;
> +};
> +
>   &usb_host0_xhci {
>   	status = "okay";
>   };


