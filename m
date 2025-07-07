Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44937C71130
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Jul 2025 17:40:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mKluaDJd+46jb4+9m6pp57pzlsEm486O32TbldwJjns=; b=VTC5acE0Rx1+DYEjzIuaGpKGcu
	igD7w62YzFbHvz7xwNPP0tgD0J4wJe6HqGazIK2tHd4y0h/sm/4KMTa73+vG9JWHLvorIyfv1V+kZ
	BOlHAlDlYvfKa8BIyjRRnswLF3+W26dm2XiJ5QVJciznOgQfHVCd+Y4J6xp1UHou7o1kw0hhB+Dww
	37GPu9cXIWM72eqWhOwOQ3Ytq4tKh61N7HDoBTb3wz8QeCkKo/Q5HFa4dlcIgsoDoPdX8sfO93IOE
	Mry0N9AsuErLP9ci3/cfhchx+ajBdqTXu5OoYwKoG1jCILvAFgKRZMsADpi1pYnTbCiHIIlnyrepQ
	6LvmBGog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYppN-00000003C8a-1g2n;
	Mon, 07 Jul 2025 17:40:29 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYp2N-000000033zg-0MsU;
	Mon, 07 Jul 2025 16:49:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type;
	bh=mKluaDJd+46jb4+9m6pp57pzlsEm486O32TbldwJjns=; b=xFE7ieg15stL2Ic38IK9roETXO
	GwgASLdwpgFTXckUhYRuw9ufnTPtZ7/tWfd1j7ncxukdXdaTA20VZAtGBLmOqc0SCcxeCQzomI0bB
	jW2nl6jm+qUWw1wtLx0WS8glwErm6RaRaI2tudhuW+Qfoy6IfV3gHhSuCf/F+h631QSG4O7swzHgw
	4mMRv9GYNYuq089+qDFm2j4943EEMCPHyBW/ki1V4s1rHL3Ji86WwStzzejf+0xjU+p/Vn3aiL6ps
	zTztLIZBPcQ4rJHsQipktHzAnaED4Eg5OstpP81o3aSyipXJjBggMEDrOKtASxG11UpxRSHE66lgy
	2DD449iA==;
Received: from i53875bf5.versanet.de ([83.135.91.245] helo=localhost.localdomain)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uYp1t-0004yl-Tr; Mon, 07 Jul 2025 18:49:21 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: heiko@sntech.de
Cc: neil.armstrong@linaro.org,
	quic_jesszhan@quicinc.com,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	hjc@rock-chips.com,
	andy.yan@rock-chips.com,
	andyshrk@163.com,
	nicolas.frattaroli@collabora.com,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org
Subject: [PATCH 07/13] dt-bindings: soc: rockchip: add rk3576 mipi dcphy syscon
Date: Mon,  7 Jul 2025 18:49:00 +0200
Message-ID: <20250707164906.1445288-8-heiko@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250707164906.1445288-1-heiko@sntech.de>
References: <20250707164906.1445288-1-heiko@sntech.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250707_094951_158591_F342D35D 
X-CRM114-Status: GOOD (  10.25  )
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

RK3576 CSI and DSI support requires the GRF for its DC-PHY.
The "general register files" provide additional setting-bits
outside the regular ip-block reg-space.

Signed-off-by: Heiko Stuebner <heiko@sntech.de>
---
 Documentation/devicetree/bindings/soc/rockchip/grf.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/soc/rockchip/grf.yaml b/Documentation/devicetree/bindings/soc/rockchip/grf.yaml
index ccdcc889ba8e..d4fda4ee33e4 100644
--- a/Documentation/devicetree/bindings/soc/rockchip/grf.yaml
+++ b/Documentation/devicetree/bindings/soc/rockchip/grf.yaml
@@ -31,6 +31,7 @@ properties:
               - rockchip,rk3568-usb2phy-grf
               - rockchip,rk3576-bigcore-grf
               - rockchip,rk3576-cci-grf
+              - rockchip,rk3576-dcphy-grf
               - rockchip,rk3576-gpu-grf
               - rockchip,rk3576-hdptxphy-grf
               - rockchip,rk3576-litcore-grf
-- 
2.47.2


