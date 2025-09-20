Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D274CAC597
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 20 Sep 2025 08:15:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:Cc:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nhhXvyJU4Q/ep+pG2LVNeGtKFMmPOfCIGjE2903J/IY=; b=scwXxA+Ffokph8at8vOMr2I8ZL
	B4eoPsCOVaNvSBNg8WRvoY+lRmuP5d6yS7AFIVmdRcWDi9mMkgt4ydBIkrECsuiyr0sK4uA2uGZjx
	V1EHhWKn8T6Sg67ZaejZ0G9lIfsc31oCvfDGbmUfRF6x6fckt4I7rA0CVF7B+I3eA4XxREXG0Hxn9
	Pce5MunX3wnOxQZte9pox1MYtIdIN6SbDDXYGTkC/W/A3yA2MVKOwwSYI0ZS2R+BtkjoZM+FQ9dud
	8UvTQCpjrgbPOC5xoPatHqJC0N0KqD6hdL0HH+AIzfWtJdrqK9ZFW85g9fu5cI/TrwgRYe5vUP2XB
	/TOVprxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzskH-0000000524d-15E1;
	Sat, 20 Sep 2025 08:15:01 +0000
Received: from smtp.forwardemail.net ([149.28.215.223])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzskF-00000005237-0iUI
	for linux-arm-kernel@lists.infradead.org;
	Sat, 20 Sep 2025 08:15:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: Content-Type: In-Reply-To: Cc: From:
 References: To: Subject: MIME-Version: Date: Message-ID; q=dns/txt;
 s=fe-e1b5cab7be; t=1758356097;
 bh=nhhXvyJU4Q/ep+pG2LVNeGtKFMmPOfCIGjE2903J/IY=;
 b=0eBvzGMsrD4zElBvN/3D7l46gdaULvTRYe+ejKdvTz8m3OdASYLRjaxd+erpiCD4uiXRkvgzu
 m5VcbPrAbH2o4fhe7K0Yv/HlX2XQ4Ts2eMMtziLOlWBrGLVSEKLEvyurIikZWB1py7o4OQcTRG5
 1Dwdt4ACJeUjcgyhemzTzveZSM+d1Y80LtMSrGa6zYfmsOzUHqQoSoFLTSvrDgdRb9ThvwX/llV
 rMzM8IbokeoolGWAsCTxk9kUMRw0KGD1Vxc2q8HBeo0doJrpFRlINVdA6dr312gtlu7bPw/a1MP
 0hz0Rn6UVtd3zX70tjYgKQamp3S9uPbJPm7TTihhcxYg==
X-Forward-Email-ID: 68ce627a528963d4864a57f8
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 149.28.215.223
X-Forward-Email-Version: 1.2.14
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
Message-ID: <07560892-6672-45a0-aa3d-79e47d145ff4@kwiboo.se>
Date: Sat, 20 Sep 2025 10:14:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] arm64: dts: rockchip: correct uart mux for Radxa ZERO
 3
To: Ed Wildgoose <lists@wildgooses.com>
References: <20250917114932.25994-1-lists@wildgooses.com>
 <20250917114932.25994-2-lists@wildgooses.com>
Content-Language: en-US
From: Jonas Karlman <jonas@kwiboo.se>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-rockchip@lists.infradead.org" <linux-rockchip@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
In-Reply-To: <20250917114932.25994-2-lists@wildgooses.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250920_011459_558862_62E1F240 
X-CRM114-Status: GOOD (  18.38  )
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

On 9/17/2025 1:49 PM, Ed Wildgoose wrote:
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

Please rephrase the commit subject and message, currently it seem to
imply that there is something broken that needs fixing, however this
mainly make it easier to apply an overlay that does not include
description of any changed behavior for pins on the 40-pin header.

Current expected behavior of the hw, using pins on 40-pin header as gpio
pins should already be correctly described in this board device tree.

My original intent when submitting board device trees, such as this one, 
is that a device tree overlay will fully describe any required changes.
Also I do not expect that using an overlay intended for an old vendor
kernel device tree will work as-is on mainline kernel device tree.

> 
> Signed-off-by: Ed Wildgoose <lists@wildgooses.com>
> ---
>  .../boot/dts/rockchip/rk3566-radxa-zero-3.dtsi    | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/rockchip/rk3566-radxa-zero-3.dtsi b/arch/arm64/boot/dts/rockchip/rk3566-radxa-zero-3.dtsi
> index 1ee5d96a4..41b3c4403 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3566-radxa-zero-3.dtsi
> +++ b/arch/arm64/boot/dts/rockchip/rk3566-radxa-zero-3.dtsi
> @@ -492,6 +492,21 @@ &uart2 {
>  	status = "okay";
>  };
>  
> +&uart4{

nit: missing space

> +    pinctrl-names = "default";
> +    pinctrl-0 = <&uart4m1_xfer>;

nit: seem to use space instead of tab, same for rest.

Regards,
Jonas

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
>  &usb_host0_xhci {
>  	status = "okay";
>  };


