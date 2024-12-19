Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5273E77188
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Dec 2024 01:28:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UfV7vLRVNdO5jRgpw0XUomLCucGuvPX5lVmqJYm7acg=; b=TY8stqJBThF2P90Gjy7IkBMhaB
	IN7HdXfi7bErThvr+CPx2JRnNjk4Z7zCsC8P5CG+lYMfjIL1QyC2u2ipKvoZBx72lUBZu7X24r+RK
	CUDu+i9sWO34WlP4XMT/FGGCUCnU755ui1QMwAQ93WV7dwKS9FoGAx84hDbQErVXwBaIaBhAr2Rra
	kpC16DmuZmffYP9PXFthj9l5CRylfmCORjm2UFMYIEkxucOVcqVJNfdR5C/iaVkWL5bNNAA8+x8xf
	uRHOuHQTP/xQoo9G2NxPBB3JpZtuHtDcichqws+KgkAfOFCFHTFE4ilpPOkXzVm8Yddnm5uUuXe7X
	p7pWQUXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tO5L9-00000000V5J-2Axk;
	Thu, 19 Dec 2024 01:28:35 +0000
Received: from mail-m1973176.qiye.163.com ([220.197.31.76])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tO5K2-00000000UxN-0yuA;
	Thu, 19 Dec 2024 01:27:27 +0000
Received: from [172.16.12.26] (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 627357bb;
	Thu, 19 Dec 2024 09:27:17 +0800 (GMT+08:00)
Message-ID: <5562ec11-c3f5-4068-8ad0-6e93924228ed@rock-chips.com>
Date: Thu, 19 Dec 2024 09:27:18 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 11/11] arm64: dts: rockchip: Add nodes related to eDP1
 for RK3588
To: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 rfoss@kernel.org, vkoul@kernel.org, sebastian.reichel@collabora.com,
 cristian.ciocaltea@collabora.com, l.stach@pengutronix.de,
 andy.yan@rock-chips.com, hjc@rock-chips.com, algea.cao@rock-chips.com,
 kever.yang@rock-chips.com, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org
References: <20241216031225.3746-1-damon.ding@rock-chips.com>
 <20241216031225.3746-12-damon.ding@rock-chips.com> <2173171.OBFZWjSADL@diego>
Content-Language: en-US
From: Damon Ding <damon.ding@rock-chips.com>
In-Reply-To: <2173171.OBFZWjSADL@diego>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGU0YS1YZTEgeGkoaTEpCTUlWFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSUhCSE
	NVSktLVUpCS0tZBg++
X-HM-Tid: 0a93dc86bce903a3kunm627357bb
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6PSo6Njo4DjIQLhcOC1FILC5R
	GA0KFA5VSlVKTEhPTkxKTUhCTUxMVTMWGhIXVR8aFhQVVR8SFRw7CRQYEFYYExILCFUYFBZFWVdZ
	EgtZQVlOQ1VJSVVMVUpKT1lXWQgBWUFJT0pKNwY+
DKIM-Signature: a=rsa-sha256;
	b=bqsYXHXs55Yr1VKXFAqKwbG3pTDI6pOf1MH+lSZfIXS47nhvI1Ig1J6qFhY7XwkQ92eu8xbX6iLMyX+f5DDUzaXBQd6rTVL18AG8SKr3Vz0udw1E9ygX+EJ4UJUevWRSsgYJxph/dEguPtw/SkA/zmtiVeNxhnWtBYr0liA0y8I=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=UfV7vLRVNdO5jRgpw0XUomLCucGuvPX5lVmqJYm7acg=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241218_172726_456873_F057CA4C 
X-CRM114-Status: GOOD (  13.59  )
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

Hi Heiko,

On 2024/12/18 20:45, Heiko Stübner wrote:
> Hi Damon,
> 
> Am Montag, 16. Dezember 2024, 04:12:25 CET schrieb Damon Ding:
>> The related nodes are hdptxphy1_grf, hdptxphy1 and edp1. And the
>> aliases edp0 and edp1 are added to separate two independent eDP
>> devices.
>>
>> Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
>> ---
>>   .../arm64/boot/dts/rockchip/rk3588-extra.dtsi | 55 +++++++++++++++++++
>>   1 file changed, 55 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/rockchip/rk3588-extra.dtsi b/arch/arm64/boot/dts/rockchip/rk3588-extra.dtsi
>> index 0ce0934ec6b7..17cc0b619744 100644
>> --- a/arch/arm64/boot/dts/rockchip/rk3588-extra.dtsi
>> +++ b/arch/arm64/boot/dts/rockchip/rk3588-extra.dtsi
>> @@ -7,6 +7,11 @@
>>   #include "rk3588-extra-pinctrl.dtsi"
>>   
>>   / {
>> +	aliases {
>> +		edp0 = &edp0;
>> +		edp1 = &edp1;
>> +	};
>> +
> 
> drop aliases please

I will drop it and use the registers to separate edp0 and edp1 in the 
next version.

> 
> 
>> @@ -67,6 +72,11 @@ u2phy1_otg: otg-port {
>>   		};
>>   	};
>>   
>> +	hdptxphy1_grf: syscon@fd5e4000 {
>> +		compatible = "rockchip,rk3588-hdptxphy-grf", "syscon";
>> +		reg = <0x0 0xfd5e4000 0x0 0x100>;
>> +	};
>> +
>>   	i2s8_8ch: i2s@fddc8000 {
>>   		compatible = "rockchip,rk3588-i2s-tdm";
>>   		reg = <0x0 0xfddc8000 0x0 0x1000>;
> 
>> @@ -395,6 +434,22 @@ sata-port@0 {
>>   		};
>>   	};
>>   
>> +	hdptxphy1: phy@fed70000 {
>> +		compatible = "rockchip,rk3588-hdptx-phy";
>> +		reg = <0x0 0xfed70000 0x0 0x2000>;
>> +		clocks = <&cru CLK_USB2PHY_HDPTXRXPHY_REF>, <&cru PCLK_HDPTX1>;
>> +		clock-names = "ref", "apb";
>> +		#phy-cells = <0>;
>> +		resets = <&cru SRST_HDPTX1>, <&cru SRST_P_HDPTX1>,
>> +			 <&cru SRST_HDPTX1_INIT>, <&cru SRST_HDPTX1_CMN>,
>> +			 <&cru SRST_HDPTX1_LANE>, <&cru SRST_HDPTX1_ROPLL>,
>> +			 <&cru SRST_HDPTX1_LCPLL>;
>> +		reset-names = "phy", "apb", "init", "cmn", "lane", "ropll",
>> +			      "lcpll";
>> +		rockchip,grf = <&hdptxphy1_grf>;
>> +		status = "disabled";
>> +	};
> 
> the hdptxphy nodes should be their own patch, also because most likely
> Cristian's patch for hdmi1 [0] will be slightly faster.

Indeed, it is good to add edp1 node only.

> 
> 
> [0] https://lore.kernel.org/r/20241211-rk3588-hdmi1-v2-2-02cdca22ff68@collabora.com
> 
> 
> 
> 
> 
Best regards,
Damon


