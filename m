Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E96E2C369A2
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 12 Apr 2025 03:32:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3DegDWlFrzAgX1Nd4dR8ZRoXvEwOJGhbIJpumAQtNQ0=; b=uthTbkmYpGhHNVWDnDXXy4fq+p
	/TnlLaU83FyRYmE0VWxEA7t4nVoPJ9SZktsn575kikBklB8YfdzClD41ddFeLy2jD+WKvfnpIQozC
	NFkIkaTUzwMS9lcYIOd8oogVXWtk/65pnmzbPrGaVdhnSaLm0Ch7nTbXqHzF3m6fM1IRkiYi9thUp
	R7Leb/1REZ8FIQCmYjKBlnJ9/t/SpT/I+e0ZLbK6tZcZMmWkliZkWzeViglMCwdp6qelBmaKKDNcz
	CSBhvFIhD1h9Zr8IE0yTpBu0ywRdYFHladiM7wW1nweMPk51gm4nn5FS/O/WmUrmGmwC86OjcUb07
	Cgbz39Gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3Rb0-0000000FM6X-1mHk;
	Sat, 12 Apr 2025 03:31:54 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3RZD-0000000FLwg-1q8o;
	Sat, 12 Apr 2025 03:30:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 8A75B5C663C;
	Sat, 12 Apr 2025 03:27:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26978C4CEE2;
	Sat, 12 Apr 2025 03:30:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744428601;
	bh=iTao/PD4wBGBtQXKQE7u/ERT3gg5FuPO+Oacyr84mXQ=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=kFHwJu4IUwdbRkhKVEo44qRC0GXdUmi3QC7g810KAghAEq44AVxoz90arTMBkkr1d
	 1iEUAiwKFkTUq8W7CeP0l0HnNUfHP+xfy2wmzE/zKYeAMdBpCsaDFXOW9VfRB4mY9T
	 oqRagmHrB6ZSZXKcLqnxU7DKeUPD6YGe8hH09rlv4dmbTHYkSD99Vco16kM8NbQcKP
	 YAe8zja4ZWvFiou9YVPrimdwxNviIyWZO8J2UR9xYF2ihxIlg+H7WgaiFuLUfPbvBX
	 0d4JDl6wP4L1FrsVJbscPD4T1J7ksaVFLD3qsWPIIYiaRsgU7cR6Z/yN9ZRb8ImL3x
	 BS3yBQA5976BA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id AEBBF38111DD;
	Sat, 12 Apr 2025 03:30:39 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [net-next PATCH v2 1/2] net: phy: mediatek: permit to compile test GE
 SOC PHY driver
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <174442863837.564205.525702135577856818.git-patchwork-notify@kernel.org>
Date: Sat, 12 Apr 2025 03:30:38 +0000
References: <20250410100410.348-1-ansuelsmth@gmail.com>
In-Reply-To: <20250410100410.348-1-ansuelsmth@gmail.com>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: andrew@lunn.ch, hkallweit1@gmail.com, linux@armlinux.org.uk,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 daniel@makrotopia.org, dqfext@gmail.com, SkyLake.Huang@mediatek.com,
 matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
 rdunlap@infradead.org, horms@kernel.org, arnd@arndb.de,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250411_203003_520568_A9D53AFB 
X-CRM114-Status: UNSURE (   9.25  )
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
by Jakub Kicinski <kuba@kernel.org>:

On Thu, 10 Apr 2025 12:04:03 +0200 you wrote:
> When commit 462a3daad679 ("net: phy: mediatek: fix compile-test
> dependencies") fixed the dependency, it should have also introduced
> an or on COMPILE_TEST to permit this driver to be compile-tested even if
> NVMEM_MTK_EFUSE wasn't selected. The driver makes use of NVMEM API that
> are always compiled (return error) so the driver can actually be
> compiled even without that config.
> 
> [...]

Here is the summary with links:
  - [net-next,v2,1/2] net: phy: mediatek: permit to compile test GE SOC PHY driver
    https://git.kernel.org/netdev/net-next/c/e5566162af8b
  - [net-next,v2,2/2] net: phy: mediatek: add Airoha PHY ID to SoC driver
    https://git.kernel.org/netdev/net-next/c/6a325aed130b

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



