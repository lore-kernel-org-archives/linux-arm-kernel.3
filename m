Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DEEF10BA420
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Mar 2026 03:50:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bogOd9buL/nOSqjiNdBPU1xXG+E672rNynZjpaRst/c=; b=xqtCp6O6T3h3FujfocHWE1YwOK
	Xv0yaA4bIRhU3tK0mXM871iUPtVq673DwBlBthX59lfh/IV0BHkTHAoIwbYkFYhhFhkzOKaqgFW8O
	JYDQf3pLb4ZH+xtkDE0HF1ClK5KWOvUwIUUF8KWKp5rmO3T4OSynLSvL7m/89f+5PNRyiXJopJIiD
	2vF7luFNctYlhPNhuDv1wKJg7gpJYd3wt5zg95ZM6lhgbM5yuPjUJ01t8ecFKDAftkIW4lX9Atn+b
	upa2oP3ryLBdoi+nUccIQQGda3vSI2BlZDpPLjsrXYtcSxHk4Kb1nBi82DfZiXgXy30obfthafnvp
	qGzmh9Jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5yDR-00000006dKT-0Smv;
	Fri, 27 Mar 2026 03:50:34 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5yDO-00000006dK5-1KY4
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Mar 2026 03:50:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 7419944554;
	Fri, 27 Mar 2026 03:50:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C90CC19423;
	Fri, 27 Mar 2026 03:50:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774583429;
	bh=PnEHeWbFVlolLNabOX9dBgcUyPXB6gpXLSwyCTFGe4Y=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=G5kYy8aQQzggA9TNGClm5ujA2vbnRCuj0qx580ZtaGSlsk5qVJ/c+GaN5wYxI/XCY
	 VIwIvgTlCplzz/n/KrT6PNe3UidStrRt6KIUZgu11TAhjXlu4JlJqWRu8WtI2kqoCK
	 KzsRFg5faQXxpUz8WxSLNIzztQBiQeTUszi+FA5RjD8tIS62JcsUN0Kdswe8Qfa0fb
	 qwxa6aDV3+fHYMiAQverComMOpfYugqH4jMK3+e/7ge3h/Ky3R6zB09PKeJ6DVyV2x
	 YTvm7i80xbUSYUS+Xpf3Ti9V0k1E8ZsICskeg//L3C9Oy3tOSKgJeJmpg68n19tp67
	 fzUeZAM6hSdtQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id B9FED3809A0B;
	Fri, 27 Mar 2026 03:50:16 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next 0/2] net: stmmac: remove unused and unimplemented
 AXI properties
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <177458341528.3291104.15630228927960975815.git-patchwork-notify@kernel.org>
Date: Fri, 27 Mar 2026 03:50:15 +0000
References: <acJh4z3pRKkeaFbR@shell.armlinux.org.uk>
In-Reply-To: <acJh4z3pRKkeaFbR@shell.armlinux.org.uk>
To: Russell King (Oracle) <linux@armlinux.org.uk>
Cc: andrew@lunn.ch, alexandre.torgue@foss.st.com, andrew+netdev@lunn.ch,
 conor+dt@kernel.org, davem@davemloft.net, devicetree@vger.kernel.org,
 edumazet@google.com, peppe.cavallaro@st.com, kuba@kernel.org,
 joabreu@synopsys.com, krzk+dt@kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, netdev@vger.kernel.org,
 pabeni@redhat.com, robh@kernel.org, me@ziyao.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260326_205030_385512_EAEA04F2 
X-CRM114-Status: UNSURE (   9.25  )
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

On Tue, 24 Mar 2026 10:05:23 +0000 you wrote:
> commit afea03656add ("stmmac: rework DMA bus setting and introduce new
> platform AXI structure") added support for parsing all the stmmac AXI
> attributes, and added code to set most of the appropriate register bits
> with three exceptions:
> 
> 	snps,kbbe
> 	snps,mb
> 	snps,rb
> 
> [...]

Here is the summary with links:
  - [net-next,1/2] net: stmmac: remove axi_kbbe, axi_mb and axi_rb members
    https://git.kernel.org/netdev/net-next/c/a800398e746f
  - [net-next,2/2] dt-bindings: remove unimplemented AXI snps,kbbe snps,mb and snps,rb
    https://git.kernel.org/netdev/net-next/c/af0331e1ac51

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



