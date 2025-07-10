Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 566ADC83F17
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Jul 2025 13:29:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B9sgA9KEUZfto5gbFbrYuGKWO4F6LlXYQzl0p1sXfYE=; b=OO75hYsS5wa+7+ZaQe82jWCAPj
	9MFuV6JU3eh+XGLGUXYMi+Dpq9gdaXruwRbjI+mfwwG0NgoL8FvG5PNIcfyKuL0yWtJlxHSzKjzHM
	vLQ8/LShA5y+9JiM/I9oA1EMvFhDClrMEXAGP4CfpqZ7Jh6JbY5gEmDvtAQUSGEOWt9f4XtFjEsbY
	aKTv17z0H5YStirzY6MUAPY2jZpWMCkGiS2YuFUdpDSI8ld6pSCzSsR598vPkqGYj3E2AOpPcEL6y
	BlgePQTX0lAiGfw2eaj7SlM5kX4x8sxs0k69+0cI0KSAwZsitfYnpa0y6yOvZSQZZc5Lu0rExOxoI
	PJaC+Xmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZrKk-0000000Bvlm-41EI;
	Thu, 10 Jul 2025 13:29:06 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZnYs-0000000BLAt-2OMm;
	Thu, 10 Jul 2025 09:27:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=B9sgA9KEUZfto5gbFbrYuGKWO4F6LlXYQzl0p1sXfYE=; b=gptBhNBpJmVaIz2i3RyQA2Sdqm
	9z1dt1+GlDuecoh6aea9a7nL1mYX3QoxzV8KXqPlkcKXoW4egYxqX9+YlxXlKMBUZstSZW3cyRex4
	V0VtuWnFFLeixCFe7rI7VAdS5JR9s2U7awT+SSiWkzgqRAq7+y1ByBOmdirwoMXbHd4IdfQIw5UAU
	D51JQwC6QqPwIAJL4Alz4bsr2b45qDvqPSBCDlZf34lqwRXkvJpXGy8+E9mnlnZpG0I23Bb5OEqI6
	Hc/ROxtmwJyS9urc1zTNPFBvtlgwNPgUbrYXDU1anyKt0E04X5uwCgo0tJcdWV+Yft63g5w1+L1MO
	H2DWl64w==;
Received: from [194.95.143.137] (helo=phil.dip.tu-dresden.de)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uZnYo-0003fo-5H; Thu, 10 Jul 2025 11:27:22 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
	kernel@collabora.com,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/3] ROCK 4D DT additions: regulators, usb, rfkill
Date: Thu, 10 Jul 2025 11:27:15 +0200
Message-ID: <175213962001.1887379.15984995159169129964.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250630-rock4d-reg-usb-wifi-v1-0-1057f412d98c@collabora.com>
References: <20250630-rock4d-reg-usb-wifi-v1-0-1057f412d98c@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250710_022726_632838_405E2CE0 
X-CRM114-Status: GOOD (  12.23  )
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


On Mon, 30 Jun 2025 17:36:32 +0200, Nicolas Frattaroli wrote:
> Turns out the ROCK 4D DT in mainline right now is neither accurate nor
> complete.
> 
> These changes should quell the fires a little, since at least we now get
> two additional working USB ports, plus the Wi-Fi chip shows up (even if
> it doesn't have a driver right now).
> 
> [...]

Applied, thanks!

[1/3] arm64: dts: rockchip: adjust dcin regulator on ROCK 4D
      commit: fc276de7b63efc92f301d5b78d5000c1715c4313
[2/3] arm64: dts: rockchip: complete USB nodes on ROCK 4D
      commit: 37e557333b66f036a5638035765219531327025c
[3/3] arm64: dts: rockchip: theoretically enable Wi-Fi on ROCK 4D
      commit: 0e72c9aba2029f66dd92ad5f2cb68c44e1d910de

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

