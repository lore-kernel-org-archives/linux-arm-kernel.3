Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9B28D65C63
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Dec 2025 21:53:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mvXNQynn8c5mnRtVVDUDPMFT1/hKB+63wx3Tpjt/laM=; b=Ynqihn3hyjkL/96me31ecNJ6wn
	jVpobh/nAgNy/YCLvBfLsPWMGlfvid84E4JUWaycFkrkycUa/8AlwU5xnBn6IXrlr5OGEjqnJypIQ
	SZUH3PAlann4bGfTCKtmq6LVCfHGEgfLIyKZvqRaiGLKamwcKgJmUFmNFv9mVodIWzqWoHulziloT
	vAhiZBrLnbvN6y9SvH8BWpQwptx19D81V9m0dmT129KgOX6/iafjzMvMOH/Nkjp5NcvpDZuET+dgV
	YrrlHBhW9csbS3fZKPWaYLXDVOh1jrWQh3dHw300GCgMJbk1zLZz2QOEZB8Jf0tQcA11cRTHFbgTA
	oAC5o+7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVzSU-00000007S0t-3nS0;
	Wed, 17 Dec 2025 21:53:22 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVzSR-00000007Ryl-3zOr
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Dec 2025 21:53:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B871B44526;
	Wed, 17 Dec 2025 21:53:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95145C4CEF5;
	Wed, 17 Dec 2025 21:53:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766008398;
	bh=NF9M8WHnyGb3kWeDhRhO3/fw8Rso6rB0i1i/hBCdxgM=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=sbP5uXQIhS62eTM7BNHIevnb/VLY3cIYiVShDl+7dLLAR9VtptJk5McxP5djJDavz
	 RaPESQohIP+Wg52JKGkw9e3yZLah6wo80cngL9cKH1pYW75A5nDrnOcSVx1/RVaDd7
	 iAzR+BSXhtaRdSvX9kmot9QKfu9Z8Nsx8nOfia0tI1G8iqTw8LjRgowlQrIyQNiiNn
	 lbYxFhkH6SEU5EKJtQQ41Os/y8TlMpJXNUEjyOTxK96XQZ8Hn6KU1iFCx5pHO/mn+R
	 HudyNoVWD0q5qJBBKw5MhuwU59HW9IXHgkr2expnTA5XamS92PPGTmxtVNpcz0k/hb
	 JgND1POAPSsdQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id B82EC3809A34;
	Wed, 17 Dec 2025 21:50:09 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v2] Bluetooth: hci_bcm4377: Use generic power management
From: patchwork-bot+bluetooth@kernel.org
Message-Id: <176600820854.2253459.7299265804546328634.git-patchwork-notify@kernel.org>
Date: Wed, 17 Dec 2025 21:50:08 +0000
References: <20251210232115.547729-1-vaibhavgupta40@gmail.com>
In-Reply-To: <20251210232115.547729-1-vaibhavgupta40@gmail.com>
To: Vaibhav Gupta <vaibhavgupta40@gmail.com>
Cc: sven@kernel.org, j@jannau.net, marcel@holtmann.org, luiz.dentz@gmail.com,
 neal@gompa.dev, asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251217_135320_011411_65335555 
X-CRM114-Status: UNSURE (   8.58  )
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

This patch was applied to bluetooth/bluetooth-next.git (master)
by Luiz Augusto von Dentz <luiz.von.dentz@intel.com>:

On Wed, 10 Dec 2025 23:21:09 +0000 you wrote:
> Switch to the generic PCI power management framework and remove legacy
> callbacks like .suspend() and .resume(). With the generic framework, the
> standard PCI related work like:
>         - pci_save/restore_state()
>         - pci_enable/disable_device()
>         - pci_set_power_state()
> is handled by the PCI core and this driver should implement only
> hci_bcm4377 specific operations in its respective callback functions.
> 
> [...]

Here is the summary with links:
  - [v2] Bluetooth: hci_bcm4377: Use generic power management
    https://git.kernel.org/bluetooth/bluetooth-next/c/0ad59c87f41c

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



