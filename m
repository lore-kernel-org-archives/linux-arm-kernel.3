Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7E50F8FA70
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Apr 2026 12:50:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+6Q3Pp1Fs+hW1CgxzVdHexxQzpc3RAR762odoPj1nko=; b=s2pTyQrCUcAXXL0Eodkch5UB4T
	UuM4c+KsYwmN3NlFNzwVJFu8pHyTpn72nPV8X23kxD7yhnoSZDo0wxZWbDWXirB0LYoHNC79kdy2o
	pyvoC39vij2PTO0koki0SL9KnrBFPb2t7/WtpDYQSCm3isEi3fVS1mtIDyBly9Mt4zclhHHJnu6L6
	IpLm64zkvihbUGQ8kmsxzx0q9PswOhqm4zk9zImP6Bm54PLSx81VyZ/qbuqJiXqxSv8h4YvZ7wiC/
	B06PGZH81zcMCNusfNxZmlPti79UtwKXLz1rz+W5qHHpm26FQJG4IP7MC4WRhzzYRGCI6uL9TZ4nO
	lvmIDhhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFAZ0-00000008bw3-2Dzy;
	Tue, 21 Apr 2026 12:50:50 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFAYy-00000008but-3Qf6;
	Tue, 21 Apr 2026 12:50:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 04BD944439;
	Tue, 21 Apr 2026 12:50:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC9A6C2BCB0;
	Tue, 21 Apr 2026 12:50:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776775847;
	bh=zHLgjRB1LuMCBSvVgevKyv7Oic8qKcP2sKvteANDRXU=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=MRW2gfz7hq6jWX8IG24XjQJUassdlv0JvbIdnqrl7+PFGW0dBmdD2ur2KDl/69Ig1
	 YHs2xRKZTADyUmIJmFhIpo41dDMTKsBHgTz/3y0ai2r8eUWZq23D5ifL7BT2UHvDM0
	 aANCbZAeAka9hxpDmDDGsWhEP0LnUd/RLGRZLnz5EZsDly/k6eqzAK3ZQQrMBUC3dB
	 J5WyJbKU1vrWkb6lOU5sSXcso5Q+hRmF8cKL3n4bn8Uoh9QoL8KUV8qBhwEnxemEEq
	 yELVzCRGV6ffrnaSidngoXq0FDOnNq9CEyYut5fMxWkcKvfEkgMbJZLJbeRWuzd82P
	 GdHHPjB4KFR1Q==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 7CEFA3930198;
	Tue, 21 Apr 2026 12:50:12 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net] net: airoha: Fix PPE cpu port configuration for GDM2
 loopback path
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <177677581130.2390604.14637094256330318723.git-patchwork-notify@kernel.org>
Date: Tue, 21 Apr 2026 12:50:11 +0000
References: <20260417-airoha-ppe-cpu-port-for-gdm2-loopback-v1-1-c7a9de0f6f57@kernel.org>
In-Reply-To: <20260417-airoha-ppe-cpu-port-for-gdm2-loopback-v1-1-c7a9de0f6f57@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, horms@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 netdev@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260421_055048_873765_C42A42D9 
X-CRM114-Status: GOOD (  10.18  )
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
by Paolo Abeni <pabeni@redhat.com>:

On Fri, 17 Apr 2026 17:24:41 +0200 you wrote:
> When QoS loopback is enabled for GDM3 or GDM4, incoming packets are
> forwarded to GDM2. However, the PPE cpu port for GDM2 is not configured
> in this path, causing traffic originating from GDM3/GDM4, which may
> be set up as WAN ports backed by QDMA1, to be incorrectly directed
> to QDMA0 instead.
> Configure the PPE cpu port for GDM2 when QoS loopback is active on
> GDM3 or GDM4 to ensure traffic is routed to the correct QDMA instance.
> 
> [...]

Here is the summary with links:
  - [net] net: airoha: Fix PPE cpu port configuration for GDM2 loopback path
    https://git.kernel.org/netdev/net/c/d647f2545219

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



