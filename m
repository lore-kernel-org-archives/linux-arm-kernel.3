Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1A75CA0FFD
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 Aug 2025 06:51:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wU/QIAhaEo3Iulb+u8GFoOZecLIWQhlNocvX0BK/fCw=; b=XVmo+Q2G0AtxKVRqWSgmhSE8mk
	r8jb9LNod+C1e9LLLNrP+jTpiJLfWP6UfZPJjFMqnwQL9OaoPJPFr8PQzES5uARhgt0ED6FwgqZ0J
	F9uQN6m+VxCIdLaEdc4G/4BzTe5/veiDL3WNimLLQyOvAtq5JnEj0w35mYq9Zh7ijUSL7x6R6CPWT
	hkxPpOkKFZiVHAGyf0rqqNz5ApP6gx60YsJ5ufP2YD7WXNKb/GB+T4vnoyafjXgq84ul4s25p2MAU
	GZ7//zqeaYKm4rp4T4v8Oy7TV7tQ0rGnfZ7UTQfrIGHH0jXuzUdMijk5dAkjFf531ewOgw8TU985/
	7GSp0jFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ursxQ-00000004gUr-1Uic;
	Fri, 29 Aug 2025 06:51:32 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ursui-00000004gCx-34fj;
	Fri, 29 Aug 2025 06:48:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id C1E4C60051;
	Fri, 29 Aug 2025 06:48:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7D00C4CEF0;
	Fri, 29 Aug 2025 06:48:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756450123;
	bh=J0rKrdxOhHWwS+mtwdjmhTwdm1+u+noFAQcTkYElpqs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UYKrrjM92oN1VUFRgvdGGp9Hu4bdSz74SMy/6aaX+JLVjwIjJG/EWB9yKZQhT+epD
	 rejPLq+1EPDIEPj9rPyYcq8uQBKHiKNuMXkgEY51lBcF7pQ0mpOdQP9gI/Ip5miQYX
	 5Yn2YQuyrHu3HousmJeHdXt5/BwZf2jd/Y90WeTO48FJWFB/lGj6oFKU7qqyhbUWS2
	 vk4THj86pu0EvVDvOijBv6JjxM+QcNsbh8XTLm+ZXX9kFS82d1Mx4WtXwQWLYAQ3Fd
	 MyYvEhh5PtNnRkoHuFxXph3MLihdStZDNWZt0hFaMdW1XmPKsuUXrQAhCuaZu7ovUz
	 d4W4OMzG3ZRtA==
Date: Fri, 29 Aug 2025 08:48:40 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Paul Chen <paul-pl.chen@mediatek.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	chunkuang.hu@kernel.org, angelogioacchino.delregno@collabora.com, matthias.bgg@gmail.com, 
	p.zabel@pengutronix.de, jason-jh.lin@mediatek.com, nancy.lin@mediatek.com, 
	singo.chang@mediatek.com, xiandong.wang@mediatek.com, sirius.wang@mediatek.com, 
	sunny.shen@mediatek.com, fshao@chromium.org, treapking@chromium.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH v4 03/19] dt-bindings: display: mediatek: add EXDMA yaml
 for MT8196
Message-ID: <20250829-industrious-economic-jacamar-ce264d@kuoka>
References: <20250828080855.3502514-1-paul-pl.chen@mediatek.com>
 <20250828080855.3502514-4-paul-pl.chen@mediatek.com>
 <20250829-solemn-herring-of-conversion-ec5b1a@kuoka>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250829-solemn-herring-of-conversion-ec5b1a@kuoka>
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

On Fri, Aug 29, 2025 at 08:35:23AM +0200, Krzysztof Kozlowski wrote:
> On Thu, Aug 28, 2025 at 04:06:58PM +0800, Paul Chen wrote:
> > From: Paul-pl Chen <paul-pl.chen@mediatek.com>
> > 
> > Add mediatek,exdma.yaml to support EXDMA for MT8196.
> > The MediaTek display overlap extended DMA engine, namely
> > OVL_EXDMA or EXDMA, primarily functions as a DMA engine
> > for reading data from DRAM with various DRAM footprints
> > and data formats.
> > 
> > Signed-off-by: Paul-pl Chen <paul-pl.chen@mediatek.com>
> > ---
> >  .../bindings/dma/mediatek,exdma.yaml          | 68 +++++++++++++++++++
> 
> 
> Your changelog says NOTHING changed here and this fails tests, so does it
> mean you received that warnings before but you keep sending same broken
> code?
> 
> Last two weeks of contributions from mediatek are absolutely terrible.
> Very poor code, basic in-house reviews not done, basic testing not done.
> 
> I talked about this at OSSE 25 with some friends and got reasons why
> your setup is broken. Well, it's on you.
> 
> I was already raising this with Mediatek, but we are now back to square
> one.
> 
> NAK, because this patch WAS NEVER tested.


And now I found you got EXACTLY the same error at v3, so you just never
tested and ignored OUR test reports.

This is unfortunately an example how you waste reviewers' time.

Best regards,
Krzysztof


