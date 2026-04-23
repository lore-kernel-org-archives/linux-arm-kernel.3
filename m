Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B587F9936B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Apr 2026 10:50:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f0fdzmxU8YfuAWaMqai29dgANO/jKXm8VFbNVoHKDHU=; b=ykAlMrMgIddpz3bDr6JzemwWem
	DtXL6lwYcno876ktjNpoMDdlZAp+Q3l5AUU8HwNFkCO7Q1gwaUCT7JlFkQ5fMzvKBHZXweIH+HVfG
	K0iWfS51PJ6l1IEny7JNPhy6PNm1VxZo1HU3mG2jvF60J06pJ+05QNm7lgi4dIP7XdotD5ZxQ1vF/
	iAxJEmJ0A4v3TA7Lu/601apbhiWmTZdVCNpVse1wtAby4aLqdWZLaFAd34l4/50a/quYhIzm+RjLC
	ILQdF06hsK2xD14M+9tIMK2RMyfzulLczm+NByXRQtNj/e/T/YcJcSA5GAgByCpTIHx6JrLT/2niE
	abSqiXwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFre2-0000000BVDB-0PGe;
	Thu, 23 Apr 2026 10:50:54 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFrdz-0000000BVD1-3s45;
	Thu, 23 Apr 2026 10:50:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id A295760125;
	Thu, 23 Apr 2026 10:50:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52E6DC2BCB2;
	Thu, 23 Apr 2026 10:50:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776941449;
	bh=OoQqwn2Iom7hNKT4z8ZQdCpip2kOL8Jkaka02RiKb3c=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=dH6bjqKIYbxUSinZQaMk4rNByUSI11UsgfVAvZxk/SOQM9DNSYbCxJuvR+3fOTQ4i
	 zBHLinJ2iRmExO9ERrcWOxzoQk1aFXcitbdSfUHQbaoUVcv37rOdwekTq+NzeWQX9b
	 ZOVhezlNPkwitrF1NnyvskTVkPdMgXSTB114B0ET3ZmzDfbE3XhSNyTKIcOys1ytWu
	 4Qsx8ZpPphF5x+TmkR+GTsiSWxNcPz1+tiFI3C13bWqJDRi7ShoHBIpj18SfydrTnI
	 Hp6joLSONp77J1YZSDM8jgE5UF6gGwnmo3IMtMjQFehthzEjoip0LoH93noN1b7/Dd
	 ZfTPeT4aOJgeQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 3FD93380CFFD;
	Thu, 23 Apr 2026 10:50:12 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net v2 0/2] net: airoha: Fix NULL pointer derefrences in
 airoha_qdma_cleanup()
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <177694141104.106550.318427383838791397.git-patchwork-notify@kernel.org>
Date: Thu, 23 Apr 2026 10:50:11 +0000
References: <20260420-airoha_qdma_init_rx_queue-fix-v2-0-d99347e5c18d@kernel.org>
In-Reply-To: <20260420-airoha_qdma_init_rx_queue-fix-v2-0-d99347e5c18d@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, horms@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
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

This series was applied to netdev/net.git (main)
by Paolo Abeni <pabeni@redhat.com>:

On Mon, 20 Apr 2026 10:07:46 +0200 you wrote:
> Fix two possible NULL pointer derefrences in airoha_qdma_cleanup routine
> if airoha_qdma_init() fails.
> 
> ---
> Changes in v2:
> - Move page_pool allocation after desc list allocation in
>   airoha_qdma_init_rx_queue()
> - Move netif_napi_add_tx() after irq desc queue allocation in
>   airoha_qdma_tx_irq_init()
> - Link to v1: https://lore.kernel.org/r/20260417-airoha_qdma_init_rx_queue-fix-v1-0-db9fa5e468e5@kernel.org
> 
> [...]

Here is the summary with links:
  - [net,v2,1/2] net: airoha: Move ndesc initialization at end of airoha_qdma_init_rx_queue()
    https://git.kernel.org/netdev/net/c/379050947a18
  - [net,v2,2/2] net: airoha: Add size check for TX NAPIs in airoha_qdma_cleanup()
    https://git.kernel.org/netdev/net/c/4b91cb65789b

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



