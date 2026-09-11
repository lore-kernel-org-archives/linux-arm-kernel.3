Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FF02C88E56
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Sep 2026 08:29:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R9roBo12wLbC06/Q2g/CCyXLKsAtX4tScHJO+dSKxsk=; b=e3okASiuEEno//OifahqE9UqPS
	sr8vDasxzCfonIR+esKdFsdwH7NktYirU74RVoOE6OTBSV1LAgRQzyHL1VzQw3zbnrFRcC6yPtj5U
	jbR1qKMR5dOPfKlQ7/FHuYwnK3INJko7elhQXQmBxRGkqPW3zxVtj4GPfh9vGzwf37hgNickdsEBj
	m9n10Son4sSvvy3KTvFhEZ81faBbwundb5TUpd4CETCSgtcic1BQZQ7CHT+J9E3aaGKDizo0eumor
	k8plH5Yd2eZTM3VuuMSeehKIkSh1WeckA6SOaVVLTmAR2PROJtoZUVun7Wbh9i+vnHlVNQq9CRYGx
	PReOg1xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4wcy-0000000G7lv-3DlF;
	Fri, 11 Sep 2026 08:28:56 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4wcv-0000000G7h8-2pfr;
	Fri, 11 Sep 2026 08:28:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 7894A447D3;
	Fri, 11 Sep 2026 08:28:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5ABBAC2BCFB;
	Fri, 11 Sep 2026 08:28:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1789115332;
	bh=CVrPnrs8qwQFVuAK2JblKtBbOLQAR+miyXJpO2WE03c=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=fEYJWFyGEEtcoC/BK/muvqXm9IqSbdNvHkHSbwHXLnIAdGwwvKSFxQ5KSlHalM77i
	 n/uiNVBNiFTQ46tz0g1MhkwdsiA9URYYfWn5AM6QwuMCBpdk/xKKJI85uS8nyWMIPc
	 j3OjN1eO1v8wGN52ecJ6/x6R8Y84LeGMJho0UNOSNpoUDXRYn2TgAskQkMvjwDw6s9
	 RK9LF8qFAEzvwWIpJBXeirxt3SX+3V0NudRXIu/Qrkj1fxXSHeUZS4TykkuLnA2hNd
	 l0d0lGid8TzWmrxltT9oyF/WdvoVDWvX9liNfqpzlopRMKQgeSMKrtg8lPR8rSTLbp
	 At3f25PirF+fQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49D1DC88E53;
	Fri, 11 Sep 2026 08:28:52 +0000 (UTC)
From: Chuan Liu via B4 Relay <devnull+chuan.liu.amlogic.com@kernel.org>
Date: Fri, 11 Sep 2026 16:28:37 +0800
Subject: [PATCH 10/10] arm64: dts: amlogic: a9: Add clk-measure controller
 node
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260911-more-socs-to-support-clk_measure-v1-10-940e269aa52f@amlogic.com>
References: <20260911-more-socs-to-support-clk_measure-v1-0-940e269aa52f@amlogic.com>
In-Reply-To: <20260911-more-socs-to-support-clk_measure-v1-0-940e269aa52f@amlogic.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Chuan Liu <chuan.liu@amlogic.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789115329; l=796;
 i=chuan.liu@amlogic.com; s=20240902; h=from:subject:message-id;
 bh=4DgrEoOMoCExjYXex82UD7PxEvK6o2H5kIyRyw8MyZw=;
 b=QAIblCVinkXyTUiFlM1L93hjc1ME8nF9bCDbxdu2+xRWd81XUrv+cNkPMFLuMHCoGKOruwAxh
 DdY4BtQWr2MCHv04gvadU0BnSbG0rKJv+EfA0DQty+ZTlyNrvvKQKAZ
X-Developer-Key: i=chuan.liu@amlogic.com; a=ed25519;
 pk=fnKDB+81SoWGKW2GJNFkKy/ULvsDmJZRGBE7pR5Xcpo=
X-Endpoint-Received: by B4 Relay for chuan.liu@amlogic.com/20240902 with
 auth_id=203
X-Original-From: Chuan Liu <chuan.liu@amlogic.com>
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
Reply-To: chuan.liu@amlogic.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Chuan Liu <chuan.liu@amlogic.com>

Add the clk-measure controller node for A9 SoC family.

Signed-off-by: Chuan Liu <chuan.liu@amlogic.com>
---
 arch/arm64/boot/dts/amlogic/amlogic-a9.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/amlogic-a9.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-a9.dtsi
index b0e0fadeed82..91f4cf319b0d 100644
--- a/arch/arm64/boot/dts/amlogic/amlogic-a9.dtsi
+++ b/arch/arm64/boot/dts/amlogic/amlogic-a9.dtsi
@@ -185,6 +185,11 @@ gpio_intc: interrupt-controller@4080 {
 				amlogic,channel-interrupts =
 					<10 11 12 13 14 15 16 17 18 19 20 21>;
 			};
+
+			clk_msr: clock-measure@48000 {
+				compatible = "amlogic,a9-clk-measure";
+				reg = <0x0 0x48000 0x0 0x1c>;
+			};
 		};
 
 		gic: interrupt-controller@ff800000 {

-- 
2.42.0



