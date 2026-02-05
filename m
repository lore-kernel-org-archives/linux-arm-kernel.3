Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8596ECD9AC
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Feb 2026 21:24:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=4q+Et7LfDgL1+sDdkNvX7YRwfFN/3xxHm4fIKVVRhW8=; b=NBuMMcl+bzjElUwchga4aBfwro
	T3TMfx4rwy9q8QuIq9ROuTTI1M+mXCJ2CrPAuvPxs7KqRwmeoI2hzgu6bT+vbCugChimsvnatgjmU
	CY6vbCzAXWLMcEAG2Cn2p+iwJm2PpVqnbA4MJSOwkMF+TcaL9SVSh5Gu2WWC/pzYoue0WAHWtNUxY
	T1vLI+1jwcT+2828Ffg4zNo8VosUEefggeewPHBHFrj1qxmh5ZGZkO2UehqtnmBr6HoL7djIe/dbS
	Sopg6shPvXcXGMCKxS4i3YEfESOJyoWWDNFmkhY7FI1e/WubB6hBXAoUFq+TJB8wKhNUIYk8rba+Y
	tGSUeJ6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vo6pk-0000000AVqE-0gHA;
	Thu, 05 Feb 2026 21:24:16 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vo6pe-0000000AVnm-2vvk;
	Thu, 05 Feb 2026 21:24:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:
	Subject:Cc:To:From:Reply-To:Content-Type:In-Reply-To:References;
	bh=4q+Et7LfDgL1+sDdkNvX7YRwfFN/3xxHm4fIKVVRhW8=; b=uaSnTS+dgZGR2JkZa3KeMA6fFp
	z62Z4J9QNBGXIiSo0Ex8alXX4jZtOoOsJ29DjOREK/zTYCf42EsN/nRqyb7dggjqLLYdKxY3G8efp
	BRyfS7qEEhY2mdhLDqwPkdsHYekKMDezgGMG4GEc/sVxkEgxIO5E3s79cgH6ILHJ/OMaMxwTGaA40
	dSVRdXaFbqRMoIL2cX4JoYBvTawhVMnW8QzItDOzoYlGz8DHaKDVJ48x5rs7xxLir33t49eX+5oeU
	Op0giyX3X014tiraBycXldAcV69PkDYOLHGaY4vhXQzIbLmU6E2HF7TiJZUj4n1xDrm4ZOfs3nqTY
	m2BL93Bg==;
Received: from i53875afe.versanet.de ([83.135.90.254] helo=localhost.localdomain)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1vo6pb-007GK0-Uj; Thu, 05 Feb 2026 22:24:08 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: heiko@sntech.de
Cc: linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kever.yang@rock-chips.com,
	finley.xiao@rock-chips.com,
	w@1wt.eu,
	jonas@kwiboo.se
Subject: [PATCH 0/3] Add devicetree nodes for RK3528, RK3562 and RK356x
Date: Thu,  5 Feb 2026 22:23:44 +0100
Message-ID: <20260205212347.490636-1-heiko@sntech.de>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260205_132410_740043_636EBC5E 
X-CRM114-Status: UNSURE (   8.71  )
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

This is a companion series to the binding+driver changes [0], that adds
the relevant OTP controller nodes to the core SoC devicetrees.

[0] https://lore.kernel.org/linux-rockchip/20260205211901.490181-1-heiko@sntech.de/T/#t

Heiko Stuebner (2):
  arm64: dts: rockchip: Enable OTP controller for RK3562
  arm64: dts: rockchip: Enable OTP controller for RK356x

Jonas Karlman (1):
  arm64: dts: rockchip: Enable OTP controller for RK3528

 arch/arm64/boot/dts/rockchip/rk3528.dtsi      | 47 +++++++++++++++++++
 arch/arm64/boot/dts/rockchip/rk3562.dtsi      | 46 ++++++++++++++++++
 arch/arm64/boot/dts/rockchip/rk356x-base.dtsi | 46 ++++++++++++++++++
 3 files changed, 139 insertions(+)

-- 
2.47.2


