Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EC5BF3ED40
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 11 Apr 2026 13:58:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+ShwvKt8412whVzkg4wSySqNV/BI42ZLfSENlJLNlYw=; b=W08RovxSTPwUYjXiEPUmB9uu6+
	AWGgVrfPWRloa48j3dgU3+JnLV7xj2erIWV3kx1XfOh2cLeum9Rq9MH8dKVLffLr0IMuKeSHPCBMP
	8X4HI11CP35kR4qu+G73rtcd5mw6gnCtQIjGp2Acjhrd7K9GFH1a7BwFHiEpLNiNJLpzJPjBjRgJP
	2q3vExm53W2NH9igaYtNEEng5y6VOrGSxNxplgpKdofor4zpDNBNyAZAFYDhijbZxg5n1HGLKQp+a
	tt2WzVmUNTS0wNIFI+JAAS8oxZoeqiDgmQGiKfB0YNfFlCjCkdObtUBczoyo7CcsIfN0amPP+LV7K
	hphzRW0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBYr4-0000000DU0W-4B2A;
	Sat, 11 Apr 2026 13:58:35 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBYr1-0000000DU07-30RM;
	Sat, 11 Apr 2026 13:58:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B59D2442D0;
	Sat, 11 Apr 2026 13:58:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A48EC4CEF7;
	Sat, 11 Apr 2026 13:58:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775915910;
	bh=XJVN1RE5cpLgCfJiaV7vU1X5RKb/6yX6+y+wQI0OJvQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kjc86yvNDh3A5XDOg9evruqJgOKDxwQxWY/HLQJRQ/5R+p3HsUi8FF1Ns7W/IEDA4
	 Tw8Ld10WyHY3vYXoFJEIPeuWhy2k0mqQnGJx7uEKLaElvU+oCFMnDnZtQ4nRhKNKpR
	 Vbmt2NEjiGVJ9Lsng7/OU0uxyw5lIz8+ChH9CceQC9P6ez3ciEqFrosPSCgTJ/402p
	 q1uCTmbFct/ypcvsXhEM8B5b0RfVGm2MT/nF4erWDdrN1sDNeKXerYSvqYJPHZ0CvH
	 HkoFhK4bAKNa8V0fIeh4fQR3/M+ipohP1IfbSLnyRSANYFwq0cu7DKtaeNRrDUQq71
	 yCBTeODdAknkQ==
Date: Sat, 11 Apr 2026 15:58:28 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: dennis@ausil.us
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, FUKAUMI Naoki <naoki@radxa.com>, Hsun Lai <i@chainsx.cn>, 
	Jonas Karlman <jonas@kwiboo.se>, Chaoyi Chen <chaoyi.chen@rock-chips.com>, 
	John Clark <inindev@gmail.com>, Michael Opdenacker <michael.opdenacker@rootcommit.com>, 
	Quentin Schulz <quentin.schulz@cherry.de>, Andrew Lunn <andrew@lunn.ch>, Chukun Pan <amadeus@jmu.edu.cn>, 
	Alexey Charkov <alchark@gmail.com>, Peter Robinson <pbrobinson@gmail.com>, 
	Michael Riesch <michael.riesch@collabora.com>, Mykola Kvach <xakep.amatop@gmail.com>, 
	Jimmy Hon <honyuenkwun@gmail.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 3/3] arm64: dts: rockchip: Add Orange Pi 5 Pro board
 support
Message-ID: <20260411-practical-persimmon-foxhound-f5869d@quoll>
References: <20260411024743.195385-1-dennis@ausil.us>
 <20260411024743.195385-4-dennis@ausil.us>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260411024743.195385-4-dennis@ausil.us>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260411_065831_779652_79B2BBC6 
X-CRM114-Status: GOOD (  14.54  )
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

On Fri, Apr 10, 2026 at 09:47:43PM -0500, dennis@ausil.us wrote:
> From: Dennis Gilmore <dennis@ausil.us>
> 
> Add device tree for the Xunlong Orange Pi 5 Pro (RK3588S).
> 
> - eMMC module, you can optionally solder a SPI NOR in place and turn
>  off the eMMC
> - PCIe-attached NIC (pcie2x1l1)
> - PCIe NVMe slot (pcie2x1l2)
> - AP6256 WiFi (BCM43456) via SDIO with mmc-pwrseq
> - BCM4345C5 Bluetooth
> - es8388 audio
> - USB 2.0 and USB 3.0
> - Two HDMI ports, the second is connected to the SoC's DP controller
>   driven by a transparent LT8711UXD bridge that has firmware onboard and
>   needs no node defined.
> 
> Vendors description and links to schematics available:
> http://www.orangepi.org/html/hardWare/computerAndMicrocontrollers/details/Orange-Pi-5-Pro.html
> 
> Signed-off-by: Dennis Gilmore <dennis@ausil.us>
> ---
>  .../display/rockchip/rockchip,dw-dp.yaml      |   7 +

Please run scripts/checkpatch.pl on the patches and fix reported
warnings. After that, run also 'scripts/checkpatch.pl --strict' on the
patches and (probably) fix more warnings. Some warnings can be ignored,
especially from --strict run, but the code here looks like it needs a
fix. Feel free to get in touch if the warning is not clear.

Didn't you already got this comment?

Best regards,
Krzysztof


