Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D61AC021B8
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Mar 2025 21:11:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kpyWlOaModCxFl+Tqqpp85hFGJYXyqIGL3Cy6JBVo+g=; b=PPMP4dK8QqrWpoDn/AnoZf3NKi
	Jdl+ZoR4+18n67iyFe+CDtNqV7YZXzm85cmf7MN+4N2HyIDmpXXx8At+GpvwaLKWHt05tpLAXBsom
	dK3FeaRNfXiq1zdXBIFmXMNcA+sRw6kT2XwD0MfWUhEzj/3irWvGComQqMsW3uz88db3aqxR+NlLj
	NyNTYp12DTg5rD7qwPDQYOLBXuL3tn9YZpoc5JtI9P8LoftcJ8Auz+Mc4l8bDC4vBUuS/myElbPuH
	wsZA2YBqd0aRNvdDWCOmuOCb9twLc3V6ITtnQ0gosfN0l7ld+GTP+AeMLAxE+oG4psTBDagOAVVB2
	X/Jt8mbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpZXT-00000006GrG-2sTP;
	Tue, 04 Mar 2025 21:10:55 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpZUR-00000006GRx-0sz6
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 04 Mar 2025 21:07:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Cc:To:In-Reply-To:References:Message-Id
	:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=kpyWlOaModCxFl+Tqqpp85hFGJYXyqIGL3Cy6JBVo+g=; b=gmo4UuMxY8PIWtBv/wrt8rAHxj
	gVqhAf/l1lbpSLSiuZyutiimA30KO2hA3VSN73S1fBWbynNkEU53t3RQ/Rhr8576UMQM2ZRr/OdDZ
	ua1IT0WwPMVMC+HdjB05FzNrZCdrXjYwLEImysFvTRynGpVIv1zIDJO/kb2CuYcmv3BCNnWWRDCto
	QKGHIEOErimh4hsDvha58JbABVTKq0zqp8iBRGFY94B70d54/AtwsJqbsrTX/n+hU9LM8q5S7FsfZ
	CMIk1ch3A84+ny4cZkr+PzU100t3AoFn73zwuaRrbTFnRThrQ2stNvsuwlFDpjlIJdaQtBXUcJK6v
	3zHGjHUA==;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by casper.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpZUO-0000000470o-1NOn
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Mar 2025 21:07:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1741122462;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kpyWlOaModCxFl+Tqqpp85hFGJYXyqIGL3Cy6JBVo+g=;
	b=XkenogZ8NYOoC9tx9f50ADMhvkIm2tu03WrIvh+50s7OtUqe/vU+mzJSun11ib2Cp5lZvD
	uzW7Gfw4yHjkjF3lSfZ1H+cOhCSj1Uw4kv4MEiLw1CKkOBf3va+bDQvQSWtYehv24Bk8tB
	Eo2ExTbOvvFZlI4B9PfuFzWf2naIL4U=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1741122463;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kpyWlOaModCxFl+Tqqpp85hFGJYXyqIGL3Cy6JBVo+g=;
	b=epfDLV3D6YkhyUQctEG/qp75nxeVHezm277r7GU98dcM+NjPjvvRpwXcnxccV84oAygd76
	SJHyvNiQn28alQSIvg4YzeFr3Cvfqzdhdro7QJCDIU/M+mKVKus/vLht4cF5fPMCHFOvD3
	JWAuJ2+PtgFziM4RGo2/8qO+ZgDy5K0=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1741122463;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kpyWlOaModCxFl+Tqqpp85hFGJYXyqIGL3Cy6JBVo+g=;
	b=epfDLV3D6YkhyUQctEG/qp75nxeVHezm277r7GU98dcM+NjPjvvRpwXcnxccV84oAygd76
	SJHyvNiQn28alQSIvg4YzeFr3Cvfqzdhdro7QJCDIU/M+mKVKus/vLht4cF5fPMCHFOvD3
	JWAuJ2+PtgFziM4RGo2/8qO+ZgDy5K0=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-358-te3uQEo3M4ObyRfhV2_LKA-1; Tue,
 04 Mar 2025 16:06:17 -0500
X-MC-Unique: te3uQEo3M4ObyRfhV2_LKA-1
X-Mimecast-MFC-AGG-ID: te3uQEo3M4ObyRfhV2_LKA_1741122372
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 087A1180087F;
	Tue,  4 Mar 2025 21:06:12 +0000 (UTC)
Received: from asrivats-na.rmtustx.csb (unknown [10.2.16.107])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 145DF180035F;
	Tue,  4 Mar 2025 21:06:04 +0000 (UTC)
From: Anusha Srivatsa <asrivats@redhat.com>
Date: Tue, 04 Mar 2025 16:05:33 -0500
Subject: [PATCH v5 3/7] drm/mxsfb: move to devm_platform_ioremap_resource()
 usage
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250304-mem-fixes-v1-3-fb3dab8d901f@redhat.com>
References: <20250304-mem-fixes-v1-0-fb3dab8d901f@redhat.com>
In-Reply-To: <20250304-mem-fixes-v1-0-fb3dab8d901f@redhat.com>
To: Stefan Agner <stefan@agner.ch>, Alison Wang <alison.wang@nxp.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Xinliang Liu <xinliang.liu@linaro.org>, Tian Tao <tiantao6@hisilicon.com>, 
 Xinwei Kong <kong.kongxinwei@hisilicon.com>, 
 Sumit Semwal <sumit.semwal@linaro.org>, 
 Yongqin Liu <yongqin.liu@linaro.org>, John Stultz <jstultz@google.com>, 
 Marek Vasut <marex@denx.de>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Orson Zhai <orsonzhai@gmail.com>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, 
 Chunyan Zhang <zhang.lyra@gmail.com>, 
 Alain Volmat <alain.volmat@foss.st.com>, 
 Raphael Gallais-Pou <rgallaispou@gmail.com>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Mikko Perttunen <mperttunen@nvidia.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, Jonathan Corbet <corbet@lwn.net>
Cc: Dan Carpenter <dan.carpenter@linaro.org>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-tegra@vger.kernel.org, linux-doc@vger.kernel.org, 
 Anusha Srivatsa <asrivats@redhat.com>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1741122340; l=2524;
 i=asrivats@redhat.com; s=20250122; h=from:subject:message-id;
 bh=+h+zwJrqhz4KcKBFOtg5ltWWvHHlCjpJOJiBG2cNAao=;
 b=wtZWHnIqYTSgvPovPt4G5kDpdKBEDOzLh/gzDiSQOIa73OTtOq0t6bLXZLZdfVFHYPGYjMfNO
 bfXMkr1jyPMAtlajMl+saWTZMd2Mh3QHno9fmjOMJAGTKlFpdU0qBIO
X-Developer-Key: i=asrivats@redhat.com; a=ed25519;
 pk=brnIHkBsUZEhyW6Zyn0U92AeIZ1psws/q8VFbIkf1AU=
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250304_210744_551543_248D8602 
X-CRM114-Status: GOOD (  11.55  )
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

Replace platform_get_resource + devm_ioremap_resource
with just devm_platform_ioremap_resource()

Used Coccinelle to do this change. SmPl patch:
@rule_1@
identifier res;
expression ioremap_res;
identifier pdev;
@@
-struct resource *res;
...
-res = platform_get_resource(pdev,...);
-ioremap_res = devm_ioremap_resource(...);
+ioremap_res = devm_platform_ioremap_resource(pdev,0);

Cc: Marek Vasut <marex@denx.de>
Cc: Stefan Agner <stefan@agner.ch>
Reviewed-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Anusha Srivatsa <asrivats@redhat.com>
---
 drivers/gpu/drm/mxsfb/lcdif_drv.c | 4 +---
 drivers/gpu/drm/mxsfb/mxsfb_drv.c | 4 +---
 2 files changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/mxsfb/lcdif_drv.c b/drivers/gpu/drm/mxsfb/lcdif_drv.c
index 8ee00f59ca821cea8e823e7100fb4d7534283994..fcb2a7517377e9a5bbd2997c578c579b1b079f92 100644
--- a/drivers/gpu/drm/mxsfb/lcdif_drv.c
+++ b/drivers/gpu/drm/mxsfb/lcdif_drv.c
@@ -134,7 +134,6 @@ static int lcdif_load(struct drm_device *drm)
 {
 	struct platform_device *pdev = to_platform_device(drm->dev);
 	struct lcdif_drm_private *lcdif;
-	struct resource *res;
 	int ret;
 
 	lcdif = devm_kzalloc(&pdev->dev, sizeof(*lcdif), GFP_KERNEL);
@@ -144,8 +143,7 @@ static int lcdif_load(struct drm_device *drm)
 	lcdif->drm = drm;
 	drm->dev_private = lcdif;
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	lcdif->base = devm_ioremap_resource(drm->dev, res);
+	lcdif->base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(lcdif->base))
 		return PTR_ERR(lcdif->base);
 
diff --git a/drivers/gpu/drm/mxsfb/mxsfb_drv.c b/drivers/gpu/drm/mxsfb/mxsfb_drv.c
index 59020862cf65e5cc488903f1263ed16dfbce06f9..377d4c4c9979ad9538cfec5464827a82936f811b 100644
--- a/drivers/gpu/drm/mxsfb/mxsfb_drv.c
+++ b/drivers/gpu/drm/mxsfb/mxsfb_drv.c
@@ -215,7 +215,6 @@ static int mxsfb_load(struct drm_device *drm,
 {
 	struct platform_device *pdev = to_platform_device(drm->dev);
 	struct mxsfb_drm_private *mxsfb;
-	struct resource *res;
 	int ret;
 
 	mxsfb = devm_kzalloc(&pdev->dev, sizeof(*mxsfb), GFP_KERNEL);
@@ -226,8 +225,7 @@ static int mxsfb_load(struct drm_device *drm,
 	drm->dev_private = mxsfb;
 	mxsfb->devdata = devdata;
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	mxsfb->base = devm_ioremap_resource(drm->dev, res);
+	mxsfb->base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(mxsfb->base))
 		return PTR_ERR(mxsfb->base);
 

-- 
2.48.1


