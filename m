Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3131CAC5A5
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Sep 2025 10:48:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Qfg+H/48RteRxJqr05WzIHlt2/qAHEfJjq9mWMbRUUM=; b=S82lcuiTO9X0YPLKWJ3cypVlJ0
	pDwW930SDdRF/tT3/simh97sBDK+vJbudxW+Mzn3pjGluAoAwt5sdwyKRnfRDK9zEHmTYPvk2BHy0
	q8X4vVxk23QaUC2MdZkNH6ZrTSg8P9+VBaLyoa/ycva18i7VsBSGNO0eLc6BWF+8HNFT5YZyIQqFO
	S7gJ7+WGGAwT3tS+zsQPHvYd2Sn4VPWa2BkdDIfFDH+Mc6jqEZqQwjlETNZjWpkvoFlq3Q0wkDyE/
	CUREijXwWE37bbiYhDVjvUaDzmadrF0Gy9e08D0NF7hsNv9p/srUTQG1bOBOEsr2EJfyZ/aEpywgW
	eJVKRQrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1N2w-0000000Gdhr-36bK;
	Wed, 24 Sep 2025 10:48:26 +0000
Received: from mout.gmx.net ([212.227.15.18])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1N2t-0000000Gdc1-2A0z;
	Wed, 24 Sep 2025 10:48:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1758710874; x=1759315674; i=wahrenst@gmx.net;
	bh=Qfg+H/48RteRxJqr05WzIHlt2/qAHEfJjq9mWMbRUUM=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=Vy5gApI7XtneYFJUqIeb+E1srRGZWQ/SwgtSgriY3FSOwO+hdlcY75sZ0PBUONUr
	 6FWuEi2LDxjXZJM7hU61gm25cYmIRG+R0ulIVyx0phQf0qGD5eOhEfSmRhnYQbswj
	 TVNFDNzblHarY518n0/5bBOtiaj5axRm4HCvKu2vUDeNARWaDmde/oM6pfpiot9hg
	 mCZsK9n5NsjrX6trgu6096EwvBNmZrJH3+tglGz8KDx/1ZXsk1DhJjaDs/cZHfhKz
	 E6eR5MB0w1PTCEOyh/mAjpHJ/IurHYiiOaWcyaHeUR2IDwBv9Lm7fyf+hcMbzjC7U
	 cuQ0IxCfvQK1jTI7Gw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.1.105] ([79.235.128.112]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MKKZ3-1umAT71D4h-00Q13l; Wed, 24
 Sep 2025 12:47:54 +0200
Message-ID: <545e2819-9654-449e-aa57-636bee88c744@gmx.net>
Date: Wed, 24 Sep 2025 12:47:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: broadcom: bcm2712: Enable RNG
To: Peter Robinson <pbrobinson@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Florian Fainelli <florian.fainelli@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Phil Elwell <phil@raspberrypi.com>,
 Andrea della Porta <andrea.porta@suse.com>, devicetree@vger.kernel.org,
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org
References: <20250924090105.1061910-1-pbrobinson@gmail.com>
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
In-Reply-To: <20250924090105.1061910-1-pbrobinson@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:UWnPEsG20zlvWCqe1025SVVJypAvrAJOSJA09HnjsHo1A8qIE3P
 6HPjPQo5eD5eQy/41EalTRf4GcmTnFRGX1htHZxiGpK8347xuIxEFHzdlI8P9Nl524SIPw+
 DIJ7KSDrCiGOmFYikTweraHbnyMGN8jiYER02jF+zpSZ4gIBO1TJJSLtkVB9Kx2FQ8YItXV
 Hvsi7pr7/XcqgGbGkITHA==
UI-OutboundReport: notjunk:1;M01:P0:4/3sSF0j9VM=;CYSZl73ahpffIuFdDBIUZ+q8P6V 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
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250924_034823_838442_349FE647 
X-CRM114-Status: GOOD (  15.69  )
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

Hi Peter,

Am 24.09.25 um 11:01 schrieb Peter Robinson:
> The RNG is the same IP as in the bcm2711 so add the
> device tree block to enable the device.
>
> Signed-off-by: Peter Robinson <pbrobinson@gmail.com>
> ---
>   arch/arm64/boot/dts/broadcom/bcm2712.dtsi | 6 ++++++
>   1 file changed, 6 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/broadcom/bcm2712.dtsi b/arch/arm64/boot=
/dts/broadcom/bcm2712.dtsi
> index 4cd51d80d40d0..6976a88c262f4 100644
> --- a/arch/arm64/boot/dts/broadcom/bcm2712.dtsi
> +++ b/arch/arm64/boot/dts/broadcom/bcm2712.dtsi
> @@ -226,6 +226,12 @@ system_timer: timer@7c003000 {
>   			clock-frequency =3D <1000000>;
>   		};
>  =20
> +		random: rng@7d208000 {
> +			compatible =3D "brcm,bcm2711-rng200";
> +			reg =3D <0x7d208000 0x28>;
> +			status =3D "okay";
> +		};
thank you for the patch. I know the order is already messed up, but=20
could you please try to add it after uart10?
> +
>   		mailbox: mailbox@7c013880 {
>   			compatible =3D "brcm,bcm2835-mbox";
>   			reg =3D <0x7c013880 0x40>;


