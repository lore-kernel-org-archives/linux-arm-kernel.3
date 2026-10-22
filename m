Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AA6160A2601
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Oct 2026 00:30:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ZkmdS9er;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=j7/C49Wb
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uZkzK/XnREzEVV0ebXbgmbk4W62Yc9eFtRqf1FWlWqk=; b=ZkmdS9er2Xs5SWi68t6c4MHVKp
	isPepH7CraITueaETcyDaVwNX51RuLD4ZFZQ1NtGmhiXXZ9Eg7y8LuwUeZYMq0d8/xd9nbIklLSbY
	Zh4T5MoJSZt4zUAfAV/eBoO1mEqyjWg8ZVjVsPeWcAluJwyN0yc51OgzaHMtaLCUSDfKbgIhxTvyW
	XUQ+I/95Gf6yYYpGjACGwAo1YoamkPo9Xm3LSyccXN1ZQ7YCxNfVXEU3ysGqsPbaFRFf82nZSQcRO
	/v0jmyrDvpgO5Ik8p+AWuujdC2q94plGhmhXi3TfF2n9U8B8XBsh7Sk5q90JaqDE528NqwOL8rXoU
	rkkTheLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJghC-0000000D5sO-2CgF;
	Thu, 22 Oct 2026 00:30:14 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJghB-0000000D5sG-0UhN
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Oct 2026 00:30:13 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 527996022B;
	Thu, 22 Oct 2026 00:30:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0734A1F000C1;
	Thu, 22 Oct 2026 00:30:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792629012;
	bh=uZkzK/XnREzEVV0ebXbgmbk4W62Yc9eFtRqf1FWlWqk=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=j7/C49WbSMxxG0QijFQKufiYq0Q6dinOiGJm8MkKxqm6StnaJDt8TdIH6Rgcf+keq
	 JADCWI01KasEN91qaed5UQGW6ajVEcWjFhS4edH5K6ikiH1vaI04BS9WMYQvYiaRPH
	 7Wkz1rNuBpaxGd0B9C/+F96AA3g3WApR4IfDmlQkpObBgY2IbK7sTDKbTi/qQUH25V
	 wTesyhUX87grDxMnyia3fA6O+g9/De57gzSXa+cLXdAaYbis9obYauivIQVeCKe4uL
	 Fmp1+voB3agGWkl7oG/2zx7u1gJh+YYKRR8RpVzpOslzk5NMoITGjrhhkG1Jb+tR0N
	 ZWyatNxK0iniw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id F15A3380A963;
	Thu, 22 Oct 2026 00:30:11 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net] net: lan969x: don't disable hardirqs in fdma tx clear
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <179262901059.1378903.1270598313678764253.git-patchwork-notify@kernel.org>
Date: Thu, 22 Oct 2026 00:30:10 +0000
References: <20261020-lan969x-fdma-tx-clear-irq-v1-1-b9f9d1eda317@microchip.com>
In-Reply-To: <20261020-lan969x-fdma-tx-clear-irq-v1-1-b9f9d1eda317@microchip.com>
To: Daniel Machon <daniel.machon@microchip.com>
Cc: UNGLinuxDriver@microchip.com, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 Steen.Hegelund@microchip.com, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-11.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hello:

This patch was applied to netdev/net.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Tue, 20 Oct 2026 10:57:27 +0200 you wrote:
> lan969x_fdma_tx_clear_buf() runs from the NAPI poll and frees the skbs
> of completed tx DCBs with napi_consume_skb(), under sparx5->tx_lock.
> 
> Before this patch, the lock is taken with spin_lock_irqsave(), so the
> skbs are freed with hardirqs disabled. RX skbs are marked for page_pool
> recycling, so when such an skb is forwarded back out and its tx
> completion frees it here, the free path reaches __page_pool_put_page(),
> which warns via lockdep_assert_no_hardirq().
> 
> [...]

Here is the summary with links:
  - [net] net: lan969x: don't disable hardirqs in fdma tx clear
    https://git.kernel.org/netdev/net/c/9770818b8a92

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



