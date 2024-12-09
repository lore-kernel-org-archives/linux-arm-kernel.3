Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49241E77181
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Dec 2024 13:41:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7OSlsVpycMKVqMTSfystYalXQ67j/YEuRw67rAQYH/c=; b=DvXYhVpoOfrImuCRe7hcSaF7z9
	Fv6saEhss7ogMBX5QFhnzgjIKZ2lkNuVCDh3GDibSnTqacVGGeap9ToAgNijye2ax5XFK570U7vtv
	t6VebGJ3o6ezJor+xlKhakXS5KUWJWKe3PhgP+18K/VImDDIkdMdONIuhgcAGFJUz/9Xky64lHDyM
	4WgA3/CROUqssPj7Mlc1d5e4eoEYZsBUUP/KPOtD80NkqZoVUcfvy+o89BB4eJnQ6phiOj9V6vcDU
	ndb2G86wLMAwmBTTWiSKCnDmOC4iqkD5BVzFsdya8oqo809JaZuAzx1h5prpPzkjrZreBPKtvqCgH
	QsDg77Ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKe0n-000000082aR-1VjF;
	Mon, 09 Dec 2024 13:41:21 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKdzk-000000082S8-2ROr
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Dec 2024 13:40:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id BE24AA4165B;
	Mon,  9 Dec 2024 13:38:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF348C4CED1;
	Mon,  9 Dec 2024 13:40:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733751615;
	bh=Y+YCQ+zTvuOJ62iXxPiywsXkNkqk6N2zkZ56nBO2ltU=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=ehEznMECpBD6HGgVxZwWztdZdJKU5K7+JTfijNV3sfcSAspYUi3QWP6HwsB1dI26A
	 9LMkM0229KGSKrS3YWRqssUSx/fuwN+X9+UZNeDKKc2wFdW+Zo0L8l1pvXMGYDlpSd
	 VtIEbrtboKWESmTAvmgp6AjQp/i4+2/K+lMXC5AnwlxNOdOY9e5YRo/nNzTmFl8v83
	 8teNszDSmS51+nTmRqLoJVV5mTbc5Lzvw25TRBN7WHxtQgTwzEDLo6sMCsjaWolS/b
	 Fo81tR3ofyv9AxvHNl5djnanW0oQN5b5GGpGCHM6Pwz5u8VHx+70sE2ZyMjc4JSAu5
	 IuoRWlAaQIsNA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id ADEDD380A95E;
	Mon,  9 Dec 2024 13:40:31 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net 0/5] net: sparx5: misc fixes for sparx5 and lan969x
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <173375163050.50212.4642950609895270784.git-patchwork-notify@kernel.org>
Date: Mon, 09 Dec 2024 13:40:30 +0000
References: <20241205-sparx5-lan969x-misc-fixes-v1-0-575ff3d0b022@microchip.com>
In-Reply-To: <20241205-sparx5-lan969x-misc-fixes-v1-0-575ff3d0b022@microchip.com>
To: Daniel Machon <daniel.machon@microchip.com>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, lars.povlsen@microchip.com,
 Steen.Hegelund@microchip.com, UNGLinuxDriver@microchip.com,
 richardcochran@gmail.com, bjarni.jonasson@microchip.com,
 jensemil.schulzostergaard@microchip.com, horatiu.vultur@microchip.com,
 arnd@arndb.de, jacob.e.keller@intel.com, Parthiban.Veerasooran@microchip.com,
 calvin@wbinvd.org, Usama.Anjum@collabora.com, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241209_054016_687682_472A499B 
X-CRM114-Status: GOOD (  12.55  )
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

This series was applied to netdev/net.git (main)
by David S. Miller <davem@davemloft.net>:

On Thu, 5 Dec 2024 14:54:23 +0100 you wrote:
> This series fixes various issues in the Sparx5 and lan969x drivers. Most
> of the fixes are for new issues introduced by the recent series adding
> lan969x switch support in the Sparx5 driver.
> 
> Most notable is patch 1/5 that moves the lan969x dir into the sparx5
> dir, in order to address a cyclic dependency issue reported by depmod,
> when installing modules. Details are in the commit descriptions.
> 
> [...]

Here is the summary with links:
  - [net,1/5] net: lan969x: fix cyclic dependency reported by depmod
    https://git.kernel.org/netdev/net/c/1cd7523f4baa
  - [net,2/5] net: lan969x: fix the use of spin_lock in PTP handler
    https://git.kernel.org/netdev/net/c/aa5fc889844f
  - [net,3/5] net: sparx5: fix FDMA performance issue
    https://git.kernel.org/netdev/net/c/f004f2e535e2
  - [net,4/5] net: sparx5: fix default value of monitor ports
    https://git.kernel.org/netdev/net/c/e4d505fda6c8
  - [net,5/5] net: sparx5: fix the maximum frame length register
    https://git.kernel.org/netdev/net/c/ddd7ba006078

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



