Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE098C282DE
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 16 Mar 2025 09:55:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=waqk40he1Aos8eWly4RCtuqg/j6badeXprlfS9WCE6g=; b=tWLtcslpXp74rOYjtIHoNuX5KQ
	HPzTJaruVsdyXY1F1iM5Dx1O0j2IVsbK5x+QQSSruj4cB/0wgkDmQVy1KbEtjwfafHbawIx0Ot+Dp
	FDP/AhznHg8VONSwWurv/C8Ws+HMqUuZGvOX8hpfON0fOwqlkGMxkWh7aLNnpWibwTJYf8rdUI/qk
	iVl0pyTxL1HyZB0ybyQbhaVfT1jvvFZYMLtayCb4dgHPXHQJWrU3p8763ZvFlEG0CzAXO819yfjbB
	iWy4VluHLi4CupEPqlzWtifIDGQMwZ/tI+GVG/hVrXcw/sLCP5hmcsu+odbgVUS2re0eSdOsw6/Oz
	ZJT2WhqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ttki3-000000000vq-3I3P;
	Sun, 16 Mar 2025 09:55:07 +0000
Received: from mout.gmx.net ([212.227.15.19])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ttkgN-000000000qI-0YOl;
	Sun, 16 Mar 2025 09:53:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1742118783; x=1742723583; i=wahrenst@gmx.net;
	bh=waqk40he1Aos8eWly4RCtuqg/j6badeXprlfS9WCE6g=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=UTlYTmBaE9UfJMFm0fBosxWdLtUjXglbyF3YhhSElrZh+xdXrxtsP6baRRhMtkSQ
	 GRrpIHkZwHgd5O0CvNInkBIxNWSPnSTCL1aZM75x/rSbX5j22gqnUed/3mK1sSF55
	 z3vHYjPFQNpGVFs5ppLzQluxh8vB0/RIoQlet/k81G/5TItwYxBEEEZOKkC7Nez5h
	 JdBEOAdXSnw6aq//5b6lbixiISXJY0/EPPDL8uerlW0t13RoLvnlVyjiv67DstsMp
	 FgxuklKwKhbyRH4As7X52oJAvsNylwXyQHgBWP8mkVjwpD9vw+lTbRTbxVNTmBQky
	 lsO3Fg9Mv4NUl7F2ng==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.1.107] ([37.4.251.153]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MhD2O-1tFRqH2yRe-00bvvv; Sun, 16
 Mar 2025 10:53:03 +0100
Message-ID: <9a23c31d-e26f-4bc1-9759-5b6b4340a588@gmx.net>
Date: Sun, 16 Mar 2025 10:52:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/5] arm: dts: bcm2711-rpi: Add HEVC decoder node
To: Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Florian Fainelli <florian.fainelli@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, John Cox
 <john.cox@raspberrypi.com>, Dom Cobley <dom@raspberrypi.com>,
 review list <kernel-list@raspberrypi.com>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Cc: John Cox <jc@kynesim.co.uk>, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org
References: <20250206-media-rpi-hevc-dec-v2-0-69353c8805b2@raspberrypi.com>
 <20250206-media-rpi-hevc-dec-v2-5-69353c8805b2@raspberrypi.com>
Content-Language: en-US
From: Stefan Wahren <wahrenst@gmx.net>
Autocrypt: addr=wahrenst@gmx.net; keydata=
 xjMEZ1dOJBYJKwYBBAHaRw8BAQdA7H2MMG3q8FV7kAPko5vOAeaa4UA1I0hMgga1j5iYTTvN
 IFN0ZWZhbiBXYWhyZW4gPHdhaHJlbnN0QGdteC5uZXQ+wo8EExYIADcWIQT3FXg+ApsOhPDN
 NNFuwvLLwiAwigUCZ1dOJAUJB4TOAAIbAwQLCQgHBRUICQoLBRYCAwEAAAoJEG7C8svCIDCK
 JQ4BAP4Y9uuHAxbAhHSQf6UZ+hl5BDznsZVBJvH8cZe2dSZ6AQCNgoc1Lxw1tvPscuC1Jd1C
 TZomrGfQI47OiiJ3vGktBc44BGdXTiQSCisGAQQBl1UBBQEBB0B5M0B2E2XxySUQhU6emMYx
 f5QR/BrEK0hs3bLT6Hb9WgMBCAfCfgQYFggAJhYhBPcVeD4Cmw6E8M000W7C8svCIDCKBQJn
 V04kBQkHhM4AAhsMAAoJEG7C8svCIDCKJxoA/i+kqD5bphZEucrJHw77ujnOQbiKY2rLb0pE
 aHMQoiECAQDVbj827W1Yai/0XEABIr8Ci6a+/qZ8Vz6MZzL5GJosAA==
In-Reply-To: <20250206-media-rpi-hevc-dec-v2-5-69353c8805b2@raspberrypi.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:W2pLMWrKNN8dtTF7L8PthwX1uIuTiOYSHJ9N6pqTNo+4n30bD5F
 llud2RqIz07G4rVMxz5XxgahMcXaq7qE2YaPepJ1LxKCvK/5rSTb4rNY7JGzbqSK6CPM0l2
 GbENGZCekzGiRSFbEv4+kNy/FmVTHMJMii9KQb9c2PCDveNBxHZT2XCrFkcyWAGyWxpAg2x
 a6HS9rhO8qHbeLyHho6sA==
UI-OutboundReport: notjunk:1;M01:P0:aTOBw0LTolI=;JbWdY10KwOeKZNbXmN8ynmnfgna
 KLDq8pSkz9JsOn+QNMZV70MZpCzEJL1KeBK6Mbk5mEb6uCXl1MLEHiN7pgOX/sExk4GMUqKmA
 Rr/HnvTC3dhsTwzAVmGkbtgWiLcskjtoHDp9ftXySaPKUkXv7lG3Qr7pk1QnFMYTDXBPSyt8d
 mzYI/YxteOQxdZ0sT8PgNsMbAU16xdDLClJ44lfBfTqeAjNUB0B/1kbVQf6SktWiZyARWXi1/
 pBicjOC41z20t06GeQATe4GZFTBk/Pkzgnp+510Wg6oq85bnspuYDsFgy7EQgiMr0cAP5LFJD
 It7R14rVAEmsLKcwo2rSDj35zMvd15kNE6ebw9Eu6HTPgtp5YirQ0N/EF5twF11DkjEGlT4Am
 BY0Et7GnNMqa5a3bzX8cE4dKwGBuzoE2ZHpW6E5hVEyaGHxG0ppdHqf2h2dogU7DbrrTv1U3q
 04p/9BC3yO3Z2kM/SwbLlMPYN2oN/P2xAkEqEOWEmmG8IDGWqiK4hxzGriJCju8QIQpsNod1G
 7wtvUZyWHG4PATIv+k7xSKuV8x0QM2X2E9UQSjXb5co1H0BTHtIUmmV/g+JeOiTs5kItjqjJr
 O1szBTBBSN8SIKaCApYUOYtijlus5Vp+HkwC4jYjd+VMXZI7etxCLcQDb048/Kt+uEwv2IT7Z
 YIvX+tFNILBPYGXGBUnbzDMNdJkNank1Kuz5YvXRpqfPqoMczXy1+CqEBRMnVhzU7F3TzB5vj
 ZJGj8F3tCbsJGFetfV3Ivre2qQE7/PBerpAdfdiVmK1ZJIOyKRCvbuneWQrjqSYtm+APt2O/z
 LPPTruRyyvbyxKXIGPWsIuLXEtPiffDyMmE04MFnj1K1lFqDnONAg7zpgKa4+tY5ILLE0rFmv
 5cG0SdG1geaP2oaKkbv+GDyHzU/7bTj39AgNfdoQ+1SQSIDtlCrzv4EJUk8dMgOuSGZy77WsO
 1yi3qxrYuxI7b2hcNcP2PBDp0UMdThV7YHuq3Ifl6kfmBLWdk92K5BOzaQ9b5tsrzVtzu1qkt
 Kz5RniDCa7ZrJA5C2VOBSSqINx0En6gIQIWCmbVouZaXtHk7hOKMmBbObc5A6LQOPBDTEbsNJ
 SYW/GlpQlqCzLrzo18wKJoZNfSDOjgUgqZcqaM4q2IxophDgzY50FCilzS3QwJwkg/tIgB3q8
 xEZTpVLmGngXeu6/wi5nnwlVNQh/BiBpLwqYAagK+8pRGfnMyUhJ2xfbDeSkB0dIzekYkaj93
 I/T14flkmyxhIBGxeNqxXY3WnUAU/TosvVcC3C9HeAqyJqBfWXpDMfb3L9CfFBTQF2vyALLVV
 vCrgqaJLzRxZFJl0omfyrsX7kOpklsY61s0cX6Lh0f4QOiHfTL28ez332iZkjIVHKy2e/rHxU
 p7NMKH0S5M9bYcy3g1sgsEXleEirqZV9uYh7uR7chejXK2RJPTd5vK7bee3+we8gypFrAz3wO
 +YtzF0vUycY3ixxmGtiur9HE/LUg=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250316_025323_452758_D0F556F7 
X-CRM114-Status: GOOD (  12.72  )
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

Hi Dave,

Am 06.02.25 um 19:02 schrieb Dave Stevenson:
> Add the configuration information for the HEVC decoder.
>
> Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> ---
>   arch/arm/boot/dts/broadcom/bcm2711-rpi.dtsi | 4 ++++
>   arch/arm/boot/dts/broadcom/bcm2711.dtsi     | 9 +++++++++
>   2 files changed, 13 insertions(+)
>
> diff --git a/arch/arm/boot/dts/broadcom/bcm2711-rpi.dtsi b/arch/arm/boot=
/dts/broadcom/bcm2711-rpi.dtsi
> index 6bf4241fe3b7..56c633005941 100644
> --- a/arch/arm/boot/dts/broadcom/bcm2711-rpi.dtsi
> +++ b/arch/arm/boot/dts/broadcom/bcm2711-rpi.dtsi
> @@ -105,3 +105,7 @@ &vchiq {
>   &xhci {
>   	power-domains =3D <&power RPI_POWER_DOMAIN_USB>;
>   };
> +
> +&hevc_dec {
> +	clocks =3D <&firmware_clocks 11>;
> +};
the node ref should be in alphabetical order, so please add after hdmi1.
> diff --git a/arch/arm/boot/dts/broadcom/bcm2711.dtsi b/arch/arm/boot/dts=
/broadcom/bcm2711.dtsi
> index e4e42af21ef3..2931d93ba184 100644
> --- a/arch/arm/boot/dts/broadcom/bcm2711.dtsi
> +++ b/arch/arm/boot/dts/broadcom/bcm2711.dtsi
> @@ -628,6 +628,15 @@ v3d: gpu@7ec00000 {
>   			resets =3D <&pm BCM2835_RESET_V3D>;
>   			interrupts =3D <GIC_SPI 74 IRQ_TYPE_LEVEL_HIGH>;
>   		};
> +
> +		hevc_dec: codec@7eb10000 {
Please put the node before V3D to keep the register order.
> +			compatible =3D "raspberrypi,hevc-dec";
> +			reg =3D <0x0 0x7eb00000  0x10000>, /* HEVC */
> +			      <0x0 0x7eb10000  0x1000>;  /* INTC */
Since the reg-names are provided, there is no need for these comments.
> +			reg-names =3D "hevc",
> +				    "intc";
> +			interrupts =3D <GIC_SPI 98 IRQ_TYPE_LEVEL_HIGH>;
> +		};
>   	};
>   };
>
>


