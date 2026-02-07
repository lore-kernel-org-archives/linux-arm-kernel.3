Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89873EE6B65
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  7 Feb 2026 04:40:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1eAu/zzBe+33oYOaufFoq/Rk9lGOcYOFiQI2s4NeQOc=; b=1+WCGIuR+Q9V965YD2d8qc+9yg
	jzbNwvoez4AjyA1DNFGKQ4Yev66krRuAsfpVdco5yakJC2nxt1HsjBMcGqYZpAsBIZ8VylAB0iKH2
	8vdeFmzifcia4kwWI4hMidDwAO3Vqq/T73C1p+fW5szjtgGOsrLvWvwMs3ISuhLKmUBS1sy0j7px7
	3rD9y2S3gVqnr9yjlfoCoxgjMkOea3C8a2tUP1mJ6vWcWMewC/b7MIgQKhVTRhZttnyOfYv4heJOX
	Yy09PAvi7FrtiIoxpTtHFdX9c9caYgQG/afJ1PDnntFbQ6zIOU2o0jZU1IuqMngo4fFsa25BWtOcX
	5nEDDvSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voa7H-0000000C7nM-2Ttu;
	Sat, 07 Feb 2026 04:40:20 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voa7E-0000000C7n2-25hw
	for linux-arm-kernel@lists.infradead.org;
	Sat, 07 Feb 2026 04:40:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6F09F443C8;
	Sat,  7 Feb 2026 04:40:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4911DC116D0;
	Sat,  7 Feb 2026 04:40:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770439213;
	bh=v3pzHLinNeUIreFbgj6SMS5VHn3aBJx2qfGChvlWMys=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=j+DEZmzANhNRUeMH7lF5vCitYhRHnWt8Ear7BM0S1W+OQuwoWXGfjwqbeObGc3a4I
	 d2aIeAPXm1bNrRNZgFdPo3GzSsl+vfRaXbiCAQRrrtuFnPBRbKMwfQly3DYDcLGxui
	 7YqC/FAzkxrWeawqlYA40/krT8CaP8/nQszI0lcUZBhJJA2R33izbHKE6ENYK5sMdA
	 1K6Q9W5Ypu5GM2GvZ4n+mENKvCFNB7cNH/Qld0BS+yPe/BaPuP01SzlM/vt+VhVQoY
	 v5SN4TVSe9+TMGD2R1WTTl6YUtlCaGm1byzXsZqu7/yNigIr/6YUgqYLPMrRm7Tnf4
	 u4k4zJoJK3rhA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 851E93809A1A;
	Sat,  7 Feb 2026 04:40:11 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next v2] net: ti: icssg: Remove dedicated workqueue
 for
 ndo_set_rx_mode callback
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <177043921032.1189128.16023595822783523466.git-patchwork-notify@kernel.org>
Date: Sat, 07 Feb 2026 04:40:10 +0000
References: <20260205-icssg-prueth-workqueue-v2-1-cf5cf97efb37@gmail.com>
In-Reply-To: <20260205-icssg-prueth-workqueue-v2-1-cf5cf97efb37@gmail.com>
To: Kevin Hao <haokexin@gmail.com>
Cc: netdev@vger.kernel.org, danishanwar@ti.com, rogerq@kernel.org,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, m-malladi@ti.com,
 jacob.e.keller@intel.com, vadim.fedorenko@linux.dev, h-mittal1@ti.com,
 horms@kernel.org, byungchul@sk.com, elfring@users.sourceforge.net,
 linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260206_204016_558626_397804CD 
X-CRM114-Status: UNSURE (   9.77  )
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

This patch was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Thu, 05 Feb 2026 14:25:09 +0800 you wrote:
> Currently, both the icssg-prueth and icssg-prueth-sr1 drivers create
> a dedicated 'emac->cmd_wq' workqueue.
> 
> In the icssg-prueth-sr1 driver, this workqueue is not utilized at all.
> 
> In the icssg-prueth driver, the workqueue is only used to execute the
> actual processing of ndo_set_rx_mode. However, creating a dedicated
> workqueue for such a simple use case is unnecessary. To simplify the
> code, switch to using the system default workqueue instead.
> 
> [...]

Here is the summary with links:
  - [net-next,v2] net: ti: icssg: Remove dedicated workqueue for ndo_set_rx_mode callback
    https://git.kernel.org/netdev/net-next/c/b6e2db0ed9b9

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



