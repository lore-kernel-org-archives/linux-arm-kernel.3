Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86223EC1433
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Mar 2026 11:50:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jIsK136PeKAmJur+S2U4TLS6GJWVvnVNaiQs7ryFwxQ=; b=TB5/xoRXFlEZ3MfKLR5aROX0DO
	uM7QERt4SNgF+wytPBPTIkeNqEmIu6bZ/qOK6wqGis7MQhbA6orWVCDdeWWPoA5A97T2va1TYy3qV
	mH7QYS2VcOfPAqG0nkX0xQD3ze10+CUkTY/pyKslSGcCALEvLXW97AvpH2auljgQcp29WGvzVOjFp
	VitMAjxuwzY8oCXQPLBgw6AVTfyGCGJ/2VdJAyNLzad5yxa1Bjk0jCRae3rXGOa1EbSgAj6yvH3c1
	n3rwjzbTVCfNOinTXC3vyEkDIbtumaSS2iC0Zt615sEIHtPpxFnzIUCLJDbp/UwkFUwWEACifsypw
	bmjQUNww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxOGR-0000000F6bO-0DEM;
	Tue, 03 Mar 2026 11:50:11 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxOGP-0000000F6ay-1t0L
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Mar 2026 11:50:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 78C1360123;
	Tue,  3 Mar 2026 11:50:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2AC10C116C6;
	Tue,  3 Mar 2026 11:50:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772538608;
	bh=9GLyG+++AmoUClZPw6vDXpyimeIQuYiszXoyeZyFG+0=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=nqSvVayH179lP2OPO1l96rGSaqaO3HtT2PnaIzaQeYvJRF/HhUkkh8ROJ9g8O06uL
	 cpWETR54+979upoYU1ptZOmxY6qRAAI8MMCRmb4JxplF0YYFbwZ8/tgzCJgtA8i2Z1
	 5M9l/MB+RYTGRcyEQ9mdcbNYWTaNjG0tsR5N0rn7Ev8JILj+jNwsGb8nhj2Fo3ynRW
	 x6JNviRtFXq6Iu9ev1t9WJJBXhap1+I92+UuT7Y47FnnfHWtOHL0OhwqRig1co+Cwp
	 J375p9vmd62/BBDKPaiK014JIdAkNwpjps7z6Vix4MrTEMFyY1ADCgzjYND91acWRj
	 0cBHmXlrMqHsw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id BA068380A965;
	Tue,  3 Mar 2026 11:50:10 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next] net: ti: icssg: Add HSR/PRP protocol frame
 filtering
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <177253860929.835747.5608802035058183541.git-patchwork-notify@kernel.org>
Date: Tue, 03 Mar 2026 11:50:09 +0000
References: <20260227174254.3821443-1-danishanwar@ti.com>
In-Reply-To: <20260227174254.3821443-1-danishanwar@ti.com>
To: MD Danish Anwar <danishanwar@ti.com>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, m-malladi@ti.com,
 jacob.e.keller@intel.com, haokexin@gmail.com, vadim.fedorenko@linux.dev,
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, vigneshr@ti.com, rogerq@kernel.org
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

On Fri, 27 Feb 2026 23:12:54 +0530 you wrote:
> Add support for HSR and PRP protocol frame filtering in the ICSSG
> classifier by configuring filter table 3 (FT3) to detect PTP frames
> (EtherType 0x88F7) in HSR/PRP tagged packets.
> 
> Also add rx_class_or_base to miig_rt_offsets structure to support
> RX_CLASS_OR register access, and fix typos in FT1_N_REG and FT3_N_REG
> macros (slize -> slice).
> 
> [...]

Here is the summary with links:
  - [net-next] net: ti: icssg: Add HSR/PRP protocol frame filtering
    https://git.kernel.org/netdev/net-next/c/f56438a74d88

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



