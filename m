Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C574D1681F
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Jan 2026 12:01:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:In-Reply-To:From:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MptIO4ksyg9F6O22oNgMjISLOZ/OHNz7yvvYKIuS4f0=; b=4QzHDjjW1RV1su4TzJYJ16YnPm
	7I7xAfzO6Odf9qLyM3RLH0XFvEQldQHWyamy5aWZKFDSASdKGHn7SD/a+3tl0KJh1/YbENFTNCHXu
	XKeC4zIFmzYR+KR2fJaMm0uGaSFtTuOLu9phPGvemyeGQBfLdj3nLBlEZ/jiHt4YmBL0m9qwYRZw4
	YZXsSLJ70VB6v3aBqVF82M1s2AykHFwj3EH2M4QGKabzj4PslC2TLGcsMUQfC4yCtVnKDuq5HSnBW
	D3u1+zdtsN7CqgcaiIHP5jM6WwJUBsAOIS1Uz+g+TA8Oy+e7OE6M99e2HCMfwXr/njbz31Imw9Hdp
	fKwdnOSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veBBa-00000002Gtz-3uFY;
	Fri, 09 Jan 2026 12:01:46 +0000
Received: from mailout2.w1.samsung.com ([210.118.77.12])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veBBW-00000002Gsh-3MjC
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Jan 2026 12:01:45 +0000
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20260109120137euoutp02ff8fb4bf486bee58930697c34fc8e205~JDld-CX4U1666816668euoutp02V
	for <linux-arm-kernel@lists.infradead.org>; Fri,  9 Jan 2026 12:01:37 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20260109120137euoutp02ff8fb4bf486bee58930697c34fc8e205~JDld-CX4U1666816668euoutp02V
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1767960097;
	bh=MptIO4ksyg9F6O22oNgMjISLOZ/OHNz7yvvYKIuS4f0=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=J3FNHwipeIkk54b8svtLBLvDhEFjuGvfRwRzsOR/KqY1ezhnB25BoWCAw1vnnrMm7
	 oE7DMilVkw8NH8b1FnM801nhvDOFC4qBjwdA9MGwtuzI7exePSwC4TYIrjewI5XYeq
	 kvciERb4MfdND8Cf8jnrl333ESBppKSPQXRYpvv8=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20260109120137eucas1p221b9dd341c2319c0f9d0da1fbd48d1b3~JDldt-SrV1778517785eucas1p2Q;
	Fri,  9 Jan 2026 12:01:37 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
	eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20260109120135eusmtip27bce27ce7cb357fdbd1ba01e918d97ed~JDlcHXyH52161121611eusmtip2R;
	Fri,  9 Jan 2026 12:01:35 +0000 (GMT)
Message-ID: <e98ad883-7ba2-417b-8cd3-19f5f863b03d@samsung.com>
Date: Fri, 9 Jan 2026 13:01:35 +0100
MIME-Version: 1.0
User-Agent: Betterbird (Windows)
Subject: Re: [PATCH 02/13] ARM: dts: broadcom: bcm2835-rpi: Move non
 simple-bus nodes to root level
To: "Rob Herring (Arm)" <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Florian Fainelli
	<florian.fainelli@broadcom.com>, Broadcom internal kernel review list
	<bcm-kernel-feedback-list@broadcom.com>, Ray Jui <rjui@broadcom.com>, Scott
	Branden <sbranden@broadcom.com>
Cc: devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Language: en-US
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <20260106-dt-dtbs-broadcom-fixes-v1-2-ba45874e4553@kernel.org>
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20260109120137eucas1p221b9dd341c2319c0f9d0da1fbd48d1b3
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20260109120137eucas1p221b9dd341c2319c0f9d0da1fbd48d1b3
X-EPHeader: CA
X-CMS-RootMailID: 20260109120137eucas1p221b9dd341c2319c0f9d0da1fbd48d1b3
References: <20260106-dt-dtbs-broadcom-fixes-v1-0-ba45874e4553@kernel.org>
	<20260106-dt-dtbs-broadcom-fixes-v1-2-ba45874e4553@kernel.org>
	<CGME20260109120137eucas1p221b9dd341c2319c0f9d0da1fbd48d1b3@eucas1p2.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260109_040143_108359_56A9AF65 
X-CRM114-Status: GOOD (  19.22  )
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

On 07.01.2026 03:09, Rob Herring (Arm) wrote:
> The 'gpu' and 'firmware' nodes are not MMIO devices, so they should not be
> under a 'simple-bus'. Additionally, the "raspberrypi,bcm2835-power" node
> is part of the firmware, so move it under the /firmware node.
>
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>

This breaks operation of all drivers under the firmware node. I'm not 
exactly sure why, but they are not properly instantiated. It must be 
something specific to "firmware" name, but I didn't dig enough to find 
exactly where and why.

After changing the "/firmware" node name "xfirmware" everything works again:


diff --git a/arch/arm/boot/dts/broadcom/bcm2835-rpi.dtsi 
b/arch/arm/boot/dts/broadcom/bcm2835-rpi.dtsi
index 9ab70b519a63..464f032ccb71 100644
--- a/arch/arm/boot/dts/broadcom/bcm2835-rpi.dtsi
+++ b/arch/arm/boot/dts/broadcom/bcm2835-rpi.dtsi
@@ -1,7 +1,7 @@
  #include <dt-bindings/power/raspberrypi-power.h>

  / {
-       firmware: firmware {
+       firmware: xfirmware {
                 compatible = "raspberrypi,bcm2835-firmware", "simple-mfd";
                 mboxes = <&mailbox>;


Same issue occurs with bcm2712 change (patch 3/13).


> ---
>   arch/arm/boot/dts/broadcom/bcm2835-common.dtsi |  7 ++++---
>   arch/arm/boot/dts/broadcom/bcm2835-rpi.dtsi    | 16 ++++++++--------
>   2 files changed, 12 insertions(+), 11 deletions(-)
>
> diff --git a/arch/arm/boot/dts/broadcom/bcm2835-common.dtsi b/arch/arm/boot/dts/broadcom/bcm2835-common.dtsi
> index 9261b67dbee1..1e76b290510d 100644
> --- a/arch/arm/boot/dts/broadcom/bcm2835-common.dtsi
> +++ b/arch/arm/boot/dts/broadcom/bcm2835-common.dtsi
> @@ -141,9 +141,10 @@ v3d: v3d@7ec00000 {
>   			interrupts = <1 10>;
>   		};
>   
> -		vc4: gpu {
> -			compatible = "brcm,bcm2835-vc4";
> -		};
> +	};
> +
> +	vc4: gpu {
> +		compatible = "brcm,bcm2835-vc4";
>   	};
>   };
>   
> diff --git a/arch/arm/boot/dts/broadcom/bcm2835-rpi.dtsi b/arch/arm/boot/dts/broadcom/bcm2835-rpi.dtsi
> index e9bf41b9f5c1..9ab70b519a63 100644
> --- a/arch/arm/boot/dts/broadcom/bcm2835-rpi.dtsi
> +++ b/arch/arm/boot/dts/broadcom/bcm2835-rpi.dtsi
> @@ -1,15 +1,13 @@
>   #include <dt-bindings/power/raspberrypi-power.h>
>   
>   / {
> -	soc {
> -		firmware: firmware {
> -			compatible = "raspberrypi,bcm2835-firmware", "simple-mfd";
> -			mboxes = <&mailbox>;
> +	firmware: firmware {
> +		compatible = "raspberrypi,bcm2835-firmware", "simple-mfd";
> +		mboxes = <&mailbox>;
>   
> -			firmware_clocks: clocks {
> -				compatible = "raspberrypi,firmware-clocks";
> -				#clock-cells = <1>;
> -			};
> +		firmware_clocks: clocks {
> +			compatible = "raspberrypi,firmware-clocks";
> +			#clock-cells = <1>;
>   		};
>   
>   		power: power {
> @@ -17,7 +15,9 @@ power: power {
>   			firmware = <&firmware>;
>   			#power-domain-cells = <1>;
>   		};
> +	};
>   
> +	soc {
>   		vchiq: mailbox@7e00b840 {
>   			compatible = "brcm,bcm2835-vchiq";
>   			reg = <0x7e00b840 0x3c>;
>
Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland


