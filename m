Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89310EB3641
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Mar 2026 00:00:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=47V8z562EXITd+1IpTy4pTG4PAoPqSNI8sDwaMWn7bQ=; b=hT1hRHyufs7kd0EBUjl3NZbQvZ
	rauNi6EYVe4QiFineFCbr+CknDf+eYnK7BhSVMu5OrjbI5rUs5G8UAwX7Bhl9Us3411AvZXwDzyel
	Xk0kGgz5xKG0wg/MUVa2DNu2DRJxC7W4zC7DEIADsJucsr+AdI3V8otlrWTJi92DedkuRhWiIRtSm
	la49YhCxeYEGD5bFEkwk+3Dh6RFj3Qcm8yXVNoCogUqdnyNb8PllaHZvqwoQAmyWsxybTDd/HWqW1
	sVdVGHzUQLI2g8totpzJxVUqHwo3xGu+E/Vb+wWpn18pJj5fbg4k4q3zlxWVoERw2kSdWwNnV+vSr
	KkvgFBJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxDBI-0000000EEtx-1VR0;
	Tue, 03 Mar 2026 00:00:08 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxDBG-0000000EEtL-3qRl;
	Tue, 03 Mar 2026 00:00:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 5BF0A60126;
	Tue,  3 Mar 2026 00:00:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 095EFC19423;
	Tue,  3 Mar 2026 00:00:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772496006;
	bh=9WFEYNOuqCrSyAGA3CeVfGc+jKdXN1vYdI9bNg/0Pq0=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=Fdju579PUyOlYvVyU0vSlZB4C1SEcSwQtNObDG1EPO+lSO1gswy2HDmiL89aaeRJM
	 BQwdSqsvkbKrRdVO3v3GAxqNaZLzscsulYinu8mp40L8QBAeTohyt+lpKsBjkmFQQb
	 djTIktJmVZDz+TcY5T7Rvs5Sp/n/dBFGGAdzcb04hQ0uRDwFh3jg3tCAsRZ0SaDJTU
	 fUwW1vLp/K3JoO+X3nERh8bqE+Z0fW4AT/+umaW657zVvwE1sOP+NeZOBB/VkXqOTs
	 7xKAy1oH3liZcoAMdd1VScjlecDeP7Lqxum6sfTesiySXuzG+r0vkjmaefthjsPUbb
	 fL0mdaDPzDJ2A==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id BA09D3809A80;
	Tue,  3 Mar 2026 00:00:08 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH RESEND2 net-next 0/8] net: stmmac: qcom-ethqos: further
 serdes reorganisation
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <177249600754.587100.4626990163271059988.git-patchwork-notify@kernel.org>
Date: Tue, 03 Mar 2026 00:00:07 +0000
References: <aaDSJAc-x2-klvHJ@shell.armlinux.org.uk>
In-Reply-To: <aaDSJAc-x2-klvHJ@shell.armlinux.org.uk>
To: Russell King (Oracle) <linux@armlinux.org.uk>
Cc: andrew@lunn.ch, alexandre.torgue@foss.st.com, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com,
 mohd.anwar@oss.qualcomm.com, neil.armstrong@linaro.org,
 netdev@vger.kernel.org, pabeni@redhat.com, vkoul@kernel.org
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

On Thu, 26 Feb 2026 23:07:16 +0000 you wrote:
> This is part 2 of the qcom-ethqos series, part 1 has now been merged.
> 
> This part of the series focuses on the generic PHY driver, but these
> changes have dependencies on the ethernet driver, hence why
> it will need to go via net-next. Furthermore, subsequent changes
> depend on these patches.
> 
> [...]

Here is the summary with links:
  - [RESEND2,net-next,1/8] net: stmmac: qcom-ethqos: move ethqos_set_serdes_speed()
    (no matching commit)
  - [RESEND2,net-next,2/8] phy: qcom-sgmii-eth: add .set_mode() and .validate() methods
    https://git.kernel.org/netdev/net-next/c/4ff5801f45b4
  - [RESEND2,net-next,3/8] net: stmmac: qcom-ethqos: convert to use phy_set_mode_ext()
    (no matching commit)
  - [RESEND2,net-next,4/8] phy: qcom-sgmii-eth: remove .set_speed() implementation
    (no matching commit)
  - [RESEND2,net-next,5/8] phy: qcom-sgmii-eth: use PHY interface mode for SerDes settings
    (no matching commit)
  - [RESEND2,net-next,6/8] phy: qcom-sgmii-eth: remove qcom_dwmac_sgmii_phy_interface()
    (no matching commit)
  - [RESEND2,net-next,7/8] phy: qcom-sgmii-eth: relax order of .power_on() vs .set_mode*()
    (no matching commit)
  - [RESEND2,net-next,8/8] net: stmmac: qcom-ethqos: remove phy_set_mode_ext() after phy_power_on()
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



