Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C388C71130
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Jul 2025 17:23:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z3oo4jp/mWDXJM4loc/Z9mF5O/3QC0Xa5p4jSoWlt2w=; b=GndMB3+OXZ5IcsIMDeKl8F3cMR
	knjtK2ibQtNYIX9hMmCcn2gqzUf2wgzPpO/u3LPHgTSPuDImj7Vaon4aX9+UVOoZamn35EEbCqjkw
	gUaC+oaSUsPFAum1SE3ry8pWHQGZw9NrgRpiu82iYaVNpHe/eVp17OgPeuXMftdMA3BmuAe1OjWzA
	OjrvkINmHa/OHrY/BfndyCCcsKwxXgiWnBpsiAohWgQxPvkjEBFsKlC43LweQQkGzjtSmLAM7e9Et
	Ey82e/4vXOSsCjznw07jtQjv7xskMhRkBHEh9kqksCnTzItuPC4Pa3uLocGtIOGfVvXjPao6ywoCk
	qnI7Bxbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYpZJ-000000039tr-2nDx;
	Mon, 07 Jul 2025 17:23:53 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYp2I-000000033tL-1Yxs;
	Mon, 07 Jul 2025 16:49:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type;
	bh=z3oo4jp/mWDXJM4loc/Z9mF5O/3QC0Xa5p4jSoWlt2w=; b=yWuK4Eyl5vZRgqKAYAhhf5a2V2
	YlX0Lw/Wa+sVwk/B4wvKfqvE8w+bOUD34xSSmYZuyU8sOqi5nRT+hINz0n1t8yzFGR0MqP3z/7HNu
	e9R8o3Fno1t8YK6atx1BeLyYAX60Dd/5oLfDwuPATN7z2bXqHI/sfs3ayd+uhPiMDWII9ySdIOhi9
	9o1yw4343jaz2Ww6Ls3Adlbn42d3HnYgofQc2mCB6VB6xa0c8BPEi6+FbvIjGiw+COVFiEv9n1Str
	iFMwmDlj5hlBO57U8/27o98u3pFzWrl0vamF83rE9yPF0ItjoFVCAC/qPyuJV1I8D5jzWxKEhsW2/
	So/tIGJw==;
Received: from i53875bf5.versanet.de ([83.135.91.245] helo=localhost.localdomain)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uYp1s-0004yl-Ea; Mon, 07 Jul 2025 18:49:20 +0200
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
Subject: [PATCH 05/13] dt-bindings: display: ili9881c: Add Bestar BSD1218-A101KL68 LCD panel
Date: Mon,  7 Jul 2025 18:48:58 +0200
Message-ID: <20250707164906.1445288-6-heiko@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250707164906.1445288-1-heiko@sntech.de>
References: <20250707164906.1445288-1-heiko@sntech.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250707_094946_429550_00467CD1 
X-CRM114-Status: UNSURE (   9.88  )
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

Document the compatible value for Bestar BSD1218-A101KL68 LCD panels
that are based around the ili9881c controller.

Signed-off-by: Heiko Stuebner <heiko@sntech.de>
---
 .../devicetree/bindings/display/panel/ilitek,ili9881c.yaml       | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/panel/ilitek,ili9881c.yaml b/Documentation/devicetree/bindings/display/panel/ilitek,ili9881c.yaml
index baf5dfe5f5eb..79064f9dde23 100644
--- a/Documentation/devicetree/bindings/display/panel/ilitek,ili9881c.yaml
+++ b/Documentation/devicetree/bindings/display/panel/ilitek,ili9881c.yaml
@@ -18,6 +18,7 @@ properties:
       - enum:
           - ampire,am8001280g
           - bananapi,lhr050h41
+          - bestar,bsd1218-a101kl68
           - feixin,k101-im2byl02
           - startek,kd050hdfia020
           - tdo,tl050hdv35
-- 
2.47.2


