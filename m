Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 939FCEA7967
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Feb 2026 05:00:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NrtT7KU4gJ0dEdIjDgWpiG05vShFBP8NxSUhMseVNiY=; b=dh86I+8s3PShJ3Qt7MHF/9enyX
	ilpXXZbDkOTpJ0cc7bh4XoowtVDOQjPK/Grm3pWij3GQ5aaR37zqrQz7m6Ox5R6RJkQVc0QOHEOTJ
	v2Lwki8etII3fEJk5Bv5oclQvn6UnnjgHQ5Ywf6s6yt3xlqu99OL9mvEcXlA7dhUOxQ6CQArHI+Oj
	UsaqqZsMBZOr/0JhVbhcJnAbi3fC+BM6omE9uuEoAWeSQPNIha83P+YYg3RQhBU4Qg04TiZUwa2z2
	RzEFZ+wQHQqMqgqphcBY1o48LPzAA1m2tJZt5/Vj8w/zcAJ1pxeoQJRAXIn46ihSi4vMMAbc7QEyW
	NeFEQvUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnrTi-00000009QpJ-46IX;
	Thu, 05 Feb 2026 05:00:30 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnrTh-00000009Qot-0yPM
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Feb 2026 05:00:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id D7F0160129;
	Thu,  5 Feb 2026 05:00:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B68AC4CEF7;
	Thu,  5 Feb 2026 05:00:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770267626;
	bh=tYHUc0qOX64BQ1IJlSdjRln/EKpaQ440UZi6+G7w4mw=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=ddpFw7J3on4isMCOt3H2lue5WuIcQR2SPQyCjWoZHpcNo1ZOTj+0PEi8E25EEkr8i
	 yBMJnQGVARjtPRf9ef7LOw5vY/yM+9Y2z+ek1oOnVhhcPy7Lqh8R/kctmeagk57hxB
	 J7O+Kj9pbl2a5JZU2QKOYIXxHBXHap+mc+VDMlo0wQQv5W2syvn5fsdPkfORbPJ1+S
	 u+UUHFuQCX/dMT7rAwUxM2xANHv47aMRkTTr+88v+1jSOwGN6JqosnkOj0HydENAgR
	 MHTZTCGLy25XnN2BhGDmzmOxgcKX3xyJbmTZnqJI3QUxi77k/zaWdow5KMAS1trpuU
	 0849KzwxQ7hRQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id C27A63808200;
	Thu,  5 Feb 2026 05:00:25 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next] net: stmmac: remove support for lpi_intr_o
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <177026762457.167759.15871089841650371979.git-patchwork-notify@kernel.org>
Date: Thu, 05 Feb 2026 05:00:24 +0000
References: <E1vnJbt-00000007YYN-28nm@rmk-PC.armlinux.org.uk>
In-Reply-To: <E1vnJbt-00000007YYN-28nm@rmk-PC.armlinux.org.uk>
To: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
Cc: andrew@lunn.ch, alexandre.torgue@foss.st.com, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, netdev@vger.kernel.org,
 ovidiu.panait.oss@gmail.com, pabeni@redhat.com
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

Hello:

This patch was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Tue, 03 Feb 2026 16:50:41 +0000 you wrote:
> The dwmac databook for v3.74a states that lpi_intr_o is a sideband
> signal which should be used to ungate the application clock, and this
> signal is synchronous to the receive clock. The receive clock can run
> at 2.5, 25 or 125MHz depending on the media speed, and can stop under
> the control of the link partner. This means that the time it takes to
> clear is dependent on the negotiated media speed, and thus can be 8,
> 40, or 400ns after reading the LPI control and status register.
> 
> [...]

Here is the summary with links:
  - [net-next] net: stmmac: remove support for lpi_intr_o
    https://git.kernel.org/netdev/net-next/c/14eb64db8ff0

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



