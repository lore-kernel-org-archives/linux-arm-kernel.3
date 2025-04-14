Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E486C369B5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Apr 2025 11:47:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5Yqz6YDLmosCf4LwVIBid/uZpaNuifGBNUOWF1Ok3z8=; b=scqDFbILlNOxQ9kTXFMe6OC29B
	N26wA9batxemO0BhSYDQdbayXOTOqfTBFW7rrc59kUjC8Or2AOZ3eevZe8WV4BlmcTYE22bYXmP5f
	JjSQfp06cUHzCnd9PomzVHJJ90w2Hc8odMeYlQ/Vidm7x6GnRLVj29CHFUTXeG9CUCnJ7QNea5wzw
	D5RRGh+8s/c+bcxMkeohQY9IRueB1M4GaHDRB8f7elIPLzHcgC4kvFSthnbNi+RucSD3rrMef0eAf
	0k5VORFsprPELsUx1n/HYDPUzhGKXmXRKD8V7/NVeNHCB0IHLIKHitpKAuCbYtNs2vjpdr/vGalPh
	7EXqcmmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4IHp-00000001pJa-3Kgt;
	Mon, 14 Apr 2025 11:47:37 +0000
Received: from mout.gmx.net ([212.227.15.18])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4I9B-00000001nLI-2i8F
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Apr 2025 11:38:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1744630711; x=1745235511; i=wahrenst@gmx.net;
	bh=5Yqz6YDLmosCf4LwVIBid/uZpaNuifGBNUOWF1Ok3z8=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=H0sFDIZsvbu7eadEOfhvpsig557h5T4fVsdqhIrBvDjjyxf+kw5m2dYClZv3FATR
	 rpATfe2E5LMuvoZL8B+aKpyj9Bwg6//OnkxVxgdoXrv68ycU9zOh7uIVb8CLp9w0I
	 VzBOxdVZvAvqby0MLfPVA7ztYVMQijJ3rtzDfCXt0Hh/vgaU0FltcFkW1Z+af9u2C
	 913J6HX7dOF21eWTKxsYC4hwGs4yvnVHVXlNnef9DAy+MGPXvImJzcJgNKeOk03oB
	 zO6aC/1IhSLQgshoySKcyTB1EBJzg6aItmds8ZWWjpkWREKzfjphWDQDJ1/7TzqjH
	 pZEyJzAGIDZaxAaRqg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.1.107] ([37.4.251.153]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1M1poA-1u26Hv1PB2-00DKvJ; Mon, 14
 Apr 2025 13:38:31 +0200
Message-ID: <abb3405a-45fb-4425-a817-89a03b0c16c4@gmx.net>
Date: Mon, 14 Apr 2025 13:38:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 10/13] arm64: dts: Add overlay for RP1 device
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
 <ab9ab3536baf5fdf6016f2a01044f00034189291.1742418429.git.andrea.porta@suse.com>
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
In-Reply-To: <ab9ab3536baf5fdf6016f2a01044f00034189291.1742418429.git.andrea.porta@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:m8JLxCwdInGWwVIBpPbWU85afGcQak8XuDSiAyyOP0EmeklFBz0
 hl4x34oAp+KNiLjDCLAoxHrznsBPvcnDWCFB193V4upZYpMs40GI2TqwkaQ6gaacflG7bOQ
 EMPaxpr1mFixC81q0mbv+LRK8wc44QYFoCnKnP6uT1vlasOa6ZQCCtek/T2Kz9SKVqA1bFJ
 wdUbubZcymN48TQHDXT0w==
UI-OutboundReport: notjunk:1;M01:P0:EhsPipdgz2M=;g3X/9zeu8NWjQ6d/rmQ0irfcxJ/
 XzlBaf60rX/TLoFVsn5MVtvPRLvOEiKdfGSUC2bX2UBW0EpJOJWfagXAKhkfoBkCMlwm+tZpw
 yYaJ+bIiqADOU/+GZ3dSVaQMzLVKMESLZJorEtoqtT49HEFCVfMAVFrcxlr/FnodYVTuvqBLI
 2jd+2LK6QUd6RMo3b5S1tiP3NkJTLX65UIGJb+EX3QKlzcBbuDtqET0D5edbUxhgiK+1aEPao
 RqNr7IiJFI9AP4Yk5T3RjT5KsrBN+BJ7kt5Z9V/lQvOqwL9RDiMH94pi/6xu9MCZ3TeN8n4Lk
 WC0tILwnOgBUzD2ZYLdI1yjpGzRSOYNN3y5NGaK1kYHJ29X2kyN+H0HZD1em6uskGWU3v5B6o
 +Jsi+HUlsphsvY9OM8lubZC9dqQ2DzWvUZkKS7dzSO1ugQcH3nt/UXxzAyh7xKYClx0WUgFvh
 QJ1a4rI4nl43TZ4E7uoLMWHAwn+cdy+iFFUQcCSC0J/WYgvhm9NtLaloCHypcu4DECk/EN1KM
 yf57bYcS92ZavxWNGeoNMOSwd/zp0hMQPBF1BSPVPWOZZ5z1iBaK9k4o36xnLrDNZrVJeD4OP
 IcLtxlUtrRE5KH/+F9jWouP9eNhK+hesGmYyvY/P7RnDdBeGfdXjPc9oKEk1OJqHN4wLXFzik
 roe44AAeU5YSHd3NZ8j/5tDyKiRklQYpjlqVbAnd4jIVpXZK/o6DZWiyZRmhcCtPP0ZMgeUro
 ytiZQqeQMCDdYBupYDfclhA+Zgh72EYTt8OUImEIdiDMILHbUtZk/RyXn39oY+cRiKa2LBUK/
 0ElUSPw4u++83Pu+kOYpXRuf0lmJ3obBHSgkdKbNh6AVWlbHuvnEKXRaAbhROt1b2c1a5S2/H
 JvrGHvmGwapmXSL/y7bKIZRbIwEsnff8fsyKRBQyRd6w1smn1gK2A9UEuuIvWQ7egeQo1i4PL
 l+fDr4/1GbDzkXXDlHHg5d6eBEAIJMIhKWs8eaIt/Fa9wOTDj0xUF8Dr6gvAhrqJ0ZEkZ9oF0
 mtD2MCFsFlpijH8E3NeRoJCAI0wuEbGPD5dvv6K+vIo+LyQpKjdUNw5PZVWNFR3smQdC4u7oh
 XYu9Zv4PO6cu+8A6HIJ6KvmYj0GCVxzUkXkZsE3ZdmlA/W09eZmJzNG3b/vQOQdGY18GoJsZw
 3TRjhx1bvUtr/jUtoSSaTPJ1iJAtK2nfLkrv8i/rJqBko+T7nDfLx1KIqKoOGZWkks1r8f5zU
 aqN2d+8ChDTNSFENFKtnofG/2w/7U7vnkncD134pe6x9S/0xaZwBIsGyAQD2G5oSsHR+Wr3/o
 yiC8Jdj9mo1q/5fKhnM4RLVQNrUfWocUhqMig2BqR8ovSxtNEInnV/QlaAxcPG8+iKRqjnIak
 HpFb5XQquykn9MQLQx6/9+vrpAyceuUW9Tx1hEBYooWafXQerd482sXlUw1Riuw8zk3NuYQ7a
 3wMVDcCP5dcHNixEAYB82cPXEpmg=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250414_043841_990897_1B78C836 
X-CRM114-Status: GOOD (  18.50  )
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

just a nit. Could you please add "broadcom:" to the subject?

Am 19.03.25 um 22:52 schrieb Andrea della Porta:
> Define the RP1 node in an overlay. The inclusion tree is
> as follow (the arrow points to the includer):
>
>                        rp1.dtso
>                            ^
>                            |
> rp1-common.dtsi ----> rp1-nexus.dtsi
>
> Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
> ---
> This patch can be considered optional, since it fills just the second
> scenario as detailed in [1], which is the RP1 DT node loaded from a dtb
> overlay by the FW at early boot stage.
> This may be useful for debug purpose, but as such not strictly necessary=
.
>
> [1] https://lore.kernel.org/all/CAMEGJJ0f4YUgdWBhxvQ_dquZHztve9KO7pvQjoD=
WJ3=3Dzd3cgcg@mail.gmail.com/#t
> ---
>   arch/arm64/boot/dts/broadcom/Makefile |  3 ++-
>   arch/arm64/boot/dts/broadcom/rp1.dtso | 11 +++++++++++
>   2 files changed, 13 insertions(+), 1 deletion(-)
>   create mode 100644 arch/arm64/boot/dts/broadcom/rp1.dtso
>
> diff --git a/arch/arm64/boot/dts/broadcom/Makefile b/arch/arm64/boot/dts=
/broadcom/Makefile
> index 4836c6da5bee..58293f9c16ab 100644
> --- a/arch/arm64/boot/dts/broadcom/Makefile
> +++ b/arch/arm64/boot/dts/broadcom/Makefile
> @@ -13,7 +13,8 @@ dtb-$(CONFIG_ARCH_BCM2835) +=3D bcm2711-rpi-400.dtb \
>   			      bcm2837-rpi-3-b.dtb \
>   			      bcm2837-rpi-3-b-plus.dtb \
>   			      bcm2837-rpi-cm3-io3.dtb \
> -			      bcm2837-rpi-zero-2-w.dtb
> +			      bcm2837-rpi-zero-2-w.dtb \
> +			      rp1.dtbo
>  =20
>   subdir-y	+=3D bcmbca
>   subdir-y	+=3D northstar2
> diff --git a/arch/arm64/boot/dts/broadcom/rp1.dtso b/arch/arm64/boot/dts=
/broadcom/rp1.dtso
> new file mode 100644
> index 000000000000..ab4f146d22c0
> --- /dev/null
> +++ b/arch/arm64/boot/dts/broadcom/rp1.dtso
> @@ -0,0 +1,11 @@
> +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
> +
> +/dts-v1/;
> +/plugin/;
> +
> +&pcie2 {
> +	#address-cells =3D <3>;
> +	#size-cells =3D <2>;
> +
> +	#include "rp1-nexus.dtsi"
> +};


