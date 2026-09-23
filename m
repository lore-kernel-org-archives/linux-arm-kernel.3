Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6A0FC98304
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 18:43:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TTFa+4iSF+2rRPsv1XVNqEG3YD/5TbmvxW/wccxckJ0=; b=klRUFaKAWzah5AmkWTxbla401S
	I9zwfgX3sipGRk+mto/JNVMDAdskjdTjku4wjEqOI1ctfSembhaHqBrtxyoFg05ET3GLZe1Pppxhb
	LU1tagTWH56Xmr+sCPcRTjEwf8M4JThoFpryMI5E0XWlwhEOdd5mMISPkiZEBdaCTkTPlzIUAMc5W
	/VT6a5Yyu+tA9rpKoeMTIyLTgGijVaGNJ6xdAoKEos/jxDEiX06IgVgf0tzUvABu/KxxKm8CNYTAE
	sBAXG0Z1cBlWmx7/ZYZ15A1wuLLyCsT5sKPLL7N2sNAPRpi/wb7vVIaiE+mgB80ctJDwwRwLWk44z
	M+WddYeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9Rvw-00000009FlK-0OhG;
	Wed, 23 Sep 2026 18:43:08 +0000
Received: from delivery.antispam.mailspamprotection.com ([185.56.87.0])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9Rvr-00000009Fiz-2cCX
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Sep 2026 18:43:06 +0000
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=outgoing.instance-europe-west4-5ns1.prod.antispam.mailspamprotection.com; s=arckey; t=1790188983;
	 b=tVKJ1011aaOVUIM++GYkowayFUYm2WcbqBSmZjPI2J9VRNS7Kgdk+7TDis3CcmIH7tpahJEeLm
	  wtUAj1A+heUA39VOZRadj7rhjicEljgnSu1Sv2Cj4PoqwJIzGaykG3DoysIPjylpwal/6NY7RH
	  Zpg822g1Q5rGzlEsXvPfvMV8U5i7/mPPZwDRiks1apweCk+GC5ghd1BBtxy1Avlhd2bSaCs60c
	  gn9Iyvxcj/pAWqVe/PiAOoJKHc15Lq4bP3xDCgCB3j6nYcmzJs3mMPO8O9GqACMuVxONMwmLJl
	  7Pmt1bPmEaMIoaY9RytzSw5akwlAWo69jTl22rGvBe43Eg==;
ARC-Authentication-Results: i=1; outgoing.instance-europe-west4-5ns1.prod.antispam.mailspamprotection.com; smtp.remote-ip=35.214.173.214;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed; d=outgoing.instance-europe-west4-5ns1.prod.antispam.mailspamprotection.com; s=arckey; t=1790188983;
	bh=j9dZdSTSxaYDMqzUODCHJRq16xiMdrtyG+eoFAibOg4=;
	h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:
	  From:Date:DKIM-Signature:DKIM-Signature;
	b=ErV58bpBoM/ghfMvD3l7OV9DfN7BkHE1AUsQRQIlfkWZ6cymlTzPnjeg9FqiY4ChQAp+WJk2y5
	  oDWlFlX8g82gBDd/gOzhv0tkXDDLSQ7Yo1q5TvY6FrD/MxcWPSsBvb9o8Vt8RW2Hn+4Bs7AR4R
	  ackNKYtHXZQXLmusoEm9mYZQXoExmfg9JRc6GgHShtUOPWZbS8BpnAQcLqc1kHlYZMImhJ4N/7
	  MG3YfmbyMQ15WYRJYSVlt5nTsKsaaK+6inbQLRe36z/XbRcIXazwchO6zbD7CPdJ5RAEYV37SD
	  r2eoaPEkJ+9mMKLpyNEgJ+Il0UDtJ1Fnz0K0JRqY1a3eQA==;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=antispam.mailspamprotection.com; s=default; h=CFBL-Feedback-ID:CFBL-Address
	:Content-Type:MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	List-Unsubscribe:Content-Transfer-Encoding;
	bh=TTFa+4iSF+2rRPsv1XVNqEG3YD/5TbmvxW/wccxckJ0=; b=Jn19txqrFeEtZV0kgq3mmB/5dG
	BTVkDpymDjlnRWFJVvqcEiTHaL0M86UwVtuljTidi4K+xQn6eaWqT3PEzWTp+t0syYBIPa64pzNHt
	E8rVAfb3gVo+5B5zHJlXr9CjpOdYGYaApybX8snkcEk43sKTEvW1JAFjDfoVplWK/GsE=;
Received: from 214.173.214.35.bc.googleusercontent.com ([35.214.173.214] helo=esm19.siteground.biz)
	by instance-europe-west4-5ns1.prod.antispam.mailspamprotection.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <francesco@valla.it>)
	id 1x9Rvi-00000001zqW-1yu2
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Sep 2026 18:42:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=valla.it;
	s=default; h=Subject:Cc:To:From:Date:list-help:list-unsubscribe:
	list-subscribe:list-post:list-owner:list-archive;
	bh=TTFa+4iSF+2rRPsv1XVNqEG3YD/5TbmvxW/wccxckJ0=; b=erovEHfrwiVjs6db7clhZWgHKr
	6ePKwQ5dNEKEz+MrT3+BX+d9uRHYQeHDbvnh84YIbungUgI12aH/r75TNn8sfZxC6iKflYy6xeJxK
	qrk9CvDXRJly/xVYVJEVnYVRODo+kZrA51xsWwKUh+SNeNJq1CbMrlVONb8OsHIFp8v8=;
Received: from [79.45.60.29] (port=60504 helo=bywater)
	by esm19.siteground.biz with essmtpa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <francesco@valla.it>)
	id 1x9RvF-00000000Eam-2iOy;
	Wed, 23 Sep 2026 18:42:25 +0000
Date: Wed, 23 Sep 2026 20:42:23 +0200
From: Francesco Valla <francesco@valla.it>
To: Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Kees Cook <kees@kernel.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, Marek Szyprowski <m.szyprowski@samsung.com>, 
	Robin Murphy <robin.murphy@arm.com>, Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Peng Fan <peng.fan@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
	linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	virtualization@lists.linux.dev, imx@lists.linux.dev, iommu@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH RFC 12/12] PoC: arm64: dts: imx93-11x11-frdm: add
 multiple vdevs
Message-ID: <arP5AvA51GHrI8aN@bywater>
References: <20260916-remoteproc_virtio_map-v1-0-dac8c5eb4aa9@valla.it>
 <20260916-remoteproc_virtio_map-v1-12-dac8c5eb4aa9@valla.it>
 <arKiOCGrWAKyc-bc@p14s>
 <arLawAw6kgFT2e0W@bywater>
 <arP06mWDehsIDh5s@p14s>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <arP06mWDehsIDh5s@p14s>
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - esm19.siteground.biz
X-AntiAbuse: Original Domain - lists.infradead.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - valla.it
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-SGantispam-id: 78c1dc960d9838a76a4655c256baa892
X-AntiAbuse: ID - 78c1dc960d9838a76a4655c256baa892
AntiSpam-DLS: false
AntiSpam-DLSP: 
AntiSpam-DLSRS: 
AntiSpam-TS: 1.0
CFBL-Address: feedback@antispam.mailspamprotection.com; report=arf
CFBL-Feedback-ID: 1x9Rvi-00000001zqW-1yu2-feedback@antispam.mailspamprotection.com
Authentication-Results: outgoing.instance-europe-west4-5ns1.prod.antispam.mailspamprotection.com;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_114304_140633_18B242A3 
X-CRM114-Status: GOOD (  50.94  )
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

On Wed, Sep 23, 2026 at 09:48:58AM -0600, Mathieu Poirier wrote:
> On Tue, Sep 22, 2026 at 10:19:48PM +0200, Francesco Valla wrote:
> > On Tue, Sep 22, 2026 at 09:43:52AM -0600, Mathieu Poirier wrote:
> > > On Wed, Sep 16, 2026 at 11:10:57PM +0200, Francesco Valla wrote:
> > > > Add rings for multiple vdevs, as well as the required virtio nodes for
> > > > I2C, SPI and GPIO functionalities. On top of that, add example
> > > > peripherals using all of them.
> > > > 
> > > > NOTE: this is a Proof-Of-Concept, not meant to be integrated!
> > > > 
> > > > Signed-off-by: Francesco Valla <francesco@valla.it>
> > > > ---
> > > >  arch/arm64/boot/dts/freescale/imx93-11x11-frdm.dts | 128 +++++++++++++++++++--
> > > >  1 file changed, 119 insertions(+), 9 deletions(-)
> > > > 
> > > > diff --git a/arch/arm64/boot/dts/freescale/imx93-11x11-frdm.dts b/arch/arm64/boot/dts/freescale/imx93-11x11-frdm.dts
> > > > index bd14ba28690c..dfa3b122ac5f 100644
> > > > --- a/arch/arm64/boot/dts/freescale/imx93-11x11-frdm.dts
> > > > +++ b/arch/arm64/boot/dts/freescale/imx93-11x11-frdm.dts
> > > > @@ -53,6 +53,32 @@ button-k3 {
> > > >  		};
> > > >  	};
> > > >  
> > > > +	gpio-keys-virtio {
> > > > +		compatible = "gpio-keys-polled";
> > > > +		poll-interval = <100>;
> > > > +
> > > > +		button-v1 {
> > > > +			label = "Button V1";
> > > > +			linux,code = <BTN_3>;
> > > > +			gpios = <&v_gpio 23 GPIO_ACTIVE_LOW>;
> > > > +		};
> > > > +
> > > > +		button-v2 {
> > > > +			label = "Button V2";
> > > > +			linux,code = <BTN_4>;
> > > > +			gpios = <&v_gpio 24 GPIO_ACTIVE_LOW>;
> > > > +		};
> > > > +	};
> > > > +
> > > > +	leds {
> > > > +		compatible = "gpio-leds";
> > > > +
> > > > +		led {
> > > > +			gpios = <&v_gpio 18 GPIO_ACTIVE_HIGH>;
> > > > +			label = "LED V";
> > > > +		};
> > > > +	};
> > > > +
> > > >  	reg_usdhc2_vmmc: regulator-usdhc2 {
> > > >  		compatible = "regulator-fixed";
> > > >  		off-on-delay-us = <12000>;
> > > > @@ -89,11 +115,6 @@ linux,cma {
> > > >  			linux,cma-default;
> > > >  		};
> > > >  
> > > > -		rsc_table: rsc-table@2021e000 {
> > > > -			reg = <0 0x2021e000 0 0x1000>;
> > > > -			no-map;
> > > > -		};
> > > > -
> > > 
> > > Why is the resource table removed?  There is no mention of that in the
> > > changelog...
> > >
> > 
> > You are obviously right, the commit message here should have been a
> > poem, not a form of hermetic poetry. My bad.
> > 
> > The resource table here is causing problems with how Zephyr is managing
> > it at its side. If it is kept in a separate memory location and copied
> > there at runtime by the remote processor firmware during its startup
> > (which is the current Zephyr behavior), then there might be a race
> > condition when the aforesaid firmware is loaded and started by Linux
> > *and* at least one of the vdev drivers (here including rpmsg_bus) is
> > built-in. In this case, the copy of the resource table done by the
> > remote processor might - depending on the async execution of the two
> > processors - overwrite the status bit set by the Linux driver:
> > 
> >   Firmware load and startup (echo start > /sys/.../state)
> >                            |
> > 			   |
> > 			   V
> >   The vdev devices get registered (by register_virtio_device())
> >                            |
> > 			   |
> > 			   V
> >   If a driver is built-in, it probes and sets the vdev status
> >   inside the resource table @rsc-table.
> >                            .
> > 			   . (in the mean time)
> > 			   .
> >   The remote processor starts up and copies the resource table from its
> >   dedicated section to @rsc-table.
> > 
> > Depending on the system load and the complexity of the firmware, the two
> > operations can happen in whatever sequence, causing a race condition.
> 
> This would happen regardless of this patchset.
>

Correct, *if* the remote processor is copying the resource table to a
specific location and expects the host to use that. On Zephyr (which is
clearly outside the scope here) this can be enabled through the
CONFIG_OPENAMP_COPY_RSC_TABLE option. I am keeping that disabled, and
removing the rsc-table node here.

I am planning to reason on this and propose a proper fix in a separate
patchset.

> > 
> > This is somewhat masked if vdev drivers are built as modules, as the
> > devices does not probe immediately but only after the modules have been
> > loaded, giving the remote processor time to start. Note that this is not
> > a solution! but a workaround.
> > 
> > If the rsc-table node is not there, the startup logic falls back to the
> > classic rproc_elf_find_loaded_rsc_table().
> 
> We can't remove @rsc-table to make a problem go away.  
> 

I need to re-take a look at the NXP SDK to understand what's the real
purpose of having the rsc-table here. Judging from the commit message
that introduced support for such facility [1], it seems the SDK is not
really using it.

Maybe someone from NXP can comment on this?

> > 
> > This is specific to i.MX platforms [1] and is probably not normally an
> > issue because - as stated in [1] - the offical SDK from NXP seems not
> > to check the status inside the resource table.
> > 
> > > >  		vdev0vring0: vdev0vring0@a4000000 {
> > > >  			reg = <0 0xa4000000 0 0x8000>;
> > > >  			no-map;
> > > > @@ -105,12 +126,42 @@ vdev0vring1: vdev0vring1@a4008000 {
> > > >  		};
> > > >  
> > > >  		vdev1vring0: vdev1vring0@a4010000 {
> > > > -			reg = <0 0xa4010000 0 0x8000>;
> > > > +			reg = <0 0xa4010000 0 0x1000>;
> > > > +			no-map;
> > > > +		};
> > > > +
> > > > +		vdev2vring0: vdev2vring0@a4011000 {
> > > > +			reg = <0 0xa4011000 0 0x2000>;
> > > > +			no-map;
> > > > +		};
> > > > +
> > > > +		vdev2vring1: vdev2vring1@a4013000 {
> > > > +			reg = <0 0xa4013000 0 0x2000>;
> > > > +			no-map;
> > > > +		};
> > > > +
> > > > +		vdev3vring0: vdev3vring0@a4015000 {
> > > > +			reg = <0 0xa4015000 0 0x2000>;
> > > > +			no-map;
> > > > +		};
> > > > +
> > > > +		vdev4vring0: vdev4vring0@a4017000 {
> > > > +			reg = <0 0xa4017000 0 0x4000>;
> > > > +			no-map;
> > > > +		};
> > > > +
> > > > +		vdev5vring0: vdev5vring0@a401B000 {
> > > > +			reg = <0 0xa401B000 0 0x2000>;
> > > > +			no-map;
> > > > +		};
> > > > +
> > > > +		vdev5vring1: vdev5vring1@a401D000 {
> > > > +			reg = <0 0xa401D000 0 0x2000>;
> > > >  			no-map;
> > > >  		};
> > > >  
> > > > -		vdev1vring1: vdev1vring1@a4018000 {
> > > > -			reg = <0 0xa4018000 0 0x8000>;
> > > > +		vdev5vring2: vdev5vring2@a401F000 {
> > > > +			reg = <0 0xa401F000 0 0x1000>;
> > > >  			no-map;
> > > >  		};
> > > >  
> > > > @@ -149,8 +200,67 @@ &cm33 {
> > > >  		 <&mu1 3 1>;
> > > >  	mbox-names = "tx", "rx", "rxdb";
> > > >  	memory-region = <&vdevbuffer>, <&vdev0vring0>, <&vdev0vring1>,
> > > > -			<&vdev1vring0>, <&vdev1vring1>, <&rsc_table>;
> > > > +			<&vdev1vring0>, <&vdev2vring0>, <&vdev2vring1>,
> > > > +			<&vdev3vring0>, <&vdev4vring0>,
> > > > +			<&vdev5vring0>, <&vdev5vring1>, <&vdev5vring2>;
> > > 
> > > Who is using vdev5 vrings?  
> > > 
> > 
> > Another thing that should have been in the commit message. Vdevs are
> > defined, in the Zephyr application I am using as PoC, as follows:
> > 
> >  - vdev0: RPMSG (tx and rx vrings)
> 
> To be backward compatible, there has to be a way to make vdev0 defaulting to
> RPMSG.  It would also be nice if bindings were define for RPMSG so that it can
> show up in the list of remoteproc-virtio devices like i2c, gpio and others.
>

What vdev type is inside vdev0 is up to the resource table (i.e., to the
firmware running on the remote processor), not the remoteproc-virtio
framework.

Defining bindings for rpmsg would today be... pointless? Since no
hardware needs to be described for it. The same goes for virtio-can and
virtio-entropy.

> 
> >  - vdev1: entropy (single request vring)
> >  - vdev2: GPIO (request and event vrings)
> >  - vdev3: I2C (single request vring)
> >  - vdev4: SPI (single request vring)
> >  - vdev5: CAN (tx, rx and control vrings)
> > 
> > vdev5 is not represented inside the devicetree because the can-virtio
> > driver registers a single CAN network device and has thus no need for
> > such representation.
> 
> Then why is it part of the remoteproc's memory-regions?
> 

Because a vring description needs to be present for it, or the
remoteproc-virtio won't be able to fill the entry inside the resource
table.

> > 
> > > >  	status = "okay";
> > > > +
> > > > +	virtio {
> > > > +		#address-cells = <1>;
> > > > +		#size-cells = <0>;
> > > > +
> > > > +		vdev@2 {
> > > > +			reg = <2>;
> > > > +
> > > > +			v_gpio: gpio {
> > > > +				compatible = "virtio,device29";
> > > > +				gpio-controller;
> > > > +				#gpio-cells = <2>;
> > > > +				interrupt-controller;
> > > > +				#interrupt-cells = <2>;
> > > > +			};
> > > > +		};
> > > > +
> > > > +		vdev@3 {
> > > > +			reg = <3>;
> > > > +
> > > > +			i2c {
> > > > +				compatible = "virtio,device22";
> > > > +				#address-cells = <1>;
> > > > +				#size-cells = <0>;
> > > > +
> > > > +				eeprom@50 {
> > > > +					compatible = "atmel,24c1025";
> > > > +					reg = <0x50>;
> > > > +				};
> > > > +			};
> > > > +		};
> > > > +
> > > > +		vdev@4 {
> > > > +			reg = <4>;
> > > > +
> > > > +			spi {
> > > > +				compatible = "virtio,device2d";
> > > > +				#address-cells = <1>;
> > > > +				#size-cells = <0>;
> > > > +
> > > > +				sram@0 {
> > > > +					compatible = "microchip,mchp23k256";
> > > > +					reg = <0>;
> > > > +					spi-max-frequency = <20000000>;
> > > > +				};
> > > > +
> > > > +				lcd@1 {
> > > > +					compatible = "adafruit,yx240qv29", "ilitek,ili9341";
> > > > +					reg = <1>;
> > > > +					spi-max-frequency = <10000000>;
> > > > +					dc-gpios = <&v_gpio 21 GPIO_ACTIVE_HIGH>;
> > > > +					reset-gpios = <&v_gpio 20 GPIO_ACTIVE_HIGH>;
> > > > +					rotation = <90>;
> > > > +				};
> > > > +			};
> > > > +		};
> > > > +	};
> > > >  };
> > > >  
> > > >  &eqos {
> > > > 
> > > > -- 
> > > > 2.55.0
> > > >
> > 
> > Thank you!
> > 
> > Regards,
> > Francesco
> > 
> > 

Thank you for the discussion - is helping in defining further
requirements and constraints.

Regards,
Francesco

[1] https://lore.kernel.org/all/20240719-imx_rproc-v2-2-10d0268c7eb1@nxp.com/



