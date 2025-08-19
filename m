Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BA26CA0EEB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Aug 2025 12:34:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4ZOn8OeKkTuLZR3X3pruM5R7l5GfOJ+6fQshWxOvDY8=; b=VdHfhSGRkK3iMUCaCh6ABPAf9Y
	B9fBLBvhTNjo1elSxFcsfk6MLJsWu/zitsCNDTN0gWTwS6NRT9vIotujZnV7suleSoEudxc2TPclp
	8tDowRQzyuO7aQ52tr+2pStL7+ah16PipoAygrdfm++4MFWv4W4X5LJHt/vZYvbdCBeOPeNle8vD3
	CMhxt7imhJaDaUfZ/sjBgvKejiw5Bj/o5oxdXJnGee3Pot5i+leubCgcYLRvMznMtkcNpvxp9zdMj
	OBKap06jLwKvmSwhF3oQGvaRm080XG9Ugl1u516hX9i09VBsKnU1azvzpGD9MqxQ0eWduho/Lhtxq
	bx8VVoRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoLXf-0000000ARvW-2TQC;
	Tue, 19 Aug 2025 12:34:19 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoJbM-0000000A8FX-2b83;
	Tue, 19 Aug 2025 10:30:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 29AAD5C4A8E;
	Tue, 19 Aug 2025 10:30:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9C89C4CEF1;
	Tue, 19 Aug 2025 10:29:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755599399;
	bh=nqC4QDhsQBWXsgUgFUNWX/IR69ZH1dQVC1Q2G3yVz/c=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=IJtCQo4nfCaTwGPYVpy2RQLbIQHXme+o/hBnZ/eWJxUwnpcYt8zTFKnpaQS05SFo5
	 VOvj8KuiQhF7VjtlWbITVRzLNbjqquqPRe8ab4UvcwTzSld+CKsVC7n2VqPcps/U7f
	 G/fS4HGM0zYBMH8b1WuQGevGNg1RkDzT65gymcbZ3y+7O5DJ4jVL92Z+fw7VFmVeEO
	 MCStfTFBjh/03yKvv7vMs3VRgBMvy9cSRBmwwGJKSyKOqWuNT9xIrjDxVjRkiSyIZI
	 vA7bTMWkbTBBZhF8N0o3f6EEoQNrmY5X7IYJAJ1sUro2zkFLjT6iAnwgeQEAha2nIH
	 5CDjRR7t7fQRA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EAF45383BF58;
	Tue, 19 Aug 2025 10:30:10 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next] net: airoha: Add wlan flowtable TX offload
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <175559940949.3486708.13434043940019659826.git-patchwork-notify@kernel.org>
Date: Tue, 19 Aug 2025 10:30:09 +0000
References: <20250814-airoha-en7581-wlan-tx-offload-v1-1-72e0a312003e@kernel.org>
In-Reply-To: <20250814-airoha-en7581-wlan-tx-offload-v1-1-72e0a312003e@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, netdev@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250819_033000_701354_4F3EFBB3 
X-CRM114-Status: UNSURE (   9.70  )
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
by Paolo Abeni <pabeni@redhat.com>:

On Thu, 14 Aug 2025 09:51:16 +0200 you wrote:
> Introduce support to offload the traffic received on the ethernet NIC
> and forwarded to the wireless one using HW Packet Processor Engine (PPE)
> capabilities.
> 
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> ---
>  drivers/net/ethernet/airoha/airoha_eth.h |  11 ++++
>  drivers/net/ethernet/airoha/airoha_ppe.c | 103 ++++++++++++++++++++++---------
>  2 files changed, 85 insertions(+), 29 deletions(-)
> 
> [...]

Here is the summary with links:
  - [net-next] net: airoha: Add wlan flowtable TX offload
    https://git.kernel.org/netdev/net-next/c/a8bdd935d1dd

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



