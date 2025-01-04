Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE4E4E77197
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  4 Jan 2025 16:42:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zFlIya5QEtcnCxxQFNC9LPxsZJLacyOY9qZH4dweysk=; b=jpEJLwoUcmEknDrwJO4jhQONy3
	FDvBM4uZGsUZ2ZWraRVFJpxxNry1QY8ygyY9eXcXFP7Hq1ayWshyXQVV633S302tvyvqOgupQyj9b
	2kV/dhdVRrJafmwmDTUm4ZaH0IruJwfsWxZd9vE7AgcBRPsPxT4CxH7EXkLTJWM0gi0kQaIw1VWL4
	tSYQu5VM5xlFeb0lfYc1AetS2ZnK3eVZRxoIVBUSUfJFMg+KyriLVs8D/mUp0UuxVQCsMKid5VQQ8
	RFD+TEbacRc78n0QG1Q+4arwheKLr+n6Mes0IdxAMO+4DC+94NM5Szb6FSQEC61tqenCgQPcvXwKd
	enNVb77w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tU7ES-0000000FHoq-3M4v;
	Sat, 04 Jan 2025 16:42:36 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tU7CB-0000000FHXK-0ES1;
	Sat, 04 Jan 2025 16:40:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 443B55C575C;
	Sat,  4 Jan 2025 16:39:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 417D4C4AF0B;
	Sat,  4 Jan 2025 16:40:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736008814;
	bh=9aLkpmmVf7SzNW23WKff/899vc2RZPaEX/C1AwTTjhc=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=B/BZJomLq8T6g/kbiUaMhUidDDsPvvrqay/EX9uUHoV7pUIJz/zzmF1A1twcdLlPZ
	 DFtjNK0sS/+uY9JnG3jBfdFxJj9jkMsPoaYPagEg2znZ0g5WSs6z0vdMo2cqXzScBi
	 zoajya8k0vGCMMb1SsB3MDZkxzBxXy0sOPgfs/MuyQ50ivPD+cpSyWFpC3rLiq2UK+
	 vdnHkBd2g5fRe0adRRFwhJJjzqxxmVlFFZxqp70Uy930y99rG9epMvqLqSmbxffz5e
	 IWr6Txc5+zqBMxXI4cAQuBRijO2K+vUZ++TY4pE3RdqPaxLUvRc43HS9MFvDzSh5R9
	 vs4wH7Ar2EV6A==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 34D37380A96F;
	Sat,  4 Jan 2025 16:40:36 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next] net: pcs: pcs-mtk-lynxi: correctly report in-band
 status capabilities
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <173600883476.2467289.906250535981566950.git-patchwork-notify@kernel.org>
Date: Sat, 04 Jan 2025 16:40:34 +0000
References: <Z3aJccb1vW14aukg@pidgin.makrotopia.org>
In-Reply-To: <Z3aJccb1vW14aukg@pidgin.makrotopia.org>
To: Daniel Golle <daniel@makrotopia.org>
Cc: netdev@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 angelogioacchino.delregno@collabora.com, matthias.bgg@gmail.com,
 pabeni@redhat.com, kuba@kernel.org, edumazet@google.com, davem@davemloft.net,
 linux@armlinux.org.uk, hkallweit1@gmail.com, andrew@lunn.ch, lynxis@fe80.eu,
 rmk+kernel@armlinux.org.uk, ericwouds@gmail.com, frank-w@public-files.de,
 john@phrozen.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250104_084015_134110_2B68585D 
X-CRM114-Status: GOOD (  10.94  )
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

On Thu, 2 Jan 2025 12:41:21 +0000 you wrote:
> Neither does the LynxI PCS support QSGMII, nor is in-band-status supported
> in 2500Base-X mode. Fix the pcs_inband_caps() method accordingly.
> 
> Fixes: 520d29bdda86 ("net: pcs: pcs-mtk-lynxi: implement pcs_inband_caps() method")
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>
> ---
> drivers/net/pcs/pcs-mtk-lynxi.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)

Here is the summary with links:
  - [net-next] net: pcs: pcs-mtk-lynxi: correctly report in-band status capabilities
    https://git.kernel.org/netdev/net-next/c/a003c38d9bbb

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



