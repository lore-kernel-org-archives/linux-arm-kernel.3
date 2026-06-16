Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50090CD98D2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Jun 2026 22:11:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pHw0aVCwFWx/V7j5QiDaAmPjq2DsGJ1d+d++pb2rzB4=; b=PEhRZonXY+Y34IiU8/dhTAQgsN
	UsuQ5KtBR8FK0lQegd6y5k90/zoFDFVLlkELExRFIv3gJI6IOim7gLGiRJMvQNA6SeVeZhC2sJQKk
	XXOovmIKYbL+knri8T3UX7o5UFPy5qZk8gqx83P1hBqGdd2YCee1SmBCHj9+Qwd/Gpf5ChWJ1xEkO
	XkmhWC+JJ/6oMLGJO46jOVY5ndQvtgFgRKcc21wXFOiGje+xbIo/m/GNTogxAVhROU898+cHlvJQ2
	XSSvArvXg5GsAjkxgsyoE+NkkUzB6M/T/Anf5lb6Ky66NQeDUlRvmxkIYivVla2xcOva4quaWcLUB
	F/TRJ4dQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZc0T-0000000GN4o-2gXR;
	Tue, 16 Jun 2026 22:11:41 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZc0S-0000000GN4a-2Yl8;
	Tue, 16 Jun 2026 22:11:40 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id B4F66600AA;
	Tue, 16 Jun 2026 22:11:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 687561F000E9;
	Tue, 16 Jun 2026 22:11:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781647899;
	bh=pHw0aVCwFWx/V7j5QiDaAmPjq2DsGJ1d+d++pb2rzB4=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=oqNcDhSvheRZ0rVVxvm4Ftgs7gWXT4j8FvnkzIIkUzhs6GabADqZsJTWqWmYqjtzh
	 ghMhxXMflJk6lN6Qt5FkaWChshwIGHzZnf5jjj6fpyEcD1SAto2EcC4XIrtifbyYBQ
	 s9+NRRJTD+Tk00lKKeqvfemxAwXR9qSdXtZIU2zAwdUc1hTZFptkRgjB088pgN/Al/
	 T/sherzVfWN26TWMehesWszd7xvfOVY8v7MPuoY52lbQCROZ7bDd5fCDgHUkPpnY/1
	 oexK705xt/yuvJDTB3SjvwMPtxMSmpNo5OkYZhe5kuU9ks9SYUV4yqrnOsdJV/z3ES
	 MBm+oZnXjy8yQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 198383930C2B;
	Tue, 16 Jun 2026 22:11:35 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] net: airoha: Fix QoS counter configuration for Tx-fwd
 channels
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <178164789356.1259509.14649095510823015681.git-patchwork-notify@kernel.org>
Date: Tue, 16 Jun 2026 22:11:33 +0000
References: <178160712947.2156222.3765685889775458986@gmail.com>
In-Reply-To: <178160712947.2156222.3765685889775458986@gmail.com>
To: Wayen Yan <win847@gmail.com>
Cc: netdev@vger.kernel.org, lorenzo@kernel.org, horms@kernel.org,
 pabeni@redhat.com, kuba@kernel.org, edumazet@google.com,
 andrew+netdev@lunn.ch, angelogioacchino.delregno@collabora.com,
 matthias.bgg@gmail.com, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
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

On Tue, 16 Jun 2026 18:50:29 +0800 you wrote:
> In airoha_qdma_init_qos_stats(), the Tx-fwd counter was incorrectly
> using register index (i << 1) instead of ((i << 1) + 1). This caused
> the Tx-fwd configuration to overwrite the Tx-cpu configuration for
> each QoS channel, resulting in incorrect QoS statistics.
> 
> Fix by using the correct register index ((i << 1) + 1) for Tx-fwd
> counter configuration.
> 
> [...]

Here is the summary with links:
  - net: airoha: Fix QoS counter configuration for Tx-fwd channels
    https://git.kernel.org/netdev/net-next/c/1402ecccf563

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



