Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0079606A331
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  1 Nov 2026 23:27:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=e0VVnOdn;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=antispam.mailspamprotection.com header.i=@antispam.mailspamprotection.com header.a=rsa-sha256 header.s=default header.b=GnqLPWQ5;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=valla.it header.i=@valla.it header.a=rsa-sha256 header.s=default header.b=DWkHZglW
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=jDGzUeJoU453C6E72rSA80bKxfeU0j/w1IYP/rP6ntc=; b=e0VVnOdn2Kpzoz
	r0N4x874pAGpZXOgbnQB8VguV3lGFvWmdqabUqe0+Jh8gu9kUamT4xcCwkynVWqI0q3VYNyIAF//1
	1/jTCtzivi0gSljhIwAj+tBJ3BeT2j39WtNmLFSm4ONKMSDUnTtMsmQohPJstVQ+nuIQ/IEUw7oIm
	s7U8eeMxIqNv/n4tGXYxmCmNRij26jNxs74B+PSva5ySBE8Eadd5mAc74fwKcdarPRLfnOB7TznTq
	xYfZMblLy3E3NKIDBoJGMvXiVBGrfSnrHG7deEUHtaqHDHzi3wJoc6y/RO/UGz76vbcVnyqEq9kKH
	mx1o8xDf4ZK0hJTPOiJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNexI-0000000FDrU-2nS6;
	Sun, 01 Nov 2026 23:27:16 +0000
Received: from delivery.antispam.mailspamprotection.com ([185.56.87.3])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNexE-0000000FDmp-0Z39
	for linux-arm-kernel@lists.infradead.org;
	Sun, 01 Nov 2026 23:27:14 +0000
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=outgoing.instance-europe-west4-xdd7.prod.antispam.mailspamprotection.com; s=arckey; t=1793575632;
	 b=aABDcbJpiV/Ghm7ch04qoIodOTYY9hbPJYAmI3yatXLZYLyfwoPpfTTcrkWNliHouXyr9+g1bO
	  EdGTPIzZQS3yPbFR1xRc2onY3xgiq8b21SxYKyj+xi14WrT1/OCXBx5ptGVfFiEh0Rn8xs9l4B
	  VIvWPgNXaVeVKU4cxCwv31XcocNJOI9WdovNzGAltD3tGVL6ER8PmVHfmD3y08Sv4YNw97o12G
	  xncqostV0oX+p8Jd50XoJv2TKWL0yo7JxD7IBHj9FTtpFwuRByAj2+Gw/Q2VS+UltVkJhpBFrr
	  EaK8HWJpjxOfSB2EYCQj9Q4XefnQGOseGyocieNRMyv2Sg==;
ARC-Authentication-Results: i=1; outgoing.instance-europe-west4-xdd7.prod.antispam.mailspamprotection.com; smtp.remote-ip=35.214.173.214;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed; d=outgoing.instance-europe-west4-xdd7.prod.antispam.mailspamprotection.com; s=arckey; t=1793575632;
	bh=wjrwqlTjD+bsGiygLxRdvngnMYwukHYEcpIoG27o7NQ=;
	h=Cc:To:In-Reply-To:References:Message-ID:Content-Transfer-Encoding:
	  Content-Type:MIME-Version:Subject:Date:From:DKIM-Signature:DKIM-Signature;
	b=dXz6n/NV/j2edA4foLiTvYeZ4HmfFb4abu4zgw3q6qSuOpiYOCBaWOdeb6Uo9cvgumOhsoT6pA
	  1gf5NaDWyMYvPaqeiX6wbg0x0yREiTreTn4jdk6t109Kpx1EbbQ//Y592FZX3+QcUwWnvvNLfp
	  Vze9kmTd+jegMdrhDnsWSZiJ6l8/sJLUmWi6/ER0c8/hTWRl4hXoQ0xQbzqnWlm8mpTPkovXbQ
	  1NNXQhbz9JsbXmCd3q6AEdCC3QOkGAKzyeDvs/qJUv6xE751vhPIc+l2wolWkwcknUJ0NYUjsq
	  Hxe26PK4Tj0UvR4Rv6bcOKIN0oCYvuyuNbRLnoFGF/MntQ==;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=antispam.mailspamprotection.com; s=default; h=CFBL-Feedback-ID:CFBL-Address
	:Cc:To:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject
	:Date:From:Reply-To:List-Unsubscribe;
	bh=jDGzUeJoU453C6E72rSA80bKxfeU0j/w1IYP/rP6ntc=; b=GnqLPWQ5zod4QJPirylGvaEz3J
	ynpm0YAXbx1Rabz48XbTzDwrll5eo+iGfd0ZliGOs1cCYJTqGiOEBvhYS0FjoyUD0X2p9YVqyMa1W
	3RoOlOInchoQQp/vfC/m4pK+cmFp0FlwHzt/SEzmDzhMgYdz0804w8+iHT4IY3iAoYA8=;
Received: from 214.173.214.35.bc.googleusercontent.com ([35.214.173.214] helo=esm19.siteground.biz)
	by instance-europe-west4-xdd7.prod.antispam.mailspamprotection.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <francesco@valla.it>)
	id 1xNexB-00000005hur-32HM
	for linux-arm-kernel@lists.infradead.org;
	Sun, 01 Nov 2026 23:27:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=valla.it;
	s=default; h=Cc:To:Subject:Date:From:list-help:list-unsubscribe:
	list-subscribe:list-post:list-owner:list-archive;
	bh=jDGzUeJoU453C6E72rSA80bKxfeU0j/w1IYP/rP6ntc=; b=DWkHZglWJBAhWKTBNUqy4BrJ9y
	hYXQHTINCO6Tv62B/pPA57suAYhsZO/5GLNfBvMm+OU7z0msEuGdf4Jj6RinMEOVJInbhyl5XjUOL
	toFsrhRSnLw9ZmeIV69q7ci29XsXzjyNWDsyC/EAViym1PcZNNYULQ5OldBT6CpPTDLY=;
Received: from [79.17.15.196] (port=60226 helo=[192.168.178.175])
	by esm19.siteground.biz with essmtpa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <francesco@valla.it>)
	id 1xNex1-000000002I5-09og;
	Sun, 01 Nov 2026 23:26:59 +0000
From: Francesco Valla <francesco@valla.it>
Date: Mon, 02 Nov 2026 00:26:43 +0100
Subject: [PATCH RFC v2 06/11] dt-bindings: remoteproc: add
 remoteproc-virtio
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261102-remoteproc_virtio_map-v2-6-26b300e01c62@valla.it>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4131; i=francesco@valla.it;
 h=from:subject:message-id; bh=wjrwqlTjD+bsGiygLxRdvngnMYwukHYEcpIoG27o7NQ=;
 b=owGbwMvMwCX2aH1OUIzHTgbG02pJDFnPT+1ZOt07pE+76wzvgiav4v7lb8Ovry8SnWzhsihPb
 erBllm2HaUsDGJcDLJiiiwh627c2zPX/FvaBsZHMHNYmUCGMHBxCsBELC4zMtwWEz+urpm56f7P
 3tM/CwoTV9/fvu+JY3v7Mqv2F8/uCPEyMtxjFZq6euHOhf+t02Y0nutSbTqyhe309lidBe3axTF
 fmvgA
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
X-SGantispam-id: 12e099544019536a1a494d46eb8dfd8e
X-AntiAbuse: ID - 12e099544019536a1a494d46eb8dfd8e
AntiSpam-DLS: false
AntiSpam-DLSP: 
AntiSpam-DLSRS: 
AntiSpam-TS: 1.0
CFBL-Address: feedback@antispam.mailspamprotection.com; report=arf
CFBL-Feedback-ID: 1xNexB-00000005hur-32HM-feedback@antispam.mailspamprotection.com
Authentication-Results: outgoing.instance-europe-west4-xdd7.prod.antispam.mailspamprotection.com;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261101_152712_329646_E95A3633 
X-CRM114-Status: GOOD (  14.38  )
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

Add a new binding to describe remoteproc-provided virtio devices; while
these are discovered through a resource table parsed by the remoteproc
infrastructure at runtime, their description can be needed to probe
non-discoverable buses (such as I2C) or to link consumers and suppliers.

Each vdev is described by a dedicated "group" node, which then includes
a virtio-device node. Each vdev shall be statically linked to a "group"
node using its index inside the resource table as the reg property of
the node; this permits to have multiple instances of the same type of
device.

The binding is intended to be generic and adopted by any remoteproc
provider.

Signed-off-by: Francesco Valla <francesco@valla.it>
---
 .../bindings/remoteproc/remoteproc-virtio.yaml     | 106 +++++++++++++++++++++
 1 file changed, 106 insertions(+)

diff --git a/Documentation/devicetree/bindings/remoteproc/remoteproc-virtio.yaml b/Documentation/devicetree/bindings/remoteproc/remoteproc-virtio.yaml
new file mode 100644
index 000000000000..8cdfa8d0f936
--- /dev/null
+++ b/Documentation/devicetree/bindings/remoteproc/remoteproc-virtio.yaml
@@ -0,0 +1,106 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/remoteproc/remoteproc-virtio.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Virtio devices over remoteproc
+
+description: |
+  Virtio devices ("vdevs") can be exposed using the remoteproc infrastructure
+  and its resource table. For some of them, a device tree node might be needed
+  to describe remote undiscoverable hardware and/or connect consumers and
+  providers.
+
+maintainers:
+  - Francesco Valla <francesco@valla.it>
+
+properties:
+  virtio:
+    type: object
+    description: |
+      Contains a group of virtio devices exposed by the firmware running on
+      the remote processor through its resource table.
+
+    additionalProperties: false
+
+    properties:
+      '#address-cells':
+        const: 1
+
+      '#size-cells':
+        const: 0
+
+    patternProperties:
+      "@[0-9a-f]+$":
+        type: object
+        description: |
+          A single virtio device exposed by the remote processor. It can
+          contain at most one child node, describing the virtio device itself
+          (e.g., to declare devices on a non-discoverable bus or to act as a
+          provider for other nodes).
+
+        properties:
+          reg:
+            description: |
+              Position of the virtio device among the VDEV resources contained
+              inside the resource table.
+            maxItems: 1
+
+          memory-region:
+            description: |
+              Memory region used for the buffers exchanged with the remote
+              processor. A restricted-dma-pool region forces all buffers to
+              be bounced through it.
+            maxItems: 1
+
+        additionalProperties:
+          type: object
+          $ref: /schemas/virtio/virtio-device.yaml#
+
+        required:
+          - reg
+
+    required:
+      - '#address-cells'
+      - '#size-cells'
+
+additionalProperties: true
+
+examples:
+  - |
+    remoteproc-cm33 {
+        virtio {
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            vdev@0 {
+                reg = <0>;
+
+                gpio {
+                    compatible = "virtio,device29";
+
+                    gpio-controller;
+                    #gpio-cells = <2>;
+                };
+            };
+
+            vdev@1 {
+                reg = <1>;
+                memory-region = <&vdev1_buffer>;
+
+                i2c {
+                    compatible = "virtio,device22";
+
+                    #address-cells = <1>;
+                    #size-cells = <0>;
+
+                    eeprom@50 {
+                        compatible = "atmel,24c1025";
+                        reg = <0x50>;
+                    };
+                };
+            };
+        };
+    };
+...

-- 
2.56.0


