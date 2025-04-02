Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10EE8C36018
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Apr 2025 00:10:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uOzQv6AaWTlFrQzkmwQI0UtFso0mAywnshBRsL5OMTU=; b=Q7+9rvH6VLj1N6IMnjpnkJI6Zp
	/xm6MXqZabGeeWAX/fdp37gguN+AnjwPWKPakNgIZjcWjwF+qtozCmxVdthdf6qeL0aePYMIEsQmj
	8ybs1V7RHt4/wZ7Y7z/77+WgLwsYwhHa9RoeONV3I48qMziaKPlZiywO2JxKD2riI/oi20OeW9K2O
	lMWvRlWH1ptfXbnvzUVi2X9dzhqiMRSyu+qUkh1xJCGUdnYPYqrEXP/CsUa7jbdJBrENMUhAYXPs8
	Vw3ZML9UBX6/TJxcfxeMp7rYhYnHzAqYikazPDjGgIAGUgKjtIeDCly2aDY/ANy0y/TXw6Y7qfiBW
	aWfl1NyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u089u-00000007Tcp-3eD5;
	Thu, 03 Apr 2025 00:10:14 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u07gk-00000007Qw5-3lM3;
	Wed, 02 Apr 2025 23:40:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 76E8D614BD;
	Wed,  2 Apr 2025 23:39:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E755C4CEE9;
	Wed,  2 Apr 2025 23:40:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743637206;
	bh=Bt2+ylCDCULSGt5nLv1shq3mwylcM3/US0MV5+Bai3s=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=NvLOcdmE4l2qunB8uuJ67ncdOG2IEdK1AwwNhnWxwLXiqL94NF+4TigyAPrOZy1YT
	 vDJ3LbOECt9UgC8XXj5OvqBe0fcCZQm31/xokCwbvm3sAGteCFu0zIiDPqDM/rR1M2
	 v/4LZTTy4Mb88mCNliHqFch2PmGR+caOGMBrNwGP7EoGz3XgeV9ml3YgP+3KSoFoD9
	 dFR8w7ugtKdqGbrOZqN9CzANKTsVaMgI5HthfVlnpg7dDH3pd+rk9DUau5/xeHIweV
	 G90Hz8FJOGqrNDDXMW1S5yKGvixVSYrS+vTy3W6icjUTxF1BJqaSyXU6hCkEFEtaD/
	 515vir6l/KUqQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33B76380CEE3;
	Wed,  2 Apr 2025 23:40:44 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net] net: airoha: Fix qid report in
 airoha_tc_get_htb_get_leaf_queue()
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <174363724274.1716091.6235443928429080409.git-patchwork-notify@kernel.org>
Date: Wed, 02 Apr 2025 23:40:42 +0000
References: <20250331-airoha-htb-qdisc-offload-del-fix-v1-1-4ea429c2c968@kernel.org>
In-Reply-To: <20250331-airoha-htb-qdisc-offload-del-fix-v1-1-4ea429c2c968@kernel.org>
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

This patch was applied to netdev/net.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Mon, 31 Mar 2025 08:52:53 +0200 you wrote:
> Fix the following kernel warning deleting HTB offloaded leafs and/or root
> HTB qdisc in airoha_eth driver properly reporting qid in
> airoha_tc_get_htb_get_leaf_queue routine.
> 
> $tc qdisc replace dev eth1 root handle 10: htb offload
> $tc class add dev eth1 arent 10: classid 10:4 htb rate 100mbit ceil 100mbit
> $tc qdisc replace dev eth1 parent 10:4 handle 4: ets bands 8 \
>  quanta 1514 3028 4542 6056 7570 9084 10598 12112
> $tc qdisc del dev eth1 root
> 
> [...]

Here is the summary with links:
  - [net] net: airoha: Fix qid report in airoha_tc_get_htb_get_leaf_queue()
    https://git.kernel.org/netdev/net/c/57b290d97c61

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



