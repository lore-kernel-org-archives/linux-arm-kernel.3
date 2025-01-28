Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B801C0218A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Jan 2025 12:30:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KFvkm8eBdiXXgEv9a7DoTILmzFWVyr16pKzotowVdmk=; b=lnfaJX1hYWvsVBUTsMGtMu/JzK
	y4ph1kPNAkSTaoX/La8JrIG9NmBujrhqLV4pGyzms0oTiQCWlP9Lv5uc9WdZ5pK1JdRfoClbJEZ0R
	K4NRm4u23ZIrGSH+JetUvwTU+39epEsfR0CO68nKp38pQn+ie3rkhnzlTx9D7BcPRCa1FuD2XlGOL
	/6fQisnMkSVTdJbxVuuo03L2zK7Ae6GfWPb3XZXAB3yvVXSEeiDoxt1to5Bx5Ud67R8KfxM7xz8NL
	EcqY3XS/IRcvCBZhA22syR+dAfb2nBZADLAIR4mBnFEkyx9oONZ4LkhThdgRBBOB5YBS/wjsadt81
	RhqMTszA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tckjN-00000004so3-2VyU;
	Tue, 28 Jan 2025 12:30:13 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tckZc-00000004ruf-0FgM
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Jan 2025 12:20:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 71F7BA40CBB;
	Tue, 28 Jan 2025 12:18:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0064EC4CED3;
	Tue, 28 Jan 2025 12:20:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738066807;
	bh=hGRAHKFUCDKAuwe3CGHbeVZG49CT7ecXG5otU32lUgg=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=cwfFHpDOMF43ZbhuhVr3ZbDmUOPsIf6c6Vodr6d6bghMyPyiTQkHVYIaIe/Xx3HIy
	 /V/vnFFZScwU1qc/UYs6QoOOY2cWJiW1FggvRQShQtcvjdXMQU4wZ6PdgUXhMFxLd8
	 uWBn8Kxovfo0/FjOrQnXozJHDFodHowcPTgKU7W9TPsMnlw/CxcUSbKyJTkkyaFu7J
	 4uMdWFYFkOV2ql+Wzn4KhJJYeCuuA5QuhBUnle4cKGmXQJiFJH19u66yr88MsWbdEa
	 EFwjykFH471jvawzyB0RKdDURsq86lKnTkys/S8TNBUf1C6wrcPjMgZ4IrSLk4+hqu
	 jWH6782480JNA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EB249380AA66;
	Tue, 28 Jan 2025 12:20:33 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net v4 0/3] Limit devicetree parameters to hardware capability
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <173806683276.3776163.12860723746760741556.git-patchwork-notify@kernel.org>
Date: Tue, 28 Jan 2025 12:20:32 +0000
References: <20250127013820.2941044-1-hayashi.kunihiko@socionext.com>
In-Reply-To: <20250127013820.2941044-1-hayashi.kunihiko@socionext.com>
To: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
Cc: alexandre.torgue@foss.st.com, joabreu@synopsys.com, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 mcoquelin.stm32@gmail.com, linux@armlinux.org.uk, si.yanteng@linux.dev,
 0x1207@gmail.com, Joao.Pinto@synopsys.com, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250128_042008_164876_DCE83990 
X-CRM114-Status: GOOD (  10.37  )
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
by Paolo Abeni <pabeni@redhat.com>:

On Mon, 27 Jan 2025 10:38:17 +0900 you wrote:
> This series includes patches that checks the devicetree properties,
> the number of MTL queues and FIFO size values, and if these specified
> values exceed the value contained in hardware capabilities, limit to
> the values from the capabilities. Do nothing if the capabilities don't
> have any specified values.
> 
> And this sets hardware capability values if FIFO sizes are not specified
> and removes redundant lines.
> 
> [...]

Here is the summary with links:
  - [net,v4,1/3] net: stmmac: Limit the number of MTL queues to hardware capability
    https://git.kernel.org/netdev/net/c/f5fb35a3d6b3
  - [net,v4,2/3] net: stmmac: Limit FIFO size by hardware capability
    https://git.kernel.org/netdev/net/c/044f2fbaa272
  - [net,v4,3/3] net: stmmac: Specify hardware capability value when FIFO size isn't specified
    https://git.kernel.org/netdev/net/c/8865d22656b4

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



