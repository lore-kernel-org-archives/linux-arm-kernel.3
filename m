Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE166C55184
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Aug 2026 23:51:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B4yhz+JQv0QMMgQVrxwyPdXvzn96hxmm8mw/fYkupHg=; b=q5/zNDi/4DddzQV7VBfLeS2g6+
	VxfyjtdMtB+cWAj3lAmRrea72Cd6ocN7a19nxhDuOE65TtAFzTEXW1g2+jRVpmzjh9UQqgFrUae6a
	zM3VjLbpiBhAwP26DDwicBPOs8JhK00SAmC05hk/mX3OnoM9Rfjq2nbDP+2qbqCZcrJyGGlBv9bON
	0Bix56gjDDp/x/6xbYa33VxbOKCfwDGOmoM1kbBQBlOof4hFXeXVuDDg/xr7DtzJnDk/2G+RyDVsQ
	2BdnI41M1B6f9UuJyMaP0ysrnXV9v7v+Md9btNuxDN4X4cRqy0aq0zQ21uQGtMKYSPuhvhhFAWp5y
	Guk8GJtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wr2R1-00000000jA1-2KIi;
	Mon, 03 Aug 2026 23:51:07 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wr2R0-00000000j9q-2tbo
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Aug 2026 23:51:06 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 46DF460A5F;
	Mon,  3 Aug 2026 23:51:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC9061F000E9;
	Mon,  3 Aug 2026 23:51:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785801064;
	bh=B4yhz+JQv0QMMgQVrxwyPdXvzn96hxmm8mw/fYkupHg=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=dkRYn8yGh74TjYjobcsupvOS3FRrRLYd6cOInE3TOiNWpDcNrujN0Indh9wOZKxVw
	 ej01a4pV8te8xzikOjLkSAlrhDSVOfvD4+7ethit34sQMSO3Xq3vynpRNbRXhgyWhl
	 xlzoXLS1Z2TLS+DePJy8rTxUnKc575FIikguZAMkayr8U5Bdjfn/Xg3of0RYOCLnAq
	 giq2gUJ0G3gwY2dNLcPYB7Le7xc3cksCq5QycHWD87aspIJUWvRRdy7jqLKUEKCJPR
	 iPnBf6PILULBZj7W5vT/2LgoQs6ktqXCkjc3EGwKxVpkjtkEeUgcL7RGyyoXmHhcou
	 piWz4OrX8iklA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 19A113924467;
	Mon,  3 Aug 2026 23:50:26 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net 0/6] xsk: harden TX metadata validation against races
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <178580102466.2881314.4527278917944249834.git-patchwork-notify@kernel.org>
Date: Mon, 03 Aug 2026 23:50:24 +0000
References: <20260727161959.885642-1-sdf@fomichev.me>
In-Reply-To: <20260727161959.885642-1-sdf@fomichev.me>
To: Stanislav Fomichev <sdf.kernel@gmail.com>
Cc: netdev@vger.kernel.org, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, anthony.l.nguyen@intel.com,
 przemyslaw.kitszel@intel.com, andrew+netdev@lunn.ch, saeedm@nvidia.com,
 tariqt@nvidia.com, mbloch@nvidia.com, ast@kernel.org, daniel@iogearbox.net,
 hawk@kernel.org, john.fastabend@gmail.com, sdf@fomichev.me,
 maxime.chevallier@bootlin.com, mcoquelin.stm32@gmail.com,
 alexandre.torgue@foss.st.com, aleksander.lobakin@intel.com, horms@kernel.org,
 magnus.karlsson@intel.com, maciej.fijalkowski@intel.com, witu@nvidia.com,
 alice.kernel@fastmail.im, dtatulea@nvidia.com, yoong.siang.song@intel.com,
 martin.lau@kernel.org, intel-wired-lan@lists.osuosl.org,
 linux-kernel@vger.kernel.org, linux-rdma@vger.kernel.org,
 bpf@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, leon@kernel.org,
 AutonomousCodeSecurity@microsoft.com, blbllhy@gmail.com
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

On Mon, 27 Jul 2026 09:19:53 -0700 you wrote:
> Cen Zhang reported a KASAN out-of-bounds read when AF_XDP is configured
> with a TX metadata area smaller than struct xsk_tx_metadata. The metadata
> is also shared with user space, so reading its flags more than once can
> produce inconsistent validation and processing decisions.
> 
> Require enough space for the flags and one request field, validate the
> launch-time field against the configured metadata length, and use one
> snapshot of the flags while processing each request. Carry the validated
> decision through completion handling so later user-space changes cannot
> enable an unrequested completion timestamp.
> 
> [...]

Here is the summary with links:
  - [net,1/6] xsk: require at least 16 bytes of TX metadata
    https://git.kernel.org/netdev/net/c/1bb30b181d9f
  - [net,2/6] xsk: pass TX metadata pointer by reference
    https://git.kernel.org/netdev/net/c/19366db6dfcc
  - [net,3/6] xsk: clear metadata pointer when no timestamp is requested
    https://git.kernel.org/netdev/net/c/9f60a67df8d3
  - [net,4/6] xsk: validate launch-time metadata size
    https://git.kernel.org/netdev/net/c/439ce2dddf3d
  - [net,5/6] xsk: move xsk_tx_metadata_request() to xdp_sock_drv.h
    https://git.kernel.org/netdev/net/c/ddd0d6c5bfe2
  - [net,6/6] xsk: validate metadata when processing requests
    https://git.kernel.org/netdev/net/c/849b1664dbda

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



