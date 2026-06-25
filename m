Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A838CDB479
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 25 Jun 2026 01:09:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SR00w6A5zWYfAEbQPEd3oeGOwxQRYDWbhdXlng9kzSA=; b=0oEwdiRjKdienxziU41/cqygHL
	ELNMNxw6E6FRAHlMyPCA1TrPoaA7FoxNxoxRf4Iui1u78KeApwxfUBnBLBUFME30unF3HtcKqS6o2
	2LWLCTJHs07dZju6mcezBBzmJrwo1I9k664PE0z1PgReofX1jSAYXVrVMc8jU8FbI+NdGU8q2OcOS
	8ax0DYIyTFOHZrKi6myKmNbFs8JmTFsfSTrR6DgmG+KErx8dHLlqUiYxOa/SHK5yQHmsT9U0l0m1M
	TYMEPgZY5s+X2MYzIXWI0ZwiAQ/Kd2dTWu9lyLj+VDTv0Q7OVQGiF95EhyZG3LeqtJwK0ZN9XMKc6
	KUqDsJtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcYaf-00000008VAh-05Z1;
	Thu, 25 Jun 2026 01:09:13 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcYae-00000008VAR-0Y1x;
	Thu, 25 Jun 2026 01:09:12 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 3706244474;
	Thu, 25 Jun 2026 01:09:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 175611F000E9;
	Thu, 25 Jun 2026 01:09:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782349751;
	bh=SR00w6A5zWYfAEbQPEd3oeGOwxQRYDWbhdXlng9kzSA=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=RA4fsZWBhKQH+pZEDRRvOwuEaEU1/nCJImq0Nc5swcASjXbxlET8hsMugm9oPGc/o
	 h7DmlD+wjHPH6RdI4KJtCbjibTw5l66awjIkIMF6+g1zcFXn8K41eb/4est/xTGnId
	 KUdXMy/CZuSuuot3TBJZ43f61Ku0sDlgOWqgMJeG3H48ebvejO5bik4QkKLsIWS4fZ
	 9mIuKUTBwhRXvKcZPBNcMguYOuPW9Mldzcu0w9y56fns4B23j6Umy8T6r8oTHS519b
	 2TO902i6fFmui35Z7CXv+HP5FAZ4yYox1qbdp1nnfGvfhdhQspf1LAMgJh3+aO3taX
	 TALqNqVzaumZw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 9398F3AAA0F5;
	Thu, 25 Jun 2026 01:09:00 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net v2 0/2] airoha: fixes for sched HTB offload support
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <178234973905.3045401.18000176756611441601.git-patchwork-notify@kernel.org>
Date: Thu, 25 Jun 2026 01:08:59 +0000
References: <20260619-airoha-qos-fixes-v2-0-5c43485038f9@kernel.org>
In-Reply-To: <20260619-airoha-qos-fixes-v2-0-5c43485038f9@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, horms@kernel.org, win847@gmail.com,
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
by Jakub Kicinski <kuba@kernel.org>:

On Fri, 19 Jun 2026 13:37:12 +0200 you wrote:
> ---
> Changes in v2:
> - cosmetics
> - Link to v1: https://lore.kernel.org/r/20260618-airoha-qos-fixes-v1-0-37192652157f@kernel.org
> 
> ---
> Lorenzo Bianconi (2):
>       net: airoha: Fix off-by-one in airoha_tc_remove_htb_queue()
>       net: airoha: fix netif_set_real_num_tx_queues for sparse QoS channels
> 
> [...]

Here is the summary with links:
  - [net,v2,1/2] net: airoha: Fix off-by-one in airoha_tc_remove_htb_queue()
    https://git.kernel.org/netdev/net/c/bfcce49c4aaa
  - [net,v2,2/2] net: airoha: fix netif_set_real_num_tx_queues for sparse QoS channels
    https://git.kernel.org/netdev/net/c/788663dd28e4

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



