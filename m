Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87192F9D0CA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Apr 2026 13:20:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yBlTr/oh/wv2inLYJ8i7doZ3+YfwtyCfuEdPzn5dDLo=; b=Ky5/l4cbQGrZmmutkfLOXhQGNu
	jdY6TuRAcGcVx6lUdBEWPUSGYMIYAw4nG0NMdvQyRSyyyOcroHrQKn386A2QH1SEm1FO5jCfSyKIA
	GmtHCTBwHLbICknhIROGz94KQVOPkDeoMbC+f+KHuOjqbOVLanYi2dFFyKXD1ZL7QW+cqmyxr0pn6
	hnsMkuAC537NgS43pCvWBvOcMrbRhnrlGhmL+7MabD+nHEN6A/qOBNh+6Vnd1VMzF3F2At3Zo8EGy
	Y1lrzQuYLR5W7cj68vGBKXTI9VNfdffXPwIODIvVIgHXrB0khE7+eJ3ARhe9h5o5zfO6Rj72lvGx4
	HB4U4/wQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCdgz-0000000HMgx-01Up;
	Tue, 14 Apr 2026 13:20:37 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCdgx-0000000HMgj-3fwx;
	Tue, 14 Apr 2026 13:20:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 0477060018;
	Tue, 14 Apr 2026 13:20:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A98F0C19425;
	Tue, 14 Apr 2026 13:20:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776172834;
	bh=cMCDkATKBmtmieFp8QBU6yJuQwNr3qs20Cfx6XJdEWU=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=B5XSbWwJ+9hKnt5Xdh2YU+VP2rCKj5FPUW3me8pSMUUaW79hQUMGZt49iZI5aT9E7
	 rxBm8aJxvQ9rj54iGEC3ZEuMaxoliVjLY3C7f71WvRLJnNYaygyHfH0eWzLGQdNmBJ
	 M2PI6lBOvRnlDhsNlJQxZ7vUC36QlYFleT0bT/WGe5hVi5A4K6WRvU93BXZs8t8It/
	 WoI3t4Ul5bfy71peBBJlX6b2ZFY0QKnRxF1ricuYosCd5cSMokKQxOqKZt6wN/wfO3
	 0JEyaMxbwJzBlqO6CaimbfarHs88jz25P2ikU2og/bSMK+vko+elJKTu6ZjA9XyCxV
	 i9t8cjufkt0Pw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 7CE743808205;
	Tue, 14 Apr 2026 13:20:06 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net] net: airoha: Add missing PPE configurations in
 airoha_ppe_hw_init()
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <177617280505.878864.13821756004828787817.git-patchwork-notify@kernel.org>
Date: Tue, 14 Apr 2026 13:20:05 +0000
References: <20260412-airoha_ppe_hw_init-missing-bits-v1-1-06ac670819e3@kernel.org>
In-Reply-To: <20260412-airoha_ppe_hw_init-missing-bits-v1-1-06ac670819e3@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, netdev@vger.kernel.org
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
by Paolo Abeni <pabeni@redhat.com>:

On Sun, 12 Apr 2026 10:43:26 +0200 you wrote:
> Add the following PPE configuration in airoha_ppe_hw_init routine:
> - 6RD hw offloading is currently not supported by Netfilter flowtable.
>   Disable explicitly PPE 6RD offloading in order to prevent PPE to learn
>   6RD flows and eventually interrupt the traffic.
> - Add missing PPE bind rate configuration for L3 and L2 traffic.
>   PPE bind rate configuration specifies the pps threshold to move a PPE
>   entry state from UNBIND to BIND. Without this configuration this value
>   is random.
> - Set ageing thresholds to the values used in the vendor SDK in order to
>   improve connection stability under load and avoid packet loss caused by
>   fast aging.
> 
> [...]

Here is the summary with links:
  - [net] net: airoha: Add missing PPE configurations in airoha_ppe_hw_init()
    https://git.kernel.org/netdev/net/c/b9d8b856689d

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



