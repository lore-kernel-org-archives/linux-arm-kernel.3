Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78EB1606A31B
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 12:14:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=KaAcCLPO;
	dkim=pass (1024-bit key, unprotected) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=KlciE+qb
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	List-Unsubscribe-Post:List-Owner;
	bh=wj5nZozJQCUk77xJuRTCNGYRyYXNzGvjve+qA6nxMLQ=; b=KaAcCLPOYRlCPlffSLIKLoS88M
	8nMfzd8wCVvRVmU41lJtekRnxJ24iKV4AeQEZQM3tsD2DCTBBkAl+0nnKL4RPcFr1riygRgTd8kQR
	8HQ2eGo3gr0qavhMYwNNYl0345xTz1eToEcN4g8g59jqpJ4mLyon8Xz+rJ7qccc+vk7buudCNGp0X
	0XbK/XirXrWdmJ667tl0Oqe/tUFMxyJ6gbR+8/UGcy/UqYEpuU7Z4qpJrOCSITQ/z1zlPZ1rkjFPB
	rJkG3qE55lXdksqKtdcYRSrZij2YcSVbpE+IZYjjt8apDmTNatuYGPOryPf4JK3NEmqeEr+kQa4cn
	2F5ppldw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOwMe-00000008s3n-1MAf;
	Thu, 05 Nov 2026 12:14:44 +0000
Received: from mailout4.samsung.com ([203.254.224.34])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOwMV-00000008s02-2eSX
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 12:14:39 +0000
Received: from epcas5p4.samsung.com (unknown [182.195.41.42])
	by mailout4.samsung.com (KnoxPortal) with ESMTP id 20261105121428epoutp042d7e8bda58c2aaf1cd14aa6566c3f03f~lJSVCA7tc2130221302epoutp04K
	for <linux-arm-kernel@lists.infradead.org>; Thu,  5 Nov 2026 12:14:28 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20261105121428epoutp042d7e8bda58c2aaf1cd14aa6566c3f03f~lJSVCA7tc2130221302epoutp04K
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1793880868;
	bh=wj5nZozJQCUk77xJuRTCNGYRyYXNzGvjve+qA6nxMLQ=;
	h=From:To:Cc:Subject:Date:References:From;
	b=KlciE+qbCMkaUOkUK4D6Sae2H1DMmlQb8F3DOM9NJiRUnIAt96sAGAs04WIsiH8NW
	 ufxEEtGKMxIIExRcdicKTupmUuDc97jai8wghV/YPgLfT+42Jkb01a9dfTexuuFrlg
	 RJmmnbFbtV+KiyWkOJN9blHkKG3ldOEv86FI7xZY=
Received: from epsnrtp03.localdomain (unknown [182.195.42.155]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPS id
	20261105121427epcas5p228003b6804cbca3ff690f95a0510d951~lJSULzkdS1965619656epcas5p2T;
	Thu,  5 Nov 2026 12:14:27 +0000 (GMT)
Received: from epcas5p4.samsung.com (unknown [182.195.38.95]) by
	epsnrtp03.localdomain (Postfix) with ESMTP id 4jL1Sy6N4wz3hhT7; Thu,  5 Nov
	2026 12:14:26 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPA id
	20261105121426epcas5p4b41cf26c1a951083cb6f31cd29683c4d~lJSSwS8Wu2770827708epcas5p4R;
	Thu,  5 Nov 2026 12:14:26 +0000 (GMT)
Received: from vega.samsungds.net (unknown [107.108.73.84]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20261105121423epsmtip1e06534b46800136188631e62189b7cd7~lJSP7nXCS3043930439epsmtip1f;
	Thu,  5 Nov 2026 12:14:22 +0000 (GMT)
From: Selvarasu Ganesan <selvarasu.g@samsung.com>
To: gregkh@linuxfoundation.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, peter.griffin@linaro.org, alim.akhtar@samsung.com,
	Thinh.Nguyen@synopsys.com, selvarasu.g@samsung.com,
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: jh0801.jung@samsung.com, h10.kim@samsung.com, dh10.jung@samsung.com,
	akash.m5@samsung.com, hongpooh.kim@samsung.com, eomji.oh@samsung.com,
	shijie.cai@samsung.com, muhammed.ali@samsung.com, thiagu.r@samsung.com
Subject: [PATCH v5 0/2] Add USB DWC3 support for Samsung Exynos8855
Date: Thu,  5 Nov 2026 17:43:59 +0530
Message-Id: <20261105121401.1661711-1-selvarasu.g@samsung.com>
X-Mailer: git-send-email 2.17.1
X-CMS-MailID: 20261105121426epcas5p4b41cf26c1a951083cb6f31cd29683c4d
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20261105121426epcas5p4b41cf26c1a951083cb6f31cd29683c4d
References: <CGME20261105121426epcas5p4b41cf26c1a951083cb6f31cd29683c4d@epcas5p4.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_041436_307314_A884E6A2 
X-CRM114-Status: GOOD (  19.47  )
X-Spam-Score: -4.4 (----)
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1
X-Archived-By: <archiver.kernel.org>

The Samsung Exynos8855 SoC implements a Synopsys DesignWare USB3 DRD
controller. The DWC3 core on the Exynos8855 is instantiated with the
generic DWC3 platform driver using a flattened model, where the
controller is directly addressable without a separate glue layer.

This is the first Samsung Exynos binding using the flattened
representation, and this series adds the device tree binding and
platform driver support for this configuration.

Signed-off-by: Selvarasu Ganesan <selvarasu.g@samsung.com>
---

Changes in v5:
- Drop the alphabetical reorder of dwc3_generic_of_match and
  just add the new entry, to avoid conflicts with the existing queued
  changes, per Thinh's feedback.
- Drop the Acked-by (Krzysztof Kozlowski) from patch 2 as the patch
  changed. Re-requesting it.
- Link to v4:
  https://lore.kernel.org/all/20261026135715.33071-1-selvarasu.g@samsung.com/

Changes in v4:
- Drop redundant "binding" from the subject.
- Reorder properties, interrupts after clocks, power-domains after
  interrupts.
- Reorder interrupt property in the example as well.
- List clocks with per item descriptions.
- Link to v3:
  https://lore.kernel.org/all/20261023131501.3157463-1-selvarasu.g@samsung.com/

Changes in v3:
- Drop the MAINTAINERS patch.
- Drop the samsung,snps-dwc3 generic fallback compatible. The binding
  now uses the SoC specific compatible samsung,exynos8855-dwc3 only.
- Binding file is renamed to match the compatible string.
- Remove the "select" from the binding.
- List the clocks (ref, bus) explicitly and drop the redundant if/then
  block.
- Update the driver patch to use the new compatible string.
- Drop the v2 Reviewed-by (Alim Akhtar) and Acked-by (Thinh Nguyen)
  tags as the patches changed. re-requesting them.
- Link to v2:
  https://lore.kernel.org/all/20260916122229.2604003-1-selvarasu.g@samsung.com/

Changes in v2:
- Commit 2/3: Clarify this is the first Samsung Exynos binding using
  the flattened node representation.
- Commit 3/3: Add the compatible entry in alphabetical order in the
  of_match_table.
- Link to v1:
  https://lore.kernel.org/all/20260903071250.3421499-1-selvarasu.g@samsung.com/

Selvarasu Ganesan (2):
  dt-bindings: usb: Add Samsung Exynos8855 DWC3 controller
  usb: dwc3: Add Exynos8855 to the generic platform driver

 .../bindings/usb/samsung,exynos8855-dwc3.yaml | 71 +++++++++++++++++++
 drivers/usb/dwc3/dwc3-generic-plat.c          |  1 +
 2 files changed, 72 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/usb/samsung,exynos8855-dwc3.yaml

-- 
2.17.1


