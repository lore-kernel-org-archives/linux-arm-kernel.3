Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 969B2CA5FC1
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Sep 2026 09:30:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sjcvPJp7qyZH0h3JFK+CWWKeG5u1wLGWfMiMgytCi04=; b=o01kOyRKymtUNZh0iJ4AAyoM0f
	uLezV69ztzbdczANiPwVmOCE9nAFsf6oKBkARHepuj4pncfxRjNPTxRLBSRCloJU/XNa2VhXpQ2Mp
	DVDLJX/Kg2tRYg6Yao1hw26mydWAefhkTlo2e32XNw8PZo0Dfxkis/AzhwANYPDVT9tTWzetns4Lk
	ISZqgA3A9UhXb1vV16eDdybzrXtkKBRW0PBqSdXKSeShEd709rc/t3gIDl1GnMAfkT6wsD2lyztBm
	MdAFHYAc3+RThCoQ5wTZ/TyxGxQ2qkg2xHT9Lu0qXMU/I/JMrqZsPVUkwD2QwvQ+1xqYh2ASNMg1f
	Nlqy3AgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBqdc-00000005ZEU-1qlT;
	Wed, 30 Sep 2026 09:30:08 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBqda-00000005ZE5-2m8B
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Sep 2026 09:30:06 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 2931243587;
	Wed, 30 Sep 2026 09:30:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 093EC1F000FF;
	Wed, 30 Sep 2026 09:30:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790760606;
	bh=sjcvPJp7qyZH0h3JFK+CWWKeG5u1wLGWfMiMgytCi04=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=MfiuQkLMXkOGZdjhSEbkKgTPxjYzwXeHltydpcOEmEDR4aAIMnmP85nbzuzRzzIg/
	 JxNuVOmHcOz1c1szwrKa7SaqVYhnX/eR6etlI1O+kdK5ZoHN4mVv8ZjUrWbg/XpPKa
	 RtnVIftgurHWBkaciOqj2MPLhjbW03y5UZnQMgGHPmrThlOWbGv9MG4fqhfIzsYEVy
	 ZRdXRG1W+LlO6LIQE+bQ4u9IoSZFafd2fBB2aVst5Qf7zFwrlktIrCOiwqB1RjMqUB
	 V7sdRYb4kn/Plj3kd6RmXQBzkKeo5rCgMvq3LD7/ppUR/hVXTGa6X1ROw+4wdu8/OE
	 uTprwJW2Fv1Og==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id F154A39E8A7B;
	Wed, 30 Sep 2026 09:30:05 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] net: microchip: vcap: stop scanning after deleting key
 field
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <179076060478.1357769.13599525229018760574.git-patchwork-notify@kernel.org>
Date: Wed, 30 Sep 2026 09:30:04 +0000
References: <20260925063937.963430-1-harshit.m.mogalapalli@oracle.com>
In-Reply-To: <20260925063937.963430-1-harshit.m.mogalapalli@oracle.com>
To: Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>
Cc: Steen.Hegelund@microchip.com, daniel.machon@microchip.com,
 UNGLinuxDriver@microchip.com, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
 error27@gmail.com
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
by David S. Miller <davem@davemloft.net>:

On Thu, 24 Sep 2026 23:39:36 -0700 you wrote:
> The only call outside the KUnit tests is in
> sparx5_tc_add_rule_copy(), which passes a fixed key list with no
> duplicate entries. Therefore, the potential double-free is not
> currently reachable in tree.
> 
> However, vcap_filter_rule_keys() is exported and does not require its
> key list entries to be unique. If a future or external caller supplies
> the same key at another position that the inner loop visits, it calls
> list_del() and kfree() a second time on the freed field, leading to a
> potential double-free.
> 
> [...]

Here is the summary with links:
  - net: microchip: vcap: stop scanning after deleting key field
    https://git.kernel.org/netdev/net/c/99b43ede9e35

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



