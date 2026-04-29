Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66277CCFA13
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Apr 2026 09:59:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QNmj/5lhBG4/M/mlUhIx0ABzL/lsXGyAeqQNSPJCddU=; b=O12Kqcc9asNA5r++dd5Bqv2L4m
	eZ4ekBT9XjMVg88NV5ptytDiqahae/Gfr127AsosTz/5t4do72Bmj8AbCHrhDJhdQd3LSJ1Bxk/oX
	Xd/n5YKCr7iYxZuPVpwukD4kWlIYwt3Sp6Qwk2EdSuss/gnj9SNHEJqfkte8v/FTtz3Fibnihcf2/
	otX21nhwUtoqarccHKv4kiPLU1tu68BpwpGCKGwobhnUn69wvwxdz/1fGiv23lZSak6rHRhI5csub
	cX1Oy+YZzkMik/k8MaPU1QwRG2rbX+mbGyPamEzxWyl8veF5T3k2aGgauhXAM09VZ87ynyBSZwfHL
	OcpGiaDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI1hb-00000003PmS-0Kao;
	Wed, 29 Apr 2026 09:59:31 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI1hY-00000003PjP-0YXI;
	Wed, 29 Apr 2026 09:59:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=QNmj/5lhBG4/M/mlUhIx0ABzL/lsXGyAeqQNSPJCddU=; b=Yxy7kz4FWysBtZmL0Z4bA88Q5T
	60jrKx/uwsDw/5dclKjW73MeqyS+VHSgcLHaUSWGNplA3FFuNI8FfPMoQQdiRdb65HLw0V90ec1ax
	oSErXArvj1sWUoMZOH16iU5BLw4WM09Di8l4Wp+dhJfVAsM0zBpmZg65Zic6eJzjjhjHzJQetyrNp
	UbxeZYRm4XoTxsqGQ4NPik3j8pAkE30diKPBmtcvdNsjItbhDQTGNKmnafVsIBlIMmY+nGlELxjVL
	ohpu/ZU8g7PRlygyzae9WsETwJzl1Yy5sY6LVLclk+iv3rDwoFb9jPLmePRfsb+9lBKTmcZb7gAVQ
	/HEl9hLw==;
Received: from bali.collaboradmins.com ([148.251.105.195])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI1hV-000000053C9-1Tek;
	Wed, 29 Apr 2026 09:59:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1777456761;
	bh=W6kBXnqL1ax3ZXzyT8a/jimZTefvz3wCNS2vOEoao0c=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=bLHucGOsAMzcf07WCEu6l2ilT1ZcTG8BPcfwgcGhZekBD1RqpTilpOl5uB7J+MWjY
	 JSaGZGMtdNx3DB7LzFdJO4t0aORFYMjWhitnmIR1CkFWzn82QLPre8CtOQSk3a1VtY
	 eRm/zb3AYTx/siPKJAeD7UEs3OlVquHL55whnHhsuF+BS4/PI1Dmasp+/eAprUQLYd
	 WbRJQi1Nh/CxN1o86ofniYQm/h9+JO/DRmjULfL0trRDJHrlB1s2lMCL1o2PAfRe+H
	 0pE86CTxBYMu8ZNEkrWc+3BORYnHfQ90aWZVU7aHAxES0o+Q4BGpkuSmm0RnpRKF9C
	 RzUdwJd/KmFpg==
Received: from yukiji.home (unknown [100.64.0.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laeyraud)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 6877E17E1537;
	Wed, 29 Apr 2026 11:59:20 +0200 (CEST)
From: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Date: Wed, 29 Apr 2026 11:59:02 +0200
Subject: [PATCH 4/4] drm/mediatek: mtk_hdmi_ddc: Fix non-static global
 variable
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260429-mediatek-drm-fix-sparse-warnings-v1-4-d95c4d118b83@collabora.com>
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
 Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777456755; l=1116;
 i=louisalexis.eyraud@collabora.com; s=20250113; h=from:subject:message-id;
 bh=W6kBXnqL1ax3ZXzyT8a/jimZTefvz3wCNS2vOEoao0c=;
 b=aJkw3nLCwNRHWjwPpuDlzNgOZNC+o8lbUYKcBJxa5S2+TdYA1QQZTNiekWWBqcD9aprylOGss
 7cv6zEJbPGiDt5mURutqePiG3PH3+eba+4B+/leeNmPcIdvBsU4eX8p
X-Developer-Key: i=louisalexis.eyraud@collabora.com; a=ed25519;
 pk=CHFBDB2Kqh4EHc6JIqFn69GhxJJAzc0Zr4e8QxtumuM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260429_105925_537266_89D03102 
X-CRM114-Status: GOOD (  12.78  )
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

The struct 'mtk_hdmi_ddc_driver' is not used outside of the
mtk_hdmi_ddc.c file, so make it static to silence sparse warning:
```
drivers/gpu/drm/mediatek/mtk_hdmi_ddc.c:331:24: sparse: warning: symbol
  'mtk_hdmi_ddc_driver' was not declared. Should it be static?
```

Fixes: c241118b6216 ("drm/mediatek: mtk_hdmi_ddc: Switch to register as module_platform_driver")
Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
---
 drivers/gpu/drm/mediatek/mtk_hdmi_ddc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi_ddc.c b/drivers/gpu/drm/mediatek/mtk_hdmi_ddc.c
index 6358e1af69b4..2acbdb025d89 100644
--- a/drivers/gpu/drm/mediatek/mtk_hdmi_ddc.c
+++ b/drivers/gpu/drm/mediatek/mtk_hdmi_ddc.c
@@ -328,7 +328,7 @@ static const struct of_device_id mtk_hdmi_ddc_match[] = {
 };
 MODULE_DEVICE_TABLE(of, mtk_hdmi_ddc_match);
 
-struct platform_driver mtk_hdmi_ddc_driver = {
+static struct platform_driver mtk_hdmi_ddc_driver = {
 	.probe = mtk_hdmi_ddc_probe,
 	.remove = mtk_hdmi_ddc_remove,
 	.driver = {

-- 
2.54.0


