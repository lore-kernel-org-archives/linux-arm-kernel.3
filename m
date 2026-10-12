Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 490E3CA9ED1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Oct 2026 17:10:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hc/oIL8Ed/OJioHm81H3P3M65VQzRDdkE//KITJseZg=; b=QX2gSDBMYaWATbNkETZozRkwK0
	MIcEx7Q6h8ykJKwr0GrnQ+GQx6NStLwawezMKGPEY5AqypCdJruHqpYjjfbdrNCxuxolNADzoqXrf
	bz6fs3Xqrz0cwWjRi2n6BNeYiX3bE0onDqSibJFGbUDEaeWUfG/uEmcsfJbUdU5jd9ynNgtrRd8LR
	vwpgkC8ytqZF2LO2Wfv8yZJ0DXyZtwM77jIuOm5pinT5BRYJ6IB9NssTqOYyz92PL92DHdaKEx6vW
	expR0fpPSLGVApT2+Vc2C58cyv4a5/SnuwpKNLs7i2/aibR48mjXle7KSUXw7FarFOvibl8Bc/2ig
	mDTZEnmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGJXM-0000000B3wg-3Dww;
	Mon, 12 Oct 2026 17:10:08 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGJXL-0000000B3wJ-2ugD
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 Oct 2026 17:10:07 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id D074D600E2;
	Mon, 12 Oct 2026 17:10:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84F631F0089C;
	Mon, 12 Oct 2026 17:10:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791825006;
	bh=hc/oIL8Ed/OJioHm81H3P3M65VQzRDdkE//KITJseZg=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=GfSUaghCPh1Ns33aE1cAVACMlIu1Q5BVrR717Zdly6q5JrwNVHzWrUbHrwDSF63c6
	 HeTcp+9j7IboC85/01+1TdlZeKozIEU26n7IuyM7aCO/CXLXzi17GoN5GSHXl+HJFt
	 CY74rfhGvuLBBFC6kOLDSKAGlJwgxyFrWfG5mgBolrbRxbWentGyVyvdCKiG3D5q+M
	 zOMmELMldxVZ1+89tkuLeoZAVpkx+3guzUrrFmTMdVvwjeVK0khDMgoF+7icvoqoDl
	 zH4Up63wq8JsWo1XVf5B3XWc2TbkeeNAOvmx+CQnMXqiWk3KkJ0+Tn+CNTE3o1AjAt
	 BeQyw8agNa9RQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 774FF3924A64;
	Mon, 12 Oct 2026 17:10:06 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next v5 0/3] net: stmmac: Introduce hw queue priority
 offload
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <179182500527.3547638.11327393351212473123.git-patchwork-notify@kernel.org>
Date: Mon, 12 Oct 2026 17:10:05 +0000
References: <20261006-stmmac-mqprio-prio-offload-v5-0-d7da93419784@oss.qualcomm.com>
In-Reply-To: <20261006-stmmac-mqprio-prio-offload-v5-0-d7da93419784@oss.qualcomm.com>
To: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Cc: maxime.chevallier@bootlin.com, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com, olteanv@gmail.com,
 0x1207@gmail.com, daniel@riscstar.com, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, dcaratti@redhat.com
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

On Tue, 06 Oct 2026 12:46:24 +0200 you wrote:
> Implement the offload of the tc mqprio hw queue priority in the stmmac
> driver. This feature requires the mqprio to be configured in channel
> mode.
> Do not overwrite real_num_tx_queues configured by the qdisc in
> stmmac_hw_setup().
> 
> The misbehaviour has been reported by Shashank and the patch has been
> tested on a Qualcomm RB3-Gen2 board.
> 
> [...]

Here is the summary with links:
  - [net-next,v5,1/3] net: stmmac: set real_num_tx_queues to max(offset + count)
    https://git.kernel.org/netdev/net-next/c/d12821266759
  - [net-next,v5,2/3] net: stmmac: align real_num_tx_queues to mqprio configuration
    https://git.kernel.org/netdev/net-next/c/ac1ca0c3e139
  - [net-next,v5,3/3] net: stmmac: add tc mqprio hw queue priority offload
    https://git.kernel.org/netdev/net-next/c/47891d501e34

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



