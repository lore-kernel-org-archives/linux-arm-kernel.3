Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 501ECC369CA
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 19 Apr 2025 18:27:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Message-ID:References:In-Reply-To:Subject:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b/Yf3GYBLMjcbsQjmUcazNuprLTTnJ8iv6nWe+Zhemk=; b=Dl6UvYSKkAP5ZUCyY27SQeGEM3
	5+a5Va7IVs17lyAV2NdUnH52kseYQIQUUhZ0W3ASUXvaKdR70g1eJbPh1+Rt+q3wTH07NlGCYRvqo
	lPwJ8uK8PJUmBPFfwbt1NnhiRhkUiTZBGt9RDcHbW+yP/N2WOVxPE7jhnzRF38i4JB4qLqw2+QdK6
	xf6LD2crs6irs+jrwxZVcenbpd5yPcTRIKi299NaWXUbtsNnmPG3ikcJfztt5QUU67FHGuEkoszA1
	n7hiZ4r3P4nRuEZmW4s4HWxFHLElOiOARIe68MX1uUxDBUAO7Q+k7pKAKSqeunjWIF95xmXqWbiHZ
	IX2DQ/Jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6CuU-00000001fYF-2XIz;
	Sat, 19 Apr 2025 18:27:26 +0000
Received: from mail.manjaro.org ([116.203.91.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6Csb-00000001fRH-2xG8
	for linux-arm-kernel@lists.infradead.org;
	Sat, 19 Apr 2025 18:25:31 +0000
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=manjaro.org; s=2021;
	t=1745087127;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=b/Yf3GYBLMjcbsQjmUcazNuprLTTnJ8iv6nWe+Zhemk=;
	b=Gxm3iyXAzq9C3ct3zpb2lzTWXFZxRey/272QctC48Hj97wwL6ExDUnrKgHs4aHpsBzBYdM
	HAXA/EQIjPmpgrG2oQYhjkE35YnlB6XptMLChG7leM8UAE7Ywv0itH0gI6bbr3I8fbenIo
	orWdBoasjHC52OSN5AZNnD3BLRn25pZfKdukQF0OLvQ6pIGjq0vAj1Ck810xsRnMyLCqZS
	4FrOXrJaEb1YLbdBYy9i4ot+83TykofTvSwrU22sfOR6WVoHvqSCchbaLWp7P2paISozP3
	SzG398V79rxHJLx4PYJnK0kvaiFbxLrIC3SXKvIblb0IVDQMVMVKDHcvEs1i9Q==
Date: Sat, 19 Apr 2025 20:25:27 +0200
From: Dragan Simic <dsimic@manjaro.org>
To: Peter Robinson <pbrobinson@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Jernej
 Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev
Subject: Re: [PATCH v3 1/2] arm64: dts: allwinner: a64: Add WiFi/BT header on
 Pine64
In-Reply-To: <20250419160051.677485-2-pbrobinson@gmail.com>
References: <20250419160051.677485-1-pbrobinson@gmail.com>
 <20250419160051.677485-2-pbrobinson@gmail.com>
Message-ID: <17c65a34625b328efad258a2ffc7a688@manjaro.org>
X-Sender: dsimic@manjaro.org
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Authentication-Results: ORIGINATING;
	auth=pass smtp.auth=dsimic@manjaro.org smtp.mailfrom=dsimic@manjaro.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250419_112529_929980_C97632A9 
X-CRM114-Status: GOOD (  17.26  )
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

Hello Peter,

On 2025-04-19 18:00, Peter Robinson wrote:
> This adds all the pin mappings on the WiFi/BT header on
> the original Pine64. They're disabled by default as the
> modules don't ship by default. This includes, where they
> haven't been already, UART1 for BT and mmc1 for WiFi.
> 
> Signed-off-by: Peter Robinson <pbrobinson@gmail.com>
> ---
>  .../boot/dts/allwinner/sun50i-a64-pine64.dts   | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64-pine64.dts
> b/arch/arm64/boot/dts/allwinner/sun50i-a64-pine64.dts
> index 09e71fd60785..764fb191107a 100644
> --- a/arch/arm64/boot/dts/allwinner/sun50i-a64-pine64.dts
> +++ b/arch/arm64/boot/dts/allwinner/sun50i-a64-pine64.dts
> @@ -35,6 +35,11 @@ hdmi_con_in: endpoint {
>  			};
>  		};
>  	};
> +
> +	wifi_pwrseq: pwrseq {
> +		compatible = "mmc-pwrseq-simple";
> +		reset-gpios = <&r_pio 0 2 GPIO_ACTIVE_LOW>; /* PL2 */
> +	};

Is there a reason why the status of this node isn't set to
"disabled"?  Or even better, why don't we move this node
entirely into the proposed DT overlay?

The required reset procedure actually depends on what's
found on the add-on module, so it should belong to the DT
overlay that defines the add-on module.

>  };
> 
>  &codec {
> @@ -124,6 +129,18 @@ &mmc0 {
>  	status = "okay";
>  };
> 
> +/* On Wifi/BT connector */
> +&mmc1 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&mmc1_pins>;
> +	vmmc-supply = <&reg_dldo4>;
> +	vqmmc-supply = <&reg_eldo1>;
> +	mmc-pwrseq = <&wifi_pwrseq>;

Of course, the "mmc-pwrseq" property would then also be moved
to the DT overlay that defines the add-on module.

> +	bus-width = <4>;
> +	non-removable;
> +	status = "disabled";
> +};
> +
>  &ohci0 {
>  	status = "okay";
>  };
> @@ -286,6 +303,7 @@ &uart0 {
>  &uart1 {
>  	pinctrl-names = "default";
>  	pinctrl-0 = <&uart1_pins>, <&uart1_rts_cts_pins>;
> +	uart-has-rtscts;
>  	status = "disabled";
>  };

