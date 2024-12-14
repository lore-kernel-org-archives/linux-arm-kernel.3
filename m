Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEA26E7716A
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Dec 2024 03:41:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R3MUVL/Va0arxwjTJKzTqQsZd76JfNL1QsxeWOXhZ8Y=; b=xsGYRCBpu1H8O0x9RlroJ+zORw
	acpa6NJysrCV9/dLrOPs8ySSAncB0Xd3E4XJHW7DKh82Tx/RQjvJ+WUcPWrUZKLUujQ8jpTR2AUuQ
	dHZnBMahsP2ttONw2zwFQaHOzFPxXlVShImDCUNQmgtmjvLez3oIvpjwLvR1So9TF8opZMrIp/VOT
	QGr37pbMT7IJgnohnSPygEt/Bg1cDwSHmYR+3jOw/y4xAitWLoZvsqe87x285gyG5sEhVPlNsBwY0
	hcZ8qeoL7bbXYGAXQbXlMlPxe6oNf/937kbQC25U7qsRaS/Qxyx8ebg6fuU5NJbT4+kglOasdEZWm
	4FVfIcYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tMJ1x-00000005eX0-0NWe;
	Sat, 14 Dec 2024 03:41:25 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tMJ0r-00000005eLs-40Fs
	for linux-arm-kernel@lists.infradead.org;
	Sat, 14 Dec 2024 03:40:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 54245A42EF0;
	Sat, 14 Dec 2024 03:38:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3FC47C4CED3;
	Sat, 14 Dec 2024 03:40:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734147615;
	bh=YDgnXG5WCYEBSkQpsVmqq1r7mQrwm3iyan9MExSKB6M=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=iLkABP6bAFbvceSxRminblY6hQGbi5rk0bqnn8vercTUSMGJUq5oYb3Z68Jehrt3o
	 QJ4Q7fiC7323XbMAP6//9zqf626SAfSFujtsZbbJJ5BloMW7jZXZSVwCHWFhrTDpa4
	 OLleMBswQm1ykAAGX9CEliHF48ISQxfQpML11Wfi5Is9pXIQ0dJpatzpfaK92XV7Rj
	 pdfGT1eLRWo31WXyhLZdxpyqLdPoVeT5MmSEC9CrQLbRYKAiE3Fc6Q6T9MqXv7MX7l
	 YEPneYYtN8yOwHRkYudZpm2Wo+OFTdeg/mwEB+LbkBvUta7TeGWDLlTgG12mdfJbNK
	 uhcKRbdLnPYRQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id ECC9D380A959;
	Sat, 14 Dec 2024 03:40:32 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next v1] net: stmmac: Drop redundant dwxgmac_tc_ops
 variable
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <173414763174.3237238.13876454174821375749.git-patchwork-notify@kernel.org>
Date: Sat, 14 Dec 2024 03:40:31 +0000
References: <20241212033325.282817-1-0x1207@gmail.com>
In-Reply-To: <20241212033325.282817-1-0x1207@gmail.com>
To: Furong Xu <0x1207@gmail.com>
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 alexandre.torgue@foss.st.com, joabreu@synopsys.com, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 mcoquelin.stm32@gmail.com, xfr@outlook.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241213_194018_478913_A999FEE5 
X-CRM114-Status: UNSURE (   8.96  )
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

On Thu, 12 Dec 2024 11:33:25 +0800 you wrote:
> dwmac510_tc_ops and dwxgmac_tc_ops are completely identical,
> keep dwmac510_tc_ops to provide better backward compatibility.
> 
> Signed-off-by: Furong Xu <0x1207@gmail.com>
> ---
>  drivers/net/ethernet/stmicro/stmmac/hwif.c      |  4 ++--
>  drivers/net/ethernet/stmicro/stmmac/hwif.h      |  1 -
>  drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c | 11 -----------
>  3 files changed, 2 insertions(+), 14 deletions(-)

Here is the summary with links:
  - [net-next,v1] net: stmmac: Drop redundant dwxgmac_tc_ops variable
    https://git.kernel.org/netdev/net-next/c/9bc5c9515b48

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



