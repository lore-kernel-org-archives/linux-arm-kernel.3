Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5726C021A9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Feb 2025 00:31:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k+CVnFJ4ICfnmzXz87lZkwc+AqjEbc+S9K2HW3KB0dg=; b=zllY9QPAv+smCqp+H4fuI4Qixi
	6CvQBCjhUu8pViYdDRkPdAkQ6jlHcHp0FrOrMvBdyF6e2fr7K/RBaO6ehmW+pBF9qrCkUlNjvH7ny
	Ag0mcWYa3V+Ks3Ns7KLTMRspGjA6Uu16Jea5/p3fIsfouFy63+jqaOU4UPjbWrvpEYp0OxVVLd+Pu
	zoU8JUVSNWJLr0IKpUtzzxCIsuYA6Fvop0tTXhciD6r7kL/Jz7kvpfzY91yQKc/MQQyR3b05WXo94
	ngE4kxfSozOHo7p8oM4OChstb/JZvKeCW/PGRHC/L4bfm3R3TeJtsBx1KmosKVzDYndxcuTKsMdck
	g20fjh5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkBWS-00000006Kww-3Q5C;
	Tue, 18 Feb 2025 00:31:36 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkBUz-00000006Klk-0s32;
	Tue, 18 Feb 2025 00:30:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 7E4DFA41B88;
	Tue, 18 Feb 2025 00:28:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14468C4CEE7;
	Tue, 18 Feb 2025 00:30:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739838603;
	bh=d6CWwgW19OdA/2Ji7FIZ+CWAq2AbqXRMXAygzlW8J8M=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=im1MYjQmyAtO7fQn6VjXNUjFYQ2QhbuAivdMVXl8TI6fAuzwPmTvY1YkeeHwlgB/c
	 QuN/Nczrc8peJ69yW5gtJao/krpdVfDSlpnQEthZFteXbwHm0mSfh9AJ59JzkpoiMt
	 vo9V8v9KtMdzqrJ/KU3/z4jAFRQlRRkh6GyCuSDX0bI4N8XPUzfYu4RRb2f7fiOQ/r
	 34SBT+FKp/l0lMatdaLGO3duX0GYFAbeCn5W44eLD3DbSpY5bw6/yREIgPUh8PJx8h
	 hKPDBTjOZUilbI13iyncqNj5xtOT8HOd2Ey5/o4PdS7ESduFpAVYmjbOs1r8dOMKO1
	 SnIRucQI2Chww==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 71762380CEE2;
	Tue, 18 Feb 2025 00:30:34 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next v2 0/5] net: phy: mediatek: Add token-ring helper
 functions
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <173983863299.3581223.1664796707026603430.git-patchwork-notify@kernel.org>
Date: Tue, 18 Feb 2025 00:30:32 +0000
References: <20250213080553.921434-1-SkyLake.Huang@mediatek.com>
In-Reply-To: <20250213080553.921434-1-SkyLake.Huang@mediatek.com>
To: =?utf-8?b?U2t5TGFrZSBIdWFuZyAo6buD5ZWf5r6kKSA8c2t5bGFrZS5odWFuZ0BtZWRpYXRl?=@aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org,
	=?utf-8?b?ay5jb20+?=@aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org
Cc: andrew@lunn.ch, hkallweit1@gmail.com, linux@armlinux.org.uk,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 daniel@makrotopia.org, dqfext@gmail.com, SkyLake.Huang@mediatek.com,
 matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
 horms@kernel.org, linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Steven.Liu@mediatek.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250217_163005_312527_68821CC2 
X-CRM114-Status: UNSURE (   8.15  )
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

On Thu, 13 Feb 2025 16:05:48 +0800 you wrote:
> From: Sky Huang <skylake.huang@mediatek.com>
> 
> This patchset add token-ring helper functions and moves some macros from
> mtk-ge.c into mtk-phy-lib.c.
> 
> Signed-off-by: Sky Huang <skylake.huang@mediatek.com>
> 
> [...]

Here is the summary with links:
  - [net-next,v2,1/5] net: phy: mediatek: Change to more meaningful macros
    https://git.kernel.org/netdev/net-next/c/2f435137a048
  - [net-next,v2,2/5] net: phy: mediatek: Add token ring access helper functions in mtk-phy-lib
    https://git.kernel.org/netdev/net-next/c/afa08fde7c47
  - [net-next,v2,3/5] net: phy: mediatek: Add token ring set bit operation support
    https://git.kernel.org/netdev/net-next/c/40d33d6d3c90
  - [net-next,v2,4/5] net: phy: mediatek: Add token ring clear bit operation support
    https://git.kernel.org/netdev/net-next/c/4786eff288bc
  - [net-next,v2,5/5] net: phy: mediatek: Move some macros to phy-lib for later use
    https://git.kernel.org/netdev/net-next/c/be378ebd6cfb

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



