Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6120606A32A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Oct 2026 13:16:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=IjdFBkgX;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=aezR/DEf;
	dkim=pass (1024-bit key, unprotected) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=oYdvHJoT
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Reply-To:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=JjXWggIO1QwF9H9WIE/c77W+Og3mvbbUeijLVnTmFvY=; b=IjdFBkgX11RldDFuH4Mv0eqKKo
	WUNFbIPXrNOTEhsnrUqOY9vnOatD9GloOQGRdbVkPfIgQfeAkRhpt7PNoAh6IqO7bgQ1tUgC/TvOG
	LU+ar6a5TNVt/bpYn5FPSdr2l0/djowL6vJMyMiMIZNdEj2qRGLhCoMHs2PpOnTKV1++1Q1YnOPK1
	//Up+Woi9lXlErkNCw33/ZolSwugmojDNaZCIBPsGaPdub9HzbbTNABLL9C8He8TGR2PshXg79dWn
	qg7axg+vvkJOOpdtJ0YQsdlGdk8OSZmzNpWTs121FZrban5a57T8zp5znV5Aqbx6jAUoU2KlrcRG5
	Ter0fRQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKF7v-0000000GMQk-09zW;
	Fri, 23 Oct 2026 13:16:07 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKF7s-0000000GMPD-0UaI
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 23 Oct 2026 13:16:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=References:Content-Type:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=JjXWggIO1QwF9H9WIE/c77W+Og3mvbbUeijLVnTmFvY=; b=aezR/DEfueq2iQLzn7HAysy+OG
	PMAJC52cTTKgs1f2Fb5PJzM3vtHdAawT+uX9RNvJGTcv9WIBwr29EouDwVhR0fCt9QCv+0XZnEMUC
	Zi8daLNUYTS85722z1cxNJzuHNOIHoZ2MHvMc5YTMCCX5vpMFn11T+cUfhhCOs+mzEJFQeWad4JBk
	B6vv41hw2FRbAU/rc/fQmOWtYbnv0XbLoaJaw1uS8XxL4YVP2s+j2AjsF5mGNhZDCBRoeEcUTjl1y
	xXo8w7Y6KFs2ggS7m6Tyqhrk45VAoGTqHsSCzWR8Kgoei6yyeKJ+fclQXMX+s8Ca2HNEUOJIjNIcH
	30JXyKQw==;
Received: from mailout4.samsung.com ([203.254.224.34])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKF7o-00000009fOr-3VE0
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 Oct 2026 13:16:03 +0000
Received: from epcas5p2.samsung.com (unknown [182.195.41.40])
	by mailout4.samsung.com (KnoxPortal) with ESMTP id 20261023131551epoutp049c5261b197e0f58be27b611dc9ac33bc~hKvN-Rdsw2756527565epoutp04V
	for <linux-arm-kernel@lists.infradead.org>; Fri, 23 Oct 2026 13:15:51 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20261023131551epoutp049c5261b197e0f58be27b611dc9ac33bc~hKvN-Rdsw2756527565epoutp04V
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1792761352;
	bh=JjXWggIO1QwF9H9WIE/c77W+Og3mvbbUeijLVnTmFvY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=oYdvHJoTVTSSRO9g+GqANxMVwuo/SGJAMCh+O8z4SPs3n9/Ffc7wHunJ0fazzxmFo
	 QapC7MKDyU7bKZVdWzeTSGNJ6GihhyHWF0NK9HX+jFFJoGvT5mpi+Od0QLYSDaC0xz
	 9Etdzlj/y/IcgHmZNsdAi892/OhyqZKoGEedaSGc=
Received: from epsnrtp02.localdomain (unknown [182.195.42.154]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPS id
	20261023131550epcas5p4f7f59ff68804b78d3f646465b8db3444~hKvMiDFdI0834608346epcas5p45;
	Fri, 23 Oct 2026 13:15:50 +0000 (GMT)
Received: from epcas5p4.samsung.com (unknown [182.195.38.87]) by
	epsnrtp02.localdomain (Postfix) with ESMTP id 4jB3Rn3BFyz2SSKY; Fri, 23 Oct
	2026 13:15:49 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPA id
	20261023131548epcas5p2aeea6d1ff5351907df204e7b3fbe6030~hKvLNyrKo0460604606epcas5p2Y;
	Fri, 23 Oct 2026 13:15:48 +0000 (GMT)
Received: from vega.samsungds.net (unknown [107.108.73.84]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20261023131546epsmtip2f2c90cea5070ff3d67e5e2304c0bf759~hKvIfsFH90535905359epsmtip2I;
	Fri, 23 Oct 2026 13:15:45 +0000 (GMT)
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
Subject: [PATCH v3 2/2] usb: dwc3: Add Exynos8855 to the generic platform
 driver
Date: Fri, 23 Oct 2026 18:45:01 +0530
Message-Id: <20261023131501.3157463-3-selvarasu.g@samsung.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20261023131501.3157463-1-selvarasu.g@samsung.com>
X-CMS-MailID: 20261023131548epcas5p2aeea6d1ff5351907df204e7b3fbe6030
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20261023131548epcas5p2aeea6d1ff5351907df204e7b3fbe6030
References: <20261023131501.3157463-1-selvarasu.g@samsung.com>
	<CGME20261023131548epcas5p2aeea6d1ff5351907df204e7b3fbe6030@epcas5p2.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261023_141601_473177_ACD5BB19 
X-CRM114-Status: GOOD (  14.62  )
X-Spam-Score: -2.8 (--)
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


