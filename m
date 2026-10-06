Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5167BCA5FF0
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Oct 2026 08:36:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XSUhnVHk1iSh8qKx6XqfspZ6CJLCO+HxlannG1zfNFU=; b=mPc94PXV6P1B6ft4wsF8KVcdip
	U0gVnJLTnhq2DguyjY+HvO3Kk/FoUFg8Ix9MOOe/jqIsMmF9y2YbQz7CBcY+FAoftbh/j7x5lT5AF
	SSxFetdN002YRMTRaLcdf+ltBCJl2uJTZnoRAZoGZYi7tcdCB/JfbCM6BJUXu7oOEH1UPmKe0qjBD
	ocTo4uxOQjlw94Spa9I2y3FOdW/XGxPxpPthHy0tuuIxM5YCbA4YBWKI82MW8b14mCPtwq++CuDb9
	LpLTI0C+lL23jNmm6vVCTa1tB2Z/7Sn/c2DuICgpBQ7DwsikvLwjvrjmsb6fCYk5+Fqis+S9DuEHg
	x/tE997w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xE0fC-00000000IWQ-1wjT;
	Tue, 06 Oct 2026 08:36:42 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xE0fB-00000000IWB-01pZ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 Oct 2026 08:36:41 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 162F160142;
	Tue,  6 Oct 2026 08:36:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4775E1F000FF;
	Tue,  6 Oct 2026 08:36:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791275799;
	bh=XSUhnVHk1iSh8qKx6XqfspZ6CJLCO+HxlannG1zfNFU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=KNFRm4WGU3Ljf6w+E9W3s7kv2V708TZBWJTJiba0MxZ+XoEJniZu+F0AOjz6kYHID
	 A1jEDnyVRrw1+aRIzJZCDawomCbi963czx3lXwNbYQ3iL3Tm1SyrU3vY2xLTe5TJxT
	 jAT0chqxYAIpi1f+fBR/xaQYuueazrZsIrx4dDCbW/VmT10H5WbCENtzMABhnhcmoG
	 FSvRTCppF+iWsfKCLokMT4c1BW9GqvTWB3CgitQzlebIySI6fuRmUeqKgJzOSHC27x
	 3uUBRY9bYACOYRv0wEYNbLp6yoGZVafSjFm8avAy+OQyM9rKUsmuunpaxQrV+4Q2eM
	 LHmJY3qB/bbmw==
Date: Tue, 6 Oct 2026 10:36:37 +0200
From: Vinod Koul <vkoul@kernel.org>
To: Hemanth Selam <hemanth.selam@gmail.com>
Cc: Frank Li <Frank.Li@kernel.org>, Frank Li <Frank.li@oss.nxp.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Michal Simek <michal.simek@amd.com>, dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] dmaengine: fix typos in comments
Message-ID: <asSzFW-ZJ16xhFnA@parshuram>
References: <20260907063343.22255-1-hemanth.selam@gmail.com>
 <asOtEhjOMXc9SVNP@parshuram>
 <20261006060202.45817-1-hemanth.selam@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261006060202.45817-1-hemanth.selam@gmail.com>
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

On 06-10-26, 11:32, Hemanth Selam wrote:
> On Mon, Oct 05, 2026 at 07:28:42PM +0530, Vinod Koul wrote:
> > This is bogus, pls drop these... If there are real typos pls fix those
> > instead! This is not a language book, it is code, upto should be just
> > fine!
> 
> Understood, dropping this one.
> 
> For what it is worth, one hunk in it was not an "upto" style change:
> drivers/dma/ppc4xx/xor.h has "contoller" where "controller" is meant.
> If you would still take that on its own I will send it as a separate
> one-line patch; otherwise I will leave it be.

Yes real typos are welcome. Pls split and send

-- 
~Vinod

