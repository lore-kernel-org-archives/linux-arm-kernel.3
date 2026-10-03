Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 497B3CA5FE3
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  3 Oct 2026 06:48:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=wy4f4iVbwsDZ0d1DxY+IGmO1RKfJ0G0uzLHQspLmbt4=; b=CTvY82CGMuIucWb1TZPlB2QHyD
	n5micYFs/cVdCOiBpb9nH+jT9jQypxJ6Lsz0i8iN+wvShj++I8Ug1TnGgFwPTUOaq63I3M5fqxsip
	abrlKie9UrPNJ2EskyI+0EowoZ3zZE7LY/JKbgIt810fVp8T1LrGbI7BEieBm4eGhW4cHAP2SnR6e
	AvWa/0saJIukuDOQ+zWSu2f8Df21h0CEHJrE7wMC0GOc0zGhh/ucGrD2dMCs1UFXeUKSK2qdNQvZz
	zlETwQas9KvrYYftVZkYZQxXiT61BDelBnAinP5kDeaqNb5+aB0tVRPTFBpSvdZ1XdXXtdOIOwF+X
	kbilD4Sw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCtXv-0000000D62b-0ca2;
	Sat, 03 Oct 2026 06:48:35 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCtXt-0000000D62U-3NJH
	for linux-arm-kernel@lists.infradead.org;
	Sat, 03 Oct 2026 06:48:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id B5E5A60204;
	Sat,  3 Oct 2026 06:48:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5763FC2BCB9;
	Sat,  3 Oct 2026 06:48:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1791010112;
	bh=NdQJD1Tj0LELSIQOQS1qFVS9dPCSBkx/zL+wF4QNHmg=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=NKIUSyL2jS+lI3SetSkUDs7xJUiuylU7G5CZo3wmUMhln/pPJ0k0VLGQRDvAawtt8
	 XTFAb522VGpPuAmJOpqHG+yrs+qhyT0YoWGX1hQuQYzPO4PKni8uFPhptCQ/Y/r2XY
	 vmQ82c66yCct/5XUsyXjo5zD0wSqrLUBNw7gVhOc4+XYoFdKmdPXajc3KfGogIqA+h
	 JyvKU3Ew+RKb3chqd6GRKQzXo+BmdXzYcmXK/fCRf8hfRWeXjypCSIRWVlgnjF0d4h
	 On2xP91/5dJW2R3euYjn+nvc5lwIfv49b0a/dne3R7KRwfz5YILi018UCjnDlxuhYj
	 FbO4PB+9h9gXw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30A42CA5FE3;
	Sat,  3 Oct 2026 06:48:32 +0000 (UTC)
From: Amit Sunil Dhamne via B4 Relay <devnull+amitsd.google.com@kernel.org>
Date: Sat, 03 Oct 2026 06:48:30 +0000
Subject: [PATCH] arm64: dts: exynos: gs101-pixel-common: add USB-C PD timer
 and revision properties
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261003-gs101-typec-pd-timers-v1-1-4b6f3235133d@google.com>
X-B4-Tracking: v=1; b=H4sIAD2lwGoC/x3MQQ5AMBBA0avIrE3SjiBcRSxoB7NA0xEh4u4ay
 7f4/wHlKKzQZg9EPkVl3xJsnoFbhm1mFJ8MZKgyDZU4qzUWjzuww+DxkJWjYj2YorBE3pUjpDZ
 EnuT6v13/vh8/8mLRZwAAAA==
X-Change-ID: 20260925-gs101-typec-pd-timers-7a033122dc5b
To: Peter Griffin <peter.griffin@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Amit Sunil Dhamne <amitsd@google.com>, 
 Badhri Jagan Sridharan <badhri@google.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791010111; l=1515;
 i=amitsd@google.com; s=20241031; h=from:subject:message-id;
 bh=9xbB2ye8jl4WfnS5MlyteCNYJFr2A78JZIik10iTwCg=;
 b=hC9phi1LOSKX4eNRfH9g7m3NLpQtUFZflP+uQCU1uXXZYQSY8mqXKPNsFEnvcD4Aa/LZ/ruPX
 +NjF2Io45P4D+hTVkQwCOo58CLimjLoqxAPNChOX78PDL5VUNQeL9rW
X-Developer-Key: i=amitsd@google.com; a=ed25519;
 pk=wD+XZSST4dmnNZf62/lqJpLm7fiyT8iv462zmQ3H6bI=
X-Endpoint-Received: by B4 Relay for amitsd@google.com/20241031 with
 auth_id=262
X-Original-From: Amit Sunil Dhamne <amitsd@google.com>
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
Reply-To: amitsd@google.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Amit Sunil Dhamne <amitsd@google.com>

Specify the tSinkWaitCap, tPSSourceOff and tCCDebounce timer values
for the USB-C connector via the sink-wait-cap-time-ms,
ps-source-off-time-ms and cc-debounce-time-ms properties, so that TCPM
uses the values tuned for gs101 platform instead of the defaults.

Also add the pd-revision property to advertise support for USB Power
Delivery Specification Revision 3.1 Version 1.8.

Assisted-by: LLM
Signed-off-by: Amit Sunil Dhamne <amitsd@google.com>
Reviewed-by: Badhri Jagan Sridharan <badhri@google.com>
---
 arch/arm64/boot/dts/exynos/google/gs101-pixel-common.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/google/gs101-pixel-common.dtsi b/arch/arm64/boot/dts/exynos/google/gs101-pixel-common.dtsi
index a12f2b88d72d..8d2616832777 100644
--- a/arch/arm64/boot/dts/exynos/google/gs101-pixel-common.dtsi
+++ b/arch/arm64/boot/dts/exynos/google/gs101-pixel-common.dtsi
@@ -662,6 +662,10 @@ connector {
 			try-power-role = "sink";
 			op-sink-microwatt = <2600000>;
 			slow-charger-loop;
+			pd-revision = /bits/ 8 <0x03 0x01 0x01 0x08>;
+			cc-debounce-time-ms = <170>;
+			ps-source-off-time-ms = <870>;
+			sink-wait-cap-time-ms = <450>;
 			/*
 			 * max77759 operating in reverse boost mode (0xA) can
 			 * source up to 1.5A while extboost can only do ~1A.

---
base-commit: 93f51579e7df248780214094418f205253383cc5
change-id: 20260925-gs101-typec-pd-timers-7a033122dc5b

Best regards,
-- 
Amit Sunil Dhamne <amitsd@google.com>



