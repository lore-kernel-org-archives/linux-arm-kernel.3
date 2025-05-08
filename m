Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DD7BC3ABC3
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 May 2025 01:22:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NTbqGrtRHxN/1ty8pp2w6wKlYDTpgyLhjkAhhWBz/jQ=; b=oomMbC7dvYnE+YRHPJ5biJjGh+
	D6LA/02ze8iJTUGs3Ap7f1PbWVhV3u3CRMPYbv6ZDWdPuAkOPopZn2N89/ypHqLdtd8Q7vG/aqXed
	h3WsswvgeBwJRuR25RDjPeG7kqeX3TdvfZhyd+2sErZiGUO0DkEUbsMcZgBVp5q71ep5uLMvercSd
	nx7hsB7tRVBrd+U9fgaotp2ARiBGUsWT1R8D2p+8ILVw+G3AdG06el6kJt2DRjYmtnSZFSncWpgvE
	qNja/R4Po/EvWI3M2Ff3Cgl9IJuXh9JI9dmilYvLU4DKzlYk+gxFsurQ+1QGRqlzY+IHJkZeaTwdW
	9iwW4gfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCpxV-0000000H5ad-2Bjn;
	Thu, 08 May 2025 01:21:57 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCpvW-0000000H5Vq-1Q5b;
	Thu, 08 May 2025 01:19:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 81BDB5C5910;
	Thu,  8 May 2025 01:17:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 222C1C4CEE7;
	Thu,  8 May 2025 01:19:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746667192;
	bh=Da/4KA4ru5nuN3AHYoUrLBKV4QSb8eSjgs/JqCWTa34=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=P/FsZKNir1ZMqd27mwt0XvV1hBtrfdlJLHbY8U4GbbErbsdUEq0jozYOGa+WvjUih
	 FxiATpxZUi1eLMISi3bzY3tKVgG1/FZL7lxcq9y+zJ2COrWm8YP/EUXhq5wUlu0I7C
	 vEht35Kh994jw5NWIaQZp/AAjXrTvKZEkqsCI360aT+rePAhPiWvafaJP+iUVp4t1Y
	 B0t60PDe8BcWT36hWcrBOz5Z5vvNKSF55TWqYod9Ajr5nyrsSddSz6uy7IzpTh0oUX
	 OjaDnSoWUpU9CUGbBThiZXYjm71oJ5bRTzEdqWJSq23FvXe4yT4SMrDC97YWtsVbTX
	 RUtKjn0+N+hrw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33BB2380AA70;
	Thu,  8 May 2025 01:20:32 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net v5] net: airoha: Add missing field to ppe_mbox_data
 struct
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <174666723099.2414619.1850276703791840272.git-patchwork-notify@kernel.org>
Date: Thu, 08 May 2025 01:20:30 +0000
References: <20250506-airoha-en7581-fix-ppe_mbox_data-v5-1-29cabed6864d@kernel.org>
In-Reply-To: <20250506-airoha-en7581-fix-ppe_mbox_data-v5-1-29cabed6864d@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, netdev@vger.kernel.org, horms@kernel.org,
 jacob.e.keller@intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250507_181954_433215_D01EAEF8 
X-CRM114-Status: GOOD (  13.00  )
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

On Tue, 06 May 2025 18:56:47 +0200 you wrote:
> The official Airoha EN7581 firmware requires adding max_packet field in
> ppe_mbox_data struct while the unofficial one used to develop the Airoha
> EN7581 flowtable support does not require this field.
> This patch does not introduce any real backwards compatible issue since
> EN7581 fw is not publicly available in linux-firmware or other
> repositories (e.g. OpenWrt) yet and the official fw version will use this
> new layout. For this reason this change needs to be backported.
> Moreover, make explicit the padding added by the compiler introducing
> the rsv array in init_info struct.
> At the same time use u32 instead of int for init_info and set_info
> struct definitions in ppe_mbox_data struct.
> 
> [...]

Here is the summary with links:
  - [net,v5] net: airoha: Add missing field to ppe_mbox_data struct
    https://git.kernel.org/netdev/net/c/4a7843cc8a41

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



