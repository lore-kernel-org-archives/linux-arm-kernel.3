Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 471AED73EB4
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Jan 2026 02:50:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MpimNmYRBK0i5lCJmJX1EZ8nVbBbT7Z5UowWr9oYZMA=; b=tlLFSsnTRWxT4E8c4KFVjzJObZ
	5bU1KkGFb32yzCSKscOkMlog2T4/6qOWS+YUxFkFrvFKsWxmFD2XeLtzf0TZ0JBCDcG+vCncvYJmc
	TOVy8U3nP7+r+Aq7l0nX5bWt11DIrJFQs0DHcjtPWICLSd9gmPYce8qoZv/kkS5Zj4N0gVa2jXLsm
	GFKHd08RnnZxQSEUbm6LYvpXR0aQhneMLoqm4yQ2MEb7dTFJMQ7Oia75abwXW7vqMWu8C9x9jNxtR
	XHMblNAgD/B/eaukw8mvMY1qhxxR57rSHKsCDuBPVMBIIqGVDmkwQi0gB8h+tsYZ8AN4fe4U/RZAy
	uYzZ5UMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vleap-00000000uW5-2Vkv;
	Fri, 30 Jan 2026 02:50:43 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlean-00000000uVG-3Oce
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 Jan 2026 02:50:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1086D41536;
	Fri, 30 Jan 2026 02:50:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E027EC19422;
	Fri, 30 Jan 2026 02:50:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769741439;
	bh=fFgZmrixKo+SlJgXhkmwmrwWZxofEJUJAMLt9IoJXLM=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=C2J7m/XRRBFXSSXPheKz/iyRCfTpPfDgpBariyA+Ed38qU9AIFnqf+uemOUJV7ZPJ
	 8lFbJd43qu/LfhtLc+LUThihjkLCC5A7OqGJoe5ZMpVH5joczyBujzCai4ufGTV8gS
	 FOfq9QPg/bxK+vhFUU4AqS17KznsMHgguDXPCRI55IXdLg+ocV4E/9LIrpmyaUfTNO
	 H+V1h5r6bizUhIuKjd/vDeMh1H14NHrf6B7sJcxtKtYbLCIDTnZYLHV1tkV0pKj8Gt
	 4HCsgmtnHkLetkLL6Y18o6GQwzRDuYHEEJxGjRSuRlznRIfuzlEwzrr3ArhXEGrbCX
	 VgfNru9HDua9Q==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id C8DB1380CEE0;
	Fri, 30 Jan 2026 02:50:33 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next] net: stmmac: qcom-ethqos: remove mac_base
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <176974143235.3149010.13136116647525256549.git-patchwork-notify@kernel.org>
Date: Fri, 30 Jan 2026 02:50:32 +0000
References: <E1vl39x-00000006uvc-0A3S@rmk-PC.armlinux.org.uk>
In-Reply-To: <E1vl39x-00000006uvc-0A3S@rmk-PC.armlinux.org.uk>
To: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
Cc: andrew@lunn.ch, alexandre.torgue@foss.st.com, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, netdev@vger.kernel.org,
 pabeni@redhat.com, vkoul@kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260129_185041_889116_59E14642 
X-CRM114-Status: UNSURE (   7.51  )
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

On Wed, 28 Jan 2026 10:52:29 +0000 you wrote:
> In commit 9b443e58a896 ("net: stmmac: qcom-ethqos: remove MAC_CTRL_REG
> modification"), ethqos->mac_base is only written, never read. Let's
> remove it.
> 
> Reviewed-by: Andrew Lunn <andrew@lunn.ch>
> Tested-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> 
> [...]

Here is the summary with links:
  - [net-next] net: stmmac: qcom-ethqos: remove mac_base
    https://git.kernel.org/netdev/net-next/c/d414ed34a861

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



