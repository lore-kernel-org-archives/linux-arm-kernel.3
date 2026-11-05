Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E613606A32D
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 12:14:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=fSa8+r/d;
	dkim=pass (1024-bit key, unprotected) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=t2TCBdOa
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Reply-To:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Y+gV7tHyKEL0otgCQlQTt2Pz/4VwismWKNTtEGO49oM=; b=fSa8+r/d16bHpIyp19ohrbWdAQ
	YGb8cHIcS0miwbvDzbS9Qj3/J7uR00RPHKeeyXIWNbBxu3HtYQqgjZ9TE5GrOKzF7zhST7sw73tw0
	4B/tZHK5r4GHCiazXlD5FS+H+bKu2b8aM4VyBJ+dJIT7OhBhEt+2FaoZNSq91NcKbeqB86yTBD9IA
	UbS+kwcV7R1J06F9hpMjsNFotgiRyqH0CwMi/94HzCW9f1jR9UOD+S5puRnUuRgmxBHOGUWVQ0DiZ
	OOjG6VcNf4DaKqa63iSEPT2deMt5IapcEfQbyg5SJ0Nj37EPgUywPqlV6KiyJ35R/m9jDTdn9/F+q
	FxBoXCbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOwMe-00000008s4j-3Cx2;
	Thu, 05 Nov 2026 12:14:44 +0000
Received: from mailout1.samsung.com ([203.254.224.24])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOwMb-00000008s1D-0suE
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 12:14:42 +0000
Received: from epcas5p2.samsung.com (unknown [182.195.41.40])
	by mailout1.samsung.com (KnoxPortal) with ESMTP id 20261105121434epoutp0176992eb5f832827fe3c4626e4cf53082~lJSbBnqFQ2223622236epoutp01i
	for <linux-arm-kernel@lists.infradead.org>; Thu,  5 Nov 2026 12:14:34 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20261105121434epoutp0176992eb5f832827fe3c4626e4cf53082~lJSbBnqFQ2223622236epoutp01i
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1793880875;
	bh=Y+gV7tHyKEL0otgCQlQTt2Pz/4VwismWKNTtEGO49oM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=t2TCBdOazPKi4sM42DKXcnujppRiC36yTK5MY8C/uKEnQ19Wt3E0MvjVnUW7hHDac
	 0TBfJ11jmM2WK4AUIi9R6S7v6PRIe3L+K4qr3eN7uBTohUjIx2YRdnPXmIKb84z/oA
	 RRS69aalyDGadGqbkggrsxn17pIfAMzCtvoDkDxs=
Received: from epsnrtp04.localdomain (unknown [182.195.42.156]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPS id
	20261105121434epcas5p1c149e359c38860c237960af2d948a102~lJSaPN-5c0588705887epcas5p1t;
	Thu,  5 Nov 2026 12:14:34 +0000 (GMT)
Received: from epcas5p4.samsung.com (unknown [182.195.38.91]) by
	epsnrtp04.localdomain (Postfix) with ESMTP id 4jL1T50Dmdz6B9m7; Thu,  5 Nov
	2026 12:14:33 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPA id
	20261105121432epcas5p30c05ba935557ad6dd59514ef4d834e96~lJSYpwq6A2344923449epcas5p3B;
	Thu,  5 Nov 2026 12:14:32 +0000 (GMT)
Received: from vega.samsungds.net (unknown [107.108.73.84]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20261105121429epsmtip1207e894c73db06501ec40665dd115c3a~lJSV6EnKM3079930799epsmtip1i;
	Thu,  5 Nov 2026 12:14:29 +0000 (GMT)
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
Subject: [PATCH v5 2/2] usb: dwc3: Add Exynos8855 to the generic platform
 driver
Date: Thu,  5 Nov 2026 17:44:01 +0530
Message-Id: <20261105121401.1661711-3-selvarasu.g@samsung.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20261105121401.1661711-1-selvarasu.g@samsung.com>
X-CMS-MailID: 20261105121432epcas5p30c05ba935557ad6dd59514ef4d834e96
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20261105121432epcas5p30c05ba935557ad6dd59514ef4d834e96
References: <20261105121401.1661711-1-selvarasu.g@samsung.com>
	<CGME20261105121432epcas5p30c05ba935557ad6dd59514ef4d834e96@epcas5p3.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_041441_474797_0031AB45 
X-CRM114-Status: GOOD (  15.00  )
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

Add the "samsung,exynos8855-dwc3" compatible string to dwc3-generic-plat
so the Exynos8855 DWC3 controller can probe through the generic DWC3
platform glue.

Co-developed-by: Muhammed Ali <muhammed.ali@samsung.com>
Signed-off-by: Muhammed Ali <muhammed.ali@samsung.com>
Signed-off-by: Selvarasu Ganesan <selvarasu.g@samsung.com>
---
 drivers/usb/dwc3/dwc3-generic-plat.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/usb/dwc3/dwc3-generic-plat.c b/drivers/usb/dwc3/dwc3-generic-plat.c
index ca69ac0eb07c..069b265c9808 100644
--- a/drivers/usb/dwc3/dwc3-generic-plat.c
+++ b/drivers/usb/dwc3/dwc3-generic-plat.c
@@ -236,6 +236,7 @@ static const struct of_device_id dwc3_generic_of_match[] = {
 	{ .compatible = "spacemit,k3-dwc3", },
 	{ .compatible = "fsl,ls1028a-dwc3", &fsl_ls1028_dwc3},
 	{ .compatible = "eswin,eic7700-dwc3", &eic7700_dwc3},
+	{ .compatible = "samsung,exynos8855-dwc3", },
 	{ .compatible = "starfive,jhb100-dwc3", },
 	{ /* sentinel */ }
 };
-- 
2.17.1


