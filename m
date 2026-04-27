Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2155BFF8861
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Apr 2026 07:51:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=1cWgft1I39cLDH31chvSxxOViLemMVW/EZNhUrPDAbQ=; b=UtXmdiWArtM7Ze
	nbBWgLhuoIXENJfSHA7Wdv+3dW+PfxvJ8DX0FfEWIy30ORx/4soTQOwErvuC9wn6Y+IJ5uw7TcHA/
	FbQH+xn5eNo5QEv4kDDzlgIdT0BOwBH0kQVPBJg38MYwMgZ9RTt+ZPlA8z5vz+MhOq+u6qTRo0hHk
	+furEoy4CfPYZuawwPbZuP8agkwL7lP5Ih/Fm2CtqAuJFqVXQlb7R2OesB9jiZGeaAJojvSovDHF3
	EIfdJmvl5EhqiP6GO3UODrvP9NFE8x8zwsWFOWa1yBcpsu4tjdg+oNqnl+OUwLfChpQk+8gXj2WhA
	LwUipIz2e2Em+UfDoYSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHGk8-0000000GPbA-1A59;
	Mon, 27 Apr 2026 07:51:00 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHGk6-0000000GPaS-0U2t
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 27 Apr 2026 07:50:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:From:Sender:Reply-To:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=1cWgft1I39cLDH31chvSxxOViLemMVW/EZNhUrPDAbQ=; b=ZHO2nKOk8rUHosXSreUy29XTuF
	rScTxOQgLvItdPed8h+x5rjLPyuP56KFrRfaD1n7GgwVWuZdbIJUkzX/gbyxCA1hSOsUbLBzJr38z
	v2uYnasJQJq7NDV/HKFCMFomTEKJIPFYPp0qu5ZCf8LTS9JsewB3l16z6fvI7kDZskV//ghBgC6GO
	XhxP1RttkTMSVBNZpLXY/GyoTlULaKDDI0sTFKVkdZ7mQ06bC/dVqgF0G01Vcp1xeuqP0ARzhw7KN
	/paGTEZfkH7YI59PE9r5wHE4yeOtEmTN5Q94QwenueGrBzf12mZEMswN27XXUKZrI24GPRwRissmt
	DsVN2BOg==;
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHGjz-000000000ZM-2J0v
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Apr 2026 07:50:55 +0000
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=ratatoskr.trumtrar.info)
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <s.trumtrar@pengutronix.de>)
	id 1wHGja-00032N-QO; Mon, 27 Apr 2026 09:50:26 +0200
From: Steffen Trumtrar <s.trumtrar@pengutronix.de>
Subject: [PATCH v2 0/2] arm64: dts: imx8mp-skov: add new 7" variant
Date: Mon, 27 Apr 2026 09:50:12 +0200
Message-Id: <20260427-v7-0-topic-imx8mp-skov-dts-jutouch-7inch-v2-0-e2b79fc24391@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADQV72kC/5WOQQ6CMBBFr0Jm7ZjSioorjRuXLtwZFtJWGQwta
 UuDMdzdiidwM8n/eflv3uC1I+1hl73B6UierEmBLzKQzc08NJJKGTjjayZ4gXGDDIPtSSJ147b
 r0T9tRBU8tkOwg2xwQyZdoWpZrwp2E6WENNc7fadxVl3hfLgcT1D9aj/UrZbhq/mCDflg3Wt+K
 eYz/r895gnMGS8KxcV6Jcp9r81jCM4aGpdKQzVN0weE5Z4Y/gAAAA==
X-Change-ID: 20260325-v7-0-topic-imx8mp-skov-dts-jutouch-7inch-3dbcb450a39c
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: Steffen Trumtrar <s.trumtrar@pengutronix.de>, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.15.2
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: s.trumtrar@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260427_085052_704071_88FD1838 
X-CRM114-Status: UNSURE (   8.06  )
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

Add a new board variant for the Skov i.MX8MP based family of boards.

This variant uses a different 7" panel than the existing ones.

Signed-off-by: Steffen Trumtrar <s.trumtrar@pengutronix.de>
---
Changes in v2:
- rebase to v7.1-rc1
- Link to v1: https://patch.msgid.link/20260325-v7-0-topic-imx8mp-skov-dts-jutouch-7inch-v1-0-10255d236439@pengutronix.de

To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Shawn Guo <shawnguo@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
To: Sascha Hauer <s.hauer@pengutronix.de>
To: Pengutronix Kernel Team <kernel@pengutronix.de>
To: Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: imx@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org

---
Steffen Trumtrar (2):
      dt-bindings: arm: fsl: add compatible for new Skov I.MX8MP variant
      arm64: dts: imx8mp-skov: support new 7inch panel board

 Documentation/devicetree/bindings/arm/fsl.yaml     |  1 +
 arch/arm64/boot/dts/freescale/Makefile             |  1 +
 .../imx8mp-skov-revc-jutouch-jt070tm041.dts        | 79 ++++++++++++++++++++++
 3 files changed, 81 insertions(+)
---
base-commit: 254f49634ee16a731174d2ae34bc50bd5f45e731
change-id: 20260325-v7-0-topic-imx8mp-skov-dts-jutouch-7inch-3dbcb450a39c

Best regards,
--  
Steffen Trumtrar <s.trumtrar@pengutronix.de>


