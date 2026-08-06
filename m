Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0474DC55ABF
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Aug 2026 13:00:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wRqcmRy7CLmoDyS66+DULYDtYqTbfNYO5q1iOPEcNYQ=; b=Km8skgyS5aSOxVahZaT03Mr55R
	AK8FoPUxV+iTpAIrsX1iJUuYF99xCl4Kmh2CGfjiI8gZcsBYQP7olZ+ZPDvy9nL49BXEUkmZ0jggP
	0wWVGSzLoyu4h1fCFWtGMT2c2pX0jGZO8aI0BUHYV1OhL/QS9lIuB/X92T76j4w9/CbZ98atfcg/6
	69jpSMQKle3MdHCGeGa5XyZ1C7z6oSiEsBlRGIHR9LyrpoQ2t7+SPpD4PK2qEGWGeNkZG0wQjUWV2
	0GIoIlyaGYn0UTSXKfKk6QYY1Z6Er7UqxbuXPP189iDzQu/IPlGCazuL9rPn+nI7RDCof78l8PlDL
	g5hiqeNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrxiK-00000005q3l-1ku9;
	Thu, 06 Aug 2026 13:00:48 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrxiJ-00000005q3V-1Rig;
	Thu, 06 Aug 2026 13:00:47 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id C636560A96;
	Thu,  6 Aug 2026 13:00:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7BD5A1F000E9;
	Thu,  6 Aug 2026 13:00:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786021246;
	bh=wRqcmRy7CLmoDyS66+DULYDtYqTbfNYO5q1iOPEcNYQ=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=eYUZNsGv2UZWGZfDy6Oz+I73UkNuXk1aYveudLWQY0vkzi2dMjOr1VAf1+Wa9leO1
	 iB+qt+rnmzt3p006n8vvQqioNqea2c+YOBdPo/yrnvBypuze0ZSXraY+oNG9JGsmsP
	 xNP1nYEzFk3fyt9wyA6n7PVR7j0B9slXKuONM+qyTbo441Tp/GrhR+6Npu/neTChqu
	 G/nDcHJFInnzW3jzTj8O7NE+ofy9gCLFGMjares//hYn7N6GbfIGBtqFfR5QkH5koo
	 gz/iZeuBjz+0tEors4Do0au04Z1IBycIYHjdZHcODuKmqvMJvMXDUeDKwMeURy8icd
	 9JiSwGrvyiXCw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 19862380820D;
	Thu,  6 Aug 2026 13:00:07 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net] net: phy: mediatek: fix TX blink masks using the RX
 bits
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <178602120563.832117.16144265633708146287.git-patchwork-notify@kernel.org>
Date: Thu, 06 Aug 2026 13:00:05 +0000
References: <20260804113511.3371248-1-naseefkm@gmail.com>
In-Reply-To: <20260804113511.3371248-1-naseefkm@gmail.com>
To: Ahmed Naseef <naseefkm@gmail.com>
Cc: netdev@vger.kernel.org, davem@davemloft.net, andrew@lunn.ch,
 angelogioacchino.delregno@collabora.com, daniel@makrotopia.org,
 edumazet@google.com, hkallweit1@gmail.com, kuba@kernel.org,
 matthias.bgg@gmail.com, pabeni@redhat.com, dqfext@gmail.com,
 linux@armlinux.org.uk, SkyLake.Huang@mediatek.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org
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

This patch was applied to netdev/net.git (main)
by Paolo Abeni <pabeni@redhat.com>:

On Tue,  4 Aug 2026 15:35:11 +0400 you wrote:
> MTK_GPHY_LED_TX_BLINK_SET and MTK_2P5GPHY_LED_TX_BLINK_SET are built
> from the RX blink bits instead of the TX ones, so both TX masks are
> identical to their RX counterparts. The TX bits they should be using,
> MTK_PHY_LED_BLINK_{10,100,1000,2500}TX, are otherwise only referenced
> by the per-speed branch of mtk_phy_led_hw_ctrl_set().
> 
> A TX trigger selected without a link trigger therefore programs the RX
> blink bits, and the LED blinks on received traffic. The masks are also
> used to decode the blink register in mtk_phy_led_hw_ctrl_get(), which
> as a result cannot tell the two triggers apart: an RX-only
> configuration reads back as RX and TX, and a TX-only configuration
> reads back as neither.
> 
> [...]

Here is the summary with links:
  - [net] net: phy: mediatek: fix TX blink masks using the RX bits
    https://git.kernel.org/netdev/net/c/f684c514f796

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



