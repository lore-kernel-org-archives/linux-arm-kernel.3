Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 058B4C98321
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Sep 2026 19:26:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pe3VO7IOUXW8W+2mymQNpuRLjGNQ7piBXOGa6ZWGAGA=; b=SS6wanTmqWNqXd20nNpo3RvuP9
	DqiASqAqPeiOMk/QrQ9z+JN2evh/zUkSlHS2IlrpcXxuGFSLVskIAO3gzeO6amckC6tBbtEqP49Kx
	V7kHRC05rgPAd/c0fFaHN6aFD+ZdUevlaBPQkLDh6oQRY2TTmpdJ0MhODl0Zhn3pAgqDouQpr+anl
	binCO8tIhI6Zf9nY7zNMRf7TnsZlxwQg0sD4B79W5PDGTLJQvRCd5O9nT7m9nv94clyIRC93q4j7l
	t8FKEUOD17PmIHi8DDYPVfKEsPSEPmctuuOJAuU/ZgZhwalIoAuzkNkVoKXIiFXeZG8maw5rUJVxz
	MmfhzopQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xABZH-0000000EGDk-1skO;
	Fri, 25 Sep 2026 19:26:47 +0000
Received: from delivery.antispam.mailspamprotection.com ([185.56.87.1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xABZD-0000000EGDL-2oqK
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Sep 2026 19:26:45 +0000
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=outgoing.instance-europe-west4-kb8j.prod.antispam.mailspamprotection.com; s=arckey; t=1790364403;
	 b=BVbTvmeezDirlWwQxIKxQNJ72mda7lXfldfcfVIfTCgBKLcOjaxYtE/g+Ldr7UFpU9EW9cZAfm
	  sbquTPC7xC1xtBfqJPJbgT9+dXZM8F6thL2F2B1kyd21lOWPzjveOgn1sTPyM4y2X3gNLC5kGS
	  nO4HXgM8GRs+bIcM2Ye2r87pPOyGoNGuhzbfVJv3q6PH27jKtwGz1GdfwcAiRtVni24bU8Y4OX
	  p/yEiCWvY8t39L7o+WPWTtzBAtZs/nujUHFlcY97k0u9TdZl3M8+tkrSLQklPE/322fL6182Ej
	  1RvswPmlgJ+sDzaioM2mxxKP3+4Aay4eBpcwPjYbTbdPCA==;
ARC-Authentication-Results: i=1; outgoing.instance-europe-west4-kb8j.prod.antispam.mailspamprotection.com; smtp.remote-ip=35.214.173.214;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed; d=outgoing.instance-europe-west4-kb8j.prod.antispam.mailspamprotection.com; s=arckey; t=1790364403;
	bh=xgwXF789iMFU1tHJBCYfohzF1FMXCUeFcBdG42GdAwI=;
	h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:
	  From:Date:DKIM-Signature:DKIM-Signature;
	b=p3K8uhsj8tEc9NCZOUHmsVbjTqcBUP8RnQWq43GC0l0Sv6O5Lr/DERD6otgfT3WfQIzu+CPUFl
	  1xfWtj0dQcqTDFXd7Jhn2q8pO8idXu2mubv0jjjIArJqu0f+E0W5yJNYu0OahcoieopE+eGl6z
	  EayAmDCKaAeZaPyoUtZct+ovVRck6aqdxh33qtNJL6WhSFnRxj6/z/eQtyJrD6cMxnJwQ+xZ3w
	  Dteay2sujIBf+FJ+tCsu1EYDvva3qw8CeZdxFTSpLiYHapPk11YPv2vquzRP5enk5peVqU5lb0
	  iaSD28Ab16M10RUqHmwOb+csDMUb8/1cBZusUSgYNUSNYw==;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=antispam.mailspamprotection.com; s=default; h=CFBL-Feedback-ID:CFBL-Address
	:Content-Type:MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	List-Unsubscribe:Content-Transfer-Encoding;
	bh=pe3VO7IOUXW8W+2mymQNpuRLjGNQ7piBXOGa6ZWGAGA=; b=Mbe2HmhFetv7fzd+uxarPLDNE4
	Env/qnRzbzPMXV2tBIRPSM8AQx7xW5A05FRuc8EmWqTjKJ53Ns3ug/lWSSuzDdT9TqggRmRlITdQw
	lO8Mx40wmbpPH1TpWOISmUIQjus3SDAIuYLuKFZQvBHqWdYmbbdH3uNk4JeKol9+/um0=;
Received: from 214.173.214.35.bc.googleusercontent.com ([35.214.173.214] helo=esm19.siteground.biz)
	by instance-europe-west4-kb8j.prod.antispam.mailspamprotection.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <francesco@valla.it>)
	id 1xABZ9-00000004dWB-3qWp
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Sep 2026 19:26:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=valla.it;
	s=default; h=Subject:Cc:To:From:Date:list-help:list-unsubscribe:
	list-subscribe:list-post:list-owner:list-archive;
	bh=pe3VO7IOUXW8W+2mymQNpuRLjGNQ7piBXOGa6ZWGAGA=; b=TYJhyBN1lLzM3j+8pakSQMWVuQ
	t9mPBySmzyc3WNNnz8yxKZciuJ4xoz92WA8IDQ9Cf+qyAtkbvu2kdW9CFkJo1rvQUlA6QAnv+Os09
	A/+p5mE4ALa7sex5tsF+sHPQqVKAeFRcuB359Jqm8Xwur31oJ9WFh59QQVbTtu6FCDtM=;
Received: from [79.45.60.29] (port=62628 helo=bywater)
	by esm19.siteground.biz with essmtpa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <francesco@valla.it>)
	id 1xABYu-000000007dA-1S38;
	Fri, 25 Sep 2026 19:26:24 +0000
Date: Fri, 25 Sep 2026 21:26:22 +0200
From: Francesco Valla <francesco@valla.it>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Mathieu Poirier <mathieu.poirier@linaro.org>, Kees Cook <kees@kernel.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, Marek Szyprowski <m.szyprowski@samsung.com>, 
	Robin Murphy <robin.murphy@arm.com>, Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Peng Fan <peng.fan@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
	linux-arm-kernel@lists.infradead.org, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, virtualization@lists.linux.dev, imx@lists.linux.dev, 
	iommu@lists.linux.dev
Subject: Re: [PATCH RFC 12/12] PoC: arm64: dts: imx93-11x11-frdm: add
 multiple vdevs
Message-ID: <arbILwxDF9lZZtd7@bywater>
References: <20260916-remoteproc_virtio_map-v1-0-dac8c5eb4aa9@valla.it>
 <20260916-remoteproc_virtio_map-v1-12-dac8c5eb4aa9@valla.it>
 <3065678.e9J7NaK4W3@steina-w>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3065678.e9J7NaK4W3@steina-w>
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - esm19.siteground.biz
X-AntiAbuse: Original Domain - lists.infradead.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - valla.it
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-SGantispam-id: 850b3254dc796f511d915761fe269f08
X-AntiAbuse: ID - 850b3254dc796f511d915761fe269f08
AntiSpam-DLS: false
AntiSpam-DLSP: 
AntiSpam-DLSRS: 
AntiSpam-TS: 1.0
CFBL-Address: feedback@antispam.mailspamprotection.com; report=arf
CFBL-Feedback-ID: 1xABZ9-00000004dWB-3qWp-feedback@antispam.mailspamprotection.com
Authentication-Results: outgoing.instance-europe-west4-kb8j.prod.antispam.mailspamprotection.com;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260925_122643_775678_2258879F 
X-CRM114-Status: GOOD (  14.40  )
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

Hi Alexander,

On Fri, Sep 25, 2026 at 10:39:46AM +0200, Alexander Stein wrote:
> Am Mittwoch, 16. September 2026, 23:10:57 CEST schrieb Francesco Valla:
> > Add rings for multiple vdevs, as well as the required virtio nodes for
> > I2C, SPI and GPIO functionalities. On top of that, add example
> > peripherals using all of them.
> > 
> > NOTE: this is a Proof-Of-Concept, not meant to be integrated!
> > 
> > Signed-off-by: Francesco Valla <francesco@valla.it>
> 
> Just a general question, unrelated to virtio, but related to AMP: How do you
> manage the clocks, so that Linux doesn't disable clocks needed by the
> Cortex-M?
> 
> Best regards
> Alexander
>

Clock management for remote processors on i.MX93 (and other i.MX parts)
is... not really a management, AFAICT. If you want to use a remote
processor, the mcore_booted argument shall be specified in the kernel
cmdline; this forces the clock management driver to leave root clock
gates enabled for *everything*, leaving the possibility for the remote
processor to use anything it needs.

While out of scope for the current patchset, some work in this field
certainly is on my (long) TODO list.

Current implementation can be seen in [1] and [2].


Regards,
Francesco


[1] https://elixir.bootlin.com/linux/v7.2.7/source/drivers/clk/imx/clk-imx93.c
[2] https://elixir.bootlin.com/linux/v7.2.7/source/drivers/clk/imx/clk-composite-93.c#L83


