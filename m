Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68519E77188
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 28 Dec 2024 16:03:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=StX1yYS1wKyHvm5DxwzzspBxMwk1Wi17+eu0xT1TZ5U=; b=U8g4uKuLUeJ6nMt0+lGIe2u2p9
	v9OV5WbUiw6FmmXe95VlY35Ugg9FnRm0yVbxgNEDrf3ut7EVVh/UA9LXae98MzZ8JuxPO5vBw0sx1
	qQzBKj9e90o7eY+oaCqkZCGNc9qmJp6jKhiU5T9qFdoEjAtw0L3y02eIXE90X/M0s6RdPSRvJ1rJM
	pW3Hoq9QkhlYjT/o7IHSQwJtC3yCNBPyzQEtZm9hY8gXv6/C1TB5Jcq0haDlLt2HjFBlvBUBDQJ5b
	Q7M5wqUtQXI0ZsfhvrcKGH1JsGoay8XHYrY+NS8vS0wieCFmrjU8eC/HAy5Ep2eSuZIm8RrXSVDXs
	MUAA+Rzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tRZHL-000000027MY-1ZVf;
	Sat, 28 Dec 2024 16:03:03 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tRZG8-000000027FW-3mTB
	for linux-arm-kernel@lists.infradead.org;
	Sat, 28 Dec 2024 16:01:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 5B996A401D5;
	Sat, 28 Dec 2024 15:59:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD0ADC4CECD;
	Sat, 28 Dec 2024 16:01:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735401707;
	bh=18U5iz8pi3RBHmvQo2OtcOsNKBRj3kPVu7012TB52mo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=T1esKnsogL2iJCDq7cGur+PfySNB+HuMauEx3ha+nFmHI04vjq6kSh/ABDgFgDrc7
	 5xidS+d6tEJ1Nkzvi5JnmM/vWBd917TP+4Lr94DOQvJl42SB86lYS8KFs7SB1wmQYa
	 /nKdx6AXEpJPSE67Ym4zd9dRSnM2gCe6GLcPaK79Ps5LcQVfR+FYYj0ET2AR5qyYFV
	 2RRjCQZFWhQ9pz7e9UQr6V9TAhRlIkxd+j7dGLuw578IYozzLZRc4+cNm3wJaRf9P6
	 nYLyPRIqjxJMFJj8TCRFmo/6rRS5npcr36EpKR+i/0oyn+7zooGRy0TUhwE0KDFJaB
	 AzX0nOIuBQUOQ==
Message-ID: <5af2e2fa-3f60-419e-be3e-74771a993de6@kernel.org>
Date: Sat, 28 Dec 2024 18:01:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: ti: k3-am69-sk: Add USB SuperSpeed support
To: Enric Balletbo i Serra <eballetb@redhat.com>, Nishanth Menon <nm@ti.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Dasnavis Sabiya <sabiya.d@ti.com>
References: <20241126-am69sk-dt-usb-v1-1-aa55aed7b89e@redhat.com>
Content-Language: en-US
From: Roger Quadros <rogerq@kernel.org>
In-Reply-To: <20241126-am69sk-dt-usb-v1-1-aa55aed7b89e@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241228_080149_087775_247E3289 
X-CRM114-Status: GOOD (  20.35  )
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

Hi Enric,

On 26/11/2024 12:08, Enric Balletbo i Serra wrote:
> From: Dasnavis Sabiya <sabiya.d@ti.com>
> 
> AM69 SK board has two stacked USB3 connectors:
>    1. USB3 (Stacked TypeA + TypeC)
>    2. USB3 TypeA Hub interfaced through TUSB8041.
> 
> The board uses SERDES0 Lane 3 for USB3 IP. So update the
> SerDes lane info for PCIe and USB. Add the pin mux data
> and enable USB 3.0 support with its respective SERDES settings.
> 
> Signed-off-by: Dasnavis Sabiya <sabiya.d@ti.com>
> Signed-off-by: Enric Balletbo i Serra <eballetb@redhat.com>
> ---
> I've been carrying this patch for quite long time in my builds to have
> support for USB on my AM69-SK board without problems. For some reason this
> patch was never send to upstream or I couldn't find it. So I took the
> opportunity, now that I rebased my build, to send upstream.
> 
> I have maintained the original author of the downstream patch as is
> basically his work.
> ---
>  arch/arm64/boot/dts/ti/k3-am69-sk.dts | 33 +++++++++++++++++++++++++++++++++
>  1 file changed, 33 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/ti/k3-am69-sk.dts b/arch/arm64/boot/dts/ti/k3-am69-sk.dts
> index 1e36965a14032ca07143230855e04b9549f1d0d1..72797f4b689c1d069bf395d6d4fe1846dc4e4297 100644
> --- a/arch/arm64/boot/dts/ti/k3-am69-sk.dts
> +++ b/arch/arm64/boot/dts/ti/k3-am69-sk.dts
> @@ -484,6 +484,12 @@ J784S4_IOPAD(0x09C, PIN_OUTPUT, 0) /* (AF35) MCAN7_TX */
>  		>;
>  	};
>  
> +	main_usbss0_pins_default: main-usbss0-default-pins {
> +		pinctrl-single,pins = <
> +			J784S4_IOPAD(0x0EC, PIN_OUTPUT, 6) /* (AN37) TIMER_IO1.USB0_DRVVBUS */

address offset should be lower case?

> +		>;
> +	};
> +
>  };
>  
>  &wkup_pmx0 {
> @@ -1299,6 +1305,14 @@ serdes0_pcie_link: phy@0 {
>  		cdns,phy-type = <PHY_TYPE_PCIE>;
>  		resets = <&serdes_wiz0 1>, <&serdes_wiz0 2>, <&serdes_wiz0 3>;
>  	};
> +
> +	serdes0_usb_link: phy@3 {
> +		reg = <3>;
> +		cdns,num-lanes = <1>;
> +		#phy-cells = <0>;
> +		cdns,phy-type = <PHY_TYPE_USB3>;
> +		resets = <&serdes_wiz0 4>;
> +	};
>  };
>  
>  &serdes_wiz1 {
> @@ -1339,3 +1353,22 @@ &pcie3_rc {
>  	phy-names = "pcie-phy";
>  	num-lanes = <1>;
>  };
> +
> +&usb_serdes_mux {
> +	idle-states = <0>; /* USB0 to SERDES0 */
> +};
> +
> +&usbss0 {
> +	status = "okay";
> +	pinctrl-0 = <&main_usbss0_pins_default>;
> +	pinctrl-names = "default";
> +	ti,vbus-divider;
> +};
> +
> +&usb0 {
> +	status = "okay";
> +	dr_mode = "host";
> +	maximum-speed = "super-speed";
> +	phys = <&serdes0_usb_link>;
> +	phy-names = "cdns3,usb3-phy";
> +};

Reviewed-by: Roger Quadros <rogerq@kernel.org>

-- 
cheers,
-roger


