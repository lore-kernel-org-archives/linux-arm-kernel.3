Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37C16C88E77
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Sep 2026 13:03:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oiSfvUAUcmVPBixTSv8CyI5eKdTp2eCY9vSp754uHAQ=; b=SYH7Nvau7bWuOWmr1MK6HX9rUI
	UT/vDT7AggBC249askV7LS7ONqyrXo0oHRAaPCgye83zxRISQbxrYgwLPnCaT0p85CL5XckcI9dGp
	MvRQKTOCPd7nVFPcOtQb3Yfw974rcOly5pwIolLOM/2VVUgPwGu6YKtoZGcWG7TG8K9DC5I6pg7nF
	6UWevCA6uYy1LE9zZw1ckxB02bDbVIY4lytd4YGZMCYKIxdeQ2cphsV9PIplSIW+vHK1XqjGIF1ow
	BJqRNgJ5OgGLFje+GFaG4sNS+hfxs9qi1b9V+7BUkTWwHabqRBgx9DUeT404hBCBCwB37dQzFy8KU
	vP1AezrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6pIM-00000009EOt-160U;
	Wed, 16 Sep 2026 13:03:26 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6pIK-00000009EOE-0bXn
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Sep 2026 13:03:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=oiSfvUAUcmVPBixTSv8CyI5eKdTp2eCY9vSp754uHAQ=; b=19SayIr58yyGer4JWwyFocFp2I
	ik1oe5Zw2vZVSCVtzpKMKIr2x9lQkofOMQA14UCvsgyDLFQ8DULUWR+3BuAgp/NSNqnsSLDaqBxJs
	SH9BnF9X0kf0unsGtM+d97uiWSFrQKOzpZlPBO1DEZSHcWopLJV0RVXH1xLKB1p/wFFw=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1x6pIC-005TtK-Lm; Wed, 16 Sep 2026 15:03:16 +0200
Date: Wed, 16 Sep 2026 15:03:16 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Francesco Dolcini <francesco.dolcini@toradex.com>
Cc: Francesco Dolcini <francesco@dolcini.it>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Emanuele Ghidoli <emanuele.ghidoli@toradex.com>,
	Ernest Van Hoecke <ernest.vanhoecke@toradex.com>,
	Franz Schnyder <franz.schnyder@toradex.com>
Subject: Re: [PATCH v2 3/7] arm64: dts: freescale: Add Lino iMX93
Message-ID: <27cceddf-8797-4e9e-ab7b-4cddb03d6448@lunn.ch>
References: <20260911091952.96233-1-francesco@dolcini.it>
 <20260911091952.96233-4-francesco@dolcini.it>
 <42ed88a6-d208-482b-94aa-2e45b69c173e@lunn.ch>
 <20260915132806.GA226756@francesco-nb>
 <100eef7b-e1d6-411b-bac5-98790e8f9ea7@lunn.ch>
 <aqmG91HwmKe-enfy@francesco-nb>
 <95dcbf3e-193d-460b-b6b9-cd412394e4c6@lunn.ch>
 <20260916055706.GA20310@francesco-nb>
 <8bb9b763-4553-4263-b0ea-0129f5db0229@lunn.ch>
 <aqqPBffOWirFXJSw@francesco-nb>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aqqPBffOWirFXJSw@francesco-nb>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260916_060324_225326_1F40C7AD 
X-CRM114-Status: UNSURE (   7.93  )
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

> And again, thanks for the review, I appreciate it. The goal is to have
> working ethernet with the interrupt, and, **IF** not possible, working
> ethernet is more important than the interrupt :-)

Your decision.

The datasheet says it is active low. Polling will always work.

Generally, users who want fast notification of link down use something
like Bidirectional Forwarding Detection, which can tell you much
faster that the link is dead then the PHY itself, which tends to wait
for 1 second before declaring the link down and changing BMSR.

    Andrew

