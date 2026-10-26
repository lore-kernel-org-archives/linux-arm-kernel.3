Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE3F7606A326
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Oct 2026 13:58:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Vv7/SuXk;
	dkim=pass (1024-bit key, unprotected) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=R2LrdxDa
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Reply-To:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=KW1WzRc1tzLF58BOmGAQOp7E30KcthgOi+aTArJ3XbA=; b=Vv7/SuXkpw6NTKYnOuabPdyY5x
	4c+yo39gYDuenotxJF5KHhJrrZrXCnB1BKEH22gKLdUcarDTNeV1TLcKvt8ypQSDSJXHKL9Cnp3o5
	Ax+w+pKXkcMHWHrU++APF385joDTWwDT74tPg+lDx+bfYF/wcnKst9oN7z5FDUM5tZ7OTLCDZgqBf
	l4KcElx1MSIo/vwkqlU91+NxdDbu/5fyqx2FMkCBGiSaQXu11nqIzI0rfqNCOsf+dWcNNfTiqE5p3
	unKEA/HtNOVUQl8QJnT0BoRN6SLVweQwgc/+Ywlrw/YWu5veSplMRT9SS3rua5JMo1euc1OqB744b
	JPMyBl+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLLDL-00000002eiS-1ZAD;
	Mon, 26 Oct 2026 13:58:15 +0000
Received: from mailout2.samsung.com ([203.254.224.25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLLD8-00000002edy-0LD5
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Oct 2026 13:58:03 +0000
Received: from epcas5p3.samsung.com (unknown [182.195.41.41])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20261026135757epoutp02a64309824cd06be57c7c4bccae307561~iGP1VKSvl2489524895epoutp02T
	for <linux-arm-kernel@lists.infradead.org>; Mon, 26 Oct 2026 13:57:57 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20261026135757epoutp02a64309824cd06be57c7c4bccae307561~iGP1VKSvl2489524895epoutp02T
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1793023078;
	bh=KW1WzRc1tzLF58BOmGAQOp7E30KcthgOi+aTArJ3XbA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=R2LrdxDa6TUPXkypAVl3MrpzPtEUyC1vcNu7xUIT+2Xtj+u4ipmTVzJULAFBkZjUr
	 qcNsPLkxVpNPAIhfgc7wgxkBcp+Ak1QGH5ObOR0aSWV00jJNZK/IyPD/VMQrW7Mrv3
	 eydiWJI7mA28ZtdZPw1XD+NrmuT1FNYyxoVaeA+k=
Received: from epsnrtp01.localdomain (unknown [182.195.42.153]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPS id
	20261026135756epcas5p3087ef8bf0a846813b5eeedc1e6fbad7d~iGP0FGnEQ0508605086epcas5p3N;
	Mon, 26 Oct 2026 13:57:56 +0000 (GMT)
Received: from epcas5p2.samsung.com (unknown [182.195.38.91]) by
	epsnrtp01.localdomain (Postfix) with ESMTP id 4jCwDz4rp7z6B9m5; Mon, 26 Oct
	2026 13:57:55 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPA id
	20261026135755epcas5p4efa15a5e7540d91b4411a7b324aeaa5d~iGPyrihaB1259612596epcas5p4z;
	Mon, 26 Oct 2026 13:57:55 +0000 (GMT)
Received: from vega.samsungds.net (unknown [107.108.73.84]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20261026135752epsmtip258cc5d42e667fae494fbf95c52b73775~iGPv8zpNQ1390513905epsmtip2h;
	Mon, 26 Oct 2026 13:57:52 +0000 (GMT)
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
Subject: [PATCH v4 2/2] usb: dwc3: Add Exynos8855 to the generic platform
 driver
Date: Mon, 26 Oct 2026 19:27:15 +0530
Message-Id: <20261026135715.33071-3-selvarasu.g@samsung.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20261026135715.33071-1-selvarasu.g@samsung.com>
X-CMS-MailID: 20261026135755epcas5p4efa15a5e7540d91b4411a7b324aeaa5d
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20261026135755epcas5p4efa15a5e7540d91b4411a7b324aeaa5d
References: <20261026135715.33071-1-selvarasu.g@samsung.com>
	<CGME20261026135755epcas5p4efa15a5e7540d91b4411a7b324aeaa5d@epcas5p4.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261026_065802_446543_EADBDDCD 
X-CRM114-Status: GOOD (  14.03  )
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

Add the "samsung,exynos8855-dwc3" compatible string to dwc3-generic-plat
so the Exynos8855 DWC3 controller can probe through the generic DWC3
platform glue. While at it, alphabetically reorder the existing entries.

Co-developed-by: Muhammed Ali <muhammed.ali@samsung.com>
Signed-off-by: Muhammed Ali <muhammed.ali@samsung.com>
Signed-off-by: Selvarasu Ganesan <selvarasu.g@samsung.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/usb/dwc3/dwc3-generic-plat.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/dwc3/dwc3-generic-plat.c b/drivers/usb/dwc3/dwc3-generic-plat.c
index ca69ac0eb07c..d57496716204 100644
--- a/drivers/usb/dwc3/dwc3-generic-plat.c
+++ b/drivers/usb/dwc3/dwc3-generic-plat.c
@@ -232,10 +232,11 @@ static const struct dwc3_generic_config eic7700_dwc3 =  {
 };
 
 static const struct of_device_id dwc3_generic_of_match[] = {
+	{ .compatible = "eswin,eic7700-dwc3", &eic7700_dwc3},
+	{ .compatible = "fsl,ls1028a-dwc3", &fsl_ls1028_dwc3},
+	{ .compatible = "samsung,exynos8855-dwc3", },
 	{ .compatible = "spacemit,k1-dwc3", &spacemit_k1_dwc3},
 	{ .compatible = "spacemit,k3-dwc3", },
-	{ .compatible = "fsl,ls1028a-dwc3", &fsl_ls1028_dwc3},
-	{ .compatible = "eswin,eic7700-dwc3", &eic7700_dwc3},
 	{ .compatible = "starfive,jhb100-dwc3", },
 	{ /* sentinel */ }
 };
-- 
2.17.1


