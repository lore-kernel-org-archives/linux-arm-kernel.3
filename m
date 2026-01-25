Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7C18D7237C
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 25 Jan 2026 23:04:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Bxm1UixWgyDWZUUMx8y/g7vs8oWmaciotoJeKrtimmM=; b=sUh8r8V4N2AXy3Ul8QRC3/lcsE
	HmBvyabFmeBm8bl3maLrpgM/f1mPScdO35aCGs8BeLyUOZyNZqQQ9E+HmO0TRHFl19yW+FrA/6vFA
	iOvJKuR8H3AgnhwzWh87EfUeCEww9rQ7eoBuLSQWhvTohzuZdHBSYeDHLgdKNIMY6sIMnleyL6WMS
	4ZNSDY9B6t3xPSt7cZRVeSEOgVmRduTTHG0reC5Gz2SQ0IggU42834o/gAND+CxUTrsxDcbuoNZED
	isefdioPo7ljZ2ZcKHuvBvpu3icYPmxbt41kj8AOkrNiobfcA2W/faatoCCO1R/VjaHcCtx/NaioF
	Wj8HtUaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vk99Q-0000000Bf31-3f9A;
	Sun, 25 Jan 2026 23:04:12 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vk99O-0000000Bf2Z-07JY;
	Sun, 25 Jan 2026 23:04:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3B54D43688;
	Sun, 25 Jan 2026 23:04:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 997A9C4CEF1;
	Sun, 25 Jan 2026 23:04:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769382249;
	bh=960bktz2ZFqnPtMsf7RZW8qIbtxeJL5lmytaygJqpvY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=rBvtu2rM+Zc7GcADmQSJmwr0x9DVRjuNeMrRLAoSLH6Eya2iSWt77HV8KDb2+VoiI
	 REafSykfgSE2CExeF+wCE0VYXbiB4Qx2LBt3EBUU5bFwcrEfIhhdymmUN7rYp0ywyl
	 WJBYF/4YzyjyvN5HyXJzz/rHbRo7ks917U+IuORUridp3Wbc9jr4Th9OcuzMw+it4H
	 bj7bO4p74y1o2kJ7hnOtjAwJ3e402mDTdq9oH0aVJazfhXKHOUPLnhgaowqfN6vpVw
	 WVx6lQNgnkKXGo3thbirZRrCvA8bbg1YxOSvKlmP9pOh2d5tQsECwCpnvVNrXid+j+
	 5+hsFOY8uAu7g==
Date: Sun, 25 Jan 2026 15:04:07 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: linux-arm-kernel@lists.infradead.org, andrew@lunn.ch,
 davem@davemloft.net, alexandre.torgue@foss.st.com, netdev@vger.kernel.org,
 edumazet@google.com, pabeni@redhat.com, heiko@sntech.de,
 andrew+netdev@lunn.ch, linux-rockchip@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [net-next,18/21] net: stmmac: rk: rk3328: gmac2phy only
 supports RMII
Message-ID: <20260125150407.3369b678@kernel.org>
In-Reply-To: <aXaY5nKGFdBhVsnb@shell.armlinux.org.uk>
References: <E1vjEvF-00000005ghI-3CYC@rmk-PC.armlinux.org.uk>
	<20260125221631.3396200-1-kuba@kernel.org>
	<aXaY5nKGFdBhVsnb@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260125_150410_091304_4DD17AE0 
X-CRM114-Status: UNSURE (   9.02  )
X-CRM114-Notice: Please train this message.
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

On Sun, 25 Jan 2026 22:27:50 +0000 Russell King (Oracle) wrote:
> On Sun, Jan 25, 2026 at 02:16:31PM -0800, Jakub Kicinski wrote:
> > This is an AI-generated review of your patch. The human sending this
> > email has considered the AI review valid, or at least plausible.
> > 
> > For local reproduction steps see https://netdev-ai.bots.linux.dev/ai-local.html  
> 
> This, and all the other AI generated comments on subsequent patches
> are repeats of patch 17.

#$%&, should have checked. Sorry.

