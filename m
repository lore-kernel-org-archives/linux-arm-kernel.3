Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D10DBCFD2F6
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Nov 2025 12:10:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Nk5lv/sCDFFRbDJlZIohh6ehpVjh/KmvR5PQ9FDrW7s=; b=lohj0fENc/0EfObRsgsDOrvUu4
	0t6zEkcn3nDSQR6G42HTNRGIBRbxaricqE7i+emKfoVdvSeoUvYye41hsqZOhiP3d0jr6PaGrH6Jg
	iF/0PVR78IAuWKtzcHWPhHL7b/W/5i/iM5BecMUcoBR2jvmEprz3fSRyAo2geghL6251dJC30AkZx
	9NTGBgJp0BKddA4IgGVv/Hc+80oK4hAPggEUAOZIbKKui9UcLsTbauzAOzgRT/eHOUVbsVt3qUulk
	WlNdoItqHW3890aDfF0O/aJjKP3/3k5vADWsiodNo40rOPvR5CbtPCu/RbxN3p6YG5sRXk24bsWER
	QdH0SaUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOapl-0000000GWYk-2FWm;
	Thu, 27 Nov 2025 12:10:49 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOapi-0000000GWY0-0x8p
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Nov 2025 12:10:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id EFDAF43DEF;
	Thu, 27 Nov 2025 12:10:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C802DC4CEF8;
	Thu, 27 Nov 2025 12:10:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764245444;
	bh=uhnsNrqtMtQkysk9EvtLzQf+itpVm8Usek2r6BnT+ak=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=RO0NRAZl45XA5ot75mAHnDowIjR04X6kevxTP/ht/X0iW+aJV/HSqd1DkqPUzJ/38
	 fgQjlsjNIbmzTKhnimVO/Q4XPHv+9aOkw4qaBvEhSfjfRSKhGp9awCsJls/EpcBN//
	 0wkqkJQhuGucl1fTvtcmKfQaJovPFZWhWvsqnEH+Ibw64NhrYhNTHCVTGSIvhqQLEo
	 bM6DopBszbn9uoufcaoFKgkt25IZ3o8eR7khWLioY+8QJxSjMJRT9Ew2DA4SXydBKQ
	 CIoq1Ylo/saAP8rponTA2pcglH4509X+vLM0zaAk3aH5Raam+16WKfpx2KmYSXlmVm
	 1qQALIu6z0POQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 710E4380CFEF;
	Thu, 27 Nov 2025 12:10:07 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next] net: stmmac: dwmac: Disable flushing frames on
 Rx
 Buffer Unavailable
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <176424540625.2550562.3416257212075007570.git-patchwork-notify@kernel.org>
Date: Thu, 27 Nov 2025 12:10:06 +0000
References: <20251126-a10_ext_fix-v1-1-d163507f646f@altera.com>
In-Reply-To: <20251126-a10_ext_fix-v1-1-d163507f646f@altera.com>
To: G@aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org,
	Thomas@aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org,
	Rohan <rohan.g.thomas@altera.com>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, mcoquelin.stm32@gmail.com,
 alexandre.torgue@foss.st.com, maxime.chevallier@bootlin.com,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 matthew.gerlach@altera.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251127_041046_348464_72A25BF5 
X-CRM114-Status: UNSURE (   9.53  )
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

On Wed, 26 Nov 2025 00:37:12 +0800 you wrote:
> From: Rohan G Thomas <rohan.g.thomas@altera.com>
> 
> In Store and Forward mode, flushing frames when the receive buffer is
> unavailable, can cause the MTL Rx FIFO to go out of sync. This results
> in buffering of a few frames in the FIFO without triggering Rx DMA
> from transferring the data to the system memory until another packet
> is received. Once the issue happens, for a ping request, the packet is
> forwarded to the system memory only after we receive another packet
> and hece we observe a latency equivalent to the ping interval.
> 
> [...]

Here is the summary with links:
  - [net-next] net: stmmac: dwmac: Disable flushing frames on Rx Buffer Unavailable
    https://git.kernel.org/netdev/net-next/c/45d100ee0d6e

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



