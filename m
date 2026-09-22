Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82065C982F1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 06:30:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5TziHwaXDLNZErCA1Nv3YhRq2q9+6p4PN2Do0dxKr38=; b=gBNy4rX2Ajdo3deIQR93L5MZLf
	ZtQEzzBQpDSSDBNNz5cxf95md7lmhwd9/Yp9GI71czReu9LGFcmXnbmMp8A2cCb+BH2uEpE1f/6Ew
	nD/5SUivEYYM5q825t9Rq4BgxPLZuui1SvWYyAaRxJMeWvZQ2EbZGQlhQc2wEqPa7OTHQFM0M3dMU
	pXhbqOFaHHTtVPxMJW6hWeAiLPZti2oFBr5Q0lrS0DYkdjOqsTLZKsRLvnnhYmB8L3hdYx5cwlIIX
	0XZF7qcLJkTWn9GwpXr1WAHE2OGKsgRRrt5HEmZ1Aa6IRrDiyxmcV2EG/8S/Nfp04rSNll9mf+78D
	zsQIWtUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8u10-00000004LGi-2kp2;
	Tue, 22 Sep 2026 06:30:06 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8u0z-00000004LGB-0mUG
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 22 Sep 2026 06:30:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=5TziHwaXDLNZErCA1Nv3YhRq2q9+6p4PN2Do0dxKr38=; b=CQTUywESDy4RriK2fIMMAozkg2
	DLYmXuc+FMJZvcRmZr9d7cmFseh5bh7xUzrF6Nh8ZrtOWQ9SWmLZgBr/FjsDFxhljqR7Llxc8y+6j
	sgJOwdu+n2E1YyRlu6oRGSELByOMiGt+SI5NTdM6jeZ/fAojCWK26PoE4ZxdMNm4JoY8Cro8jgti7
	zGDBSEHHpFALlYOv0vz7GqHI4z1e32O9FKn3KWpv0E5wTxhBBdZsoFGXDd1SZ8SWLhOd+OZx/qTGe
	rXE+GmKUPeeMA51vFkI5e9dyOwp/o46OPaln06xIAROoho7O3HZqlp1t2hZGcg2h5kYdZYiwXKCCW
	BYYnYDuQ==;
Received: from delivery.antispam.mailspamprotection.com ([185.56.87.3])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x8u0l-0000000D9wI-2Ojk
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Sep 2026 06:30:00 +0000
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=outgoing.instance-europe-west4-f940.prod.antispam.mailspamprotection.com; s=arckey; t=1790058591;
	 b=Vrot1U70ZnOaJkn22R7CEdHRDGfW5KsiGYadVQN/NnzRHZ2vpjtlFX9HV+qQpuZAbeM/Heh1Ss
	  27/BKlHUx6tDbzFqoumPZRz7PwnSCeQQ1AOf8K+pxdZOxOLhbn+7+Ko9Z3nanP1SGn5p+QyVBu
	  CbOEIPJjpmnISNiaeT2VVQKwx8TdinQlk2Uu5UIYxRmpe1TnDdKRjkhNimnhclOBEPo/ZUWpI8
	  eo3Vkhw+RqZQefbjym1zq21SvzfjUBZP9P427IW/2A7pfuwk0Czwkqy+evH76MLokrnxggRhyL
	  sAQZIHVPEBhzIxmU3VoetAWALp255ccRIzaMlIrN7yTcwA==;
ARC-Authentication-Results: i=1; outgoing.instance-europe-west4-f940.prod.antispam.mailspamprotection.com; smtp.remote-ip=35.214.173.214;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed; d=outgoing.instance-europe-west4-f940.prod.antispam.mailspamprotection.com; s=arckey; t=1790058591;
	bh=0Y/NG4nMOalFGTSNp/BfF0N3WtHCZpwOLy9J6i30EqE=;
	h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:
	  From:Date:DKIM-Signature:DKIM-Signature;
	b=tJxzL7ocf+uf1sjz6fkwnCSBz+AqbcFAjqG+ia4MYz/YDKAqWVfoMMqsayVLyFk7amVn1hXfFQ
	  UhtH+HTezI8bzfZWGFsW5xdz5r4tX15emRXacuO1BiFLqI9oWzLgtf8X9uX2zyx/fv6W2Hgqjs
	  oyT6gxHKMIc/B+vYFI+0xzUbolntroq0WIS55P2ztyNy6VGDKXn/aqDOKyemlHBF5lsSlpfBMV
	  dhqKIkh3rd/U20W2JT9H3C9sHQUYJSBVkGUTHBSfXG3oH1/IqN08mguTLe7QbqqVhPKe3zSXNF
	  mFizEle1RZ9328Be+phGNwqPZKFoLJ9td0w5l3EFOqcdCg==;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=antispam.mailspamprotection.com; s=default; h=CFBL-Feedback-ID:CFBL-Address
	:Content-Type:MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	List-Unsubscribe:Content-Transfer-Encoding;
	bh=5TziHwaXDLNZErCA1Nv3YhRq2q9+6p4PN2Do0dxKr38=; b=km35Byi9DpxLmDJoY8WB6crPoF
	Wp2zJlH9dWa+5QMhWWbwefRNynu1XLZEbY1WQ3LYsEIrnvqvFln8f7Dac6d0RhtWMR8JyWHff2157
	FWTO/O9ASnQ/jPbhYlS0BApqdDwhimU+LOM0lewSv+a5mJFDt+WTilIk3M+Btsl1zsH8=;
Received: from 214.173.214.35.bc.googleusercontent.com ([35.214.173.214] helo=esm19.siteground.biz)
	by instance-europe-west4-f940.prod.antispam.mailspamprotection.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.5)
	(envelope-from <francesco@valla.it>)
	id 1x8u08-0000000G7l4-3kJg
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Sep 2026 06:29:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=valla.it;
	s=default; h=Subject:Cc:To:From:Date:list-help:list-unsubscribe:
	list-subscribe:list-post:list-owner:list-archive;
	bh=5TziHwaXDLNZErCA1Nv3YhRq2q9+6p4PN2Do0dxKr38=; b=T5UqOveDeSk52U3za0f9ytME7m
	zSVTX1ALLKtdubMCZNXtEZz3wf/27Dn9KwpzimGgCV3BJ9XriUrJYEKbSc+CYOb6rZxWE4+/+xnTL
	Vlfj3qwDvFZqXE45GDc0jKkhkeLenT+u4HxOrUuAXVusycaW9qvA1txxbpcC7QJPHlAM=;
Received: from [79.43.46.244] (port=63244 helo=bywater)
	by esm19.siteground.biz with essmtpa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.5)
	(envelope-from <francesco@valla.it>)
	id 1x8tzG-00000000GBl-2f8i;
	Tue, 22 Sep 2026 06:28:18 +0000
Date: Tue, 22 Sep 2026 08:28:16 +0200
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
Subject: Re: [PATCH RFC 00/12] remoteproc: add support for any virtio device
Message-ID: <arIfj-1Ji6HEBHLJ@bywater>
References: <20260916-remoteproc_virtio_map-v1-0-dac8c5eb4aa9@valla.it>
 <aq1sooGCYUiWbhMH@p14s>
 <aq453yukMHiNb1jp@bywater>
 <CANLsYkySF+eF-FURnnT6UJv7P5Sg2HdfMSBZnZy_BLyCMvuofw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANLsYkySF+eF-FURnnT6UJv7P5Sg2HdfMSBZnZy_BLyCMvuofw@mail.gmail.com>
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - esm19.siteground.biz
X-AntiAbuse: Original Domain - lists.infradead.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - valla.it
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-SGantispam-id: ae99b43f2537b67729474c70d40173c8
X-AntiAbuse: ID - ae99b43f2537b67729474c70d40173c8
AntiSpam-DLS: false
AntiSpam-DLSP: 
AntiSpam-DLSRS: 
AntiSpam-TS: 1.0
CFBL-Address: feedback@antispam.mailspamprotection.com; report=arf
CFBL-Feedback-ID: 1x8u08-0000000G7l4-3kJg-feedback@antispam.mailspamprotection.com
Authentication-Results: outgoing.instance-europe-west4-f940.prod.antispam.mailspamprotection.com;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260922_072958_666692_E31C1398 
X-CRM114-Status: GOOD (  13.87  )
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

On Sun, Sep 20, 2026 at 09:31:11PM -0600, Mathieu Poirier wrote:
> On Sat, 19 Sept 2026 at 01:33, Francesco Valla <francesco@valla.it> wrote:
> >
> > Hi Mathieu,
> >
> > On Fri, Sep 18, 2026 at 10:53:54AM -0600, Mathieu Poirier wrote:
> > > Hi Francesco,
> > >
> > > I have started reviewing this set but given the size and implications, it will
> > > take me a few days to get through.
> >
> > I'm going through the review done by sashiko - would you prefer me
> > sending a v2 with the trivial errors already ironed out before doing
> > a complete review?
> >
> 
> We can wait if the errors are trivial.
> 

Not all of them are. I have been a bit to naive about the bounce buffer
management w.r.t. what can happen if a memory area is not specified and
I will need to rethink/rework that part.

Regrads,
Francesco


