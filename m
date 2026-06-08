Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25B8CCD8C9F
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Jun 2026 12:13:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iWgAokzavpqmec2YiMNbooYltQWxuP9rTl2xaj0elE0=; b=G8BJYs7vZxEBV66d5SJ+sxgJaL
	tfR2UcVNOXsyiDIH/LjB1ir3/1w+ZV4cO8MWP4kNCfEdm+DaSFiWTmLCB57ZjAK96PN28uNkKZWuM
	Vr7knsvXqyYp66m89T6gez7axcjaPxkkI5gbksg9Vh3A/4jmcYjzQu0MqoN1nRHVqtPEeShk5bBFW
	XJqpk8oqooZJ1X2KZXnU7KmkC+zBIFHJTf57YbBTF/0ev4tLbs+3hCKREiYboEu5AGNS5vjP9WTKz
	4nYYaUWiZt/BKrr73AjUqHTrPqxSmJOQiEn1cy0csarCjY8o0Qt3L+3QhIEP1xnGwsiBUj+RHJ/Ky
	Ue/cLk+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWYr5-00000003Ujs-3pST;
	Mon, 08 Jun 2026 12:13:23 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWYr3-00000003UjB-3B7p
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Jun 2026 12:13:22 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 1DC39601F8;
	Mon,  8 Jun 2026 12:13:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 801BC1F00898;
	Mon,  8 Jun 2026 12:13:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780920800;
	bh=iWgAokzavpqmec2YiMNbooYltQWxuP9rTl2xaj0elE0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=i2vA+bbJCF0M2n8NGQLYN3xg9VyQn0rdOxE2W8826R8Ng50JVr2DZLLRBgxcXMoP/
	 IrlZBQ3lypF1mMFqL03DtvmUNxej7LwMN806zsAbF0OmS9AtDH1yPCawL0VGfLa0NB
	 gA7YjFphMuLhxkFNtYvLVoBH0uh2YaRv/mZ4crojhrRq4Ghz2CaFl033RnX3T1eccf
	 FfOVRgg39/aWA60fhtHml3Xa6ATosX2b7quYAacecXX3IkP1Kle92vv0yy2QA2CaGx
	 ZjgJBOegKs3Trd2qXWqnyMGydJj4ZE/8gyZXohf3b9yvlOxgyfwAHFt1vrffyg3SUI
	 n2qZA+zpwygYg==
From: Vinod Koul <vkoul@kernel.org>
To: Arnd Bergmann <arnd@arndb.de>, Vladimir Zapolskiy <vz@mleia.com>
Cc: linux-arm-kernel@lists.infradead.org, dmaengine@vger.kernel.org
In-Reply-To: <20260114051508.3908807-1-vz@mleia.com>
References: <20260114051508.3908807-1-vz@mleia.com>
Subject: Re: [PATCH] dma: iop32x-adma: Remove a leftover header file
Message-Id: <178092079913.96550.13876541717008221519.b4-ty@kernel.org>
Date: Mon, 08 Jun 2026 17:43:19 +0530
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0
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


On Wed, 14 Jan 2026 07:14:58 +0200, Vladimir Zapolskiy wrote:
> The Intel IOPx3xx platform was completely removed in commit b91a69d162aa
> ("ARM: iop32x: remove the platform"), and it'd be safe to remove an unused
> and leftover platform data specific header file dma-iop32x.h also.
> 
> 

Applied, thanks!

[1/1] dma: iop32x-adma: Remove a leftover header file
      commit: b2d44b3ea95e10315559d8deedd8af2977c7f534

Best regards,
-- 
~Vinod



