Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3D77E77180
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Dec 2024 04:41:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ykm1AV9CFCLtQVPdB4FhSc1hFDczJwA9ddmam2r+bYM=; b=jEyDjEr1mWsSoaPZxHUL30ZQVy
	ezSCo1xmgVh1AwleVCODK5s/bvLxsiPdMS5Au1VeAFxr3gBvehSXIoGa/7sBFmaFB9XydEdbMrImS
	L+Afm1AN71EGatHytKJIE7cu7ALboauIQWNFUrEX1eJ4lV/V60ArGwU6ZBBzno3cvv23PgfK1C+v0
	qMvKLROzZoILnvnodXy0eu+OKPJ1pwHWSuw6tpulea6hVYeXuRJ+wLWHwBlVAu+vyJqEYT5/391YR
	LCEzwWz5xYaXuN8IaFmn13XEVjW0Yg32XOWZqilB9N+nwBOdi3ZIzr+lMaBfzOLI9zixhperdvj2H
	IwhoY4Fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLb11-0000000GuZg-283Z;
	Thu, 12 Dec 2024 04:41:31 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLazx-0000000GuOS-1ibO;
	Thu, 12 Dec 2024 04:40:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id BB3315C68E4;
	Thu, 12 Dec 2024 04:39:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D95C6C4CECE;
	Thu, 12 Dec 2024 04:40:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733978423;
	bh=OhmCN48ULBLuuzKg8+AywTK0ty+kB4kqBPF6I6N80sw=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=t0OPpF6JmKJTeR7LpTw9iqmJ5glyjRuw0YZU0YldMfSEThlO3/UkcRrruST+7qg1O
	 WGPzuRdpQ1Vlh77YfA0yFWXXq5Db40WVngtSY4mlYtu7Mj5AD3mw/tAm/HOATG2ovG
	 9kz21Sr2ZMiD1HRBdlDJ5rEUq4s8tGVo1QZZXvrZhMAnfQvyqdA0oAiBTrj4cAGDzZ
	 eCsD1IAn72uCIn9fyz4I+aHPQRBNYt5K0YyXYoY4V9bf14f//8i10pIkq/ZDcSIZvI
	 QEnvyENMu35C8Y4+tBgzS9VvB5ECKqy8eRx4qhykI5IBOOaUdmxXk8D/l7Uu7J8XDS
	 lf3Qotb0CxEKg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 342A6380A959;
	Thu, 12 Dec 2024 04:40:41 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next 0/9] net: dsa: cleanup EEE (part 1)
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <173397843974.1849456.11438174584563074655.git-patchwork-notify@kernel.org>
Date: Thu, 12 Dec 2024 04:40:39 +0000
References: <Z1hNkEb13FMuDQiY@shell.armlinux.org.uk>
In-Reply-To: <Z1hNkEb13FMuDQiY@shell.armlinux.org.uk>
To: Russell King (Oracle) <linux@armlinux.org.uk>
Cc: andrew@lunn.ch, hkallweit1@gmail.com,
 angelogioacchino.delregno@collabora.com, arinc.unal@arinc9.com,
 daniel@makrotopia.org, davem@davemloft.net, dqfext@gmail.com,
 edumazet@google.com, florian.fainelli@broadcom.com, kuba@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 matthias.bgg@gmail.com, netdev@vger.kernel.org, pabeni@redhat.com,
 sean.wang@mediatek.com, horms@kernel.org, UNGLinuxDriver@microchip.com,
 olteanv@gmail.com, woojung.huh@microchip.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241211_204025_491872_439CDF86 
X-CRM114-Status: UNSURE (   9.13  )
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

On Tue, 10 Dec 2024 14:17:52 +0000 you wrote:
> Hi,
> 
> First part of DSA EEE cleanups.
> 
> Patch 1 removes a useless test that is always false. dp->pl will always
> be set for user ports, so !dp->pl in the EEE methods will always be
> false.
> 
> [...]

Here is the summary with links:
  - [net-next,1/9] net: dsa: remove check for dp->pl in EEE methods
    https://git.kernel.org/netdev/net-next/c/66c366392e55
  - [net-next,2/9] net: dsa: add hook to determine whether EEE is supported
    https://git.kernel.org/netdev/net-next/c/9723a77318b7
  - [net-next,3/9] net: dsa: provide implementation of .support_eee()
    https://git.kernel.org/netdev/net-next/c/99379f587278
  - [net-next,4/9] net: dsa: b53/bcm_sf2: implement .support_eee() method
    https://git.kernel.org/netdev/net-next/c/c86692fc2cb7
  - [net-next,5/9] net: dsa: mt753x: implement .support_eee() method
    https://git.kernel.org/netdev/net-next/c/7eb4f3d9fe17
  - [net-next,6/9] net: dsa: qca8k: implement .support_eee() method
    https://git.kernel.org/netdev/net-next/c/fe3ef44385b2
  - [net-next,7/9] net: dsa: mv88e6xxx: implement .support_eee() method
    https://git.kernel.org/netdev/net-next/c/eb3126e720e7
  - [net-next,8/9] net: dsa: ksz: implement .support_eee() method
    https://git.kernel.org/netdev/net-next/c/801fd546c1ca
  - [net-next,9/9] net: dsa: require .support_eee() method to be implemented
    https://git.kernel.org/netdev/net-next/c/88325a291a0c

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



