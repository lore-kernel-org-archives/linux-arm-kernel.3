Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B672C60A2621
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  1 Nov 2026 23:27:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=WS3t3eiK;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=antispam.mailspamprotection.com header.i=@antispam.mailspamprotection.com header.a=rsa-sha256 header.s=default header.b=09XKjYvb;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=valla.it header.i=@valla.it header.a=rsa-sha256 header.s=default header.b=WOtZwsCJ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=LCefTZ3DvEQ/aHEJOq6LQMCUqtge15vKLZo7lvdK1Ww=; b=WS3t3eiK4dqGle
	cvj5LwCH64ZD0BEhaELY737sIHsnXSUdtiqPv04u8Db5vXruIz35im0wJH+1JJMKM5xEwCumfz4QA
	qFz6V+rNYkNdS2LF1RpyqC3SXR46eyB6ftvbWeiGS3PemwG1mw527BzvVxcfDKAY0hdOwv1NJCT4j
	BQkq2EN8VwYb3WmUTb8DwZIfPnbP82YrzniOFurBEHf2yBwNf7FSbQ8u3jl3CHoLckprU1lXGB82k
	l1Eu2NpnkRF0syxWzALkd7YQeN0dHKCzkQj9jvN5ZyzocZZ9kwajCed/e9Yb2ieulRFj4EHY/9qUP
	/GOa0FQJRTqDaN67ey1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNexI-0000000FDr2-1rm7;
	Sun, 01 Nov 2026 23:27:16 +0000
Received: from delivery.antispam.mailspamprotection.com ([185.56.87.9])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNexE-0000000FDmq-0vCX
	for linux-arm-kernel@lists.infradead.org;
	Sun, 01 Nov 2026 23:27:13 +0000
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=outgoing.instance-europe-west4-0kln.prod.antispam.mailspamprotection.com; s=arckey; t=1793575632;
	 b=RdrULOVR9WoHLGo69ZqneTg/csm8kqLTxR4S7Ceq3m14O8HIwMdZJNGC6ajyXvD9xh6Sw8GT0C
	  MKhXENhg3/IDjfoIL+39+rGczIoG/v4oE9AOaTEjEM5rDgpG9mdGTUk0UQN+KPKUy85bx8G1Un
	  ejCk4+c52oPaA+jeffcNKNscVJreDmjepzysMK7LoTLqpncvlJocszEOuMZ8HnCLSYEXAJvHCo
	  3ZsNtP/a8hgrhurUl0wRzY1SyPTYM1CiSJLpK+yMw9SZrMzlYnAKMIhaMlTOiX+HX7BXjRou7f
	  ZTY3fGgoTrSS/lX1JamzYUXCC7mHeIJliOoOm2RD8k46TQ==;
ARC-Authentication-Results: i=1; outgoing.instance-europe-west4-0kln.prod.antispam.mailspamprotection.com; smtp.remote-ip=35.214.173.214;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed; d=outgoing.instance-europe-west4-0kln.prod.antispam.mailspamprotection.com; s=arckey; t=1793575632;
	bh=rRnJ3p3OW5d4ywvmFtgBbw5iNIDfFa2rvLbQuPjzuDM=;
	h=Cc:To:In-Reply-To:References:Message-ID:Content-Transfer-Encoding:
	  Content-Type:MIME-Version:Subject:Date:From:DKIM-Signature:DKIM-Signature;
	b=Bt9iPbBLcInpr/MxmQwa+qkkEF3VYq3DYM8lFRdJir7umAsGxpa1xui/uhA+cR135RzqWzRjE3
	  I90g7zIt1COz76LORuSaZ7oOFlj0wu3S0pH8KsZhBBfoKKlhPpxL7YaN9AiQPn2ilE20TucTGG
	  oaT3IADxf1mhNsQWrHKklRI4rTszjkBkU2FCHR8j6lgC23F2oxPIsKnn+m3O3USGeSeGZhU/vK
	  A6MZIal4SphPP5vlp4M+vonXcJsj7HrsPbELs+1X52V2ciaRl+60D9ztPNjlJZjVv2CjAtbhkS
	  VVmNx1P6jZ5h927kQDNDL+cyx6NTzCwW7aZ3OlssHBpuxw==;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=antispam.mailspamprotection.com; s=default; h=CFBL-Feedback-ID:CFBL-Address
	:Cc:To:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject
	:Date:From:Reply-To:List-Unsubscribe;
	bh=LCefTZ3DvEQ/aHEJOq6LQMCUqtge15vKLZo7lvdK1Ww=; b=09XKjYvbWJ+Uu6uVV3sIxw9sdb
	HsDqWJqQ0H7CHVxNf39ExBE2u5dV67H0lAP2r4/QqqBP3dHodYXAkyk1IeTr0EL52yZHq0wLgrLTZ
	4WzWDNgfPCZjVkouTJYXFqI5bFKnLYgJYaUsxDBLsbdX8uVNaDf5JGXt/sO+h/ZacYMI=;
Received: from 214.173.214.35.bc.googleusercontent.com ([35.214.173.214] helo=esm19.siteground.biz)
	by instance-europe-west4-0kln.prod.antispam.mailspamprotection.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <francesco@valla.it>)
	id 1xNexB-000000075Th-3q53
	for linux-arm-kernel@lists.infradead.org;
	Sun, 01 Nov 2026 23:27:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=valla.it;
	s=default; h=Cc:To:Subject:Date:From:list-help:list-unsubscribe:
	list-subscribe:list-post:list-owner:list-archive;
	bh=LCefTZ3DvEQ/aHEJOq6LQMCUqtge15vKLZo7lvdK1Ww=; b=WOtZwsCJJL/61oMgV7xsVatlWs
	lB0Uv5+HaqJkpbKM7Wmg7A84tx+MgX12p9asCXoOjvGsDVQnIgV/0HCJixk4F+CwfRBFXGN0aquog
	dzwbaly/xmgZ8cG/GSyNlpTnJaQcRjDtIPRjZ4nxHSEPNJGrX/R9jr0uv4EL9sihI+BE=;
Received: from [79.17.15.196] (port=60226 helo=[192.168.178.175])
	by esm19.siteground.biz with essmtpa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <francesco@valla.it>)
	id 1xNex0-000000002I5-0lrl;
	Sun, 01 Nov 2026 23:26:58 +0000
From: Francesco Valla <francesco@valla.it>
Date: Mon, 02 Nov 2026 00:26:42 +0100
Subject: [PATCH RFC v2 05/11] remoteproc: virtio: report
 VIRTIO_F_ACCESS_PLATFORM when required
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261102-remoteproc_virtio_map-v2-5-26b300e01c62@valla.it>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3006; i=francesco@valla.it;
 h=from:subject:message-id; bh=rRnJ3p3OW5d4ywvmFtgBbw5iNIDfFa2rvLbQuPjzuDM=;
 b=owGbwMvMwCX2aH1OUIzHTgbG02pJDFnPT+05v4Clysj2flHs7Mhj7fLsCRYrrFvTPHov9Ms6G
 pSoVM3tKGVhEONikBVTZAlZd+Penrnm39I2MD6CmcPKBDKEgYtTACaiHcvIcKGs1ewaj/U6br61
 UanmB7XPHHJkv8QZ+tDlmsfZz50vOxn+lyReqn75aH6MiqfX9FX2n5mtt+y6uLYjwfVOuYnsmZu
 veAA=
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
X-SGantispam-id: ec9d8e27c7ef11886b6272e761305964
X-AntiAbuse: ID - ec9d8e27c7ef11886b6272e761305964
AntiSpam-DLS: false
AntiSpam-DLSP: 
AntiSpam-DLSRS: 
AntiSpam-TS: 1.0
CFBL-Address: feedback@antispam.mailspamprotection.com; report=arf
CFBL-Feedback-ID: 1xNexB-000000075Th-3q53-feedback@antispam.mailspamprotection.com
Authentication-Results: outgoing.instance-europe-west4-0kln.prod.antispam.mailspamprotection.com;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261101_152712_404192_1A85EC61 
X-CRM114-Status: GOOD (  13.48  )
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

Depending on the driver originating them, data buffers used for virtio
communication can either:

  - already be allocated from the coherent memory area that is
    accessible by the remote processor; this is the case of
    remoteproc-specific virtio devices, i.e., rpmsg and rproc-serial;
  - be allocated from generic kmem, and thus not necessarily accessible
    directly by the remote processor.

In the second case, the DMA APIs can be exploited to obtain a
functional communication, since they will take care of cache maintenance
and - if required - bounce buffering. The VIRTIO_F_ACCESS_PLATFORM
feature flag can be used for this purpose: with it set, the virtio
framework will use the aforementioned DMA APIs to map and unmap buffers.

Bounce buffering will be transparently used in two cases:

  - if the buffer address supplied by the virtio driver is not suitable
    for DMA transfers, or
  - if the reserved memory associated to the vdev is a
    restricted-dma-pool; in this case, *all* buffers will be bounced to
    and from this pool.

With this support in place, any kind of virtio device can be supported
through the remoteproc-virtio transport, at least from a data exchange
standpoint.

Note that remote processors behind an IOMMU need da == pa for the memory
region(s) the buffers are allocated from.

Existing use cases (e.g., rpmsg and virtio-console) are not impacted as
they are explicitly excluded.

Signed-off-by: Francesco Valla <francesco@valla.it>
---
 drivers/remoteproc/remoteproc_virtio.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/remoteproc/remoteproc_virtio.c b/drivers/remoteproc/remoteproc_virtio.c
index f1b362158a9c..1496659ddff9 100644
--- a/drivers/remoteproc/remoteproc_virtio.c
+++ b/drivers/remoteproc/remoteproc_virtio.c
@@ -280,9 +280,14 @@ static u64 rproc_virtio_get_features(struct virtio_device *vdev)
 	 * All non-remoteproc-specific virtio devices are assumed to be
 	 * compliant with virtio specifications 1.x; there is no other method
 	 * to transmit this capability from the remote processor to the host.
+	 *
+	 * Virtio devices that are specific for remoteproc usage take care on
+	 * their own to allocate memory from the device's coherent pool; use
+	 * the DMA APIs for the others through VIRTIO_F_ACCESS_PLATFORM.
 	 */
 	if (!rproc_virtio_rsc_vdev_rproc_specific(rsc))
-		features |= (1ULL << VIRTIO_F_VERSION_1);
+		features |= ((1ULL << VIRTIO_F_VERSION_1) |
+			     (1ULL << VIRTIO_F_ACCESS_PLATFORM));
 
 	return features;
 }
@@ -312,7 +317,8 @@ static int rproc_virtio_finalize_features(struct virtio_device *vdev)
 	features = vdev->features;
 
 	if (!rproc_virtio_rsc_vdev_rproc_specific(rsc))
-		features &= ~(1ULL << VIRTIO_F_VERSION_1);
+		features &= ~((1ULL << VIRTIO_F_VERSION_1) |
+			      (1ULL << VIRTIO_F_ACCESS_PLATFORM));
 
 	if (WARN_ON((u32)vdev->features != features))
 		return -EINVAL;

-- 
2.56.0


