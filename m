Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E25CE937E9
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 12 Apr 2026 15:51:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RVuZUPHU6NSjJI8P4/aVUeH3YbXuFDgDkkSA3QtCIxY=; b=nE/pTuQQsGogb2KuzJqS1CUxzA
	8LqeD9LwngdNOR9lkqI4Zvuh4R4tq/8rr0EQqzo3oqm/kkLH8eIQ6EtCe0XxBlPDTWQsmW5abBh/2
	cSBdkvqnNG+p0tRH9NREol6zLsyb5mxAzXNV6GEWo3RqxGS4e4+PpHJZ4ncxah17xpi0MCH3wFWzy
	WuEi6WkXlQKWU07SVbEp4qRqdVYgzjxJpcfmdNAFDnhnGWLVXP7rS5rKMNAvzGim4rlYAcZs10x4f
	WO0i8PWt+MnFtI6UftNDLmX35BnJHbH6g3bY19emE96ym4i8yJj/hnqOd/TNXj4vx93hay90Xet2h
	ACAMHCUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBx5Q-0000000ESIo-3pJq;
	Sun, 12 Apr 2026 15:51:00 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBx5O-0000000ESIU-2Yu9
	for linux-arm-kernel@lists.infradead.org;
	Sun, 12 Apr 2026 15:51:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 94DCF44401;
	Sun, 12 Apr 2026 15:50:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70106C19424;
	Sun, 12 Apr 2026 15:50:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776009057;
	bh=osIpXDbFP5WXV7jXS8qAjR1DaP4puI6wth/HrHBO2ak=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=DSqTFdAeFDNZGuUocuhhDxRfJJvlljme5xMaAEfGw9JQwdxUU4j7opnCHqAs7NPNt
	 yUcJP+iD8oDYXPteDl0GoXgb42ngaHoebNCJ1An4KrTAQ+QpR9itdb5hrSXSBuG1G+
	 dNzlLlW124kmzrCv2glwK3rwUyV1nWb2YwqL8ZjMiMhhRAbuU2qgMsUdTtVKLGAGmQ
	 AO4YCN81F+Q10p3v3J+Yw2AJ2b2vggwzfNoXQq4PcKOLNJY+T1sLnEfBuvTEAMnNdg
	 1ivLW+dM0S6T0d2rPud1nBb7jutu084Nc372VgtXlCLSOzRixF83+YSgsMk/wZNfkE
	 JPxHjk+KFibBA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 3FD2F3809A8B;
	Sun, 12 Apr 2026 15:50:31 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next v4 1/2] dt-bindings: net: ti: k3-am654-cpsw-nuss:
 Add
 ti,j722s-cpsw-nuss compatible
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <177600902979.3323732.15626307133193777506.git-patchwork-notify@kernel.org>
Date: Sun, 12 Apr 2026 15:50:29 +0000
References: <191e9f7e3a6c14eabe891a98c5fb646766479c0a.1775558273.git.nora.schiffer@ew.tq-group.com>
In-Reply-To: <191e9f7e3a6c14eabe891a98c5fb646766479c0a.1775558273.git.nora.schiffer@ew.tq-group.com>
To: Nora Schiffer <nora.schiffer@ew.tq-group.com>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, nm@ti.com, vigneshr@ti.com,
 kristo@kernel.org, s-vadapalli@ti.com, rogerq@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux@ew.tq-group.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260412_085058_692841_18549BCE 
X-CRM114-Status: UNSURE (   9.20  )
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

On Tue,  7 Apr 2026 12:48:01 +0200 you wrote:
> The J722S CPSW3G is mostly identical to the AM64's, but additionally
> supports SGMII. The AM64 compatible ti,am642-cpsw-nuss is used as a
> fallback.
> 
> Signed-off-by: Nora Schiffer <nora.schiffer@ew.tq-group.com>
> ---
> 
> [...]

Here is the summary with links:
  - [net-next,v4,1/2] dt-bindings: net: ti: k3-am654-cpsw-nuss: Add ti,j722s-cpsw-nuss compatible
    https://git.kernel.org/netdev/net-next/c/f757a2da6df5
  - [net-next,v4,2/2] net: ethernet: ti: am65-cpsw: add support for J722S SoC family
    https://git.kernel.org/netdev/net-next/c/436e9e48ca51

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



