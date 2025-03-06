Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69CD1C282D1
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Mar 2025 23:43:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gQS7/dR2IOT63xM5COWGQS6XYe9zTGeZEWCaupVqONE=; b=WsJnEvxMbXPcDDEr5iG90Y/6cv
	YRstIl1tkvgr0XxwBZxzX4GAA8E5N3EkQ3Asu2f+Pu0zxN+8lyaxqUnsGfZYAuawzA6mqDtPfaBlH
	u96MkFH2GWEzqODtt96gR623BS372RZnTn7ccdWzFjPLKmulCYnKLykFRO65aL6xDLTwxF/kyWP5p
	osg3/yrrXV3U1kiYWatuFMbxCiFywaXpMnryu6R0TEP2u04gHTpwVMIFiMzzkmINXXlJqSXlrC088
	FJSfuoVtewCr3S1wrInI61ZBf8NCE+tYzlAWl3QI7lZtieTs4u4bCo5vAqsNMF9J6Xqhckkgu1v/6
	jqe/K+2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqKs3-0000000CWLy-3uNX;
	Thu, 06 Mar 2025 23:43:19 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqKov-0000000CViz-1CaK
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Mar 2025 23:40:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id EB4345C5AEA;
	Thu,  6 Mar 2025 23:37:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6FF55C4CEE0;
	Thu,  6 Mar 2025 23:40:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741304404;
	bh=2QSee9WokSYspQJ+xRHNNYB0mN5bS+JLoP/ZWB/o79g=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=rhc1fDh67EBOuiKV1bApq40dxAjAq5x/hauy5rCh6DpnHSwhNcSTIFmjmPMQpai5C
	 shJSi+TKWch6PItoD7htSicRlB2sHSCDkYo0guwyt7ogxakmmmycXo37+hRMcO2b0n
	 c5v1gFuSk2PyInqkK3UsRmzbhdaPO+Ru6N5lCGl4KTPc4IydcEnDrTsWqsYXqDv1wz
	 B4Arp2PgfIzhYVegzstUmNjA814/2FXMYtdwpXPktI0C+Roxlb+0KkLmJitsH08GPD
	 Ak0a47mxubiTcIVi43Ktk11jaij8nSVZbHLzyXeqzq9YTeR1VPXg3wIay6yL6pJUXb
	 TXn9plJ9h1pyA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EAFC6380CFF6;
	Thu,  6 Mar 2025 23:40:38 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v8 0/2] net: stmmac: dwc-qos: Add FSD EQoS support
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <174130443748.1819102.11441827117696182422.git-patchwork-notify@kernel.org>
Date: Thu, 06 Mar 2025 23:40:37 +0000
References: <20250305091246.106626-1-swathi.ks@samsung.com>
In-Reply-To: <20250305091246.106626-1-swathi.ks@samsung.com>
To: Swathi K S <swathi.ks@samsung.com>
Cc: krzk+dt@kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, robh@kernel.org,
 conor+dt@kernel.org, richardcochran@gmail.com, mcoquelin.stm32@gmail.com,
 alexandre.torgue@foss.st.com, rmk+kernel@armlinux.org.uk,
 netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 pankaj.dubey@samsung.com, ravi.patel@samsung.com, gost.dev@samsung.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250306_154005_371636_9114F021 
X-CRM114-Status: UNSURE (   9.82  )
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

On Wed,  5 Mar 2025 14:42:44 +0530 you wrote:
> FSD platform has two instances of EQoS IP, one is in FSYS0 block and
> another one is in PERIC block. This patch series add required DT binding
> and platform driver specific changes for the same.
> 
> Changes since v1:
> 1. Updated dwc_eqos_setup_rxclock() function as per the review comments
> given by Andrew.
> 
> [...]

Here is the summary with links:
  - [v8,1/2] dt-bindings: net: Add FSD EQoS device tree bindings
    https://git.kernel.org/netdev/net-next/c/1f6c3899833a
  - [v8,2/2] net: stmmac: dwc-qos: Add FSD EQoS support
    https://git.kernel.org/netdev/net-next/c/ae7f6b34f5cd

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



