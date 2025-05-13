Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68460C3ABC9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 May 2025 22:52:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CeRG0zktDzkOhQ2mlBV5KGKTA9T1VgHHBX2l72Oe+Mg=; b=Lfec7k3pDnxvfzvr//zyhV71fJ
	JO2JDbyCijnlTGQ3y0p0AUAKh/gQrSCxz3BzvIcQjWBDYWFP//6NZooi3KZSbt+JHyxt6E1tSNpzU
	qFIU6GWxqXcvxpi3DBjzuxEi6DWPssaOk2YnMT4+sZ74jvXQOW4H+J5ru30KM83disxZ7GJRxVi0h
	jfP6cXWlZrq9g9wY0yaMz1hG9uiR8yNvpvdK5ylUoxLjx0LB2Us/LReIpEeMBo5E6+Hxr7zeVFrfB
	sZu1o4pCmiyqU1Sfn9H/YOZNhP/9er2H3QPdRfAVvWf3a3ux4KLJSAbU99Fa1YO2VhAv23RSTNs6Z
	M/pigr8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEyTl-0000000DhjC-2I8j;
	Tue, 13 May 2025 22:52:05 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEyRd-0000000DhHT-2gGX
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 May 2025 22:49:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id E40F66112E;
	Tue, 13 May 2025 22:49:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8385EC4CEE4;
	Tue, 13 May 2025 22:49:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747176591;
	bh=2b5sWhBlD59bEzSlsX6RDsHKs2/EwTFMcRedAGr7dws=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=G3lGQlm7XuLzug6FQD12Ge6xK+MEOJpYHyy0t0h34ppGm11vwnuV+5MjCz83Zg281
	 +HYiXZ79N1RfqvJL4PpQ0tZPeLQ3wEvOUwZiSVuCMfn9k0XQ8bGVZ6FyhCT8ipuf7u
	 RKFsTQseMrdApBul0VtE5kpjj/jxFVV9lfNvnDEoZ5RFHG9k2Hf5OWUTHXKFz4BTQQ
	 snVB7+1QO5W3x2N2JjAmM+l7G0P6kulJK//USORQXywMRf6S3iN6DHhgvu3nmFXB1i
	 Y3RCSEr5KNeAqBMP7hnvmqktdbtlFYfiWolB2qChWIE1mi63d3bd7R2uP0ikZXZyXN
	 LcWbAnOvYXHUg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33B75380DBE8;
	Tue, 13 May 2025 22:50:30 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net] docs: networking: timestamping: improve stacked PHC
 sentence
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <174717662903.1815639.442567872632505480.git-patchwork-notify@kernel.org>
Date: Tue, 13 May 2025 22:50:29 +0000
References: <20250512131751.320283-1-vladimir.oltean@nxp.com>
In-Reply-To: <20250512131751.320283-1-vladimir.oltean@nxp.com>
To: Vladimir Oltean <vladimir.oltean@nxp.com>
Cc: netdev@vger.kernel.org, kory.maincent@bootlin.com,
 linux-arm-kernel@lists.infradead.org, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 horms@kernel.org, richardcochran@gmail.com, vadim.fedorenko@linux.dev,
 willemdebruijn.kernel@gmail.com, kernelxing@tencent.com,
 linux-kernel@vger.kernel.org
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

This patch was applied to netdev/net.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Mon, 12 May 2025 16:17:51 +0300 you wrote:
> The first paragraph makes no grammatical sense. I suppose a portion of
> the intended sentece is missing: "[The challenge with ] stacked PHCs
> (...) is that they uncover bugs".
> 
> Rephrase, and at the same time simplify the structure of the sentence a
> little bit, it is not easy to follow.
> 
> [...]

Here is the summary with links:
  - [net] docs: networking: timestamping: improve stacked PHC sentence
    https://git.kernel.org/netdev/net/c/d5c17e36549c

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



