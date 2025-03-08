Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FDE9C28B28
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  8 Mar 2025 17:37:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8+6NAxcBm9mQhrCma2ihh2Vk+YbjWow6/geDHrsWJQY=; b=tqYRtNBveTx8m9+zW/SKrBxc4m
	cgKaAoWM9vSqWOo0ON7tVJ1lHy7MD8pyfvwQsrs3BxEqEaBo8PAom1nXb0iMEbnyEIs9L4adWrElI
	t8AJjSC8cAdLtv0Ts+jxTPdC1R5FtmYORcPsHVCnpL/uwRVUD/gghg3AVbgDr/YKdclx24mAiedyT
	oXSf+tGrJ8ouIrdW/y/0SrtmZg5CT4dWhCJvIsntEFkViypvby1jy5YoZ251V/nh5X4PsIuihjIw+
	wC4+Nn+4Ca6Tw3t6ylmS3THrT2C7F0tGqj6LMj3nqMv5/1sMiE6vcPQLxEJSSwZR0RzkZO+okUzyg
	CqiwXFOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqy6r-0000000GwAU-2jLH;
	Sat, 08 Mar 2025 17:37:13 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqy25-0000000GvXu-1UiU;
	Sat, 08 Mar 2025 17:32:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=8+6NAxcBm9mQhrCma2ihh2Vk+YbjWow6/geDHrsWJQY=; b=f4D5EpkMvO+Ut1Y3iM2P2I8FYa
	Dnd3iAhMmY65gRRvHT0/1MU5y9CHOxGzM/slj62CuSC2sE7wg6RkTVL4hn5D6y3p/vKr5iPDQQrz6
	iEPjv6+4WqB2oNGiRKs9SgOEqQA1M0gCD8oQ4SDzg3GbYziiO6rHyC55G94IpgmPee85PYviCyBO7
	Mrw4RBvNInZPJymlQMxpHmC9yh/14osJ6g5Rs1N8eVTSmoHVchzEjcwHUtUlI/tcJ+lIww8R4+GNs
	GbCIHcbubMEA9Gw+G4GCPTfi/lQYD6ODS64tdaEFL18eORPmucBdJr+LPboPwqxGzNSbg/ORtqRG8
	gQ2GZmAg==;
Received: from [194.95.143.137] (helo=phil.dip.tu-dresden.de)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1tqy1y-0004Tx-N9; Sat, 08 Mar 2025 18:32:10 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: Chukun Pan <amadeus@jmu.edu.cn>
Cc: Heiko Stuebner <heiko@sntech.de>,
	Yao Zi <ziyao@disroot.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v3 0/1] arm64: dts: rockchip: enable SCMI clk for RK3528 SoC
Date: Sat,  8 Mar 2025 18:32:01 +0100
Message-ID: <174145503573.101861.9257226762854268898.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250307100008.789129-1-amadeus@jmu.edu.cn>
References: <20250307100008.789129-1-amadeus@jmu.edu.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250308_093217_394959_81A397BA 
X-CRM114-Status: UNSURE (   9.69  )
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


On Fri, 07 Mar 2025 18:00:07 +0800, Chukun Pan wrote:
> Same as RK3568, RK3528 uses SCMI clk instead of standard ARMCLK.
> Add SCMI clk for CPU, GPU and RNG will also use it.
> 
> dmesg:
> [    0.061333] scmi_core: SCMI protocol bus registered
> [    0.125780] scmi_protocol scmi_dev.1: Enabled polling mode TX channel - prot_id:16
> [    0.126628] arm-scmi firmware:scmi: SCMI Notifications - Core Enabled.
> [    0.127233] arm-scmi firmware:scmi: SCMI Protocol v2.0 'rockchip:' Firmware version 0x0
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: rockchip: enable SCMI clk for RK3528 SoC
      commit: fbcbc1fb93e14729bd87ab386b7f62694dcc8b51

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

