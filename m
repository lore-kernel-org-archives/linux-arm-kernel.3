Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1997CD8C8C
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  6 Jun 2026 01:30:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ASXWK8gh0lMnAbiPph0XBp/VyyYVnUTZVyfHxjwp+Dk=; b=XDf1yuCDTxKtS1wUvSan/cg6aM
	aGiZfAFoHjy5Ip1A+QzzjuMJjV52ZMQmwg6vS6In+CPqMGbzNOTTJzb1mI0YeiObPD6yrTF5boS+I
	lyfBkryXnILTQqkjI96HEK2GqsbsCIeXeUYPLbT7SHvnRdO/8SVLrEa5Zo8SmoXBZviY8nHPGmvmp
	J4NnBZUnNANgPd0m7Vahvjk1l+UpqgptaYS/zaxuVcftKZHS+kTLm3Tv5ObZySHrLKua8OOHw4dfA
	uJt8vCyPxbWDgjHvDpgCHGk1ZCh/kXROAycrxZhQUPBO/OxpUaHWdn6UdBPBICjHOg58FJnT4fi9E
	Wp+4B4CA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVfrU-00000001M2l-1JS7;
	Sat, 06 Jun 2026 01:30:08 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVfrT-00000001M2a-02D7;
	Sat, 06 Jun 2026 01:30:07 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 192CB43718;
	Sat,  6 Jun 2026 01:30:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ECFC91F00893;
	Sat,  6 Jun 2026 01:30:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780709406;
	bh=ASXWK8gh0lMnAbiPph0XBp/VyyYVnUTZVyfHxjwp+Dk=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=cr5+HxSNHdkS8C6KkY4HwanjvCasaX+Les4bRwAKQd31rBdAVtn7epdZmKcevyDlM
	 b8+wcRmUlZO+LYG5Uq0kHwTDRmvEHSAhOWfhgH/0HAN0wdmogGYJf1RWBZqOJH2exx
	 2/ZqKBZJG1Hxmh0FR8UZbUTnyZ207I/vgAL3TLhpLuV23KjZxODpaY/OiZAHa00i11
	 xMPy5aMOlDu6luKT9oHXhW7y2UuLf75StZGSvHWg/h0IwaZbauJGsEM/1QdF35R5rj
	 +q5+AEsvCWETARD/dJYbDMWGF3Huz/B4Z/QXLq4Vk9grHvFsYnGcDKa2tt2KTReiic
	 Qy/f9B4i24vWw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 569293930A9C;
	Sat,  6 Jun 2026 01:30:07 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net] net: airoha: Add NULL check for
 of_reserved_mem_lookup()
 in airoha_qdma_init_hfwd_queues()
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <178070940590.3983833.5638172237505353100.git-patchwork-notify@kernel.org>
Date: Sat, 06 Jun 2026 01:30:05 +0000
References: <20260604070352.2603077-1-zhaojinming@uniontech.com>
In-Reply-To: <20260604070352.2603077-1-zhaojinming@uniontech.com>
To: ZhaoJinming <zhaojinming@uniontech.com>
Cc: lorenzo@kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, horms@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org
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

On Thu,  4 Jun 2026 15:03:52 +0800 you wrote:
> of_reserved_mem_lookup() may return NULL if the reserved memory region
> referenced by the "memory-region" phandle is not found in the reserved
> memory table (e.g. due to a misconfigured DTS or a removed
> memory-region node).  The current code dereferences the returned
> pointer without checking for NULL, leading to a kernel NULL pointer
> dereference at the following lines:
> 
> [...]

Here is the summary with links:
  - [net] net: airoha: Add NULL check for of_reserved_mem_lookup() in airoha_qdma_init_hfwd_queues()
    https://git.kernel.org/netdev/net/c/f9f25118faa4

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



