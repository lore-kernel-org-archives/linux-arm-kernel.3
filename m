Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 207ABC7115B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Jun 2025 19:41:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1n0A7Cohrwdj95mBKWSQ/I4GuAkFDd4os1m+iqeNsDs=; b=CCpkh+2xvqUjdaXLkc2hyMjpl0
	AL7Wraa+N90S6YoGg/sAqau5+bWOi8DkC/ciDehizrLGMt+rwlMRUgqpVZyPiC6ue1YMA0ajQs692
	kTKvaXbgaGoFj//oLSUIJY+OW8/FqwPHN5nRF1M9OoTlB/QdOqXImXKw9ao3imNI2YNIteBXeBbfS
	m+c+C0DaCLqV58xAx+Vtt9qR2sau6N9vuLhhk94mUHyob6VVRnzHPnJMmJa8K/7/xIjAOi7Vd+03R
	eKtXXWgJsP/IrkyYH/hLQh2QUYEQKkH7RTm8kun43kQVTS1SqKLcc6EwL8IaEJU8igHlQlOjiE+tj
	cNkevJfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRyfL-0000000BEe2-0OLn;
	Wed, 18 Jun 2025 19:41:47 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRxva-0000000B7Lf-1mtn
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Jun 2025 18:54:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 9301A61F1F;
	Wed, 18 Jun 2025 18:54:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D35AC4CEE7;
	Wed, 18 Jun 2025 18:54:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750272869;
	bh=QAiRtMLjN9yBvNArRlNZT/m5P2zBf7MsiMCxOQfzOa8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=F3wLT3JmjiQGLndTsjHABR9CWBTjxX3cqdJzKBTTom2cVsIqxJcc6eMtzvI+asZD2
	 cTpAjilGjRJqNaCC23Y2RaPjJQDph3kflEo29w3uxdGLD6VG7v0xOoOOIvGPv9Yto3
	 Ckqz0cWoDVhO676OsuVjCienTx9dzjt//HoujtsbbO6f0BVndyDVY71Um8jLgW9Kqv
	 dm56wi6KVc5w3fRruCk/cpwV2+n/m2pNIpnsIMylSkqce45GFMSGY26OEkHn3CmaKW
	 8+4MyfsV0aBnThmGGEpv3Z1m14zWlXUt4LXlt5RGZC4iVXB5bWJ9a8wIAk1iztwxv4
	 6MoOOY2YYheiA==
Date: Wed, 18 Jun 2025 20:54:25 +0200
From: Marek =?utf-8?B?QmVow7pu?= <kabel@kernel.org>
To: Marek =?utf-8?B?QmVow7pu?= <kabel@kernel.org>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org, 
	Linus Walleij <linus.walleij@linaro.org>, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Andy Shevchenko <andy@kernel.org>
Subject: Re: [PATCH] platform: cznic: turris-omnia-mcu: Use new GPIO line
 value setter callbacks
Message-ID: <xov3tbnn7gcenyu4ud5vvdfmw6a67g276aws2clpfvk2l7jhbz@mj35nxxysw7y>
References: <20250618124319.19220-1-kabel@kernel.org>
 <CAMRc=MfdPc0T_6G7uRUW7BAjFaBQYFFs=u2NGKj29eJGSjRVCw@mail.gmail.com>
 <ge4wcqilbvc374fap2z5klrie6c6k5xwuwfbfrt6wbf2nvkt7u@hdskg6eilzcv>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ge4wcqilbvc374fap2z5klrie6c6k5xwuwfbfrt6wbf2nvkt7u@hdskg6eilzcv>
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

On Wed, Jun 18, 2025 at 08:47:33PM +0200, Marek Behún wrote:
> On Wed, Jun 18, 2025 at 03:20:15PM +0200, Bartosz Golaszewski wrote:
> > On Wed, Jun 18, 2025 at 2:43 PM Marek Behún <kabel@kernel.org> wrote:
> > >
> > > struct gpio_chip now has callbacks for setting line values that return
> > > an integer, allowing to indicate failures. Convert the driver to using
> > > them.
> > >
> > > Signed-off-by: Marek Behún <kabel@kernel.org>
> > > ---
> > 
> > What's going on with this patch? I sent it a few days ago, now you
> > just resent it without changes. Who should pick it up?
> 
> I didn't see any patch for this driver, only for gpio-moxtet (for which
> I sent R-b). Did I overlook it?

OMG I see it now. Sorry.

There is one difference, though. Your change makes omnia_gpio_set() return
-EINVAL on a GPIO that does not support output direction. I put -ENOTSUPP
there, since -ENOTSUPP is also returned by direction_input() and
direction_output() methods in this case.

I don't know if -EINVAL or -ENOTSUPP is more consistent, though. Feel free
to apply your version (you can also add my R-b tag).

Marek

