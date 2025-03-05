Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6019DC19F32
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Mar 2025 11:30:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Rvk/zTrDSTH7fAzp6rZhWBC2bPrMFm+KTZUPS+ByEUo=; b=0QRPQ0efaEhllXdr5etlu3jaAt
	yoU8JifnpDwqU9uD87epnVQLUN9nqvKkRLotM5d1lqPtPde9oqrR32bsFsxka8vFbHyyg+UNfY1nu
	5Mbr+IvERZyyGXPRUfI4FF19eQXD9F+Q9ao3JqvOOW773D2ldFBnBGFeWFP6jDFhGJ9/pnNOTioxD
	EoaNlyUdv14SsH4zyGOehZITpfIBuHjDvVHeM5EzFWTwFgYWawITjAk+ZGgBchV4ak3vb3u1O945D
	dqufAS7lYZGa574urgihEiG8KJVkCmaKpy7x8xW7yGGAmfySU7xGvNUqOAUd/9Kno0MX301CGMO5B
	uzHbXFuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpmxC-00000007rgL-2ju9;
	Wed, 05 Mar 2025 11:30:22 +0000
Received: from unicom145.biz-email.net ([210.51.26.145])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpm1f-00000007gi4-3IPu
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Mar 2025 10:30:57 +0000
Received: from jtjnmail201622.home.langchao.com
        by unicom145.biz-email.net ((D)) with ASMTP (SSL) id 202503051830462016;
        Wed, 05 Mar 2025 18:30:46 +0800
Received: from jtjnmail201607.home.langchao.com (10.100.2.7) by
 jtjnmail201622.home.langchao.com (10.100.2.22) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 5 Mar 2025 18:30:45 +0800
Received: from locahost.localdomain (10.94.12.149) by
 jtjnmail201607.home.langchao.com (10.100.2.7) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 5 Mar 2025 18:30:44 +0800
From: Charles Han <hanchunchao@inspur.com>
To: <victor.liu@nxp.com>, <andrzej.hajda@intel.com>,
	<neil.armstrong@linaro.org>, <rfoss@kernel.org>,
	<Laurent.pinchart@ideasonboard.com>, <jonas@kwiboo.se>,
	<jernej.skrabec@gmail.com>, <maarten.lankhorst@linux.intel.com>,
	<mripard@kernel.org>, <tzimmermann@suse.de>, <airlied@gmail.com>,
	<simona@ffwll.ch>, <shawnguo@kernel.org>, <s.hauer@pengutronix.de>,
	<kernel@pengutronix.de>, <festevam@gmail.com>
CC: <dri-devel@lists.freedesktop.org>, <imx@lists.linux.dev>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	Charles Han <hanchunchao@inspur.com>
Subject: [PATCH] drm/imx: legacy-bridge: fix inconsistent indenting warning
Date: Wed, 5 Mar 2025 18:30:42 +0800
Message-ID: <20250305103042.3017-1-hanchunchao@inspur.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.94.12.149]
X-ClientProxiedBy: Jtjnmail201615.home.langchao.com (10.100.2.15) To
 jtjnmail201607.home.langchao.com (10.100.2.7)
tUid: 2025305183046060fe9fadcf87c8f56f6a3c52dd092ef
X-Abuse-Reports-To: service@corp-email.com
Abuse-Reports-To: service@corp-email.com
X-Complaints-To: service@corp-email.com
X-Report-Abuse-To: service@corp-email.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250305_023056_226522_F76395C2 
X-CRM114-Status: UNSURE (   7.99  )
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

Fix below inconsistent indenting smatch warning.
smatch warnings:
drivers/gpu/drm/bridge/imx/imx-legacy-bridge.c:79 devm_imx_drm_legacy_bridge() warn: inconsistent indenting

Signed-off-by: Charles Han <hanchunchao@inspur.com>
---
 drivers/gpu/drm/bridge/imx/imx-legacy-bridge.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/bridge/imx/imx-legacy-bridge.c b/drivers/gpu/drm/bridge/imx/imx-legacy-bridge.c
index 3ebf0b9866de..55a763045812 100644
--- a/drivers/gpu/drm/bridge/imx/imx-legacy-bridge.c
+++ b/drivers/gpu/drm/bridge/imx/imx-legacy-bridge.c
@@ -76,9 +76,9 @@ struct drm_bridge *devm_imx_drm_legacy_bridge(struct device *dev,
 	imx_bridge->base.ops = DRM_BRIDGE_OP_MODES;
 	imx_bridge->base.type = type;
 
-       ret = devm_drm_bridge_add(dev, &imx_bridge->base);
-       if (ret)
-               return ERR_PTR(ret);
+	ret = devm_drm_bridge_add(dev, &imx_bridge->base);
+	if (ret)
+		return ERR_PTR(ret);
 
 	return &imx_bridge->base;
 }
-- 
2.43.0


