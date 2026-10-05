Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75F4FCA5FF0
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Oct 2026 22:50:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FN9wJFMFgdkD8CUh9pfquPqVho9UUrHIcx8HlymlWXg=; b=y8cW5ZkSUPfjL9jzvgPt3RIzYX
	JyU5sbqOFDHdD8+3wJL5Pc67RFCdHoWwWeuuZBO5ol+Vr437rVfSmJpRdKzTXQZL8y5eCfdeWuNIh
	NtIklGRVE5KjOOvzz+nnU8kB0NR7vJBG8e9VU7ei3x9AhZxjIpD6qRrl0rYtTJOsn2R1SvJBRrMwD
	W+24JQEX9kaCx6Wv9nt3xDyjaOq4+/9ARDD4R5csY+hkbc7VNdU76woqtFyOob3dAANQyn8pk70rz
	qVtFTnhRjUJpOXQF+/jsH/CHFnL6+kMOLjAo++UFnun+9GYMAFAK7RxwU+uUOFug3tA8IbBR5F2L+
	kuVmYOuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDrVZ-0000000HIbX-1BI5;
	Mon, 05 Oct 2026 22:50:09 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDrVX-0000000HIbR-2kpm
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 Oct 2026 22:50:07 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id CCD9760136;
	Mon,  5 Oct 2026 22:50:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 805B61F00893;
	Mon,  5 Oct 2026 22:50:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791240606;
	bh=FN9wJFMFgdkD8CUh9pfquPqVho9UUrHIcx8HlymlWXg=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=KOXGXeWfaozqzbDMgoFwHebWj05aVKSkHaAuQgvCu8idsN+TWxXE+C9THj9mlD598
	 +0A+I6/+8adC+HEtGoLbDIsuspZQoV8W+ksZoHNNVfFI8bUh1nW9GB5VktgJDL/Mah
	 VE7JWYNTN7JAHWZFwsNN5BAsKYT24Ggrz49S/JicFnJy6dEtilKflglRJIxU3i34bO
	 UIL4bMWppxSpjEWUe0cHlFHEThXT1k0XicAEWr4lHuJ1bU+tzEXSL9yTk426GlAkM8
	 hjg2wxK8OFTBbBx8XOm3BigA5mFdddSuXksyzt6gzRF5bgvZSRJSQvZ8NPcid1mzVY
	 SxNyUXWpRzSjg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 772F73926677;
	Mon,  5 Oct 2026 22:50:06 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] net: stmmac: Disable unsolicited checksum insertion for
 AF_XDP TX
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <179124060528.1926729.1824950688409199711.git-patchwork-notify@kernel.org>
Date: Mon, 05 Oct 2026 22:50:05 +0000
References: <20260929121032.20835-1-jszhang@kernel.org>
In-Reply-To: <20260929121032.20835-1-jszhang@kernel.org>
To: Jisheng Zhang <jszhang@kernel.org>
Cc: maxime.chevallier@bootlin.com, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
 netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
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

On Tue, 29 Sep 2026 20:10:32 +0800 you wrote:
> stmmac enables TX checksum insertion for every AF_XDP packet on queues
> that support it. The driver does not implement tmo_request_checksum(), so
> it enables the offload regardless of whether the application requested it
> and ignores the requested checksum offsets.
> 
> Disable checksum insertion in the AF_XDP TX path. Applications must supply
> complete checksums until the driver can honor AF_XDP checksum metadata.
> 
> [...]

Here is the summary with links:
  - net: stmmac: Disable unsolicited checksum insertion for AF_XDP TX
    https://git.kernel.org/netdev/net-next/c/ecf5985006dd

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



