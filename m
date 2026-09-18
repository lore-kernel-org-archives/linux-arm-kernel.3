Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5231EC982DD
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Sep 2026 19:57:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=miYEpa5PMvA0funy+iOROF2DjhNHtNQg565GQ8qwzpk=; b=PgyFx4b+toPdOy2u6O+K8yWe1H
	p6NSNdcBkXcDodIRePz+ZV1kNy8d1Lpc7wt91TNuoaYvpFZXywGzHFMBKnh/NWzoWZp0URhXLPugi
	/bdLhVZSJgsx8PfhiKPn5ZUOQcq3CqTQhaQjelzXYc0BH3QAhioXTjeFNhWi0lpWbCYAbIdMmvun9
	m5adsfboD51jeKEVrqheaE390mPB4Fu9RXdNH02/xWDWxijgJrzqgrmyeywjWyNPe3ix8CA5dBVNc
	Ih45ACuhBEpi9nkdu4aeNQGtKcc/ABP6LZQ4X98L7FOZaaM/dWfF+DiVcmN2mMsKf0XZGk/awZ6Mu
	fJGgMz/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7ehv-0000000FSch-3Eez;
	Fri, 18 Sep 2026 19:57:15 +0000
Received: from tunnel231050-pt.tunnel.tserv1.bud1.ipv6.he.net ([2001:470:1f1a:93::2] helo=trabant.uid0.hu)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7ehs-0000000FSbT-2eMB
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Sep 2026 19:57:14 +0000
Received: from wigyori by trabant.uid0.hu with local (Exim 4.94.2 #2 (Debian))
	id 1x7ehW-0000EC-54
	from <wigyori@trabant.uid0.hu>; Fri, 18 Sep 2026 21:56:50 +0200
From: Zoltan HERPAI <wigyori@uid0.hu>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Frank.Li@nxp.com,
	s.hauer@pengutronix.de,
	festevam@gmail.com,
	kernel@pengutronix.de
Cc: wigyori@uid0.hu,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] arm64: add support for Olimex i.MX8MP-SOM-EVB kit
Date: Fri, 18 Sep 2026 21:55:57 +0200
Message-Id: <20260918195559.130443-1-wigyori@uid0.hu>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260918_125712_667632_6A614879 
X-CRM114-Status: UNSURE (   9.78  )
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

This series adds support for the Olimex i.MX8MP-SOM-EVB kit, consisting of a carrier
board and a SoM.

Patch 1/2 documents the respective bindings,
Patch 2/2 adds the SoM dtsi and the carrier board dts.

Zoltan HERPAI (2):
  dt-bindings: arm64: fsl: add Olimex i.MX8MP boards
  arm64: dts: imx8mp: add Olimex i.MX8MP-SOM-EVB kit

 .../devicetree/bindings/arm/fsl.yaml          |   7 +
 arch/arm64/boot/dts/freescale/Makefile        |   1 +
 .../dts/freescale/imx8mp-olimex-som-evb.dts   | 168 +++++
 .../boot/dts/freescale/imx8mp-olimex-som.dtsi | 578 ++++++++++++++++++
 4 files changed, 754 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-olimex-som-evb.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-olimex-som.dtsi

-- 
2.30.2


