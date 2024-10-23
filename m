Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03D00CDDE6E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Oct 2024 11:47:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hzwe8zczVUFeHqyn3g0svpr9zuKaqa1l8oGx78Bs5ns=; b=zOf0ncWwwrXeiPgyPyWuuAfyMa
	nRZkVzNw4/9F5G5fC41DB2fUsQscx780A1FSG59fMbmcvB73zgErC4ChIFdp6VhvHrxKQQS/NPHYh
	PLmnwJH82MByVWch1TYB4aHIK+O3G00KZDdKkn+N08z6b8ZCFTHKuLzneyIuydm5HeNJc7jjjr+xB
	dIgmV2yz5bq2W3KVJIor6lwAjwbaX9Di5lSCpumWLnxWNzhZgaIyPxn7AKfnjUQnVDwUQ4otOrRRx
	+tLLTfWPqkoqDSMBLU9KtnXnLe/Ygp3oDWuRRZjsDzsVi254l3CWLoIvDzNqUvYhH+dE9mFvvNGDu
	xYaC1WgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3Zq1-0000000ECfL-0dPu;
	Wed, 23 Oct 2024 11:47:41 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3ZCo-0000000E5Xw-3Niv;
	Wed, 23 Oct 2024 11:07:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1729681629;
	bh=8e9uBwaZxAnoAdX6FU+kL2IHiXRh0zZ7Wcs7TopuVBE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=d/ifaD7mUx7X3IC0sUiN+TzLsGOnIissTUtkkov9oiM6M80qbQb8Wdw8uNu3VN3ya
	 KSaLoOPBAbdkn80Dl1v7+TffChDjMZx6lY5eaxKp901LQSgDikS1pYR3sy1fJXFQWH
	 Kdw4xCBaTDj0BQQpc3VKsfi/taKkGbi6NACPAR2qSFP5Bdpgv+0D1YK8jNUl8p+Dj0
	 GgT9RVuEeQv0eTz3bfIICC1eAJTL9qOKKVgvcdpcZ7/6Q2jm38yinigR0f2/mVj41E
	 +Lh3v5zBBfy3oq9/wLBTQ0OlmfWeY+NEHlWI+HQe/RUP77qCjKPkVTicwrWG78AOL1
	 5G2OsIYIKQNcQ==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id B624217E1576;
	Wed, 23 Oct 2024 13:07:08 +0200 (CEST)
Message-ID: <c4b5e78e-5337-464c-9dca-9d4e5353cc46@collabora.com>
Date: Wed, 23 Oct 2024 13:07:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] arm64: dts: mediatek: mt8395-genio-1200-evk: add
 support for TCPC port
To: Macpaul Lin <macpaul.lin@mediatek.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Alexandre Mergnat <amergnat@baylibre.com>
Cc: Bear Wang <bear.wang@mediatek.com>, Pablo Sun <pablo.sun@mediatek.com>,
 Macpaul Lin <macpaul@gmail.com>,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-usb@vger.kernel.org, Chris-qj chen <chris-qj.chen@mediatek.com>,
 Fabien Parent <fparent@baylibre.com>,
 Yow-Shin Liou <yow-shin.liou@mediatek.com>,
 Simon Sun <simon.sun@yunjingtech.com>
References: <20241023080912.15349-1-macpaul.lin@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20241023080912.15349-1-macpaul.lin@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241023_040711_039545_CF334F15 
X-CRM114-Status: GOOD (  20.73  )
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

Il 23/10/24 10:09, Macpaul Lin ha scritto:
> From: Fabien Parent <fparent@baylibre.com>
> 
> Enable USB Type-C support on MediaTek MT8395 Genio 1200 EVK by adding
> configuration for TCPC Port, USB-C connector, and related settings.
> 
> Configure dual role switch capability, set up PD (Power Delivery) profiles,
> and establish endpoints for SSUSB (SuperSpeed USB).
> 
> Update pinctrl configurations for U3 P0 VBus default pins and set dr_mode
> to "otg" for OTG (On-The-Go) mode operation.
> 
> Signed-off-by: Fabien Parent <fparent@baylibre.com>
> Signed-off-by: Yow-Shin Liou <yow-shin.liou@mediatek.com>
> Signed-off-by: Simon Sun <simon.sun@yunjingtech.com>
> Signed-off-by: Macpaul Lin <macpaul.lin@mediatek.com>
> ---
>   .../dts/mediatek/mt8395-genio-1200-evk.dts    | 54 +++++++++++++++++++
>   1 file changed, 54 insertions(+)
> 
> Changes for v2:
>   - Drop the no need '1/2' DT Schema update patch in the 1st version.
>   - Fix intent for 'ports' node, it should under the 'connector' node.
>   - Correct the index for 'port@0' and 'port@1' node.
> 
> Changes for v3:
>   - Correct the order between new added nodes.
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk.dts b/arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk.dts
> index 5f16fb820580..83d520226302 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk.dts
> +++ b/arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk.dts
> @@ -335,6 +335,43 @@ mt6360_ldo7: ldo7 {
>   				regulator-always-on;
>   			};
>   		};
> +
> +		tcpc {
> +			compatible = "mediatek,mt6360-tcpc";
> +			interrupts-extended = <&pio 17 IRQ_TYPE_LEVEL_LOW>;
> +			interrupt-names = "PD_IRQB";
> +
> +			connector {
> +				compatible = "usb-c-connector";
> +				label = "USB-C";
> +				data-role = "dual";

op-sink-microwatt goes here

> +				power-role = "dual";
> +				try-power-role = "sink";
> +				source-pdos = <PDO_FIXED(5000, 1000, \
> +					       PDO_FIXED_DUAL_ROLE | \
> +					       PDO_FIXED_DATA_SWAP)>;

Please fix the indentation (and also you don't need the escaping)

				source-pdos = <PDO_FIXED(5000, 1000,
							 PDO_FIXED_DUAL_ROLE |
							 PDO_FIXED_DATA_SWAP)>;

> +				sink-pdos = <PDO_FIXED(5000, 2000, \
> +					     PDO_FIXED_DUAL_ROLE | \
> +					     PDO_FIXED_DATA_SWAP)>;
> +				op-sink-microwatt = <10000000>;
> +
> +				ports {
> +					#address-cells = <1>;
> +					#size-cells = <0>;
> +
> +					port@0 {
> +						reg = <0>;

Just to make sure that this is ok: are you sure that this port supports
SuperSpeed (physical connector too) and that it's not limited to HighSpeed?

I have seen Rob's comment stating that ssusb_ep goes to port@1, but I think
that his comment came after reading "ss" in "ssusb": while the controller
does surely support SS, if the port does not, this should still go to port@0.

P.S.: I didn't check the schematics - just please make sure it's correct, and
       that this actually works.

> +					};
> +
> +					port@1 {
> +						reg = <1>;
> +						mt6360_ssusb_ep: endpoint {
> +							remote-endpoint = <&ssusb_ep>;
> +						};
> +					};
> +				};
> +			};
> +		};
>   	};
>   };
>   
> @@ -770,6 +807,13 @@ pins-reset {
>   		};
>   	};
>   
> +	u3_p0_vbus: u3-p0-vbus-default-pins {
> +		pins-cmd-dat {

That's not a command nor data pin.

pins-vbus {

> +			pinmux = <PINMUX_GPIO63__FUNC_VBUSVALID>;
> +			input-enable;
> +		};
> +	};
> +
>   	uart0_pins: uart0-pins {
>   		pins {
>   			pinmux = <PINMUX_GPIO98__FUNC_UTXD0>,
> @@ -900,8 +944,18 @@ &ufsphy {
>   };
>   
>   &ssusb0 {
> +	dr_mode = "otg";
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&u3_p0_vbus>;

Is this port usb host by default? If it is:

	role-switch-default-mode = "host";

Cheers,
Angelo

> +	usb-role-switch;
>   	vusb33-supply = <&mt6359_vusb_ldo_reg>;
>   	status = "okay";
> +
> +	port {
> +		ssusb_ep: endpoint {
> +			remote-endpoint = <&mt6360_ssusb_ep>;
> +		};
> +	};
>   };
>   
>   &ssusb2 {


