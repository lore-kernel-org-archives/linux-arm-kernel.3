Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7ED960A2617
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  1 Nov 2026 23:27:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=mIS0J3JM;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=antispam.mailspamprotection.com header.i=@antispam.mailspamprotection.com header.a=rsa-sha256 header.s=default header.b=pxcfFgHX;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=valla.it header.i=@valla.it header.a=rsa-sha256 header.s=default header.b=grsQDMZy
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=FfwL6drZ99UrcF24Kp7YaRAGdi4Rekl9jNQ/vwE9JDo=; b=mIS0J3JMxePlZm
	wYxDuKqkEQ7u/LfSCnTISD7bx9M7k0h//A8MRo+uqGfWxFOMYdUfvFftZ+zABSLTBvP56aXigB3sa
	jk7sdFeXy0mF0zXfIgGbiad0cj5odPpWEEqKhiPemA6mKk9etvBN5dEe67I++DEyFiyXRjdw/H/65
	HPuMTNFzwNDBL8nrqQ48OvDTDY9akzzm/GSMdAomFcjVfVhlL93ZKTr/7XJRrVX0iFuMj4wspCuPy
	cR7KPKZazl7jMErhs2rU0F6DexrFcOAAakGa2WNparpqTTQAd2XV/E1kROIbFpAPELYBVfNRosMhx
	D60rw2yWSsT4Ali7hw7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNexI-0000000FDsA-3yAv;
	Sun, 01 Nov 2026 23:27:16 +0000
Received: from delivery.antispam.mailspamprotection.com ([185.56.87.5])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNexF-0000000FDnY-12OH
	for linux-arm-kernel@lists.infradead.org;
	Sun, 01 Nov 2026 23:27:14 +0000
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=outgoing.instance-europe-west4-nzm1.prod.antispam.mailspamprotection.com; s=arckey; t=1793575633;
	 b=x3BfulKKhhCCHwfjrf+SpDStl9pJr53Y39hs+6sMCgbzGlHA9du/LPZPX4249td1RzoUpKXA/u
	  yfbPYBLTifil5/TooSexas+xwPAF86VgoRMtfHb/ZAKESQ0tZV92BJGBq6E1YE0xDsvL96xVv6
	  m8uA36aWybMtYoms27m43K7mtpYaF2nvFKtMcOCzOJ2LSI6E44kGfHEqkmO1pR7flkrUANg8kA
	  a92gcgSCevG4D/50qxH6RjQtV04rAGgWrxjpipK9W4aqFiMftoIi3ykoeu0OJqvMgV3BPzST+8
	  nPLvpOXuMRdFn44TO8vmd6j0sJAndCvVb0iKUUe8IG6VFA==;
ARC-Authentication-Results: i=1; outgoing.instance-europe-west4-nzm1.prod.antispam.mailspamprotection.com; smtp.remote-ip=35.214.173.214;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed; d=outgoing.instance-europe-west4-nzm1.prod.antispam.mailspamprotection.com; s=arckey; t=1793575633;
	bh=Rg3NHiv996Ou/uVsQGsnX1PIitVPLmwkUdij4t7Mly8=;
	h=Cc:To:In-Reply-To:References:Message-ID:Content-Transfer-Encoding:
	  Content-Type:MIME-Version:Subject:Date:From:DKIM-Signature:DKIM-Signature;
	b=lgd4p78xU1o+aqD8DHtRIyfAvGKNvCoFAf3R0xFsB1e3w3su9vZBYR7PgAMROALlfYOvpWwlOK
	  JPOnBVmmSCMTOddAvS8pTCUy+XXi7365/Fa//zZ20HKc1pv7a+VFfuR0E8EQ5k6hRTug11Zloj
	  gwmcbQjHCtmaOi+KTaWBm9gaVZZH/XnUUD3SnhOfmm/bPL4DXHVK9yYtX7VTlo1MBywP9fdA8x
	  7v3ffFS4lz18qUEWGrfCWKNewMZPasDtDq4WicdU8fWguW6CkRyZK5lPZCJ2ZzXeTAXkR1OMPc
	  1A5CszsfRkJKmAiRvEjISyRf/xnt+h1DuRdkWXXbWNn0Ug==;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=antispam.mailspamprotection.com; s=default; h=CFBL-Feedback-ID:CFBL-Address
	:Cc:To:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject
	:Date:From:Reply-To:List-Unsubscribe;
	bh=FfwL6drZ99UrcF24Kp7YaRAGdi4Rekl9jNQ/vwE9JDo=; b=pxcfFgHXa3FYxM5N6/u6005dOw
	8SMFfrpFqa8+5oSu8X9x/fTf6QNUmArlnEwcRpqOlgde1B8JQpSs6FavtvpArwi75Z0nZggi+4lk5
	rSKqOBecWz/Hb4RBqHsdeeOEUNvUskmCdtfLDLT5CkjAO8heBTNxzo21/G6Ytix6vcWk=;
Received: from 214.173.214.35.bc.googleusercontent.com ([35.214.173.214] helo=esm19.siteground.biz)
	by instance-europe-west4-nzm1.prod.antispam.mailspamprotection.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <francesco@valla.it>)
	id 1xNexC-00000007Aep-3pMk
	for linux-arm-kernel@lists.infradead.org;
	Sun, 01 Nov 2026 23:27:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=valla.it;
	s=default; h=Cc:To:Subject:Date:From:list-help:list-unsubscribe:
	list-subscribe:list-post:list-owner:list-archive;
	bh=FfwL6drZ99UrcF24Kp7YaRAGdi4Rekl9jNQ/vwE9JDo=; b=grsQDMZyuo295cS/AatEIltcsZ
	gIq+4tQBOR2b3XY4ay5NUD2sryA4SPrciSnrmRLl1SvX/f1oXFwddxnz1GKsLtWF0dJiec+my6YbD
	R8lDFlJU0IUrMResVEwN4QIMrNPGaEZl9C2BeoSXpnDtuDgrYgPrubohfZ7iRhrLPE8c=;
Received: from [79.17.15.196] (port=60226 helo=[192.168.178.175])
	by esm19.siteground.biz with essmtpa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <francesco@valla.it>)
	id 1xNewy-000000002I5-21Gt;
	Sun, 01 Nov 2026 23:26:56 +0000
From: Francesco Valla <francesco@valla.it>
Date: Mon, 02 Nov 2026 00:26:40 +0100
Subject: [PATCH RFC v2 03/11] remoteproc: virtio: support dynamic number of
 vrings
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261102-remoteproc_virtio_map-v2-3-26b300e01c62@valla.it>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5391; i=francesco@valla.it;
 h=from:subject:message-id; bh=Rg3NHiv996Ou/uVsQGsnX1PIitVPLmwkUdij4t7Mly8=;
 b=owGbwMvMwCX2aH1OUIzHTgbG02pJDFnPT+2ZMD34aojLK7lNmbPPe/44Jvnj+Jb0L3YWT2s2N
 qneTTBT6yhlYRDjYpAVU2QJWXfj3p655t/SNjA+gpnDygQyhIGLUwAmotDI8E/d1Et59hybD+uW
 zv1sN+nfyjvprkVaRuuSTm1Y4Hzbfss5hn+mW//1xnokp6ziLZBuMI+afumjC/eMKFE588lFRwN
 LL3MBAA==
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
X-SGantispam-id: 846411db5110a6f79e32ac08ad8df725
X-AntiAbuse: ID - 846411db5110a6f79e32ac08ad8df725
AntiSpam-DLS: false
AntiSpam-DLSP: 
AntiSpam-DLSRS: 
AntiSpam-TS: 1.0
CFBL-Address: feedback@antispam.mailspamprotection.com; report=arf
CFBL-Feedback-ID: 1xNexC-00000007Aep-3pMk-feedback@antispam.mailspamprotection.com
Authentication-Results: outgoing.instance-europe-west4-nzm1.prod.antispam.mailspamprotection.com;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261101_152713_465736_D6D810F1 
X-CRM114-Status: GOOD (  19.48  )
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

The number of vrings for each vdev has been fixed to 2 since the
introduction of multi-vdev support [1]; this is completely fine for the
rpmsg usecase, but can conflict with other virtio devices (CAN for
example requires 3 virtqueues, entropy only 1, network a variable number
and so on).

Remove the static vring allocation, transforming it to a flex array that
is allocated at vdev probe time; for the existing usecases (i.e.: mainly
rpmsg) this leads to no functional change, except the additional memory
used for the counter associated to the new array.

The maximum number of virtqueues is limited to 255 due to the u8 value
used inside the resource table to indicate the number of vring to
allocate; for this reason, no additional plausibility check is performed
on the number of vrings indicated by the resource table.

This also fixes the single virtqueue usecase, which was apparently
supported also before but for which the remove action caused an error
(because the remove action was trying to unmap also the second vring,
which was in fact not mapped).

[1] https://lore.kernel.org/all/1330589497-4139-5-git-send-email-ohad@wizery.com/

Signed-off-by: Francesco Valla <francesco@valla.it>
---
 drivers/remoteproc/remoteproc_core.c   |  7 -------
 drivers/remoteproc/remoteproc_virtio.c | 12 ++++++------
 include/linux/remoteproc.h             | 10 ++++------
 3 files changed, 10 insertions(+), 19 deletions(-)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index 23f8539a99bd..c946ecd980a5 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -473,7 +473,6 @@ static int rproc_handle_vdev(struct rproc *rproc, void *ptr,
 {
 	struct fw_rsc_vdev *rsc = ptr;
 	struct device *dev = &rproc->dev;
-	struct rproc_vdev *rvdev;
 	size_t rsc_size;
 	struct rproc_vdev_data rvdev_data;
 	struct platform_device *pdev;
@@ -494,12 +493,6 @@ static int rproc_handle_vdev(struct rproc *rproc, void *ptr,
 	dev_dbg(dev, "vdev rsc: id %d, dfeatures 0x%x, cfg len %d, %d vrings\n",
 		rsc->id, rsc->dfeatures, rsc->config_len, rsc->num_of_vrings);
 
-	/* we currently support only two vrings per rvdev */
-	if (rsc->num_of_vrings > ARRAY_SIZE(rvdev->vring)) {
-		dev_err(dev, "too many vrings: %d\n", rsc->num_of_vrings);
-		return -EINVAL;
-	}
-
 	rvdev_data.id = rsc->id;
 	rvdev_data.index = rproc->nb_vdev++;
 	rvdev_data.rsc_offset = offset;
diff --git a/drivers/remoteproc/remoteproc_virtio.c b/drivers/remoteproc/remoteproc_virtio.c
index 29a3a4c18097..c56d3330adfe 100644
--- a/drivers/remoteproc/remoteproc_virtio.c
+++ b/drivers/remoteproc/remoteproc_virtio.c
@@ -135,8 +135,7 @@ static struct virtqueue *rp_find_vq(struct virtio_device *vdev,
 	void *addr;
 	int num, size;
 
-	/* we're temporarily limited to two virtqueues per rvdev */
-	if (id >= ARRAY_SIZE(rvdev->vring))
+	if (id >= rvdev->num_vrings)
 		return ERR_PTR(-EINVAL);
 
 	if (!name)
@@ -510,13 +509,16 @@ static int rproc_virtio_probe(struct platform_device *pdev)
 	if (!rvdev_data)
 		return -EINVAL;
 
-	rvdev = devm_kzalloc(dev, sizeof(*rvdev), GFP_KERNEL);
+	rsc = rvdev_data->rsc;
+
+	rvdev = devm_kzalloc_flex(dev, *rvdev, vring, rsc->num_of_vrings);
 	if (!rvdev)
 		return -ENOMEM;
 
 	rvdev->id = rvdev_data->id;
 	rvdev->rproc = rproc;
 	rvdev->index = rvdev_data->index;
+	rvdev->num_vrings = rsc->num_of_vrings;
 
 	ret = copy_dma_range_map(dev, rproc->dev.parent);
 	if (ret)
@@ -534,8 +536,6 @@ static int rproc_virtio_probe(struct platform_device *pdev)
 	platform_set_drvdata(pdev, rvdev);
 	rvdev->pdev = pdev;
 
-	rsc = rvdev_data->rsc;
-
 	/* parse the vrings */
 	for (i = 0; i < rsc->num_of_vrings; i++) {
 		ret = rproc_parse_vring(rvdev, rsc, i);
@@ -586,7 +586,7 @@ static void rproc_virtio_remove(struct platform_device *pdev)
 	struct rproc_vring *rvring;
 	int id;
 
-	for (id = 0; id < ARRAY_SIZE(rvdev->vring); id++) {
+	for (id = 0; id < rvdev->num_vrings; id++) {
 		rvring = &rvdev->vring[id];
 		rproc_free_vring(rvring);
 	}
diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
index 00019b1895e6..52e1eccbe42e 100644
--- a/include/linux/remoteproc.h
+++ b/include/linux/remoteproc.h
@@ -322,10 +322,6 @@ struct rproc_subdev {
 	void (*unprepare)(struct rproc_subdev *subdev);
 };
 
-/* we currently support only two vrings per rvdev */
-
-#define RVDEV_NUM_VRINGS 2
-
 /**
  * struct rproc_vring - remoteproc vring state
  * @va:	virtual address
@@ -353,9 +349,10 @@ struct rproc_vring {
  * @id: virtio device id (as in virtio_ids.h)
  * @node: list node
  * @rproc: the rproc handle
- * @vring: the vrings for this vdev
  * @rsc_offset: offset of the vdev's resource entry
  * @index: vdev position versus other vdev declared in resource table
+ * @num_vrings: the number of vrings for this vdev
+ * @vring: the vrings for this vdev
  */
 struct rproc_vdev {
 	struct rproc_subdev subdev;
@@ -364,9 +361,10 @@ struct rproc_vdev {
 	unsigned int id;
 	struct list_head node;
 	struct rproc *rproc;
-	struct rproc_vring vring[RVDEV_NUM_VRINGS];
 	u32 rsc_offset;
 	u32 index;
+	unsigned int num_vrings;
+	struct rproc_vring vring[] __counted_by(num_vrings);
 };
 
 struct rproc *rproc_get_by_phandle(phandle phandle);

-- 
2.56.0


