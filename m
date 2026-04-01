Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0987F10F9318
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Apr 2026 02:40:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Stq5PUCpdAv/LJBgiwUgdDzIj2dFhHSZ+EfCK/OxO9M=; b=OZuPhyO5FNeHpBLahoek4fRWmd
	0O4hdjMU1eG1PNpEHgEuphQAcqrNHKUPShVGLBI0lqB5Us8vj0uKiEnxsAwzj+FtODgAbdkJp9Z6g
	PWvHraLqJOPNhLn+cEhOSLDdqyNtWwiU0JJFrzZujaNE17AcupXe7ApL2b1Cz33oW3tiwAsRQvqSR
	sIhFpf8Z7QcN3/9US4NTfoLqzghqS+Uhz475JFQNq8bsaN5lTMHF3jSxPOGTeRgXAdrU62j+FuQL9
	kFiEQ2kZQPTzREcYYtbqWF5ucKftjje8aA1zs6mUZavhl9oJrDNpgZ6oyZYNVk8whMsNatLl1EMt2
	MOlc6u3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7lVN-0000000Dr7O-497r;
	Wed, 01 Apr 2026 02:40:30 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7lVM-0000000Dr7F-13fg;
	Wed, 01 Apr 2026 02:40:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 8784C60120;
	Wed,  1 Apr 2026 02:40:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E28EC19423;
	Wed,  1 Apr 2026 02:40:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775011227;
	bh=F77V0qacPu1vsT0FF1/qkJ4lDD4ex7Tvwh26H0RDfT0=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=hnDQpZyUmF5pzivLNcBWW/aekszVoClHVqiREtpV4lnfq4i87xhLVMYTx1iKb/g3Z
	 4uDhC7DLQhaYkR3HRPy+TntSKakePRTJGutqWr30q8zaVGRoQzwJ19+gLteE90qHj/
	 GLB+F3WSL2znt9OIf1pERFatXlA1m/V3qa8GvIcBzLCVZnP7l+8XEY4K8h+swxRe7N
	 RjY4VK4sxHIWtYC5VXF8Fcu1+L4bMb1bz+RVzV70yPX2xS8hL6N7wi8eoNnT0Go5jf
	 M3Pe2M65I2LR0ff10Sj+WlhbitGBVsRaFCGFzkJkygdxv1cBTv2eb312hYJhdsa4za
	 KDc4zFeSXY8aQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id BA0453808203;
	Wed,  1 Apr 2026 02:40:11 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next] net: airoha: Fix typo in
 airoha_set_gdm2_loopback
 routine name
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <177501121053.3042140.8960610979272112652.git-patchwork-notify@kernel.org>
Date: Wed, 01 Apr 2026 02:40:10 +0000
References: <20260330-airoha_set_gdm2_loopback-fix-typo-v1-1-a1320ff6b6cc@kernel.org>
In-Reply-To: <20260330-airoha_set_gdm2_loopback-fix-typo-v1-1-a1320ff6b6cc@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, netdev@vger.kernel.org
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

On Mon, 30 Mar 2026 00:03:49 +0200 you wrote:
> Rename airhoha_set_gdm2_loopback() in airoha_set_gdm2_loopback()
> 
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> ---
>  drivers/net/ethernet/airoha/airoha_eth.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> [...]

Here is the summary with links:
  - [net-next] net: airoha: Fix typo in airoha_set_gdm2_loopback routine name
    https://git.kernel.org/netdev/net-next/c/a94ddc191f19

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



