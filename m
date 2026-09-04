Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA6A0C624DE
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Sep 2026 16:57:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DArWlZ88qt5Zn9zhbWsI5i81ZoB9+MlseLF1a24Cnss=; b=JTQ7Cl423LRi4PZEtdVt/UZB36
	Ak39p7FguYnuZbyL5ttZjnf1RAD6k9oZuNNcKg708s708VlzaYbR3bLx3i4BdW/XUfKbiPoGuh87J
	NdfMpMMUPtNE6O2EQLqdCLaw5GNve6/DVUfyWyzGSoEFVKO7Je+V6IakugR/1f8wKewRhnGBSu/eW
	MoteUdoQhcyOw3+qKgtuUmVV4Xy9/4PhdVvHQlNIJdAr+5GgOLnjpKYhx/MLWbW4VrPjPJqt/DmcY
	nzBP7yo/mN0gZWJU/NhX1/NbeSKs3seDB4r5bGfM/nhEQei5S/oUXbb8XtJYgRf+9vp+iIIH6OPdN
	x0xnYAdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2XE3-00000002oRB-29bN;
	Fri, 04 Sep 2026 16:57:15 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2XE2-00000002oQX-2dJ3;
	Fri, 04 Sep 2026 16:57:14 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id DE80E6020C;
	Fri,  4 Sep 2026 16:57:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9702E1F00A3E;
	Fri,  4 Sep 2026 16:57:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788541032;
	bh=DArWlZ88qt5Zn9zhbWsI5i81ZoB9+MlseLF1a24Cnss=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=eYoopY9mM7SF9GSnAKvPEpLmCoCBycX7cXSL9SHrhXncGPWOtsfIoOT2Efticx4NW
	 EVGBLnAwIbQWwW5GISCR3BalmC+cjMPYUyohwXTxuB5fHOD2WlvQX6caHbOdIZzQFr
	 3nLRymd3duzZJ4L4Ank5LpjLWVy/M7aKdjEE0f+NqFOl5TiPxcTAI+YAIaMyKSx1IA
	 jiCurltaptzecZa0Jp5O4k6dxkVS/z8tSKbdjbvtjGW4GOHJVuTAmiRD8pi29PwVeu
	 x23VNoHLFCgpb3u4qRMA/rSwvF6WtskmDbJ/CZucwYQIF5iBsWSGSMYwaOhZ235FeN
	 P8usQBsic9r8A==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 93AEC3924A50;
	Fri,  4 Sep 2026 16:56:14 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] Bluetooth: btmtk: Declare MT7920 (MT7961 1a) Bluetooth
 firmware
From: patchwork-bot+bluetooth@kernel.org
Message-Id: <178854097314.344939.15082478069695241185.git-patchwork-notify@kernel.org>
Date: Fri, 04 Sep 2026 16:56:13 +0000
References: <20260904053007.667472-1-ivan.hu@canonical.com>
In-Reply-To: <20260904053007.667472-1-ivan.hu@canonical.com>
To: Ivan Hu <ivan.hu@canonical.com>
Cc: marcel@holtmann.org, luiz.dentz@gmail.com, peter.tsao@mediatek.com,
 matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
 linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
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

On Fri,  4 Sep 2026 13:30:07 +0800 you wrote:
> btmtk_fw_get_filename() constructs the firmware name at runtime, so for
> the MT7920 variant (dev_id 0x7961 with fw_flavor set) it requests
> "mediatek/BT_RAM_CODE_MT7961_1a_2_hdr.bin" without ever declaring it via
> MODULE_FIRMWARE(). Tools that select firmware from module metadata (e.g.
> "modinfo -F firmware") therefore omit this blob, so request_firmware()
> fails and Bluetooth does not initialise on MT7920, even though the file
> is present in linux-firmware.
> 
> [...]

Here is the summary with links:
  - Bluetooth: btmtk: Declare MT7920 (MT7961 1a) Bluetooth firmware
    https://git.kernel.org/bluetooth/bluetooth-next/c/860043e48274

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



