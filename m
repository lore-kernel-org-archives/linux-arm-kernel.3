Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 619DCC369D5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Apr 2025 13:51:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4ncZ5bmct1NJqeqnUV5hJrIRVN26myvSF9hfMpOmqbA=; b=XZ0j+lL+7RLIVDgJxCXKYlJOd9
	2Ie6JXNGNfB09MIi9fSGmzKQlszSHt66un8JFazSLVlcHyKJJVdqiSUCKC/XF+12goFz8fWilFhea
	j8zY0TyNrnKSuAFDDiGCOfQSfp6K6aHm/qDKurBbfy0CC+w8HnxXWo8eUVXR20+mV4p/3fljjrcsu
	fnoarAGEmcPpx5yevx0w0HqFSAKn2CjdyM/+Maes9F9cuLiki/OzY1y7jkHQL0b9RQ7uHkNfIEzyh
	8ilJ2GDiAYTtUj+l7DfLV59pe4cgMoxVaUs/U7n0Q80Ukq+kMRsKrkNhSkeqHylHK3Oa1NgaKU3X8
	AoHop96A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9Ot0-00000006XjA-3K3W;
	Mon, 28 Apr 2025 13:51:06 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9OYU-00000006U8G-0ru3
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Apr 2025 13:29:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 72F3749CDF;
	Mon, 28 Apr 2025 13:29:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D0EBC4CEE4;
	Mon, 28 Apr 2025 13:29:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745846993;
	bh=elk4Zqa+3hCtmUiNsAt9MfBksCuGpsquiK6zsRxydTQ=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=TD7QBfDg6kXdOzjRs6gtAIizZopWFFNqcvzVQOUhE4adYd3tKK9ZWRiOnvUE6xSVd
	 jqwrYMQ8+CvdekMObGo0NgaCNDmpuD0w0cXxKLSIz47iIeS/A+QYeABeLViatbJfgl
	 WYuFL3DJJsVzqm0ssKDEWQxyOqyy4bbuIUxmpfwxhdut/618sWFo6Maqz94oacg6/C
	 PFGArhwz0OFSGUVyUCsQRZIPi4wGKLvIrlI/LJUOfHZ/1qnX4nKj5+7grom/3aVSVM
	 0hcg7j0y6Ieg1gwWvMRkF6+1AoV5y9QGkFI2DE13pzJZ78Bj3EwkJ7EatPc+D16aoT
	 QizlVzaNHtOoQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 70BF93822D43;
	Mon, 28 Apr 2025 13:30:33 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next v3 0/3] net: stmmac: socfpga: 1000BaseX support and
 cleanups
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <174584703225.917720.8866587140005702000.git-patchwork-notify@kernel.org>
Date: Mon, 28 Apr 2025 13:30:32 +0000
References: <20250424071223.221239-1-maxime.chevallier@bootlin.com>
In-Reply-To: <20250424071223.221239-1-maxime.chevallier@bootlin.com>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: davem@davemloft.net, andrew@lunn.ch, linux@armlinux.org.uk,
 kuba@kernel.org, edumazet@google.com, pabeni@redhat.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 thomas.petazzoni@bootlin.com, horms@kernel.org, alexis.lothore@bootlin.com,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250428_062954_262680_E7128D31 
X-CRM114-Status: UNSURE (   9.06  )
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

Hello:

This series was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Thu, 24 Apr 2025 09:12:19 +0200 you wrote:
> Hi everyone,
> 
> This V3 is simply a re-send of V2, targeting net-next instead of net as
> the V2 did by mistake.
> 
> No other changes besides a rebase on net-next were made.
> 
> [...]

Here is the summary with links:
  - [net-next,v3,1/3] net: stmmac: socfpga: Enable internal GMII when using 1000BaseX
    https://git.kernel.org/netdev/net-next/c/6fba40e7f610
  - [net-next,v3,2/3] net: stmmac: socfpga: Don't check for phy to enable the SGMII adapter
    https://git.kernel.org/netdev/net-next/c/3bf19459da62
  - [net-next,v3,3/3] net: stmmac: socfpga: Remove unused pcs-mdiodev field
    https://git.kernel.org/netdev/net-next/c/8fb33581bb8a

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



