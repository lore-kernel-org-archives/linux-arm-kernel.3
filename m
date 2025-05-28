Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 909FDC5AD49
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 May 2025 01:22:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LUNfJZwZpOwsGUio5AbrVHRa7zVGRHpu52TThY9D804=; b=OAqzDiHpKQwcujLSWNDPCG+bbx
	3MCleBJCuM6u9Rc9OPFpUDiN1adt1QnEbNVBo+IHfkNXRc5uGYES+CYVN8QJ2FDndxMbDdgpYMqtX
	35Ou0DvjpRO7z4ljzgW3Um7QZ78/qwo5jszaBcTPeZNk2rQ00bbCZlWpUnwTZGiS7NxaNnppG76s4
	4jxFK1hLa3rgLArLZcuh6ZeV0Z1ZKOxqmgZw5G+dBDQOVz7UazLza4kNCsRUxTMmr3CWU5NoxW9Ce
	V1KJqbYvWUDYUZiOnMNKOOrDQJbVLWzN5wvwyA1TLiQTmqyPV4LaU1+OWZ+aaP9OYxhZF0ap5HcZy
	aH9+GQkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uK5Ut-0000000BsyI-2Dch;
	Wed, 28 May 2025 01:22:23 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uK5Sk-0000000BscB-31nU;
	Wed, 28 May 2025 01:20:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 4135EA4F69B;
	Wed, 28 May 2025 01:20:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6D02C4CEE9;
	Wed, 28 May 2025 01:20:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748395207;
	bh=m3QrveW3xV5EfuvOTv2NxE5UGUIv1X8HYHGlnoy2QMU=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=QwsOZrthoiRtdDSxr2+iS+ztsOZjpmXeZQIs2HLNItofnDBw59If+rNh8T1ORTBaH
	 njXmfi9yyOcQZJCKJbx7YGs7sY9ehLoOkuOrnLSYsInRkwwDJAnRDApbutBU0VC2Ii
	 LNOoKB6chb5g0qF1bj3Bqd0QEsZPDY6DgjDl16L9rWLrsOor+p9mjAxMtB9l9ilyh0
	 JB13zUXSI5KWAwfhUt+HkjcpRnP86ebVFdtfgcRhH9xmOinxIFrFBcnmD1RSfFtUBN
	 LqNbpKfqteHCGyo3SbrYVhE7W/HmlZNNXNbIdRlXiF91/aDgCMQxistoMfeFiNNeF5
	 wmko1C89JBhdQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33F25380AAE2;
	Wed, 28 May 2025 01:20:43 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [net-next PATCH 0/3] net: dsa: mt7530: Add AN7583 support + PHY
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <174839524201.1849945.3988099260497875532.git-patchwork-notify@kernel.org>
Date: Wed, 28 May 2025 01:20:42 +0000
References: <20250522165313.6411-1-ansuelsmth@gmail.com>
In-Reply-To: <20250522165313.6411-1-ansuelsmth@gmail.com>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: andrew@lunn.ch, olteanv@gmail.com, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, chester.a.unal@arinc9.com,
 daniel@makrotopia.org, dqfext@gmail.com, sean.wang@mediatek.com,
 SkyLake.Huang@mediatek.com, hkallweit1@gmail.com, linux@armlinux.org.uk,
 arinc.unal@arinc9.com, Landen.Chao@mediatek.com, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250527_182010_829911_BC2637CA 
X-CRM114-Status: UNSURE (   7.67  )
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

On Thu, 22 May 2025 18:53:08 +0200 you wrote:
> This small series add the required changes to make Airoha AN7583
> Switch and Internal PHY work due to strange default configuration.
> 
> Christian Marangi (3):
>   dt-bindings: net: dsa: mediatek,mt7530: Add airoha,an7583-switch
>   net: dsa: mt7530: Add AN7583 support
>   net: phy: mediatek: Add Airoha AN7583 PHY support
> 
> [...]

Here is the summary with links:
  - [net-next,1/3] dt-bindings: net: dsa: mediatek,mt7530: Add airoha,an7583-switch
    https://git.kernel.org/netdev/net-next/c/fef184880923
  - [net-next,2/3] net: dsa: mt7530: Add AN7583 support
    https://git.kernel.org/netdev/net-next/c/d76556db10bf
  - [net-next,3/3] net: phy: mediatek: Add Airoha AN7583 PHY support
    https://git.kernel.org/netdev/net-next/c/8bc3c234dcb6

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



