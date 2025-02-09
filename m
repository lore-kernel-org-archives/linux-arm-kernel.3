Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 018AFC021A1
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  9 Feb 2025 21:20:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oYAwdX72PHmdy4J6udOJ/5daIBDy5Wdsh0FcYAuEvbM=; b=HIYkgfBaVMd97KiPaD3YvI5rtA
	01dvqsY7yZTxQR9BG0i9pAagKW/4TCc0SEiT1QkZdXR0WixoTK6elV3WilgYrn5KmnsF2+7qTMfvF
	enuWy8I2AXc37fiMcDlDLDpTc86mg0X1J6i5LqwzgEg8Vd1Ft8KJn+sKvFWlL8sBfwNQWG/UbqSCz
	m6hysPRkkqDUyP+rSx6oqvKDsMtijKaeiATgHMID9mm+BAqjIRz8y4TkgdTzJQ7lYWJPnVHdKCXJ4
	gAM9RK1xvyQJ7DbmvOloPHTAJ6Ci+/ebbBVEPAbPJracaqXfbUsdM5Db2BR039OYax/q0zzteU1Hq
	MOhDAHQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thEif-0000000Fb8L-2rkq;
	Sun, 09 Feb 2025 21:20:01 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thEhG-0000000Fatt-2WOO;
	Sun, 09 Feb 2025 21:18:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=oYAwdX72PHmdy4J6udOJ/5daIBDy5Wdsh0FcYAuEvbM=; b=dHDOw7t6wStxmGXkfKq3k6bh6b
	5EvY9TAb5c+yoX/0bLBOJbGkqm2Ynd/a8Saxi/z0Xxa2PJc1IeuvPKXeTuZ/71sDdEwhzL/NvLYCN
	dsPGhQFPuk58HJDljQtuZR0LoVI6LKTeHv1a6LWSWBL785AaoSPCJBenGTDQueredU0Jr6I9M5Q4k
	OjJ9f9T1/jQDei5SafJjtfBY6VOv4pC3/glnr294BCLAKG53SxUX2+N2k1U4iYiqjCqo6rlgsU+qY
	O9Edo3WV3m62UZyS1WqbWQJTae41eDIMZx3Q3gI/mBSF+UnCJH1YkQY6w4/nYOrxOBFw5IKMFL7DE
	lDkbqcpw==;
Received: from i53875bc0.versanet.de ([83.135.91.192] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1thEhD-0002GS-1G; Sun, 09 Feb 2025 22:18:31 +0100
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: vkoul@kernel.org, kishon@kernel.org
Cc: cristian.ciocaltea@collabora.com, linux-phy@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, quentin.schulz@cherry.de
Subject: Re: [PATCH 0/2] phy: phy-rockchip-samsung-hdptx: don't use of-alias
Date: Sun, 09 Feb 2025 22:18:30 +0100
Message-ID: <3969871.5fSG56mABF@diego>
In-Reply-To: <20241206103401.1780416-1-heiko@sntech.de>
References: <20241206103401.1780416-1-heiko@sntech.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250209_131834_662411_13E28C2F 
X-CRM114-Status: UNSURE (   8.68  )
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

Hi phy-maintainers,

Am Freitag, 6. Dezember 2024, 11:33:59 MEZ schrieb Heiko Stuebner:
> One nice comment addition and removal of of_alias usage for core
> device functionality.
> 
> Heiko Stuebner (2):
>   phy: phy-rockchip-samsung-hdptx: annotate regmap register-callback
>   phy: phy-rockchip-samsung-hdptx: Don't use dt aliases to determine
>     phy-id

any thoughts on these 2 patches?

Thanks a lot
Heiko



