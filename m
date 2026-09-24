Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8E03C9830E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Sep 2026 16:12:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RPplfzolB2pTnE62YOM17Sgrq0rS4rod1kMvEv6yvGI=; b=4iQ8tbq12ndBHcKbzhWLLbX29T
	l7MlHEzfV2Nkks/4rZGg/Dee/axaNQ23ai4Q9ekw189fqctAB2RLC/2qfvq/cog42vozGxleOVACt
	ImjX3+6UPHya2SeoenuI0+UWeKX+oAYfVFJ31tOsqXpBidBcPecfIjOyoBfbx+klDOKNxSQYd2Nur
	DD8KPu92WaVBVNEwuoCdcNL+oX/EI+MdLZcN7RA5h18N5WdIMyEvRPUT8oa+yRhb+b5/Onb9bWn7+
	tMcMP48ta96+TQvPM8ichMRtl+PJUGLEoSqz0y4iETXeJiR09RvHMk2dnHams3uo/4N6ugtrq1Dk+
	OTtN8Z0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9m3V-0000000BYoH-0r71;
	Thu, 24 Sep 2026 16:12:17 +0000
Received: from smtp.forwardemail.net ([121.127.44.66])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9m3T-0000000BYnS-1Xn3
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Sep 2026 16:12:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: Content-Type: In-Reply-To: From: References:
 Cc: To: Subject: MIME-Version: Date: Message-ID; q=dns/txt;
 s=fe-e1b5cab7be; t=1790266333;
 bh=RPplfzolB2pTnE62YOM17Sgrq0rS4rod1kMvEv6yvGI=;
 b=BeF3eaIG+AEXEtaHIs7gJMEFhn5OC9a52/G58dRbamCfnQnGyh+Ue0Rjj+GCZYlpnn7Je7fcK
 7IT9/XDxJ7OTvDSyUBFIqhjnu1xezaby5u/zIDqrNR5G9IJYvQ5f2s+x1jng/ls0OzvxeFNch+R
 +vIm6gmb24M7KkStzZiD33/3upUk77Vi6j9rt07X+31uEknwC+mF+abfBiRZaMl/Gck8lPiTrkV
 WS5wH9jY9gN+ELrRXTmRt052DgfWZUgobopWpQbfluJ9/lYJuzUhy3CO61Qi7w00HKQivt1cwKi
 M3vErqjKF5l0Z+Wcf07Jk6VRJzgWPpzOBxET2K78hUNA==
X-Forward-Email-ID: 6ab54bdc57e24cb1e471d61c
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 121.127.44.66
X-Forward-Email-Version: 2.16.2
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
Message-ID: <e03db2e9-085b-49ff-8d4a-bc112bc4ddd7@kwiboo.se>
Date: Thu, 24 Sep 2026 18:12:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] arm64: dts: rockchip: Enable USB 2.0 host1 on Radxa
 ROCK 3B
To: Adam Wermuth <adam@wermuth.pl>, Heiko Stuebner <heiko@sntech.de>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20260924071445.441822-1-adam@wermuth.pl>
 <20260924071445.441822-2-adam@wermuth.pl>
Content-Language: en-US
From: Jonas Karlman <jonas@kwiboo.se>
In-Reply-To: <20260924071445.441822-2-adam@wermuth.pl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260924_091215_454752_1724AACC 
X-CRM114-Status: GOOD (  15.51  )
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

Hi Adam,

On 9/24/2026 9:14 AM, Adam Wermuth wrote:
> The USB 2.0 data lines of the M.2 B-key slot are routed to USB2_HOST3,
> which is served by usb_host1_ehci/ohci through the host port of
> usb2phy1. Enable the controllers and the PHY port so that modules in
> the B-key slot, such as LTE modems, can enumerate.

This and next patch is likely best suited as an dt-overlay.

Regards,
Jonas

> 
> Signed-off-by: Adam Wermuth <adam@wermuth.pl>
> ---
>  arch/arm64/boot/dts/rockchip/rk3568-rock-3b.dts | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/rockchip/rk3568-rock-3b.dts b/arch/arm64/boot/dts/rockchip/rk3568-rock-3b.dts
> index 149a5306bb03..ad9a91c0d0d0 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3568-rock-3b.dts
> +++ b/arch/arm64/boot/dts/rockchip/rk3568-rock-3b.dts
> @@ -758,6 +758,14 @@ &usb_host0_xhci {
>  	status = "okay";
>  };
>  
> +&usb_host1_ehci {
> +	status = "okay";
> +};
> +
> +&usb_host1_ohci {
> +	status = "okay";
> +};
> +
>  &usb_host1_xhci {
>  	status = "okay";
>  };
> @@ -780,6 +788,11 @@ &usb2phy1 {
>  	status = "okay";
>  };
>  
> +&usb2phy1_host {
> +	phy-supply = <&vcc5v0_usb_host>;
> +	status = "okay";
> +};
> +
>  &usb2phy1_otg {
>  	phy-supply = <&vcc5v0_usb_host>;
>  	status = "okay";


