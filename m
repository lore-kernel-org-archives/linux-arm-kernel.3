Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0604CCF9EB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Oct 2025 01:21:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dfsctidDcd41/nl+SN1XfRL08SZxYYcaE0JcwG1vTB8=; b=rJ7nP7P8+8Ru/nCDpF13+6phoJ
	yOPYtuVHARmwYzAqolt1/FZyf6WrwznTdUDl3KJQFbaBQmmc+G2jJI6yvZ/+GVHR/RTJAeyqIYzxV
	4tdasaZem4797meKLKr7J07QkCebOue1j/Q7CT4H1q/CfBiCxRRk1dQVYuhixU0d/9twcHGFcPiqi
	SG+ytpkwDRgzk0JYhmv3VQlX4AN86v7B78vX7DDqAGBii2zQVvSHUsuwiKwOzJ29iD/R89JEoU4CK
	VUpVllpysDlDK0yTH2fxevRddgNFqq8cvEXVPK//YYO7jfqcwnXkIKLKBB3rxQCu7UffzdUNp0SrH
	42jDf1dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDYOS-0000000F3cK-46gj;
	Tue, 28 Oct 2025 01:21:00 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDYOP-0000000F3bm-3nv7;
	Tue, 28 Oct 2025 01:20:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B9F70419B7;
	Tue, 28 Oct 2025 01:20:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9872CC116B1;
	Tue, 28 Oct 2025 01:20:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761614456;
	bh=lRrk/qkBm1h7C+JoIkXVUKryc3+0BACXREYCcqtsPm4=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=rfG3H6hPfDCb7wFpAjjyCrAhxGs1rg4dtuqXj/LAWROrypreDJEqCPmHfuFwaeJps
	 vhg1pJreGoIGlycF7wkSZqA6UOy5HBZHag1kDGocx3NK3b5P5hsgL1QlP6Fly3Y/B7
	 Vb7Lu6HrRPExkMf350W6z9hZk5JWCz0Qo70XvRX0qMxUX/O8ErA7azYA2tGWLUf8nF
	 QFuwXldgJrDQbphJ5HMGkW1Txm67uzHlVyXro0+tPYv2gyJBMVzsP+Dukkl+1w3+Pu
	 LRAsARC/Vx+cUjKuW92GbZOkRsQrAb8DAzXjtCqrRC8lnacTlvZuyuoPesuvh+Y8zs
	 VhJfD5UqTdu0w==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EAF0739D60B9;
	Tue, 28 Oct 2025 01:20:35 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next] net: airoha: Fix a copy and paste bug in probe()
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <176161443475.1651448.9171671482434229190.git-patchwork-notify@kernel.org>
Date: Tue, 28 Oct 2025 01:20:34 +0000
References: <aPtht6y5DRokn9zv@stanley.mountain>
In-Reply-To: <aPtht6y5DRokn9zv@stanley.mountain>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: lorenzo@kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, horms@kernel.org,
 ansuelsmth@gmail.com, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251027_182057_983488_A0E648BE 
X-CRM114-Status: UNSURE (   9.10  )
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

This patch was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Fri, 24 Oct 2025 14:23:35 +0300 you wrote:
> This code has a copy and paste bug where it accidentally checks "if (err)"
> instead of checking if "xsi_rsts" is NULL.  Also, as a free bonus, I
> changed the allocation from kzalloc() to  kcalloc() which is a kernel
> hardening measure to protect against integer overflows.
> 
> Fixes: 5863b4e065e2 ("net: airoha: Add airoha_eth_soc_data struct")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> 
> [...]

Here is the summary with links:
  - [net-next] net: airoha: Fix a copy and paste bug in probe()
    https://git.kernel.org/netdev/net-next/c/05e090620bac

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



