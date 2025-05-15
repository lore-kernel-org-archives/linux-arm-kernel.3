Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5CD6C3ABDA
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 May 2025 02:42:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WqekfboiIsksqLuqFsIEMWLUIL7bFFmX1IqYuj+qImU=; b=ayYjTETPhb9PSTq5m3M+RCIizI
	gwfHYsbVfNSVN7KUr49HLwDDga6J+Qj760kEeP/ZNOZJz2ubaMUGVy97vnLJiXDMyoc4q4vrd5Djj
	rseKvPuo4TbgAq9fYPVKeyX4967rdSJaSzxUEULoHugAmj1De6YG9N7p81/3JfzXahfNMoIi2A2/2
	zsqK+rJ4UJCW5oYsHP8IOnECy0l5OxlZUZi+/oLipn7H9GCpRUMtwOX6MShLUmOvndJ8ElWxD7XPf
	jooB7OUfXqyhmB7FHadN+a9kx2njO+rDN3bylPpfoE+bu2JIjuCF0LVZ/Wp50lG60p4w8hdWQckEX
	BFKsoQig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFOY3-0000000Gqgs-3pQc;
	Thu, 15 May 2025 02:42:15 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFOVv-0000000GqVF-2P1H;
	Thu, 15 May 2025 02:40:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 37B48A4C76D;
	Thu, 15 May 2025 02:40:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8528C4CEE3;
	Thu, 15 May 2025 02:40:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747276801;
	bh=lrEamcmK20W/gtuxO3aHJagod68XsFUEPjGcfYzxcfI=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=BnepMtQjO9C84Nood7lwGeUpSiG055lgXjyxJj76jaoq4SSwM6/Ibq0uNIHHBJKuT
	 +CJZC3fS/qPJmhMjTTZms3ptrsExAYDrjS42BMzdlGeVBBXG8kGuxmexWtTj/52JFB
	 5H4kakn75HmqktEKlj80RIlfsBTXna7RjBM5iR8/Az07GhO61lDsbJpbXrOhBYfcuq
	 +26RNZujKIDJC3/dn1ZwFKNkJHqG9cPY+qJXJyOeCCBkMwTNGqm0ERUwGyei1Fn2an
	 EgSjhDzk9N8kAQcOcqMQKWr3+meF5mj5BoGN3EXUKbcE267J/9uI20kn3c57RHQtiB
	 RoGD9sjsgVa1g==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33DBA380AA66;
	Thu, 15 May 2025 02:40:40 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net] net: ethernet: mtk_eth_soc: fix typo for declaration
 MT7988 ESW capability
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <174727683900.2587108.2642829871364981642.git-patchwork-notify@kernel.org>
Date: Thu, 15 May 2025 02:40:39 +0000
References: <b8b37f409d1280fad9c4d32521e6207f63cd3213.1747110258.git.daniel@makrotopia.org>
In-Reply-To: <b8b37f409d1280fad9c4d32521e6207f63cd3213.1747110258.git.daniel@makrotopia.org>
To: Daniel Golle <daniel@makrotopia.org>
Cc: nbd@nbd.name, sean.wang@mediatek.com, lorenzo@kernel.org,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, linux@armlinux.org.uk,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250514_194003_691924_2F167F55 
X-CRM114-Status: GOOD (  10.25  )
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
by Jakub Kicinski <kuba@kernel.org>:

On Tue, 13 May 2025 05:27:30 +0100 you wrote:
> From: Bo-Cun Chen <bc-bocun.chen@mediatek.com>
> 
> Since MTK_ESW_BIT is a bit number rather than a bitmap, it causes
> MTK_HAS_CAPS to produce incorrect results. This leads to the ETH
> driver not declaring MAC capabilities correctly for the MT7988 ESW.
> 
> Fixes: 445eb6448ed3 ("net: ethernet: mtk_eth_soc: add basic support for MT7988 SoC")
> Signed-off-by: Bo-Cun Chen <bc-bocun.chen@mediatek.com>
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>
> 
> [...]

Here is the summary with links:
  - [net] net: ethernet: mtk_eth_soc: fix typo for declaration MT7988 ESW capability
    https://git.kernel.org/netdev/net/c/1bdea6fad6fb

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



