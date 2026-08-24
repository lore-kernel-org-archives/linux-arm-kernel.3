Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13675C5DF9C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Aug 2026 18:21:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sETMReISMBe6rjtQEm20AuiXiK56X85vfYOV++AGSe0=; b=qS7tFRr/58ef0P2jCVtVC568at
	JMUMg0Ju7GEcF663P9v0pTyRTAUvDobAgZL4dSOwBlPksER+f3/Ly7Njjx7n/Y2cFSfWYLGJOgk0q
	2ZM8mBdixzWnFKcBU+c0zqGWJWfDvPFZf59ydUgKFjvj6vDGHei0UsiV7bxAzLxKme8E825m5UIi7
	/A7JO1rGatW95LE5m0pkM80gWfN3pDHayJqpKEjpr2bL5yYBixxSdrRAkxKNPgXXP8SFvwlE8xp9q
	bx8+eRuqeIjg9hYRqBQYr0eX3IsIaOfRTxyczBM0EV2v7+7tP1m5bgMWtQpqiE2CzRT0ojzU0o0u0
	m8rpPzfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyZIA-0000000HFUF-0Eue;
	Mon, 24 Aug 2026 18:21:06 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyZI8-0000000HFTs-2Cqg
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Aug 2026 18:21:04 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id A0805601E0;
	Mon, 24 Aug 2026 18:21:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E6021F000E9;
	Mon, 24 Aug 2026 18:21:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787595663;
	bh=sETMReISMBe6rjtQEm20AuiXiK56X85vfYOV++AGSe0=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=VrGbKR9VGsJYoffJbq9RnobYFUSqZaedkdBTA9n+E0B8M/63QpKK2qWaY6o6GUbE5
	 Yy5mFkwiYeMj6Wn2sImSQDB4h8GlwgUpFEP7LV21npHJhCrl+N/X2lwWeQVEoZUcH9
	 9rLU3chh0c8FKvVXPacPV7VED0TUFNKreWGOXHxNgCNEIoEmPv+oqx2Cid1JDfF0V8
	 ff1cnVCX1dXwwd/2ld/uu2p4CdQeCe8G7wum/2xp/v84ZK47b9UQeQZOm7Glr5nNhe
	 Kwnr8dOiinRNdnlrPCI9+kVoW42AfuMNHDPhXwHz3eFIFqzu8biPlkPmxe4OnExdTd
	 TLVmIr73BSt1g==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 0FF863924A4C;
	Mon, 24 Aug 2026 18:20:12 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net v3 0/3] xsk: pre-existing AF_XDP TX metadata fixes
 from
 Sashiko
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <178759561065.3051903.3086695861982033843.git-patchwork-notify@kernel.org>
Date: Mon, 24 Aug 2026 18:20:10 +0000
References: <20260819160535.1472459-1-sdf@fomichev.me>
In-Reply-To: <20260819160535.1472459-1-sdf@fomichev.me>
To: Stanislav Fomichev <sdf.kernel@gmail.com>
Cc: netdev@vger.kernel.org, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, anthony.l.nguyen@intel.com,
 przemyslaw.kitszel@intel.com, andrew+netdev@lunn.ch, saeedm@nvidia.com,
 tariqt@nvidia.com, mbloch@nvidia.com, maxime.chevallier@bootlin.com,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
 aleksander.lobakin@intel.com, horms@kernel.org, magnus.karlsson@intel.com,
 maciej.fijalkowski@intel.com, sdf@fomichev.me, ast@kernel.org,
 daniel@iogearbox.net, hawk@kernel.org, john.fastabend@gmail.com,
 guoren@kernel.org, dtatulea@nvidia.com, witu@nvidia.com,
 martin.lau@kernel.org, yoong.siang.song@intel.com,
 intel-wired-lan@lists.osuosl.org, linux-kernel@vger.kernel.org,
 linux-rdma@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, bpf@vger.kernel.org,
 linux-csky@vger.kernel.org, leon@kernel.org
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

On Wed, 19 Aug 2026 09:05:32 -0700 you wrote:
> A few fixes to address pre-existing issues from Sashiko review.
> 
> Notes on the feedback from net-next v1 posting [0]:
> - It correctly complains about ABI breakage for 32 bit systems, added
>   an explanation why I think we unlikely to have any 32 bit users with
>   launch time
> - mlx5 batching (pre existing) - I think my point in the comment still
>   stays (that we do not make it worse)
> - stmmac recycled descriptors (pre existing) - seems valid but I don't feel
>   confident sending a vibe-coded fix
> - stmmac queueMaxSDU vs taprio offload - don't think this is real but
>   we can fix separately later if it is (the existing issue with breaking
>   xsk seems more real)
> 
> [...]

Here is the summary with links:
  - [net,v3,1/3] xsk: align TX metadata layout across ABIs
    https://git.kernel.org/netdev/net/c/bd7d30bd1d38
  - [net,v3,2/3] xsk: honor XDP_TX_METADATA in zero-copy path
    https://git.kernel.org/netdev/net/c/a6e4b9a6deb9
  - [net,v3,3/3] net: stmmac: document oversized AF_XDP frame handling
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



