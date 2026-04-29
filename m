Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DC1EFF8875
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Apr 2026 09:59:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZEg9f387SRbUVumzQmAniddAAh5dL9jI19yOPZVRTKo=; b=eL3Odzw1lJWMSVPhuJP0EPFgJl
	HlCHADOVbQsfGVnwEv2QrPspzNEBe+b7OXjhBnIAWYfJhFMdEAFFMr+F6pSUQHNcvp9Vppv8wRfMX
	7Dq31XsXOixz+prsDkPXugUXJvxDi12gYlEIkittEgRogHTjoPOUV809WSPZVM826rOprlT7/1Njw
	jGYurMnFtkjjU+oCqSJGvDugDZo4WLSNU/4tIU7wgMBVZpa76+r0SeCACCmtA+sC9M1oDxtoUmvpP
	2PJThBbi5EVEDe/UphXJHKx386xy77vqsOo4Yd7psKdkPS8tkcqNrvKVOYIlPI7Gq5uDbsnvo7NKu
	MxJS2fUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI1ha-00000003Pla-2IdX;
	Wed, 29 Apr 2026 09:59:30 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI1hX-00000003Pj4-3zzn;
	Wed, 29 Apr 2026 09:59:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=ZEg9f387SRbUVumzQmAniddAAh5dL9jI19yOPZVRTKo=; b=q4QLjr2Rhmql8JSHWbGZczvGj7
	EU9fWXvsFPZhVRBaSdA+T+dZgWgC5uws+mAqFuyEDubCwiNiNiFpnhxPV3VSXUeW2NAahPeN11bM7
	AqvofMiKP2xNyMjIcqEkVh3G52p4H+L2d+IAWOR+SU4RCYlPMX8MfLsgqvyO5cULEaEYohsghCHP4
	L80mnaH3EACKP1PxOywniJTbPof9uOU4/HbX4NO/8VE/fh3KA4NDoZgykzJrXj58uF79jzhS+u9B8
	W585JTpsMgdmx1r6gh+4+l7yWzCrp+owM9WhEop1q3TnGU3K1H8QiFoB5wZzh+i1y3Rxdbp68p/3f
	aeJtRv4w==;
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI1hU-000000053BX-13vQ;
	Wed, 29 Apr 2026 09:59:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1777456760;
	bh=WUlL1O/45PQI6YKuEzmypF/5DpmvpKtJakBpcNDoaiI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=ZjkxoXqktEVbE0bhJKqDg0CDtE1hvDgwqLe0pebXFaT9jV1aWFyMlcVj40dA0owVX
	 KGlvw7QzYqNQo0VxWuVzf7Z89OoURQDbFKwnW7TIlaXyxWliNYrmN1jXoprst1RB00
	 EAharlZ8lS1Hfzp/XBGzlphyvGmFpxITEsItAIrwfG7hFqdmy6p0To2pTLXp2MpG3N
	 DJHBfUg921py4QXic2hj4fpr04oK2EcDHuVJ78qN222+GUFTxVuZWbs+C1UoanLGfh
	 tJ4yYOy2igaH/XM5he4IGIu29dzIHmAW/qw4OTHPdZwY7TBr07aUDeTWsDeQ3xlf0k
	 7KSXWXtSvaemg==
Received: from yukiji.home (unknown [100.64.0.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laeyraud)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 4297B17E1525;
	Wed, 29 Apr 2026 11:59:19 +0200 (CEST)
From: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Date: Wed, 29 Apr 2026 11:59:01 +0200
Subject: [PATCH 3/4] drm/mediatek: mtk_cec: Fix non-static global variable
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260429-mediatek-drm-fix-sparse-warnings-v1-3-d95c4d118b83@collabora.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777456755; l=1036;
 i=louisalexis.eyraud@collabora.com; s=20250113; h=from:subject:message-id;
 bh=WUlL1O/45PQI6YKuEzmypF/5DpmvpKtJakBpcNDoaiI=;
 b=iIaunPXI8/mSHHSEdzvELTQBbAki1NTo21lTLhSQyH3syWWXZU8L2UXh0M7PxCJonDtE4B2Ew
 FqP+UdB/Rc3CVDgbJj6leEDGI9abojfHiwDdeMYGOvxkC50vmbZnV7p
X-Developer-Key: i=louisalexis.eyraud@collabora.com; a=ed25519;
 pk=CHFBDB2Kqh4EHc6JIqFn69GhxJJAzc0Zr4e8QxtumuM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260429_105924_635617_82D4EE8A 
X-CRM114-Status: GOOD (  12.88  )
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

The struct 'mtk_cec_driver' is not used outside of the
mtk_cec.c file, so make it static to silence sparse warning:
```
drivers/gpu/drm/mediatek/mtk_cec.c:243:24: sparse: warning: symbol
'mtk_cec_driver' was not declared. Should it be static?
```

Fixes: 1e914a89ab7e ("drm/mediatek: mtk_cec: Switch to register as module_platform_driver")
Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
---
 drivers/gpu/drm/mediatek/mtk_cec.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_cec.c b/drivers/gpu/drm/mediatek/mtk_cec.c
index c7be530ca041..b8ccd6e55bed 100644
--- a/drivers/gpu/drm/mediatek/mtk_cec.c
+++ b/drivers/gpu/drm/mediatek/mtk_cec.c
@@ -240,7 +240,7 @@ static const struct of_device_id mtk_cec_of_ids[] = {
 };
 MODULE_DEVICE_TABLE(of, mtk_cec_of_ids);
 
-struct platform_driver mtk_cec_driver = {
+static struct platform_driver mtk_cec_driver = {
 	.probe = mtk_cec_probe,
 	.remove = mtk_cec_remove,
 	.driver = {

-- 
2.54.0


