Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09E6EC5AD7B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Aug 2026 23:41:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dgqDCE+7+AcH13tJ/UostL112UtPgrLsavA7ybpA86I=; b=yy6pKtnm3r6Sj5aCzXDgdmR5wt
	5ehDAauHXRy804ChfsCwUuBzLWh7dwWmdupilHGRVs2sIm0/Z/fA8CMvffiyzVyyTlVl1bHGOL9zT
	QXyT5cr2n5PxGItz6rgoWhj3SKnedrIEz/dd4gNfUQNgX3pU6oC599j1Gi/5c5aCdWPKkJ+EJHSmd
	vLGgw2rplxggRYKFxyTe2m6RkcI+LrXnOmu5wyYywZPEbXr1BtIWAvaej6kof6BYVaEOW6TPJbAHA
	pN/ZaDR5kujHmXaloz2nUfnjJ9Awu1i/QmQN4nl7L5a9eJQDW5Ci+HFSKOTxKYcvCA5q1itP4Ix4h
	s7tLpkUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtZc5-0000000D2eR-1Gff;
	Mon, 10 Aug 2026 23:41:01 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtZc3-0000000D2eA-4BKh
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Aug 2026 23:41:00 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id DCBBA600AE;
	Mon, 10 Aug 2026 23:40:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 939111F00A3A;
	Mon, 10 Aug 2026 23:40:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786405258;
	bh=dgqDCE+7+AcH13tJ/UostL112UtPgrLsavA7ybpA86I=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=PObbHsAmkt2YRRrhgCkmb2SwArPm8K0/x6vNmimr404PDGMdsXxV1LG2Au5Zez7HS
	 6XnZ7p2y+GFcheFi/tgXZC+VxB8KfaoREB2V8TdJ4I6DjN93pzvSP6sZKaGQ9D7skV
	 pBAcujLS1lGokzsQV5T5XEPWbMRQAGhcAqKp2p0MJ7FKZTltZXwU834V4gLEKYT4ql
	 teypvubYzUParDBf7zGuUuuLnUCXaBZwxXSuYt+bgF9fzgkQxY4iYrkrU6AAftCR3B
	 nufk53iIsSoqIoqjTa2yTx522Gpe9B7KkGDN0ShxhVWSj3a7t0HKjcAnQg53GTLWiZ
	 fHkrIY9nLrzDA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 569F4392626C;
	Mon, 10 Aug 2026 23:40:16 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next] net: xilinx: axienet: Treat xlnx,rxmem as a
 required
 property
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <178640521488.254991.791827397813626825.git-patchwork-notify@kernel.org>
Date: Mon, 10 Aug 2026 23:40:14 +0000
References: <20260806170253.1199749-1-suraj.gupta2@amd.com>
In-Reply-To: <20260806170253.1199749-1-suraj.gupta2@amd.com>
To: Suraj Gupta <suraj.gupta2@amd.com>
Cc: radhey.shyam.pandey@amd.com, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 michal.simek@amd.com, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
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

On Thu, 6 Aug 2026 22:32:53 +0530 you wrote:
> "xlnx,rxmem" device-tree property is used to learn the size of the Rx/Tx
> packet buffer built into the ethernet IP, but return value of
> of_property_read_u32() is ignored. When the property is absent lp->rxmem is
> left at 0, which silently limits the interface to the default MTU and
> disables jumbo frames with no indication of the misconfiguration.
> 
> "xlnx,rxmem" has been documented as a required property since the binding
> was introduced. Check the return value of of_property_read_u32() and fail
> probe when the property is missing, so a misconfigured device tree is
> reported rather than silently degrading functionality.
> 
> [...]

Here is the summary with links:
  - [net-next] net: xilinx: axienet: Treat xlnx,rxmem as a required property
    https://git.kernel.org/netdev/net-next/c/34b270e7893f

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



