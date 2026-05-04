Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F03CCD3427
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 May 2026 19:11:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ztwyFtJ+PIzunu61Ma2kZpnK7+L5uIsvetgCX3r3Ivg=; b=qLptt8C5ZgqwSzXPma0P4gj/rN
	2S608nkcLQWW3nGrrli7r99MOurS5SiL4GdtJZQAdsFdggu4MYQVNr+ta5+Sw0bbIMcBAo8lLGBqn
	Yd22V/YuTxVB9jEmYXp4M5q1zx9YQnYbaLedB1+8NtM4Mv2xrpQck7FWeaYlFniI/MTrR4Yb1K2Ct
	mKM1FhpnN7qCsHZ8eLGVzqmrrGfaYX1r994rBns7LLRA45cEoazEkyq0vbbe3OoBJLgtq0VILLNQ6
	YK8gmlGmailqbqbk3pFHsoZh7WARlTAj3nHGHXbFSRmN1QFgzC78rGEN5KguGZAIOIyJ7X+SQKN16
	wiMUEAWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJyhW-0000000E4w6-3gEN;
	Mon, 04 May 2026 19:11:30 +0000
Received: from smtp.forwardemail.net ([121.127.44.66])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJyhT-0000000E4t8-0aWf
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 May 2026 19:11:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: MIME-Version: References: In-Reply-To:
 Message-ID: Date: Subject: Cc: To: From; q=dns/txt; s=fe-e1b5cab7be;
 t=1777921885; bh=ztwyFtJ+PIzunu61Ma2kZpnK7+L5uIsvetgCX3r3Ivg=;
 b=scQSYhBVPqD04tbvLG48gyg6sBfnHB4e4QauUOyuW9c+oSXOzpeMRHT9jOUT3TVqn4eUSxVUZ
 SmztJEDwekl1+8V2FOHsYCcqgwX4nLcS7MP6Fsh/MixFrnJWz3kNQJ+OaDt6cr/2KcyI2+DkU34
 3nHAz8uvdtbKSec0UnW5elcdI3Z1UiAd+kwm2gXzWjxf/q731SSK2c1YXg4Gmcm36wqcQ0wcpd6
 WLMHJ8bwZWtz58T/BtzGj6urIrcce3eCud9MUkrflJlsDaODdvtqXoX/PtugnOa450YD4e9LXjw
 kF37avbrEh+hITgzvB0ZPGhbPOIE69IzsrYBW8OGGQRg==
X-Forward-Email-ID: 69f8ef5a04bb1dff846bb86f
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 121.127.44.66
X-Forward-Email-Version: 2.7.7
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
From: Jonas Karlman <jonas@kwiboo.se>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>
Cc: Liu Ying <victor.liu@nxp.com>,
	Sandy Huang <hjc@rock-chips.com>,
	Andy Yan <andy.yan@rock-chips.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	Christian Hewitt <christianshewitt@gmail.com>,
	Diederik de Haas <diederik@cknow-tech.com>,
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	imx@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 04/17] drm: bridge: dw_hdmi: Use passed mode instead of stored previous_mode
Date: Mon,  4 May 2026 19:10:41 +0000
Message-ID: <20260504191059.275928-5-jonas@kwiboo.se>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260504191059.275928-1-jonas@kwiboo.se>
References: <20260504191059.275928-1-jonas@kwiboo.se>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260504_121127_407721_A7A05406 
X-CRM114-Status: GOOD (  11.02  )
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

Use the passed mode instead of mixing use of passed mode and the stored
previous_mode in dw_hdmi_setup(). The passed mode is currenly always the
previous_mode.

Also fix a small typo and add a variable to help shorten a code line.

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
---
v4: No change
v3: Collect r-b tag
v2: Update commit message, s/type/typo/
---
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
index 4ecad0d2eeaa..f028a4b71aad 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
@@ -2258,6 +2258,7 @@ static int dw_hdmi_setup(struct dw_hdmi *hdmi,
 			 const struct drm_connector *connector,
 			 const struct drm_display_mode *mode)
 {
+	const struct drm_display_info *display = &connector->display_info;
 	int ret;
 
 	hdmi_disable_overflow_interrupts(hdmi);
@@ -2303,12 +2304,10 @@ static int dw_hdmi_setup(struct dw_hdmi *hdmi,
 	hdmi->hdmi_data.video_mode.mdataenablepolarity = true;
 
 	/* HDMI Initialization Step B.1 */
-	hdmi_av_composer(hdmi, &connector->display_info, mode);
+	hdmi_av_composer(hdmi, display, mode);
 
-	/* HDMI Initializateion Step B.2 */
-	ret = hdmi->phy.ops->init(hdmi, hdmi->phy.data,
-				  &connector->display_info,
-				  &hdmi->previous_mode);
+	/* HDMI Initialization Step B.2 */
+	ret = hdmi->phy.ops->init(hdmi, hdmi->phy.data, display, mode);
 	if (ret)
 		return ret;
 	hdmi->phy.enabled = true;
-- 
2.54.0


