Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44C1AFF8867
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Apr 2026 09:59:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LPz8EtPttRNik2gDn7LY1dwUIcxfRjp5MXUD4jIgaQg=; b=wyTyHp80I9S/BkbJH4dkzWR6Bs
	yNgdC0A4/gowNEQXEL8plF4CarU2n0fJSoNKraWKl4xsHbXqCZE2YhuFX7i5WNXcnUNtnpmKTFV6Z
	Cnm71RguRSBIWIbI693TMbcAXN66izsgKy7d/aYVRE4djSKunT7NXb//mC/FgNn5T+tWzK6/FVSD9
	YIsAQCk2uI5ktaeQiF1lLkdjuQXJdPwNj49XjXyR2pzyccrGFzLUFmmPf5UTx21TDXW3QRH9dYrGQ
	e0DZtxqL5Q2CU123Q5l0128SYq0qh0NqHU/nHaLUO2oexs5h6p2KdnPAQfzyxwXEJXmKAgCJMv2OS
	6lbGRktA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI1hb-00000003PnP-2fh6;
	Wed, 29 Apr 2026 09:59:31 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI1hY-00000003Pk7-3jiL;
	Wed, 29 Apr 2026 09:59:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=LPz8EtPttRNik2gDn7LY1dwUIcxfRjp5MXUD4jIgaQg=; b=FZScfUZPSl+TlTaaW4sefTKZAE
	xONJIAprYinXpXZ6XuQy4O3vtvOUFHtdx9aOdAOPuiW7OJc4E0kk9N1khhoFKXLdSKVIIA2BLV7Va
	3ZTvZbKZua/NhBNo+8eOuoXg4hogRarujDJgLezjI0/X2F4GEBLN/kV4xjaSUCH/8zSJKuLowr9g1
	hnj0MgusBS3xyl0/CAZie1PrBxwam7crQyugrzpijC3nFP4f0wPHdqy+Uu0fWM4pupcYz7Zh7pb41
	RoRrrht8/EB5qRE8eIcRJK8mH2urY+JqzMGyNaruAMKaMWn8Tlv0+hN5TCra+409+Y7kS01AZrOUI
	oclLqd4w==;
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI1hU-000000053B2-2UAm;
	Wed, 29 Apr 2026 09:59:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1777456759;
	bh=XWxApOAHBnX242cqzf8MT9L8rPe2HmxQVPIPOJhxGQ4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Eg4Al2I+jfscKrFx2zJm7cH2gxxvXb3mkAzhwRDryBPjklwNmKVI7c2Q4ESTsCsSt
	 A5wOlgDMe2I4kxyZb2UuPVjGVFlIUWYbG6jIYf//NY8rAa1uys2jDG2voKEw+UXcge
	 18RDpuzAlykAzXLtnkHgQeCLIB51TPzsVPAm5zLZXJMlCO7Kzp6FRW9mr4takTuzoc
	 BXh+88RKhYZKzF5gzQ6puKejqSw4vgirUQZwBUmdp9bK4iZTDzdfi4IK5UjBy9+K42
	 nVKgQQQ27QrmCfVrNKK80ccgn5XGa/jkcJygldmXwrGe+7Z3iPRUYKTKc5IHduZf/L
	 cKL6G7lJBsV+g==
Received: from yukiji.home (unknown [100.64.0.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laeyraud)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 11C1617E1523;
	Wed, 29 Apr 2026 11:59:18 +0200 (CEST)
From: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Date: Wed, 29 Apr 2026 11:59:00 +0200
Subject: [PATCH 2/4] drm/mediatek: mtk_hdmi_v2: Fix non-static global
 variable
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260429-mediatek-drm-fix-sparse-warnings-v1-2-d95c4d118b83@collabora.com>
References: <20260429-mediatek-drm-fix-sparse-warnings-v1-0-d95c4d118b83@collabora.com>
In-Reply-To: <20260429-mediatek-drm-fix-sparse-warnings-v1-0-d95c4d118b83@collabora.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 CK Hu <ck.hu@mediatek.com>, Alexandre Mergnat <amergnat@baylibre.com>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org, 
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>, 
 kernel test robot <lkp@intel.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777456755; l=1257;
 i=louisalexis.eyraud@collabora.com; s=20250113; h=from:subject:message-id;
 bh=XWxApOAHBnX242cqzf8MT9L8rPe2HmxQVPIPOJhxGQ4=;
 b=RyBHFiDAavGRNw9ff4r8IqpXhk1Jiqr3WHM4BeGNRRp74IL5//9frl7utdvF+Dx25zgEe/Ys5
 pKO1jU80E4jBefWnmNuljuFZ3mlyrBZnviVdEwSWeuEfonj7W7M4MrK
X-Developer-Key: i=louisalexis.eyraud@collabora.com; a=ed25519;
 pk=CHFBDB2Kqh4EHc6JIqFn69GhxJJAzc0Zr4e8QxtumuM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260429_105924_789669_05E7DF45 
X-CRM114-Status: GOOD (  11.48  )
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

The struct 'mtk_hdmi_v2_clk_names' is not used outside of the
mtk_hdmi_v2.c file, so make it static to silence sparse warning:
```
drivers/gpu/drm/mediatek/mtk_hdmi_v2.c:53:12: sparse: warning: symbol
'mtk_hdmi_v2_clk_names' was not declared. Should it be static?
```

Fixes: 8d0f79886273 ("drm/mediatek: Introduce HDMI/DDC v2 for MT8195/MT8188")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202604132044.fcYjEcU8-lkp@intel.com/
Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
---
 drivers/gpu/drm/mediatek/mtk_hdmi_v2.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi_v2.c b/drivers/gpu/drm/mediatek/mtk_hdmi_v2.c
index b5c738380dc2..a8eb6fd0908b 100644
--- a/drivers/gpu/drm/mediatek/mtk_hdmi_v2.c
+++ b/drivers/gpu/drm/mediatek/mtk_hdmi_v2.c
@@ -50,7 +50,7 @@ enum mtk_hdmi_v2_clk_id {
 	MTK_HDMI_V2_CLK_COUNT,
 };
 
-const char *const mtk_hdmi_v2_clk_names[MTK_HDMI_V2_CLK_COUNT] = {
+static const char *const mtk_hdmi_v2_clk_names[MTK_HDMI_V2_CLK_COUNT] = {
 	[MTK_HDMI_V2_CLK_HDMI_APB_SEL] = "bus",
 	[MTK_HDMI_V2_CLK_HDCP_SEL] = "hdcp",
 	[MTK_HDMI_V2_CLK_HDCP_24M_SEL] = "hdcp24m",

-- 
2.54.0


