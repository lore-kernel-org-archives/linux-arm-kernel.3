Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97074C5DF9D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Aug 2026 08:11:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+MwTcniFgsQyj/mh+HBBLh8w4RBABQD8nqYNKGZKxGU=; b=0rvzAmT+5hJIMlR4SdKk7xAuAA
	AGnZ/Bv4hQxfawqsqrE7NHCFFBx/w0tWwuWuCMz+WDpFZz6enCP3wmZSN8W+JlvnKFShQN2tC8RVa
	BiMM3i/0F4fZ/hO8v9vUQ0Xd2k2lOZICiTpltqRpfENBtlyJj1gfFSnU7cm2L85/SfzhWXI+jH7FV
	wS9TYm4bfq9ISc6m1if5Ii7yc2qc1Uo77yXCYSMwCevXQf+WWTrNYJoyA0Kw0GidfOI6Qf0OVFcJQ
	qhseI5n49GLMfVpUslLRnvSnySqA4DO3EHJ/h47EQo45G4dihloBbNeW1TrcvKofPRldb9Cs1zhLT
	OfQ+165Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzVCR-00000003brf-0q67;
	Thu, 27 Aug 2026 08:11:03 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzVCP-00000003brZ-32Le
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Aug 2026 08:11:01 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id E8C38600D0;
	Thu, 27 Aug 2026 08:11:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99E971F000E9;
	Thu, 27 Aug 2026 08:11:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787818260;
	bh=+MwTcniFgsQyj/mh+HBBLh8w4RBABQD8nqYNKGZKxGU=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=K8rppW3ABdUDNXrK6Q7jT8E+OfMviBE+EPcrDRVdF8nvH61z4tOpwpzhH1mIZqVEW
	 0YlYdIVc7HXFKeek3Cu77gsBKHUnyQzO0+18UhO5l8yyGg0L996u0CHk+T1BoE+8VP
	 Ue93xqJYJVxpfX4YnKFPkzGdDTOSuZBxt78p7Xf/2ZRsCf8kWDPBtJkxH8Bm3GxR9R
	 sO0dv6iFxWB0hf0lBZy1slylRLtWW9wHSRb49d+kNmkPVIFw9/h8bzUDJpatg87GX8
	 1qtMk8zA+BPZQTxm1lp/YVVzTAB+ak4lOilFKxyUGX8xYIY0WDmzLXZKwaON5RotdZ
	 RWq09+78fpGAw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 939493809A12;
	Thu, 27 Aug 2026 08:10:07 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net] net: ethernet: sun4i-emac: Fix IRQ error handling
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <178781820640.1094636.14217098118734046137.git-patchwork-notify@kernel.org>
Date: Thu, 27 Aug 2026 08:10:06 +0000
References: <20260824100901.31675-1-phucduc.bui@gmail.com>
In-Reply-To: <20260824100901.31675-1-phucduc.bui@gmail.com>
To: Bui Duc Phuc <phucduc.bui@gmail.com>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, wens@kernel.org,
 jernej.skrabec@gmail.com, samuel@sholland.org, linusw@kernel.org,
 kees@kernel.org, bartosz.golaszewski@oss.qualcomm.com, arnd@arndb.de,
 sr@denx.de, mripard@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org
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

This patch was applied to netdev/net.git (main)
by Paolo Abeni <pabeni@redhat.com>:

On Mon, 24 Aug 2026 17:09:01 +0700 you wrote:
> From: bui duc phuc <phucduc.bui@gmail.com>
> 
> irq_of_parse_and_map() returns 0 when parsing or mapping an IRQ fails.
> The current code checks for -ENXIO and therefore does not detect the
> failure.
> 
> Check for a zero return value and convert it to -ENXIO.
> 
> [...]

Here is the summary with links:
  - [net] net: ethernet: sun4i-emac: Fix IRQ error handling
    https://git.kernel.org/netdev/net/c/991c2be78257

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



