Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9AB1C369CB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Apr 2025 01:52:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A2rSncuWJmG5TRj0ydDHEcM9iT/ZWLPSphWRD7EqlEs=; b=u7P4s/2UDsKiO0g+5DXa7rD/TB
	4iHPsUabdlC5bwL37cIgPVKVjhxAh6v/BTzG83Ybj2OJ9Y0XoE1j9yfJR67JvNKspB2G9RC71xVY7
	VN0CraoUN8du0SYTRKVjxJDcwYS0cpRGY7qMXvd9bZW9Ev3ZKXSpYrSiNZYtOdSLN5IlMQJm7B0yr
	MkU/MMeawfGtVn1YJrKXRaWEgP9Imndi7doaIGIyysCiDYSii4y0NJkReNbV2kw58oJVHy3YeYyPO
	fRscFu5CGHFcdyUZ4n32oMEMPrUlRjVmfbxzMT8BDWxgoisSnDrtIBTpzLX7pYoaCqAnOf8Qw+/OC
	HJ0dWkew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7lks-0000000CZWa-16hv;
	Thu, 24 Apr 2025 01:51:58 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7lip-0000000CZ78-2oDg;
	Thu, 24 Apr 2025 01:49:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id C03125C593C;
	Thu, 24 Apr 2025 01:47:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75A68C4CEEA;
	Thu, 24 Apr 2025 01:49:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745459390;
	bh=okAdnUMdkt77fPNOGoNov2VzUCP19KzZkGl46/1y+w8=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=YIPvj4BLeYeqMXk0isir7s8Yu2WBUBo1eModjU8uNIXQn3QFOw5gaLqgkwZBTN/dd
	 OHkZKKCrB/7v0p4xQqGqKLyN8zfNfjDG/0xwxY2ODJ8eQY5fRHyhrkdEE8qa/dAK1R
	 YWPRKbovTAsm3hJkSnMwsuu6y09Ocn+F9HPZUl7J628Sx/MhnsNxEJiolbu7eVV3ZK
	 vvGDISucdRKhKXodmfxj2iH1uGOoVrmAxL7mKuTfQplKieAhtmBnxDaK8Qri5mSkQe
	 lBVqaIGkFCnkmxTDElagKq45fTO4uIlYyo1gHFNmUrJ9Gx0JnVGTmFhX08FSNXSHM9
	 Q8ckLFRJ4tMLg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33B77380CED9;
	Thu, 24 Apr 2025 01:50:30 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net] net: dsa: mt7530: sync driver-specific behavior of
 MT7531 variants
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <174545942875.2829412.8607382949348037647.git-patchwork-notify@kernel.org>
Date: Thu, 24 Apr 2025 01:50:28 +0000
References: <89ed7ec6d4fa0395ac53ad2809742bb1ce61ed12.1745290867.git.daniel@makrotopia.org>
In-Reply-To: <89ed7ec6d4fa0395ac53ad2809742bb1ce61ed12.1745290867.git.daniel@makrotopia.org>
To: Daniel Golle <daniel@makrotopia.org>
Cc: chester.a.unal@arinc9.com, dqfext@gmail.com, neal.yen@mediatek.com,
 sean.wang@mediatek.com, andrew@lunn.ch, olteanv@gmail.com,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250423_184951_753080_B9EAB0F3 
X-CRM114-Status: UNSURE (   8.62  )
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

This patch was applied to netdev/net.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Tue, 22 Apr 2025 04:10:20 +0100 you wrote:
> MT7531 standalone and MMIO variants found in MT7988 and EN7581 share
> most basic properties. Despite that, assisted_learning_on_cpu_port and
> mtu_enforcement_ingress were only applied for MT7531 but not for MT7988
> or EN7581, causing the expected issues on MMIO devices.
> 
> Apply both settings equally also for MT7988 and EN7581 by moving both
> assignments form mt7531_setup() to mt7531_setup_common().
> 
> [...]

Here is the summary with links:
  - [net] net: dsa: mt7530: sync driver-specific behavior of MT7531 variants
    https://git.kernel.org/netdev/net/c/497041d76301

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



