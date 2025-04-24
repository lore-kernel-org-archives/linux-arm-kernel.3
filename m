Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B92AFC369D3
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Apr 2025 01:42:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sulx83avSHLeAtBBxalWS39dD80FhvTHQNIDrUBUdrU=; b=HD+GlVzsyhh1q2w71A156EFUMo
	H/Xy34jjsRbi2+MnA8QxCgZLwNdTeG0Nq6osPXmqTISCFgUC0RAeH2JbhYpbXRoDzuW10qRRsQAEe
	vuWqDSj9tLix2XwJP7rOJfW3s5oTM+YMBnjcBVm/10zQvIMRU58uQKl1pA+ionzCWjYnCA3L5HFwX
	Vown2vQUM8Cz9TW5LqoCl3xt17CdzgEvqw+gZv+owvExZ3jtotV778nozfXs0EFju3jUUfzEmp2uu
	o9BIjNYzxsrRbEDVqj7okReFktAOG4QAVpiTyw8C8AUOxXpfb/aPkLM9TEYj490g6s9CeiLq9ZsPA
	7SAszaqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7lbH-0000000CYL5-1on0;
	Thu, 24 Apr 2025 01:42:03 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7lZI-0000000CY7t-3AHQ;
	Thu, 24 Apr 2025 01:40:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 768D74A5C8;
	Thu, 24 Apr 2025 01:39:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC70DC4CEE2;
	Thu, 24 Apr 2025 01:39:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745458799;
	bh=ZKgjhxIMyGxAxeTxMLI5wiSTBBUIEAa72jp35r1NOz0=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=PSUDLobAhjDGK1VYAcXceGLHcy2V7dHxMnyB7wlJDCFPsjlMhqjytdkRzt9oKTAsN
	 hLTXRKMf+q8gPj+fknYaeP4HxoMFIdIQhOmzfXcCT0wd7c/PQ5WYLSj4apiiC6giqF
	 ry65BpeIlp6GWeAv7vpL6XmrBZew7ifJocZiGJV0xYItSKzhXh38AP06COtVi9RhkY
	 W8eI8r78iIRA1FVvmwKf7zB/J3ED+9IWJeOpNPNl5DOaO3jYCog9uNg0cMLcOsZ6MD
	 t4hGjYRKUEIw0qAzQSqKzhmbu2k58OxOqb/2DhQ70+7Rj71ipZ5hKCrcyuixe9ORZD
	 LXB6y8ybK5DXg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id ADCE6380CED9;
	Thu, 24 Apr 2025 01:40:39 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next 0/2] Enable multiple IRQ lines support in
 airoha_eth driver
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <174545883848.2827090.1763902859739390548.git-patchwork-notify@kernel.org>
Date: Thu, 24 Apr 2025 01:40:38 +0000
References: <20250418-airoha-eth-multi-irq-v1-0-1ab0083ca3c1@kernel.org>
In-Reply-To: <20250418-airoha-eth-multi-irq-v1-0-1ab0083ca3c1@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, netdev@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250423_184000_822491_3EBBF1DF 
X-CRM114-Status: UNSURE (   7.54  )
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

On Fri, 18 Apr 2025 12:40:48 +0200 you wrote:
> EN7581 ethernet SoC supports 4 programmable IRQ lines each one composed
> by 4 IRQ configuration registers to map Tx/Rx queues. Enable multiple
> IRQ lines support.
> 
> ---
> Lorenzo Bianconi (2):
>       net: airoha: Introduce airoha_irq_bank struct
>       net: airoha: Enable multiple IRQ lines support in airoha_eth driver.
> 
> [...]

Here is the summary with links:
  - [net-next,1/2] net: airoha: Introduce airoha_irq_bank struct
    https://git.kernel.org/netdev/net-next/c/9439db26d3ee
  - [net-next,2/2] net: airoha: Enable multiple IRQ lines support in airoha_eth driver.
    https://git.kernel.org/netdev/net-next/c/f252493e1835

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



