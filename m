Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40B08D10394
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Nov 2025 08:40:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U1OykPAwTcPzSFiUomqrxwP1jDvbUax2InEi27KUlKo=; b=J3H1OfMdWAoXMGI+SMsAzYG2d1
	APn35TxTHeQRGn3nx9NEjN2OPCteqWwFaYxoz8qXiKFA3GVMartXSRtviV0M5xJad4jhQ6BhFwUkt
	kX7beNfovHT7yqXGPnY5tC979KZQRrTBiHbw9/2vcDBkSOx9rAjD/892t/W5Ezdv+QPOm28BYgj9I
	iPBInChov9xdY7eNOldmdsLEsLiIbvg1pyGMHBkWpJ9pl0+wJlwbDeyXKo1ov5dCuk2/RwzjN61LB
	TBznDW4wDsPUD40TgcYT8ReCm5Op+S96NUb2v/uWAETOJF10e7Dtt2IF/2Qke3DDtnXJUK30tgGAC
	U4NZmgHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOB4t-0000000EcqN-0SAp;
	Wed, 26 Nov 2025 08:40:43 +0000
Received: from smtp.forwardemail.net ([121.127.44.73])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOB4q-0000000Ecpd-14yq
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Nov 2025 08:40:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: Content-Type: In-Reply-To: From: References:
 Cc: To: Subject: MIME-Version: Date: Message-ID; q=dns/txt;
 s=fe-e1b5cab7be; t=1764146437;
 bh=U1OykPAwTcPzSFiUomqrxwP1jDvbUax2InEi27KUlKo=;
 b=KEW8IfJvpKi0/ep2eHSk0dvvTXEMLXhQXb6UVft3R4nKBOmTwDeDREAAjUcX50H694JHXEeSi
 IOYiXrfNVdkaO9v9Siso/NfTAF1Iq6Gv1SEgMS6BdVIkFXGtaufiICbs7EpNsbTtB96Vy3vQY0A
 7lJziflLQ9Kcy+bpc+Jl5YvHWjbT3b9WLZGIoRxRCpb0eR8CO+R1oCBI//O6Dn1XU/lDZcPK6Lj
 ErgGiO2YCGXK3UWrH7s6KKz+mnFIYyuwNMn2ICaL1nPeV7CweQNZqB6dpCgh8ebM0aJUfOPoZVW
 PyxwrTOV/Jw6KoKNc4xJhsCrn66QA6MB8y321bdOvuwA==
X-Forward-Email-ID: 6926bd023968ae208f5ee233
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 121.127.44.73
X-Forward-Email-Version: 1.6.3
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
Message-ID: <d66f81e4-9d9f-4df8-916b-e6f68c85d813@kwiboo.se>
Date: Wed, 26 Nov 2025 09:40:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: rockchip: Enable i2c2 on Orange Pi 3B
To: Michael Opdenacker <michael.opdenacker@rootcommit.com>,
 Heiko Stuebner <heiko@sntech.de>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-rockchip@lists.infradead.org" <linux-rockchip@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20251120-orangepi3-enable-i2c2-v1-1-2e023a74012a@rootcommit.com>
Content-Language: en-US
From: Jonas Karlman <jonas@kwiboo.se>
In-Reply-To: <20251120-orangepi3-enable-i2c2-v1-1-2e023a74012a@rootcommit.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251126_004040_697278_630DBF4F 
X-CRM114-Status: GOOD (  16.79  )
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

Hi Michael,

On 11/20/2025 8:00 PM, Michael Opdenacker wrote:
> Enable the "i2c2" bus on header pins 3 (I2C_SDA_M1)
> and 5 (I2C2_SCL_M1) of the Orange Pi 3B board.
> 
> As documented on http://www.orangepi.org/img/pi3b/0719-pi3b-19.png
> such pins are the only ones offering I2C functionality
> without conflicting with other SoC blocks.

This is strictly not true, these pins are by default used as GPIO, this
patch change them to use the I2C2 func, something that should normally
be enabled in an overlay.

Functions for these pins:

	func 0		func 1

	GPIO4_B4_d	I2C2_SDA_M1
	GPIO4_B5_d	I2C2_SCL_M1

> 
> Signed-off-by: Michael Opdenacker <michael.opdenacker@rootcommit.com>
> ---
>  arch/arm64/boot/dts/rockchip/rk3566-orangepi-3b.dtsi | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/rockchip/rk3566-orangepi-3b.dtsi b/arch/arm64/boot/dts/rockchip/rk3566-orangepi-3b.dtsi
> index d539570f531e..e2f0ccc6dbe7 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3566-orangepi-3b.dtsi
> +++ b/arch/arm64/boot/dts/rockchip/rk3566-orangepi-3b.dtsi
> @@ -435,6 +435,11 @@ regulator-state-mem {
>  	};
>  };
>  
> +&i2c2 {
> +	pinctrl-0 = <&i2c2m1_xfer>;

pinctrl-names should also be added here.

> +	status = "okay";

As mentioned above, this should be enabled in an DT overlay not in the
board DT.

Regards,
Jonas

> +};
> +
>  &i2s0_8ch {
>  	status = "okay";
>  };
> 
> ---
> base-commit: 8e621c9a337555c914cf1664605edfaa6f839774
> change-id: 20251120-orangepi3-enable-i2c2-fe6d25ec681a
> 
> Best regards,


