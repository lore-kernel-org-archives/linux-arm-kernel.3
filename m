Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21396CD3427
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  2 May 2026 01:01:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r6hubUrqaY3SlO73nuIZaAs/DwK/skxT2mYPNKEiXNM=; b=G6wYS1ngu+vnaXf3g8UBtv+aAd
	Let8R12HqcQMja/0QnzGSXaaPYIEaenEkZALe4IxjJncS2RKtZ0OJ4Vyycv2HdrjgaPAmFAa7lH2v
	vzJvMBUFjoTLJU6Yp/TWJuTGmhX4Tl7fMvVrS8sKQ66aPGDmrz7SS0lFNfseRlYfBJfZukEqv8sJi
	Nv8rJqjHIEM6YoZCqC7AvqdrQQU6coN415n6sE7BZJ6Ejlfhh/nUjDVGCyl4fQ9MyDn3FKB1vth4z
	6FFbe1ARG9u60BU4OHQ75gnrhMP6umvE1KqIaWHljiGwc29oD6FKh2x6/5QiHiJJJsg1LG9ZRG0nJ
	wNlZDK8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIyjH-00000007xMi-0QvE;
	Sat, 02 May 2026 01:01:11 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIyjF-00000007xMO-2VK6;
	Sat, 02 May 2026 01:01:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 0B7F6600CB;
	Sat,  2 May 2026 01:01:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B349AC2BCB9;
	Sat,  2 May 2026 01:01:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777683667;
	bh=6VxoKM+xTphV5Dzqikjy6BS2+apjk1/Pd+6jaI3/rDk=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=KdBb/OezBkC3rFemJHFe2g2Bpkz5ODr6rF21oCUQkbNNxuFza8k4WMcuf9euYgUPJ
	 ro08CB4FyazyKTZyvgOnqdNYAiDvC083nyTMks6IRhbVTRgRv3S7uB6hhg1frqJkIf
	 3lBc2ViM7F4XlpeElxzZzOEBkR/E0gFgocjagrMLG4M3+UysKz+SZBh16LpAApm3Lj
	 y9cVOnpy5GBQjU+nazInwrEESY95rD+wjQ9j4QFNQLkcflQ3iDTioJX8A7QJA7JQ9G
	 J7o5/LeXOU9AHbEoqTUqTxXa9WRRJUvtseynqF2HKgvOncwS4eG5zQwHEmeLWNqpTo
	 yvn3BiKLBgSXg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 03193380CEF5;
	Sat,  2 May 2026 01:00:22 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next] net: airoha: configure QoS channel for HW
 accelerated flowtable traffic
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <177768362079.3679774.17100157322999621672.git-patchwork-notify@kernel.org>
Date: Sat, 02 May 2026 01:00:20 +0000
References: <20260430-airoha-ppe-qos-channel-v1-1-5ef9221e85c1@kernel.org>
In-Reply-To: <20260430-airoha-ppe-qos-channel-v1-1-5ef9221e85c1@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, horms@kernel.org,
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

This patch was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Thu, 30 Apr 2026 10:47:38 +0200 you wrote:
> As done for the SW path, configure the QoS channel for HW accelerated
> traffic according to the user port index when forwarding to a DSA port,
> or rely on the GDM port identifier otherwise. This allows HTB shaping
> to be applied to HW accelerated traffic.
> 
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> 
> [...]

Here is the summary with links:
  - [net-next] net: airoha: configure QoS channel for HW accelerated flowtable traffic
    https://git.kernel.org/netdev/net-next/c/286efd34d1a1

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



