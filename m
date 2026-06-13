Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5DE0CD8CA8
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 13 Jun 2026 23:00:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OL0xJg9TGrHcjEJfmk3cEN8r9HyvxoLtpxe2HvO86kA=; b=phP9ppjNN5GvMqOgzhsLL0xAA5
	FHjtK984zBP/KaCcE32FKXquyVFYVLuFpdC9JLYZVy6mynG3axEwUpcZfMqtrsfqc57AXZHk1gp+O
	jKBh6qAWDptxrKwoM23g1hikBhYehzePAse9YCgBCoO10cKJ3cO8HyDU2jcnhsjQzoFWg2mb4R/Gh
	UV12GLIZiJCkan+CDdfcRx1PWMc6dst8dedJxAulvyKkUc50NUanBJcI33p/rV5mIcoRKDG23OfOw
	hg+KvcB0H3VkocERo+rBMvNJ6YdizrB0tbd1qnfbndor+WWgu0+1IoteyB51epqCpB55GLhU/65Bj
	a/HT1GCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYXKs-0000000CbCj-0Dkq;
	Sat, 13 Jun 2026 23:00:18 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYXKm-0000000CbAs-3fAO;
	Sat, 13 Jun 2026 23:00:12 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id A0E3B444A2;
	Sat, 13 Jun 2026 23:00:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 828A91F00A3A;
	Sat, 13 Jun 2026 23:00:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781391612;
	bh=OL0xJg9TGrHcjEJfmk3cEN8r9HyvxoLtpxe2HvO86kA=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=nLDiCic8tXhbtDHtLCwUYQiIve22BfmTErq50vy3chAmEm9dP/uwQT6gcNLWEd5YI
	 veLro4/RlOLvBP4hnkQtj8F5siX4sXi71vW0h1L7Z3xTPsWdT5hYM0wEL4sNV+SlsQ
	 wmrYKGsPdSVO6vutfzncLNK+UPmDdYAtsgzJcnfqpeNZYng0GnIJKYzkAUbwI6g+Ko
	 GIIs6jlcaRSTPjQNT6KZLrL8WbgflorWzjMCRAKT5YELdT1IuC8j7nT3AhDWif+Mfr
	 TIUhAfvV5fSMtHakzxadwd3pMttoy80RCCx+xFMfGWGqwlj99hz9P9OQDV8XxVaPZv
	 JNKOpPmHTccJQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id D09283A54A32;
	Sat, 13 Jun 2026 23:00:09 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v2] net: airoha: Fix debugfs new-tuple display for IPv4
 ROUTE
 entries
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <178139160838.1619194.4028591531296512566.git-patchwork-notify@kernel.org>
Date: Sat, 13 Jun 2026 23:00:08 +0000
References: <6a2be54b.ef98c1b2.3c3224.2ed8@mx.google.com>
In-Reply-To: <6a2be54b.ef98c1b2.3c3224.2ed8@mx.google.com>
To: Wayen.Yan <win847@gmail.com>
Cc: netdev@vger.kernel.org, lorenzo@kernel.org, horms@kernel.org,
 pabeni@redhat.com, kuba@kernel.org, edumazet@google.com,
 andrew+netdev@lunn.ch, angelogioacchino.delregno@collabora.com,
 matthias.bgg@gmail.com, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
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

On Fri, 12 Jun 2026 07:09:56 +0800 you wrote:
> In airoha_ppe_debugfs_foe_show(), the second switch statement falls
> through from PPE_PKT_TYPE_IPV4_HNAPT/DSLITE to PPE_PKT_TYPE_IPV4_ROUTE,
> accessing hwe->ipv4.new_tuple for all three types. However, IPv4 ROUTE
> (3-tuple) entries do not contain a valid new_tuple — this field is only
> meaningful for NATted flows (HNAPT/DSLITE). For ROUTE entries, the
> memory at the new_tuple offset holds routing information, not NAT data,
> so displaying "new=" produces garbage output.
> 
> [...]

Here is the summary with links:
  - [v2] net: airoha: Fix debugfs new-tuple display for IPv4 ROUTE entries
    https://git.kernel.org/netdev/net/c/1c3a77471afb

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



