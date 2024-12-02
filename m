Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 475C1D7832F
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Dec 2024 15:41:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ie04BQKrraW4QBO6vajJjoLi/zc/N6fbE/aXMCjogQI=; b=fPiKQxpjFflXU4CKbwmlm165jO
	iQnl70lj34nb0YTFAWSz4pZS9DDNHALalDusaY3dgYccx+afdBAuACOHd/bYTA9tgHxLhnz+2LlnK
	J778rEz+yFWn1bcELTFs66P6owoI7tRmy+jHXfTS3hijUkSpR69u9H17SpwiDkao8er/HF5ff8Q8T
	KXBGVRPCUL1uAHpaO9UQrWiOmeK8IX14pjlzhrqLSpteMaGUeEfOcP7zDLTx/iUzM8HUDz2VmpbuO
	E81xPxmy2d79n82I1gt9SzvukUp9q3REt1aae+RP3n+jwh/OHkYi3sBpSG1cFv97BPm1uWt5pjYQj
	YFpdPsKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tI8YF-00000006gqF-2OkX;
	Mon, 02 Dec 2024 15:41:31 +0000
Received: from mout.gmx.net ([212.227.17.22])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tI8XD-00000006gdd-43gf;
	Mon, 02 Dec 2024 15:40:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1733154008; x=1733758808; i=wahrenst@gmx.net;
	bh=ie04BQKrraW4QBO6vajJjoLi/zc/N6fbE/aXMCjogQI=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=D169VzNPq7SZOZg+lDoCe8Qf9x4Ncfat6lSA8IyAbuNBnfUL/Q9MDGWnJUJCA0DW
	 dLNnlNOjomMt4+Q6od04JHoYRtsywJQIu7SBcLHR2m31KbjMmE9kmITXY4H+6TMc0
	 fx1vgPrZAZK6y0ZyocL24gTmDW53yv/yWXxVIX9vKqvGfGOR7jA4YON64tNOksEop
	 +UQgz2Tg7rRUvWxOCrnd87YkIm2cfRgR/NZNAXsiP7XiwyEMyQXepO8xk+lII0oyb
	 EbJaEEM+lJrfIhHaB/tspcParFHb/+W+79JIQSf37b4GbdiN+6SKoJQPDCHkeCmtH
	 0frRuODZCyztIYRkFQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.1.105] ([37.4.251.153]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1M8ykg-1tLy0s1Jig-005GpS; Mon, 02
 Dec 2024 16:40:08 +0100
Message-ID: <b80097a1-4c8b-43f1-920f-b31489619111@gmx.net>
Date: Mon, 2 Dec 2024 16:40:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/7] arm: dts: broadcom: Add interrupt-controller flag for
 intc on BCM2711
To: Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, =?UTF-8?Q?Ma=C3=ADra_Canal?=
 <mcanal@igalia.com>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
 Doug Berger <opendmb@gmail.com>, Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Florian Fainelli <f.fainelli@gmail.com>,
 linux-gpio@vger.kernel.org
References: <20241202-dt-bcm2712-fixes-v1-0-fac67cc2f98a@raspberrypi.com>
 <20241202-dt-bcm2712-fixes-v1-6-fac67cc2f98a@raspberrypi.com>
Content-Language: en-US
From: Stefan Wahren <wahrenst@gmx.net>
In-Reply-To: <20241202-dt-bcm2712-fixes-v1-6-fac67cc2f98a@raspberrypi.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:Ua8NGna7H1m0vTQYmzbtvKSsnWt7yxjKDiRlZ6y6icjnDgqA/Rw
 /0PsbSmLeFBFOxkLDl9tr9eOyUv8wyP+8jY6Pp8QjoFFW8CIWEZpR+8ViC//uhoPH/8/0BG
 KRCx039CoaP1f1Vshra/aY7f3pxy5O6QWuXNpROz5+0avGCJ/KP9rqlPSQ6Zc9o9Truei2B
 dJa4Xg0fqCw+MNTU/dPVg==
UI-OutboundReport: notjunk:1;M01:P0:vuiMuJHOccw=;E9PY0fNnCVNiEPWlmRO41i52zgF
 rFS2qSJ+pK5e633kWJlXJlpMb39Y2KmLH5x0LfVzs+RS7FvzHzMVYSorFuF9szTvf6LuzVoj+
 4gpR04bpsPfPXVqXMxsQSZWNY1JNV0d2qc4qMoyZ7l5RQpjD0oeemojGh8OOZ0xpyY1w0DT/T
 EouR1ODjvHLmYQKSNAfYXayUSVXFXp5WbLgcRQFnHDOIeiARhDGbahlxLc1UXBmCJeUNb9rvb
 tVg+MLbdtp8fw4q951b7aW/Q3CbnTUZIHUO0ogQWrg8ObpeTnTsLGAQRsppMJSHR2LF+z53tT
 hsCDz4jICvqTwuHMAsz6uw3yEgTjY0dbWSUoGpFTK+9YOu8HdprHYdomGc0MRz4DtFu9WeCyt
 lZYonEKUFDCCMn9QqDos2j9J7SEKytpy5Q/DHqbGCc/Mtx2v8ZY/RTAlxtLot0GYqimaeweiP
 a5YkzNRhquVIKZgKoxrU38AcKvjcnNHCtyBCaVqqKAgGmE0mDrdjsRliHxxWH1xG3B7LvlZCs
 VtpDBUghMkk9INyS4yXEdPuHQuAv2qzxLD3ilDXwJhFIDJE/2iZrJtwVrqNYDnfM6x8IgcRQF
 glqGd80UnGdT0nQmef1FzwedB364zKgdcrGKeAgm7bkI6ElhzSES/IMdMwH0KtCh+c5a1E6mC
 qdrREvnsecRJxZ4xqA9CK2mOouV0y1bKIq2HfRptRNngv4T3CQlUDllDTAYaai6573bB0v47H
 y2XoYu39+Rx/zvuvC+9vbmcAY0XtNEv7+wA4ApG/Nd18TDDDZEN7zqvMzxPdDHq7vFBznnrD/
 89LN0H6qo38sQlJYGgG8Zy0E1NZO0CdlwmN2y1eMSJJruq+HTUUkkBDNzaz0VpPXlQJzLB0x1
 d5n95BQeSzxCzDNLMAkJZAkM8NxuvmGDTKqT82DMsFbsYouaulpG9JW/rrTM4O41t51zUZoJ1
 pnRDLI8wanLLFCnsgleMvJHJ655BpE8SYPv2OPfswSUZWsTrZXJhTfS7YqSAI4Qf8wrVVjsEu
 W5S1irsSQqfpipXhthvT/VdfrjIKCdkUUA8JB/lCrGEtFACr40tRhajeQcxV4FujgbZgVsuAr
 VHWXetzRWXT4gpU2KKzZOM2iBLyr9b
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241202_074028_293379_BA13964A 
X-CRM114-Status: GOOD (  15.06  )
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

Am 02.12.24 um 15:31 schrieb Dave Stevenson:
> BCM2711 DT was producing dtbinding validation errors of
>
> interrupt-controller@40000000: 'interrupt-controller' is a required
> property
> interrupt-controller@40000000: '#interrupt-cells' is a required property
>
> Fix them by adding the required flags.
>
> Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Did you actually test these changes, because the last time [1] it broke
the boot of RPi 4 and likely for RPi 5, too?

Best regards

[1] -
https://lore.kernel.org/linux-arm-kernel/07154679-42bc-43ba-8b72-62083ed78=
a4d@gmx.net/
> ---
>   arch/arm/boot/dts/broadcom/bcm2711.dtsi | 2 ++
>   1 file changed, 2 insertions(+)
>
> diff --git a/arch/arm/boot/dts/broadcom/bcm2711.dtsi b/arch/arm/boot/dts=
/broadcom/bcm2711.dtsi
> index e4e42af21ef3..313b1046d74f 100644
> --- a/arch/arm/boot/dts/broadcom/bcm2711.dtsi
> +++ b/arch/arm/boot/dts/broadcom/bcm2711.dtsi
> @@ -51,6 +51,8 @@ soc {
>   		local_intc: interrupt-controller@40000000 {
>   			compatible =3D "brcm,bcm2836-l1-intc";
>   			reg =3D <0x40000000 0x100>;
> +			interrupt-controller;
> +			#interrupt-cells =3D <2>;
>   		};
>
>   		gicv2: interrupt-controller@40041000 {
>


