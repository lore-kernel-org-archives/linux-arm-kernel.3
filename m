Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BF7CC9832F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Sep 2026 08:06:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZDcqyyxfoB2phhYAUptIB1AuIJCG0bYrwp8n7NiGAXU=; b=jYDx81a3TmSsjti2L+AbvccOre
	v/3RmIR5fCxcbdCgyalYI5B+UjLQQfeaZx9YhC22bdE6GD8PycppFi57xzGcGg/SE/hq4iGwrnYUP
	dHvn/bEge9BJhYbB9AflANVrr4LAsye8WXkdqbhj291HpspWkSnBG5kWgXme7/rK4CM6CAcH4XaoX
	reiHYhC3v3wQJnM6Zfpsy6NhNRsaTkUIimHrFOEWsojSyq9ppoloWgmdiB/+oIu8y3SSJF3zoTLuj
	KEuJspLz9MvD2qGtz0zZL/Cvn8hXEAJjgcd0AyqxL7aRDb38xdl0fgQaksZSIVkTX82IjK0dAzj6U
	r2c1Thsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xB6Nx-000000001I8-1jKS;
	Mon, 28 Sep 2026 08:06:53 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xB6Nv-000000001I1-13Ga
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Sep 2026 08:06:51 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id B174142E59;
	Mon, 28 Sep 2026 08:06:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91D4E1F000FF;
	Mon, 28 Sep 2026 08:06:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790582810;
	bh=ZDcqyyxfoB2phhYAUptIB1AuIJCG0bYrwp8n7NiGAXU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=GbeF3uiC7F68XfE+smZpoGDufvzhVa7da72pazv7dSObq+MyMa/CFM9SEZTkq61Y/
	 DP6tUYx5aG/foBSuSWxS8Z7pPrgPpAcM3OgIre54/R6EkRTL8Tkr5mQ7M6brcFVGOx
	 0kPl4mXUbDw2bRJ2kQ3M94BXTAEYQJIXwg2Nen7qkPH7TGiUT5uDaP9cOsS9zIyVdG
	 liN7Xpb6J5Z7nw8r6pOQ7LXlI/j3yHUmq0lajyeJfuPin0Ndt4MS5h6MsEPM/CBaH4
	 kPlwqMj1z1g1tOPxzTK9VuvSxyBqmtX3hA9oKDbNNeQTVHgue2UfYxRLVcuwTSRuLE
	 5+kKZ2GAhBjfA==
Date: Mon, 28 Sep 2026 10:06:47 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Alexandru Chimac <alex@chimac.ro>
Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>, 
	Peter Griffin <peter.griffin@linaro.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Tomasz Figa <tomasz.figa@gmail.com>, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: pinctrl: samsung: Require clocks for
 Exynos9610 pinctrl nodes
Message-ID: <20260928-dynamic-durable-rook-1be9bc@quoll>
References: <20260922-exynos9610-pinctrl-patch-v1-1-f6d816696591@chimac.ro>
 <d679c0e9-febe-4069-9c2f-a2173a5218aa@kernel.org>
 <1343593353.60484.1790180095661@app.mailbox.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1343593353.60484.1790180095661@app.mailbox.org>
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

On Wed, Sep 23, 2026 at 07:14:55PM +0300, Alexandru Chimac wrote:
> Hello!
> > On 09/23/2026 5:58 PM EEST Krzysztof Kozlowski <krzk@kernel.org> wrote:
> > 
> >  
> > On 22/09/2026 14:15, Alexandru Chimac wrote:
> > > All Exynos9610 pin controllers (except PINCTRL_TOP) have clocks assigned
> > > to them, so force the nodes to have clocks assigned to them.
> > > 
> > > Signed-off-by: Alexandru Chimac <alex@chimac.ro>
> > > ---
> > > Most Samsung Exynos9610 pin controllers (except TOP) have clocks
> > > designated for them, so allow the device tree node to include clock
> > 
> > I don't understand above. It's contradictory to commit msg which says
> > ALL. Here you say most.
> > 
> 
> On Exynos9610, only TOP pinctrl doesn't have a clock (as far as I'm
> aware; haven't found a clock for it), while the rest of the pin controller
> blocks do.

So how is it supposed to work if you require clock also for TOP pinctrl?

Best regards,
Krzysztof


