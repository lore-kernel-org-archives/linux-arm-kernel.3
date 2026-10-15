Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC8C4CC6B2D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Oct 2026 02:26:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:Cc:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vp2SpKAypkVSfLwmsVtgSuvUILnoRWt5eBLTi3/1asg=; b=QLwY1WHoK07iWDpw72xCc6CrGC
	yFlp4JKKEQGK/MB4XktTP+eb2orWBGeISOvrfD8ThU/9CmfFkiGpidnJW9ef4Ac8breNRnaqv6Q3o
	f6YqDBIJTqNBoLlC7Q7BeJ8NVjMZziOqFkRN7bK46Y3rSlnRhZtDxpqRSR59ZcJ0+EOuoQX/XBn0i
	KQQjv8g3SuS8PEkO9bpn+CHsKyeSxUTgMDoniwtd4T/MqIbz6xHLZif4Kuven6V2kv8+0PAIHvP3F
	KM4pj+MRDT3JG4DqWnSm0kj6/lC7Ohn3UiqHE6jMr4+bq5WBqy9ffRBZZPro0WYGKOUsC3Lo/b3I3
	X4BfMv5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHBB4-0000000GfE5-2US8;
	Thu, 15 Oct 2026 02:26:42 +0000
Received: from mail-m12813.netease.com ([103.209.128.13])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHBB0-0000000GfD2-07SS;
	Thu, 15 Oct 2026 02:26:40 +0000
Received: from [172.16.12.48] (unknown [61.154.14.86])
	by smtp.qiye.163.com (Hmail) with ESMTP id 5118e404e;
	Thu, 15 Oct 2026 10:26:22 +0800 (GMT+08:00)
Message-ID: <d7db7de5-4972-4dd0-85a3-e310dcabc41e@rock-chips.com>
Date: Thu, 15 Oct 2026 10:26:22 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: shawn.lin@rock-chips.com, Diederik de Haas <diederik@cknow-tech.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org
Subject: Re: [PATCH 1/9] arm64: dts: rockchip: rk3588s-nanopi: fix sd min/max
 voltage
To: joachim.eastwood@gmail.com, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
References: <20261014-nanopi-m6-improvements-v1-0-e713f71eb4d3@gmail.com>
 <20261014-nanopi-m6-improvements-v1-1-e713f71eb4d3@gmail.com>
From: Shawn Lin <shawn.lin@rock-chips.com>
In-Reply-To: <20261014-nanopi-m6-improvements-v1-1-e713f71eb4d3@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa13d61ced903a4kunma3935b973a1b6b
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlDT0tIVh8eQkseSBkeGENLGVYVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlNSlVKTk9VSk9VQ01ZV1kWGg8SFR0UWUFZT0tIVUpLSU
	9PT0hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=bPSPIGgCYsm60FR/2OenmMqXm/1ZYlWtn9B+4FhIG6oMbhP/OT606vuKuQTk4WTYqL6CWWtX/PtaNWp8DCLWMfhhi+H2zUO7mKKs7753r00EipVTOkj1i63gwwDGKTZwDuaKvc919fok6RGynOEEnLxXa+0ZyIk+RP8ZPi5Yp2I=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=vp2SpKAypkVSfLwmsVtgSuvUILnoRWt5eBLTi3/1asg=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261014_192638_644752_DC412AFF 
X-CRM114-Status: GOOD (  14.26  )
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

Hi Joachim,

在 2026/10/15 星期四 0:33, Joachim Eastwood via B4 Relay 写道:
> From: Joachim Eastwood <joachim.eastwood@gmail.com>
> 
> This regulator is only a simple power switch and cannot change the
> output voltage.
> 

It would be better if you could put the schematicinto the cover letter
so folks could check it easily.

https://wiki.friendlyelec.com/wiki/images/8/85/NanoPi_M6_2405_SCH.PDF

Reviewed-by: Shawn Lin <Shawn.lin@rock-chips.com>

> Fixes: c08257d642ac ("arm64: dts: rockchip: refactor rk3588s-nanopi-r6 to support M6 boards")
> Signed-off-by: Joachim Eastwood <joachim.eastwood@gmail.com>
> ---
>   arch/arm64/boot/dts/rockchip/rk3588s-nanopi.dtsi | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-nanopi.dtsi b/arch/arm64/boot/dts/rockchip/rk3588s-nanopi.dtsi
> index 22b0cdee22b4..8c36268e9876 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3588s-nanopi.dtsi
> +++ b/arch/arm64/boot/dts/rockchip/rk3588s-nanopi.dtsi
> @@ -79,8 +79,8 @@ vcc_3v3_sd_s0: regulator-vcc-3v3-sd-s0 {
>   		pinctrl-0 = <&sd_s0_pwr>;
>   		regulator-name = "vcc_3v3_sd_s0";
>   		regulator-boot-on;
> -		regulator-max-microvolt = <3000000>;
> -		regulator-min-microvolt = <3000000>;
> +		regulator-max-microvolt = <3300000>;
> +		regulator-min-microvolt = <3300000>;
>   		vin-supply = <&vcc_3v3_s3>;
>   	};
>   
> 


