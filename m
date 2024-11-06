Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 312A8D3E781
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Nov 2024 01:52:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=usU9hnT7IETA/ykdqJZRS1VzMTFu1LSKqfko9ZaVXYc=; b=wvBtbilunu8YYEIJU721fQP9+B
	J9mKfVpUWQiJbODo7vIpCj2NcD6aWfyCcI9YaYDuvKPJvzkcxM9bL/yDkct1AJU1/xaMQRfFPCCuT
	+JnWWzasq6yYUVCq1RMQ+ymjnysbiBQbYOoDFNg4NJvPKp8BVV20QyuD28m1syfPY+BpHPF4JBFUp
	FdBDX3Hun6V90W+IfDbS3uw6PRN3RNOrOJQcHnRlT4wzVkVEhEPRxdiBUe+At5faDLOqITZKupril
	Wyj2LoPcIe4Rb9KRHQjzs16wpPazBA5056fN6NMNC8EVkUK3mTsTpJNtoDxoVG3qywcCP1dBxjQNJ
	89or20VQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8VDW-00000001MbB-0Oat;
	Wed, 06 Nov 2024 01:52:18 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8VBm-00000001MEU-0KpT
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 Nov 2024 01:50:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 4F3795C5466;
	Wed,  6 Nov 2024 01:49:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB3BFC4CECF;
	Wed,  6 Nov 2024 01:50:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730857828;
	bh=y8MG1WBPKCKkhseOfwN6igxneU0mxRhDtteJDtTIZ80=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=JwK13Mb+stiNLS4FappBwqATmT30X/8M77CVZWPXX0ILf0rvNKTm+fhkg8LmxGiMe
	 B8oIrb9B5XKT+OAGhlLNtOnRCNUTv1Y6kzteIM8SWbTb7sEE9VMFPMdyvmJFcERcfB
	 o5Sgy3AJaSZJ6uDsrtkNWdObQewVHpt/w3UVLLndy8ivr+ze04OrA05LCtihwkD2KI
	 GeeNNvfQgAFGcTmUXUIBOtjvEmKxGsquWKxfn7j32Yw9lswZDsq3ylPgP2LYIl8377
	 aww6Ayqqb1VebtT+WXNgvKwHIVTp1szu4MskpXIKHZ5W4LL5zRGJhcLOFpeX0gwSaS
	 jAegtPvI35cgQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EAD233809A80;
	Wed,  6 Nov 2024 01:50:38 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v1 0/2] Add support for Synopsis DesignWare version 3.72a
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <173085783749.762099.1620260205741649555.git-patchwork-notify@kernel.org>
Date: Wed, 06 Nov 2024 01:50:37 +0000
References: <20241102114122.4631-1-l.rubusch@gmail.com>
In-Reply-To: <20241102114122.4631-1-l.rubusch@gmail.com>
To: Lothar Rubusch <l.rubusch@gmail.com>
Cc: robh@kernel.org, kuba@kernel.org, alexandre.torgue@foss.st.com,
 joabreu@synopsys.com, davem@davemloft.net, edumazet@google.com,
 pabeni@redhat.com, mcoquelin.stm32@gmail.com, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, peppe.cavallaro@st.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241105_175030_201930_E7294597 
X-CRM114-Status: GOOD (  11.06  )
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

On Sat,  2 Nov 2024 11:41:20 +0000 you wrote:
> Add compatibility and dt-binding for Synopsis DesignWare version 3.72a.
> The dwmac is used on some older Altera/Intel SoCs such as Arria10.
> Updating compatibles in the driver and bindings for the DT improves the
> binding check coverage for such SoCs.
> 
> Signed-off-by: Lothar Rubusch <l.rubusch@gmail.com>
> 
> [...]

Here is the summary with links:
  - [v1,1/2] net: stmmac: add support for dwmac 3.72a
    https://git.kernel.org/netdev/net-next/c/ffda5c62878f
  - [v1,2/2] dt-bindings: net: snps,dwmac: add support for Arria10
    https://git.kernel.org/netdev/net-next/c/8bed89232a8c

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



