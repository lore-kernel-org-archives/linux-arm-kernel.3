Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7034BCA6002
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Oct 2026 23:40:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=veAoBh3gQ8yvmCMTC76V//pPu6pB67Slyg/Ya+dLB2A=; b=VceI8Of9rvEok3T1nHhXTCmTtn
	WA9GPC/Kv8tPMGCtU/5snVV2aBnCkB0kWiQ4dg7YcUWjG9AUKDOct8nkCnNiWkhdtzSIf7tBdfRzy
	EWIYLqt3DXP4G+RnGX5EI04z8YlyHg7bF70sWUZiscK1SRzGdJjJ1HnRFzNj4vlv8vFgOcMTcYw81
	N1DC9UAs0gKXSKiom5CxXCxD78sj9eRTwxbtcFvQG5VTUazbPSlpwO5wKfBaTaWaVJeLtU7HwuCCY
	FeahtaaOsOoGWnIZsS0rtw1NPBpFYYgnhsXkN3FSowYdhVlubMedF8rFYOydUjJypaa/S3iu0Tg+r
	efX7fI6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEbFA-00000003HwE-0wyB;
	Wed, 07 Oct 2026 23:40:16 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEbF8-00000003Hw2-0vl8
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 Oct 2026 23:40:14 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 2770643F9F;
	Wed,  7 Oct 2026 23:40:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06D221F000FF;
	Wed,  7 Oct 2026 23:40:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791416413;
	bh=veAoBh3gQ8yvmCMTC76V//pPu6pB67Slyg/Ya+dLB2A=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=EnWFo7Sip49zS96xjYBGPOxN+Jnn4yG3VER4DKafy0fsQXy11YWSXJpw5x4qFZNTu
	 V0Vn2gA1t072tznEN8Gj7ixFEOyTKFPI53BUoNQhUPW0UMA37nwvrg+KvvTXM5Jch0
	 W1wrVd8wOn1GwbnnAlC2anxXCmiZJF09MirdS7TQXmCJWCAaNC3MwK6Z56zAtgqDzV
	 UuJdudVmvTVWnHwMi5QREPS6Or4Z6Z0oNe7Nh2pwFpXt8RsE724O1/J2rtQ1z4wWSy
	 tu+cgOAEoCDLctFCGr73IOhJbAm8cF/KNa2HOqKqHjG/XTzd7H+O48bTjDn9j9CK6J
	 LpOAc3jwtkmew==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id F18593809A08;
	Wed,  7 Oct 2026 23:40:12 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next v4 0/2] net: stmmac: introduce XDP multi-buff
 support for TX path
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <179141641178.3735789.348400294857878106.git-patchwork-notify@kernel.org>
Date: Wed, 07 Oct 2026 23:40:11 +0000
References: <20261001-b4-stmmac-xmit-mb-v4-0-664e0c3eb289@oss.qualcomm.com>
In-Reply-To: <20261001-b4-stmmac-xmit-mb-v4-0-664e0c3eb289@oss.qualcomm.com>
To: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Cc: maxime.chevallier@bootlin.com, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com, ast@kernel.org,
 daniel@iogearbox.net, hawk@kernel.org, john.fastabend@gmail.com,
 sdf@fomichev.me, boon.leong.ong@intel.com, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, bpf@vger.kernel.org
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

This series was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Thu, 01 Oct 2026 11:26:11 +0200 you wrote:
> Extend stmmac_xdp_xmit_xdpf() to transmit XDP frames with fragments.
> Fix TX coalesce race and div-by-zero in XDP/legacy path
> 
> ---
> Changes in v4:
> - Add patch 1/2 to fix theoretical division by zero issue in xdp/legacy
>   tx path.
> - Link to v3: https://lore.kernel.org/r/20260925-b4-stmmac-xmit-mb-v3-1-ca08f029e81c@oss.qualcomm.com
> 
> [...]

Here is the summary with links:
  - [net-next,v4,1/2] net: stmmac: fix TX coalesce race and div-by-zero in XDP/legacy path
    https://git.kernel.org/netdev/net-next/c/237782c3d416
  - [net-next,v4,2/2] net: stmmac: add XDP multi-buff support for TX side
    https://git.kernel.org/netdev/net-next/c/74c553648fb8

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



