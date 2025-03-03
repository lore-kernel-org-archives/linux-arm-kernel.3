Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DD63C282C6
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Mar 2025 12:18:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KMjrPT3L+/86EEodzD4BqzwXmz/Fyg900Uiu1GgDoFw=; b=cAmPC6YR0++MBWcYCnLrmbultn
	TaNO2FyYdQlVyaG7K6/5D08xDpUS3ZDLjfeEZ7IwXa5EPgAhX1xIbVT93ookFmah8TTqwghWxvqkx
	6a2u4W51Z8D4t1FT6UiTKqhPOncbUptLozs5dqcMCUHWdBjMmzPhwoDnruj6PH5ehxK1L9/aS9eHX
	edqfUPq5Aiu7EwzTp8OKfNPkweZgJYZLCiBhdg7ADjOfknEEDdpAt4lEM3mlXOdBhIA4oVwH+4pKc
	w9SM5/Yc7T2S773n6RZjpzhgGVa2PrqUg2vldQgdJIiHMU/CoQHGz58UQg/Uneoffbj7g4yli5B0i
	px3OMkyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tp4kz-00000000ihO-2TmN;
	Mon, 03 Mar 2025 12:18:49 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tp42C-00000000ZkS-0v5v;
	Mon, 03 Mar 2025 11:32:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1741001550;
	bh=A1dmoEW25l3ZJd4LiRioYAuKRWE98O7QHIl4r9uDJ1Q=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=HQcsNYUppNKgXqrJbXZmI8caBOH/CvXKfBkBRkoeSGjs3hCmBwwrCvJKHmTjD8Ltz
	 cOJOAdlO08oMAZxFvd5g1dgTWiHu6zIymywJ9i5Dmf9GReBYMoWgtNpcI+o/tBXrnM
	 6hbmgr7i+hI56tix5dsElSTaS3ZOdB1J9OTcDq135T58BnMRDRdKlSovz0j6nDDTsG
	 yeXh3roUTLRdlSR/eH5D77oUDhUTY4nIHfkm4wpYRL7fZtnAUMqC7vBDorRYyV3Q8L
	 wOC7oLSKjVsltBEryM9ukfhnsjAQo+Nex8rnbp7u1xiKTw6pLBJvx3DkT5O45tJfKH
	 wH4N+4ARMvJMA==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id D566D17E0607;
	Mon,  3 Mar 2025 12:32:29 +0100 (CET)
Message-ID: <fc0a9471-da47-4f4f-a471-1b20f344ad22@collabora.com>
Date: Mon, 3 Mar 2025 12:32:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] arm64: dts: mediatek: mt8395-nio-12l: Prepare MIPI
 DSI port
To: Julien Massot <julien.massot@collabora.com>, kernel@collabora.com,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20250226-radxa-panel-overlay-v1-0-9e8938dfbead@collabora.com>
 <20250226-radxa-panel-overlay-v1-1-9e8938dfbead@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250226-radxa-panel-overlay-v1-1-9e8938dfbead@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250303_033232_407599_33FA74D0 
X-CRM114-Status: GOOD (  21.60  )
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

Il 26/02/25 15:35, Julien Massot ha scritto:
> This board can use a MIPI-DSI panel on the DSI0 connector: in
> preparation for adding an overlay for the Radxa Display 8HD,
> add a pipeline connecting VDOSYS0 components to DSI0.
> 
> Also add the backlight, and some pin definitions available
> through the DSI0 port.
> 
> Signed-off-by: Julien Massot <julien.massot@collabora.com>
> ---
>   .../boot/dts/mediatek/mt8395-radxa-nio-12l.dts     | 60 ++++++++++++++++++++++
>   1 file changed, 60 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dts b/arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dts
> index 7184dc99296c7f5d749c7e6d378722677970b3b7..65c77e43d1cd4913b6741e25130febd746ff753c 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dts
> +++ b/arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dts
> @@ -48,6 +48,17 @@ memory@40000000 {
>   		reg = <0 0x40000000 0x1 0x0>;
>   	};
>   
> +	backlight: backlight {
> +		compatible = "pwm-backlight";
> +		brightness-levels = <0 1023>;
> +		default-brightness-level = <576>;
> +		enable-gpios = <&pio 107 GPIO_ACTIVE_HIGH>;
> +		num-interpolated-steps = <1023>;
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&dsi0_backlight_pins>;
> +		pwms = <&disp_pwm0 0 500000>;

This should be disabled, unless there is a display connected to the DSI connector.

If there's no display, there's no point in enabling any backlight, as that pin
may be reused somehow (with hardware hacks, maybe, yes, but still configuring
the PWM IP and the pin as PWM while unused is at least a waste of energy).

> +	};
> +
>   	wifi_vreg: regulator-wifi-3v3-en {
>   		compatible = "regulator-fixed";
>   		regulator-name = "wifi_3v3_en";
> @@ -499,9 +510,20 @@ &mt6359_vsram_others_ldo_reg {
>   	regulator-max-microvolt = <750000>;
>   };
>   
> +&ovl0_in {
> +	remote-endpoint = <&vdosys0_ep_main>;
> +};
> +

This goes to the overlay that enables the DSI display.

> @@ -912,6 +960,18 @@ &ssusb2 {
>   	status = "okay";
>   };
>   
> +&vdosys0 {
> +	port {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		vdosys0_ep_main: endpoint@0 {
> +			reg = <0>;
> +			remote-endpoint = <&ovl0_in>;
> +		};
> +	};
> +};

If you enable this path, in the event that the DSI display overlay is not added,
the mediatek-drm driver will fail probing: even if a second path is enabled and
that will succeed regardless of the first one failing, I don't see a reason why
whoever doesn't have a DSI display attached should see a miserable failure in the
kernel log :-)

Besides, mediatek-drm failing will also slow down boot for no reason.... etc etc.

Please move the display path setup to the DSI display overlay.

Thanks,
Angelo

> +
>   &xhci0 {
>   	vbus-supply = <&otg_vbus_regulator>;
>   	status = "okay";
> 


