Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9FE4C021AD
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Feb 2025 02:21:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dWhyf/mIS4S54437JZI8WoZ9NsQu/7bL+L062bk/878=; b=K/iburWKxLIIZ/6nPDS1xRxa/n
	mOucxEfMbl/uygj4OtfOaHRTkfCX4DLmtgtWqnAVNEDVV3pzqKp6CZkl6flSrWy+KMywA2FFbH4L+
	YPeeiWLY1ywlyvewDBpIaGcQ+GI+Xj/3TcWPuSlArp5HXNJ6eB9sE2FeMz4bCE4aq8YEzJvJlQad5
	JiczRFUga/5X5hHn2G1LmmnP/hOseZid/kbGRCRv8ywPt/mbyUFLdMlZ2Zn5n4hvx7MFgln2g0+lR
	FZlu8pUMAvVEtqq/P4K6QOrctDFhBVlhfn14+wf1m0ACpU11RxVvFMjnw0v78MBZh7IUI0mbuY3CG
	m3By4JQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkZid-0000000AdoW-0WEX;
	Wed, 19 Feb 2025 02:21:47 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkZh9-0000000AdWx-3MnM;
	Wed, 19 Feb 2025 02:20:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id CE3E55C49F8;
	Wed, 19 Feb 2025 02:19:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D15DCC4CEE9;
	Wed, 19 Feb 2025 02:20:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739931614;
	bh=DswjrUyYsDs3+IZvhRKtKvmN18DdCWY7JhrEcaJjCb8=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=AmOD3FEZyF4CnPgWxvicEIk6Zt20e8cNsH7oM6uYr263aqvyFqC96juyH7aDHslcI
	 Z8peFyH+1Jyv3diFZlC8aMWBg2zYGpM5BGC7rLwgr5GELGVIv+ipZBbEWnMymRd8nP
	 k4We1fErCUA1E+FyIbtazhGvr2MVjYoLeuTrBugh1TkiNlIq/bAz8XYtX3N14UwCwb
	 7cmBhO/gTO4vDrl8QzQXre+EU5vUgVeHX46EsuJdeLb+7R18vxDzCnmwEq85jbohDp
	 TQr/5u7gDssMkmNfp4gXLUfxFD1cB/Ismiv35es1Ns57LhfvlgUxKMEjzJkJJhan9w
	 QSIWNN9tpu5gQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 70CDE380AAE9;
	Wed, 19 Feb 2025 02:20:46 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next v4] net: ethernet: mediatek: add EEE support
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <173993164504.106119.18028680299291793484.git-patchwork-notify@kernel.org>
Date: Wed, 19 Feb 2025 02:20:45 +0000
References: <20250217094022.1065436-1-dqfext@gmail.com>
In-Reply-To: <20250217094022.1065436-1-dqfext@gmail.com>
To: Qingfang Deng <dqfext@gmail.com>
Cc: nbd@nbd.name, sean.wang@mediatek.com, lorenzo@kernel.org,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, linux@armlinux.org.uk,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250218_182015_893558_36C12CCC 
X-CRM114-Status: UNSURE (   9.72  )
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

This patch was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Mon, 17 Feb 2025 17:40:21 +0800 you wrote:
> Add EEE support to MediaTek SoC Ethernet. The register fields are
> similar to the ones in MT7531, except that the LPI threshold is in
> milliseconds.
> 
> Signed-off-by: Qingfang Deng <dqfext@gmail.com>
> ---
> v4: fix build warning
> 
> [...]

Here is the summary with links:
  - [net-next,v4] net: ethernet: mediatek: add EEE support
    https://git.kernel.org/netdev/net-next/c/952d7325362f

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



