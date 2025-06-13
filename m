Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82A00C61CE8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Jun 2025 01:32:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5UfDglHi7STMO99qhJO5QlirzpTMk1n7+qtYy13oknw=; b=kZSupJi87o7dKCkOituoaYwQEQ
	vGsdCtLc0BR2+HhQJ7UwDBlyzf49qqnpryb5yrtv28fdT3pvQVVYawJ3m8IOD9ftB8KJNBMbOMgao
	ewqd6QPomi/0bdm1/IU/+1Kcoakx2cOy6OoRZ57cp0oPrZ1zrp1DFj0W3jgaHMi3M2JdGz5ijStac
	+Pc0JvqDbfPFgV4l/ObSgSwCGTQown9sNwJ4GBqjUwwQF2hSx5q+fSpSs1R6tqp9E6bdvFFdTpRO+
	Jfky5+SMHl4T9Jk5FrCrzO0lIRJarBUSLlcyhdX4Mbbuh52bMriK6/F2MtgIngsU/7aGT/v3U1LMN
	8j/sBKHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPtHU-0000000F3a5-2K3U;
	Fri, 13 Jun 2025 01:32:32 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPtFK-0000000F3K1-3QaZ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Jun 2025 01:30:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 8C99844E35;
	Fri, 13 Jun 2025 01:30:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E631C4AF09;
	Fri, 13 Jun 2025 01:30:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749778217;
	bh=dnyl7xXadJ+gA1RxRmxVvePT5MX69p9ijLGsLv2UfoM=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=tEP83ZxKtH4Oa/RdEF7t93/9tX0SHhxr+r6AddkoboSWu6IFS9Yh9914P6vehPG4+
	 ap5hDtDUAi2dWROQrfv/6bCEDCXHIh9xUF8an/uv/SHLyqKvtJ4U+Zk2fFrfxD1X1t
	 9b2XOiii0OJNq3j15VR7xQ0dJDSX/FXBAZsHsipsB33Tq03Nyf1oSbhycYqBPtbhZT
	 AVvuaWSYTV0uPOTMoqVez4sCHUCjCD5mLJJ8t10zpxNWPadkmSoE8UcHxW658+P3HA
	 HlSnOu0eN9As8S7hzdlBuyXJsCnkW5iy7/7j7QVn5aoh11A60CaGRszwF5Jc+KUS1i
	 fcpYUQrzd/Dww==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 70B8639EFFCF;
	Fri, 13 Jun 2025 01:30:48 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] net: stmmac: extend use of snps,multicast-filter-bins
 property to xgmac
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <174977824699.179245.5669593462581793038.git-patchwork-notify@kernel.org>
Date: Fri, 13 Jun 2025 01:30:46 +0000
References: <20250610200411.3751943-1-nikunj.kela@sima.ai>
In-Reply-To: <20250610200411.3751943-1-nikunj.kela@sima.ai>
To: Nikunj Kela <nikunj.kela@sima.ai>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, mcoquelin.stm32@gmail.com,
 alexandre.torgue@foss.st.com, rmk+kernel@armlinux.org.uk,
 prabhakar.mahadev-lad.rj@bp.renesas.com, romain.gantois@bootlin.com,
 inochiama@gmail.com, l.rubusch@gmail.com, quentin.schulz@cherry.de,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250612_183018_872955_EA2D1722 
X-CRM114-Status: GOOD (  10.85  )
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

On Tue, 10 Jun 2025 13:04:11 -0700 you wrote:
> Hash based multicast filtering is an optional feature. Currently,
> driver overrides the value of multicast_filter_bins based on the hash
> table size. If the feature is not supported, hash table size reads 0
> however the value of multicast_filter_bins remains set to default
> HASH_TABLE_SIZE which is incorrect. Let's extend the use of the property
> snps,multicast-filter-bins to xgmac so it can be set to 0 via devicetree
> to indicate multicast filtering is not supported.
> 
> [...]

Here is the summary with links:
  - net: stmmac: extend use of snps,multicast-filter-bins property to xgmac
    https://git.kernel.org/netdev/net-next/c/94a8e4a8185f

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



