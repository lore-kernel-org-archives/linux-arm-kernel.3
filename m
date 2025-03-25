Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D1DFC36008
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Mar 2025 17:52:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MVfjMuX3zd/uaTMUhfqL4vyT/ktaDSStEzbLE3YirDk=; b=deRvmt3pIKQWLwhqBNM0wZecIa
	j6S1Vo9+VN+c/UMa8t2EhgEXgYQLqMGsLCJvNfl0eYWL8h6N2tu2BOWsyivSbP2FcEB3CL615pTcg
	dweRcecge4kJXF2v1wjM173gptglREEsdvb786iWHA8t+zqx2D36aHmO5NR1zW6s+PhRf1nsKkCJD
	AGlnvExP5pJyVcrL17dUFY9+A86Jh7bZYLNugCw5JvwqsDkEPGTsLI/L3vFeSfay9iSGAC3FjCyjH
	9vLVTHNxhWnGDFV/E/vuoY6YXyDjj7lwWc14q528LatDt2mW9T6gl2gCcy4lcGXxgXQ8UGAdxwv1B
	wO1UuG0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tx8RP-00000006f57-0N7y;
	Tue, 25 Mar 2025 17:51:55 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tx8PZ-00000006eiz-351H
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Mar 2025 17:50:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 937E65C55B6;
	Tue, 25 Mar 2025 17:47:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 450E9C4CEE4;
	Tue, 25 Mar 2025 17:50:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742925000;
	bh=EL3VnTPJo+P5z/KHMukRAuwWkDM/Ve3eT4OQHlZyvHk=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=V0VoNwWFYekJ6GE+Mh79Ye9r10xvX4kYy61L4qTDJYZ1lCE0NvGznWgAIfKpFL7xD
	 93yeRa9iyQKS0iQXWhRf4rTKrc48UDEQbIBtWY6q3w4dUpWn6P9CQwZJera0SBAvE0
	 +iSXQnrcIbftNlmdBBxtqi3q1IjsHheOyBj42UlEWxEinvkWqO9+h9IkNSJb2Fmocm
	 WpnfHJ+VbBj/x8zgx4vl11u0dcmQnoWX/HH6lbmAPrG1fiVVQfnbwP7I+XNqgaU/mP
	 OOtZzZhkx1ys+0Hd5tNPncbgutqCCn0S8r0zcXGa2Mrxlq+7SGv20faqTavfOwki07
	 3P5WJTPbkKqKw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id B061F380CFE7;
	Tue, 25 Mar 2025 17:50:37 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next v1 1/1] stmmac: intel: interface switching support
 for RPL-P platform
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <174292503611.665771.17143313687582113005.git-patchwork-notify@kernel.org>
Date: Tue, 25 Mar 2025 17:50:36 +0000
References: <20250324062742.462771-1-yong.liang.choong@linux.intel.com>
In-Reply-To: <20250324062742.462771-1-yong.liang.choong@linux.intel.com>
To: Choong Yong Liang <yong.liang.choong@linux.intel.com>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, mcoquelin.stm32@gmail.com,
 alexandre.torgue@foss.st.com, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250325_105001_835056_22BF04D1 
X-CRM114-Status: UNSURE (   9.09  )
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

On Mon, 24 Mar 2025 14:27:42 +0800 you wrote:
> Based on the patch series [1], the enablement of interface switching for
> RPL-P will use the same handling as ADL-N.
> 
> Link: https://patchwork.kernel.org/project/netdevbpf/cover/20250227121522.1802832-1-yong.liang.choong@linux.intel.com/ [1]
> 
> Signed-off-by: Choong Yong Liang <yong.liang.choong@linux.intel.com>
> 
> [...]

Here is the summary with links:
  - [net-next,v1,1/1] stmmac: intel: interface switching support for RPL-P platform
    https://git.kernel.org/netdev/net-next/c/cc04ed502457

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



