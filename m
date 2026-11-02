Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 921BA606A331
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 11:49:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=K4jwCQl+;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UIATvmLO;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bFQUGD/N
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Oh19af8VgHztOuXDPlz5lWKaaYDLQ4xFxBnWETVNsOQ=; b=K4jwCQl+mfvk07
	W2VabWvakleKqFx+BJuD6vwRA1eDvN/z3wULWXUS0kAJ9EuDaEfvxH87AayljqaGe1DGU5WXrhJ2h
	HQb3Qh6plDAtm0HMLsAZjM6lVVBYb8Ur0CtSDq6zwYjaawqhcITcksPles08QfK6hzAm72KgS0+69
	aA5GIBWPzYH6oywD0YMyBKAiFDdby92YUrgRj6aen68rGNKgSOo3ztlAtxgOKkY7cASnGAykZOnDw
	Vn1UzQwOM37Ijo0o6EkgPnFO45ZCzaQ1eSlzTuCRWUzQKSTU2A7hUcN9w6YOYJE9BAu6waGd2Jkrh
	jthiy4U6Sok5xXp6RGsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNqXE-0000000GO6P-24Eu;
	Mon, 02 Nov 2026 11:49:08 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNqXB-0000000GO5p-38qp
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Nov 2026 11:49:07 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A29AEKP2467034
	for <linux-arm-kernel@lists.infradead.org>; Mon, 2 Nov 2026 11:49:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Oh19af8VgHztOuXDPlz5lWKaaYDLQ4xFxBnWETVNsOQ=; b=UIATvmLOWQpaXQVN
	oGiCbTvXKK5nFoQAnD/bxxWjxPEGIR7w875WteIQuZvgNtw/JOlZYYncbPsW2Cwb
	lGZHvoRzoK3qpEQ4Mv1OwSlZ1XnVQmWrPR73PIKJj+obSGw8TOGFcVT6JITmth4y
	4CWEy1X4f43m6WzQiJl5SIq9nd6C3Wvol1vpwMMDrj/YR4hv62wC1vegav/DTmn/
	m2LmkEO7EkS/W2LSS0G7n6wlHmoB9kr4f8u1skbtrLHszBfSpKXrTWfsz9dEtDPA
	T7XqraNVmTpc0hmPpoZnOJXztQLNXONYiUBA4Mw0yVm9oz/Uy81MXI/TdFi5cI6h
	BN65Cg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpk9rhmeh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Nov 2026 11:49:04 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93cb71b1443so606127585a.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Nov 2026 03:49:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793620144; x=1794224944; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Oh19af8VgHztOuXDPlz5lWKaaYDLQ4xFxBnWETVNsOQ=;
        b=bFQUGD/NL3RM/LPfNigYMaGP/CZPWqRblBS/P1wfTACqiJzKy29yg0JZW4Ze8P4/Wp
         7r7BvQv010ycuRWyjl9geb90CLHxDkTgQfgHcqPZZ/4mGrqyBsWTX/9WeOhNp4Y+Vu37
         fpiOBYaRf28CmEraNPtYnu4+zD84QwbBI0obPgXQykcHevqb0ZQcbbLwUW/AGE17fXw2
         +OR3QfxMbATkpU22dQ7+tY5RPY7VePyVBXpzqpujr2hVB+cSIBtWPSG/9ZeI+juIjWrB
         9udqTbUyITiULUY/g1frsLLTHPuG6he4Kn7f5zFTUpIFQTXde2/sIG8K10ytt8tacZI4
         kaiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793620144; x=1794224944;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Oh19af8VgHztOuXDPlz5lWKaaYDLQ4xFxBnWETVNsOQ=;
        b=Z+wH1RbXS7BO0b3Czwn79cgTXAHiaOTMulNzHaw6PMeOk087AEo2DqylbiYdh7rHK3
         KNQFFf0YDZO6yNjzBARQk7A0PZsdAAXzgH46liRWTkGShiJZsx+BRAGPMWmU+/2F+Hct
         1rdwWy0qKvX/LFMrYYTZ57RY0dtl5HVLHTtC47kYH1a42XVToODLoERoakpS/PEXCQ2U
         RyEZp9NvmT1E2bhpFX2WW7sSUaVpJuTNhVpJiPdxSOXwTYfFHsQE+UtWvD26FjIynJNX
         J16vXTqauQGkTmJyfiSoT7xypqxAeGGVnoOCRPrVLmrbk8jNfwFDbbn3mcnisE1kYFDX
         /K1Q==
X-Forwarded-Encrypted: i=1; AKwUvBz2E9fXJmP5dGB5fQjbp8KgIo/S0gCs83UhAC+NSRHl3aG0Fg0WIaSGuBLHkjysaP1NvpJaUcHhoizLLyOQOhtA@lists.infradead.org
X-Gm-Message-State: AFq9FYJcHUJ93GtN1nOqCaIfV4kgA0K7vAP85FGcODV7AKbNIkfU614R
	kn0frh/KTwcRxfdzR/0OyK1DHlSPuPsUGPr1Qly8nq8DcJAl/ZSwBq9AI2Bos+89nZF8dkRFM8R
	vWobuoxV+ntK1nyVPlC+qWSdiIz8m8LhlwqFkebj0ibK4SMAneDxIbDxI2XlGVYM8QGIzcdwtTC
	d4MA==
X-Gm-Gg: AYBFou2tFTlqSwdbLCp4maab/Iq0jt8e4lPdXt2x0aadMxIKD+I5QVgwtK+ABP1s6Ci
	P5MR6LUbZsYWoQkvqK7rmDKZH0QvD1bXGvjCIomwKEauCWa70CRt75T0gtZlX0QUmzEVpnDrKUR
	d7AT7mXkQU1hJ/65kvYYD4ITfk9oUI3pxihs4MoNXuGhcEjBIm81Pvog2PsF96znNp0o0YRgugB
	+PmAIxkqrc3iB0Oe0OCBrMVJ+uirPAADLNkn7np4Ll2WEuclxhTb7DvZZC/azTl9CU02shNXZy6
	4WH3yFSBP6se2veqVb9jR/D1+ZIPhUCKZB8AToUvZgPderLyDwpFKg0yu+V5C3n7F0JOyW3AX1f
	voGoKEWh06jSxO+r6IbBWo8uZQcpCNS9nUb5CJzPEKEGlW2Zvc0WB7gXwJw==
X-Received: by 2002:a05:620a:4448:b0:93c:8544:6adb with SMTP id af79cd13be357-944217452fbmr1624819685a.22.1793620143813;
        Mon, 02 Nov 2026 03:49:03 -0800 (PST)
X-Received: by 2002:a05:620a:4448:b0:93c:8544:6adb with SMTP id af79cd13be357-944217452fbmr1624815485a.22.1793620143115;
        Mon, 02 Nov 2026 03:49:03 -0800 (PST)
Received: from [127.0.1.1] ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b725b8sm19766031f8f.20.2026.11.02.03.49.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 03:49:02 -0800 (PST)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Mon, 02 Nov 2026 13:48:49 +0200
Subject: [PATCH 1/3] clk: imx: imx8qxp-lpcg: Reject duplicate clock indices
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261102-imx8qxp-lpcg-duplicate-clock-indices-v1-1-1c3fc3fe727c@oss.qualcomm.com>
References: <20261102-imx8qxp-lpcg-duplicate-clock-indices-v1-0-1c3fc3fe727c@oss.qualcomm.com>
In-Reply-To: <20261102-imx8qxp-lpcg-duplicate-clock-indices-v1-0-1c3fc3fe727c@oss.qualcomm.com>
To: Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Dong Aisheng <aisheng.dong@nxp.com>, Shawn Guo <shawnguo@kernel.org>
Cc: linux-clk@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>, stable@vger.kernel.org,
        Sashiko <sashiko-bot@kernel.org>
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1829;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=RZEyaaRYv13ION5f4rFj0UmX8ETzVTuM6plCBDtwyOc=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBq6HioIWI3xswy035/XchzkLlv/zm+EO8le5/XT
 q7Qq8mSYTWJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCauh4qAAKCRAbX0TJAJUV
 VsgOD/928SW+qLHLOl65n0GZb9QrujQ7Zureyizl9t0OefVjcjP21mykAsMGIeEoSniHqjhS3dh
 9o8386WaJvvhd5U4wyUjSbUPpzcavUDc6slJx1/60PP/YryK/qVjGlcFleMuT6imAr+3sb6Rphw
 3SnbFJGW21xR3VXYtqQZ2BvRYfWLuMdJM2czD/JayDvIdZgAd8oW0oA5+6OL0Q+FLmUSWP/ZNq2
 yiiDwCdGdw5ci7oMkyYGevi4TMJMdnyI6nEFlHH5dV92XqMAdqO7KbiVhEMcbsBnDpOLJqk00KU
 xAkz8nXjgFIxauRSkC1X58XKqbRpl9MUp0BNLVqlL3PVU6yl/ehyQ7ptdPuBMHhWpbpfs1k5thP
 mO+dUTSE72BWuFEr0HW2/4lgDOEcVH+WU6+8g3YtLoqr4jsW88SBIXOxhZcIMdk6RBTsTYD81VL
 MyHijeMbiIZ64URrco3dciJk4VgOdzdgQLAZvvK+y2AHKxCeY/r97P4xdYMOXfvFj/up7SzEdLC
 YhtYHzUZIDSSezYOuK/ona9sODz/Fpj0+sX7TyfX4JbX0vFQ3e6hA2Mw+irtKf3H8g7zcToyhYw
 FR1YL9p3sHJDCAVx1oUFGzn8LceOnKcKpwD0hEKSB2eHAnBC9zAGHD2PqzQjCS+DxsWx21KMGmn
 aw7oXRdJ0mjQR3w==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-ORIG-GUID: Z9E2HyEqtF0QlakoxJUdOqiojc4ZvSu9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA0NiBTYWx0ZWRfX0AT3EBgH4f0A
 s4Da8aHkd0XqUZD7YF6/7sfD+A3XDBQIXVTLN0o2bC2daem3ciaD5ML+PP/AcVRX25WoG4PQEDu
 VtH6sbAgN707JE8KAyR43yjHeQuoiQ9KL49urQKdpTYmwkahxL0gFSdT2duTaJNMCek3tz4BMQH
 AzBVeUJTkQCxZdirA4+ReOkhbUkFMTlDqIvccm/v5rEI6GE+DjiQhY5yvW2uCuwh0U+4otDYf8s
 qHNv+Pj0ZEPxU3SSy9suGfphaXyP5bpvethgikGFJfcygZ05HM3kSANm0rjUH+TBG0yWtDyUBcs
 UYwqw2nNLuyjLfyq1ACdrPzk5tgelDavZAi5nPPtzCTVJITfeRdSD0naUSXFhRU+hvIwCjHuoyC
 3idDEqO8upGLzfjMjDdEkss4sRuuzJmc/85fJ+GZL5uj3wA9VFrq5IUdkAx19JIKEiFHpg/S1rq
 9a5YPWIrlEzAe6Arttg==
X-Proofpoint-GUID: Z9E2HyEqtF0QlakoxJUdOqiojc4ZvSu9
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA0NiBTYWx0ZWRfX62Fpu2eA+5j3
 B/UBJh9gAYMml4Ansm8t6SzTbdZUFV5BeRVmspFFXgtlQeaWy2F7B4arX9zL33I/PoCR8OW9bUW
 LqhFpxCIF/Mhocgp2AlbDgXuHwSKQnk=
X-Authority-Analysis: v=2.4 cv=LvwHWXdc c=1 sm=1 tr=0 ts=6ae878b1 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=c92rfblmAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=eKaI5DNhNXE6fe47w8EA:9
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0
 phishscore=0 priorityscore=1501 adultscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020046
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_034905_816273_8074BE82 
X-CRM114-Status: GOOD (  18.08  )
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

imx_lpcg_parse_clks_from_dt() stores each clock it registers in
clk_hws[bit_offset / 4], as every clock output of an LPCG owns a 4-bit
field. Nothing checks that the clock-indices property names each field
only once, though. If two entries fall into the same field, the second
registration overwrites the first one in clk_hws[], leaking it, and if
a later step fails, the error path computes the same index for both
entries and unregisters the second clock twice.

Reject a bit offset whose field already has a clock registered.

Fixes: d5f1e6a2bb61 ("clk: imx: imx8qxp-lpcg: add parsing clocks from device tree")
Cc: stable@vger.kernel.org
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://sashiko.dev/#/bug/linux-07b8d98e-feb9-4c88-afb6-3b5e0b05dc00
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 drivers/clk/imx/clk-imx8qxp-lpcg.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/clk/imx/clk-imx8qxp-lpcg.c b/drivers/clk/imx/clk-imx8qxp-lpcg.c
index f0cf6cf91899..e57e7bc074a9 100644
--- a/drivers/clk/imx/clk-imx8qxp-lpcg.c
+++ b/drivers/clk/imx/clk-imx8qxp-lpcg.c
@@ -251,6 +251,19 @@ static int imx_lpcg_parse_clks_from_dt(struct platform_device *pdev,
 			goto unreg;
 		}
 
+		/*
+		 * Each clock output owns a 4-bit field, so two bit offsets in
+		 * the same field would describe the same clock. Registering it
+		 * twice would leak the first registration, and the error path
+		 * would then unregister the second one twice.
+		 */
+		if (clk_hws[idx]) {
+			dev_warn(&pdev->dev, "duplicate bit offset of clock %d\n",
+				 i);
+			ret = -EINVAL;
+			goto unreg;
+		}
+
 		clk_hws[idx] = imx_clk_lpcg_scu_dev(&pdev->dev, output_names[i],
 						    parent_names[i], 0, base,
 						    bit_offset[i], false);

-- 
2.54.0


