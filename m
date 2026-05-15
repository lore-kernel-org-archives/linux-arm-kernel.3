Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1BEFCD4F39
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 May 2026 00:21:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gDy866nIhC8fpGiBtv8IVlc0fPvXrQ5tTnHWusKhHx8=; b=LRAje0Pb9vlsQHbdH/KZFlw2GM
	1fsxUpVz3lxtptfaMXat+R9Jw7skj2vebC0jNQTe/of4yJON3WGs5RMNDeNleQPJF754HfWdydjd2
	2aTJxTis+MnuKX6/hJL6o+U7bVd/q9QP0Q6n96tkB6DNdov80ot5X+jd035hqUl9glYKitV7SQra8
	A/3s/xXx9+4uOn68SB3CGnjRCXpSKWq+SqxTN6joD85jbFqy/114gqDWwLdm7h3Io4NNQycSunDaF
	IlKepUaPdW+ss92xdESdesTxdACkfVlX7T05+e/hNc9/McHmrWpQ5k4P4/9oth12gJpa7TQqMq2Jx
	Na9bLGBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNgIv-00000006u81-2zLQ;
	Fri, 15 May 2026 00:21:25 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNgIt-00000006u7Z-1keb
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 May 2026 00:21:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 54B8741902;
	Fri, 15 May 2026 00:21:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30F2EC2BCB3;
	Fri, 15 May 2026 00:21:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778804482;
	bh=ChzpCrAmmOBJXgrCXxGb5lPCP+Tcqf7AasgRhZENBvY=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=VBq5E5oiElsaFmTxEyeMf6HiUjh/dutVa/fJePAkRUZaOsqveGpvY14LjXVE62xk8
	 /s/0BsMeIzUwJ+3yVNr5tqQhxpqOltn/zdAwxGuL8g2Vm6b3JiTitvmycEOMIseHF/
	 P5be/FwZde/hLhqrwbUiiDSf4ZRdcyaGcRnuKd2lN1S+JKnsCMl44O25Q68XZjchoz
	 QYJAxnvD+t9IzaA7FyEXXUvdMRp4N5pPw+RILDopG8mEj6RjpW9plBiZ5ZMBlIb9Tx
	 hM+spI+F9xbwHcB4eXm49Ix0DnmY/hN6rz1tbE5JBP/NuZmXmvZXdjw4Y0HVz6TDgv
	 +RRcAh9wj1KTA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 02C3D39E4DB3;
	Fri, 15 May 2026 00:20:28 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next] Documentation: networking: devlink: stmmac: fix
 typo
 in phc_coarse_adj
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <177880442654.134878.10940283000511867784.git-patchwork-notify@kernel.org>
Date: Fri, 15 May 2026 00:20:26 +0000
References: <20260512133214.1773502-1-avinash.duduskar@gmail.com>
In-Reply-To: <20260512133214.1773502-1-avinash.duduskar@gmail.com>
To: Avinash Duduskar <avinash.duduskar@gmail.com>
Cc: netdev@vger.kernel.org, davem@davemloft.net, kuba@kernel.org,
 pabeni@redhat.com, edumazet@google.com, horms@kernel.org, corbet@lwn.net,
 jiri@resnulli.us, mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
 linux-doc@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260514_172123_482235_9673FB70 
X-CRM114-Status: UNSURE (   9.97  )
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

On Tue, 12 May 2026 19:02:14 +0530 you wrote:
> "Functionnal" should be "Functional".
> 
> Signed-off-by: Avinash Duduskar <avinash.duduskar@gmail.com>
> ---
>  Documentation/networking/devlink/stmmac.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Here is the summary with links:
  - [net-next] Documentation: networking: devlink: stmmac: fix typo in phc_coarse_adj
    https://git.kernel.org/netdev/net-next/c/e54fe8200a1c

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



