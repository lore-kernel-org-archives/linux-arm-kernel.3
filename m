Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7729EC83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Jul 2025 13:58:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ccWq+a961j2WZW8WYakSIm0ZFUqS2/5kE90b3G9s1Zw=; b=o6lfeK6m6GkuO+BulM6T300YK8
	CJH3X6RfaaAxT9oP8ESCMXmo/2tftJ/lFcL57ruy22E9vomv3oYxjn/BHLoMDbZlhoLI4rgXS9Yz1
	xhXTnaQQ3uG2DNh6S421wbL1QMP+8X34iKGFE3oRuzSkHtg8UtxrJPMW5ucWsMSOUjkYXRHOdKib4
	XpDHeu6A0tE8zhEJLi1g2pESca7pxo01oz7t7ni1ivj5og4t/7bhp+eLYzElGMBVyD0GVznOLuCIn
	dLqzcqNahtOulJ0fjF/4A9tOsac3d0ZtilJcOlp0UTs58Uex2a4PaweGOe4bw21VDK9Ufwl6NEZ7l
	w8KEUu8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaEGL-0000000Ey61-0jpH;
	Fri, 11 Jul 2025 13:58:05 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaE8J-0000000Ewv9-0SZb;
	Fri, 11 Jul 2025 13:49:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 1D9615C7124;
	Fri, 11 Jul 2025 13:49:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7D79C4CEED;
	Fri, 11 Jul 2025 13:49:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752241785;
	bh=UFDdrcPLJ6i3OpdTDDcWFXhe3Rcu0dfIq/WI277FTg8=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=pYGeJrjWQVIu+bKZ0c0vIUzaOvxTuILhU0KhapNdUtv1MTN6U13fHW/wuQiFhwD2I
	 /Xjq7f6hES4/vGj4NHJmGsx01bLRWX5LsvDlhsWcDAzYavBEqcPhYfIka2rQWJdKTf
	 Osf+b0isdeIEr2VuDC8alh9nTnawn0/72ZQfUmrD453me1m8QifPMGnmaG7PHet+PP
	 0u6OjAUn2n9tv0ebc9B9YQQ8I0mA1pZvzyuxD8Cc3w9fUYjIcf3MUMJl8R2ruuboUz
	 mP7AgJRu/80QHpzDTc7KQ0N76hGk/NsglE1jLpgtabdjAYREJcF/NSXzysJG1lKxWS
	 N3k566Gvm9Ywg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id DD392383B275;
	Fri, 11 Jul 2025 13:50:08 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v2 0/7] Bluetooth: Fix typos
From: patchwork-bot+bluetooth@kernel.org
Message-Id: <175224180783.2277896.14693656286247860875.git-patchwork-notify@kernel.org>
Date: Fri, 11 Jul 2025 13:50:07 +0000
References: <20250703171815.1011001-1-hadess@hadess.net>
In-Reply-To: <20250703171815.1011001-1-hadess@hadess.net>
To: Bastien Nocera <hadess@hadess.net>
Cc: trivial@kernel.org, marcel@holtmann.org, luiz.dentz@gmail.com,
 sean.wang@mediatek.com, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, sven@kernel.org, j@jannau.net,
 alyssa@rosenzweig.io, neal@gompa.dev, johan.hedberg@gmail.com,
 mingo@kernel.org, tglx@linutronix.de, viro@zeniv.linux.org.uk,
 kees@kernel.org, erick.archer@outlook.com, chris.lu@mediatek.com,
 linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 asahi@lists.linux.dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250711_064947_194082_1C00C794 
X-CRM114-Status: UNSURE (   7.50  )
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

This series was applied to bluetooth/bluetooth-next.git (master)
by Luiz Augusto von Dentz <luiz.von.dentz@intel.com>:

On Thu,  3 Jul 2025 19:16:54 +0200 you wrote:
> Found using codespell.
> 
> Probably best taken in through the Bluetooth tree.
> 
> Changes since v1:
> - Added whether typos were in comments or log strings
> - Fix typo in typo fix ("btrtl: Fix typo")
> 
> [...]

Here is the summary with links:
  - [v2,1/7] Bluetooth: btintel: Fix typo in comment
    https://git.kernel.org/bluetooth/bluetooth-next/c/728beb9bb8b3
  - [v2,2/7] Bluetooth: btmtk: Fix typo in log string
    https://git.kernel.org/bluetooth/bluetooth-next/c/03b2d5bf4881
  - [v2,3/7] Bluetooth: btrtl: Fix typo in comment
    https://git.kernel.org/bluetooth/bluetooth-next/c/5d12ca753070
  - [v2,4/7] Bluetooth: hci_bcm4377: Fix typo in comment
    https://git.kernel.org/bluetooth/bluetooth-next/c/aa0d0b408a5a
  - [v2,5/7] Bluetooth: aosp: Fix typo in comment
    https://git.kernel.org/bluetooth/bluetooth-next/c/033ea129991b
  - [v2,6/7] Bluetooth: RFCOMM: Fix typos in comments
    https://git.kernel.org/bluetooth/bluetooth-next/c/b14c362ad112
  - [v2,7/7] Bluetooth: Fix typos in comments
    https://git.kernel.org/bluetooth/bluetooth-next/c/c819e415efb3

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



