Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22394C83F1B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Jul 2025 21:12:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GyRsymGAEkFhPUjVnXNypyjiFBvwwHlDiplFf0J3JhY=; b=SoDtv1za4C9Dj2RFvL15tXJqRL
	6x7v84vy+dC2QNWtLUMiAhQqloICpa//pP/WFS3SxaZGRrNze8/076J9DTbG/Ly1MYZsyCcMRtFlV
	jv2d1A1sQfxNAq0PWA+AREdgDR5NHcr+hdcpuM/qBmcccbiaWdFpaX7+cJmNXuSz1fYfL87xxgAqP
	7i7Qo72lGtDn/yd/sojrbs/09zNNZ5V9OXj+bRZQO9sv13R9y7ScgKObEf7Kzzko0FYiYJs3Fu6m6
	8lu6INqbsfWWs0qHU9EibMGPcrMTlX5+ldchosTSb1xs7KNoY4OgSZvJICNOF/P9nfm2psrFM3sQO
	vgzZo36g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubQTA-00000003HXw-05Lz;
	Mon, 14 Jul 2025 21:12:16 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubQQk-00000003HFJ-1cPU;
	Mon, 14 Jul 2025 21:09:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 6C87261479;
	Mon, 14 Jul 2025 21:09:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1FD7CC4CEED;
	Mon, 14 Jul 2025 21:09:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752527385;
	bh=nVBCslxlPncX/VDKuIE89eGSx6wKViW/DDBK2FBzxVI=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=joELX53Rga5hFZYciwlJWqtUWUutrfWonkxX1p1xjg9cXUVhc/k4/9eSZgvTOCK8U
	 vtwpq3EoWstMaF4gr+o6wNtd39T+vcEBO+DjTuMoiBiZIf7ewMziZI3biGpf1I/0TE
	 c7vGFoEvy5tZvxOcxHX9VhZRaD8a8zxXe7tn8n9e5fvb6gv4eDt+SRUBbtfHsDUymC
	 7wDw8D3xa8/5r/KJSwxKiaEVPCeOsyDHf9ejzQvWi6ro4vkE4ILolT8HP8Wv9odLpZ
	 QLnwLZJmJDk05rf8VIt7LGIqT/PYZPHUEUfeVgtzDoxmNKjZehIWSrWB5cNkat8wQK
	 Io/xh3ckaxuWg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 345DF383B276;
	Mon, 14 Jul 2025 21:10:07 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH 1/3] Bluetooth: hci_core: fix typos in macros
From: patchwork-bot+bluetooth@kernel.org
Message-Id: <175252740601.3988382.10149417016230822674.git-patchwork-notify@kernel.org>
Date: Mon, 14 Jul 2025 21:10:06 +0000
References: <20250714202744.11578-2-ceggers@arri.de>
In-Reply-To: <20250714202744.11578-2-ceggers@arri.de>
To: Christian Eggers <ceggers@arri.de>
Cc: marcel@holtmann.org, luiz.dentz@gmail.com, pav@iki.fi,
 johan.hedberg@gmail.com, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, sean.wang@mediatek.com,
 amitkumar.karwar@nxp.com, neeraj.sanjaykale@nxp.com, yang.li@amlogic.com,
 sven@svenpeter.dev, j@jannau.net, alyssa@rosenzweig.io, neal@gompa.dev,
 linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, asahi@lists.linux.dev, netdev@vger.kernel.org
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

On Mon, 14 Jul 2025 22:27:43 +0200 you wrote:
> The provided macro parameter is named 'dev' (rather than 'hdev', which
> may be a variable on the stack where the macro is used).
> 
> Fixes: a9a830a676a9 ("Bluetooth: hci_event: Fix sending HCI_OP_READ_ENC_KEY_SIZE")
> Fixes: 6126ffabba6b ("Bluetooth: Introduce HCI_CONN_FLAG_DEVICE_PRIVACY device flag")
> Signed-off-by: Christian Eggers <ceggers@arri.de>
> 
> [...]

Here is the summary with links:
  - [1/3] Bluetooth: hci_core: fix typos in macros
    https://git.kernel.org/bluetooth/bluetooth-next/c/359bc1aaa840
  - [2/3] Bluetooth: hci_core: add missing braces when using macro parameters
    https://git.kernel.org/bluetooth/bluetooth-next/c/de92c6716970
  - [3/3] Bluetooth: hci_dev: replace 'quirks' integer by 'quirk_flags' bitmap
    https://git.kernel.org/bluetooth/bluetooth-next/c/be736f5f89d5

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



