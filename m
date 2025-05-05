Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A8FDC3ABB6
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 May 2025 21:55:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ky2FY8wQi0hoWGwOjDyfpng6BVXAqJP2zLIjZqhEWZA=; b=HybzVAUntTbyjviqtrc3w+G3MA
	h0UptnnEBc5K7QC4E5KNGTmzLYxD4T8c5RH6HYjMHY5nAMHWfHrj1lL/BKMNGSbiVNupWxUDJA1Qp
	HUYLFMPXJDBPl2dChLKQWxSyALtpQS5n5a8vYp1dCnkdwd3oHxupKW35bG4I/2NQxVzKaVQJJGhti
	XsL9N4PBIjo1Cy3S3SPYA8bYFlDf83XOe0ZWyY1HYuY559+5LdV3vIa6H0QnaRicaRq3q/XC/VtnD
	YCxGij/M5fAfEiE0WjQUedjtE8t+FwCK+L4Wg1Sybi1vh/1X5OjBMefmbRdxv11M0wYr880EQwZh+
	iJRRAyHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uC3mc-00000008fpc-2anD;
	Mon, 05 May 2025 21:55:30 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uC3kd-00000008fet-0bTh;
	Mon, 05 May 2025 21:53:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=ky2FY8wQi0hoWGwOjDyfpng6BVXAqJP2zLIjZqhEWZA=; b=DdC3AwJ7cAtgun0b6u5kgbdY5+
	MYldwYok5u4hquFQNeMD6gHgOoDzmnS6HmEoYWikdz5TTtdpWkxyuxqbnf0+974VNsQkyPyRI3MHC
	mgmpcwVl9gL2hAM8qKL3nGifuLykHuNPDmKRhDbgKPfR+PCYAh65SMOPqk7KxYDM/Aba3XLKVo3K/
	2thz9Nm6ua3t++DMLO5DdMOiJxUxU4sWfysIHA57NwHEdJLfn6/olIf0jGes5ZOnnXz4jh/qGsa5q
	LQoJsKmRVOCf68Bk+Uymma2vKbF40Rgr4zKXwb5QGx7nshJkyBC464hQySo9EiSxpuLXKMK1g/+7B
	av8er3RA==;
Received: from i53875a1d.versanet.de ([83.135.90.29] helo=localhost.localdomain)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uC3kW-0000QT-94; Mon, 05 May 2025 23:53:20 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: Andi Shyti <andi.shyti@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonas Karlman <jonas@kwiboo.se>,
	Chukun Pan <amadeus@jmu.edu.cn>,
	Yao Zi <ziyao@disroot.org>
Cc: Heiko Stuebner <heiko@sntech.de>,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH v2 0/3] Support I2C controllers in RK3528
Date: Mon,  5 May 2025 23:53:09 +0200
Message-ID: <174648198304.1334687.5769287856260852986.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250417120118.17610-3-ziyao@disroot.org>
References: <20250417120118.17610-3-ziyao@disroot.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250505_145327_203976_FB30F189 
X-CRM114-Status: GOOD (  13.68  )
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


On Thu, 17 Apr 2025 12:01:16 +0000, Yao Zi wrote:
> RK3528 integrates eight I2C controllers which are compatible with the
> RK3399 variant of i2c-rk3x. This series documents the controllers in
> dt-bindings, describe them in SoC devicetree and enable the onboard
> EEPROM of Radxa E20C which is connected to I2C-2.
> 
> Changed from v1
> - rebase on top of linux-rockchip/for-next
> - dt-binding: collect review tags
> - SoC devicetree
>   - sort i2c and gpio in /aliases
>   - provide default pinctrl for controllers with only one set of
>     possible pins
> - Radxa E20C devicetree: mark eeprom as read-only
> 
> [...]

Applied, thanks!

[2/3] arm64: dts: rockchip: Add I2C controllers for RK3528
      commit: d3a05f490d048808968df1e0d3240ab01fe82211
[3/3] arm64: dts: rockchip: Add onboard EEPROM for Radxa E20C
      commit: 101fe8b5627c68b3f2f941266e26ac355131e2fe

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

