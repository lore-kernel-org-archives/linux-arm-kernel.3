Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A149C54FDF
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Jul 2026 09:40:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hemAsC+GgWzK8ju2JFRty0vJvvDKGJuoS4mAtdbzBnY=; b=MdfN1pNd2yRBrBMQX6K6U+uHLT
	A6QFjTkm95VF/7bI2A+D+r1XtHTlhWrIInXv+ucEoNM36akj6SVTyGgypIwIGkAIe2oKeRVHOfLGz
	fAOnDsls/+HwtHcyhaQQfjT3JDa1bfFlKb7VTl9tDpY/rX97rrK0DxLmUYqgRQk/rIdIsqysbFHIT
	g9bXDzifIyah9h4ylWtTTtbsNcLKyU/GzKUc6nAB17+cOVEjxlH1gElOtSX9KF21E5mwvFFtQacdb
	4e59w3CyVD+8r/4VL0Et2A+Gph5Us1xNqfXW///baagl7kuEIFwR54bsK4OXheHZnpiBAit/jgT5W
	SGeOoGgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpNFv-0000000A2OZ-3wzo;
	Thu, 30 Jul 2026 09:40:47 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpNFv-0000000A2OH-0bz4;
	Thu, 30 Jul 2026 09:40:47 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 8581740EFE;
	Thu, 30 Jul 2026 09:40:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66D3D1F000E9;
	Thu, 30 Jul 2026 09:40:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785404446;
	bh=hemAsC+GgWzK8ju2JFRty0vJvvDKGJuoS4mAtdbzBnY=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=CpAD/fqQp5+fwYTP+rTUobicY48/2ZPwJGIiNVuS9rrbZENPZTVicWvhlu2L05z4i
	 YxPTOsNLxu/2g60Blj3j2Cy3O50iYAY4wPjpxBlF87F3m+LAS4lEzTV8YqrzvJHmyk
	 aj9W0/lUTlXR2Xds+Ftkq41EBytivUSbrae1uumIAPgzAmBjbWbIfOAqG1KsCAwkdh
	 f/9Jd+1TAp04rMGNUJMcSt09z9ZiCYbLErMgBwvy/14nJTMuXKMu9aqsaful6o5nrc
	 dRrtyOndrr8YcSGRR655D2mU+Dq8IyaKQe4dVLbX7dGDnvlx6qlxuad8MivVb2DD/f
	 hcxUaFoRz/rXQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 568FE381195C;
	Thu, 30 Jul 2026 09:40:11 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next v12 0/3] airoha: add the capability to configure
 GDM3/GDM4 as WAN/LAN on demand
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <178540441014.3466425.18007620255226733913.git-patchwork-notify@kernel.org>
Date: Thu, 30 Jul 2026 09:40:10 +0000
References: <20260725-airoha-ethtool-priv_flags-v12-0-5136a30b2157@kernel.org>
In-Reply-To: <20260725-airoha-ethtool-priv_flags-v12-0-5136a30b2157@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, horms@kernel.org,
 aleksander.lobakin@intel.com, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, netdev@vger.kernel.org,
 jacob.e.keller@intel.com, madhur.agrawal@airoha.com
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
by Paolo Abeni <pabeni@redhat.com>:

On Sat, 25 Jul 2026 22:41:39 +0200 you wrote:
> Add the capability to configure GDM3/GDM4 as WAN/LAN on demand when QoS
> offload is created or destroyed.
> Make dev->qdma an RCU pointer so the TX path can safely dereference it
> without holding RTNL.
> Introduce airoha_qdma_start() and airoha_qdma_stop() helpers.
> 
> 
> [...]

Here is the summary with links:
  - [net-next,v12,1/3] net: airoha: rename airoha_priv_flags to airoha_dev_flags
    https://git.kernel.org/netdev/net-next/c/0040ff44cd5b
  - [net-next,v12,2/3] net: airoha: fix ETS QoS stats counter underflow and cross-channel corruption
    https://git.kernel.org/netdev/net-next/c/8b9a50881988
  - [net-next,v12,3/3] net: airoha: defer GDM3/GDM4 WAN mode and GDM2 loopback to QoS offload
    https://git.kernel.org/netdev/net-next/c/78a35725e533

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



