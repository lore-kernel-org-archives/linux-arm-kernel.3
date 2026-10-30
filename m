Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C22CE606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Oct 2026 23:20:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=AhmJUMAQ;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JYhDfDdT
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=YquaAYk5D/ZosrhPBkdkrqLrp23/+y9lm6zoH1BKULs=; b=AhmJUMAQi+sMML
	qoPylA0+XhBbrGINzq/RxUk78QZvWI3GDnLgrmDSgZ/epohBW5cRxOgtOu3Ll9OLYPuBF0Y8ALILf
	PAz36XtWOtTrnloM/rdL6MidWLLP1dPOYdbHY6kBScwZ7gL7Kd1MPuDnyYeA6NMckKq8FFfX+CWX/
	KrSSOOF9NhubarP6y0Pfvh6srDJcc1DYbghzl7qxDM2SegO6htFF1vAcL+eZP6EYs/jsNADrkugzI
	nXtHAST0u0LAy0WRER/wZxAEp3s8EWYSQo3HxkxX5fZDbhEBH+L0u1mNr4besLmogSTvKmnTuPW4M
	tpwTmLsmzgis81qaH9WA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMvtW-0000000Cira-0o1J;
	Fri, 30 Oct 2026 23:20:22 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMvtV-0000000CirR-1SGV;
	Fri, 30 Oct 2026 23:20:21 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 21F7F601F8;
	Fri, 30 Oct 2026 23:20:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C54021F00A02;
	Fri, 30 Oct 2026 23:20:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793402419;
	bh=YquaAYk5D/ZosrhPBkdkrqLrp23/+y9lm6zoH1BKULs=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=JYhDfDdTorJRcAHfHgN/bI6zq5Ow7Z8+QQah+IUfbz0iPAbOqW9XES4nnoSzH9Bdz
	 4tXTmHDCOJLoTsTwJg68lAYvRD0aEbuACw2Csuau4cPxaaZ4W5ts+zO47eqsbQTfCk
	 F178bqwtLIQmbdvaoCpYu8tJOb+2Qkhwp7bdT9vywyn1xfnDmC+ZTGAU8AC6H37v+E
	 dWludCJNJdvquOzWv7ROyU8DI1Ou5nz2EggV6XJlr/4jVXZA3YBiOk3U486lpk5gmO
	 nadVLfvd//k5ArMm5F1W+30wcxciktIFwbDTrN1TaOTzlGeVXuoXh44kfJqIy3I2QW
	 Km8My2z68a34g==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id BA34A3800478;
	Fri, 30 Oct 2026 23:20:19 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net v6 0/4] net: ethernet: mtk_wed: misc fixes
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <179340241829.1826218.13676561512081686871.git-patchwork-notify@kernel.org>
Date: Fri, 30 Oct 2026 23:20:18 +0000
References: <20261026-wedfix-v6-0-a52f6b15d2fc@gmail.com>
In-Reply-To: <20261026-wedfix-v6-0-a52f6b15d2fc@gmail.com>
To: Zhi-Jun You <hujy652@gmail.com>
Cc: nbd@nbd.name, lorenzo@kernel.org, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
 sujuan.chen@mediatek.com, rex.lu@mediatek.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, sashiko-bot@kernel.org
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hello:

This series was applied to netdev/net.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Mon, 26 Oct 2026 17:57:27 +0800 you wrote:
> Ths patch series includes some fixes for issues that were discovered
> by Sashiko and one original patch fixing issue I encountered.
> 
> Patch 1,2,3 fix issues that were found by Sashiko.
> Patch 1 was compiled test only.
> Patch 2,3,4 were tested on a mt7986.
> 
> [...]

Here is the summary with links:
  - [net,v6,1/4] net: ethernet: mtk_wed: skip ring reset in wdma_tx_ring_setup for WED v3
    https://git.kernel.org/netdev/net/c/cb50f16f37fc
  - [net,v6,2/4] net: ethernet: mtk_wed: fix reset condition for rx wdma
    https://git.kernel.org/netdev/net/c/7180a42d8e61
  - [net,v6,3/4] net: ethernet: mtk_wed: free up rings during detach
    https://git.kernel.org/netdev/net/c/5b8d12512cbd
  - [net,v6,4/4] net: ethernet: mtk_wed: setup WDMA_RING_TX(0) for non-DBDC MT7986
    https://git.kernel.org/netdev/net/c/dd6efae55291

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



