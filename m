Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A5ECF506D0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Mar 2026 13:45:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EsoCTDVRo+rwPDPpTHK76+764H+MxyBChVTGTOtAaHo=; b=LWuAqd9Oi5loDPWGMuIfoBP3H5
	StPRgayMiXURRXc22h83rf7p8j2ynBs0da7lEX0Mzqy1Vx7Wj+6MF2PbaMJ9SiI5MDFsJd9bYSk34
	V9R0wK+ocaX81hmBC5Pai5qmkqHIUkiZWVdUR9Axda4qSebkCE1Ovn0d2P5eGuUW6C+MvbnIdfUXZ
	Q0O44CM7RAmeG65iwBemhdubmoPqTSa4fGVk1WopiTIJWoK7l7MS/p84l58AB+MTzOdf5AfPdkqsT
	hnmkossyGueQxsPt0YCxJ4Rm2LPERjfqVOS1t1+bj1Vs93ie2SncgYEZEmPrMv6xBkwdNpYgWpKDf
	wpAGCwlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w28Fv-0000000464W-3gMN;
	Mon, 16 Mar 2026 13:45:15 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w28Fq-00000004631-1HR3
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Mar 2026 13:45:12 +0000
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=[127.0.0.1])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <a.fatoum@pengutronix.de>)
	id 1w28FR-0007l4-6I; Mon, 16 Mar 2026 14:44:45 +0100
Message-ID: <ea59ff34-73f2-491c-88cf-51d1ac3db424@pengutronix.de>
Date: Mon, 16 Mar 2026 14:44:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 6/7] arm64: dts: imx8mp-evk: add board-level mux for
 CAN2 and MICFIL
To: Frank Li <Frank.Li@nxp.com>, Peter Rosin <peda@axentia.se>,
 Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>
Cc: imx@lists.linux.dev, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Haibo Chen <haibo.chen@nxp.com>,
 linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20260311-pinctrl-mux-v3-0-236b1c17bf9b@nxp.com>
 <20260311-pinctrl-mux-v3-6-236b1c17bf9b@nxp.com>
From: Ahmad Fatoum <a.fatoum@pengutronix.de>
Content-Language: en-US, de-DE, de-BE
In-Reply-To: <20260311-pinctrl-mux-v3-6-236b1c17bf9b@nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: a.fatoum@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260316_064510_354727_3C4C6A81 
X-CRM114-Status: GOOD (  16.98  )
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

On 3/11/26 8:08 PM, Frank Li wrote:
> The board integrates an on-board mux to route shared signals to either
> CAN2 or PDM (MICFIL). The mux is controlled by a GPIO.
> 
> Add a pinctrl-based multiplexer node to describe this routing and ensure
> proper probe ordering of the dependent devices.
> 
> Previously, MICFIL operation implicitly depended on the default level of
> PCA6416 GPIO3. After adding the pinctrl-multiplexer, make the dependency
> explicit.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

Reviewed-by: Ahmad Fatoum <a.fatoum@pengutronix.de>

I really like this new abstraction.

> +	can_mux_pinctrl: pinctrl-gpiomux {
> +		compatible = "pinctrl-multiplexer";
> +
> +		can_fun: can-grp {
> +			mux-states = <&can_mux 1>;
> +		};
> +
> +		pdm_fun: pdm-grp {
> +			mux-states = <&can_mux 0>;
> +		};
> +	};

Just to make sure: If both &flexcan2 and &micfil were enabled at the
same time, the existing pinctrl clash detection will also work for this
new pinctrl-multiplexer and point that out, right?

Thanks,
Ahmad

> +
>  	memory@40000000 {
>  		device_type = "memory";
>  		reg = <0x0 0x40000000 0 0xc0000000>,
> @@ -446,7 +465,7 @@ &flexcan1 {
>  
>  &flexcan2 {
>  	pinctrl-names = "default";
> -	pinctrl-0 = <&pinctrl_flexcan2>;
> +	pinctrl-0 = <&pinctrl_flexcan2>, <&can_fun>;
>  	phys = <&flexcan_phy 1>;
>  	status = "disabled";/* can2 pin conflict with pdm */
>  };
> @@ -712,7 +731,7 @@ &lcdif3 {
>  &micfil {
>  	#sound-dai-cells = <0>;
>  	pinctrl-names = "default";
> -	pinctrl-0 = <&pinctrl_pdm>;
> +	pinctrl-0 = <&pinctrl_pdm>, <&pdm_fun>;
>  	assigned-clocks = <&clk IMX8MP_CLK_PDM>;
>  	assigned-clock-parents = <&clk IMX8MP_AUDIO_PLL1_OUT>;
>  	assigned-clock-rates = <196608000>;
> 

-- 
Pengutronix e.K.                  |                             |
Steuerwalder Str. 21              | http://www.pengutronix.de/  |
31137 Hildesheim, Germany         | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686  | Fax:   +49-5121-206917-5555 |


