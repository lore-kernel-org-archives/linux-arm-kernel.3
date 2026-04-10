Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F18B0F459EF
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Apr 2026 16:07:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NY3KWEUOusIIfG2oing/yfJNg81guQtT/ZD/qoygk5k=; b=GfBrkvImBpEQTO3DLv0fbKFkoj
	kN8dHOQCCxqbERyiou/iWvPslCDM2/U0UtQ/Fp8kJV9/Rhu21ZVZpgeZ6ynXKpUCoKz+oQ8LPJEca
	6Xpn/W1j5g3a5t8NDyNiOuq4J8cPfpwqgZCvOEvxsL8tvpxrxcD7NRy7e4QZgvoT4NI5xcunwpflt
	W6uu0SkAlDIpZ5YWA0bkP3N2ztFqH6q6TRO/EGN8eBNMoz3KxXZ4wPI9yFdHLW6DctR5YnJhmbj/4
	klwpB2v6zgvOE70EguJdtdctkHx2z/vq1yYsE/o9SLKwjuCXkJNca2/1IFG4G9pj4LCXBPEXDuEQZ
	AUTw6ueg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBENo-0000000CVwn-2j6n;
	Fri, 10 Apr 2026 16:07:00 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBENm-0000000CVw2-1c86;
	Fri, 10 Apr 2026 16:06:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3EF3840666;
	Fri, 10 Apr 2026 16:06:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1EC58C19424;
	Fri, 10 Apr 2026 16:06:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775837217;
	bh=InBJWG19h0+ocfWhzOz5yXHmGn26YdyrjOCUIv8oAQ4=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=O/iEoR7q5dHHj3xFLfWvvDYNxicAeYLLXMR1Y6Vpcrvc2qeKOuw1xzL09mFJZ/Fbh
	 FLdsH9dhbHVNBZDwGIaRTmaiYrDDxFrKFsKwqKPjafN/XA2Q3kVYC1HBoTPd2++4aC
	 q7l1PhRJF0E7Wr6ZRkMAsLMeyOpj1TbKpe8kfIFibS1vgPhjrZA+BTm2hIk8kQz7sj
	 eXHDpj7Ki5psNpNN25XiVN166bUWGpVw8o0h2PKN6HcTqJwb4VeBXUPNrcpmWOln8Z
	 XP1CHiJrjY+NGchAlyl/XdhBQ+LT4gkZmmuv7gsh0uOwhXoF8I7p/nvMmcrfNbXqS3
	 PEG2yE2y932Yw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 02CE13809A87;
	Fri, 10 Apr 2026 16:06:33 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v5 0/8] Bluetooth: Add MediaTek MT7927 (MT6639) support
From: patchwork-bot+bluetooth@kernel.org
Message-Id: <177583719178.2534919.12672771691448146176.git-patchwork-notify@kernel.org>
Date: Fri, 10 Apr 2026 16:06:31 +0000
References: <20260331-mt7927-bt-support-v5-0-6f31b4342daa@jetm.me>
In-Reply-To: <20260331-mt7927-bt-support-v5-0-6f31b4342daa@jetm.me>
To: Javier Tia <floss@jetm.me>
Cc: marcel@holtmann.org, luiz.dentz@gmail.com, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, linux-bluetooth@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, xelnaga@gmail.com, jnetto@mineiro.io,
 melinko2003@gmail.com, chapuisdario4@gmail.com, 3193631@gmail.com,
 nitin.reddy88@gmail.com, tibo@humeurlibre.fr, lubnin.ivan@gmail.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260410_090658_439696_99A5A9C8 
X-CRM114-Status: UNSURE (   9.07  )
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

On Tue, 31 Mar 2026 11:09:30 -0600 you wrote:
> Add Bluetooth support for the MediaTek MT7927 (Filogic 380), a PCIe
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
  - [v5,1/8] Bluetooth: btmtk: Add MT6639 (MT7927) Bluetooth support
    https://git.kernel.org/bluetooth/bluetooth-next/c/2e16247422fb
  - [v5,2/8] Bluetooth: btmtk: fix ISO interface setup for single alt setting
    https://git.kernel.org/bluetooth/bluetooth-next/c/798c2ba5006c
  - [v5,3/8] Bluetooth: btusb: Add MT7927 ID for ASUS ROG Crosshair X870E Hero
    https://git.kernel.org/bluetooth/bluetooth-next/c/3e148151bc75
  - [v5,4/8] Bluetooth: btusb: Add MT7927 ID for Lenovo Legion Pro 7 16ARX9
    https://git.kernel.org/bluetooth/bluetooth-next/c/fa528d431d10
  - [v5,5/8] Bluetooth: btusb: Add MT7927 ID for Gigabyte Z790 AORUS MASTER X
    https://git.kernel.org/bluetooth/bluetooth-next/c/a4a3b78a8b3d
  - [v5,6/8] Bluetooth: btusb: Add MT7927 ID for MSI X870E Ace Max
    https://git.kernel.org/bluetooth/bluetooth-next/c/b8185eff87a7
  - [v5,7/8] Bluetooth: btusb: Add MT7927 ID for TP-Link Archer TBE550E
    https://git.kernel.org/bluetooth/bluetooth-next/c/54834ec3a5b0
  - [v5,8/8] Bluetooth: btusb: Add MT7927 ID for ASUS X870E / ProArt X870E-Creator
    https://git.kernel.org/bluetooth/bluetooth-next/c/b816ef8a31b7

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



