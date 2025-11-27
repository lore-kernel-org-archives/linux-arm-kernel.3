Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECBCCCFD2F6
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Nov 2025 15:11:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EaTOVJoMb3GVdUlxOvtR/lv+2wvrGaK2bk6xiFUlwXc=; b=SFQ1FntHmr0JBqtWfDl13HZeUq
	JjR+/KuGhoIMMID82sFlzAEhSoaiMjNex4APfYX0Nt0hwMnf9bLzo5r1DV7Z9Yp1V5Q7aDE14CPPB
	c9oIM/qvabtKfrzZMQb3A6hDCUb8D60tRWs5K0+Ob6ijY6nJ40IXhsi2dT5KFG3Ql6NwnTT2NY/Sm
	vvCSeKGHETJfkjkUSTtzaM8x35AB4NdLmeP3gFsQb64208qa4P0ChH0HzkiBPZMoUT5K6dvZaVNvC
	Ll9eVT8jRDXgoYTovgMEs9boPJktFBUe/akYyHulhksz3MIjpuV21ra5HhPMtCkuEKIJy0x1WQx6C
	ySbgS4Ow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOdeI-0000000GpOL-2u5J;
	Thu, 27 Nov 2025 15:11:10 +0000
Received: from smtp.forwardemail.net ([149.28.215.223])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOdeC-0000000GpNN-22n3
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Nov 2025 15:11:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: Content-Type: In-Reply-To: From: References:
 Cc: To: Subject: MIME-Version: Date: Message-ID; q=dns/txt;
 s=fe-e1b5cab7be; t=1764256262;
 bh=EaTOVJoMb3GVdUlxOvtR/lv+2wvrGaK2bk6xiFUlwXc=;
 b=S7/ichRQw4mSQ0waNcTMwskINLQ3pQjap+Se/BEUaudP7h4S7t09MY/QcelCogcw//S6zxsw/
 ZPC7SzmSoF9z9ycYxUV7gUuO/CXWR2JEMOlWFBB7w03aQfzpWeU8ZCLykg8DgS2xyNQiUAX7Dud
 Qmr9Ov7NrCM/gseDwzmR8DQIkS8ermOlfI7wDWQAU+nD3VgI7359stoRFWO1du3pH0hiyx/mPe6
 E1Zebg1EUqGjlVl8MpnRfm1tuMfgTzn/edCEKLJ4SSPVr0oWYxGZeVN5Q1L7/XlvguDJW4XMQIz
 ZtoHTh9q6YkPVAltoVsoESnuwtbQ0XRfPAxl/ZTpxOdg==
X-Forward-Email-ID: 692869f2361c660d902bad35
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 149.28.215.223
X-Forward-Email-Version: 1.6.3
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
Message-ID: <ab1d240f-4130-4088-9ead-9fb562ee9ad2@kwiboo.se>
Date: Thu, 27 Nov 2025 16:10:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Revert "arm64: dts: rockchip: fix audio-supply for Rock
 Pi 4"
To: Quentin Schulz <foss+kernel@0leil.net>, FUKAUMI Naoki <naoki@radxa.com>,
 Heiko Stuebner <heiko@sntech.de>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Alex Bee <knaerzche@gmail.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 Quentin Schulz <quentin.schulz@cherry.de>, stable@vger.kernel.org,
 Heinrich Schuchardt <xypron.glpk@gmx.de>
References: <20251127-rock-pi-4-io-domain-apio5-v1-1-9cb92793f734@cherry.de>
Content-Language: en-US
From: Jonas Karlman <jonas@kwiboo.se>
In-Reply-To: <20251127-rock-pi-4-io-domain-apio5-v1-1-9cb92793f734@cherry.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251127_071104_560310_CE517258 
X-CRM114-Status: GOOD (  23.52  )
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

Hi Quentin,

On 11/27/2025 3:36 PM, Quentin Schulz wrote:
> From: Quentin Schulz <quentin.schulz@cherry.de>
> 
> This reverts commit 8240e87f16d17a9592c9d67857a3dcdbcb98f10d.
> 
> The original commit claimed that APIO5 IO domain (supplied with
> audio-supply) is supplied by RK808-D Buck 4 as stated in the schematics.
> 
> The linked PDF has two non-schematics pages where APIO5 indeed is said
> to be 1.8V. Reading the actual schematics[1][2][3][4][5][6][7][8], this
> is actually wrong as APIO5 is supplied VCC_3V0 which is LDO8 from
> RK808-D and is 3.0V instead of 1.8V from vcca1v8_codec.
> 
> This fixes the console disappearing in U-Boot, where the Device Tree is
> imported from the Linux kernel repo, when the IO domain driver is built,
> as reported by Heinrich[9]. As to why this breaks the console while the
> serial is not exposed on any of the pins on the bank in the APIO5
> domain, that is a well-kept secret by the SoC for now.
> 
> The issue "fixed" by the original commit will need to be fixed another
> way.
> 
> [1] https://dl.radxa.com/rockpi4/docs/hw/rockpi4/4ap/radxa_rock_4ap_v1600_schematic.pdf
> [2] https://dl.radxa.com/rockpi4/docs/hw/rockpi4/4ap/radxa_rock_4ap_v1730_schematic.pdf
> [3] https://dl.radxa.com/rockpi4/docs/hw/rockpi4/4bp/radxa_rock_4bp_v1600_schematic.pdf
> [4] https://dl.radxa.com/rockpi4/docs/hw/rockpi4/4bp/radxa_rock_4bp_v1730_schematic.pdf
> [5] https://dl.radxa.com/rockpi4/docs/hw/rockpi4/ROCK-4-SE-V1.53-SCH.pdf
> [6] https://dl.radxa.com/rockpi4/docs/hw/rockpi4/4b/ROCK_4B_v1.52_SCH.pdf
> [7] https://dl.radxa.com/rockpi4/docs/hw/rockpi4/4a/ROCK_4A_V1.52_SCH.pdf
> [8] https://dl.radxa.com/rockpi4/docs/hw/rockpi4/rockpi4_v13_sch_20181112.pdf
> [9] https://lore.kernel.org/u-boot/e7b7b905-4a6c-4342-b1a5-0ad32a5837cf@gmx.de/
> 
> Cc: stable@vger.kernel.org
> Reported-by: Heinrich Schuchardt <xypron.glpk@gmx.de>
> Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
> ---
> Note: I do not own any of the Rock Pi 4 variants so I cannot work on
> fixing the original issue report by Alex.
> ---
>  arch/arm64/boot/dts/rockchip/rk3399-rock-pi-4.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/rockchip/rk3399-rock-pi-4.dtsi b/arch/arm64/boot/dts/rockchip/rk3399-rock-pi-4.dtsi
> index 046dbe3290178..fda7ea87e4efc 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3399-rock-pi-4.dtsi
> +++ b/arch/arm64/boot/dts/rockchip/rk3399-rock-pi-4.dtsi
> @@ -516,7 +516,7 @@ &i2s2 {
>  };
>  
>  &io_domains {
> -	audio-supply = <&vcca1v8_codec>;
> +	audio-supply = <&vcc_3v0>;

This revert/patch seem to be identical to the following patch from a
month ago:

https://lore.kernel.org/all/20251027005220.22298-1-naoki@radxa.com/

Regards,
Jonas

>  	bt656-supply = <&vcc_3v0>;
>  	gpio1830-supply = <&vcc_3v0>;
>  	sdmmc-supply = <&vcc_sdio>;
> 
> ---
> base-commit: 765e56e41a5af2d456ddda6cbd617b9d3295ab4e
> change-id: 20251127-rock-pi-4-io-domain-apio5-26bc2afa8224
> 
> Best regards,


