Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7403EC87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 Aug 2025 21:22:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lGoKNyU/DP1+F+NdarvWyN8xwWYaLDLYHl9HaCLP4dQ=; b=3rfZYBLOix5EplT/tnkwHfHb0D
	VTYraTA+kFHfkaUWSJ7KBtxWCwv+Vdc50gPyF5ejld5IzGqqRPs8P3tjgKBJLK4D9be9dsxUgmgTB
	awyPXIdFBVtAJfsEQcG8BIuxC4A4HoFegmcZjHHNfuql5ZJ9RWbZOgrVAPLtrmXOvn0+0G7nrUesy
	YyVydS0K+y7a0gcGnsg1MkroHV5UPJhW9qg7YENEqXlOK/ITbc2RLoja0mZykO2E6u+I48LtLmVI2
	lkeSw9gp9liknbaYvaLb6RXzOUmRQ24Kg8yDQDyqj/65QpCiwwUj7fGtlBvseUm7zdZEPmst3sP9V
	zaF3F/oA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhxD1-00000006oys-1jz7;
	Fri, 01 Aug 2025 21:22:35 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhxAS-00000006oiO-1nFV;
	Fri, 01 Aug 2025 21:19:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 718C745C5D;
	Fri,  1 Aug 2025 21:19:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45C84C4CEF8;
	Fri,  1 Aug 2025 21:19:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754083193;
	bh=zw7q6QujQeHuGeDv2YbOW+aFGXe0we/oA8BPQwe+9xk=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=UUk46MMZrJgYNzibf7Uy3NTHP9igR/B7nxY/hIG4nfJbcqFa95s2zL/ucrYmcu7uE
	 OxLgD94U0ZpDhgfcGw6qFpT3Usv48XnnhdAUGeMU7NcqgIpmlvPvONtMHDMuHXRMuN
	 4sQHg5bb8IKlUe5y5bbMtJ6dmvxE4tBes5YB8QrvVCR3yrp27YYWJ6RWH5vu6lrZ/T
	 WSQ8mcTdKR5hWF0fGn2i0OZz5R6wif4Vauu3n0TuVgVUB34hCWBiRahqvn+Piljbtz
	 bXOOSoW8JAwJgsdDS289371PXm8/qE85yiVvuXO9Bevu98HG1iZ2TTO6+mpT57MZFY
	 TucigeKJs3Huw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id C6971383BF56;
	Fri,  1 Aug 2025 21:20:09 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net v2] net: airoha: Fix PPE table access in
 airoha_ppe_debugfs_foe_show()
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <175408320875.4079639.16331280350179780525.git-patchwork-notify@kernel.org>
Date: Fri, 01 Aug 2025 21:20:08 +0000
References: <20250731-airoha_ppe_foe_get_entry_locked-v2-1-50efbd8c0fd6@kernel.org>
In-Reply-To: <20250731-airoha_ppe_foe_get_entry_locked-v2-1-50efbd8c0fd6@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, netdev@vger.kernel.org,
 dawid.osuchowski@linux.intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250801_141956_489026_665CA5D5 
X-CRM114-Status: UNSURE (   9.11  )
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

On Thu, 31 Jul 2025 12:29:08 +0200 you wrote:
> In order to avoid any possible race we need to hold the ppe_lock
> spinlock accessing the hw PPE table. airoha_ppe_foe_get_entry routine is
> always executed holding ppe_lock except in airoha_ppe_debugfs_foe_show
> routine. Fix the problem introducing airoha_ppe_foe_get_entry_locked
> routine.
> 
> Fixes: 3fe15c640f380 ("net: airoha: Introduce PPE debugfs support")
> Reviewed-by: Dawid Osuchowski <dawid.osuchowski@linux.intel.com>
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> 
> [...]

Here is the summary with links:
  - [net,v2] net: airoha: Fix PPE table access in airoha_ppe_debugfs_foe_show()
    https://git.kernel.org/netdev/net/c/38358fa3cc8e

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



