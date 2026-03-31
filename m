Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAD3C10F92E0
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 31 Mar 2026 16:50:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mCEk1mzGPwHXI9US3EUUquhGmHolsu3eK9XGd/s4wvA=; b=rl2Cno2b1x/j1kZY4tHaX4I5L3
	jaDu+4zSYqBqSpHy38H3DpHMqX/mBAsjJXd/N1wlqkzDrq4OPtfBy6DN0CWnOr4/SxdwmOwEUKu+z
	S/Xws3UiPMw0U8VEYfZwVmbVd9ql+s4anfcV/1+VEzuabS0O9OduKVwNl7Lha2BmLExw5kTDluZb9
	2O6R5dRyt5ydioH4+dvoKiSUV8l4LXOO9acUYJlYNxJAgJJSmDH6xtvh0EQ71crru7X7xsSveHJoA
	dFe355slZ96gsiC7oGA/nimlrOeiRdDyXLtlEf2mPSSiJp52tCK7o2kmMbeOH1IbVom4DHOKnEet3
	ZrMY0/VQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7cIR-0000000DHZj-44EP;
	Tue, 31 Mar 2026 16:50:31 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7cIL-0000000DHWn-0ZR3;
	Tue, 31 Mar 2026 16:50:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 29F5E444C7;
	Tue, 31 Mar 2026 16:50:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0750EC19423;
	Tue, 31 Mar 2026 16:50:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774975824;
	bh=yPbT/W313OSJoZ8O0RXZ7diQTSAMILjsVYypreYNEew=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=VouOZYbE5mttvfHFRwlMgQzatPf1c619iwkQnBoyE8tBQw6Gk+aQ4jMdrOqblMtiW
	 QZdHJ/pw73UBWAwwnECkyX3Vnr+yB+Ue4ND4A4JJqGxt5I8iBVmNa+N26MURipssNG
	 w4k6bmD/pbthSrbTtao4W2Zu6PYFPdzxvTpjlaieEj2c3L3Lj4i9GKI5p0/5T7nhnH
	 ts5BcrRKSQjWItX9d69IvvRG/XzFa8OZdteH0cC5nBLMRMz9u1zxbJqDZt3e9brxTK
	 8HBH6qflQwpUKIkoQPawePE0mH0tpgoaj0GgY/6Xww7pTQf4i8fkxN3L+RggybC+e/
	 QAdQN8cQSbEGQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id B9E4B3809A05;
	Tue, 31 Mar 2026 16:50:08 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v4 0/8] Bluetooth: Add MediaTek MT7927 (MT6639) support
From: patchwork-bot+bluetooth@kernel.org
Message-Id: <177497580753.2805862.5559231119574123982.git-patchwork-notify@kernel.org>
Date: Tue, 31 Mar 2026 16:50:07 +0000
References: <20260330-mt7927-bt-support-v4-0-cecc025e7062@jetm.me>
In-Reply-To: <20260330-mt7927-bt-support-v4-0-cecc025e7062@jetm.me>
To: Javier Tia <floss@jetm.me>
Cc: marcel@holtmann.org, luiz.dentz@gmail.com, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, linux-bluetooth@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, xelnaga@gmail.com, jnetto@mineiro.io,
 melinko2003@gmail.com, chapuisdario4@gmail.com, 3193631@gmail.com,
 nitin.reddy88@gmail.com, tibo@humeurlibre.fr, lubnin.ivan@gmail.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260331_095025_204495_DC900ACB 
X-CRM114-Status: UNSURE (   8.16  )
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

On Mon, 30 Mar 2026 14:39:22 -0600 you wrote:
> combo WiFi 7 + BT 5.4 module. The BT subsystem uses hardware variant
> 0x6639 and connects via USB.
> 
> The MT7927 is shipping in motherboards and PCIe add-in cards from ASUS,
> Gigabyte, Lenovo, MSI, and TP-Link since mid-2024. Without these patches,
> users see "Unsupported hardware variant (00006639)" or the BT subsystem
> hangs during firmware download.
> 
> [...]

Here is the summary with links:
  - [v4,1/8] Bluetooth: btmtk: Add MT6639 (MT7927) Bluetooth support
    https://git.kernel.org/bluetooth/bluetooth-next/c/4cdd001ff03f
  - [v4,2/8] Bluetooth: btmtk: fix ISO interface setup for single alt setting
    https://git.kernel.org/bluetooth/bluetooth-next/c/fe9e35d0b3f1
  - [v4,3/8] Bluetooth: btusb: Add MT7927 ID for ASUS ROG Crosshair X870E Hero
    https://git.kernel.org/bluetooth/bluetooth-next/c/af6731663d8f
  - [v4,4/8] Bluetooth: btusb: Add MT7927 ID for Lenovo Legion Pro 7 16ARX9
    https://git.kernel.org/bluetooth/bluetooth-next/c/70d2954d3051
  - [v4,5/8] Bluetooth: btusb: Add MT7927 ID for Gigabyte Z790 AORUS MASTER X
    https://git.kernel.org/bluetooth/bluetooth-next/c/e4fb2113d5e2
  - [v4,6/8] Bluetooth: btusb: Add MT7927 ID for MSI X870E Ace Max
    https://git.kernel.org/bluetooth/bluetooth-next/c/4be0c8800708
  - [v4,7/8] Bluetooth: btusb: Add MT7927 ID for TP-Link Archer TBE550E
    https://git.kernel.org/bluetooth/bluetooth-next/c/26308f935d23
  - [v4,8/8] Bluetooth: btusb: Add MT7927 ID for ASUS X870E / ProArt X870E-Creator
    https://git.kernel.org/bluetooth/bluetooth-next/c/b65fdb465d54

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



