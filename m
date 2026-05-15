Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 911A8CD4851
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 May 2026 21:40:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=fBZjnyhDDY5Nyr8fG9ufRmHLYWuuvF//b8nHmTEdgbg=; b=wPJRRoiAOsUfndbSQ++FvgQnC3
	KQj8PfQP7DEceSe950i/rRhqXye8L8fiPgIC5ZQnPXXAzN9ZVmJYqViJrND2PyWaXPTGBo9QL/b6O
	R6rwwnHJ5ZeqKjv2awWPmCau6Zc79xHPe6kDPkd4uMFcU6LOw9hYLRhE0SS/M/Q+pg4LygcRZkkhW
	oXjQkNgn8d9YzQsER1m7dvbI+/tOexWrEqlUDMLU8ORQgQaUVIrmth1hYgywg6/iFdYJ4mQTCXtV8
	Qww1KhyWn2Xz9HgVJHakFLgOzLmblFHM1ayocowYRtBq0CEyCugcb6x+dPpyh8rsaw6G8D4RZYdYK
	GkMpch4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wO0Gz-00000009Xmj-2P3n;
	Fri, 15 May 2026 21:40:45 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wO0Gr-00000009Xig-0HWz
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 May 2026 21:40:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1BAD140983;
	Fri, 15 May 2026 21:40:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id EBB7EC2BCB0;
	Fri, 15 May 2026 21:40:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778881236;
	bh=ZgnGA9okakYMuZu+by2Y7wPlPP6A0aJoPJm5SI2Osc8=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=fzrZbp31Q1RgLM2hd9K9On1Gj5bXG7Z2aLejiToSnNlye2hdingqRQNcYWzrjeLpt
	 MlbH8sEeCHmbqJ3Tvp+Zm570CaGVFXd4ZbHoAOlK66tHvCOBeY7zGzN02R0LTU3xXA
	 qBrB+bJr7MZifBeCiD86jbVEvFOJksE94RnKrHrjkVdDelsw4XjRUVptoDcqGJsbZO
	 WOKjXyUEnCkEvVIXwZv3Sc4aoxahjkacQhlnF0e4clow/7qGdEieUUgrQetQ7u9lX0
	 17yxaWbyFRUUYUnx3haZb4+UVYNIDwqqpIwn2vdf0AKkaMLSH99GO2zrIss6/S1zcm
	 CzJddF840NAHQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E13EDCD4F3C;
	Fri, 15 May 2026 21:40:35 +0000 (UTC)
From: Frank Li via B4 Relay <devnull+Frank.Li.nxp.com@kernel.org>
Subject: [PATCH 0/6] ARM: dts: cleanup some CHECK_DTBS warning for imx5/6
 (round 2)
Date: Fri, 15 May 2026 17:40:31 -0400
Message-Id: <20260515-imx25_dts_simple_warning_2-v1-0-b06bff192a05@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAM+SB2oC/x3M0QqDIBQA0F+J+5ygDjfbr0SI5Z27UC68sQLp3
 5Mez8spwJgJGd5NgYx/YvqlCtU2MH19iigoVIOW+imNUoKWQxsXNnZMyzqj231OlKLTQsnwmF5
 mtNZ2UIM144eOO++H87wAHsckwGwAAAA=
X-Change-ID: 20260511-imx25_dts_simple_warning_2-10d3c75b8889
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778881235; l=2816;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=ZgnGA9okakYMuZu+by2Y7wPlPP6A0aJoPJm5SI2Osc8=;
 b=PI91V3n2RjPoohGVCRMOLez5qVgFkw8tTuop8AYUwuwJSz2RX165/XwpLMjxUFDbpPjZULm1Z
 orRGajT2PvHBRw7b2gAyylYqxEdnnZMg7GuuNYN4hU7GvxdLm4RjNq8
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-Endpoint-Received: by B4 Relay for Frank.Li@nxp.com/20240130 with
 auth_id=121
X-Original-From: Frank Li <Frank.Li@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260515_144037_154154_151C7642 
X-CRM114-Status: UNSURE (   9.68  )
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
Reply-To: Frank.Li@nxp.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Cleanup CHECK_DTBS warning for imx_v6_v7_defconfig. (below 500 line warning
left) after apply pending binding doc patch.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
Frank Li (6):
      ARM: dts: imx: add (power|vdd)-supply for related node
      ARM: dts: imx: remove redundant bus-width for video-mux
      ARM: dts: imx: Add bus-type for ov5642/ov5640
      ARM: dts: imx6qdl-tx6: remove undocumented karo,imx6qdl-tx6-sgtl5000 and keep only simple-audio-card
      ARM: dts: imx: replace undocumented compatible string edt,edt-ft5x06 with edt,edt-ft5206
      ARM: dts: imx6-display5: replace marvell,88E1510 with ethernet-phy-ieee802.3-c22

 arch/arm/boot/dts/nxp/imx/imx53-m53menlo.dts            | 11 ++++++++++-
 arch/arm/boot/dts/nxp/imx/imx53-sk-imx53-atm0700d4.dtsi |  1 +
 arch/arm/boot/dts/nxp/imx/imx53-sk-imx53.dts            |  7 +++++++
 arch/arm/boot/dts/nxp/imx/imx53-smd.dts                 |  2 ++
 arch/arm/boot/dts/nxp/imx/imx53-tx53-x03x.dts           |  2 +-
 arch/arm/boot/dts/nxp/imx/imx6dl-gw52xx.dts             |  2 --
 arch/arm/boot/dts/nxp/imx/imx6dl-gw53xx.dts             |  2 --
 arch/arm/boot/dts/nxp/imx/imx6dl-gw54xx.dts             |  2 --
 arch/arm/boot/dts/nxp/imx/imx6q-display5.dtsi           |  2 +-
 arch/arm/boot/dts/nxp/imx/imx6q-gw52xx.dts              |  2 --
 arch/arm/boot/dts/nxp/imx/imx6q-gw53xx.dts              |  2 --
 arch/arm/boot/dts/nxp/imx/imx6q-gw54xx.dts              |  4 ----
 arch/arm/boot/dts/nxp/imx/imx6q-novena.dts              |  1 +
 arch/arm/boot/dts/nxp/imx/imx6q-var-dt6customboard.dts  |  2 +-
 arch/arm/boot/dts/nxp/imx/imx6qdl-gw51xx.dtsi           |  2 --
 arch/arm/boot/dts/nxp/imx/imx6qdl-gw551x.dtsi           |  2 --
 arch/arm/boot/dts/nxp/imx/imx6qdl-gw553x.dtsi           |  2 --
 arch/arm/boot/dts/nxp/imx/imx6qdl-nit6xlite.dtsi        |  2 +-
 arch/arm/boot/dts/nxp/imx/imx6qdl-nitrogen6_max.dtsi    |  2 +-
 arch/arm/boot/dts/nxp/imx/imx6qdl-nitrogen6x.dtsi       |  2 +-
 arch/arm/boot/dts/nxp/imx/imx6qdl-pico.dtsi             |  2 +-
 arch/arm/boot/dts/nxp/imx/imx6qdl-sabreauto.dtsi        |  2 --
 arch/arm/boot/dts/nxp/imx/imx6qdl-tx6.dtsi              |  5 ++---
 arch/arm/boot/dts/nxp/imx/imx6ul-14x14-evk.dtsi         |  1 +
 arch/arm/boot/dts/nxp/imx/imx6ul-pico-hobbit.dts        |  2 +-
 arch/arm/boot/dts/nxp/imx/imx6ul-pico-pi.dts            |  2 +-
 arch/arm/boot/dts/nxp/imx/imx6ul-tx6ul.dtsi             |  2 +-
 arch/arm/boot/dts/nxp/imx/imx7d-pico-dwarf.dts          |  2 +-
 arch/arm/boot/dts/nxp/imx/imx7d-pico-pi.dts             |  2 +-
 29 files changed, 36 insertions(+), 38 deletions(-)
---
base-commit: d26bfe9856a36453f591b9620dac996ff9f02443
change-id: 20260511-imx25_dts_simple_warning_2-10d3c75b8889

Best regards,
--
Frank Li <Frank.Li@nxp.com>



