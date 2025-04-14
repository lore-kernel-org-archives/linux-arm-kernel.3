Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0115DC369B2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Apr 2025 12:04:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OreeNdyrrGiGJumVjXwzjTBKuHbR9pl0eB7Dt3B4zzc=; b=MtVbDuwSe7x2bqkgn1F4Yl4wyl
	kvIvDHn/gu92MVmfA8NSNpRSRXeHDRY6YxKhFSX1crdN+T6vbjiA+9lHxCBxk4MOH9qxdot5LZ3Rg
	2cmjIh+wjNUUz8Kk/Z6cwzlFE9yDaPlexYTkLPxoaP8LYxzVFvurkt0iZE0/qHMlimBhOv9ZsqdS8
	675UctKLkk4+eLaNnWppBDFSM0nh+TEYoR2PiKF6XpDRsyaOtIxc3Pv5ebJ+ezceKxoi81a8YtkO0
	Dgj+6SfWnWtU98wBOYKOTLWrjfAXI29P05jdpzFcr9O6Gm3YrXjBigdoDmi9RONRqYMkKlE/tMSQ5
	5hvMwVvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4IYM-00000001sMz-3iwz;
	Mon, 14 Apr 2025 12:04:42 +0000
Received: from mout.gmx.net ([212.227.15.19])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4IQL-00000001r8s-0wCG
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Apr 2025 11:56:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1744631761; x=1745236561; i=wahrenst@gmx.net;
	bh=OreeNdyrrGiGJumVjXwzjTBKuHbR9pl0eB7Dt3B4zzc=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=hkXw8muYvurpmWkA5D0R2aZZM3YLd+3hXbxIsxsEDGPzGa4moLFP7gBSVJBrqi+6
	 Zp4Y2mpKIMypSStpHeqkWnUmkkroI5ydlmWUny94rpWm8YToANCnmU+6ixJwtrKrg
	 IgvrWt1BJNSdZ9WvotQIyPU3Q8Dgc1Jl8WCBNPN6GEZa5yrO+egKUgJc9nJvnx5wk
	 rKRSRVMCXLeW7GCqLUD+Nv1+IsW+DOsCsWrk4s61YlkLuo0vSrVhQXS7qLTuwVsPk
	 y1sr7D3GalHtNvyGky+6uaDTv9IDoEnxQfI72MUhXOCs7uKStNxILoi2I6bd/4koB
	 XYOpUs8aIr+PIDyd3w==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.1.107] ([37.4.251.153]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MDQeK-1tuuEY2qgw-008QzD; Mon, 14
 Apr 2025 13:56:00 +0200
Message-ID: <45c1a50c-2ecd-4201-85e5-9a0e94f06fa3@gmx.net>
Date: Mon, 14 Apr 2025 13:55:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 11/13] arm64: dts: bcm2712: Add external clock for RP1
 chipset on Rpi5
To: Andrea della Porta <andrea.porta@suse.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Florian Fainelli <florian.fainelli@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Krzysztof Wilczynski <kw@linux.com>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 Bjorn Helgaas <bhelgaas@google.com>, Linus Walleij
 <linus.walleij@linaro.org>, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>,
 Derek Kiernan <derek.kiernan@amd.com>, Dragan Cvetic
 <dragan.cvetic@amd.com>, Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Saravana Kannan <saravanak@google.com>, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
 linux-gpio@vger.kernel.org, Masahiro Yamada <masahiroy@kernel.org>,
 Herve Codina <herve.codina@bootlin.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Andrew Lunn
 <andrew@lunn.ch>, Phil Elwell <phil@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, kernel-list@raspberrypi.com
References: <cover.1742418429.git.andrea.porta@suse.com>
 <7c26a0b52e00a39930ba02f7552abdd1be4c828c.1742418429.git.andrea.porta@suse.com>
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
In-Reply-To: <7c26a0b52e00a39930ba02f7552abdd1be4c828c.1742418429.git.andrea.porta@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:czG4GMQht2nXD2Mp++EOANKZEP+5pkXc4oz+r+gufql0lTqXjuM
 Y8+JfqD3AYyuaFqqm863fyxublyZoJgRCh2hj4D1WaeSDHF++0qxu2XBaNtajrRIOgOhxjR
 HtcYdQV1zN2Jl1MVmGY01Y2SH+UYmwZTcSOb0EW5MgLaCWrvbOYYPBZMsh66zeac9xZyqSm
 OrcgCaFCW2lDKA9iuuqdg==
UI-OutboundReport: notjunk:1;M01:P0:vEW4EQv+njU=;qowLx6dw0PwcUYvBP81aJOvYU0C
 KYT5EDL/HOu92YhV9xMyNbTJ4wt1vQpl5IGofiaK//7K6ebfVMhT7KeEGmvjSmRJnvjxGAvDu
 10ybIOFv4Zh0KTE3YVN8By8HkzUM22tVeRWq6khQUmDNd2TZdyx7aGRuzWrR0RDWEWyegcYqk
 zNxe7JLbi7QSjgWq3nfk+yMnaiZgWsQddlXd4P9YaWjue0TR2XTc/Fie88FZAlqmVkb4F4ORH
 p06z3ni4fRK+3RpbZfH3ZUiAwd7OuGYVAf+Xdovm0GcaeQYtuF5AtD6NVAlpylvy6OXMNwxm7
 7FldIrVkcuG+rGnebie+TyRp+gtS4s3U104JPkeJDm8T4aXkGwtlqcEaQtRaij0No41Wl4fFx
 ZGx19bM4Zaf6o3r3WqQrP1tqNlEIPvm1D6w+iWk64yJCbB3dJ8GPJ+TuNzY0OagHIgeYT2zi9
 k1N9MuEBNjGbZQ+FQqmc3KbAYHmXlieH9HfzGPKyOZwAC5LO2t/rcBgkeTmcT2B3zYnb7w35e
 Sas5NuiOa6MAUosm6+QK1e2ttQJN0Ff0ZSksLF/O8gIr64rqySbkPe774hduPKdaP98tbo+F8
 OnQTQxprcYzzxouOBDh4QpVrewBlu6XiG3pmIxuaSq74Ju48JLQlcLJnuqyPotnZk8tTwVmN3
 ZUFiNIV8pMRs/zuEjLoZjZHkhheI9vdMY4YwQj7JLG5JXHcElVym7e0ghjTppF8WOmpfC+PRe
 qTVT8agweSHBJ7HVXDWT3YIDKRGFwdVl2m/g4qeyWI57U/iXjTgqVZBn6kF07seaV8j7cRM6t
 9o+zU2tRrGhtrNtAfDeBszDaa03vcO2zz8K/75daxwRuK08BnESJjIoKfaOis4Pn6WXdWdP4a
 KSggrOZg+Ekc/NOQhwat8wm2y24m7Wwrx+SrsNg6ykZGH7GitSzd+mnkgq+c6+oMAS3a0IMn6
 sqPiM1x06NryP4mmt72SiMNvcN8CON2SATlxRbTKF94XmAOGXmCwvlp5liET4kC001AhXFZk5
 KC3HZru1+5nmPEGNG86V+1gIqydAYkuP9Kgo/wyuAIVTH3cvG83pgPPqJZRDZrP/zvDoUGZ0w
 awceQ+GrwNcKwb/6u/vrIuyBsm8CxndYDSUa8eGYomMMSdBHWfHLa+/CIWDhakSyMlLg4R9B8
 yRdx2X3rHI9HbPVjoAPKmWPKwu1v1FZ4J3m3NGVdPQteyIu+uaTlBGn+ET59+AxlvgqizbtUT
 7U5dlX554FaPxTELGFG5dfK2GyF3Z27N2a7NneRQ3kQxE8e1st2PCp0OC2b3vDtfxFW0utvqF
 BrFJNqYKdkP+mPdiRI1+AMSHEug3yBopu1iPt8M1C4fxeJO9ZCNE5cG+U0ZLpzeJCDyY3XBDe
 zNDPtAPBJbWOpnAkYoY5n1TMa/jV1GLb/O4EVxYuSk5CrMfpH8CeeUs8lLVOyaZpbhvWMemnH
 g54GcnHPTN1vXEIhXZ03o/FxBZrfUYuZnhVpPRbExq9W11E+d
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250414_045625_564934_DC103EAC 
X-CRM114-Status: GOOD (  14.99  )
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

Hi Andrea,

Am 19.03.25 um 22:52 schrieb Andrea della Porta:
> The RP1 found on Raspberry Pi 5 board needs an external crystal at 50MHz=
.
> Add clk_rp1_xosc node to provide that.
>
> Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
> Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
i'm fine with the patch content, but I think this is necessary before
Patch 9 is applied?
> ---
>   arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts | 7 +++++++
>   1 file changed, 7 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts b/arch/arm=
64/boot/dts/broadcom/bcm2712-rpi-5-b.dts
> index fbc56309660f..1850a575e708 100644
> --- a/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts
> +++ b/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts
> @@ -16,6 +16,13 @@ chosen: chosen {
>   		stdout-path =3D "serial10:115200n8";
>   	};
>
> +	clk_rp1_xosc: clock-50000000 {
> +		compatible =3D "fixed-clock";
> +		#clock-cells =3D <0>;
> +		clock-output-names =3D "rp1-xosc";
> +		clock-frequency =3D <50000000>;
> +	};
> +
>   	/* Will be filled by the bootloader */
>   	memory@0 {
>   		device_type =3D "memory";


