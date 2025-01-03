Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3583FE77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jan 2025 02:41:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ewbHrVJb9Ycv+srj59tL5L59NUV9UYUz2yYmi944kq8=; b=2TKoe42S7eb2pDzCGj1YjBJcZ9
	Y65AihH5vrRs0I0JYLYA52U4rNv9aa2DV89Qw6Lz5bhAqUOLAk1ssCJ4eMtONo6CEEwXzaHo6otRl
	eBjF54oPeVk/CWjBVV3lP6Np2UCYbfuRqefel3Exagv2rMw1wmUdm+WbgfU59COtW3tTuNrwbNFWK
	Nk3mwHF6fmyWp9Eu/IWHvUYskKDjwbSnnQO/v8L2oRB41umq+u1qbQQZ2F+zre++TQTd3zVgr8q3+
	Q9E5N0Z8M2/iVFeIvnfy25XZwsO98dl6RnWQX6f+RGLMn0uFqTLLPJr8Af2gsRNdkMhgxag03RdL9
	/BAO3PIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTXct-0000000Bwo7-0goD;
	Fri, 03 Jan 2025 02:41:27 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tTXbj-0000000Bwgh-1PD0
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Jan 2025 02:40:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 4E0CC5C542B;
	Fri,  3 Jan 2025 02:39:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53661C4CEDD;
	Fri,  3 Jan 2025 02:40:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735872013;
	bh=1AsWfbNlCFqQvnlvtsPVgikvB2lUrOXRFL1YevhcMMU=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=VfqpTpl52QaJnDjBIN5um7S7uyLHmJb5+j7M1m8QAzcoxZXmswSSq84GKmN0cBaP+
	 60J6UjSOP+NvkxqzihFtakqs/RT5wNtzoIJ+nOeH0/HjEOaa1K+uPXNdjtl+AJxz7S
	 7LIeCiJr8ovcowX7pDwi+GASl+R7tcSggKZ9GmxzUVb3zcJ3OPt+xZwq+L6Noa/CwM
	 86KYotsciFyBGuE2YofuGrU2C4BtV61I43zjO+EBXgXVIx7uReLGhZ1SJHLHkXXGUt
	 anlOvqUbIzaPHcpFAqg7optk2U2zzT8rKaJvlOsT1P+HDIVqNkcOeIaLYJ0S7LSuKD
	 7/VRy+Ld5uEfA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EADF6380A964;
	Fri,  3 Jan 2025 02:40:34 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v2] net: dwmac-imx: add imx93 clock input support in RMII mode
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <173587203350.2088679.877800854993230996.git-patchwork-notify@kernel.org>
Date: Fri, 03 Jan 2025 02:40:33 +0000
References: <20241227095923.4414-1-othacehe@gnu.org>
In-Reply-To: <20241227095923.4414-1-othacehe@gnu.org>
To: Mathieu Othacehe <othacehe@gnu.org>
Cc: alexandre.torgue@foss.st.com, joabreu@synopsys.com, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 mcoquelin.stm32@gmail.com, shawnguo@kernel.org, s.hauer@pengutronix.de,
 kernel@pengutronix.de, festevam@gmail.com, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
 linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250102_184015_428199_5F78F571 
X-CRM114-Status: UNSURE (   9.04  )
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

On Fri, 27 Dec 2024 10:59:22 +0100 you wrote:
> If the rmii_refclk_ext boolean is set, configure the ENET QOS TX_CLK pin
> direction to input. Otherwise, it defaults to output.
> 
> That mirrors what is already happening for the imx8mp in the
> imx8mp_set_intf_mode function.
> 
> Signed-off-by: Mathieu Othacehe <othacehe@gnu.org>
> 
> [...]

Here is the summary with links:
  - [v2] net: dwmac-imx: add imx93 clock input support in RMII mode
    https://git.kernel.org/netdev/net-next/c/94c16fd4df90

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



