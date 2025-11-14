Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8954CD8CBF
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Nov 2025 02:18:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EkHHNqQQYU6ZiC0E6NsWZtH9i5f8YolbD7wxmtKMxPI=; b=jhCJee9TcpF9MLxWYRzAateeGY
	IaWmHJmHLQYt72MDa3tdbKIB9jQ4WP23n1L7BPA1Fg3PdHeSkbvEEeaZ07RKhNSitxT/5YnsYEMvJ
	kPRwW/LykRzu4k4pYKNX17p6oJBmLolHkBf59+If9qhcWYThjYyY1Zv5kHWj3+XiNVx2OysvkCctb
	DazlAiWOk+qXrk0DAMHV5jzDOU39XN9csS4CHPl/Yzc7BtT7LduVCNIDSRkrOvn+ZCbe/zs65J/UY
	iQ7Ecsk5wCE0WZvP7ark1Ld2oQ0HyjVV+1nu4Yhj+AaBcwe0J1basYc+vNxeaOany+qcjn7kQf+02
	GX/UQYNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJjNx-0000000BPf8-1owR;
	Fri, 14 Nov 2025 02:18:01 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJjNu-0000000BPef-0aCR
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Nov 2025 02:17:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1763086676;
	bh=EkHHNqQQYU6ZiC0E6NsWZtH9i5f8YolbD7wxmtKMxPI=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=Y8Q16x+R0u3X4GaKGrxzwjd3gy3XyUEkupMAm1BMBS/ctKDN3G+cyGY7wrNzBXN4C
	 wwNukF8R3P5rIOCIl0OS5b+N/oBjzYR0Vx5GIHW7FtApywZjCVoPTiO6SxIZGKQxyg
	 yNmVXsNBH7XzPsNcD//nO7HuV2GF0nt8b51fO7PXPgwNvmzYDKnuHZTtQSPAuCWVTW
	 FaTw8wb2A2VrcDcM8c1ZXoTE612G6EB9PuPLhl2gcMGOy04fnqvF520wlWQeX9qs6Q
	 APSx/COrUE0T34f05I5uqmneDEYOluY4gCE0j3gns5t1klmnd2R4TM0WDieShyf+/Z
	 cehd2luNV/blA==
Received: from [192.168.68.115] (unknown [180.150.112.244])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id A8B0B7AEA8;
	Fri, 14 Nov 2025 10:17:55 +0800 (AWST)
Message-ID: <732aee9c7e895f73f25fbb4bdc97bf5984662a26.camel@codeconstruct.com.au>
Subject: Re: [PATCH v2] ARM: dts: aspeed: bletchley: remove WDTRST1
 assertion from wdt1
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Cosmo Chou <chou.cosmo@gmail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
	cosmo.chou@quantatw.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, 	joel@jms.id.au
Date: Fri, 14 Nov 2025 12:47:55 +1030
In-Reply-To: <20251018043310.1056032-1-chou.cosmo@gmail.com>
References: <20251018043310.1056032-1-chou.cosmo@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.1-1+deb13u1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251113_181758_402855_70158D75 
X-CRM114-Status: GOOD (  13.94  )
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

Hi Cosmo,

On Sat, 2025-10-18 at 12:33 +0800, Cosmo Chou wrote:
> Remove the external signal configuration from wdt1 to prevent the
> WDTRST1 pin from being asserted during watchdog resets.
>=20
> The WDTRST1 pin was originally configured to reset the TPM during
> watchdog events. However, the pin is incorrectly routed to SRST#
> on the hardware, causing unintended system resets. Since the TPM
> is not currently utilized on this platform, remove the external
> signal configuration to avoid the incorrect reset behavior.
>=20
> Signed-off-by: Cosmo Chou <chou.cosmo@gmail.com>
> ---
> =C2=A0arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-bletchley.dts | 6 ----=
--
> =C2=A01 file changed, 6 deletions(-)

In the process of applying this I was looking at the warnings the
bletchley dts generates. There are quite a few that are devicetree-
specific (i.e. not caused by issues in the SoC DTSI):

   .../arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-bletchley.dtb: / (faceb=
ook,bletchley-bmc): spi1-gpio: {'compatible': ['spi-gpio'], '#address-cells=
': 1, '#size-cells': 0, 'gpio-sck': [50, 203, 0], 'gpio-mosi': [50, 204, 0]=
, 'gpio-miso': [50, 205, 0], 'num-chipselects': 1, 'cs-gpios': [[50, 200, 1=
]], 'tpm@0': {'compatible': ['infineon,slb9670', 'tcg,tpm_tis-spi'], 'spi-m=
ax-frequency': 33000000, 'reg': [[0]]}} is not of type 'array'
           from schema $id: http://devicetree.org/schemas/gpio/gpio-consume=
r.yaml#
   .../arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-bletchley.dtb: timer (a=
rm,armv7-timer): 'clocks' does not match any of the regexes: '^pinctrl-[0-9=
]+$'
           from schema $id: http://devicetree.org/schemas/timer/arm,arch_ti=
mer.yaml#
   .../arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-bletchley.dtb: sdram@1e=
6e0000 (aspeed,ast2600-sdram-edac): compatible: ['aspeed,ast2600-sdram-edac=
', 'syscon'] is too long
           from schema $id: http://devicetree.org/schemas/edac/aspeed,ast24=
00-sdram-edac.yaml#
   .../arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-bletchley.dtb: bus@1e60=
0000 (aspeed,ast2600-ahbc): compatible: ['aspeed,ast2600-ahbc', 'syscon'] i=
s too long
           from schema $id: http://devicetree.org/schemas/bus/aspeed,ast260=
0-ahbc.yaml#
   .../arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-bletchley.dtb: syscon@1=
e6e2000 (aspeed,ast2600-scu): 'smp-memram@180' does not match any of the re=
gexes: '^interrupt-controller@[0-9a-f]+$', '^p2a-control@[0-9a-f]+$', '^pin=
ctrl(@[0-9a-f]+)?$', '^pinctrl-[0-9]+$', '^silicon-id@[0-9a-f]+$'
           from schema $id: http://devicetree.org/schemas/mfd/aspeed,ast2x0=
0-scu.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-bletchley.dtb: /ahb/apb/sys=
con@1e6e2000/smp-memram@180: failed to match any schema with compatible: ['=
aspeed,ast2600-smpmem']
   .../arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-bletchley.dtb: adc@1e6e=
9000 (aspeed,ast2600-adc0): 'interrupts', 'vref' do not match any of the re=
gexes: '^pinctrl-[0-9]+$'
           from schema $id: http://devicetree.org/schemas/iio/adc/aspeed,as=
t2600-adc.yaml#
   .../arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-bletchley.dtb: adc@1e6e=
9100 (aspeed,ast2600-adc1): 'interrupts', 'vref' do not match any of the re=
gexes: '^pinctrl-[0-9]+$'
           from schema $id: http://devicetree.org/schemas/iio/adc/aspeed,as=
t2600-adc.yaml#
   .../arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-bletchley.dtb: crypto@1=
e6fa000 (aspeed,ast2600-acry): 'aspeed,ahbc' does not match any of the rege=
xes: '^pinctrl-[0-9]+$'
           from schema $id: http://devicetree.org/schemas/crypto/aspeed,ast=
2600-acry.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-bletchley.dtb: /ahb/apb/lpc=
@1e789000/lhc@a0: failed to match any schema with compatible: ['aspeed,ast2=
600-lhc']
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-bletchley.dtb: /ahb/apb/lpc=
@1e789000/ibt@140: failed to match any schema with compatible: ['aspeed,ast=
2600-ibt-bmc']
   .../arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-bletchley.dtb: pca9539@=
76 (nxp,pca9539): '#address-cells', '#size-cells' do not match any of the r=
egexes: '^(hog-[0-9]+|.+-hog(-[0-9]+)?)$', '^pinctrl-[0-9]+$'
           from schema $id: http://devicetree.org/schemas/gpio/gpio-pca95xx=
.yaml#
   .../arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-bletchley.dtb: pca9539@=
76 (nxp,pca9539): '#address-cells', '#size-cells' do not match any of the r=
egexes: '^(hog-[0-9]+|.+-hog(-[0-9]+)?)$', '^pinctrl-[0-9]+$'
           from schema $id: http://devicetree.org/schemas/gpio/gpio-pca95xx=
.yaml#
   .../arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-bletchley.dtb: pca9539@=
76 (nxp,pca9539): '#address-cells', '#size-cells' do not match any of the r=
egexes: '^(hog-[0-9]+|.+-hog(-[0-9]+)?)$', '^pinctrl-[0-9]+$'
           from schema $id: http://devicetree.org/schemas/gpio/gpio-pca95xx=
.yaml#
   .../arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-bletchley.dtb: pca9539@=
76 (nxp,pca9539): '#address-cells', '#size-cells' do not match any of the r=
egexes: '^(hog-[0-9]+|.+-hog(-[0-9]+)?)$', '^pinctrl-[0-9]+$'
           from schema $id: http://devicetree.org/schemas/gpio/gpio-pca95xx=
.yaml#
   .../arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-bletchley.dtb: pca9539@=
76 (nxp,pca9539): '#address-cells', '#size-cells' do not match any of the r=
egexes: '^(hog-[0-9]+|.+-hog(-[0-9]+)?)$', '^pinctrl-[0-9]+$'
           from schema $id: http://devicetree.org/schemas/gpio/gpio-pca95xx=
.yaml#
   .../arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-bletchley.dtb: pca9539@=
76 (nxp,pca9539): '#address-cells', '#size-cells' do not match any of the r=
egexes: '^(hog-[0-9]+|.+-hog(-[0-9]+)?)$', '^pinctrl-[0-9]+$'
           from schema $id: http://devicetree.org/schemas/gpio/gpio-pca95xx=
.yaml#
   .../arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-bletchley.dtb: i2c@700 =
(aspeed,ast2600-i2c-bus): Unevaluated properties are not allowed ('aspeed,h=
w-timeout-ms' was unexpected)
           from schema $id: http://devicetree.org/schemas/i2c/aspeed,i2c.ya=
ml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-bletchley.dtb: /ahb/apb/dma=
-controller@1e79e000: failed to match any schema with compatible: ['aspeed,=
ast2600-udma']
   .../arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-bletchley.dtb: spi1-gpi=
o (spi-gpio): $nodename:0: 'spi1-gpio' does not match '^spi(@.*|-([0-9]|[1-=
9][0-9]+))?$'
           from schema $id: http://devicetree.org/schemas/spi/spi-gpio.yaml=
#
   .../arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-bletchley.dtb: spi1-gpi=
o (spi-gpio): gpio-miso: False schema does not allow [50, 205, 0]
           from schema $id: http://devicetree.org/schemas/spi/spi-gpio.yaml=
#
   .../arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-bletchley.dtb: spi1-gpi=
o (spi-gpio): gpio-mosi: False schema does not allow [50, 204, 0]
           from schema $id: http://devicetree.org/schemas/spi/spi-gpio.yaml=
#
   .../arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-bletchley.dtb: spi1-gpi=
o (spi-gpio): gpio-sck: False schema does not allow [50, 203, 0]
           from schema $id: http://devicetree.org/schemas/spi/spi-gpio.yaml=
#
   .../arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-bletchley.dtb: spi1-gpi=
o (spi-gpio): 'sck-gpios' is a required property
           from schema $id: http://devicetree.org/schemas/spi/spi-gpio.yaml=
#
   .../arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-bletchley.dtb: spi1-gpi=
o (spi-gpio): Unevaluated properties are not allowed ('#address-cells', '#s=
ize-cells', 'gpio-miso', 'gpio-mosi', 'gpio-sck', 'tpm@0' were unexpected)
           from schema $id: http://devicetree.org/schemas/spi/spi-gpio.yaml=
#
   .../arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-bletchley.dtb: front_gp=
io_leds (gpio-leds): 'sys_log_id' does not match any of the regexes: '(^led=
-[0-9a-f]$|led)', '^pinctrl-[0-9]+$'
           from schema $id: http://devicetree.org/schemas/leds/leds-gpio.ya=
ml#
   .../arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-bletchley.dtb: fan_gpio=
_leds (gpio-leds): 'fan0_amber', 'fan0_blue', 'fan1_amber', 'fan1_blue', 'f=
an2_amber', 'fan2_blue', 'fan3_amber', 'fan3_blue' do not match any of the =
regexes: '(^led-[0-9a-f]$|led)', '^pinctrl-[0-9]+$'
           from schema $id: http://devicetree.org/schemas/leds/leds-gpio.ya=
ml#
   .../arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-bletchley.dtb: gpio-key=
s (gpio-keys): 'presence-sled1', 'presence-sled2', 'presence-sled3', 'prese=
nce-sled4', 'presence-sled5', 'presence-sled6' do not match any of the rege=
xes: '^(button|event|key|switch|(button|event|key|switch)-[a-z0-9-]+|[a-z0-=
9-]+-(button|event|key|switch))$', '^pinctrl-[0-9]+$'
           from schema $id: http://devicetree.org/schemas/input/gpio-keys.y=
aml#
  =20
Can you please take some time to address them?

Cheers,

Andrew

