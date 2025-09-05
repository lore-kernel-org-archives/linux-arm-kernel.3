Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CDBFCA1013
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Sep 2025 14:32:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WfL005ZGEeVJeuMXxivdmPw5x6qOduKCFVb+FGC4loM=; b=tUmmR+EtTu+/D8V/xj6wyVqf5r
	wk8Z+SsqsAWVwN/Doph6dXldg6+eHKV9WINk/IB7ar6J41VajcIajI0sGXSVW0iwz3dmoW8skTmcL
	ewXtXztH0yub6N8+VBO9hIJJMG5ssYTBRwA8d20K6KDzKnH2JGCJblXF3NT+WTS+8sU4IkOpRMqna
	FuPQdAFLAyz6V3l/2/rPfz/buLoMka052nB/WqK8mEyOX/k+2nO/Se3nSVBzUUZ0ZOedWmMxRwrpT
	48wi91G6fxZHzUVWLmJyVf4sQT6NfrX+FtSAHPgPAogdE3v75zdcduD+qpb1LQlU5hTyIn5eRjetX
	eF/56VKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuXUT-00000002JJp-3sLz;
	Fri, 05 Sep 2025 14:32:37 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuSP8-00000000bR1-3Yml;
	Fri, 05 Sep 2025 09:06:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 4B2FD60281;
	Fri,  5 Sep 2025 09:06:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id EC7BBC4CEF9;
	Fri,  5 Sep 2025 09:06:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757063206;
	bh=OUSduZHpQytaAfXKSV2SoQ+CWi6AI0udx0LxSMgifvY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=XZ9VMjq/lujMZqIuoOmIgvJW0tFX8x3xvhSRioiEUc1OjKhKaD0OcuPI4Nvh6yrO5
	 DYLDPumP+deJpzAXozQZ8eQNwlpLkQ0ggzEJGGgLply3RaPXAPF0sV1I0Z9bEkHvVZ
	 TbP7Msr6OJGu9AksOO3UBytgOdtLf02rrpxK+xhPENA92cPCmcOA0SUIW9lQv7Q1Fo
	 aAv7zbPN1upn9+1qg1cG23BeeqeIv+ovkwVjRyMK0+e5NmNM4iWJeimcXLv1zCQcu8
	 3tPMvHvHrYf184b7dW5zCJ73/73KHiaaT2WK2AMEQfdzQyu0Dtjo+3/VD7CkpQD4D8
	 ye5JqetFtNofA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CCAB6CA1015;
	Fri,  5 Sep 2025 09:06:45 +0000 (UTC)
From: Chuan Liu via B4 Relay <devnull+chuan.liu.amlogic.com@kernel.org>
Date: Fri, 05 Sep 2025 17:06:38 +0800
Subject: [PATCH v3 1/2] dt-bindings: clock: add video clock indices for
 Amlogic S4 SoC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250905-add_video_clk-v3-1-8304c91b8b94@amlogic.com>
References: <20250905-add_video_clk-v3-0-8304c91b8b94@amlogic.com>
In-Reply-To: <20250905-add_video_clk-v3-0-8304c91b8b94@amlogic.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757063204; l=1113;
 i=chuan.liu@amlogic.com; s=20240902; h=from:subject:message-id;
 bh=bgu6e/fPXdfrF8SBobYJP00S8M4VvuEqG6nMELJh9dQ=;
 b=kfwLaqWah0xsMRA97VXkD7xs9E8CRixyqUPl75F/w7L6f8CP0IXJIjp2pU9RVECX+Z+gHaSha
 rqClD3gmLU6Ad5rhG88yPygZWmAZ39Vwafp3PiYP6lu5NLW+6BSS9lr
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



