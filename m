Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF523C3ABC9
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 May 2025 12:38:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Subject:Cc:To:
	From:Mime-Version:Message-ID:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=YhN+08z20DiEUOsVSmRpU7Yv2OAxICTPgxFc3/siz9U=; b=fkk3YSUAQd3FaRB25Ervtw/8/f
	GbT5DVKZK36hfkahXfNLOWSYjXFasf+frY/IPQGETM1dZmaHULZ2qNMjMxjMH8QtQOtMn45E0n7sN
	F+0ptjNsHyrWoFPJrU6vQqTcr5oXVG7RECjQq+q75pDmOLc/Yq5iMdj/i2fVlJj4lRkBbvlMmFkz2
	JkFimvD4I+rsjGkilu0hvDRkTLxN2xANeGDP0xZ9JCmkVCXdDGELgCBxp35GcQ1x2AQmd0Fqu0K43
	cH1vtJkxyXPRGJ7ZWb0o8jNRDXAVsGUp7aCqA6OxioVtWMDj5yuDCMAQrkzu+Tof3GzexazThC+6J
	yZDdvJcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFXqo-00000000aIG-1nMn;
	Thu, 15 May 2025 12:38:14 +0000
Received: from mxhk.zte.com.cn ([63.216.63.35])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFXom-00000000ZwU-3Lla;
	Thu, 15 May 2025 12:36:10 +0000
Received: from mse-fl1.zte.com.cn (unknown [10.5.228.132])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mxhk.zte.com.cn (FangMail) with ESMTPS id 4ZyqSY3sJvz5B1Gq;
	Thu, 15 May 2025 20:35:57 +0800 (CST)
Received: from njy2app04.zte.com.cn ([10.40.12.64])
	by mse-fl1.zte.com.cn with SMTP id 54FCZoE7025362;
	Thu, 15 May 2025 20:35:50 +0800 (+08)
	(envelope-from long.yunjian@zte.com.cn)
Received: from mapi (njy2app01[null])
	by mapi (Zmail) with MAPI id mid201;
	Thu, 15 May 2025 20:35:54 +0800 (CST)
Date: Thu, 15 May 2025 20:35:54 +0800 (CST)
X-Zmail-TransId: 2af96825dfaaffffffffa32-c85aa
X-Mailer: Zmail v1.0
Message-ID: <20250515203554564-j1jBXUXR6bdiN6zARicC@zte.com.cn>
Mime-Version: 1.0
From: <long.yunjian@zte.com.cn>
To: <hjc@rock-chips.com>
Cc: <heiko@sntech.de>, <andy.yan@rock-chips.com>,
        <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
        <tzimmermann@suse.de>, <airlied@gmail.com>, <simona@ffwll.ch>,
        <dri-devel@lists.freedesktop.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-rockchip@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <fang.yumeng@zte.com.cn>, <mou.yi@zte.com.cn>, <xu.lifeng1@zte.com.cn>,
        <ouyang.maochun@zte.com.cn>
Subject: =?UTF-8?B?W1BBVENIXSBkcm0vcm9ja2NoaXA6IFVzZSBkZXZfZXJyX3Byb2JlKCkgdG8gc2ltcGxpZnkgY29kZQ==?=
Content-Type: text/plain;
	charset="UTF-8"
X-MAIL: mse-fl1.zte.com.cn 54FCZoE7025362
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 6825DFAD.000/4ZyqSY3sJvz5B1Gq
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250515_053608_990923_80564788 
X-CRM114-Status: UNSURE (   9.77  )
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

From: Yumeng Fang <fang.yumeng@zte.com.cn>

In the probe path, dev_err() can be replaced with dev_err_probe()
which will check if error code is -EPROBE_DEFER and prints the
error name. It also sets the defer probe reason which can be
checked later through debugfs.

Signed-off-by: Yumeng Fang <fang.yumeng@zte.com.cn>
---
 drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c | 16 ++++------------
 1 file changed, 4 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c b/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c
index f737e7d46e66..acb59b25d928 100644
--- a/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c
+++ b/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c
@@ -213,17 +213,13 @@ static int rockchip_hdmi_parse_dt(struct rockchip_hdmi *hdmi)

 	if (IS_ERR(hdmi->ref_clk)) {
 		ret = PTR_ERR(hdmi->ref_clk);
-		if (ret != -EPROBE_DEFER)
-			dev_err(hdmi->dev, "failed to get reference clock\n");
-		return ret;
+		return dev_err_probe(hdmi->dev, ret, "failed to get reference clock\n");
 	}

 	hdmi->grf_clk = devm_clk_get_optional(hdmi->dev, "grf");
 	if (IS_ERR(hdmi->grf_clk)) {
 		ret = PTR_ERR(hdmi->grf_clk);
-		if (ret != -EPROBE_DEFER)
-			dev_err(hdmi->dev, "failed to get grf clock\n");
-		return ret;
+		return dev_err_probe(hdmi->dev, ret, "failed to get grf clock\n");
 	}

 	ret = devm_regulator_get_enable(hdmi->dev, "avdd-0v9");
@@ -573,17 +569,13 @@ static int dw_hdmi_rockchip_bind(struct device *dev, struct device *master,

 	ret = rockchip_hdmi_parse_dt(hdmi);
 	if (ret) {
-		if (ret != -EPROBE_DEFER)
-			dev_err(hdmi->dev, "Unable to parse OF data\n");
-		return ret;
+		return dev_err_probe(hdmi->dev, ret, "Unable to parse OF data\n");
 	}

 	hdmi->phy = devm_phy_optional_get(dev, "hdmi");
 	if (IS_ERR(hdmi->phy)) {
 		ret = PTR_ERR(hdmi->phy);
-		if (ret != -EPROBE_DEFER)
-			dev_err(hdmi->dev, "failed to get phy\n");
-		return ret;
+		return dev_err_probe(hdmi->dev, ret, "failed to get phy\n");
 	}

 	if (hdmi->phy) {
-- 
2.25.1

