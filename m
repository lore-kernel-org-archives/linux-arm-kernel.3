Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDBE7C79F99
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Sep 2026 00:02:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9TKY+WKMU/hlpro13zs9PIfG/cMTHwyWmJrdHsLOOBw=; b=lewVJlP1P8BSdU/Dtu1AzwE8v2
	Hn5UbRSzSMfszO5h0VR55+M2HFHwM21mk8RdEx206Jcx/QML7I46e763O6a+8KqaqGjtJdDmgNBGP
	SGt0zHonDGPy8kFEthcUVgddnPybfaVbGkfpyTRaGmijdjSBCy7MFsPSZCVTyoTcQstbBnNWrkQSx
	72oc/pkyl/wWTBmiffsfGzm+KbBmHm3kw2V94gPF+kz9MQW/eujp91aLhvMfz9/eSVcUUxUsju5ks
	AGZe0/+Jq3+vji8pRWWqME/10hA/d/9xirihnOwMwPrUytUHnlemZL87RRAC6U1B+j61rgG9aAttP
	j21UiQag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3jII-00000007qvR-10Fk;
	Tue, 08 Sep 2026 00:02:34 +0000
Received: from vps.xff.cz ([195.181.215.36])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3jIF-00000007qut-2Oqr;
	Tue, 08 Sep 2026 00:02:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xff.cz; s=mail;
	t=1788825744; bh=AL638/hQUvxZ7ksKQGtecEARfPp3dotRpjQaGrQQF3M=;
	h=Date:From:To:Cc:Subject:X-My-GPG-KeyId:References:From;
	b=LLJ3/45b9JMUxcH9Gv9bEbtvgzTehRkBk1PVr7b1A0gcFD/djeAiJOIq0Gp0WkL5O
	 MTSM5hW4iVuKVzowUXDFTw2xZssxkEDQBHlKncvwi3mgM7YZekFFNmCfUoUqkwd5+i
	 /kniqUrNVz9nFw6MPZi5+YazHlaOZ7mQ7Eyep+XU=
Date: Tue, 8 Sep 2026 02:02:24 +0200
From: =?utf-8?Q?Ond=C5=99ej?= Jirman <megi@xff.cz>
To: Igor Paunovic <royalnet026@gmail.com>
Cc: Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: rockchip: fix hym8563 interrupt pin on
 Orange Pi 5 Plus
Message-ID: <pzcclrj5h32i5sfjhv75ntyrcmlqf224pzgk7zmea64jsxcriw@ezb2fpcpw5zt>
Mail-Followup-To: =?utf-8?Q?Ond=C5=99ej?= Jirman <megi@xff.cz>, 
	Igor Paunovic <royalnet026@gmail.com>, Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org
X-My-GPG-KeyId: EBFBDDE11FB918D44D1F56C1F9F0A873BE9777ED
 <https://xff.cz/key.txt>
References: <20260906181622.11991-1-royalnet026@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260906181622.11991-1-royalnet026@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260907_170232_065686_D1E28175 
X-CRM114-Status: GOOD (  31.10  )
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

Hello,

On Sun, Sep 06, 2026 at 08:16:22PM +0200, Igor Paunovic wrote:
> The interrupt line of the hym8563 RTC on the Orange Pi 5 Plus is routed
> to GPIO0_C6, not GPIO0_B0. The vendor device tree uses RK_PC6 with a
> pull-up for this pin; the mainline board file uses RK_PB0, which is not
> connected to the RTC.
> 
> As a result the alarm interrupt never reaches the SoC, so the RTC alarm
> cannot wake the board: rtcwake enters s2idle and the board never
> returns, which looks like a hang.
> 
> This was verified on the board by enabling the alarm interrupt (AIE with
> AF already set, so INT# is asserted) and sampling the EXT_PORT register
> of all five GPIO banks: GPIO0_C6 is the only pad that follows AIE
> (high with AIE=0, low with AIE=1, across repeated cycles), while GPIO0_B0
> stays high and its interrupt counter stays at zero.
> 
> Switch the interrupt and its pinctrl entry to GPIO0_C6 and use a pull-up,
> as the vendor tree does for this open-drain line.
> 
> With this change the alarm interrupt fires while the system is running
> and the RTC wakes the board from s2idle ('PM: Triggering wakeup from
> IRQ 52'); before it, rtcwake never returned.
> 
> Fixes: 236d225e1ee7 ("arm64: dts: rockchip: Add board device tree for rk3588-orangepi-5-plus")
> Cc: stable@vger.kernel.org
> Assisted-by: LLM checkpatch dtbs_check
> Signed-off-by: Igor Paunovic <royalnet026@gmail.com>
> ---
> Notes for reviewers (not part of the commit message):
> 
> Measured on an Orange Pi 5 Plus with the vendor-style method described above
> (GPIO0 EXT_PORT sampled while toggling the alarm interrupt enable); the vendor
> device tree for this board uses RK_PC6 with a pull-up. With the fix the alarm
> IRQ fires at runtime and the RTC wakes the SoC from s2idle. Note that on this
> board the resume itself can still stall later in the USB 2.0 host controllers
> (a separate, unrelated issue being looked at); it does not affect this fix.
> 
>  arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-plus.dts | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-plus.dts b/arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-plus.dts
> index 145986695720..572b892e4066 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-plus.dts
> +++ b/arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-plus.dts
> @@ -189,7 +189,7 @@ &hdptxphy1 {
>  
>  &hym8563 {
>  	interrupt-parent = <&gpio0>;
> -	interrupts = <RK_PB0 IRQ_TYPE_LEVEL_LOW>;
> +	interrupts = <RK_PC6 IRQ_TYPE_LEVEL_LOW>;
>  	pinctrl-names = "default";
>  	pinctrl-0 = <&hym8563_int>;
>  };
> @@ -298,7 +298,7 @@ hdmi1_tx_on_h: hdmi1-tx-on-h {
>  
>  	hym8563 {
>  		hym8563_int: hym8563-int {
> -			rockchip,pins = <0 RK_PB0 RK_FUNC_GPIO &pcfg_pull_none>;
> +			rockchip,pins = <0 RK_PC6 RK_FUNC_GPIO &pcfg_pull_up>;

Schematic already shows a pullup, so this should not be needed:

  https://xff.cz/dl/tmp/2995ddec50ce4597.png

Other than that,

Reviewed-by: Ondrej Jirman <megi@xff.cz>

Thank you,
	o.

>  		};
>  	};
>  
> 
> base-commit: 1fc5a74b108fc90951890ec513ac81869f5eaff1
> -- 
> 2.43.0
> 

