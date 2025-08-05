Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1307AC87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 Aug 2025 00:33:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X5J1cIn6CBL2i1CLloATdcYKv27tbvXUk+XZkK/Drfs=; b=b2f0ZgZj437XHaQTSpCPnVVLG3
	5UOwGf5aaQcMm/Re9B/pslDK72xF23y18RNO8Sz3kNapngJYWbPHqhcRbkoYQBDtXqHonWT131L8W
	n7QSxkGEpTSh/M/of1JZKYspqbfngZNtelmnISJuctp9W8DxBn7ElaJclsmUd0ZrrZY1pH8swohIX
	82GkGO6jZTpX5LRrhPECNUUStqrNE96wXLtP+JvnlP8pxJrctfV/eIMJLYzDu8sodIXq9PIiIwKA2
	Nyo3gGJVJq+aQ67mAe0E5o/Yq0XYktSd0r0rkuDYbGayRzJ70Fy+mxRSNCIJyePtIHpsPZevD4TGM
	ejaUXAFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uj5bm-0000000BWqA-2e28;
	Tue, 05 Aug 2025 00:32:50 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uj5Z9-0000000BWU0-3geD;
	Tue, 05 Aug 2025 00:30:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A125745A4E;
	Tue,  5 Aug 2025 00:30:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75B58C4CEE7;
	Tue,  5 Aug 2025 00:30:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754353806;
	bh=fKvxZcfVZrgBb+Pc1yoIKzuXZevNbI/9BGrxb/fzvws=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=rRWxj3J+MapslYLsP4HWazmOQR9sD3c8sPSPzx3EFuo6nUPD720KZmgPvpi61DBXv
	 nbem0zKLA5wN75wIHRQTNA8ZTEey4BNM0/xioKxY+s/ZwRM+1ljmPqb1y3AV13E1De
	 g/RPOl7hfCG8KX+tcsh7fDxGypwLsFtyg6Lj3Lzu6YPfI90ybM8Z96TwtcMqd6ZVOE
	 CPbpCt3e9enXB+C/s9msQwFo7z/clVTED7kCv5XXQQEGukN8Nf75jeh7aKb/e+ryXf
	 WuJAW5puLMobg5UmdpoZYjgrBVRF6YbUGnm+Ohhed+G5Lk2nzik0vGfUNoeIrDE/Ok
	 emrtLMF6OvO1Q==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EAEF5383BF62;
	Tue,  5 Aug 2025 00:30:21 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net v2] net: airoha: npu: Add missing MODULE_FIRMWARE
 macros
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <175435382075.1400451.14706979312090764224.git-patchwork-notify@kernel.org>
Date: Tue, 05 Aug 2025 00:30:20 +0000
References: <20250801-airoha-npu-missing-module-firmware-v2-1-e860c824d515@kernel.org>
In-Reply-To: <20250801-airoha-npu-missing-module-firmware-v2-1-e860c824d515@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, netdev@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250804_173007_942233_3AF61DA4 
X-CRM114-Status: UNSURE (   9.03  )
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

This patch was applied to netdev/net.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Fri, 01 Aug 2025 09:12:25 +0200 you wrote:
> Introduce missing MODULE_FIRMWARE definitions for firmware autoload.
> 
> Fixes: 23290c7bc190d ("net: airoha: Introduce Airoha NPU support")
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> ---
> Changes in v2:
> - Add missing Fixes tag
> - Link to v1: https://lore.kernel.org/r/20250731-airoha-npu-missing-module-firmware-v1-1-450c6cc50ce6@kernel.org
> 
> [...]

Here is the summary with links:
  - [net,v2] net: airoha: npu: Add missing MODULE_FIRMWARE macros
    https://git.kernel.org/netdev/net/c/4e7e471e2e3f

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



