Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6252B10F92E3
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 31 Mar 2026 16:50:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NW9FT3heafudYayYdJx184A6WBt3nh1QG+SPM9QBDME=; b=Gco/nI1+jVh07hzI5tioLbJvOm
	8/MAWdXWM6Du0Y3MYNr5g1JUg3q5kaMq0eNMA5VoQg9zR784EB4SLXHLczEEAiniw8kLdGHMLpHR6
	rxIlY3IWuiv+dLAq8WqXJMT4AGYtECxModT5aTTxEL+6xkxCUhSiEAV4zuH1TnAQO9jMkOMo9lYAO
	adB7ILJeAwjl2fAjmz9DWRbW1E0xs+qGQiOms7YBzaYXJxV51fWBmjHuYV4BbDsQ5U7ycDqK8c6t5
	1uV7XOHAo51ogxCQ8MfzN+qOOSyFjnIBFs4dDcNtTwteegmrnCUFdl6dI1/YIzVtoiYfeR1jhdHym
	liyrfF3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7cIK-0000000DHWo-3rfZ;
	Tue, 31 Mar 2026 16:50:24 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7cIJ-0000000DHWe-3rJ0;
	Tue, 31 Mar 2026 16:50:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 1B0A360128;
	Tue, 31 Mar 2026 16:50:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BDB88C19423;
	Tue, 31 Mar 2026 16:50:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774975822;
	bh=cS9OfKUzzwFU9V+lMVEZIVa2iy6qI0oKjaGyR/ydJ/g=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=i49IYVfpquBKPlD/K8vcg7I3/8rh/QqLRWWaBn6sUxEzdH9POUSooVHmdgcDNerbd
	 Wf3UMa/aABRlu7Q1334hRoAS+b406mQuIYtUvnyDdpIMwihOumNpcYIGu2AIjqFZdp
	 LoaNnowMTvq+lfAK15iQ1pwncQI8goso7JWHX9kMRjdrQDXUaM9raQGWgKttGhScOG
	 QLSTT8V0lyfwQAMSRop9Rn2hVnNVQV/uw14W2XxXYnnxCG3+mRuB5H91rmWFXSWUiz
	 H/We8vBkaiHL+mon+yopcN0Yz93K8k/gZWzh8bh+f3rUeBGmWb5YC6EPYYZA8A4AIa
	 lJJBepPCpIiKA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 7CECF3809A05;
	Tue, 31 Mar 2026 16:50:07 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v3 1/8] Bluetooth: btmtk: Add MT6639 (MT7927) Bluetooth
 support
From: patchwork-bot+bluetooth@kernel.org
Message-Id: <177497580604.2805862.8417774878741242767.git-patchwork-notify@kernel.org>
Date: Tue, 31 Mar 2026 16:50:06 +0000
References: <20260326-mt7927-bt-support-v3-1-fa7ebd424323@jetm.me>
In-Reply-To: <20260326-mt7927-bt-support-v3-1-fa7ebd424323@jetm.me>
To: Javier Tia <floss@jetm.me>
Cc: marcel@holtmann.org, luiz.dentz@gmail.com, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, linux-bluetooth@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, xelnaga@gmail.com
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

On Thu, 26 Mar 2026 16:13:04 -0600 you wrote:
> The MediaTek MT7927 (Filogic 380) combo WiFi 7 + BT 5.4 module uses
> hardware variant 0x6639 for its Bluetooth subsystem. Without this patch,
> the chip fails with "Unsupported hardware variant (00006639)" or hangs
> during firmware download.
> 
> Three changes are needed to support MT6639:
> 
> [...]

Here is the summary with links:
  - [v3,1/8] Bluetooth: btmtk: Add MT6639 (MT7927) Bluetooth support
    (no matching commit)
  - [v3,2/8] Bluetooth: btmtk: fix ISO interface setup for single alt setting
    https://git.kernel.org/bluetooth/bluetooth-next/c/fe9e35d0b3f1
  - [v3,3/8] Bluetooth: btusb: Add MT7927 ID for ASUS ROG Crosshair X870E Hero
    https://git.kernel.org/bluetooth/bluetooth-next/c/af6731663d8f
  - [v3,4/8] Bluetooth: btusb: Add MT7927 ID for Lenovo Legion Pro 7 16ARX9
    https://git.kernel.org/bluetooth/bluetooth-next/c/70d2954d3051
  - [v3,5/8] Bluetooth: btusb: Add MT7927 ID for Gigabyte Z790 AORUS MASTER X
    https://git.kernel.org/bluetooth/bluetooth-next/c/e4fb2113d5e2
  - [v3,6/8] Bluetooth: btusb: Add MT7927 ID for MSI X870E Ace Max
    https://git.kernel.org/bluetooth/bluetooth-next/c/4be0c8800708
  - [v3,7/8] Bluetooth: btusb: Add MT7927 ID for TP-Link Archer TBE550E
    https://git.kernel.org/bluetooth/bluetooth-next/c/26308f935d23
  - [v3,8/8] Bluetooth: btusb: Add MT7927 ID for ASUS X870E / ProArt X870E-Creator
    https://git.kernel.org/bluetooth/bluetooth-next/c/b65fdb465d54

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



