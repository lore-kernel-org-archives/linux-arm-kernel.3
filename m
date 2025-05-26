Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3517C5AD49
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 May 2025 15:43:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CXYtb7g+fMKRsYwDlqjURADQ3FqYAKuKnyqKDjD40dY=; b=NX7UxWoiWDJQnbv4DzXdlRvXDd
	L0j27Q35lrFyLSF4Jgr54TzgBVYJi1BRXYqOgWLGB0eN8yGTtrHlfI2ewXoiYFCzIXTRP4d/UwFfp
	HNb3NQLBDVV22TQAoZ/cwya252GPIkTY6UOpjK9uXlFmhy/lhIxH5h8DW3fcK3f/o/BBuEUqPQvfa
	BcJ4ss7+UaD/NAp8qDtyru1PZd8QaKJqpySH2tsOD1zBWVQJkB0GncDC2wNS0f8WBYLiItAumeKLO
	/xjXy/xhQMBO5bwPT/hMpBPGJxdmZcToybzP7mMpXRc5jF3ViX1hOt4xDoUT6t9dQ4cOU2GOlg2OX
	0qddnqBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJZzT-000000099p4-2YUd;
	Mon, 26 May 2025 15:43:51 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJZvl-000000099Ck-1qjz;
	Mon, 26 May 2025 15:40:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id BEC855C063D;
	Mon, 26 May 2025 15:37:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75709C4CEE7;
	Mon, 26 May 2025 15:40:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748274000;
	bh=YQ6Ly+xBPMeVJ+JVo7f3xRiXkboBAQ6F9hhHJQEGf84=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=QbXqeYokd7wqEyGnBYiB9sPwODzrPB4IFKF0PgR3A4lfNgAluaiXjUelPqTaKHnNU
	 56ZmkELpxAieLx0x+uWU0m4U0jhpTf9kWAbsRrb1x9FdyznBKc8LboD8l259dGN4br
	 6KeSYRfQWl08zyq5cTWCtMVRQ0qtfF92XgdtCBsIp8b9zeOcmsJndbkym7yHm79GA1
	 OcJSZD0DjMyENQ0HdvrQjo3UdVcXwL9nq0FVKz251IsHvhsF9i259oijQ759/dBPJu
	 tdsj1L9l64hPKxcS9GlavrMF5NKN+5aMi5bZ5O5zDBPBSSJciFR3dgEZwcVH5qVylB
	 QFs14TJ5FGuRA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33B263805D8E;
	Mon, 26 May 2025 15:40:36 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next v3 0/4] Add the capability to consume SRAM for
 hwfd descriptor queue in airoha_eth driver
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <174827403500.961666.15762374544120433912.git-patchwork-notify@kernel.org>
Date: Mon, 26 May 2025 15:40:35 +0000
References: <20250521-airopha-desc-sram-v3-0-a6e9b085b4f0@kernel.org>
In-Reply-To: <20250521-airopha-desc-sram-v3-0-a6e9b085b4f0@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, netdev@vger.kernel.org,
 devicetree@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250526_084001_524530_1CD2BB5F 
X-CRM114-Status: UNSURE (   8.91  )
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

This series was applied to netdev/net-next.git (main)
by Paolo Abeni <pabeni@redhat.com>:

On Wed, 21 May 2025 09:16:35 +0200 you wrote:
> In order to improve packet processing and packet forwarding
> performances, EN7581 SoC supports consuming SRAM instead of DRAM for hw
> forwarding descriptors queue. For downlink hw accelerated traffic
> request to consume SRAM memory for hw forwarding descriptors queue.
> Moreover, in some configurations QDMA blocks require a contiguous block
> of system memory for hwfd buffers queue. Introduce the capability to
> allocate hw buffers forwarding queue via the reserved-memory DTS
> property instead of running dmam_alloc_coherent().
> 
> [...]

Here is the summary with links:
  - [net-next,v3,1/4] dt-bindings: net: airoha: Add EN7581 memory-region property
    https://git.kernel.org/netdev/net-next/c/2d13b45f8086
  - [net-next,v3,2/4] net: airoha: Do not store hfwd references in airoha_qdma struct
    https://git.kernel.org/netdev/net-next/c/09aa788f98da
  - [net-next,v3,3/4] net: airoha: Add the capability to allocate hwfd buffers via reserved-memory
    https://git.kernel.org/netdev/net-next/c/3a1ce9e3d01b
  - [net-next,v3,4/4] net: airoha: Add the capability to allocate hfwd descriptors in SRAM
    https://git.kernel.org/netdev/net-next/c/c683e378c090

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



