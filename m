Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 063B4C369B2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Apr 2025 00:52:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qARlvUaIwXnpqAVrZ7AaV4cXwC3k6TzhVkLKVBmuyp0=; b=DlNJtT1FycKJijuzIuhft7iXmA
	ow//VFgSSBZXcTd3/EcjIfgKm5s23rDjkjGPCbbu8dYipcB6kfBuj5C+IkkTttV2aGGwdQOAEfV8W
	JFLOPiiS0BItS94mJR8+4pqscbi+Oioa4OMZammyuJIHm2usgQ6c4vRrt0H8Isb7K8E5sXzh5k/a5
	H8sq76cvuVice4+Uzuw4bVf1+npbxGoD+pbtRV9pgRoDpr8pKhMoiEdtaE6oE84vJiiEdBgaUeMTc
	/ELdrfqEwFzdkaS1OXFtbt8YHZWDvkvIR14djYeORlWF6ye+cHjTVv5PPeEyifeJpjtdWUF1sH1VP
	yC2Jd1nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4UWo-000000043UC-3tv7;
	Tue, 15 Apr 2025 00:51:54 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4UUy-000000043DO-3raY
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Apr 2025 00:50:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 8907343B0E;
	Tue, 15 Apr 2025 00:49:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 564C8C4CEE2;
	Tue, 15 Apr 2025 00:50:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744678200;
	bh=W6GdVISjXNNNfTPg1VWXU+iBRCd39F1D5CkWm+qTSxg=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=XCIWK2vpFxsGuS6nbZfIV3V5Zki+V3bEKonR5gV06bw4Brn33H/4cM3d4ZHJ+POek
	 l8qS8aLAtwqgL4DBCAVcwGzGCZh/Kx/ZdIGS+pagwNwnM3St0uwGzOBUK5o5f4AwEU
	 Blgm3fghvpvjiWX7bRcjFVQgTqadKlZIHEU0tsFFReZhzstP/cCdZfCrrYODT985kZ
	 +7SSFYs81XyKdRCOKMwVi1VGGk4qBCLg5ZVFkkneBTv5leOPAWNRhYXJu5WlP6H+QL
	 4bsbIk+gLsr3lP278fIP9yUwQkr2xmss814Mb8b2DjoybfbJzngL5FIa/k+gO6gtbt
	 ejj+GoH6/RW+A==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 70C623822D1A;
	Tue, 15 Apr 2025 00:50:39 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next 0/4] net: stmmac: qcom-ethqos: simplifications
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <174467823825.2089736.3756695494399689904.git-patchwork-notify@kernel.org>
Date: Tue, 15 Apr 2025 00:50:38 +0000
References: <Z_p0LzY2_HFupWK0@shell.armlinux.org.uk>
In-Reply-To: <Z_p0LzY2_HFupWK0@shell.armlinux.org.uk>
To: Russell King (Oracle) <linux@armlinux.org.uk>
Cc: andrew@lunn.ch, hkallweit1@gmail.com, alexandre.torgue@foss.st.com,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 mcoquelin.stm32@gmail.com, netdev@vger.kernel.org, pabeni@redhat.com,
 vkoul@kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250414_175000_985959_D557AEEA 
X-CRM114-Status: GOOD (  10.02  )
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

On Sat, 12 Apr 2025 15:09:51 +0100 you wrote:
> Remove unnecessary code from the qcom-ethqos glue driver.
> 
> Start by consistently using -> serdes_speed to set the speed of the
> serdes PHY rather than sometimes using ->serdes_speed and sometimes
> using ->speed.
> 
> This then allows the removal of ->speed in the second patch.
> 
> [...]

Here is the summary with links:
  - [net-next,1/4] net: stmmac: qcom-ethqos: set serdes speed using serdes_speed
    https://git.kernel.org/netdev/net-next/c/b4589810082a
  - [net-next,2/4] net: stmmac: qcom-ethqos: remove ethqos->speed
    https://git.kernel.org/netdev/net-next/c/a3d54648ada2
  - [net-next,3/4] net: stmmac: qcom-ethqos: remove unnecessary setting max_speed
    https://git.kernel.org/netdev/net-next/c/4c30093f784e
  - [net-next,4/4] net: stmmac: qcom-ethqos: remove speed_mode_2500() method
    https://git.kernel.org/netdev/net-next/c/0d1c18a10dd1

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



