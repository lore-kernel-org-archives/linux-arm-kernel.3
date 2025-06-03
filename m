Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB63AC5AD49
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Jun 2025 09:02:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7K0Dq+moou1FQE4J8Z/NYUpHZRRpNQgM8XstxUpKaj8=; b=qjfjfB8yQTZAzJRqGCtWpb/qpm
	lq10CeCZtcx58gjgxaupXPUDp04ZgBIz1MZxO82EDbupKEfLQNxV1Py76Kvmb0QYuXvKvO7Cx5Q5t
	NPZbGD/VwzEHYrk1O65MNfqUdxV6Dr1lNrq/7xdbIxMaeVJ2x++yXMVfaTr+UR7Cv9ZvWpApFwOt+
	aioPngZdsacsUTZIpCFxmgxrqWOi2/k/qTP16pIo3f8a8AwAGj6/d8GyvopkG2S8JaQAxpmYeOxPs
	P4UcCAEItAxQqSD8AwZ0W6VamzAjXzs+h5ruZ9TTI2UqfmnSw+xiv3ucfeDSj52DHNqC/qjKYdo4n
	2UsMqkuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMNXA-0000000AQVG-2q3B;
	Tue, 03 Jun 2025 09:02:12 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMNUz-0000000AQ8s-07Lc;
	Tue, 03 Jun 2025 08:59:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id F1D695C4D13;
	Tue,  3 Jun 2025 08:57:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75F96C4CEED;
	Tue,  3 Jun 2025 08:59:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748941195;
	bh=R50WQrCRCTILDFY9a5xYZZIKpDYGrHm9HaM9VrFd8qo=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=s5ewOc1IzJzHNkzRDAsQZ2xHPKpi2YS6kSkA/5HltTiaLiQYKfkEyIeNuN/jxhCsW
	 s4B7+6SJeKjhbyKxZS5GYQuz62AkgQyCNTaU6bT8yUFr7Eci3zlYKpgUiUkqpmlqqK
	 fh2u+coWSQxSjBhqF+dhVz6oYRfaF+KrxvCQCPcxL2phWj++C2qSMpAY/HYENGXQ1L
	 9Vcgg7HDzZvCkwOi+/YrcJl5mfmS0JOi4jh4zN0ufHStOdEUZfcKDN6yBLPd7ZTsd0
	 whGJBEPoXFGu/LvWJpVXuukKUKoiKXI3jO/HNH6ekNyxoxzJ9iSQ4jwwOreAinckRm
	 cFzWJAyDlbW+w==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33BE8380DBEC;
	Tue,  3 Jun 2025 09:00:29 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [net v3] net: wwan: t7xx: Fix napi rx poll issue
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <174894122801.1429658.207799656496074697.git-patchwork-notify@kernel.org>
Date: Tue, 03 Jun 2025 09:00:28 +0000
References: <20250530031648.5592-1-jinjian.song@fibocom.com>
In-Reply-To: <20250530031648.5592-1-jinjian.song@fibocom.com>
To: Jinjian Song <jinjian.song@fibocom.com>
Cc: chandrashekar.devegowda@intel.com, chiranjeevi.rapolu@linux.intel.com,
 haijun.liu@mediatek.com, m.chetan.kumar@linux.intel.com,
 ricardo.martinez@linux.intel.com, loic.poulain@linaro.org,
 ryazanov.s.a@gmail.com, johannes@sipsolutions.net, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 linux-doc@vger.kernel.org, angelogioacchino.delregno@collabora.com,
 linux-arm-kernel@lists.infradead.org, matthias.bgg@gmail.com, corbet@lwn.net,
 linux-mediatek@lists.infradead.org, helgaas@kernel.org,
 danielwinkler@google.com, andrew+netdev@lunn.ch, horms@kernel.org,
 sreehari.kancharla@linux.intel.com, ilpo.jarvinen@linux.intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250603_015957_114642_170F2DB8 
X-CRM114-Status: UNSURE (   9.02  )
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
by Paolo Abeni <pabeni@redhat.com>:

On Fri, 30 May 2025 11:16:48 +0800 you wrote:
> When driver handles the napi rx polling requests, the netdev might
> have been released by the dellink logic triggered by the disconnect
> operation on user plane. However, in the logic of processing skb in
> polling, an invalid netdev is still being used, which causes a panic.
> 
> BUG: kernel NULL pointer dereference, address: 00000000000000f1
> Oops: 0000 [#1] PREEMPT SMP NOPTI
> RIP: 0010:dev_gro_receive+0x3a/0x620
> [...]
> Call Trace:
>  <IRQ>
>  ? __die_body+0x68/0xb0
>  ? page_fault_oops+0x379/0x3e0
>  ? exc_page_fault+0x4f/0xa0
>  ? asm_exc_page_fault+0x22/0x30
>  ? __pfx_t7xx_ccmni_recv_skb+0x10/0x10 [mtk_t7xx (HASH:1400 7)]
>  ? dev_gro_receive+0x3a/0x620
>  napi_gro_receive+0xad/0x170
>  t7xx_ccmni_recv_skb+0x48/0x70 [mtk_t7xx (HASH:1400 7)]
>  t7xx_dpmaif_napi_rx_poll+0x590/0x800 [mtk_t7xx (HASH:1400 7)]
>  net_rx_action+0x103/0x470
>  irq_exit_rcu+0x13a/0x310
>  sysvec_apic_timer_interrupt+0x56/0x90
>  </IRQ>
> 
> [...]

Here is the summary with links:
  - [net,v3] net: wwan: t7xx: Fix napi rx poll issue
    https://git.kernel.org/netdev/net/c/905fe0845bb2

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



