Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B9F8CA5FC4
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Oct 2026 07:14:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=fFdBoFaX4j9Up9APcXN+v0Y044TuolANszoR1h2qSeY=; b=Ysx77m9KZCNYInuOhQBayklsZ1
	D9u7bVZwdOeTfmCXLDrfvVHFZ8783tY7fLPUnCvcGD2gN6MjkSfjSdnk0OOwaJNKaIGs+p2V4TbZg
	qcfxrkSDDwASto2MYFuhP7QTMWeCpLkVg8Ia/eRYiFqoGKG0T37KQpmkkuzEaGrCQPNvyG3bI7rJt
	EzJYzLE1BC8zSq2Ogcsh1HJQPCYCUutbak3gPlIGohI74xU5CoL/cX5kwxXcDb2mmrLsARz/O784k
	/bcXEWW7eLGt8EtV60Mt9YYn9s0p66ojoPC14nksfxqDT92zNbNTXrlMFOtL9380BhEKGYE2M9aU/
	0YAWtmsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCXTm-0000000AnM9-1CjH;
	Fri, 02 Oct 2026 07:14:50 +0000
Received: from cp2.siel.si ([46.19.12.180])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCXTj-0000000AnKt-0X31
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 Oct 2026 07:14:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=norik.com;
	s=default; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:
	Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=fFdBoFaX4j9Up9APcXN+v0Y044TuolANszoR1h2qSeY=; b=fid7qIYaKfM0+OIjsbb1IrIgEO
	IH4e8U5l99KfbxzrCtp3at3c74eeix4FriNYsyzft5S/pF3MxlcG46Whs/q6gkSQabU8baIbQLdrP
	9zuQMPWmfFubF30zN2CPghI3TZRzuf9DmO8tMOCfYNUK84zD4mnCnD+ChaNQkHujXknPp38AQMnI/
	NL7XvNZ5K+iriLY4rryRxX/C7HwD9DNbQ8LSDNuJwbhbrumBocKIFU/aw51G/AGdQFMoa9j3Ptoto
	F7XRhrD7CRQJatTygbnoW9l5kfWVQ9NwHHzmbj1hpBYOo0TYYHBHEdLw2tJbUwMB9oGfqcIGpYvwS
	xm/y8xoA==;
Received: from 89-212-21-243.static.t-2.net ([89.212.21.243]:50874 helo=localhost.localdomain)
	by cp2.siel.si with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <primoz.fiser@norik.com>)
	id 1xCXTf-00000002ntQ-3mWV;
	Fri, 02 Oct 2026 09:14:43 +0200
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
Subject: [PATCH v3 0/2] ARM: dts: imx6: phytec-mira: phyBOARD-Mira fixes
Date: Fri,  2 Oct 2026 09:14:39 +0200
Message-Id: <20261002071441.2499132-1-primoz.fiser@norik.com>
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
X-CRM114-CacheID: sfid-20261002_001447_656120_754E6349 
X-CRM114-Status: UNSURE (   5.42  )
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

Two small fixes for the PHYTEC phyBOARD-Mira-i.MX6 boards:

- Since commit 888e5fad9b78 ("Input: stmpe - add axis inversion and
  swapping capability") landed, the touchscreen axis inversion these
  boards need can be described in devicetree instead of userspace (2/2).
- Fix uart3 CTS/RTS pinmuxing since pins were swapped.


Link to v2: https://lore.kernel.org/all/20261001081005.2209755-1-primoz.fiser@norik.com/

Changes in v2:
- Drop patch #1 from v1 
- Add new patch #2 (CTS/RTS swap fix)

Changes in v3:
- Add Fixes tag to patch #2

Primoz Fiser (2):
  ARM: dts: imx6qdl-phytec-mira: Add touchscreen-inverted properties
  ARM: dts: imx6qdl-phytec-mira: Fix uart3 CTS/RTS pinmuxing

 arch/arm/boot/dts/nxp/imx/imx6qdl-phytec-mira.dtsi | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

-- 
2.34.1


