Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F9FCCD343F
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 May 2026 16:21:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B/Fd4BLg403hhYFSSl/zoMb4X54lIysjOtERx42WcHE=; b=EEouqz3IN9k+X8HjeOwVdFxrmy
	sCc8SK5LuxX7Cd4bPTCN/DcIx/9lIVT/gyJ3gK1Znawh8H0MXXddfbhdsMag8hLuDrn8svZ4deq6m
	zpu6e2TsFoLaurXkAv2Tia+9vdMEXBi8ArmzDeLxn9V13O1MLP/4XPFjVn8qnOmixEuMor4JMvuh0
	2E8UobxaH2AJ7EDcKQIEIiRtSo1u1hfug1NTY4EET/wQvp7iaUUKxPY+gwkoIPtSb1Cit7yGQOcCi
	fvb2n23OBd/l6Iyk5ZfZpcIilcGKHspFPllvyVs9f9rJK64TbW2fXTGPjG33ApIKlNNKrgL8OiSZe
	gV4w27ow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wL1TD-00000004JZQ-11x8;
	Thu, 07 May 2026 16:21:03 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wL1T9-00000004JXr-1HJj
	for linux-arm-kernel@lists.infradead.org;
	Thu, 07 May 2026 16:21:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3ED32416B7;
	Thu,  7 May 2026 16:20:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1870EC2BCB2;
	Thu,  7 May 2026 16:20:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778170858;
	bh=urDw1WgtuawgHybQYaJY9BK5m5+/xhvBD524RXgulv4=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=Lc/oZkr1J3RO7L9WW+piFQVUzmBZLF0kAGruYarVuSGl73lhSYPulgQ/sfC7wtoEl
	 M0naWeCAuDbwxLvPsAcuEDBH2hMPEWGXa3I3oyL82dM0hCETxmj2+xRZHIwIIrcJsu
	 L90ddb3Nn9UAL60bftHBcGgIQZTVhMajYlwbnn9nE7NSLMlcWYcC1yb2vrd69gqe0q
	 JjXxG9xmumoOI9K99+ElPKz/ZqdgxzWh2bOm6ijRuq0PJJ3H+ITn/UhOpVRXEUmz03
	 HEBGs41iaVlauZ3LL+/eYMxW9WTg445KJWBDRiLMgRdYG0XOxQRVtABkXXxbi0mrpB
	 biIvnpeoL15mQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 7CE043930909;
	Thu,  7 May 2026 16:20:08 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net v2 0/4] net: sparx5: misc fixes for sparx5 and lan969x
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <177817080728.4064915.505121017219538235.git-patchwork-notify@kernel.org>
Date: Thu, 07 May 2026 16:20:07 +0000
References: <20260506-misc-fixes-sparx5-lan969x-v2-0-fb236aa96908@microchip.com>
In-Reply-To: <20260506-misc-fixes-sparx5-lan969x-v2-0-fb236aa96908@microchip.com>
To: Daniel Machon <daniel.machon@microchip.com>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, Steen.Hegelund@microchip.com,
 UNGLinuxDriver@microchip.com, bigeasy@linutronix.de, clrkwllms@kernel.org,
 rostedt@goodmis.org, bjarni.jonasson@microchip.com,
 lars.povlsen@microchip.com, p.zabel@pengutronix.de, kees@kernel.org,
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, steen.hegelund@microchip.com,
 linux-rt-devel@lists.linux.dev, andrew@lunn.ch
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260507_092059_363916_B2DC8CE9 
X-CRM114-Status: UNSURE (   9.42  )
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

This series was applied to netdev/net.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Wed, 6 May 2026 09:25:35 +0200 you wrote:
> This series fixes various issues in the sparx5 driver, which also
> serves lan969x.
> 
> Details are in the individual commit descriptions.
> 
> Signed-off-by: Daniel Machon <daniel.machon@microchip.com>
> 
> [...]

Here is the summary with links:
  - [net,v2,1/4] net: sparx5: defer VCAP debugfs creation until after netdev registration
    (no matching commit)
  - [net,v2,2/4] net: sparx5: fix sleep in atomic context in MAC table access
    (no matching commit)
  - [net,v2,3/4] net: sparx5: fix wrong chip ids for TSN SKUs
    https://git.kernel.org/netdev/net/c/b131dc93f7bf
  - [net,v2,4/4] net: sparx5: configure serdes for 1000BASE-X in sparx5_port_init()
    https://git.kernel.org/netdev/net/c/41ae14071cd7

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



