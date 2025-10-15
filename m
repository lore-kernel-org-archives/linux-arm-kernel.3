Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF56CCCD184
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Oct 2025 02:50:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IonQ67/0P81sD3b1rsD6Zg4yb1nyuYJKORa0YmbOvrw=; b=XeopN08FU0Uz16xIgrH1OBqZOb
	w53hZ+uOxAYXsqm/MrQ9eZXMyCdRN++74tNYc7L1tHkvCeuwwiCSWQcccpaO7oQF/6kjLii5Jp15h
	sQcrYDrjynxxbh9O5l2F4+UJLycTy+GGYmbFjlY3J7ubU/HePn6mRYhi6PQH206DmL8XHFht/ipXZ
	Zn+e6YNMfQvphOIcw+rRwLqXInTqY4VpaFFpm6Lu986a80vkNtkzltuAVbHW/A7mimup2eJLCtZSa
	SDmklEWAth0dourK641d1mGYV1hK8TL5ZRHiTVXBwyW4QRz/5a+hTXsfXVtKh/KcXr/fVdcqAl7NL
	C3KRknYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8rat-00000000Guq-3Lq1;
	Wed, 15 Oct 2025 02:50:27 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8rar-00000000GuQ-1X37;
	Wed, 15 Oct 2025 02:50:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 204C5451A6;
	Wed, 15 Oct 2025 02:50:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA646C4CEE7;
	Wed, 15 Oct 2025 02:50:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760496624;
	bh=1q0iAqm9oGtdCGI/z0cRfOHf5UFan2MXjLyPKCbObnM=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=eZelpvA/c239nHrPz2U5s0GWgcVmhHivsuLdhUdtvk2YKlFr23YPfIv8SLv6ov2Dt
	 1nxOUrStjPMIkTOGnq1lrYqo1TQJNS/TOGAYB1SBI4qrXqyFfa8K02rlZRkgbtpguC
	 9+Qscs3AODCCKO9sUbfDuMqcZVmKQ35iNeWqhEDwLQn4lGUhyeLlasUcfvaoVCswp/
	 bN9Cg2AithAcDcCAfOykNxdZBnoqoK7SGyhzqNobb6Q1t/yJEsLcE+DOzfqt/j5AgQ
	 5CnzbLmeNGLR8RZpIb/kMa5F+mBqpoS1Ja/gHPK7ZlDt7baMzQG4g95TxzrvDKuciQ
	 EhiN+PRFE/U/w==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33CB4380CEDD;
	Wed, 15 Oct 2025 02:50:10 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next 0/2] net: airoha: Add some new ethtool bits
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <176049660901.197015.7658108803610807679.git-patchwork-notify@kernel.org>
Date: Wed, 15 Oct 2025 02:50:09 +0000
References: <20251013-airoha-ethtool-improvements-v1-0-fdd1c6fc9be1@kernel.org>
In-Reply-To: <20251013-airoha-ethtool-improvements-v1-0-fdd1c6fc9be1@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, netdev@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251014_195025_440705_27A79789 
X-CRM114-Status: UNSURE (   7.43  )
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

On Mon, 13 Oct 2025 16:29:40 +0200 you wrote:
> - add missing stats to ethtool ethtool_eth_mac_stats struct
> - set get_link ethtool callback to ethtool_op_get_link routine
> 
> ---
> Lorenzo Bianconi (2):
>       net: airoha: Add missing stats to ethtool_eth_mac_stats
>       net: airoha: Add get_link ethtool callback
> 
> [...]

Here is the summary with links:
  - [net-next,1/2] net: airoha: Add missing stats to ethtool_eth_mac_stats
    https://git.kernel.org/netdev/net-next/c/331f8a8bea22
  - [net-next,2/2] net: airoha: Add get_link ethtool callback
    https://git.kernel.org/netdev/net-next/c/fc4fed9054ef

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



