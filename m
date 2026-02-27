Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9FAAFD9E35
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Feb 2026 03:30:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d6fWPNO5/YbKOBZUsW8EB5iBNqO3E7mUDw/C5URMKfM=; b=irVywTNkhRzMTYj5/m/IFKEtzj
	SqIkKW5AdBMuy6BfGDEhl0dmoKBvpoe8DINWCROIFza1DVvtVEgN+DjMvYdCsPi/3+jktejrLteMT
	JBpujtta9D0hYg8AfXs0ERJ2ozsReEVWzlT9F4v020zCvE+fWm99hckwqxjiuwzIRm92B1KmasA0g
	1wmsXFnY/gGQ1HP56BHvNKhk+P3+6xARkWRv11Ytfg5+idzHRRI73lLRispcqbkIuMvCCdt4KhSj3
	2ryQ4A6+lCoHIl0l+7vn0ltKAD5zmly6Ed7F3L3+psxaf+CiD/qerqdD4jEZgkbwL62lFdVeOREN7
	vVgygYYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvoYT-00000007bbN-3uet;
	Fri, 27 Feb 2026 03:30:20 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvoYS-00000007bbE-0gaM;
	Fri, 27 Feb 2026 03:30:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 3CDBA60122;
	Fri, 27 Feb 2026 03:30:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E29A5C19423;
	Fri, 27 Feb 2026 03:30:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772163014;
	bh=Brxv5D+zBzlgOfX4ZnsTAzHnPDhRX2jYUb8TJ90+K5c=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=Q47UTdnpZspyOD8a50Q4EiJymLognyRTK3p3egopN9ixidtB6Hy2KXXxC0G6Z+zl+
	 ZCDvoEDmv4TxbbiVArIVxjXekM32/0KBRsHwvwyn89Ufyb3cZZ7cddpiv1OLiVQfPI
	 Ywh+s+zelhmVskBOxmJ12c9+6IiWUdCpjti7TVWdHHsBU+ZyJG8AxzlNnw3BGlAK3n
	 bFwu1HPjW68nYB6hFnGT4dCfIp5JkdrKOjurb6Q4Pfa+yjQhww92/X8oVlnwqPDnW2
	 dOpZ+6OZRIJ7G3PjbBQ5G5Kdw1NCYlAlsSGBAE6Ti9syMc8GGoUGP2btURS859TJp1
	 I00UKLzm7GsKw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 3FD99393109B;
	Fri, 27 Feb 2026 03:30:20 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [RESEND PATCH net-next] net: airoha: fix typo in function name
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <177216301879.1958105.4711894519325320873.git-patchwork-notify@kernel.org>
Date: Fri, 27 Feb 2026 03:30:18 +0000
References: <tencent_E4FD5D6BC0131E617D848896F5F9FCED6E0A@qq.com>
In-Reply-To: <tencent_E4FD5D6BC0131E617D848896F5F9FCED6E0A@qq.com>
To: Zhengping Zhang <aquapinn@qq.com>
Cc: lorenzo@kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, zhengping.zhang@airoha.com,
 upstream@airoha.com, horms@kernel.org
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

On Thu, 26 Feb 2026 10:37:08 +0800 you wrote:
> Corrected the typo in the function name from
>  `airhoa_is_lan_gdm_port` to `airoha_is_lan_gdm_port`. This change ensures
>  consistency in the API naming convention.
> 
> Signed-off-by: Zhengping Zhang <aquapinn@qq.com>
> Reviewed-by: Simon Horman <horms@kernel.org>
> 
> [...]

Here is the summary with links:
  - [RESEND,net-next] net: airoha: fix typo in function name
    https://git.kernel.org/netdev/net-next/c/aebf15e8eb09

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



