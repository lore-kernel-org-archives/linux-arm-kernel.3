Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72FACC5B555
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Jun 2025 11:16:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ckJ4mHtJIMmGBE35V1AtBrC8Ak4AbFGvv92e3Dez+cw=; b=oJvokH0A+j4BIzz4zu5bHMgCcx
	FXITOUYlnXv1a49n3Kdn5gTwk/PlYKYYSrhG/6xXZPF1wvPVs8cPIdoGFW8VX6sC18sFjngrl+mxt
	7wj179lBE8voccUh+Nx6pZ+nefaAyjJPtKV5xxkdM1Sk0m5y8hrzUT3GmvmaQDRCRayWPDvmetAqN
	SqVepBp+x9Lh8XUJix9w8X0hIydr5SSWnvuqF0aQAT+RWL1kfz2v0tAj+BUCTFYUj5b6WhAtd4IyW
	LBmhN73lg6G8LocLM7Qmlh72TYzXrum+vYXxUfDFQnWG9AwHV6veMg6liRVgOhvwrKcnEwiC1aPeP
	1VkZAREA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMPcm-0000000Am5D-2RXa;
	Tue, 03 Jun 2025 11:16:08 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMPWq-0000000AkyW-3TnR;
	Tue, 03 Jun 2025 11:10:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id DD387A4FEBD;
	Tue,  3 Jun 2025 11:09:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86404C4CEF0;
	Tue,  3 Jun 2025 11:09:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748948999;
	bh=13JMKJlvXaJzjrdB79q+eXqwSefPGce7G8wAUQSTfDw=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=min/+KWm96g96MYFDVZdeW6AbX3GtSGU/+0qPZA/4qwJW1YQv8/z51dTh7IAExuKm
	 frdxlnBk+Ws0tW720L9ZB8Od2TstEU6CEFWEayq9ea8BhtCVdTA4Vamx6j346n6YuQ
	 Ts6tp7DzCvjtofl2xdsg59pEtYeoUxhO6lNK+1lsjgMU+/Bl1MvDwGlST850yNEZ1N
	 NHfMFeFnwa34/7VgWwiNT3bcrEKusA6sEbUKvhYVaqCZYxQvef83ieowxgTCuN4GOo
	 kMF941e4doVJOMHPWGsCLDGchUmbbukI79mqn8QIYgJcadUeGuOcL85TW6cwMguyJ/
	 ncCcDyAfSgjQQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33C60380DBEC;
	Tue,  3 Jun 2025 11:10:33 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net v2 0/3] net: airoha: Fix IPv6 hw acceleration
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <174894903200.1469579.2031889211838000906.git-patchwork-notify@kernel.org>
Date: Tue, 03 Jun 2025 11:10:32 +0000
References: <20250602-airoha-flowtable-ipv6-fix-v2-0-3287f8b55214@kernel.org>
In-Reply-To: <20250602-airoha-flowtable-ipv6-fix-v2-0-3287f8b55214@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, michal.kubiak@intel.com,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 netdev@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250603_041000_955956_D1BC0CF2 
X-CRM114-Status: UNSURE (   7.96  )
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

This series was applied to netdev/net.git (main)
by Paolo Abeni <pabeni@redhat.com>:

On Mon, 02 Jun 2025 12:55:36 +0200 you wrote:
> Fix IPv6 hw acceleration in bridge mode resolving ib2 and
> airoha_foe_mac_info_common overwrite in
> airoha_ppe_foe_commit_subflow_entry routine.
> Introduce UPDMEM source-mac table used to set source mac address for
> L3 IPv6 hw accelerated traffic.
> 
> 
> [...]

Here is the summary with links:
  - [net,v2,1/3] net: airoha: Initialize PPE UPDMEM source-mac table
    https://git.kernel.org/netdev/net/c/a869d3a5eb01
  - [net,v2,2/3] net: airoha: Fix IPv6 hw acceleration in bridge mode
    https://git.kernel.org/netdev/net/c/504a577c9b00
  - [net,v2,3/3] net: airoha: Fix smac_id configuration in bridge mode
    https://git.kernel.org/netdev/net/c/c86fac5365d3

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



