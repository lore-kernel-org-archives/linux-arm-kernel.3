Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B71A0606A33B
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  1 Nov 2026 23:27:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=O2Epl7vw;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=antispam.mailspamprotection.com header.i=@antispam.mailspamprotection.com header.a=rsa-sha256 header.s=default header.b=nlm0C9VM;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=valla.it header.i=@valla.it header.a=rsa-sha256 header.s=default header.b=kP9Orr70
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=+qT0M4hF3EpI3J8XMmC6HVsCM7bNb8jZ8T3SzWLo+IU=; b=O2Epl7vwEAeOWM
	Ith5K0hRKVZsZxRJFklZCW6p0HIbEGE4AYSbUs2ZYD3QtAuDsW1bgshu/SMOw2CdxAkf1P1suJcr+
	X84U31KXZBBOcWgARzikxgPki6w7uGxeSsEb1NNnWn9MHDqAefCa/39UIE+7jR3K50Is0PQ2XF5Lc
	9lu4UcQ6o/Q4jK+l4ShFeO/03CA9w5XJ8g1eCJlku/x5Fzfv66j2k8wNj0+zF1pkdhTSJ1wgvPUgH
	NjgwpiSLuoJS3PsRggtG4nY8GIeL4NkLqcWx/ZghDTBaB5RVO+sc7qS+T4wlSiR6bReY9rJM2k+ja
	PF4k73bdiFmQ5uk+RwfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNexM-0000000FDyc-13aX;
	Sun, 01 Nov 2026 23:27:20 +0000
Received: from delivery.antispam.mailspamprotection.com ([185.56.87.5])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNexJ-0000000FDqq-0BKU
	for linux-arm-kernel@lists.infradead.org;
	Sun, 01 Nov 2026 23:27:18 +0000
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=outgoing.instance-europe-west4-nzm1.prod.antispam.mailspamprotection.com; s=arckey; t=1793575636;
	 b=hWzDCpKhlcUtduPZWwvbPwRnYfro4EnCKw+H3R2i1m36TuRCjurU3bnJuvCB8Nd8E1MlqDptDF
	  dQYHVR/8RE9btZOjbMylAhz16SWC73HB3bJzKzUjySmzaobxGXNAc6L+4Be3N++S+/OzTK5XKt
	  7F6fc9/Uh9R94N3n6vPBvIAtx1IOp9sD3z3eQSIbHqZMVgS4rJaLJU7ndTWDRYZNsk5c36xzGO
	  1yBdoQZVpfwQYLKvtZI/hbNtbf8vmmSkvDXppAIymn74jCesuq57G/miNMtNm5ZzZ5dljcFQzZ
	  cXuidnfKV02FMtG0WmiiJxzaNKBrYYi20EFLMKtlxF3WPg==;
ARC-Authentication-Results: i=1; outgoing.instance-europe-west4-nzm1.prod.antispam.mailspamprotection.com; smtp.remote-ip=35.214.173.214;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed; d=outgoing.instance-europe-west4-nzm1.prod.antispam.mailspamprotection.com; s=arckey; t=1793575636;
	bh=05qxmrdLaWrLNeONtEiAaIQpCdfThsWTWZ28C6CrHTk=;
	h=Cc:To:In-Reply-To:References:Message-ID:Content-Transfer-Encoding:
	  Content-Type:MIME-Version:Subject:Date:From:DKIM-Signature:DKIM-Signature;
	b=Dl1FANvEY4MWoWllI5GmuszCTCI7mPcSTb4E72ztTf+oljgyucEb6QkdwfEaKrjKOjgU9cv3vU
	  5rv3Qy/TXR8lA6l7cimZCXEwnbvDNdO6fCB+gf/QR9+lPndEEwii4RqKIBGTQs3+SmeWcbWJQQ
	  2RHlHYcpm7c6EW7FtM5ZoLC4fhEag+ri6mO46QZ+xkpbz895syIj9WI88CjxuLxSOFO/2fkdaL
	  RhxP7yiOXPfv8poArikYWOy1/Ko3C4XufUFfrmt+lXTC17TkBWUHSnjOwxbT6JiGIYAhL0YoKD
	  BF14ELF/ec/qG4xPqyhfIBP7MNV4InECe1z0DwEctVgMuQ==;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=antispam.mailspamprotection.com; s=default; h=CFBL-Feedback-ID:CFBL-Address
	:Cc:To:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject
	:Date:From:Reply-To:List-Unsubscribe;
	bh=+qT0M4hF3EpI3J8XMmC6HVsCM7bNb8jZ8T3SzWLo+IU=; b=nlm0C9VMTG4cBo7QKOZi949hAb
	oCbRZGZKrKP2obqGeoZMr8zj+ud9LtVaAL0lXpcYUWyZAdOULB9reO/SnI0/g7htMq3JoMseWD2S5
	eX4cVE+rw7LiHMVKTdhPAvm29K0gwNIDnHJv2r3B5Mh8KV9aps8tsK5vEtEFAlRLBF6A=;
Received: from 214.173.214.35.bc.googleusercontent.com ([35.214.173.214] helo=esm19.siteground.biz)
	by instance-europe-west4-nzm1.prod.antispam.mailspamprotection.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <francesco@valla.it>)
	id 1xNexG-00000007AiR-3nLG
	for linux-arm-kernel@lists.infradead.org;
	Sun, 01 Nov 2026 23:27:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=valla.it;
	s=default; h=Cc:To:Subject:Date:From:list-help:list-unsubscribe:
	list-subscribe:list-post:list-owner:list-archive;
	bh=+qT0M4hF3EpI3J8XMmC6HVsCM7bNb8jZ8T3SzWLo+IU=; b=kP9Orr7055HiCxFq6e9c+5HXYF
	R+2NxasF5YU3E3+XQYhLXpnNVXowsSe11Fb4DEHmpAmr6XIYxXYblrwOkNqYaExIXwe3mJQxOzxAX
	SXjWVJkCavg2GLkDPqX+jz2r5mMeef5Wscg2/DUmeCi0EsvYcxpszmOyBcGDGAw2IrX0=;
Received: from [79.17.15.196] (port=60226 helo=[192.168.178.175])
	by esm19.siteground.biz with essmtpa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <francesco@valla.it>)
	id 1xNex2-000000002I5-3346;
	Sun, 01 Nov 2026 23:27:00 +0000
From: Francesco Valla <francesco@valla.it>
Date: Mon, 02 Nov 2026 00:26:45 +0100
Subject: [PATCH RFC v2 08/11] Documentation: remoteproc: expand virtio
 support section
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261102-remoteproc_virtio_map-v2-8-26b300e01c62@valla.it>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=6416; i=francesco@valla.it;
 h=from:subject:message-id; bh=05qxmrdLaWrLNeONtEiAaIQpCdfThsWTWZ28C6CrHTk=;
 b=owGbwMvMwCX2aH1OUIzHTgbG02pJDFnPT+2pMJw3WeC50aUWsYfunwwabAS+xy2cPsN6gUSh0
 F2Fz+IxHaUsDGJcDLJiiiwh627c2zPX/FvaBsZHMHNYmUCGMHBxCsBEausZGc4+23OpO2tC/Xnz
 eeFbN9o9FTKsV/XZfdH+kfiC3NnNG2cx/FPek+yY8/Vjjnex/L4FnB95JzB3fpi0+qGt+GKPatu
 bFYwA
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
X-SGantispam-id: 1c82b8b3e107742dd211905dfe26bb48
X-AntiAbuse: ID - 1c82b8b3e107742dd211905dfe26bb48
AntiSpam-DLS: false
AntiSpam-DLSP: 
AntiSpam-DLSRS: 
AntiSpam-TS: 1.0
CFBL-Address: feedback@antispam.mailspamprotection.com; report=arf
CFBL-Feedback-ID: 1xNexG-00000007AiR-3nLG-feedback@antispam.mailspamprotection.com
Authentication-Results: outgoing.instance-europe-west4-nzm1.prod.antispam.mailspamprotection.com;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261101_152717_329527_5FA5A8EE 
X-CRM114-Status: GOOD (  21.05  )
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

Expand the section on virtio support over remoteproc with details on
memory allocation setup and constraints.

Signed-off-by: Francesco Valla <francesco@valla.it>
---
 Documentation/staging/remoteproc.rst | 99 +++++++++++++++++++++++++++++++++++-
 1 file changed, 98 insertions(+), 1 deletion(-)

diff --git a/Documentation/staging/remoteproc.rst b/Documentation/staging/remoteproc.rst
index c117b060e76c..4b42ed582fb4 100644
--- a/Documentation/staging/remoteproc.rst
+++ b/Documentation/staging/remoteproc.rst
@@ -354,7 +354,104 @@ it supports. A firmware may support any number of virtio devices, and
 of any type (a single remote processor can also easily support several
 rpmsg virtio devices this way, if desired).
 
+Memory carveouts
+----------------
+
+For a virtio device at position ``X`` among the RSC_VDEV resources declared by
+the resource table, the remoteproc framework will search for memory carveouts
+for:
+
+* all the vrings the specific virtio device requires (as ``vdevXvringY``);
+* the memory area to allocate communication buffers from (as ``vdevXbuffer``).
+
+The carveouts can be provided by the remote processor itself as RSC_CARVEOUT
+resources inside the resource table and/or supplied by the remoteproc driver
+and will be indexed by their name.
+If a carveout with the same name is provided through both means, the one
+supplied by the remote processor should be marked as dynamically allocable,
+i.e., with the device address set to ``FW_RSC_ADDR_ANY`` (-1).
+
+If a ``vdevXvringY`` carveout is not provided, the remoteproc framework will
+try to allocate it using dma_alloc_coherent(), which will resort to allocate it
+either from the first ``restricted-dma-pool`` region associated to the virtio
+device's parent (i.e., the remote processor device), if present, or the global
+DMA pool.
+
+.. WARNING::
+
+    This fallback mechanism can result in a vring being allocated using a
+    ``vdevXbuffer`` area meant for another vdev, so a particular care shall be
+    adopted when defining the carveouts. In particular, ``restricted-dma-pool``
+    memory regions should be specified inside the virtio device's devicetree
+    nodes and not attached to the parent remote processor.
+
+If a ``vdevXbuffer`` carveout is not provided, the remoteproc framework will
+use the memory region declared by the virtio device's own devicetree node (see
+Documentation/devicetree/bindings/remoteproc/remoteproc-virtio.yaml), if any.
+Otherwise, it will try to replace it with the first memory region (of any type)
+associated to the virtio device's parent (i.e., the remote processor device);
+if no such memory region is present, it will be replaced with the global DMA
+pool.
+
+If both a ``vdevXbuffer`` carveout and a memory region inside the virtio
+device's devicetree node are present, the carveout takes precedence and the
+memory region is ignored.
+
+Declaring the memory region inside the virtio device's devicetree node is the
+preferred method for ``restricted-dma-pool`` regions, since listing them among
+the memory regions of the remote processor device would make the first of them
+the (forced) bounce buffer for the remote processor device itself as well.
+
+Buffer allocation
+-----------------
+
+There are different kinds of buffer allocation scenarios:
+
+* if the remote processor can access the whole DMA memory area of the host, no
+  special arrangement needs to be performed, since either the drivers (in case
+  of rpmsg and rproc-serial devices) or the DMA APIs (in case of any other
+  virtio device type) will take care of any necessary translation;
+* if the remote processor has limited access to the host memory space, for
+  example because of a different addressing scheme or for memory isolation
+  constraints, the memory reserved for buffer allocation shall be selected
+  depending on the virtio device type:
+
+  - for rpmsg and rproc-serial devices, a simple contiguous memory region
+    (e.g.: one declared in devicetree as ``shared-dma-pool``) is sufficient and
+    should be preferred, since it allows zero-copy message transmission between
+    the host and the remote processor;
+  - for any other virtio device type, a swiotlb-enabled memory region (e.g.:
+    one declared in devicetree as ``restricted-dma-pool``) is required, because
+    such devices need bounce buffering to work correctly.
+
+For virtio devices other than rpmsg and rproc-serial, the remoteproc framework
+offers the ``VIRTIO_F_ACCESS_PLATFORM`` feature, so the buffer addresses written
+in the vring descriptors are the DMA addresses returned by the DMA APIs for the
+virtio device. The virtio device inherits the DMA mask and the DMA range map
+(i.e., the translation described by the ``dma-ranges`` devicetree property) of
+the remote processor device, and is never attached to an IOMMU: these DMA
+addresses are therefore host physical addresses, translated only through the
+DMA range map. The remote processor must be able to access the buffers at
+these addresses.
+
+.. WARNING::
+
+    For remote processors that access memory through an IOMMU managed by the
+    remoteproc framework (i.e., with ``has_iommu`` set), the IOMMU domain only
+    contains the mappings created for the RSC_CARVEOUT and RSC_DEVMEM entries
+    of the resource table, at the device addresses they specify; no mapping is
+    created for the buffers of the virtio devices. Such remote processors are
+    supported only if all the memory that can hold virtio buffers (e.g., the
+    ``restricted-dma-pool`` region associated to the virtio device) is mapped
+    with its device address equal to its physical address, for example through
+    an RSC_DEVMEM entry. The same constraint applies to any fixed address
+    translation applied by the remote processor that is not described by the
+    DMA range map of the remote processor device.
+
+Allocation of virtio devices
+----------------------------
+
 Of course, RSC_VDEV resource entries are only good enough for static
 allocation of virtio devices. Dynamic allocations will also be made possible
 using the rpmsg bus (similar to how we already do dynamic allocations of
-rpmsg channels; read more about it in rpmsg.txt).
+rpmsg channels; read more about it in Documentation/staging/rpmsg.rst).

-- 
2.56.0


