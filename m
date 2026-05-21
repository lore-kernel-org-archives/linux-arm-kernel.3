Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AB32CD5BAC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 May 2026 15:30:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6o1IkY/F+HH2uY+8ham+unzEexE5zCoe5urJsKJFQzU=; b=TPpssIy79l320M5RO0zqhRpMCT
	hzROziXukSTpA2n1fyTcpPd0/btA+jz704DcEHzqdfFWSH9USm0FhViQHQDBiN2nJGV1KPW7/SojR
	uIlDxs6qDUlxOF0zfDWzNPyDmkj/xnVjiUhbEo+9dynbEJ+sZKLEE5VXiG1amLRqz+52z6ZCKqdS1
	sT4A/fD9e53ny9VQCHdCEg5DajLVqatjeL6Moat/jrj1X98dm8cQGuPyLHj4SVRec2Z6WaSgfJEZn
	i+40sTYylqyPMArWXZMfI4Opro+Rzz28GNaCSs648XQ1PcV+oHy2n7fnNaAdIXUrMMxUzf9G3UagD
	2dwxZR5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQ5LU-00000008JHP-2wEB;
	Thu, 21 May 2026 15:30:00 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQ5LU-00000008JH7-0GeB;
	Thu, 21 May 2026 15:30:00 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 516F2600C3;
	Thu, 21 May 2026 15:29:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06A3D1F000E9;
	Thu, 21 May 2026 15:29:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779377399;
	bh=6o1IkY/F+HH2uY+8ham+unzEexE5zCoe5urJsKJFQzU=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=b+ELi5YzjEwTFaCG3+Sbvfo+Eum0r+TXOJkb2mcYat056UGfa4JfGgy64KhBOdGm9
	 XDTo6gL0VhrRUD3tgPMvKCEhB1NKZi+qihEGcUe28/AAiyDECIDO/gfyAp2sCYSTf3
	 pvDnJaUTLsmifBBRHmpGiTGVp8FUTn0mcw+Et0CFIFOKU14zMPksIfAXNvEyyfRrmj
	 gL5pRqsXGsc6mZpg2CY0yKhGCNXWdAcchkEXKn4i3/pyOOkqdRtf33pkAa8lo4c0K8
	 2GYiOJO98508+5TD36WSn4Q9qr+OYEcYb2zGVIoCbAyamViQCCpotORJ95uR/opd/D
	 R6DBOhfCN9NRw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 197F13930E02;
	Thu, 21 May 2026 15:30:10 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net] net: airoha: Disable GDM2 forwarding before
 configuring GDM2 loopback
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <177937740865.384060.9848188889062709318.git-patchwork-notify@kernel.org>
Date: Thu, 21 May 2026 15:30:08 +0000
References: <20260520-airoha-disable-gdm2-fwd-v1-1-1eeea5dffc2f@kernel.org>
In-Reply-To: <20260520-airoha-disable-gdm2-fwd-v1-1-1eeea5dffc2f@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, netdev@vger.kernel.org,
 madhur.agrawal@airoha.com
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

On Wed, 20 May 2026 15:12:02 +0200 you wrote:
> Hw design requires to disable GDM2 forwarding before configuring GDM2
> loopback in airoha_set_gdm2_loopback routine.
> 
> Fixes: 9cd451d414f6e ("net: airoha: Add loopback support for GDM2")
> Tested-by: Madhur Agrawal <madhur.agrawal@airoha.com>
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> 
> [...]

Here is the summary with links:
  - [net] net: airoha: Disable GDM2 forwarding before configuring GDM2 loopback
    https://git.kernel.org/netdev/net/c/985d4a55e64e

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



