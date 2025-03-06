Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 325E4C282DE
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Mar 2025 15:34:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n5aD5c3lPAMGKpNg0pZzLgDxoQS/0A88tfAf7d3Ga4w=; b=3opltT1Nf2YjIqEOtOdySK4PWB
	6tILVFeZLtgcK/qp+AyjrVaLhCjbop9labJEtNXCudtlyFxr30/BNrABRhQct4Z0NtSD90vrEShrO
	DIkJqJiibw3UnJMN5CsbH6n1YetIcqboGK2k9lH3+n7PGuiSpF3Dh4ZG6feBFalH8o2saJhWEYkH/
	XfmX6q7/tt8JdBcdVNnBtlt3S0hMQiMyVozTmMItt8kEzhesDFZAiO8tBIJ8B7l3UlweCu74gxm02
	CIMbYuVr0MscBFQAbXP0XIpdLZVXo13A5WtNRPrG3n7AFGK/gwW/CPztpU1W51a3TZuUX0b1E//qA
	gMPbxyQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqDEX-0000000BL5m-2bmi;
	Thu, 06 Mar 2025 15:34:01 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqCAS-0000000BCIX-2IRo;
	Thu, 06 Mar 2025 14:25:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=n5aD5c3lPAMGKpNg0pZzLgDxoQS/0A88tfAf7d3Ga4w=; b=VbHNERiPVO6UZVnSVLhH/tOQiz
	HLsRkehic5Kdr8Pkuh5l32tXLLGTr0jhQtsWV1LR8rF+68sFVabAncu0fMP4PLN9WUaCt3YLNwSMJ
	8ni205h1cSu/7MwtOXW8pGSzGwa/E2cY+umKUZzBEgZrrm9kaHOQvmYd0NkSv1gwi61L6K60D0Ql5
	GYNOi8ZtbUVJZzAGpFHczQQewDlR0l+5tjK2v7YgoHuwMXiDg7uhwa7VqSh0JiTcJTycvLQEYHOaF
	GyylM3xLjEWC8L2ZNMf5X9PyGDM15ntLOcfiFxAXCm52uujTsq6dxcADQIQ1zO+4odHPrgRdWRHWv
	dG7NbngA==;
Received: from i53875a38.versanet.de ([83.135.90.56] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1tqCAL-0003oY-Bc; Thu, 06 Mar 2025 15:25:37 +0100
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: krzk@kernel.org, Chukun Pan <amadeus@jmu.edu.cn>
Cc: amadeus@jmu.edu.cn, conor+dt@kernel.org, devicetree@vger.kernel.org,
 krzk+dt@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
 Jonas Karlman <jonas@kwiboo.se>
Subject: Re: [PATCH 1/1] arm64: dts: rockchip: enable SCMI clk for RK3528 SoC
Date: Thu, 06 Mar 2025 15:25:36 +0100
Message-ID: <24848438.6Emhk5qWAg@diego>
In-Reply-To: <20250306142008.389243-1-amadeus@jmu.edu.cn>
References: <10115c0f-4a7f-460a-a0bd-0c86d1e7d3b6@kernel.org>
 <20250306142008.389243-1-amadeus@jmu.edu.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250306_062544_602382_F69B21BA 
X-CRM114-Status: GOOD (  12.34  )
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

Am Donnerstag, 6. M=C3=A4rz 2025, 15:20:08 MEZ schrieb Chukun Pan:
> Hi,
>=20
> >> Any suggestions would be greatly appreciated.
> > Where is the SRAM located? Inside the SoC or is it carved out external
> > ROM/RAM?
>=20
> It is located in the SoC.
> "Embedded Memory" Area:
> BootROM | PMU_SRAM (8KB) | SYSTEM_SRAM (64KB) | OTP

are you really sure about that?

Looking at Jonas' recent rk3528 u-boot series [0]
0x0 _to_ 0xfc000000 is the SDRAM memory area
so 0x10f000 is a carveout of the main sdram.


Heiko


[0] https://lists.denx.de/pipermail/u-boot/2025-January/578393.html



