Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 244CDCA6017
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 10 Oct 2026 12:25:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0nDbcmvw++nIvZl2eKTAuF6jIVwbx2iXREQ2mn7C9RI=; b=N3kgDRlbPQofjQPhJijNXTDpZS
	vD8KYVm/30lwtNg8vTg+8b+KzteiZkCGz3+OCqc+1gu/JP5a77pVfCZvJgaee9VmHdT6G7ZW9EZMN
	MtJMQ6yb7i7uBwdw7i0ZEZUGLDEJZ0sqW9+cJncgXrhdiBzU+6D2XB4E6N13DB7eNou4RSLrMMECq
	nJ6aEVUXtCoQf5TtLE5ohJFGi8h/MFEiQEWZu9jKNSZrQZBPExSwyXr6szYtmhfqdyI+tZi2dvVQL
	wD5JfaUDLRUVK6JsQewtM9p4uc2GHiVqiBRCCXQfcado3pAdB8O6xsX9P4hcVkc/MD4ToiM62aYfQ
	o5isVaCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFW8w-000000081BS-0d1C;
	Sat, 10 Oct 2026 12:25:38 +0000
Received: from delivery.antispam.mailspamprotection.com ([185.56.87.0])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFW8q-000000081AC-0eCl
	for linux-arm-kernel@lists.infradead.org;
	Sat, 10 Oct 2026 12:25:36 +0000
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=outgoing.instance-europe-west4-jgww.prod.antispam.mailspamprotection.com; s=arckey; t=1791635132;
	 b=oETu+E1jXHcOJDnVjzxfW6/E4IHqoMymCSZN1f0MIXXB5RZUG6j6AuEkaCSMvJPR7WC9/5GkSE
	  Lu3tsMei6OwZbKKUDg4oVqA7W/j0ajhBoyMeJP+7Uay+i9MGbCjLJvoeguEBnrrCHRjnbnlCvZ
	  l9aQLig0XPU4/ViD4ZPv1CGjOXzgjMwaflNb6YwikedasIbkoSPGRIHhwu8KJOtec1kuEbmyhX
	  M04IElTHMF6WmgBlqr+AiJTMYpunFrBXYas960nexqwt3jCmpqX0pHqerPWmoQMnkHsn2fX9Pm
	  GuZexZvYRloHwAn4aAu63bK6spU9dQfn1GqXQebG1+D9Qw==;
ARC-Authentication-Results: i=1; outgoing.instance-europe-west4-jgww.prod.antispam.mailspamprotection.com; smtp.remote-ip=35.214.173.214;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed; d=outgoing.instance-europe-west4-jgww.prod.antispam.mailspamprotection.com; s=arckey; t=1791635132;
	bh=TloiGb9LcjiPJPFSG2XTLgeNMAlw0y3F26oR4V/bRq0=;
	h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:
	  From:Date:DKIM-Signature:DKIM-Signature;
	b=uB9p+jE7a21ZFHLgCLH2zbBqEJlsyXVTdvmmQv5hgjm+lSffSDKMV2Y/kE34HrkY+T8Fa0e+yt
	  JHHvhRjDtMAM33l3/EQ9nb0AWYMvOLi99WKsGhzeyWxmRVNF9VzRCQ+cpvDUOmvfJCX7bWVpPI
	  OM4X2Prc6iXHPzpo130Bs8+UdHj5udpX8jTeqyyvu+36+lpaysdfcY2Le718R6AQ+3HVkOvoLG
	  Ocnx9eyodk9HZ2IKPGCsFUnTHk11oU4QYbNMfJ/AZ+fyhmdARxc/rLcHaKP9ReJuPYmhL0jxlP
	  u3jJ6p5iiGmmRUnzv1OG4dRhpYsSF7YpWUIao4iJFNRLwQ==;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=antispam.mailspamprotection.com; s=default; h=CFBL-Feedback-ID:CFBL-Address
	:Content-Type:MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	List-Unsubscribe:Content-Transfer-Encoding;
	bh=0nDbcmvw++nIvZl2eKTAuF6jIVwbx2iXREQ2mn7C9RI=; b=tiJRPcJCVLPLEPUAHYTtb92lsY
	mEjdS94ZGTibx6YiSJRzwebHUfOX1Q86+GtdvZxDJm5VaRg/4go0GZ4M1v66Y6hKRkI19aorVV64D
	btjaDzRVm6Y46fxkDRSoJYJ5oETNTIFuMbmHBQW3+hHC3tUCwL/0rdGATGN+UT8OzkPo=;
Received: from 214.173.214.35.bc.googleusercontent.com ([35.214.173.214] helo=esm19.siteground.biz)
	by instance-europe-west4-jgww.prod.antispam.mailspamprotection.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <francesco@valla.it>)
	id 1xFW8i-0000000HA0Y-0ETs
	for linux-arm-kernel@lists.infradead.org;
	Sat, 10 Oct 2026 12:25:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=valla.it;
	s=default; h=Subject:Cc:To:From:Date:list-help:list-unsubscribe:
	list-subscribe:list-post:list-owner:list-archive;
	bh=0nDbcmvw++nIvZl2eKTAuF6jIVwbx2iXREQ2mn7C9RI=; b=GX50AT9rmahSgmb1EoN0MuGfp2
	VwjzweppWraRBrFEsxLy0KNiD/JhU02ZkQQDjp+iVeJB60AIIWJ843/trGpC8rREWvkdhyIRLqh4G
	svhWp4Y9ks7lQ6+9njx1T73eTYqqWpNAhAf9ziuqNZh2hValmvdS9mp2xrD+p1wMp3X0=;
Received: from [79.22.26.204] (port=60194 helo=bywater)
	by esm19.siteground.biz with essmtpa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <francesco@valla.it>)
	id 1xFW8Q-000000004lR-2XJG;
	Sat, 10 Oct 2026 12:25:06 +0000
Date: Sat, 10 Oct 2026 14:25:04 +0200
From: Francesco Valla <francesco@valla.it>
To: Peng Fan <peng.fan@oss.nxp.com>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>, 
	Bjorn Andersson <andersson@kernel.org>, Kees Cook <kees@kernel.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, Marek Szyprowski <m.szyprowski@samsung.com>, 
	Robin Murphy <robin.murphy@arm.com>, Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Peng Fan <peng.fan@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
	linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	virtualization@lists.linux.dev, imx@lists.linux.dev, iommu@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH RFC 12/12] PoC: arm64: dts: imx93-11x11-frdm: add
 multiple vdevs
Message-ID: <asonWC5ENWZJ1-3B@bywater>
References: <20260916-remoteproc_virtio_map-v1-0-dac8c5eb4aa9@valla.it>
 <20260916-remoteproc_virtio_map-v1-12-dac8c5eb4aa9@valla.it>
 <arKiOCGrWAKyc-bc@p14s>
 <arLawAw6kgFT2e0W@bywater>
 <arP06mWDehsIDh5s@p14s>
 <arP5AvA51GHrI8aN@bywater>
 <ashtOTx/xhTsMnQ3@shlinux89>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ashtOTx/xhTsMnQ3@shlinux89>
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - esm19.siteground.biz
X-AntiAbuse: Original Domain - lists.infradead.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - valla.it
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-SGantispam-id: 33622c2de7913bc473122ac72189621c
X-AntiAbuse: ID - 33622c2de7913bc473122ac72189621c
AntiSpam-DLS: false
AntiSpam-DLSP: 
AntiSpam-DLSRS: 
AntiSpam-TS: 1.0
CFBL-Address: feedback@antispam.mailspamprotection.com; report=arf
CFBL-Feedback-ID: 1xFW8i-0000000HA0Y-0ETs-feedback@antispam.mailspamprotection.com
Authentication-Results: outgoing.instance-europe-west4-jgww.prod.antispam.mailspamprotection.com;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261010_052533_890493_FBDDA8AE 
X-CRM114-Status: GOOD (  57.71  )
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

Hello Peng,

On Fri, Oct 09, 2026 at 12:27:37PM +0800, Peng Fan wrote:
> On Wed, Sep 23, 2026 at 08:42:23PM +0200, Francesco Valla wrote:
> >On Wed, Sep 23, 2026 at 09:48:58AM -0600, Mathieu Poirier wrote:
> >> On Tue, Sep 22, 2026 at 10:19:48PM +0200, Francesco Valla wrote:
> >> > On Tue, Sep 22, 2026 at 09:43:52AM -0600, Mathieu Poirier wrote:
> >> > > On Wed, Sep 16, 2026 at 11:10:57PM +0200, Francesco Valla wrote:
> >> > > > Add rings for multiple vdevs, as well as the required virtio nodes for
> >> > > > I2C, SPI and GPIO functionalities. On top of that, add example
> >> > > > peripherals using all of them.
> >> > > > 
> >> > > > NOTE: this is a Proof-Of-Concept, not meant to be integrated!
> >> > > > 
> >> > > > Signed-off-by: Francesco Valla <francesco@valla.it>
> >> > > > ---
> >> > > >  arch/arm64/boot/dts/freescale/imx93-11x11-frdm.dts | 128 +++++++++++++++++++--
> >> > > >  1 file changed, 119 insertions(+), 9 deletions(-)
> >> > > > 
> >> > > > diff --git a/arch/arm64/boot/dts/freescale/imx93-11x11-frdm.dts b/arch/arm64/boot/dts/freescale/imx93-11x11-frdm.dts
> >> > > > index bd14ba28690c..dfa3b122ac5f 100644
> >> > > > --- a/arch/arm64/boot/dts/freescale/imx93-11x11-frdm.dts
> >> > > > +++ b/arch/arm64/boot/dts/freescale/imx93-11x11-frdm.dts
> >> > > > @@ -53,6 +53,32 @@ button-k3 {
> >> > > >  		};
> >> > > >  	};
> >> > > >  
> >> > > > +	gpio-keys-virtio {
> >> > > > +		compatible = "gpio-keys-polled";
> >> > > > +		poll-interval = <100>;
> >> > > > +
> >> > > > +		button-v1 {
> >> > > > +			label = "Button V1";
> >> > > > +			linux,code = <BTN_3>;
> >> > > > +			gpios = <&v_gpio 23 GPIO_ACTIVE_LOW>;
> >> > > > +		};
> >> > > > +
> >> > > > +		button-v2 {
> >> > > > +			label = "Button V2";
> >> > > > +			linux,code = <BTN_4>;
> >> > > > +			gpios = <&v_gpio 24 GPIO_ACTIVE_LOW>;
> >> > > > +		};
> >> > > > +	};
> >> > > > +
> >> > > > +	leds {
> >> > > > +		compatible = "gpio-leds";
> >> > > > +
> >> > > > +		led {
> >> > > > +			gpios = <&v_gpio 18 GPIO_ACTIVE_HIGH>;
> >> > > > +			label = "LED V";
> >> > > > +		};
> >> > > > +	};
> >> > > > +
> >> > > >  	reg_usdhc2_vmmc: regulator-usdhc2 {
> >> > > >  		compatible = "regulator-fixed";
> >> > > >  		off-on-delay-us = <12000>;
> >> > > > @@ -89,11 +115,6 @@ linux,cma {
> >> > > >  			linux,cma-default;
> >> > > >  		};
> >> > > >  
> >> > > > -		rsc_table: rsc-table@2021e000 {
> >> > > > -			reg = <0 0x2021e000 0 0x1000>;
> >> > > > -			no-map;
> >> > > > -		};
> >> > > > -
> >> > > 
> >> > > Why is the resource table removed?  There is no mention of that in the
> >> > > changelog...
> >> > >
> >> > 
> >> > You are obviously right, the commit message here should have been a
> >> > poem, not a form of hermetic poetry. My bad.
> >> > 
> >> > The resource table here is causing problems with how Zephyr is managing
> >> > it at its side. If it is kept in a separate memory location and copied
> >> > there at runtime by the remote processor firmware during its startup
> >> > (which is the current Zephyr behavior), then there might be a race
> >> > condition when the aforesaid firmware is loaded and started by Linux
> >> > *and* at least one of the vdev drivers (here including rpmsg_bus) is
> >> > built-in. In this case, the copy of the resource table done by the
> >> > remote processor might - depending on the async execution of the two
> >> > processors - overwrite the status bit set by the Linux driver:
> >> > 
> >> >   Firmware load and startup (echo start > /sys/.../state)
> >> >                            |
> >> > 			   |
> >> > 			   V
> >> >   The vdev devices get registered (by register_virtio_device())
> >> >                            |
> >> > 			   |
> >> > 			   V
> >> >   If a driver is built-in, it probes and sets the vdev status
> >> >   inside the resource table @rsc-table.
> >> >                            .
> >> > 			   . (in the mean time)
> >> > 			   .
> >> >   The remote processor starts up and copies the resource table from its
> >> >   dedicated section to @rsc-table.
> >> > 
> >> > Depending on the system load and the complexity of the firmware, the two
> >> > operations can happen in whatever sequence, causing a race condition.
> >> 
> >> This would happen regardless of this patchset.
> >>
> >
> >Correct, *if* the remote processor is copying the resource table to a
> >specific location and expects the host to use that. On Zephyr (which is
> >clearly outside the scope here) this can be enabled through the
> >CONFIG_OPENAMP_COPY_RSC_TABLE option. I am keeping that disabled, and
> >removing the rsc-table node here.
> >
> >I am planning to reason on this and propose a proper fix in a separate
> >patchset.
> 
> The previous workaround for this was to add a delay in start function.
> 
> https://lore.kernel.org/all/20221102112451.128110-1-peng.fan@oss.nxp.com/
> https://lore.kernel.org/linux-remoteproc/20230707232444.374431-1-marex@denx.de/
>

That would *kind of* work, but it's clearly unfit for upstream.

> >
> >> > 
> >> > This is somewhat masked if vdev drivers are built as modules, as the
> >> > devices does not probe immediately but only after the modules have been
> >> > loaded, giving the remote processor time to start. Note that this is not
> >> > a solution! but a workaround.
> >> > 
> >> > If the rsc-table node is not there, the startup logic falls back to the
> >> > classic rproc_elf_find_loaded_rsc_table().
> >> 
> >> We can't remove @rsc-table to make a problem go away.  
> >> 
> >
> >I need to re-take a look at the NXP SDK to understand what's the real
> >purpose of having the rsc-table here. Judging from the commit message
> >that introduced support for such facility [1], it seems the SDK is not
> >really using it.
> >
> >Maybe someone from NXP can comment on this?
> 
> Linux needs to parse resource table to setup vring. When RPROC(remote processor)
> is booted by ROM or System Manager, there is no elf for Linux to use, so a
> pre-defined address is used rsc-table.
> 

Yes, that's clear, or it wouldn't know where to find the resource table. 

> 
> If RPROC is booted by Linux using remoteproc, rsc-table in DT is not needed.
> But RPROC is not aware it is booted by ROM, U-Boot, Linux. So it will always
> publish the resource table to rsc-table address.
> 
> And we need one DTB/Image to support mutiple boot cases.
> 

That's also clear. However, current setup for i.MX93 platforms is not
really working for the Linux+Zephyr case, or at least not in all
conditions.

If the firmware is loaded and started by the Linux kernel, the resource
table is copied to the rsc-table address before the CM33 is started.
However, at the beginning of its boot process, the CM33 itself will
clear its DTCM memory [1] to avoid ECC failures, actually overriding the
resource table the Linux kernel just wrote there. (Note that I linked
only the Zephyr case, but the official NXP SDK has a similar routine).

Regardless of what the CM33 does after (i.e., even if it copies the
resource table to the same location), it will lose any update the Linux
kernel did in the mean time to the resource table. If e.g. the
virtio_rpmsg_bus module is built-in, the readiness of the rpmsg
stack at Linux side will be lost most of the times.

This is probably working fine for firmwares based on the rpmsg-lite
library by NXP, which AFAICT doesn't use the status bits found inside
the resource table, but it's interfering with the way the OpenAMP stack
works.

ATM I do not have a solution to propose. I'm still thinking about it.
In the mean time, I decided to load and boot the CM33 firmware before
the Linux kernel starts.

> Hope this explains.
> 
> Regards
> Peng

Thank you!

Regards,
Francesco

[1] https://github.com/zephyrproject-rtos/zephyr/blob/main/soc/nxp/imx/imx9/imx93/m33/imx93_m33_startup.S#L18


