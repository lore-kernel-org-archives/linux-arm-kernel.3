Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A51EFE7717F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Dec 2024 12:25:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bIZOhBSbBlumClO+5WBpvKWp8vXqGKwf+GCHshUCQ6I=; b=hk5uxRzpEn++wwm9rtmTZRScu/
	WwP7WjF4TFCtAdyGgwTubprfU/o8jLpEsq67T2vGls3Xoom7Pwfa7ROSAwmMcjMIwRr32YsiBFbBs
	9GKUpOjXGBrh0a4im9zvY/JYq58KHCCpLRgw7UZIiuCCbg2VvQwaLsu/r6kzo5XlVORyS/qTQ6LDB
	2HHOEQt5XoCC8tWyQtB6SXvFmrV8w4SSeuKHciln7eO8PjZ1yeWjU2ZrZv/g8lJ0XI2/LlrOizBGY
	3k7w+y3SGwdHwxkrDtit+NoNmnPB6kjXMFEqq3MBiHN0t43hGNw49lPe5I4Ls7//vy8i8uRw/LGhf
	3Q1s74cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNA9Z-00000009xp1-0rFR;
	Mon, 16 Dec 2024 12:24:49 +0000
Received: from mail-m15591.qiye.163.com ([101.71.155.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tN88d-00000009fnv-0ONd;
	Mon, 16 Dec 2024 10:15:44 +0000
Received: from [172.16.12.26] (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 5dd55b80;
	Mon, 16 Dec 2024 18:15:38 +0800 (GMT+08:00)
Message-ID: <d0f89644-77b9-4bcd-9fab-42a10185c72f@rock-chips.com>
Date: Mon, 16 Dec 2024 18:15:38 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 10/11] arm64: dts: rockchip: Enable eDP0 display on
 RK3588S EVB1 board
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: heiko@sntech.de, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, rfoss@kernel.org, vkoul@kernel.org,
 sebastian.reichel@collabora.com, cristian.ciocaltea@collabora.com,
 l.stach@pengutronix.de, andy.yan@rock-chips.com, hjc@rock-chips.com,
 algea.cao@rock-chips.com, kever.yang@rock-chips.com,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org
References: <20241216031225.3746-1-damon.ding@rock-chips.com>
 <20241216031225.3746-11-damon.ding@rock-chips.com>
 <ay2im4itrj3k4p2ksobgsk77b7m4laaxctkfcpffqxj5ttxenm@mzdizmf3mlcb>
Content-Language: en-US
From: Damon Ding <damon.ding@rock-chips.com>
In-Reply-To: <ay2im4itrj3k4p2ksobgsk77b7m4laaxctkfcpffqxj5ttxenm@mzdizmf3mlcb>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGh0fHVYYQxlMQh9DS0lMGEhWFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSUhCSE
	NVSktLVUpCS0tZBg++
X-HM-Tid: 0a93cef75dd303a3kunm5dd55b80
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6Pxw6TCo6LjIREBkNNwNINi8T
	VjAwCw1VSlVKTEhPSE9PSkhCQkhCVTMWGhIXVR8aFhQVVR8SFRw7CRQYEFYYExILCFUYFBZFWVdZ
	EgtZQVlOQ1VJSVVMVUpKT1lXWQgBWUFJS09KNwY+
DKIM-Signature: a=rsa-sha256;
	b=TC9dxZs/icAtO8OBygxS0RnpXEPu9qYtxe8eogDOgm3/nfYNDxZL7DAwNK72v5fA1kE1RnEuSUkU6dFhcd5nbWBqLdG0NiliydADY/owu7A8t1jtyNkaGpqpmRY3ifAaE2oMxgKBvn2obvJIaxk6h2pfI+KeVfL0pujMSR5MSyY=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=bIZOhBSbBlumClO+5WBpvKWp8vXqGKwf+GCHshUCQ6I=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241216_021543_354964_4400587A 
X-CRM114-Status: GOOD (  12.92  )
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

Hi Dmitry,

On 2024/12/16 17:06, Dmitry Baryshkov wrote:
> On Mon, Dec 16, 2024 at 11:12:24AM +0800, Damon Ding wrote:
>> Add the necessary DT changes to enable eDP0 on RK3588S EVB1 board:
>> - Add edp-panel node
>> - Set pinctrl of pwm12 for backlight
>> - Enable edp0/hdptxphy0/vp2
>>
>> Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
>>
>> ---
>>
>> Changes in v2:
>> - Remove brightness-levels and default-brightness-level properties in
>>    backlight node.
>> - Add the detail DT changes to commit message.
>> ---
>>   .../boot/dts/rockchip/rk3588s-evb1-v10.dts    | 50 +++++++++++++++++++
>>   1 file changed, 50 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-evb1-v10.dts b/arch/arm64/boot/dts/rockchip/rk3588s-evb1-v10.dts
>> index bc4077575beb..5c1ea25b6524 100644
>> --- a/arch/arm64/boot/dts/rockchip/rk3588s-evb1-v10.dts
>> +++ b/arch/arm64/boot/dts/rockchip/rk3588s-evb1-v10.dts
>> @@ -9,6 +9,7 @@
>>   #include <dt-bindings/gpio/gpio.h>
>>   #include <dt-bindings/input/input.h>
>>   #include <dt-bindings/pinctrl/rockchip.h>
>> +#include <dt-bindings/soc/rockchip,vop2.h>
>>   #include <dt-bindings/usb/pd.h>
>>   #include "rk3588s.dtsi"
>>   
>> @@ -120,6 +121,18 @@ backlight: backlight {
>>   		pwms = <&pwm12 0 25000 0>;
>>   	};
>>   
>> +	edp_panel: edp-panel {
>> +		compatible = "lg,lp079qx1-sp0v";
> 
> Please use aux-bus and a generic "edp-panel" entry for newer platforms
> instead of declaring the panel on the platform bus. Placing eDP panels
> on the platform bus has been deprecated for quite a while.

I will apply the aux-bus in the next version. :-)

> 
>> +		backlight = <&backlight>;
>> +		power-supply = <&vcc3v3_lcd_edp>;
>> +
>> +		port {
>> +			panel_in_edp: endpoint {
>> +				remote-endpoint = <&edp_out_panel>;
>> +			};
>> +		};
>> +	};
>> +
>>   	combophy_avdd0v85: regulator-combophy-avdd0v85 {
>>   		compatible = "regulator-fixed";
>>   		regulator-name = "combophy_avdd0v85";
> 
Best regards,
Damon

