Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FF14C369D3
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Apr 2025 12:50:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5ivL5Ti0Q3RhIMz3cs6p0pT2tGV00FkMsE3PCGA6DQc=; b=k7tgjbeM37w1TKr9N5pFhbB7z5
	i4CXo6shXLz/LOwhvbC29BNR+17MA0RRgnrEEWfKpyJFGn42nQFST/y4SDblKv3JpBaSrKlCwj7/I
	h46zBW6h3cZbqxArfk1x61p9z3y5+JBqQwR7weWcZvPVTHY0Kiz/Wu6XcWZ+RSRUgSYBp2GEdmhR0
	uuT//KuK7D5L08nit6XvZ5snT3c1kYBpw5mwAXOjDqbfHea9PiNg0OSxpwhKUO4RXv5oEtJfwkhJH
	KhpRtceYCO180Xlp2npJcz+KyzhwUu/xClbQ5CRrwOxaI12x+G/AmnLtlcqbXgkBbzi2SXSxyXhms
	5zm7pRdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7D56-00000007Bri-1D2L;
	Tue, 22 Apr 2025 12:50:32 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7C3P-0000000701Z-3jvJ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Apr 2025 11:44:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=5ivL5Ti0Q3RhIMz3cs6p0pT2tGV00FkMsE3PCGA6DQc=; b=L2hb+1eXc4+jkulhn4CY7JiPMu
	dv9x9FghMf2tSeBqEH85SPHARyjSF9XKCJA8JiXIYah9w0bTIIlvzvyZwZzSM/kwuzasuXY8O/0Dp
	QzP7IrR9igpe+w/YeDWKiXAmU6Ofkm6f7EdEX4jNFtXMqEBDymsAbx4aWmcshTPa4ALGuIUEYY35i
	V4p2YZF6JZZlxfqHXwVFORF/omyAugz7mv+B/0pssUNdlPtyAjZpGU3FoGmQrKyc2k0KAlXWQtDjU
	Cw1K0WD1IP19Go2evvzV3L55EUCxQLU28zARhbgSC+lTZMmrtAdyjpnFElcZMRhRdoBnX1ch6aDyg
	7MLaueIw==;
Received: from i53875b95.versanet.de ([83.135.91.149] helo=localhost.localdomain)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1u7C3G-0002kK-9A; Tue, 22 Apr 2025 13:44:34 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: Andy Yan <andyshrk@163.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
	krzk+dt@kernel.org,
	robh@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	inux-rockchip@lists.infradead.org
Subject: Re: [PATCH 1/3] arm64: dts: rockchip: Rename hdmi-con to hdmi0-con for Cool Pi CM5 EVB
Date: Tue, 22 Apr 2025 13:44:22 +0200
Message-ID: <174532226020.263993.13170766558495320938.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250419121326.388298-1-andyshrk@163.com>
References: <20250419121326.388298-1-andyshrk@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250422_044443_948051_60FAAE3B 
X-CRM114-Status: GOOD (  11.08  )
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


On Sat, 19 Apr 2025 20:13:16 +0800, Andy Yan wrote:
> There are two hdmi connector on Cool Pi CM5 EVB, the current supported
> is hdmi0, assign corresponding index to it. It will be convenient for
> us to add support for another one.
> 
> 

Applied, thanks!

[1/3] arm64: dts: rockchip: Rename hdmi-con to hdmi0-con for Cool Pi CM5 EVB
      commit: 99685162462c2c70f9e2fbe06481a84a5d0220ca
[2/3] arm64: dts: rockchip: Enable HDMI1 on Cool Pi CM5 EVB
      commit: 85e3fd37204a79e0cd3105176081439ddefbd3b2
[3/3] arm64: dts: rockchip: Enable HDMI audio outputs for Cool Pi CM5 EVB
      commit: abfe411af85aa6ecde580b1f75b9c8145b635fa7

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

