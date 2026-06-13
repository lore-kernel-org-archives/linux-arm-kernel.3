Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF7D8CD98C5
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 13 Jun 2026 22:10:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bgVCS3SJJ5arXhx+G4WvikFQP68N1RBTeC3H3wIslN0=; b=wAF+mrcREz+iTCObXIA9fOK5hx
	IxGajlpPOeIz0aypKhVxB6AOYCYoub0/k0u9UDb2j8LnIkUYilCgIW1kFml8B2kl5fVN5Xo8B7boZ
	HhEw9mQTtgYmgwyitorn38sICJlHPPyjvXxiHy5DwUSBehY0LoFH4L+SjGkPOqUWL/jtCRQ8EOlHH
	CAbZdJ/31dnozZSAMZDrgyhq6Qd4KbIgyr7p+NR/B37xZrNFRM2uuWCSi1CzVbqFkBuLvnP/YcteE
	YBkN5q4xaBfVRR9BL9CWTok1klJyHSP/TKlUASEC+KTXReFB+vb/bWzlIqpmSlhY14Zgb9Ip2J4mm
	cBzhPB0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYWYa-0000000CZIZ-2SMC;
	Sat, 13 Jun 2026 22:10:24 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYWYY-0000000CZIK-2vtu;
	Sat, 13 Jun 2026 22:10:22 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id C59E66008A;
	Sat, 13 Jun 2026 22:10:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B2691F000E9;
	Sat, 13 Jun 2026 22:10:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781388621;
	bh=bgVCS3SJJ5arXhx+G4WvikFQP68N1RBTeC3H3wIslN0=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=Gs/4FErnreRzpuL01AFQH+ius9Cn6faAtRLuD5AfErK+ML800f00Cvm+NHbop7sM9
	 oS0X0cxpy223L8PXekBf8vjlxPQrqoeT8zZYzDU6XPgroFfoMNSi1pXSRxDoj245bJ
	 lLqkEfAFtHr823v13TYFwB5Wa4qDm28iLfbxOPvLdI9mNN3nA5VCWRPKgCBb6hV2Pj
	 WmiD/t+oJqAHWPgGEj7wNGxj1PY1NDKY7rEkQw65vTrgoWRfWmiAhJE1xzTI43wKAq
	 paO9WOFuwvDX11xFNx7e/vhI4ByJ2KKbqs8z0fXenBiJ6QkPKlH7y4f6cLGlj7V7v4
	 ZmXVmXhq8BLtQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id D09D83A54A32;
	Sat, 13 Jun 2026 22:10:18 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next] net: airoha: better handle MIBs for GDM ports
 with multiple devs attached
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <178138861738.1607522.1344030829934869681.git-patchwork-notify@kernel.org>
Date: Sat, 13 Jun 2026 22:10:17 +0000
References: <20260611-airoha-eth-multi-serdes-stats-v1-1-42442ae42064@kernel.org>
In-Reply-To: <20260611-airoha-eth-multi-serdes-stats-v1-1-42442ae42064@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, netdev@vger.kernel.org,
 ansuelsmth@gmail.com
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

This patch was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Thu, 11 Jun 2026 12:43:00 +0200 you wrote:
> In the context of a GDM port that can have multiple net_devices attached
> (GDM3 and GDM4), the HW counters (MIBs) are global for the GDM port.
> This cause duplicated stats reported to the kernel for the related
> net_device.
> The SoC supports a split MIB feature where each counter is tracked based
> on the relevant HW channel (NBQ) to account for this scenario and
> provide a way to select the related counter on accessing the MIB
> registers.
> Enable this feature for GDM3 and GDM4 and configure the relevant HW
> channel before updating the HW stats to report correct HW counter to the
> kernel for the related interface.
> Move the stats struct from port to dev since HW counter are now specific
> to the network device instead of the GDM port. Refactor
> airoha_update_hw_stats() to take airoha_eth and airoha_gdm_port
> parameters since the function operates on the entire port.
> 
> [...]

Here is the summary with links:
  - [net-next] net: airoha: better handle MIBs for GDM ports with multiple devs attached
    https://git.kernel.org/netdev/net-next/c/8f4695fb67b2

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



