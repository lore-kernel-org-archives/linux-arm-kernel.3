Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DA88CA0EE3
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 Aug 2025 06:38:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WfL005ZGEeVJeuMXxivdmPw5x6qOduKCFVb+FGC4loM=; b=Ag/S3KkLEg2N381RkXQrvls1cj
	dq+HVaKF8R6twFVnsWqjlclDGMfIe89Ga6MarhFeyua0tdxHR+YhKVwHjQJ70a7rgLolPPUHnKK50
	xURf8x2Sm3i/2o50zp52UI7F0KV3M6F3h9v+In/hrMPPJ1XDZ9njA01UJ/s3T69F+NR9GRqy5F4VJ
	34F0dQtGMO02cPHGqUYsUJQzR2x9/C79pRipO6qAz+OUNs0Kkh0BbZGETaCXFQ1GbY6l0//r9SQi9
	Y5X9GgKhVGw/xXlwdRdgP3+MSXUMN7y5L9V2eSq9xaUgjV4Flc/j0Dxx1p7gwHEkD8Vf9nvmBWL3Y
	QtLapreA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umRbP-0000000Fwsj-0kee;
	Thu, 14 Aug 2025 06:38:19 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umRWI-0000000FwFZ-09W2;
	Thu, 14 Aug 2025 06:33:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 0464843D5E;
	Thu, 14 Aug 2025 06:33:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8F6D7C4CEF5;
	Thu, 14 Aug 2025 06:33:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755153180;
	bh=OUSduZHpQytaAfXKSV2SoQ+CWi6AI0udx0LxSMgifvY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=qjiK4xVfT+BD6LcYE4yVxmg6/loKD3035deHerx5W5E/pjhi1g/hXkB84h+C03wU2
	 qeHBtgE4ZBcL+Kgxl1Eb2adCe+wx1RmJFEvcLDedDQ0oc6H2S685MwqKjUyWTC8nfP
	 GEqhneZCjp8113tsY5mrRJWozxWhBWu9+TYaMTelBz22uCSXcoSzoS+PFXlczI7ZqI
	 qZCdoVxxek2731vomCbughwGPsOPjgwlWAjoYHQ3Rb4tZwiBtxn+uDmIdZK+/R6hwe
	 46lvTZ8EPUdlTOa1R8K6z48O7jrzIoFeWA5weFzhJUWqdKb+Lkan2Zb29z2kdWWTnd
	 qs1ci7l634vZg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7ED02CA0EDC;
	Thu, 14 Aug 2025 06:33:00 +0000 (UTC)
From: Chuan Liu via B4 Relay <devnull+chuan.liu.amlogic.com@kernel.org>
Date: Thu, 14 Aug 2025 14:32:44 +0800
Subject: [PATCH v2 1/2] dt-bindings: clock: add video clock indices for
 Amlogic S4 SoC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250814-add_video_clk-v2-1-bb2b5a5f2904@amlogic.com>
References: <20250814-add_video_clk-v2-0-bb2b5a5f2904@amlogic.com>
In-Reply-To: <20250814-add_video_clk-v2-0-bb2b5a5f2904@amlogic.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, Chuan Liu <chuan.liu@amlogic.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755153176; l=1113;
 i=chuan.liu@amlogic.com; s=20240902; h=from:subject:message-id;
 bh=bgu6e/fPXdfrF8SBobYJP00S8M4VvuEqG6nMELJh9dQ=;
 b=dLOnByYR4ot9TJREpWOoEnTKvj/IOsLcAtxaBMxhrBz8/5bDjbyeYgRStS76ese8bvWi2onpv
 YDWOoJ4ipPQCOGmKZjZiol6b/nO4oG8z6xhEZ5rr1QjccNJRUsQjm6K
X-Developer-Key: i=chuan.liu@amlogic.com; a=ed25519;
 pk=fnKDB+81SoWGKW2GJNFkKy/ULvsDmJZRGBE7pR5Xcpo=
X-Endpoint-Received: by B4 Relay for chuan.liu@amlogic.com/20240902 with
 auth_id=203
X-Original-From: Chuan Liu <chuan.liu@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250813_233302_100672_024867C1 
X-CRM114-Status: UNSURE (   8.26  )
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
Reply-To: chuan.liu@amlogic.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Chuan Liu <chuan.liu@amlogic.com>

Add indices for video encoder, demodulator and CVBS clocks.

Signed-off-by: Chuan Liu <chuan.liu@amlogic.com>
---
 include/dt-bindings/clock/amlogic,s4-peripherals-clkc.h | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/include/dt-bindings/clock/amlogic,s4-peripherals-clkc.h b/include/dt-bindings/clock/amlogic,s4-peripherals-clkc.h
index 861a331963ac..b0fc549f53e3 100644
--- a/include/dt-bindings/clock/amlogic,s4-peripherals-clkc.h
+++ b/include/dt-bindings/clock/amlogic,s4-peripherals-clkc.h
@@ -232,5 +232,16 @@
 #define CLKID_HDCP22_SKPCLK_SEL		222
 #define CLKID_HDCP22_SKPCLK_DIV		223
 #define CLKID_HDCP22_SKPCLK		224
+#define CLKID_CTS_ENCL_SEL		225
+#define CLKID_CTS_ENCL			226
+#define CLKID_CDAC_SEL			227
+#define CLKID_CDAC_DIV			228
+#define CLKID_CDAC			229
+#define CLKID_DEMOD_CORE_SEL		230
+#define CLKID_DEMOD_CORE_DIV		231
+#define CLKID_DEMOD_CORE		232
+#define CLKID_ADC_EXTCLK_IN_SEL		233
+#define CLKID_ADC_EXTCLK_IN_DIV		234
+#define CLKID_ADC_EXTCLK_IN		235
 
 #endif /* _DT_BINDINGS_CLOCK_AMLOGIC_S4_PERIPHERALS_CLKC_H */

-- 
2.42.0



