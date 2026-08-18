Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E657C5DF7D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Aug 2026 18:38:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xcE8u3MTQeSN+HcN7MflLAd7hpeSPdq2Rj1vU/dHrpk=; b=lzdKVh9js3CenNd14XrMVydAK9
	6DE6F0TWaXyIXeMD/4r8vU66e5SByTwPvYh0FBQxE1nrwi1XU30LZg8WsoyKoqEDx96d0oLaMF+79
	h1wPSmvTbcf78LxCB3bS915oPILqNkredc2+1YkCmdagFfGNPF4qzOKxDYSGI7u4KZjMnbqo3o9Rt
	j67To5dEoWKHB/sbUhoMRSB7wGVVEqh9wXPJ5Kswru0iGqRqo9Bm5SoNhRJHTlAaIBFOx9eGTCKx7
	bvI+LLF8ema+Xp8rhxJKehZ62qzgdLPtMD/y2cBek8alFjrgVeJybTe+iP8yRLVgs3ucpjIAWQaD+
	asXTmfEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwOhb-00000008WpI-0veQ;
	Tue, 18 Aug 2026 18:38:23 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwOhZ-00000008Wp3-1qoT
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Aug 2026 18:38:21 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 9CC99601FB;
	Tue, 18 Aug 2026 18:38:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50DFA1F000E9;
	Tue, 18 Aug 2026 18:38:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787078300;
	bh=xcE8u3MTQeSN+HcN7MflLAd7hpeSPdq2Rj1vU/dHrpk=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=ceKAhWNk/QWJiTGHfUmOYeY2Ku5OrcRC12NKi2kQq3Xqhjr4uDA5jEWx/mj6Otqnq
	 Cc6jk8INttufEJ1drwXZQX9SgBV00FFKpqpJNZMEiKfJrN8PM5zX2skOlKvYKQpK8O
	 wCiWc2n+0lxBYQDIdWCxQ8PSUnL6GFI91QFNOxjmkGkRkXDtCaW5wPXPjuYjiY3dk4
	 txL4LW3La0xH+EMjpK9VEM66YVG5QCxGC3BFKqYLPP4okg/U7yOOCTeV7DLLIWN2oP
	 IXgW3VpWofE+OxKA3tnC7QoMU6PfPrY95XNSSpZiSwwu+oUrO3mAk1OL+cYxirndoU
	 aETw4dZOTxm0g==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 1981A392704D;
	Tue, 18 Aug 2026 18:37:33 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] Bluetooth: hci_bcm4377: Ignore reserved PHY in ext adv
 reports on BCM4378
From: patchwork-bot+bluetooth@kernel.org
Message-Id: <178707825170.2194892.13646911015314059451.git-patchwork-notify@kernel.org>
Date: Tue, 18 Aug 2026 18:37:31 +0000
References: <20260818-fix-bcm4378-ext-adv-v1-1-81a143eac194@kernel.org>
In-Reply-To: <20260818-fix-bcm4378-ext-adv-v1-1-81a143eac194@kernel.org>
To: Lorenzo Stoakes (ARM) <ljs@kernel.org>
Cc: sven@kernel.org, j@jannau.net, neal@gompa.dev, marcel@holtmann.org,
 luiz.dentz@gmail.com, luiz.von.dentz@intel.com, asahi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-bluetooth@vger.kernel.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
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

This patch was applied to bluetooth/bluetooth-next.git (master)
by Luiz Augusto von Dentz <luiz.von.dentz@intel.com>:

On Tue, 18 Aug 2026 10:49:34 +0100 you wrote:
> Commit ed2a2ef16a6b ("Bluetooth: Add quirk to ignore reserved PHY bits in
> LE Extended Adv Report") added a quirk to handle creative use of the
> reserved bits in the PHY fields for 4388 controllers in Apple silicon.
> 
> I observed the same issue with the BCM4378 Bluetooth controller (14e4:5f69,
> rev 05) on an Apple MacBook Pro (13-inch, M2, 2022):
> 
> [...]

Here is the summary with links:
  - Bluetooth: hci_bcm4377: Ignore reserved PHY in ext adv reports on BCM4378
    https://git.kernel.org/bluetooth/bluetooth-next/c/762385e86200

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



