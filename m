Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6B3E105A593
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Mar 2026 12:40:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cbQJnucOKcC3aJSLlvHeTNE5s6GI46Y96VIQTdHJcpY=; b=nomsxp55jZ3hNtPW9BSXDMZyxG
	GRGXnqsQo7UdN1vzk0mdosoQT2dPILnxjSWAzwajMf4y4M2ZgcDMMf9dnUJHDdueI5i+w+qHol5Lw
	8G2T+zJxJhApLI9WwQ/xcpAz/mZwuunW/U8W862YLHbw1fbbLgonX8quhs8rYZJNQ4HTjtGh2lOzE
	Kadfd/ZWvDebLR9hTTv7r9tJERREf+7ULa1+zLKui8MRO2jurVlIDtkyviCyUhz6xhfnXCqJTcVlG
	qlIKAK7rosgi/ylFiljmtXaYXjdjvdgKAB7jjZfYKSxgyYjeKJ32HyOOK9FFsgiiwQ2ZLuBIy/0IJ
	L+KCe1NQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0fKn-0000000E3z6-0D6Y;
	Thu, 12 Mar 2026 12:40:13 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0fKl-0000000E3y4-2Jtu
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Mar 2026 12:40:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 4D5AD60141;
	Thu, 12 Mar 2026 12:40:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0E01C4CEF7;
	Thu, 12 Mar 2026 12:40:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773319210;
	bh=PufnIx8LdWeVV3gpXlB9jKSjN6vMEdvNOnxRzhERNV8=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=EXh/dFryv1w0ZniWRmTcjnfaGqaeTyFvQ4PXqyrw2dcx8PR4sU514nSObKn7MXx69
	 fvgZ/PKVkG1uUwYd+vLGdMzw38+Hf0buXqjfCJKCFd5cZftC5tGrPsFggAv+uBZaPp
	 Nih0la3jHhXzJJeY7looW0HHXaKssxciyCZvxx0qHpOAZG1NiEjtZK63joyPcKSe7r
	 ijhNDxyf0AQ1LzsBZInsTc4pNY/F81rUftwxc+mHL/B+l6hB9oUISpFf6LuWgYo3xm
	 gMz0YkfDSPmGT/d3V8zwr42Ai0wQUZS5kab7iKhZkbv54g1TY/tSLTfqG2BdtNtxNs
	 dOtoupXZTM8Ow==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id B9F2D3808200;
	Thu, 12 Mar 2026 12:40:06 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next] net: ti: icssg: Fix wrong macro used in RX
 classifier configuration
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <177331920555.4084292.14837207705389854005.git-patchwork-notify@kernel.org>
Date: Thu, 12 Mar 2026 12:40:05 +0000
References: <20260310132035.1299787-1-danishanwar@ti.com>
In-Reply-To: <20260310132035.1299787-1-danishanwar@ti.com>
To: MD Danish Anwar <danishanwar@ti.com>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, linux-arm-kernel@lists.infradead.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org
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
by Paolo Abeni <pabeni@redhat.com>:

On Tue, 10 Mar 2026 18:50:35 +0530 you wrote:
> The RX_CLASS_OR_REG macro is being used with RX_CLASS_OR_EN parameter
> when writing to the AND enable register. This should use RX_CLASS_AND_EN
> instead to properly configure the classifier AND enable register.
> 
> Fix this by using the correct RX_CLASS_AND_EN macro parameter for
> RX_CLASS_OR_REG when configuring the PTP duplicate and HSR tag
> classifiers.
> 
> [...]

Here is the summary with links:
  - [net-next] net: ti: icssg: Fix wrong macro used in RX classifier configuration
    https://git.kernel.org/netdev/net-next/c/8e7adcf81564

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



