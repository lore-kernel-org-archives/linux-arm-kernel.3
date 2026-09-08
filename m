Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E3ECC79F9E
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Sep 2026 16:25:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=E2k4LtZDFqs/sIhObiNYjGIU1AJkLXR8MjkfvLWMkbU=; b=g7fq9SkNUD+5jaMIc8SIbiVKYb
	7chZ8FZPidyBD5G9ywzxTD6N5uCdD4sIu4j/BrstgpX8szBnhp6gA2Slnxc1Qh7WnqJQit9gcNVd8
	/FM8o4hsyTQhUNABAPh26JWXWlXeV3tQUo29/OTj4yCRTuV+KOZnMk0VxJvLpdiA/0esIx0frpTQ5
	2EYCvtoYYYkvy0JNKAd4MHlT7GayjO8Xzih+n0R87svN5ndhUoIkXGR7IPSD/9EEcVnFyQUrvaVaw
	Nm0bIkvwnsW59yqPhGTQYNjr1qgv5nqwf+jvHJIK5utGYxE9YvqCILgASU4QbhFd/SNZ5jvrPF6R4
	hZMm7nvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3ydW-00000009enw-055a;
	Tue, 08 Sep 2026 16:25:30 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3ydU-00000009emQ-2t7N
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Sep 2026 16:25:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 753DC41088;
	Tue,  8 Sep 2026 16:25:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4B268C2BCB8;
	Tue,  8 Sep 2026 16:25:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1788884726;
	bh=4+muMEoWw3cPoLSSzPR0U9e4YeLXdeRe95f6AWfkX3o=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=fNkxQgtiaSMERuOU2wVycHc2PThPn+QZNMUB+ZZ7ZnnK+QjsCnOLAxRJAAqeRyNAd
	 8MNOQPZy5xotOdjVxO9eVoPVldHe6tWiaq4MgWa6M4YCAGqoqmcKDo9tV7IwsaaQ0u
	 kBy1fElLHzAp6a4HekEGSxtVHD5Rfgc14ay2QjpU+JTMBdg7aUP2W5D3NnlR/jAE2v
	 BF3qyA+IoRR6EqiRvi2lnJArr+Iovf/RgwNJsT/ZanU28IrtH2PDHgV/sxdPXvLvbP
	 F5snLNnR6mHeBMXa6L6QhmAa0mE98B8lBFIG7ocyJtz+qUhZpYJdc4NbFRYUPL731f
	 a8LkYiESVOCKQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2437AC79F99;
	Tue,  8 Sep 2026 16:25:26 +0000 (UTC)
From: Vincent Jardin via B4 Relay <devnull+vjardin.free.fr@kernel.org>
Subject: [PATCH v3 0/3] arm64: dts: freescale: add Free Mobile Nodebox v3
 CPU Module (LX2160A)
Date: Tue, 08 Sep 2026 04:12:42 +0200
Message-Id: <20260908-for-upstream-nbxv3-dts-v3-0-1d88b2c11680@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABpvn2oC/43NsQ6CMBDG8VchnT1ztASqE+9hHFp6lQ4CuWKDI
 by7hcVRx/+X3O9WEYkDRXEtVsGUQgzjkEOdCtH1ZngQBJdbSJQ1XrABPzK8pjgzmScMdkkK3Bz
 BWuocVqi0kSIfT0w+LAd8u+fuQ5xHfh9/UrmvP8lUAoKvlHeIUttGt56Jzp7FDib5HyIzUtvKe
 KfqUqP9Itu2fQC73TaL/wAAAA==
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Vincent Jardin <vjardin@free.fr>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788833565; l=2061;
 i=vjardin@free.fr; s=20260525; h=from:subject:message-id;
 bh=4+muMEoWw3cPoLSSzPR0U9e4YeLXdeRe95f6AWfkX3o=;
 b=67315suM+GsZ6EL42fG/+PWICzlCEB+krrRAUp8QOUeulfHHHg1IGE4H7HryEnn/wABCORfSo
 KZzd4sulMJ2ApjC6eN7Dt+CQ1yew29vmrgy8H5wzKJIxIqUOkvCSywD
X-Developer-Key: i=vjardin@free.fr; a=ed25519;
 pk=hppgLeFpGpKOi7LNwGEZ4jOYofJCoGd4Jf1ltAabiLw=
X-Endpoint-Received: by B4 Relay for vjardin@free.fr/20260525 with
 auth_id=871
X-Original-From: Vincent Jardin <vjardin@free.fr>
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
Reply-To: vjardin@free.fr
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

The Nodebox v3 is a Free Mobile CPU module built around the NXP LX2160A
(16x Cortex-A72, DPAA2).

The same fsl-lx2160a-nbxv3.dtsi shall be used verbatim by the
U-Boot port, sent in parallel to the U-Boot list, so the two trees
cannot drift.

Dependency:

the DTS uses gpio hogs on the QorIQ GPIO controllers, which
needs the commit
  78c0baf85cd0 ("dt-bindings: gpio: fsl,qoriq-gpio: allow gpio-hog child nodes")
already in gpio/for-next and that will likely arrive in v7.4-rc1.
Until it lands, dtbs_check reports the five hog nodes, the rest of the
tree validates clean against the current schemas.

Signed-off-by: Vincent Jardin <vjardin@free.fr>
---
Changes in v3:
- Drop the thermtrip hog on gpio1 line 23, should have been clean'd
  before
- Link to v2: https://lore.kernel.org/r/20260907-for-upstream-nbxv3-dts-v2-0-6b4afd36180b@free.fr

Changes in v2: (from Sashiko's comments)
- Makefile: dtb entry in alphabetical order (before qds).
- Move the XSPI1_A_DATA[7:4] GPIO mux group from &fspi to &gpio1, so
  the reset hogs on gpio1 do not depend on the fspi probe.
- gpio hogs: describe ethsw-reset# and ethsw-mdio-en with their
  active-low polarity (GPIO_ACTIVE_LOW), same electrical levels.
- Link to v1: https://lore.kernel.org/r/20260907-for-upstream-nbxv3-dts-v1-0-f43fd0028b78@free.fr

---
Vincent Jardin (3):
      dt-bindings: vendor-prefixes: add Free Mobile
      dt-bindings: arm: fsl: add freemobile,nbxv3 board
      arm64: dts: freescale: add Nodebox v3 CPU Module

 Documentation/devicetree/bindings/arm/fsl.yaml     |   6 +
 .../devicetree/bindings/vendor-prefixes.yaml       |   2 +
 arch/arm64/boot/dts/freescale/Makefile             |   2 +
 .../arm64/boot/dts/freescale/fsl-lx2160a-nbxv3.dts |  34 +++
 .../boot/dts/freescale/fsl-lx2160a-nbxv3.dtsi      | 335 +++++++++++++++++++++
 5 files changed, 379 insertions(+)
---
base-commit: df2908090cda368b01ff43709f51890076c56157
change-id: 20260907-for-upstream-nbxv3-dts-bbecd04038a2

Best regards,
-- 
Vincent Jardin <vjardin@free.fr>



