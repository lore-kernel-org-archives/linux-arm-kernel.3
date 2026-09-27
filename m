Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E77F9C98338
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 27 Sep 2026 22:13:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9LWHPNFgWOuxhAUuO+Xov6euQfWdO2vKk+2zNuLyRVI=; b=4TmgBWn3Gp8m+tuAdGiKtefFKU
	UjdjTyHdcPj1DSZxuMBWG+eC1uRd4TtlzsGN2CtBk6Qzw0BW+wecaqS2Ettryd6CPKZQL6J321F4V
	Ldc9BvvR7Zpv4iCAzGM5vmO2+DOo1H7nIKw8TiAle0kkZ4U1bEK96tN3pWKueHRLmcsCBe8ycMQgE
	4xhs0gnZIEgI8dai8ZKPuR2oxweIMGrpN6st2ZyI9BNjxClNj9/qnqfjcw3pqrvJA6OI19zvMH2sL
	nGcO+Z+IK/tnYzzyzj1D9WboFwhlJ7VA74ntV6radKtl4hZgqyWqwQVdJOlncYGdRJHtmf+STeLbP
	TFSWgz6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAx7f-0000000GvMj-2tfI;
	Sun, 27 Sep 2026 22:13:27 +0000
Received: from delivery.antispam.mailspamprotection.com ([185.56.87.10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAx7c-0000000GvMH-0zpz
	for linux-arm-kernel@lists.infradead.org;
	Sun, 27 Sep 2026 22:13:26 +0000
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=outgoing.instance-europe-west4-fjbh.prod.antispam.mailspamprotection.com; s=arckey; t=1790547204;
	 b=In3ayDtuBRF8P9SsBqfh3oXGgqq9hzWMzizayUExn7sBtokmsyUloyJX2NxRQUvS4QUFY29FNr
	  7pSQjrCTXfsHUaObZ9V45yq7WL16LEJiaZhV12ers0UNGgd+CEOdrIBSOKJ00vwF0Qsg13++TY
	  8+FTy1fMmPj8dBVqKx/xhfKOVkp3CEjdHrUqRg2E+v5k9Y6LtqafE9F9hNnZQ6ZIFtXxNLAOdz
	  aN+dNrcZCxjMEu/Zc6IKEyBtR4pwb4ypQm6U9oZeRS0Mfpurb0tUDICnwWw/bM6K0vdEZvyBse
	  p2DNlUhBPVq5N9JPqqQdGZMtw+ioDQcBa9C9/vM1l5tFbA==;
ARC-Authentication-Results: i=1; outgoing.instance-europe-west4-fjbh.prod.antispam.mailspamprotection.com; smtp.remote-ip=35.214.173.214;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed; d=outgoing.instance-europe-west4-fjbh.prod.antispam.mailspamprotection.com; s=arckey; t=1790547204;
	bh=g3a6aFez5u5R7XhphSxDPGFXrJlVJwrOjK3Tk7gWDUU=;
	h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:
	  From:Date:DKIM-Signature:DKIM-Signature;
	b=AhFS/v5DW3LS15xIjLZPvmgtOnBsfLN5h6Z36MmT8lGVacXClbk4CA08GVWaz1d1DgkE3Zg4Ku
	  qj4LUVAQweLepNVJIOT5Mg8quDzvQx+hvwJgEcWBbV3SU9S/WWhH7D8jcI2+T+q56k+ciLtVbY
	  JRE5QFhUpCK/wN/1gIXAPsCtulbMnIb0oYwxDdaUX+PR3EC+yohMKy2PMSvQ0FuPi+uHT0xrsx
	  Zfj3rSIPyAw+jfA9yitdounCmzb124V8e4h9r9Jij9sTz1lMJ9pZT+uqqEIYYXXJ08B0E4NrjV
	  Ud8fVtrlKbxHmSn1D4/DUafvw8s6+pbrK+gcOpvdlbalfw==;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=antispam.mailspamprotection.com; s=default; h=CFBL-Feedback-ID:CFBL-Address
	:Content-Type:MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	List-Unsubscribe:Content-Transfer-Encoding;
	bh=9LWHPNFgWOuxhAUuO+Xov6euQfWdO2vKk+2zNuLyRVI=; b=cAwd/5uKt2pJPM2FGG5hv2uCYB
	5OkqN7jSMKLSGTi9KdZfgQvsswo7kDCuT3m7BlUXlW8/m6cpLWvhs41cDSW11nS+GCrN+2+41w4Co
	6/zdQUSqhSCyE0/sV+36s8FLI3olezQAeVieSQgL3UVIM7DfiEYcFBaVt07TvQsFvScA=;
Received: from 214.173.214.35.bc.googleusercontent.com ([35.214.173.214] helo=esm19.siteground.biz)
	by instance-europe-west4-fjbh.prod.antispam.mailspamprotection.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <francesco@valla.it>)
	id 1xAx7T-00000002wUV-0GH9
	for linux-arm-kernel@lists.infradead.org;
	Sun, 27 Sep 2026 22:13:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=valla.it;
	s=default; h=Subject:Cc:To:From:Date:list-help:list-unsubscribe:
	list-subscribe:list-post:list-owner:list-archive;
	bh=9LWHPNFgWOuxhAUuO+Xov6euQfWdO2vKk+2zNuLyRVI=; b=FL5/baBM4QfixLkgL9NSA6Gyy2
	e1NYko/DLCVpo5o5+Rbfp/9900ufixVb3f8AGPtX/OPhC9dncfOIpVHwSCZvGdZ3rM3UMtZddQ9Ur
	oz9rBVaIxeWlXzNCpvxp9IpKiOI6hQ/Hx6U4NFNTSbJo/G5AYMKSunvdUnfPaJPR9taY=;
Received: from [79.45.60.29] (port=64303 helo=bywater)
	by esm19.siteground.biz with essmtpa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <francesco@valla.it>)
	id 1xAx72-000000002xa-3Ygs;
	Sun, 27 Sep 2026 22:12:48 +0000
Date: Mon, 28 Sep 2026 00:12:46 +0200
From: Francesco Valla <francesco@valla.it>
To: Robin Murphy <robin.murphy@arm.com>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>, 
	Bjorn Andersson <andersson@kernel.org>, Kees Cook <kees@kernel.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, Marek Szyprowski <m.szyprowski@samsung.com>, 
	Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Peng Fan <peng.fan@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
	linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	virtualization@lists.linux.dev, imx@lists.linux.dev, iommu@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH RFC 06/12] remoteproc: virtio: add bounce buffering for
 data buffers
Message-ID: <armUKG0TYwHkpG56@bywater>
References: <20260916-remoteproc_virtio_map-v1-0-dac8c5eb4aa9@valla.it>
 <20260916-remoteproc_virtio_map-v1-6-dac8c5eb4aa9@valla.it>
 <arKlvZGqu2nt6Ci0@p14s>
 <arLXthhYbKkwZ9zY@bywater>
 <CANLsYkwNOukGX68=NVvwNP7iudP3EcKN6C2L2o9nVCTRxFVxFg@mail.gmail.com>
 <arP38OEaabFFu8lJ@bywater>
 <araOI_duKIAbphq6@p14s>
 <1b55f680-2413-4db1-b928-ed5741696d07@arm.com>
 <arbEmz1jy0V7gjrU@bywater>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <arbEmz1jy0V7gjrU@bywater>
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - esm19.siteground.biz
X-AntiAbuse: Original Domain - lists.infradead.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - valla.it
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-SGantispam-id: 3b70a69c063497a85c8f92c570d0775c
X-AntiAbuse: ID - 3b70a69c063497a85c8f92c570d0775c
AntiSpam-DLS: false
AntiSpam-DLSP: 
AntiSpam-DLSRS: 
AntiSpam-TS: 1.0
CFBL-Address: feedback@antispam.mailspamprotection.com; report=arf
CFBL-Feedback-ID: 1xAx7T-00000002wUV-0GH9-feedback@antispam.mailspamprotection.com
Authentication-Results: outgoing.instance-europe-west4-fjbh.prod.antispam.mailspamprotection.com;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260927_151324_616713_510CC4B9 
X-CRM114-Status: GOOD (  53.08  )
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

On Fri, Sep 25, 2026 at 09:05:43PM +0200, Francesco Valla wrote:
> Hi Robin, Mathieu,
> 
> On Fri, Sep 25, 2026 at 05:48:25PM +0100, Robin Murphy wrote:
> > On 25/09/2026 4:07 pm, Mathieu Poirier wrote:
> > > On Wed, Sep 23, 2026 at 06:05:35PM +0200, Francesco Valla wrote:
> > > > On Wed, Sep 23, 2026 at 08:44:41AM -0600, Mathieu Poirier wrote:
> > > > > On Tue, 22 Sept 2026 at 13:39, Francesco Valla <francesco@valla.it> wrote:
> > > > > > 
> > > > > > On Tue, Sep 22, 2026 at 09:58:53AM -0600, Mathieu Poirier wrote:
> > > > > > > On Wed, Sep 16, 2026 at 11:10:51PM +0200, Francesco Valla wrote:
> > > > > > > > Depending on the driver originating them, data buffers used for virtio
> > > > > > > > communication can either:
> > > > > > > > 
> > > > > > > >    - already be allocated from the coherent memory area that is
> > > > > > > >      accessible by the remote processor; this is the case of rpmsg
> > > > > > > >      and the rproc flavor of virtio-console;
> > > > > > > >    - be allocated from generic kmem, and thus not accessible directly by
> > > > > > > >      the remote processor.
> > > > > > > > 
> > > > > > > > Exploiting the map operations, which are used by the virtio framework
> > > > > > > > when VIRTIO_F_ACCESS_PLATFORM is part of a vdev's feature flags, add
> > > > > > > > bounce buffering for the second case: when the map() callback is called
> > > > > > > > for a buffer, one or more pages of coherent memory are allocated and
> > > > > > > > data is copied to them, then they are exposed to the remote processor;
> > > > > > > > the data is  then bounced back on unmap().
> > > > > > > > 
> > > > > > > > The first case is not impacted, since buffers already suitable for
> > > > > > > > remote transmission are passed through.
> > > > > > > > 
> > > > > > > > With the bounce buffering in place, any kind of virtio device can be
> > > > > > > > supported through the remoteproc-virtio transport, at least from a
> > > > > > > > data exchange standpoint.
> > > > > > > 
> > > > > > > Is this _necessary_ for the imx93 platform you are implementing feature for?
> > > > > > > 
> > > > > > 
> > > > > > If I don't want to fundamentally change how the remoteproc integration
> > > > > > works (i.e.: using buffers only from a pre-shared area), yes. While in
> > > > > > my test environment the Cortex-M33 serving as remoteproc is able to
> > > > > > access the whole RAM space, that is not always the case.
> > > > > 
> > > > > The first sentence tells me it is mandatory while the second says it
> > > > > is not.  I understand the use case but don't want to bloat the
> > > > > subsystem with code that is trying to address a problem you currently
> > > > > don't have.
> > > > > 
> > > > 
> > > > Let me rephrase: while on i.MX93 the Cortex-M33 can theoretically access
> > > > the whole RAM space, that is not a good idea from a security point of
> > > > view and can be the source of a number of bugs. The target is to
> > > > statically define a static shared memory area (as I am doing on i.MX95)
> > > > and only use that.
> > > 
> > > As Robin pointed out, have you looked at using a restricted-dma-pool for that?
> > > Note that I am not familiar with the concept but open to go that way if it can
> > > work for us.
> > > 
> > > Robin, can you point us to a simple example we could look at?
> > The only in-tree example is mt8192-asurada.dtsi, but even there the
> > fundamental principle seems exactly the same - the system interconnect is
> > locked down such that there's only a particular region of "shared" memory
> > that PCIe DMA can access, so the restricted pool is placed there, and in
> > that case can occupy the entire region since the wifi adapter only really
> > does streaming DMA - restricted pools have some limited ability to act as a
> > fallback for coherent allocations, which won't work for everything, but does
> > happen to be enough for that wifi driver.
> > 
> > Here it would be a case of reserving some of the shared region for a
> > restricted pool alongside the "vdevbuffer" coherent pool, adding it to the
> > memory-region list of the relevant device(s), and usually that would then
> > just work, since the setup is all done automatically by the core DT code.
> > However I know remoteproc does some funky stuff with child devices, so it's
> > quite possible there might need to be something more done there. But still
> > far, far less than reimplementing a whole other bounce-buffering system.
> > 
> > Thanks,
> > Robin.
> 
> I took a look at the restricted-memory-pool - with which I wasn't
> familiar - and seems exactly what is needed here.
> 
> I am working on a new prototype with it - if everything works as
> expected (I still did not have time to try it) it should only need some
> very limited glue code, cutting the modifications in the
> remoteproc_virtio driver by 95%. I'll let you knwow.
>

Quick update: it works, with minimal glue code as expected. I am
preparing a v2 based on restricted-memory-pool, but it will take some
days, as I am addressing the other topics pointed out by Mathieu. I plan
to propose an update to the documentation too, since the setup is not so
straightforward.

Thank you again.

Regards,
Francesco


