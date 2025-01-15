Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BA43E77188
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jan 2025 02:11:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ui3oH/M/Imlll/Zzd79+f1/o24Nc+wOHeHfmTjC02P4=; b=gIPHICga/3L4x5UVX3KHvYXgpJ
	z6NEroM6E5xRXBS4iSNVVmtz0beDcAt1dc7FZtmwbxAGveV2f0oN2Y5JcXntbjOd2vYYZYZeGKjCP
	F3G9xq9GVfOOEfQCjIyP5bnrTo4t35/T/3J6iZF5v1mbJN3O6XwmAMTTr7ysnKFqerXh5og9vpP+P
	shfE9fzjtagHQhF4I1NaQWqvPtRLUe/4cJHsn5PNq8fLEboiWH8l/4g/gYezQgrUKMDO41gfhI2rD
	5kagL+JfA3d9//okXezlyfoKlaamw6dYMBo1+4eNsT1iyhwKrWmfzFTPzAIJS2gHO8SGQEM/InR5r
	JH4xKn6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXssS-0000000ANdg-2FAY;
	Wed, 15 Jan 2025 02:11:28 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXsrC-0000000ANUN-2VU6
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jan 2025 02:10:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 36F115C5A9E;
	Wed, 15 Jan 2025 02:09:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A632EC4CEDD;
	Wed, 15 Jan 2025 02:10:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736907009;
	bh=VkD0rcWwKLY34VeqN/EnCIzaNzNTN+EiI+U6FIg54dM=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=WMgDowTqRPpbE57sxITSzs/kv1ehXK1gTO23zp8BZbecDWQc0eAcp6YLK85IGhlWI
	 XG9NokMApljZw4MpAguV2jINE7uVcMsvRxasVIXR9zmy7POqMnTn9Yjt0NAO+G8uWw
	 t1BOa82Z04DnOA/6lbKvNWx3fBT9k7qtg+lo675KgzLhqHn5xkMC2mQoXQVBeKOq3e
	 gstguUqUKDFkVT0l5Ax6/3xEKBTbWjCQ5MzACJV5uL7vMkWpNvEDb2bb/wadS5bcKz
	 hwqVpJYUD0xppn4PLKxTpFs5VbFP/Pkrkfd+KsvhxEvug5S5Xnq+uu3lIWlrtxxSHK
	 r7Ah36iSz4htA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id AE10A380AA5F;
	Wed, 15 Jan 2025 02:10:33 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next 0/5] net: ethernet: Simplify few things
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <173690703250.220881.14038994805665516239.git-patchwork-notify@kernel.org>
Date: Wed, 15 Jan 2025 02:10:32 +0000
References: <20250112-syscon-phandle-args-net-v1-0-3423889935f7@linaro.org>
In-Reply-To: <20250112-syscon-phandle-args-net-v1-0-3423889935f7@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: danishanwar@ti.com, rogerq@kernel.org, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 alexandre.torgue@foss.st.com, joabreu@synopsys.com,
 mcoquelin.stm32@gmail.com, shawnguo@kernel.org, s.hauer@pengutronix.de,
 kernel@pengutronix.de, festevam@gmail.com,
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 imx@lists.linux.dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250114_181010_680265_B6D74535 
X-CRM114-Status: UNSURE (   8.51  )
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

This series was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Sun, 12 Jan 2025 14:32:42 +0100 you wrote:
> Few code simplifications without functional impact.  Not tested on
> hardware.
> 
> Best regards,
> Krzysztof
> 
> 
> [...]

Here is the summary with links:
  - [net-next,1/5] net: ti: icssg-prueth: Do not print physical memory addresses
    https://git.kernel.org/netdev/net-next/c/136fff12a759
  - [net-next,2/5] net: ti: icssg-prueth: Use syscon_regmap_lookup_by_phandle_args
    https://git.kernel.org/netdev/net-next/c/621c88a39276
  - [net-next,3/5] net: stmmac: imx: Use syscon_regmap_lookup_by_phandle_args
    https://git.kernel.org/netdev/net-next/c/1e38b398b671
  - [net-next,4/5] net: stmmac: sti: Use syscon_regmap_lookup_by_phandle_args
    https://git.kernel.org/netdev/net-next/c/92ef3e4b3a5b
  - [net-next,5/5] net: stmmac: stm32: Use syscon_regmap_lookup_by_phandle_args
    https://git.kernel.org/netdev/net-next/c/6e9c6882f9ef

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



