Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4850CCF45DB
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Jan 2026 23:21:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5O9sNWLt3aO3GEjgrzrL9pra0MPEjTnDPizpWeKKcWI=; b=v4DxWDr463B5P+DU98odc/E9lu
	6/UVF8o7rCHxKe+Y4yEm+N0ge8CFc9ta7NxNuOybStacI+Nfb9wue3h01/ecvXJS4H1+UIeuoV7pQ
	qalLPuRQr/ILPy0D2Q3Bb2MApZ8YQO96ofznHW92xR7FpSZUuIboEsZ+ddIxe1ixGALMErK2QAyTf
	eyimnEyCPm8wLcPoyfHNZwe1C+Kch0GR1p9GtBxFJ/48ngo2qtURSbueoYPwLUYyRZ6q+VGPf0nyJ
	6nE0ErjJ/zxj2EL53RvbyHPSwrzEud6hK1iLaVzygbao+TvO6Khothx6t87jh3OJn1ijPoWtlxt3D
	KCOD+DXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfRDm-00000006Hyq-0HzT;
	Mon, 12 Jan 2026 23:21:14 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfRDh-00000006Htk-1jHB;
	Mon, 12 Jan 2026 23:21:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=5O9sNWLt3aO3GEjgrzrL9pra0MPEjTnDPizpWeKKcWI=; b=LmzNpQsD6gej0YjhM/Nrd68HKk
	zxegTl4xA6jqR5AExc5fOER3+xx8mgyXHjiQAT7Vc3gLDFiNzTGGrpie6NkF3N6It8b0f7RFpQzYy
	ZX8M2s/31NTc2YWFZtIHTJ+TBYS4ehgidSiZgUNYsgJ+CdilyYu0wQkieXIOTv+PuhDDl3wu/ZbCG
	Xfu/uUqXA+HGg97s+JCg4LIO5s7h2Gp1W2qPx7jTsnNHBEQvGvrK/FMr673CFtvl7fx6xiqSRxqB9
	kS0ay2wjgTt3HBDgRzV2pWChDCz25hoZY/6i6Dky6xOdydUP8wl9RZE9qfyNIrlET3j2o16wfIlpP
	+CJ7aQuA==;
Received: from bali.collaboradmins.com ([148.251.105.195])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfRDa-00000001oNg-3ACe;
	Mon, 12 Jan 2026 23:21:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1768260059;
	bh=wHkD5FO/L/HfMdEh4JFQRiN0RGpng4NvyF+M1FhrHDs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=pl2KYVucIgJd2PLSFVp/xlBlYWuSKStaFwPEzmp7GqOMxT4hRQ5qBJwTE2JewkfgR
	 TvFF4q96ydKdGwnPw4R548O/gmuMXEOxKr4OePMSQcqcNkXa/GCaxa8SFx3kW2eF3M
	 ZCG31f2DCFKps9FTUZHSeDMr/L0HpkdXtZPBDSiMcTjl/viW5Pv5KINjh3t6pbvl8b
	 LMaLlvj9u6nlArpa+KsdLb+UKSuNi5p0B+wIo8g4WNB5q0mC7y4p0xdt6EgwNOd2Js
	 pl8hF2cYlulR8m+xAvL+cLHpxdt3KdLWpnPZF4BL0pbCxqaODzUUugY64VAngfLO0B
	 tAkVdNt8z0bZg==
Received: from localhost (unknown [82.79.138.145])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 2BCE517E0FF0;
	Tue, 13 Jan 2026 00:20:59 +0100 (CET)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Tue, 13 Jan 2026 01:20:48 +0200
Subject: [PATCH v6 01/11] phy: hdmi: Add HDMI 2.1 FRL configuration options
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260113-phy-hdptx-frl-v6-1-8d5f97419c0b@collabora.com>
References: <20260113-phy-hdptx-frl-v6-0-8d5f97419c0b@collabora.com>
In-Reply-To: <20260113-phy-hdptx-frl-v6-0-8d5f97419c0b@collabora.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>, Algea Cao <algea.cao@rock-chips.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: kernel@collabora.com, linux-phy@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260112_232103_131324_285ADCA2 
X-CRM114-Status: GOOD (  12.42  )
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

The HDMI 2.1 specification introduced the Fixed Rate Link (FRL) mode,
aiming to replace the older Transition-Minimized Differential Signaling
(TMDS) mode used in previous HDMI versions to support much higher
bandwidths (up to 48 Gbps) for modern video and audio formats.

FRL has been designed to support ultra high resolution formats at high
refresh rates like 8K@60Hz or 4K@120Hz, and eliminates the need for
dynamic bandwidth adjustments, which reduces latency.  It operates with
3 or 4 lanes at different link rates: 3Gbps, 6Gbps, 8Gbps, 10Gbps or
12Gbps.

Add support for configuring the FRL mode for HDMI PHYs.

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 include/linux/phy/phy-hdmi.h | 19 +++++++++++++++++--
 1 file changed, 17 insertions(+), 2 deletions(-)

diff --git a/include/linux/phy/phy-hdmi.h b/include/linux/phy/phy-hdmi.h
index f0ec963c6e84..d4cf4430ee8f 100644
--- a/include/linux/phy/phy-hdmi.h
+++ b/include/linux/phy/phy-hdmi.h
@@ -6,16 +6,31 @@
 #ifndef __PHY_HDMI_H_
 #define __PHY_HDMI_H_
 
+#include <linux/types.h>
+
+enum phy_hdmi_mode {
+	PHY_HDMI_MODE_TMDS,
+	PHY_HDMI_MODE_FRL,
+};
+
 /**
  * struct phy_configure_opts_hdmi - HDMI configuration set
- * @tmds_char_rate: HDMI TMDS Character Rate in Hertz.
  * @bpc: Bits per color channel.
+ * @tmds_char_rate: HDMI TMDS Character Rate in Hertz.
+ * @frl.rate_per_lane: HDMI FRL Rate per Lane in Gbps.
+ * @frl.lanes: HDMI FRL lanes count.
  *
  * This structure is used to represent the configuration state of a HDMI phy.
  */
 struct phy_configure_opts_hdmi {
-	unsigned long long tmds_char_rate;
 	unsigned int bpc;
+	union {
+		unsigned long long tmds_char_rate;
+		struct {
+			u8 rate_per_lane;
+			u8 lanes;
+		} frl;
+	};
 };
 
 #endif /* __PHY_HDMI_H_ */

-- 
2.52.0


