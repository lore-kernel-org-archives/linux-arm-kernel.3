Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD01CCAC592
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Sep 2025 14:30:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+prcasg6r1aVA89UYwyCOsK6UfiQpO9uzSDa0j8YiTM=; b=IsYISOcezbxm4mp0in96as/jhV
	eO+yzPDVoAEu+htKh3r9x4SRbWJaH5N0P6zPJnRKdS0BWnU9aLC899dWFt//21DUzloEHEPHETN9N
	ixvtLTDFeK5TkOFd/4A/VDSqo58TlM5aoxhHEwG3gqdneNnWB+K3J2n6MyIjlERKNRxcp8QZVGNyU
	tG8QE0qLcIaKGDjgV8KsmE9zQBpmQ0ACsHronyKZ51XuWLNACQUj31YxhBhqYcXE9HDd/Tqgc1smr
	oAY+wQmGMQ25pWKhKaPOeu2wgFmvErVqiHazCZPna6mEjBkK+G326ouA3QT+DjMKGiyc5zL96nka3
	c2rutn5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzc86-000000039TB-3TN2;
	Fri, 19 Sep 2025 14:30:30 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzc85-000000039SU-13C1;
	Fri, 19 Sep 2025 14:30:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 53B9960146;
	Fri, 19 Sep 2025 14:30:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05BB4C4CEF9;
	Fri, 19 Sep 2025 14:30:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758292228;
	bh=c9/5HoVo1O1NAvSb/lFEeZzzDDmksUU6EjQYusrC/Mo=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=Ql93Z7cTwJE2w8DGh8GkDSywRgg1JLf6KQcP9PVGR8xhN8kx3mki4Cw65ZFSQwErQ
	 QHZeERLlEuRw+7X8mPlQw71GaYDPuqojzElFU1ufPYxyzfjdyxxt2x/0CnvRI3piSP
	 RK5bV7Z1lkx7+7xfg8LVS2cEb0n4hdO1//amLHG3DJCbRk3/ZbYbWVRV/a2Y24gFs2
	 dUA7eDEsR89FHA0f1+uvOm9N5+gnHdzIFMn/9tRe65m/zD5T/l8MT2xkPiW8aTkqgq
	 SNXOm/ZJG1PdDu+VL+BD2dUxEyOKvZa40XlO/AyKZWQab5CfHSc7KjhvAbxR8CQ3Jg
	 jWQRwVDDM8dYQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id ADD1339D0C20;
	Fri, 19 Sep 2025 14:30:28 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next] net: airoha: Fix PPE_IP_PROTO_CHK register
 definitions
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <175829222724.3219626.11285913383137248734.git-patchwork-notify@kernel.org>
Date: Fri, 19 Sep 2025 14:30:27 +0000
References: <20250918-ppe_ip_proto_chk_ipv4_mask-fix-v1-1-df36da1b954c@kernel.org>
In-Reply-To: <20250918-ppe_ip_proto_chk_ipv4_mask-fix-v1-1-df36da1b954c@kernel.org>
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

On Thu, 18 Sep 2025 08:59:41 +0200 you wrote:
> Fix typo in PPE_IP_PROTO_CHK_IPV4_MASK and PPE_IP_PROTO_CHK_IPV6_MASK
> register mask definitions. This is not a real problem since this
> register is not actually used in the current codebase.
> 
> Fixes: 00a7678310fe3 ("net: airoha: Introduce flowtable offload support")
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> 
> [...]

Here is the summary with links:
  - [net-next] net: airoha: Fix PPE_IP_PROTO_CHK register definitions
    https://git.kernel.org/netdev/net-next/c/e156dd6b856f

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



