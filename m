Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C68E6C44529
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jul 2026 10:31:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Uqe8psFDIQlKSUFJ5GIbpCPkfIxTBiYWBpCteC7DREQ=; b=jLTeGmVDYlcAQiWfJ3fAn0oyHx
	0lerknyTJfL5AzVnM5mg7cNF0/lnh2af35VdlNSLao0tg6SYd9rQGnKybiHBgO0906JtpKHoQ12kJ
	jDV9+kZKAGy4GQVFjByyvv7/qJjzBU9MPyhSBMBb+XUzh/6PI9mYDubU0BfpIEXa0bgpfTuTsBUpg
	7jn/dN5YmKW9lHNsuuuZZUnVG4x2mL0EByPseSJwV0Be/ZGA04jZmvmuFTxZiPYS2OlU+kT85FKLH
	D2t45iOAsrZcE6fhAOqthrFX1aE5mFI13MjPioniZuapx4oZ1K/gx4Bu7HzuBZRlfOxzu9fpNczPO
	pf9wpfFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm7kW-00000009Bkw-2C7z;
	Tue, 21 Jul 2026 10:30:56 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm7kL-00000009BfV-1PuW;
	Tue, 21 Jul 2026 10:30:45 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id B913B438C3;
	Tue, 21 Jul 2026 10:30:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99CA61F000E9;
	Tue, 21 Jul 2026 10:30:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784629844;
	bh=Uqe8psFDIQlKSUFJ5GIbpCPkfIxTBiYWBpCteC7DREQ=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=j22OvqY8Pbif3S+luzLHYveGbmXuvmMd/W97S/Z2LHy7m9XE4t6B1gGUDf0xDXQrY
	 KkikLafF1h1CYj/WnR8bVBhShcOEY1+XzT30ftghVIjhhE7GOqSGTiGiQINnrZDpGq
	 Tf+1RUSTNCEvZxorT/lXoij9XiBLIorLbXnduLp5KoGzJIRdy4L36tycL3Afr7hBC+
	 1uqnYL4G5zTHJ/7/pZ+dHAv1d+O71Kxo/PXToxnxHsWqf4T0Fi4ZEK8y9JpchA23Lh
	 2k4ITc37CZhBX3iNMXaNKgF+yL6Z92ZQ/9w2mCW2A2piT3V17QF6Q6FqcT18wO5kjp
	 RKhZ3Az5WQPKw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 93A203924A64;
	Tue, 21 Jul 2026 10:30:15 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net] net: airoha: Fix DMA direction for NPU mailbox buffer
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <178462981413.215603.10774821203949448313.git-patchwork-notify@kernel.org>
Date: Tue, 21 Jul 2026 10:30:14 +0000
References: <178351055214.98729.11403147818632027428@gmail.com>
In-Reply-To: <178351055214.98729.11403147818632027428@gmail.com>
To: Wayen Yan <win847@gmail.com>
Cc: netdev@vger.kernel.org, lorenzo@kernel.org, horms@kernel.org,
 pabeni@redhat.com, kuba@kernel.org, edumazet@google.com,
 andrew+netdev@lunn.ch, angelogioacchino.delregno@collabora.com,
 matthias.bgg@gmail.com, linux-arm-kernel@lists.infradead.org,
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

On Wed, 8 Jul 2026 19:35:29 +0800 you wrote:
> airoha_npu_send_msg() always maps the mailbox buffer with DMA_TO_DEVICE,
> but some callers expect the NPU to write response data back into the
> same buffer:
> 
> - airoha_npu_wlan_msg_get() (NPU_OP_GET): NPU writes response into
>   the buffer, then the caller reads it via memcpy()
> - airoha_npu_ppe_stats_setup() (NPU_OP_SET): NPU writes back
>   npu_stats_addr field in the response
> 
> [...]

Here is the summary with links:
  - [net] net: airoha: Fix DMA direction for NPU mailbox buffer
    https://git.kernel.org/netdev/net/c/6f884eb87a79

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



