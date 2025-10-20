Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04B05CCD199
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Oct 2025 15:25:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CqOPWe4rfsEXq/Axf6YfN7t0vCSfPE7s8YtPOxax4AI=; b=PjazaV/+VaGddZX0PRaOH2AWfy
	yv1sjXKWO3LLtBfOS96ZCjbJ6oX6rgPFsc8+gZurzSHIJgYswztcMEwkK+MakDuERhuuhtA271klj
	SFVq+7XiT32HNJX6fBPf2zUnJhhU1ODAKG8FG+v32AOo5LaV00LVsg2meb+sOVTyuwUz3IjNkv6WQ
	aB6p9chYngggN2ZsVKWOk/nKJPXzDmgDoB4yOUSYil5X0pnmQ9ljatcqY3Ef8CDSTn79WHpBl8b0A
	0yTjEjN22TbK4ej+X7mbKmYfvCmlcBHUgOJBddflXQmduK3dtT+2LOI7egrd2Jv2S1g8omCDNwn38
	OU4N5jTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vArl0-0000000E7Jo-0fN1;
	Mon, 20 Oct 2025 15:25:10 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vArkx-0000000E7IU-25pQ;
	Mon, 20 Oct 2025 15:25:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=CqOPWe4rfsEXq/Axf6YfN7t0vCSfPE7s8YtPOxax4AI=; b=bRn64KPiWoQCVOWet6ScvQRY9l
	lD4nAkaGrSMWPtzDY5TPGUVSaH+dG6EG48t6Ose6jhmC+sXSmnsBLtz5PqNGAQWqRtmB1p6B+sSUh
	wB4PXg/iGxxAV0Hf24/DWtqBxjsj4U3763uMJFtsgVErGbQxtt/kI5FLe9RxRtX/CmEuIHhzC2zJ3
	yIF6LMYioHHVf7FmOaA3LdKLFTLj5nkQ69HmjKGPQFdYq/Dy9GT/5HB1OuDoFVFekj9NPdxHiKRof
	1V2PrHpTzYht81R4sGXIRryfvMcjyCKNr1M0xX3ZmARsRVM4dZ9ToYbrYWmoziVbqGu/ElenlNEox
	BVN370cg==;
Received: from [212.111.240.218] (helo=phil.guestnet.ukdd.de)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1vArka-0002qD-Cy; Mon, 20 Oct 2025 17:24:44 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	quentin.schulz@cherry.de,
	kever.yang@rock-chips.com,
	naoki@radxa.com,
	honyuenkwun@gmail.com,
	inindev@gmail.com,
	ivan8215145640@gmail.com,
	neil.armstrong@linaro.org,
	mani@kernel.org,
	dsimic@manjaro.org,
	pbrobinson@gmail.com,
	alchark@gmail.com,
	didi.debian@cknow.org,
	jbx6244@gmail.com,
	andrew@lunn.ch,
	Liangbin Lian <jjm2473@gmail.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 0/3] arm64: dts: rockchip: introduce LinkEase EasePi R1
Date: Mon, 20 Oct 2025 17:24:42 +0200
Message-ID: <176097387773.44471.5625428430704805786.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20251014051226.64255-1-jjm2473@gmail.com>
References: <20251014051226.64255-1-jjm2473@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251020_082507_554908_419779FA 
X-CRM114-Status: UNSURE (   9.57  )
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


On Tue, 14 Oct 2025 13:12:23 +0800, Liangbin Lian wrote:
> LinkEase EasePi R1 [1] is a high-performance mini router.
> 
> Specification:
> - Rockchip RK3568
> - 2GB/4GB LPDDR4 RAM
> - 16GB on-board eMMC
> - 1x M.2 key for 2280 NVMe (PCIe 3.0)
> - 1x USB 3.0 Type-A
> - 1x USB 2.0 Type-C (for USB flashing)
> - 2x 1000 Base-T (native, RTL8211F)
> - 2x 2500 Base-T (PCIe, RTL8125B)
> - 1x HDMI 2.0 Output
> - 12v DC Jack
> - 1x Power key connected to PMIC
> - 2x LEDs (one static power supplied, one GPIO controlled)
> 
> [...]

Applied, thanks!

[1/3] dt-bindings: vendor-prefixes: Document LinkEase
      commit: 9e38dc1abce6fb776d4b6731ccc64ad25e525d39
[2/3] dt-bindings: arm: rockchip: Add LinkEase EasePi R1
      commit: fc3cd4021eeecb9adbe030b8cf32587126775d8e
[3/3] arm64: dts: rockchip: add LinkEase EasePi R1
      commit: deaefeaf3df433d50935b9a85076041040f06d74

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

