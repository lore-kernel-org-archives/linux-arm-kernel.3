Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 105F5C61DD6
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Sep 2026 20:31:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Pf6D2QdPe3vyn6eNxdFTAjUb0lCC1yH/tOKj9y52YZk=; b=nri87dmbqLTNxT3EhEmFLtSZqg
	+Q80Txso/FhxnP54PXTaUOTGq6lG1mRVDU438YGrSJXFJ2NjNJvB2W5s4LrcvUn9p2vrSIOWIiSNs
	VDvo+DVGkzeSJL0gIaIxa4PKLikXsDEz1PtLPLK5+wUhiMPVg043qyzFRbogPsgLWfnYqHOx7n4Ko
	vH8GmCaUapStASJvjvYvksp8GgNJUx7OpTCv37TvJ/j4n0IASNi7g9zsPlZpSfXnz4hAT3OwC9W4C
	Co59elB1tN1lcJBT2RT4t2AvOD/hbo6EzdZ//Puz7vzwHENwWQxeiU3XuKclAvBJ/Eb/NHh61Vo6H
	u3IXQG4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1V8M-0000000DKcU-0zxY;
	Tue, 01 Sep 2026 20:31:06 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1V8K-0000000DKcD-47oM;
	Tue, 01 Sep 2026 20:31:05 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 05C2A6022E;
	Tue,  1 Sep 2026 20:31:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF3B01F000E9;
	Tue,  1 Sep 2026 20:31:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788294663;
	bh=Pf6D2QdPe3vyn6eNxdFTAjUb0lCC1yH/tOKj9y52YZk=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=E1QnKl6m5uFvWmenRHuUEL3giM1o2ezbQZRPn9I0OGj1TZL9B1rLbNLQVbXqrwb+3
	 Z6zK+RMHQVkHbBw+VnKaAhuobVxNgCmEFJ2/KJTuXVZtZoL76lGLRK4xVJ6ZUw+Rnb
	 6fSUvFFfHuF8IRZ1BJ0xhnwAvrtzja/3Ky/kSkFgtVtBVPAvkEB7qCx5C0A0oSN+A3
	 I+9hFTaZ/nTXvzy1WalZHXGct3+NxT7LLTHIIhv0f/QpCLyAt7LkotCDWvqHtGw3o8
	 5doFEY6D50uUPSQ1ocJzLJkK+YudWksyEGqdEeKXXLoMeAHU8sQFd9a6R+zE5aWWRc
	 YunmKA0rwim3Q==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 5696539253F2;
	Tue,  1 Sep 2026 20:30:07 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v3] Bluetooth: Properly disable remote wakeup for
 MT7922/MT7925 on Ryzen platform
From: patchwork-bot+bluetooth@kernel.org
Message-Id: <178829460590.1836726.11844830813053776119.git-patchwork-notify@kernel.org>
Date: Tue, 01 Sep 2026 20:30:05 +0000
References: <20260902-btmtk-ryzen-remote-wakeup-v3-1-8a733d0edd7c@rong.moe>
In-Reply-To: <20260902-btmtk-ryzen-remote-wakeup-v3-1-8a733d0edd7c@rong.moe>
To: Rong Zhang <i@rong.moe>
Cc: marcel@holtmann.org, luiz.dentz@gmail.com, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, luiz.von.dentz@intel.com,
 Chris.Lu@mediatek.com, Will-CY.Lee@mediatek.com, ss.wu@mediatek.com,
 linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 rafael@rcpassos.me
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

This patch was applied to bluetooth/bluetooth-next.git (master)
by Luiz Augusto von Dentz <luiz.von.dentz@intel.com>:

On Wed, 02 Sep 2026 02:19:18 +0800 you wrote:
> It is reported that a remote wakeup could cause MT7922/MT7925's btusb
> interface completely unresponsive. Resetting the xHCI root hub doesn't
> help at all, and recovering from such a state needs a power cycle.
> 
> All reports seen to be relevant to Ryzen-based laptops. These NICs are
> usually used as OEM components thanks to some sort of reference designs.
> Their popularity on other platforms is unclear. While there is still a
> chance that the quirk may exist on other platforms, be cautious and only
> apply the quirk to direct children of Ryzen platforms's root hubs for
> the time being. In most cases the root hub is on the SoC or PCH, which
> needs the quirk. Unfortunately, this can't distinguish root hubs on PCIe
> add-in cards. Such roughness should be acceptable, as PCIe USB
> controller add-in cards are less commonly used nowadays. On the other
> hand, applying the quirk doesn't hurt any functionalities either, as the
> device can still be used as a wakeup source if desired. Theoretically,
> we could retrieve the root hub's PCI vendor ID with some hierarchy
> magic, but that's too intrusive...
> 
> [...]

Here is the summary with links:
  - [v3] Bluetooth: Properly disable remote wakeup for MT7922/MT7925 on Ryzen platform
    https://git.kernel.org/bluetooth/bluetooth-next/c/512bf4484766

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



