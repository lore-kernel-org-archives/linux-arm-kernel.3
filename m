Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 037C1606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Oct 2026 13:16:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=UXdt3llD;
	dkim=pass (1024-bit key, unprotected) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=BDqr90wW
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	List-Unsubscribe-Post:List-Owner;
	bh=uaG8jSX0cwndvkXbli6K51CcuRBe961ZbKPI7O25bZY=; b=UXdt3llDkH6j3bRnLmuFw+/Kia
	CuLgsji5iEXeoygnTZDQgKhLFHeb3Rp2WJ3uOX7Eq21jdiHOghwa1RPTn6ZJWy8BoVBku+iC9lW/c
	LIdRTvYnfoNMEQTOPba5AZMFfmg/EZn14R390Jr5DlKEyNm1OwQ9z6qAJNKUKsCxB9wdKGZNlzZuH
	YS+K72m9sKXR6AWBNqOj5aPu1zqPd33X26D40GIGnL1duzSWmm4YauRw/NEUqcu2jk/wF+ReoTN6k
	2rG22aDuvxrjMRTfznyXyKiwCHiGhHWU8fWYE4nkMFIxq7nisCpuzlFKSSPb7NvjMasE3Ts8GCn5q
	tm6sCohw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKF7n-0000000GMNl-3wKR;
	Fri, 23 Oct 2026 13:15:59 +0000
Received: from mailout3.samsung.com ([203.254.224.33])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKF7g-0000000GMKA-09P6
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 Oct 2026 13:15:59 +0000
Received: from epcas5p4.samsung.com (unknown [182.195.41.42])
	by mailout3.samsung.com (KnoxPortal) with ESMTP id 20261023131545epoutp03f0e34fc5c254953a687b0b89bda6fbdc~hKvHj1XIb0040000400epoutp03y
	for <linux-arm-kernel@lists.infradead.org>; Fri, 23 Oct 2026 13:15:45 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20261023131545epoutp03f0e34fc5c254953a687b0b89bda6fbdc~hKvHj1XIb0040000400epoutp03y
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1792761345;
	bh=uaG8jSX0cwndvkXbli6K51CcuRBe961ZbKPI7O25bZY=;
	h=From:To:Cc:Subject:Date:References:From;
	b=BDqr90wWxTcJZNYqJ8g7KzFoflDOUdRE2GMYLgdY7F+OQn395fdtqrO1yL9E8Sjsz
	 5KuIjhdwiHmOXE2ebV1/a8zrpUv6nXXwPMuVlVqyQycn/YAgW3wU8n4ZVnKsYj84mU
	 L/1N1ZMcRpa58FVHlk7BIX79A7ug1d1ESwDF3dsQ=
Received: from epsnrtp03.localdomain (unknown [182.195.42.155]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPS id
	20261023131544epcas5p16733dbf6f91b1e351476a6a7f76abbfc~hKvGpgpd30267602676epcas5p1C;
	Fri, 23 Oct 2026 13:15:44 +0000 (GMT)
Received: from epcas5p1.samsung.com (unknown [182.195.38.89]) by
	epsnrtp03.localdomain (Postfix) with ESMTP id 4jB3Rg29Zjz3hhT3; Fri, 23 Oct
	2026 13:15:43 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPA id
	20261023131542epcas5p4be95a0825acdeecc2198259839459034~hKvFTD8NR0834608346epcas5p4v;
	Fri, 23 Oct 2026 13:15:42 +0000 (GMT)
Received: from vega.samsungds.net (unknown [107.108.73.84]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20261023131539epsmtip2472a2f57bab2741b2a79cd9cc299f59b~hKvCet7dw0806808068epsmtip2B;
	Fri, 23 Oct 2026 13:15:39 +0000 (GMT)
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
Subject: [PATCH v3 0/2] Add USB DWC3 support for Samsung Exynos8855
Date: Fri, 23 Oct 2026 18:44:59 +0530
Message-Id: <20261023131501.3157463-1-selvarasu.g@samsung.com>
X-Mailer: git-send-email 2.17.1
X-CMS-MailID: 20261023131542epcas5p4be95a0825acdeecc2198259839459034
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20261023131542epcas5p4be95a0825acdeecc2198259839459034
References: <CGME20261023131542epcas5p4be95a0825acdeecc2198259839459034@epcas5p4.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261023_061552_758566_CAEC46B3 
X-CRM114-Status: GOOD (  17.71  )
X-Spam-Score: -4.7 (----)
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
X-Spam-Status: No, score=-19.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
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
  dt-bindings: usb: Add Samsung Exynos8855 DWC3 controller binding
  usb: dwc3: Add Exynos8855 to the generic platform driver

 .../bindings/usb/samsung,exynos8855-dwc3.yaml | 74 +++++++++++++++++++
 drivers/usb/dwc3/dwc3-generic-plat.c          |  5 +-
 2 files changed, 77 insertions(+), 2 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/usb/samsung,exynos8855-dwc3.yaml

-- 
2.17.1


