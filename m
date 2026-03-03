Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE669E67A63
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Mar 2026 04:47:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jSjzSYJ/el4uctBudHxQVjWXZjDcOAe24JGPJOzk8Ys=; b=UkpsL2Ag7wBurTVsFvU2lnpRSU
	mGaZ2M20dI/fZIQze0cRKD85g7mqS2M5QnTsEYI4Z0h7FkyHpM9d3gS8vK5I9koFGFKElFLNqg+S1
	cK3ctpkCzF6rahDtS1We+8Rxh48qq07TSN6abtOvHrSDi/npBMy7yWICRNwrEkpC8Zen8g01SNnJ+
	akR83giJHz3JeATWVOKY1fMgqWIW1C8M/BcIaPJRN66hauBW0ztZOIntZ/nF36SQzXZyt9/Witp3N
	5oV1ILq2FeFqmxXJ1qX0jPCSQzhk80X4z4S/opnkLbkb4bsvd68kwDv5AYicUKytUZdoVHrRzmCDM
	XzbD5npQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxHeu-0000000EVq1-21jo;
	Tue, 03 Mar 2026 04:47:00 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxHet-0000000EVps-03GD
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Mar 2026 04:46:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 8016E600AE;
	Tue,  3 Mar 2026 04:46:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E04FC116C6;
	Tue,  3 Mar 2026 04:46:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772513217;
	bh=bqq+HE4FBe0fKsVqSm7v5/lJc9pFDuDowz8zZZkp54Y=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=KwjAgncIblxLQfFjjsK6bj2NgBGLE5GGK4qN7QUQH2dvju7S6POP6WJ5Htc7JHA/e
	 8eCc1msP27KZ7GVbQc+2yO56QjlP2I1N+oIwRdMwKee6PqjPN4H8vboagwxSwezAT0
	 8ZBy1/YX5AZw9ywJFYgVErwhaLR/ooUDodyTv2CAKbF3/CxsHThZ4JhjA/tRVAg8h5
	 5nsmmKlg+YOFQptX8RYHEGClhoYHwY5Deq3Hr6+gmkLpOY4az7Z7dKBhR/L8Rv/F3J
	 Yaz5MfKZWx9xa5bjm5AMZRF4IydfTXhWbov6CjoU/zu2Vj0GmPceIu1D/UOjW6zo2x
	 BhR273ZQyZJGA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 02E623809A80;
	Tue,  3 Mar 2026 04:47:00 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next v2 0/9] net: sparx5: clean up probe/remove init
 and deinit paths
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <177251321859.625663.7210895565494108353.git-patchwork-notify@kernel.org>
Date: Tue, 03 Mar 2026 04:46:58 +0000
References: <20260227-sparx5-init-deinit-v2-0-10ba54ccf005@microchip.com>
In-Reply-To: <20260227-sparx5-init-deinit-v2-0-10ba54ccf005@microchip.com>
To: Daniel Machon <daniel.machon@microchip.com>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, Steen.Hegelund@microchip.com,
 UNGLinuxDriver@microchip.com, richardcochran@gmail.com,
 maxime.chevallier@bootlin.com, rmk+kernel@armlinux.org.uk,
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

This series was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Fri, 27 Feb 2026 15:56:38 +0100 you wrote:
> This series refactors the sparx5 init and deinit code out of
> sparx5_start() and into probe(), adding proper per-subsystem cleanup
> labels and deinit functions.
> 
> Currently, the sparx5 driver initializes most subsystems inside
> sparx5_start(), which is called from probe(). This includes registering
> netdevs, starting worker threads for stats and MAC table polling,
> requesting PTP IRQs, and initializing VCAP. The function has grown to
> handle many unrelated subsystems, and has no granular error handling —
> it either succeeds entirely or returns an error, leaving cleanup to a
> single catch-all label in probe().
> 
> [...]

Here is the summary with links:
  - [net-next,v2,1/9] net: sparx5: move netdev and notifier block registration to probe
    https://git.kernel.org/netdev/net-next/c/b8909aad5b8d
  - [net-next,v2,2/9] net: sparx5: move VCAP initialization to probe
    https://git.kernel.org/netdev/net-next/c/3a95973e7c79
  - [net-next,v2,3/9] net: sparx5: move MAC table initialization and add deinit function
    https://git.kernel.org/netdev/net-next/c/13cb1b68842b
  - [net-next,v2,4/9] net: sparx5: move stats initialization and add deinit function
    https://git.kernel.org/netdev/net-next/c/e180067a03ca
  - [net-next,v2,5/9] net: sparx5: move calendar initialization to probe
    https://git.kernel.org/netdev/net-next/c/274182ff34fd
  - [net-next,v2,6/9] net: sparx5: move remaining init functions from start() to probe()
    https://git.kernel.org/netdev/net-next/c/cdc374359fe8
  - [net-next,v2,7/9] net: sparx5: move PTP IRQ handling out of sparx5_start()
    https://git.kernel.org/netdev/net-next/c/0432c60112b4
  - [net-next,v2,8/9] net: sparx5: move FDMA/XTR initialization out of sparx5_start()
    https://git.kernel.org/netdev/net-next/c/8b1e4a6747b8
  - [net-next,v2,9/9] net: sparx5: replace sparx5_start() with sparx5_forwarding_init()
    https://git.kernel.org/netdev/net-next/c/1e540c4d8f32

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



