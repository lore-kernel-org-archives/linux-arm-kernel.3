Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 990D9C9830E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Sep 2026 19:14:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1cy28oamoCRjiNiWmfH98MKJagA+6yzbPIYdI0DQhmg=; b=vff7Xa1z39XXt3aXkx8cTWu7yc
	e9V369QCdOEvV3ERev8FUPC56Z46yoKu3r75QPV4lRu9ZuF7k4J/8xXfb8IajBYCTYVbhLPsO+ciY
	so6TsHwvLuvqkHoDrYwaR5UQ6WfG7g8iyONqpt4zdbcH0qwmf/N53WIoMTe8ZelWUvCMHqP38a8Af
	Xx3ODhw3lbxEbMmSblEgN3HdH0tlASKHCmQzvJHdNoZiArHUPF0VnxtryJ7dYaifDJ7XHXICgQFuy
	SxPjWUgrvyUJGiTC3Zy4yfpmvivuruqrcGxUrwoM7RdDc0V7P/xNKImNaRCpaZUPhG6luobcDIChP
	XmrhXD0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xABMz-0000000EF8u-3lch;
	Fri, 25 Sep 2026 19:14:05 +0000
Received: from delivery.antispam.mailspamprotection.com ([185.56.87.6])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xABMx-0000000EF89-11WE
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Sep 2026 19:14:05 +0000
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=outgoing.instance-europe-west4-2q7f.prod.antispam.mailspamprotection.com; s=arckey; t=1790363643;
	 b=Kx+bW0W+QWGs/gRtEEcDGj+IEEk8Lb4WAX8+MGp5wcw9VqQ0rxTTn3PNnKu2QHHEUxz4Kz96oO
	  GGqQ4dvkfGgddIOUFxf0yY0BXma9tG8+no6kiRW5CrmowrN5NgOZSNhVbKe9h9rQxoJNuOasAY
	  h7vFdly5ylQCe2slUQVab2KRBMxslchaMAm9VolAj4jP3QtL4b6xNYijjhpE9b6km8ML0871/+
	  PIXRLA8NaVgazwr+lqfqfoBS4JzyliBzBwgFHxb1jCbN//jTc0ALXV397R3dBIHdBaoenRok7Q
	  L53E2nCAUPa966FXux/Of/Qar6Dn8vKyPjDC54dVmRlKUA==;
ARC-Authentication-Results: i=1; outgoing.instance-europe-west4-2q7f.prod.antispam.mailspamprotection.com; smtp.remote-ip=35.214.173.214;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed; d=outgoing.instance-europe-west4-2q7f.prod.antispam.mailspamprotection.com; s=arckey; t=1790363643;
	bh=yx/Ft/8wjagadLROp2/zxX+aa83VVkqcyzW3JXIAwYI=;
	h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:
	  From:Date:DKIM-Signature:DKIM-Signature;
	b=LFdLEi4en9I0iyPPUcH6zg9vjDUEKe6iF6sqgE7/Tp6vXpiEftWp/h2aqFdghvuD7g55UDHOKI
	  hSUf7Sc2GEJPrapfahaX1uGcg4LE0dSB0lvJpSwrpE6kDqLmm7lGAdr8eNNtBb3a1wt4Wvnk+5
	  1K62Bjs0ALOiBzPurgAcFY3UMKJsEVSqJs3xSXU2Var9NN4dSItDJ6ocSiSZ1tOtN630jG0T0G
	  6U2z33SHqKQ/HizSt8wg+ObTT2KBrRMpPLI15fDIjMRSB5qh+bCbGHCqLpiqPUxlYDtMI8uwPQ
	  bEFLJx9iwr7VgtclfULmCnuTlaUzUax39HNynW+T6DqQVw==;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=antispam.mailspamprotection.com; s=default; h=CFBL-Feedback-ID:CFBL-Address
	:Content-Type:MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	List-Unsubscribe:Content-Transfer-Encoding;
	bh=1cy28oamoCRjiNiWmfH98MKJagA+6yzbPIYdI0DQhmg=; b=oxz/AdOWd0J8CUe/CT9CEgluxH
	aWR2b12RvBKAnuEnNZrPTjxScFV/QXlzZ8SW6KCChTUT4bGbUFnMubOwwioouQvdmEAKasBU37XiI
	7tvJfTUAAKuqn83N84Yttg5PtglsYEPwatQhtO93J+dxRZAerQmu7t6V6Oow+kAsW5dc=;
Received: from 214.173.214.35.bc.googleusercontent.com ([35.214.173.214] helo=esm19.siteground.biz)
	by instance-europe-west4-2q7f.prod.antispam.mailspamprotection.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <francesco@valla.it>)
	id 1xABMt-00000006R10-2Sbi
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Sep 2026 19:14:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=valla.it;
	s=default; h=Subject:Cc:To:From:Date:list-help:list-unsubscribe:
	list-subscribe:list-post:list-owner:list-archive;
	bh=1cy28oamoCRjiNiWmfH98MKJagA+6yzbPIYdI0DQhmg=; b=LpL2B+x/aNpsi65IdfB6Ebt8ru
	aamO37IwhtRAj/59mH2tx7/idp18FjYphBv0CK7I8SW+Swv7szpMG2H1j8ufYUcPyRuv2WQHc/1S7
	duO/Kr0wLjfrlTGxgMwOJQtoSWCmyTFwSUK18mT5egF0yW2qgzUMH24GK4uc0Tfu3sIM=;
Received: from [79.45.60.29] (port=60566 helo=bywater)
	by esm19.siteground.biz with essmtpa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <francesco@valla.it>)
	id 1xABMZ-00000000Pn3-1jQq;
	Fri, 25 Sep 2026 19:13:39 +0000
Date: Fri, 25 Sep 2026 21:13:37 +0200
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
Message-ID: <arbGLZ8_xKJTpiVa@bywater>
References: <20260916-remoteproc_virtio_map-v1-0-dac8c5eb4aa9@valla.it>
 <20260916-remoteproc_virtio_map-v1-12-dac8c5eb4aa9@valla.it>
 <arKiOCGrWAKyc-bc@p14s>
 <arLawAw6kgFT2e0W@bywater>
 <arP06mWDehsIDh5s@p14s>
 <arP5AvA51GHrI8aN@bywater>
 <CANLsYkyT3NopaQy8CpTUrD-MTbif1dvyjaUUcQUWLzcTL7GpcQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANLsYkyT3NopaQy8CpTUrD-MTbif1dvyjaUUcQUWLzcTL7GpcQ@mail.gmail.com>
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - esm19.siteground.biz
X-AntiAbuse: Original Domain - lists.infradead.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - valla.it
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-SGantispam-id: 32e6190fc3560d6d3a4b026c8a288b1b
X-AntiAbuse: ID - 32e6190fc3560d6d3a4b026c8a288b1b
AntiSpam-DLS: false
AntiSpam-DLSP: 
AntiSpam-DLSRS: 
AntiSpam-TS: 1.0
CFBL-Address: feedback@antispam.mailspamprotection.com; report=arf
CFBL-Feedback-ID: 1xABMt-00000006R10-2Sbi-feedback@antispam.mailspamprotection.com
Authentication-Results: outgoing.instance-europe-west4-2q7f.prod.antispam.mailspamprotection.com;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260925_121403_628211_141814BE 
X-CRM114-Status: GOOD (  53.45  )
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

On Thu, Sep 24, 2026 at 09:49:08AM -0600, Mathieu Poirier wrote:
> On Wed, 23 Sept 2026 at 12:42, Francesco Valla <francesco@valla.it> wrote:
> >
> > On Wed, Sep 23, 2026 at 09:48:58AM -0600, Mathieu Poirier wrote:
> > > On Tue, Sep 22, 2026 at 10:19:48PM +0200, Francesco Valla wrote:
> > > > On Tue, Sep 22, 2026 at 09:43:52AM -0600, Mathieu Poirier wrote:
> > > > > On Wed, Sep 16, 2026 at 11:10:57PM +0200, Francesco Valla wrote:
> > > > > > Add rings for multiple vdevs, as well as the required virtio nodes for
> > > > > > I2C, SPI and GPIO functionalities. On top of that, add example
> > > > > > peripherals using all of them.
> > > > > >
> > > > > > NOTE: this is a Proof-Of-Concept, not meant to be integrated!
> > > > > >
> > > > > > Signed-off-by: Francesco Valla <francesco@valla.it>
> > > > > > ---
> > > > > >  arch/arm64/boot/dts/freescale/imx93-11x11-frdm.dts | 128 +++++++++++++++++++--
> > > > > >  1 file changed, 119 insertions(+), 9 deletions(-)
> > > > > >
> > > > > > diff --git a/arch/arm64/boot/dts/freescale/imx93-11x11-frdm.dts b/arch/arm64/boot/dts/freescale/imx93-11x11-frdm.dts
> > > > > > index bd14ba28690c..dfa3b122ac5f 100644
> > > > > > --- a/arch/arm64/boot/dts/freescale/imx93-11x11-frdm.dts
> > > > > > +++ b/arch/arm64/boot/dts/freescale/imx93-11x11-frdm.dts
> > > > > > @@ -53,6 +53,32 @@ button-k3 {
> > > > > >                 };
> > > > > >         };
> > > > > >
> > > > > > +       gpio-keys-virtio {
> > > > > > +               compatible = "gpio-keys-polled";
> > > > > > +               poll-interval = <100>;
> > > > > > +
> > > > > > +               button-v1 {
> > > > > > +                       label = "Button V1";
> > > > > > +                       linux,code = <BTN_3>;
> > > > > > +                       gpios = <&v_gpio 23 GPIO_ACTIVE_LOW>;
> > > > > > +               };
> > > > > > +
> > > > > > +               button-v2 {
> > > > > > +                       label = "Button V2";
> > > > > > +                       linux,code = <BTN_4>;
> > > > > > +                       gpios = <&v_gpio 24 GPIO_ACTIVE_LOW>;
> > > > > > +               };
> > > > > > +       };
> > > > > > +
> > > > > > +       leds {
> > > > > > +               compatible = "gpio-leds";
> > > > > > +
> > > > > > +               led {
> > > > > > +                       gpios = <&v_gpio 18 GPIO_ACTIVE_HIGH>;
> > > > > > +                       label = "LED V";
> > > > > > +               };
> > > > > > +       };
> > > > > > +
> > > > > >         reg_usdhc2_vmmc: regulator-usdhc2 {
> > > > > >                 compatible = "regulator-fixed";
> > > > > >                 off-on-delay-us = <12000>;
> > > > > > @@ -89,11 +115,6 @@ linux,cma {
> > > > > >                         linux,cma-default;
> > > > > >                 };
> > > > > >
> > > > > > -               rsc_table: rsc-table@2021e000 {
> > > > > > -                       reg = <0 0x2021e000 0 0x1000>;
> > > > > > -                       no-map;
> > > > > > -               };
> > > > > > -
> > > > >
> > > > > Why is the resource table removed?  There is no mention of that in the
> > > > > changelog...
> > > > >
> > > >
> > > > You are obviously right, the commit message here should have been a
> > > > poem, not a form of hermetic poetry. My bad.
> > > >
> > > > The resource table here is causing problems with how Zephyr is managing
> > > > it at its side. If it is kept in a separate memory location and copied
> > > > there at runtime by the remote processor firmware during its startup
> > > > (which is the current Zephyr behavior), then there might be a race
> > > > condition when the aforesaid firmware is loaded and started by Linux
> > > > *and* at least one of the vdev drivers (here including rpmsg_bus) is
> > > > built-in. In this case, the copy of the resource table done by the
> > > > remote processor might - depending on the async execution of the two
> > > > processors - overwrite the status bit set by the Linux driver:
> > > >
> > > >   Firmware load and startup (echo start > /sys/.../state)
> > > >                            |
> > > >                        |
> > > >                        V
> > > >   The vdev devices get registered (by register_virtio_device())
> > > >                            |
> > > >                        |
> > > >                        V
> > > >   If a driver is built-in, it probes and sets the vdev status
> > > >   inside the resource table @rsc-table.
> > > >                            .
> > > >                        . (in the mean time)
> > > >                        .
> > > >   The remote processor starts up and copies the resource table from its
> > > >   dedicated section to @rsc-table.
> > > >
> > > > Depending on the system load and the complexity of the firmware, the two
> > > > operations can happen in whatever sequence, causing a race condition.
> > >
> > > This would happen regardless of this patchset.
> > >
> >
> > Correct, *if* the remote processor is copying the resource table to a
> > specific location and expects the host to use that. On Zephyr (which is
> > clearly outside the scope here) this can be enabled through the
> > CONFIG_OPENAMP_COPY_RSC_TABLE option. I am keeping that disabled, and
> > removing the rsc-table node here.
> >
> > I am planning to reason on this and propose a proper fix in a separate
> > patchset.
> >
> 
> It seems like we need two solutions here, one for imx and another
> applicable to everyone.
>
> > > >
> > > > This is somewhat masked if vdev drivers are built as modules, as the
> > > > devices does not probe immediately but only after the modules have been
> > > > loaded, giving the remote processor time to start. Note that this is not
> > > > a solution! but a workaround.
> > > >
> > > > If the rsc-table node is not there, the startup logic falls back to the
> > > > classic rproc_elf_find_loaded_rsc_table().
> > >
> > > We can't remove @rsc-table to make a problem go away.
> > >
> >
> > I need to re-take a look at the NXP SDK to understand what's the real
> > purpose of having the rsc-table here. Judging from the commit message
> > that introduced support for such facility [1], it seems the SDK is not
> > really using it.
> >
> > Maybe someone from NXP can comment on this?
> >
> > > >
> > > > This is specific to i.MX platforms [1] and is probably not normally an
> > > > issue because - as stated in [1] - the offical SDK from NXP seems not
> > > > to check the status inside the resource table.
> > > >
> > > > > >                 vdev0vring0: vdev0vring0@a4000000 {
> > > > > >                         reg = <0 0xa4000000 0 0x8000>;
> > > > > >                         no-map;
> > > > > > @@ -105,12 +126,42 @@ vdev0vring1: vdev0vring1@a4008000 {
> > > > > >                 };
> > > > > >
> > > > > >                 vdev1vring0: vdev1vring0@a4010000 {
> > > > > > -                       reg = <0 0xa4010000 0 0x8000>;
> > > > > > +                       reg = <0 0xa4010000 0 0x1000>;
> > > > > > +                       no-map;
> > > > > > +               };
> > > > > > +
> > > > > > +               vdev2vring0: vdev2vring0@a4011000 {
> > > > > > +                       reg = <0 0xa4011000 0 0x2000>;
> > > > > > +                       no-map;
> > > > > > +               };
> > > > > > +
> > > > > > +               vdev2vring1: vdev2vring1@a4013000 {
> > > > > > +                       reg = <0 0xa4013000 0 0x2000>;
> > > > > > +                       no-map;
> > > > > > +               };
> > > > > > +
> > > > > > +               vdev3vring0: vdev3vring0@a4015000 {
> > > > > > +                       reg = <0 0xa4015000 0 0x2000>;
> > > > > > +                       no-map;
> > > > > > +               };
> > > > > > +
> > > > > > +               vdev4vring0: vdev4vring0@a4017000 {
> > > > > > +                       reg = <0 0xa4017000 0 0x4000>;
> > > > > > +                       no-map;
> > > > > > +               };
> > > > > > +
> > > > > > +               vdev5vring0: vdev5vring0@a401B000 {
> > > > > > +                       reg = <0 0xa401B000 0 0x2000>;
> > > > > > +                       no-map;
> > > > > > +               };
> > > > > > +
> > > > > > +               vdev5vring1: vdev5vring1@a401D000 {
> > > > > > +                       reg = <0 0xa401D000 0 0x2000>;
> > > > > >                         no-map;
> > > > > >                 };
> > > > > >
> > > > > > -               vdev1vring1: vdev1vring1@a4018000 {
> > > > > > -                       reg = <0 0xa4018000 0 0x8000>;
> > > > > > +               vdev5vring2: vdev5vring2@a401F000 {
> > > > > > +                       reg = <0 0xa401F000 0 0x1000>;
> > > > > >                         no-map;
> > > > > >                 };
> > > > > >
> > > > > > @@ -149,8 +200,67 @@ &cm33 {
> > > > > >                  <&mu1 3 1>;
> > > > > >         mbox-names = "tx", "rx", "rxdb";
> > > > > >         memory-region = <&vdevbuffer>, <&vdev0vring0>, <&vdev0vring1>,
> > > > > > -                       <&vdev1vring0>, <&vdev1vring1>, <&rsc_table>;
> > > > > > +                       <&vdev1vring0>, <&vdev2vring0>, <&vdev2vring1>,
> > > > > > +                       <&vdev3vring0>, <&vdev4vring0>,
> > > > > > +                       <&vdev5vring0>, <&vdev5vring1>, <&vdev5vring2>;
> > > > >
> > > > > Who is using vdev5 vrings?
> > > > >
> > > >
> > > > Another thing that should have been in the commit message. Vdevs are
> > > > defined, in the Zephyr application I am using as PoC, as follows:
> > > >
> > > >  - vdev0: RPMSG (tx and rx vrings)
> > >
> > > To be backward compatible, there has to be a way to make vdev0 defaulting to
> > > RPMSG.  It would also be nice if bindings were define for RPMSG so that it can
> > > show up in the list of remoteproc-virtio devices like i2c, gpio and others.
> > >
> >
> > What vdev type is inside vdev0 is up to the resource table (i.e., to the
> > firmware running on the remote processor), not the remoteproc-virtio
> > framework.
> >
> 
> We are of the same opinion.  Up to now vdev0 was automatically
> assigned to RPMSG but with this new feature, it can be anywhere in the
> list.  I see your point about RPMSG not requiring hardware
> description.
> 
> > Defining bindings for rpmsg would today be... pointless? Since no
> > hardware needs to be described for it. The same goes for virtio-can and
> > virtio-entropy.
> >
> 
> Just to make sure we understand each other, there are entries in the
> resource table for virtio-can and virtio-entropy.  Please confirm.
>

This is correct. You can take a look at the resource table used for this
Poc in [1]; basically it is defined as:

struct fw_resource_table {
    struct resource_table hdr;
    uint32_t offset[RSC_TABLE_NUM_ENTRIES];

    DECL_RSC_TABLE_VDEV(rpmsg, 2);
    DECL_RSC_TABLE_VDEV(entropy, 1);
    DECL_RSC_TABLE_VDEV_CONFIG(gpio, 2, struct virtio_gpio_config);
    DECL_RSC_TABLE_VDEV(i2c, 1);
    DECL_RSC_TABLE_VDEV_CONFIG(spi, 1, struct virtio_spi_config);
    DECL_RSC_TABLE_VDEV_CONFIG(can, 3, struct virtio_can_config);
};

where:

DECL_RSC_TABLE_VDEV(<vdev-type>, <num-of-vrings>[, <config space>])

> > >
> > > >  - vdev1: entropy (single request vring)
> > > >  - vdev2: GPIO (request and event vrings)
> > > >  - vdev3: I2C (single request vring)
> > > >  - vdev4: SPI (single request vring)
> > > >  - vdev5: CAN (tx, rx and control vrings)
> > > >
> > > > vdev5 is not represented inside the devicetree because the can-virtio
> > > > driver registers a single CAN network device and has thus no need for
> > > > such representation.
> > >
> > > Then why is it part of the remoteproc's memory-regions?
> > >
> >
> > Because a vring description needs to be present for it, or the
> > remoteproc-virtio won't be able to fill the entry inside the resource
> > table.
> >
> > > >
> > > > > >         status = "okay";
> > > > > > +
> > > > > > +       virtio {
> > > > > > +               #address-cells = <1>;
> > > > > > +               #size-cells = <0>;
> > > > > > +
> > > > > > +               vdev@2 {
> > > > > > +                       reg = <2>;
> > > > > > +
> > > > > > +                       v_gpio: gpio {
> > > > > > +                               compatible = "virtio,device29";
> > > > > > +                               gpio-controller;
> > > > > > +                               #gpio-cells = <2>;
> > > > > > +                               interrupt-controller;
> > > > > > +                               #interrupt-cells = <2>;
> > > > > > +                       };
> > > > > > +               };
> > > > > > +
> > > > > > +               vdev@3 {
> > > > > > +                       reg = <3>;
> > > > > > +
> > > > > > +                       i2c {
> > > > > > +                               compatible = "virtio,device22";
> > > > > > +                               #address-cells = <1>;
> > > > > > +                               #size-cells = <0>;
> > > > > > +
> > > > > > +                               eeprom@50 {
> > > > > > +                                       compatible = "atmel,24c1025";
> > > > > > +                                       reg = <0x50>;
> > > > > > +                               };
> > > > > > +                       };
> > > > > > +               };
> > > > > > +
> > > > > > +               vdev@4 {
> > > > > > +                       reg = <4>;
> > > > > > +
> > > > > > +                       spi {
> > > > > > +                               compatible = "virtio,device2d";
> > > > > > +                               #address-cells = <1>;
> > > > > > +                               #size-cells = <0>;
> > > > > > +
> > > > > > +                               sram@0 {
> > > > > > +                                       compatible = "microchip,mchp23k256";
> > > > > > +                                       reg = <0>;
> > > > > > +                                       spi-max-frequency = <20000000>;
> > > > > > +                               };
> > > > > > +
> > > > > > +                               lcd@1 {
> > > > > > +                                       compatible = "adafruit,yx240qv29", "ilitek,ili9341";
> > > > > > +                                       reg = <1>;
> > > > > > +                                       spi-max-frequency = <10000000>;
> > > > > > +                                       dc-gpios = <&v_gpio 21 GPIO_ACTIVE_HIGH>;
> > > > > > +                                       reset-gpios = <&v_gpio 20 GPIO_ACTIVE_HIGH>;
> > > > > > +                                       rotation = <90>;
> > > > > > +                               };
> > > > > > +                       };
> > > > > > +               };
> > > > > > +       };
> > > > > >  };
> > > > > >
> > > > > >  &eqos {
> > > > > >
> > > > > > --
> > > > > > 2.55.0
> > > > > >
> > > >
> > > > Thank you!
> > > >
> > > > Regards,
> > > > Francesco
> > > >
> > > >
> >
> > Thank you for the discussion - is helping in defining further
> > requirements and constraints.
> >
> 
> Well, I certainly appreciate that you are willing to have a discussion.
> 

Regards,
Francesco

[1] https://github.com/WallaceIT/zephyr/blob/multi_vdev/samples/subsys/ipc/multi_vdev/src/resource_table.c#L88

