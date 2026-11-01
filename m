Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74DE2606A332
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  1 Nov 2026 23:27:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=epTlOHcO;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=antispam.mailspamprotection.com header.i=@antispam.mailspamprotection.com header.a=rsa-sha256 header.s=default header.b=ZGFXA6FJ;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=valla.it header.i=@valla.it header.a=rsa-sha256 header.s=default header.b=YupPTfRZ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=aNNfCoQazdT0MtZCzmoXCNf2o8qmZ8Ept3HPzeF2fxY=; b=epTlOHcOQJ1G1U
	WMwXFUZc0ru3JcK/J8vRBVlM6d6LlfnHSm5TU2GgokgTU9nieiObY2PucPNVOVnymFqY6i8okVz3Z
	G7vgjn192wK4w5z3cvmH2i4MA2XpzMIWS4Ua9qoR42yxo7f3emyUB549jarVR0+8t48y3y6cn4vOy
	fQQyz5TygTzSLJSY/8uuEbqALMDaq2kiBTYGvHtrVmCCK5GRHNro95Sn4OlyFgZsbXjSvmVR8w98a
	RXG1hPaHqM7mj22gmm78uJXqrTDgnOznLWSQzpjUaomW3e1+L1VQfEJnoY0HoTC0dPPJbowrGT/J9
	nDJt0JcBqe0Bhk3i+U7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNexJ-0000000FDt2-17VI;
	Sun, 01 Nov 2026 23:27:17 +0000
Received: from delivery.antispam.mailspamprotection.com ([185.56.87.0])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNexF-0000000FDnz-1pFm
	for linux-arm-kernel@lists.infradead.org;
	Sun, 01 Nov 2026 23:27:14 +0000
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=outgoing.instance-europe-west4-xdd7.prod.antispam.mailspamprotection.com; s=arckey; t=1793575633;
	 b=Yd4RG3vlF2KgxIEV4+PEgqEuHLZEU4MKHRYuBN0GK6ejhYVPmzcO26uV3YWN0yBILOn3Jw8jxu
	  yyyBkmgQXcsyUsAZxWCIStS6EthIIV3FyFsEtjJ6M7o5DH5/BGOVjsT1ggBVULMVXVmE4tESWf
	  kxqBHA9dl3fgK2thaGYpD/1Kbk90U8fzMqJbV41bmeK/ZJxlw4f6CAL6Fdnz0gc+7e2c7h98hy
	  R8bhpY1aPcsqS+Q29ikcKRHm0mhNLXJOR0XLnXxDsPeLr9PUlgOybWw8YPd1DJIVxYwPxuOvdl
	  KqN1j4Q5mayAiXe3DS9qnRoegajO1uPJjha1NAHwZyXNxQ==;
ARC-Authentication-Results: i=1; outgoing.instance-europe-west4-xdd7.prod.antispam.mailspamprotection.com; smtp.remote-ip=35.214.173.214;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed; d=outgoing.instance-europe-west4-xdd7.prod.antispam.mailspamprotection.com; s=arckey; t=1793575633;
	bh=xatSadXWCSV3dUAsA50Tri4B+LJCWP78e+HrJZJMlOc=;
	h=Cc:To:In-Reply-To:References:Message-ID:Content-Transfer-Encoding:
	  Content-Type:MIME-Version:Subject:Date:From:DKIM-Signature:DKIM-Signature;
	b=JmbYz7In97xHudcwLBF1e5Lnfytx1xoqaRqnUeR2JoqDi3kFMIhTTgYa0KgKiT1TozXt5/fiUj
	  hDI2km+NW4t8xlPutZRFG0/afoW+hmQGw4Q4+QExqSCjGKVcoXmOXI0+OA5u+v+EMowxk9pUXz
	  8RASHzvx4RYnb51mHlrrTHXDj2mrWirZgcANZj6BsfqqPHobTAt5RJ1qpyjM9nHMuDTepxp/U3
	  Cj2/jFLbrHpZ4gNyzwWueJx+5DRCWrn/Gl09U+PjleH290ftRMysC3359w7og81xkxAY1JCHJD
	  kfXSJFwoTvvc8szZwQ8nQHGDnKBHSDvKwwiu4quPi6RHfw==;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=antispam.mailspamprotection.com; s=default; h=CFBL-Feedback-ID:CFBL-Address
	:Cc:To:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject
	:Date:From:Reply-To:List-Unsubscribe;
	bh=aNNfCoQazdT0MtZCzmoXCNf2o8qmZ8Ept3HPzeF2fxY=; b=ZGFXA6FJlfpzmQNUCwEHK5CxNs
	7IwUwfMSS5AQIS6m+bmdUagrMbYOOLFAu2OkuOIscS7epdK7oPqph2OFCGbC60jF9SO8ygRxKmJSC
	oOvmn5H9zcjGLvw3fARLNw2C5DPJOEhw6G1yRtfPMpcGZW4RVGNSOF6Fa63GgMk7Jr58=;
Received: from 214.173.214.35.bc.googleusercontent.com ([35.214.173.214] helo=esm19.siteground.biz)
	by instance-europe-west4-xdd7.prod.antispam.mailspamprotection.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <francesco@valla.it>)
	id 1xNexD-00000005hte-1GeG
	for linux-arm-kernel@lists.infradead.org;
	Sun, 01 Nov 2026 23:27:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=valla.it;
	s=default; h=Cc:To:Subject:Date:From:list-help:list-unsubscribe:
	list-subscribe:list-post:list-owner:list-archive;
	bh=aNNfCoQazdT0MtZCzmoXCNf2o8qmZ8Ept3HPzeF2fxY=; b=YupPTfRZ+RXBcylV7y62J43u/r
	jtVMXKCefGX0Bp6UYKCxbUG7izHxc4AVeJXOyIAeq0Ps4ogfZUB8svkGtEDbMX/7bgyrEfnMdczFM
	lr83Imq0hB4ZxbF8RadKF4nXcoMIXt6bPi4cXEevvCI2tn1x05BD/PBYB3KVA8Q8mABM=;
Received: from [79.17.15.196] (port=60226 helo=[192.168.178.175])
	by esm19.siteground.biz with essmtpa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <francesco@valla.it>)
	id 1xNewz-000000002I5-1OkY;
	Sun, 01 Nov 2026 23:26:57 +0000
From: Francesco Valla <francesco@valla.it>
Date: Mon, 02 Nov 2026 00:26:41 +0100
Subject: [PATCH RFC v2 04/11] remoteproc: report VIRTIO_F_VERSION_1 for
 non-rproc-specific vdevs
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261102-remoteproc_virtio_map-v2-4-26b300e01c62@valla.it>
References: <20261102-remoteproc_virtio_map-v2-0-26b300e01c62@valla.it>
In-Reply-To: <20261102-remoteproc_virtio_map-v2-0-26b300e01c62@valla.it>
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, Kees Cook <kees@kernel.org>, 
 "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Francesco Valla <francesco@valla.it>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>
Cc: Robin Murphy <robin.murphy@arm.com>, linux-remoteproc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-doc@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=3487; i=francesco@valla.it;
 h=from:subject:message-id; bh=xatSadXWCSV3dUAsA50Tri4B+LJCWP78e+HrJZJMlOc=;
 b=owGbwMvMwCX2aH1OUIzHTgbG02pJDFnPT+1J1+2XTmBMtxPQPXLjdnWXpN1SDaHaoP3BW7b7q
 R+/a1TfUcrCIMbFICumyBKy7sa9PXPNv6VtYHwEM4eVCWQIAxenAExEUJfhv2evXbr1pcW3L7J9
 6Z5wUyHsxf01s6Pnt20+fubZHqejbg8Y/hlxNW/Zu3Hvo40nPwfFbnvPLdnseO2LZHjN+u1cR6O
 3RXABAA==
X-Developer-Key: i=francesco@valla.it; a=openpgp;
 fpr=CC70CBC9AA13257C6CCED8669601767CA07CA0EA
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - esm19.siteground.biz
X-AntiAbuse: Original Domain - lists.infradead.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - valla.it
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-SGantispam-id: 1e5da29330c71a937f11bf3c4129fa23
X-AntiAbuse: ID - 1e5da29330c71a937f11bf3c4129fa23
AntiSpam-DLS: false
AntiSpam-DLSP: 
AntiSpam-DLSRS: 
AntiSpam-TS: 1.0
CFBL-Address: feedback@antispam.mailspamprotection.com; report=arf
CFBL-Feedback-ID: 1xNexD-00000005hte-1GeG-feedback@antispam.mailspamprotection.com
Authentication-Results: outgoing.instance-europe-west4-xdd7.prod.antispam.mailspamprotection.com;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261101_152713_712252_7AF494A5 
X-CRM114-Status: GOOD (  14.46  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

There is currently no way to report the VIRTIO_F_VERSION_1 using the
resource table alone, as the per-vdev feature array is limited to 32
bits.

Considering that the VIRTIO 1.0 specification is now ~10 years old,
always report the VIRTIO_F_VERSION_1 feature for virtio devices that
are not specific for remoteproc usage. These latter, which as of today
are rpmsg and rproc-serial, are excluded to avoid impacting the existing
usecases, since VIRTIO_F_VERSION_1 changes the semantics of the
communication (e.g., the configuration space is assumed to be
little-endian rather than follow the device's endianness).

While at it, replace BUG_ON() with WARN_ON() and return an appropriate
error in case of features that would overflow the 32 bits limit.

Signed-off-by: Francesco Valla <francesco@valla.it>
---
 drivers/remoteproc/remoteproc_virtio.c | 28 +++++++++++++++++++++++++---
 1 file changed, 25 insertions(+), 3 deletions(-)

diff --git a/drivers/remoteproc/remoteproc_virtio.c b/drivers/remoteproc/remoteproc_virtio.c
index c56d3330adfe..f1b362158a9c 100644
--- a/drivers/remoteproc/remoteproc_virtio.c
+++ b/drivers/remoteproc/remoteproc_virtio.c
@@ -16,6 +16,7 @@
 #include <linux/of_reserved_mem.h>
 #include <linux/platform_device.h>
 #include <linux/remoteproc.h>
+#include <linux/rsc_table.h>
 #include <linux/virtio.h>
 #include <linux/virtio_config.h>
 #include <linux/virtio_ids.h>
@@ -27,6 +28,11 @@
 
 #include "remoteproc_internal.h"
 
+static bool rproc_virtio_rsc_vdev_rproc_specific(struct fw_rsc_vdev *rsc)
+{
+	return (rsc->id == VIRTIO_ID_RPMSG || rsc->id == VIRTIO_ID_RPROC_SERIAL);
+}
+
 static int copy_dma_range_map(struct device *to, struct device *from)
 {
 	const struct bus_dma_region *map = from->dma_range_map, *new_map, *r;
@@ -268,8 +274,17 @@ static void rproc_virtio_synchronize_cbs(struct virtio_device *vdev)
 static u64 rproc_virtio_get_features(struct virtio_device *vdev)
 {
 	struct fw_rsc_vdev *rsc = vdev_to_rsc(vdev);
+	u64 features = (u64)rsc->dfeatures;
 
-	return rsc->dfeatures;
+	/*
+	 * All non-remoteproc-specific virtio devices are assumed to be
+	 * compliant with virtio specifications 1.x; there is no other method
+	 * to transmit this capability from the remote processor to the host.
+	 */
+	if (!rproc_virtio_rsc_vdev_rproc_specific(rsc))
+		features |= (1ULL << VIRTIO_F_VERSION_1);
+
+	return features;
 }
 
 static void rproc_transport_features(struct virtio_device *vdev)
@@ -285,6 +300,7 @@ static void rproc_transport_features(struct virtio_device *vdev)
 static int rproc_virtio_finalize_features(struct virtio_device *vdev)
 {
 	struct fw_rsc_vdev *rsc = vdev_to_rsc(vdev);
+	u64 features;
 
 	/* Give virtio_ring a chance to accept features */
 	vring_transport_features(vdev);
@@ -292,8 +308,14 @@ static int rproc_virtio_finalize_features(struct virtio_device *vdev)
 	/* Give virtio_rproc a chance to accept features. */
 	rproc_transport_features(vdev);
 
-	/* Make sure we don't have any features > 32 bits! */
-	BUG_ON((u32)vdev->features != vdev->features);
+	/* Make sure we don't have any features > 32 bits except the expected ones. */
+	features = vdev->features;
+
+	if (!rproc_virtio_rsc_vdev_rproc_specific(rsc))
+		features &= ~(1ULL << VIRTIO_F_VERSION_1);
+
+	if (WARN_ON((u32)vdev->features != features))
+		return -EINVAL;
 
 	/*
 	 * Remember the finalized features of our vdev, and provide it

-- 
2.56.0


