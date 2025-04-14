Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CABCC369B2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Apr 2025 11:59:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K+4Cpie0T/NmOxvbbp6LArEVusYrUxyybbrudOe3VN4=; b=QXDdz+WYnxrNU/G35bUr1eb/3I
	UOTfj9tR/sDY6TdueZda6E1YzRYCEFmiJnlc0zKrn4MByTLM49ozRC7A0bRwkT6mS+geZlAvatgEd
	z6p2JeBEWDNe1e5qe8jq6ZzTn4thpMJfOglam+UIvu5ILNYkxCHvhDG9oLaFMaQTnWSc32P4hX3uQ
	ROgF4XgdlMesBvGvEKC5unDhS1SwbGfKXZH+GAANNueCoX0fBxvGpbBp0rzhmpCuuVhPLScI6jjKP
	z4j8qYzKgkUw09zBR4xbLE71VHDLxGKEYlItbDbAgiIt+uCQtFIE/k+c6bqDOgnXZns99N4kq30ZT
	rOy+Ax9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4ISo-00000001rT0-4Bve;
	Mon, 14 Apr 2025 11:58:59 +0000
Received: from mout.gmx.net ([212.227.15.18])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4IJC-00000001pdj-19kI
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Apr 2025 11:49:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1744631327; x=1745236127; i=wahrenst@gmx.net;
	bh=K+4Cpie0T/NmOxvbbp6LArEVusYrUxyybbrudOe3VN4=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=m5DZBDYeoNm1c69dLoupy36ujE6g73TlBVkqqpXE9312bIdVuRJnzIUDupL2/aLn
	 UZr++AQrDlt6EzcazCMAoYNssJA/mvHmpiIvJUStzRQ7BprduVezaxAdketU7+0jq
	 btZHbzwOMf64QQ/UpRF/gkSbwzPL+MczqNNhAeOKpzsI6CAApyqxM5GePmZwwj3fs
	 KvDttgiyYVhyKjvXDW31uZuN4ggsdyBlxbh6pnencQqUVQERei+TFYDKI5koiI7eg
	 dKnqjtC770IxxORivFoQ7rLY68JVeJC3gcg5F7oNfTXREecBPYKTsNb/BUGg3P3X5
	 nhWJeVgphps3sFDt3Q==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.1.107] ([37.4.251.153]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1N6sn7-1sxZOS2Z27-00sqVE; Mon, 14
 Apr 2025 13:48:47 +0200
Message-ID: <526751d2-c7e8-4097-9454-c9049b880225@gmx.net>
Date: Mon, 14 Apr 2025 13:48:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 09/13] arm64: dts: Add board DTS for Rpi5 which
 includes RP1 node
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
 <c6498d8cf8dfade1980b566e99a9a91551fd8b53.1742418429.git.andrea.porta@suse.com>
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
In-Reply-To: <c6498d8cf8dfade1980b566e99a9a91551fd8b53.1742418429.git.andrea.porta@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:Q/uqLjrFuArPjirEjhXTJ5d3uJ7OdvCvVI+pv/Xt5or02vZztUA
 YY/J9+90WDy098NKbupQsiWz932xEwp7WwuN9BiZIDHqp6zp/xZBODCbLogW+r1k8E/pwir
 +0kLC28Y4V9siWI4uCrkwIO85UE9ATs8CCSE1Q/S2PzHIcWqHnO4I66Vp76XrGTYFxjJ+8c
 uU9PSIB7qElvAnelIGPpg==
UI-OutboundReport: notjunk:1;M01:P0:h1ERpLur5s8=;XszaV0pd/6wJsRYUEg+d0/xKRGH
 mW+ii9MSTn/iz78dmGmvCFfqo32rASu6B5GIoMktr7PhV1oLfJVddRC6NLShfJo0ULfJEPFLI
 OuxFNy9likSPgd4VIstZqiK4y4Tmd4g1s6IMLSVae3u9dd5pdZs9xnrUujvLYkwEa/U/qGYxA
 3q3G+GXmOoc/Q62qVBRC6w2Z/ZlyN+AN4al8Xm88YifwZsv3z8MNUk9TmtRBDjonZQuqKl0Dn
 x7v8TRQCG3MZfVRhUs+7EK277PTaT9uL3v1timWb28dVKGHTWGrIhvtQtLlrhi/1YSdj0Mbbf
 kr0iVBM9MNYwOQEGsVHmVa6WHZBhPEdcdeUJNIQroXdhQy/b6/+AEnEr//ifpAVvVaxVVg3Tw
 HcdxPnWdzURHYMt3nGKoJtt86ibc935UjG6lF+67F80S50Dxu+/n5ovE8mmeqEFOQSAhAolTs
 dOuy8EHKK41EKph0T271y2eleG7Wyx5GEVDgANtLznsNmk+YWFXbFjq7O1auV9i8n9qNAq6Sh
 V4Jgf15wGMC7/b/BzvJ9wOmune/9krPYKs5KwHXD1pn4cvJydJ/cY91mSqU45aKydQZCun2Ft
 l5n1PRDBapcaOc3hRmu8hK4alzfA24FpxI0AmmPO9wYsZ3Y2gKTEVlrgnhVnfgl/s/iJgvAkE
 P5VvmIDTsE8I3mZVkkpRf5OHyu/TkmqsU4JdnESzwNNtxZegNRMha7CjGaoEkgUNPEQOMVxeg
 5pCNmJKdSumjj5HvNo5OnVKJLkfa0Vqneij049IoHCYtT9HwBX9bAX5DGmVVh+C5nqe+0Ss1k
 VhkQjih5c2bkTYQEveuAf09eIngSpfWWpimzpVMf87BMSyNZ/+2pWbC5UE3AH5x+ziJOLO+jz
 xwmeiuB6Btw1/Gxkg0ZPjw8xLHU6fe0M9auCBSPhYvKaSteoM9itSVjii4IU1SXfzXgFpKPrm
 K/vJrgMbNpphIEu0NsLqCnSYQp5o18KAeZReSeCzjDCca09Ev7O76QC4OKW6HUP67u2fx+Gy6
 PXtsDz2zTAXamXPyTuFb1TPlRFZwbVMGetHmROy/vmO/N3V+ZobHAHT8KSfx46izss5aJmLUe
 9il6aSvMuK6Sd5PXR70ddUOjKlM3IPE52Re1nI9dcA6FG/jmZuKoMBXDW+dvnpKe5wtlh3pPo
 4XFuiio793Yi4O+lFHKacGOgxn/jrR7oLe6clyT2UbvtXsf5p+mC3QmboSQxWsYunRi+go9qx
 ZDC7PGUx2dMM3eQ4bkTJ4TijmLzbVM+uco8ofDjR94DEsq65HxKSKSE5LXCnwAVFkroJ26FnT
 /iXH7RU2zI5+G2NNsvaq+EdtNC02Vi0/TZzzK4L97gc5/zeYZh657y+gOYfGbshKP/JsjcrId
 sGCGcTrBdGwiFDuRShCkBJqV5EU0UWsraCgjLkhVQHMrggoc2Xfu6u5NB9HmKKtvHV4WBGG1z
 Q0FtFZV3k/G0TNkawOVDl7hVwUtc=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250414_044902_608023_48F10A60 
X-CRM114-Status: GOOD (  22.59  )
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
> Add the board 'monolithic' DTS for RaspberryPi 5 which includes
> the RP1 node definition.  The inclusion treeis as follow (the
> arrow points to the includer):
>
> rp1-common.dtsi ----> rp1-nexus.dtsi ----> bcm2712-rpi-5-b-monolithic.dt=
s
>                                                 ^
>                                                 |
>                                             bcm2712-rpi-5-b.dts
sorry for the delay. I'm not happy with the monolithic appendix.

How about bcm2712-rpi-5-b-rp1.dts or something more self-explaining?Regard=
s
> This is designed to maximize the compatibility with downstream DT
> while ensuring that a fully defined DT (one which includes the RP1
> node as opposed to load it from overlay at runtime) is present
> since early boot stage.
>
> Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
> ---
> Right now bcm2712-rpi-5-b.dts is the overlay-ready DT which will make
> the RP1 driver to load the RP1 dtb overlay at runtime, while
> bcm2712-rpi-5-b-monolithic.dts is the fully defined one (i.e. it
> already contains RP1 node, so no overlay is loaded nor needed).
> Depending on which one we want to be considered the default, we can
> swap the file names to align with downstream naming convention that
> has only the fully defined DT called bcm2712-rpi-5-b.dts.
Could you please move some of this good explanation into this dts file=20
as comment?
> ---
>   arch/arm64/boot/dts/broadcom/Makefile                     | 1 +
>   .../boot/dts/broadcom/bcm2712-rpi-5-b-monolithic.dts      | 8 ++++++++
>   2 files changed, 9 insertions(+)
>   create mode 100644 arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-monoli=
thic.dts
>
> diff --git a/arch/arm64/boot/dts/broadcom/Makefile b/arch/arm64/boot/dts=
/broadcom/Makefile
> index 3d0efb93b06d..4836c6da5bee 100644
> --- a/arch/arm64/boot/dts/broadcom/Makefile
> +++ b/arch/arm64/boot/dts/broadcom/Makefile
> @@ -7,6 +7,7 @@ dtb-$(CONFIG_ARCH_BCM2835) +=3D bcm2711-rpi-400.dtb \
>   			      bcm2711-rpi-4-b.dtb \
>   			      bcm2711-rpi-cm4-io.dtb \
>   			      bcm2712-rpi-5-b.dtb \
> +			      bcm2712-rpi-5-b-monolithic.dtb \
>   			      bcm2712-d-rpi-5-b.dtb \
>   			      bcm2837-rpi-3-a-plus.dtb \
>   			      bcm2837-rpi-3-b.dtb \
> diff --git a/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-monolithic.dts=
 b/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-monolithic.dts
> new file mode 100644
> index 000000000000..3aeee678b0bc
> --- /dev/null
> +++ b/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-monolithic.dts
> @@ -0,0 +1,8 @@
> +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
> +/dts-v1/;
> +
> +#include "bcm2712-rpi-5-b.dts"
> +
> +&pcie2 {
> +	#include "rp1-nexus.dtsi"
> +};


