Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABEBEC43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Jun 2026 13:53:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RhTaGTqXn+vEjpea1Rvo2RPETqMhHuTMxdNXRudSe/o=; b=0PVhWTTI2/dvOEpeAXU9DBrJBA
	f/k0SEYeHhrxLFJpNbkwhjj8LDHxbJPsVwh82PcFziYLmPwLysgJ4+TKKs+xij/i+10KusZok1z6g
	drOwr9+0prgQ///eXl1vwfwpkltieBcMAftbvl4m/o4EOz1t1wGe8iCHMZHdqSZtXz87r4Upi4P/H
	mgadg+BjwjUx95XZ85N2VAVzhWziGBxRvvYBHGH0RN/kqZXwqXunXrnXkTplc0sx5XLzDtS0Xx4cZ
	lb6jDuxwmOPXqxxly2H2cG2QAKMDaV9Ou/TEG+m2F42E4Hfg1eZI3D0q1hJXCRTpffuexE1gZSUCJ
	sb2K13sw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weYtx-0000000HDQy-0Q4v;
	Tue, 30 Jun 2026 13:53:25 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weYtt-0000000HDQd-3j6q
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Jun 2026 13:53:23 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 137A74E40BB1;
	Tue, 30 Jun 2026 13:53:18 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id D366E6025A;
	Tue, 30 Jun 2026 13:53:17 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 497B2106F1F70;
	Tue, 30 Jun 2026 15:53:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1782827596; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=RhTaGTqXn+vEjpea1Rvo2RPETqMhHuTMxdNXRudSe/o=;
	b=D9wSGRVypx8zxy3QgxOSR130crVvBYKWZNsLuy/RRFjJLeBg3BQdLPUaFDY/5R0BEEX9b/
	5A498attBVzR2DG8XO4BBKQhrgBmpkrufZKVvC17sTbYl25xqGrwVMva8scfhu1g5eo3en
	bKFmtNpANcqA/VRIGpxxTH/VCWjJL7xFzq4LhFyPwkXz61w8AQ64UJTt54okI1zw2yC75g
	F1oDoH6AdfPL3JSbHuMapXSt20ZBqstdc1hWTxEbPCvi5NU8atITi4occfoghLZTVDBFDL
	see8UI6kPDopLHpL55kTSDUp3FS+dxAhszlwDryseybhNk13Kvdp0Neyz/GkJA==
Message-ID: <563ac947-0c5d-47ee-aedc-66baf4d32648@bootlin.com>
Date: Tue, 30 Jun 2026 15:53:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] arm64: dts/net: stmmac: Add Agilex5 SoCDK TSN Config2
 board support
To: muhammad.nazim.amirul.nazle.asmade@altera.com, dinguyen@kernel.org
Cc: rmk+kernel@armlinux.org.uk, krzk+dt@kernel.org, conor+dt@kernel.org,
 robh@kernel.org, davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, andrew+netdev@lunn.ch, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260630133108.27244-1-muhammad.nazim.amirul.nazle.asmade@altera.com>
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
Content-Language: en-US
In-Reply-To: <20260630133108.27244-1-muhammad.nazim.amirul.nazle.asmade@altera.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260630_065322_079632_969C16C3 
X-CRM114-Status: UNSURE (   7.64  )
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

Hi,

On 6/30/26 15:31, muhammad.nazim.amirul.nazle.asmade@altera.com wrote:
> From: Nazim Amirul <muhammad.nazim.amirul.nazle.asmade@altera.com>
> 
> The Intel SoCFPGA Agilex5 SoCDK TSN Config2 board uses a dual-port
> Ethernet setup where gmac1 (TSN port) operates with different MAC-side
> and PHY-side interface modes: GMII internally in the MAC, and RGMII
> towards the PHY.

There's the same behaviour on Gen5, e.g. CycloneV where we have the
"EMAC splitter". Based on wether or not we have that splitter in DT,
we override the INTF_SEL bits to set GMII as the MAC output, the splitter
converting that to RGMII/SGMII.

Is there something similar on this AgileX5 version by any chance, for
which we could reuse the logic ?

I know that on CycloneV you also need to adjust that GMII -> RGMII/SGMII
splitter whenever the speed changes, is that different on agileX5 ? have
you tested 10/100Mbps ?

Thanks,

Maxime

