Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFC4BCA5FC5
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Oct 2026 07:10:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=jx/3Z5WGEmMbu5Hsr3G6ByHyWGO3jCxLxsODPvWyTJY=; b=CG3vURBNZjiUqvM1TwIoj9hqvv
	maniPeP9doWkExplFBsIrb77zoEPT5bPrH0/o0a08KNYDkSNajYWt24EL/6OppY/XLuBI0EfLipz4
	I6xNhtrTupsFup5hvE410jGILtzW+1qzK1MdyMSCOrTOkiexOzARDPh8xLP7O0NEyDDrSOu9lqsqM
	Q9eqg8P56/5W5Ldb0XgeZ4lkmSzZXGJTP33n9AW9VPopCFGeRdH0bdefpxpwSlavBf0uxnGpD40gI
	Dm7TcQLYf7Ixeqboom8TzExYeS1qjHsJMwVR2OvtGhJ1XJoH4Qx44fxOYTva3En4ZRF0uRQphRnKA
	WXYir6lQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCAvU-00000007xNl-0WrC;
	Thu, 01 Oct 2026 07:09:56 +0000
Received: from cp2.siel.si ([46.19.12.180])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCAvR-00000007xM4-1x9W
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Oct 2026 07:09:55 +0000
Received: from 89-212-21-243.static.t-2.net ([89.212.21.243]:41660 helo=localhost.localdomain)
	by cp2.siel.si with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <primoz.fiser@norik.com>)
	id 1xCAvR-00000001Ztc-04YD;
	Thu, 01 Oct 2026 09:09:49 +0200
From: Primoz Fiser <primoz.fiser@norik.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	upstream@lists.phytec.de
Subject: [PATCH v2 0/3] ARM: dts: imx6: phycore-som: PMIC and PHY fixes
Date: Thu,  1 Oct 2026 09:09:44 +0200
Message-Id: <20261001070947.1815279-1-primoz.fiser@norik.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - cp2.siel.si
X-AntiAbuse: Original Domain - lists.infradead.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - norik.com
X-Get-Message-Sender-Via: cp2.siel.si: authenticated_id: primoz.fiser@norik.com
X-Authenticated-Sender: cp2.siel.si: primoz.fiser@norik.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261001_000953_663890_2D45B907 
X-CRM114-Status: UNSURE (   5.23  )
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

A few small fixes for the PHYTEC phyCORE-i.MX6 SOM:

- Pin the DA9062 PMIC watchdog to /dev/watchdog0 (1/4).
- Raise the PMIC's SOC/ARM buck ceiling to 1.5V, needed once the
  1.2GHz OPP tier ([1]] requests 1.3V for VDD_ARM and the anatop
  LDO's 125mV dropout is added on top (2/4).
- Add phy-reset-duration to fec node for more robust reset pulse (3/4)

[1] https://lore.kernel.org/all/20260923070505.494949-1-primoz.fiser@norik.com/

Link to v1: https://lore.kernel.org/all/20260930102532.2262700-1-primoz.fiser@norik.com/

Changes in v2:
- Drop patch #3 from v1 (converting to reset-gpios) due to potential
  backwards compatibility as suggested by Frank
- Convert patch #4 from v1 to patch #3 in v2 (use phy-reset-duration)

Primoz Fiser (3):
  ARM: dts: imx6: phycore-som: Set PMIC watchdog alias as default
  ARM: dts: imx6: phycore-som: Increase PMIC max SOC and ARM voltage
  ARM: dts: imx6: phycore-som: Add phy-reset-duration

 arch/arm/boot/dts/nxp/imx/imx6qdl-phytec-phycore-som.dtsi | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

-- 
2.34.1


