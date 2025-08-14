Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4609CA0EE6
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 Aug 2025 14:16:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XGSs5337IWx6k+Rc5sX8684eoZR0vHL6YFzfrSWkOLQ=; b=3tMttBp+R3fgnateIfLQQqYiTZ
	c/5MkwPgMZpqR2EatyApelkZhYGIbAsrPuNRTnuB2uOR8wJRv5ylaMHwMJjtqmYzW3sfFPaG3ZbDv
	8DIYxQhxA5Fkz1u00Us1CiFHKlZKWY6KvCo6zpq0byKST+wne7HmvrkYxpq4m8oWcT1ARgXgG3M2g
	nmzSjkrYaV+uvxoZZRcbIYJexw/924/1V7QsZ1/0e5tebObVKbw4IWqdERTXy+fC7q4iCoVb64udr
	9qGCYWzAU7w8LZc9uu4igNufCKicUNQoKXyv6YgEmEFtAk2oDDC7ijUIQAmf5NoiWHHq18IRj9di9
	prOyc+0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umYko-0000000HCi6-33X7;
	Thu, 14 Aug 2025 14:16:30 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umV1k-0000000GYpo-2IKu
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 14 Aug 2025 10:17:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=XGSs5337IWx6k+Rc5sX8684eoZR0vHL6YFzfrSWkOLQ=; b=KvaATycAQfz2AqMQdUtbxC8BaZ
	4ZJVRCZGSyNyp0EMrda97N0Ed0+2uztjqsgnNmJLi67sdi88WlGkzoi/ZlW9F3x/cgdf84pWB+KUf
	uQu2p/2bvoNEolF7iW/VIXo05h6EplQMTVm3NzPEF9nd7UCnbH8BdYLK+yzSsanVNuOQGdmn6uE8T
	XBqeoxBM2zAT7tvrToLQ20ra1EAKVQd+fIxt2hG8TF8m4bBEGziBzBxXhxdJSQVDofsl6xpOzzpUy
	6570SdD783tC7luTFJP7v3D7fFMX/GBFj5/B4brjhf5yyH4UkXYt+2qf4h7hDAwfjsy0fIzvbG794
	PoAf0ntw==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umV1g-0000000GM2D-3LxV
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 Aug 2025 10:17:43 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57E9knt0012963;
	Thu, 14 Aug 2025 10:17:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XGSs5337IWx6k+Rc5sX8684eoZR0vHL6YFzfrSWkOLQ=; b=QxnwmGS1m5cVgotn
	iCxEQwGHD7i3dxkMCtnG2LLQW7Cd7JAfCeaYJcYU8VWAne+50R/EOAhKFKuBilSF
	tc0TMYUogMFwUf9g9RBcM+Fw0BZbDaXy60mlyvzHuNedlMxWJ/f/drXlCvw2v+Ub
	0dHiajbTDOuRJD9h5COyQU4u7RPG62icqYYS+A/zUWrJDZ+81fthzbdkj+5RwxxM
	NdIRPQO1RwQFJAsNQ9p0XhElxjDMHnEEdXL4gajIg7pqGkS4XiwEsfM6JtItZpBu
	nQYh85wu5y/9xYnojA/7FZNIqvdno9hhzeD1nxZ5eEfbdb8dC62Qll0lhAeSPuk8
	lYB/VQ==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48ffq6u5b0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 14 Aug 2025 10:17:30 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 57EAHU1S029925
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 14 Aug 2025 10:17:30 GMT
Received: from hu-vikramsa-hyd.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Thu, 14 Aug 2025 03:17:24 -0700
From: Vikram Sharma <quic_vikramsa@quicinc.com>
To: <rfoss@kernel.org>, <todor.too@gmail.com>, <bryan.odonoghue@linaro.org>,
        <mchehab@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <andersson@kernel.org>,
        <konradybcio@kernel.org>, <hverkuil-cisco@xs4all.nl>,
        <cros-qcom-dts-watchers@chromium.org>, <catalin.marinas@arm.com>,
        <will@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <quic_svankada@quicinc.com>,
        <quic_vikramsa@quicinc.com>, <linux-media@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Wenmeng Liu <quic_wenmliu@quicinc.com>
Subject: [PATCH v5 7/9] media: qcom: camss: Add support for VFE 690
Date: Thu, 14 Aug 2025 15:46:13 +0530
Message-ID: <20250814101615.1102795-8-quic_vikramsa@quicinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250814101615.1102795-1-quic_vikramsa@quicinc.com>
References: <20250814101615.1102795-1-quic_vikramsa@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODExMDA3NSBTYWx0ZWRfXwVAsthZ6ZyLM
 2Xndu/7RRJMrHxu2Ta6ZvJ1PoRijgvr28TbsMFDNlzrTcjVbinVw/GK79lgRE3+1Ng0duxaV4je
 KpPBpAUcFmM39HMAYvFHLjaJ0sqSUA8QGe27OD2OB066Vl52sKAecgEv9wA15/fgzLCHUunNFqG
 TusbOHfTNI70uyBx8XJjIn+lBEFs2H2v9V3bUv+hlrNLExYk6ZZ3zjIwLCUQl1M1+Ayr1c/JCT+
 d9CPFJXmi+imyUsLpcbTXlpYZv5Q6wLrKEZa7hSpI9mk2fyjMl7uFljFzijtegtvotxIGVqw6Cr
 NdKaU59b60waAIsGAU4if0Rcb4Iu7zOYMX8Dj1Rrg3ASb0vNXf5jt1d4rSUfbBji0o4il+rQOTb
 j05Jrzcw
X-Authority-Analysis: v=2.4 cv=TLZFS0la c=1 sm=1 tr=0 ts=689db7ba cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8 a=KKAkSRfTAAAA:8
 a=365kDP01LW04tWo7BCMA:9 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: yyqJ8i6UHYR9zNAsGp-x1oTUEt2T3Tgn
X-Proofpoint-ORIG-GUID: yyqJ8i6UHYR9zNAsGp-x1oTUEt2T3Tgn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-13_02,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 malwarescore=0 spamscore=0 priorityscore=1501
 bulkscore=0 adultscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508110075
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250814_111741_329102_75D3D00B 
X-CRM114-Status: GOOD (  19.69  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Add support for VFE 690 found on lemans(SA8775P). This is
different from vfe 780 w.r.t few register offsets. It
supports two full and five lite VFE.

Co-developed-by: Suresh Vankadara <quic_svankada@quicinc.com>
Signed-off-by: Suresh Vankadara <quic_svankada@quicinc.com>
Co-developed-by: Wenmeng Liu <quic_wenmliu@quicinc.com>
Signed-off-by: Wenmeng Liu <quic_wenmliu@quicinc.com>
Signed-off-by: Vikram Sharma <quic_vikramsa@quicinc.com>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 .../platform/qcom/camss/camss-vfe-gen3.c      |  67 +++++--
 drivers/media/platform/qcom/camss/camss-vfe.c |   5 +-
 drivers/media/platform/qcom/camss/camss.c     | 174 ++++++++++++++++++
 3 files changed, 228 insertions(+), 18 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-vfe-gen3.c b/drivers/media/platform/qcom/camss/camss-vfe-gen3.c
index 93d16b0951e9..f2001140ead1 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe-gen3.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe-gen3.c
@@ -12,13 +12,43 @@
 #include "camss.h"
 #include "camss-vfe.h"
 
-#define BUS_REG_BASE			(vfe_is_lite(vfe) ? 0x200 : 0xC00)
+#define IS_VFE_690(vfe) \
+	    (vfe->camss->res->version == CAMSS_8775P)
+
+#define BUS_REG_BASE_690 \
+	    (vfe_is_lite(vfe) ? 0x480 : 0x400)
+#define BUS_REG_BASE_780 \
+	    (vfe_is_lite(vfe) ? 0x200 : 0xC00)
+#define BUS_REG_BASE \
+	    (IS_VFE_690(vfe) ? BUS_REG_BASE_690 : BUS_REG_BASE_780)
+
+#define VFE_TOP_CORE_CFG (0x24)
+#define VFE_DISABLE_DSCALING_DS4  BIT(21)
+#define VFE_DISABLE_DSCALING_DS16 BIT(22)
+
+#define VFE_BUS_WM_TEST_BUS_CTRL_690 (BUS_REG_BASE + 0xFC)
+#define VFE_BUS_WM_TEST_BUS_CTRL_780 (BUS_REG_BASE + 0xDC)
+#define VFE_BUS_WM_TEST_BUS_CTRL \
+	    (IS_VFE_690(vfe) ? VFE_BUS_WM_TEST_BUS_CTRL_690 \
+	     : VFE_BUS_WM_TEST_BUS_CTRL_780)
+/*
+ * Bus client mapping:
+ *
+ * Full VFE:
+ * VFE_690: 16 = RDI0, 17 = RDI1, 18 = RDI2
+ * VFE_780: 23 = RDI0, 24 = RDI1, 25 = RDI2
+ *
+ * VFE LITE:
+ * VFE_690 : 0 = RDI0, 1 = RDI1, 2 = RDI2, 3 = RDI3, 4 = RDI4, 5 = RDI5
+ * VFE_780 : 0 = RDI0, 1 = RDI1, 2 = RDI2, 3 = RDI3, 4 = RDI4
+ */
+#define RDI_WM_690(n)	((vfe_is_lite(vfe) ? 0x0 : 0x10) + (n))
+#define RDI_WM_780(n)	((vfe_is_lite(vfe) ? 0x0 : 0x17) + (n))
+#define RDI_WM(n)	(IS_VFE_690(vfe) ? RDI_WM_690(n) : RDI_WM_780(n))
 
 #define VFE_BUS_WM_CGC_OVERRIDE		(BUS_REG_BASE + 0x08)
 #define		WM_CGC_OVERRIDE_ALL		(0x7FFFFFF)
 
-#define VFE_BUS_WM_TEST_BUS_CTRL	(BUS_REG_BASE + 0xDC)
-
 #define VFE_BUS_WM_CFG(n)		(BUS_REG_BASE + 0x200 + (n) * 0x100)
 #define		WM_CFG_EN			BIT(0)
 #define		WM_VIR_FRM_EN			BIT(1)
@@ -39,17 +69,6 @@
 #define VFE_BUS_WM_MMU_PREFETCH_CFG(n)		(BUS_REG_BASE + 0x260 + (n) * 0x100)
 #define VFE_BUS_WM_MMU_PREFETCH_MAX_OFFSET(n)	(BUS_REG_BASE + 0x264 + (n) * 0x100)
 
-/*
- * Bus client mapping:
- *
- * Full VFE:
- * 23 = RDI0, 24 = RDI1, 25 = RDI2
- *
- * VFE LITE:
- * 0 = RDI0, 1 = RDI1, 2 = RDI3, 4 = RDI4
- */
-#define RDI_WM(n)			((vfe_is_lite(vfe) ? 0x0 : 0x17) + (n))
-
 static void vfe_wm_start(struct vfe_device *vfe, u8 wm, struct vfe_line *line)
 {
 	struct v4l2_pix_format_mplane *pix =
@@ -62,14 +81,24 @@ static void vfe_wm_start(struct vfe_device *vfe, u8 wm, struct vfe_line *line)
 
 	writel(0x0, vfe->base + VFE_BUS_WM_TEST_BUS_CTRL);
 
-	writel(ALIGN(pix->plane_fmt[0].bytesperline, 16) * pix->height >> 8,
-	       vfe->base + VFE_BUS_WM_FRAME_INCR(wm));
+	if (IS_VFE_690(vfe))
+		writel(ALIGN(pix->plane_fmt[0].bytesperline, 16) * pix->height,
+		       vfe->base + VFE_BUS_WM_FRAME_INCR(wm));
+	else
+		writel(ALIGN(pix->plane_fmt[0].bytesperline, 16) * pix->height >> 8,
+		       vfe->base + VFE_BUS_WM_FRAME_INCR(wm));
+
 	writel((WM_IMAGE_CFG_0_DEFAULT_WIDTH & 0xFFFF),
 	       vfe->base + VFE_BUS_WM_IMAGE_CFG_0(wm));
 	writel(WM_IMAGE_CFG_2_DEFAULT_STRIDE,
 	       vfe->base + VFE_BUS_WM_IMAGE_CFG_2(wm));
 	writel(0, vfe->base + VFE_BUS_WM_PACKER_CFG(wm));
 
+	/* TOP CORE CFG */
+	if (IS_VFE_690(vfe))
+		writel(VFE_DISABLE_DSCALING_DS4 | VFE_DISABLE_DSCALING_DS16,
+			vfe->base + VFE_TOP_CORE_CFG);
+
 	/* no dropped frames, one irq per frame */
 	writel(0, vfe->base + VFE_BUS_WM_FRAMEDROP_PERIOD(wm));
 	writel(1, vfe->base + VFE_BUS_WM_FRAMEDROP_PATTERN(wm));
@@ -92,7 +121,11 @@ static void vfe_wm_update(struct vfe_device *vfe, u8 wm, u32 addr,
 			  struct vfe_line *line)
 {
 	wm = RDI_WM(wm);
-	writel((addr >> 8) & 0xFFFFFFFF, vfe->base + VFE_BUS_WM_IMAGE_ADDR(wm));
+
+	if (IS_VFE_690(vfe))
+		writel(addr, vfe->base + VFE_BUS_WM_IMAGE_ADDR(wm));
+	else
+		writel((addr >> 8), vfe->base + VFE_BUS_WM_IMAGE_ADDR(wm));
 
 	dev_dbg(vfe->camss->dev, "wm:%d, image buf addr:0x%x\n",
 		wm, addr);
diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/media/platform/qcom/camss/camss-vfe.c
index 4bca6c3abaff..99cbe09343f2 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe.c
@@ -346,6 +346,7 @@ static u32 vfe_src_pad_code(struct vfe_line *line, u32 sink_code,
 	case CAMSS_8280XP:
 	case CAMSS_845:
 	case CAMSS_8550:
+	case CAMSS_8775P:
 	case CAMSS_X1E80100:
 		switch (sink_code) {
 		case MEDIA_BUS_FMT_YUYV8_1X16:
@@ -910,7 +911,8 @@ static int vfe_match_clock_names(struct vfe_device *vfe,
 
 	return (!strcmp(clock->name, vfe_name) ||
 		!strcmp(clock->name, vfe_lite_name) ||
-		!strcmp(clock->name, "vfe_lite"));
+		!strcmp(clock->name, "vfe_lite") ||
+		!strcmp(clock->name, "camnoc_axi"));
 }
 
 /*
@@ -1974,6 +1976,7 @@ static int vfe_bpl_align(struct vfe_device *vfe)
 	case CAMSS_8280XP:
 	case CAMSS_845:
 	case CAMSS_8550:
+	case CAMSS_8775P:
 	case CAMSS_X1E80100:
 		ret = 16;
 		break;
diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 5f1e267045cb..08763d92f659 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -2687,6 +2687,180 @@ static const struct camss_subdev_resources csid_res_8775p[] = {
 	},
 };
 
+static const struct camss_subdev_resources vfe_res_8775p[] = {
+	/* VFE0 */
+	{
+		.regulators = {},
+		.clock = { "cpas_vfe0", "vfe0", "vfe0_fast_ahb",
+			   "cpas_ahb", "gcc_axi_hf",
+			   "cpas_fast_ahb_clk",
+			   "camnoc_axi"},
+		.clock_rate = {
+			{ 0 },
+			{ 480000000 },
+			{ 300000000, 400000000 },
+			{ 300000000, 400000000 },
+			{ 0 },
+			{ 300000000, 400000000 },
+			{ 400000000 },
+		},
+		.reg = { "vfe0" },
+		.interrupt = { "vfe0" },
+		.vfe = {
+			.line_num = 3,
+			.is_lite = false,
+			.has_pd = false,
+			.pd_name = NULL,
+			.hw_ops = &vfe_ops_gen3,
+			.formats_rdi = &vfe_formats_rdi_845,
+			.formats_pix = &vfe_formats_pix_845
+		}
+	},
+	/* VFE1 */
+	{
+		.regulators = {},
+		.clock = { "cpas_vfe1", "vfe1", "vfe1_fast_ahb",
+			   "cpas_ahb", "gcc_axi_hf",
+			   "cpas_fast_ahb_clk",
+			   "camnoc_axi"},
+		.clock_rate = {
+			{ 0 },
+			{ 480000000 },
+			{ 300000000, 400000000 },
+			{ 300000000, 400000000 },
+			{ 0 },
+			{ 300000000, 400000000 },
+			{ 400000000 },
+		},
+		.reg = { "vfe1" },
+		.interrupt = { "vfe1" },
+		.vfe = {
+			.line_num = 3,
+			.is_lite = false,
+			.has_pd = false,
+			.pd_name = NULL,
+			.hw_ops = &vfe_ops_gen3,
+			.formats_rdi = &vfe_formats_rdi_845,
+			.formats_pix = &vfe_formats_pix_845
+		}
+	},
+	/* VFE2 (lite) */
+	{
+		.regulators = {},
+		.clock = { "cpas_vfe_lite", "vfe_lite_ahb",
+			   "vfe_lite_csid", "vfe_lite_cphy_rx",
+			   "vfe_lite"},
+		.clock_rate = {
+			{ 0, 0, 0, 0  },
+			{ 300000000, 400000000, 400000000, 400000000 },
+			{ 400000000, 400000000, 400000000, 400000000 },
+			{ 400000000, 400000000, 400000000, 400000000 },
+			{ 480000000, 600000000, 600000000, 600000000 },
+		},
+		.reg = { "vfe_lite0" },
+		.interrupt = { "vfe_lite0" },
+		.vfe = {
+			.line_num = 4,
+			.is_lite = true,
+			.hw_ops = &vfe_ops_gen3,
+			.formats_rdi = &vfe_formats_rdi_845,
+			.formats_pix = &vfe_formats_pix_845
+		}
+	},
+	/* VFE3 (lite) */
+	{
+		.regulators = {},
+		.clock = { "cpas_vfe_lite", "vfe_lite_ahb",
+			   "vfe_lite_csid", "vfe_lite_cphy_rx",
+			   "vfe_lite"},
+		.clock_rate = {
+			{ 0, 0, 0, 0  },
+			{ 300000000, 400000000, 400000000, 400000000 },
+			{ 400000000, 400000000, 400000000, 400000000 },
+			{ 400000000, 400000000, 400000000, 400000000 },
+			{ 480000000, 600000000, 600000000, 600000000 },
+		},
+		.reg = { "vfe_lite1" },
+		.interrupt = { "vfe_lite1" },
+		.vfe = {
+			.line_num = 4,
+			.is_lite = true,
+			.hw_ops = &vfe_ops_gen3,
+			.formats_rdi = &vfe_formats_rdi_845,
+			.formats_pix = &vfe_formats_pix_845
+		}
+	},
+	/* VFE4 (lite) */
+	{
+		.regulators = {},
+		.clock = { "cpas_vfe_lite", "vfe_lite_ahb",
+			   "vfe_lite_csid", "vfe_lite_cphy_rx",
+			   "vfe_lite"},
+		.clock_rate = {
+			{ 0, 0, 0, 0  },
+			{ 300000000, 400000000, 400000000, 400000000 },
+			{ 400000000, 400000000, 400000000, 400000000 },
+			{ 400000000, 400000000, 400000000, 400000000 },
+			{ 480000000, 600000000, 600000000, 600000000 },
+		},
+		.reg = { "vfe_lite2" },
+		.interrupt = { "vfe_lite2" },
+		.vfe = {
+			.line_num = 4,
+			.is_lite = true,
+			.hw_ops = &vfe_ops_gen3,
+			.formats_rdi = &vfe_formats_rdi_845,
+			.formats_pix = &vfe_formats_pix_845
+		}
+	},
+	/* VFE5 (lite) */
+	{
+		.regulators = {},
+		.clock = { "cpas_vfe_lite", "vfe_lite_ahb",
+			   "vfe_lite_csid", "vfe_lite_cphy_rx",
+			   "vfe_lite"},
+		.clock_rate = {
+			{ 0, 0, 0, 0  },
+			{ 300000000, 400000000, 400000000, 400000000 },
+			{ 400000000, 400000000, 400000000, 400000000 },
+			{ 400000000, 400000000, 400000000, 400000000 },
+			{ 480000000, 600000000, 600000000, 600000000 },
+		},
+		.reg = { "vfe_lite3" },
+		.interrupt = { "vfe_lite3" },
+		.vfe = {
+			.line_num = 4,
+			.is_lite = true,
+			.hw_ops = &vfe_ops_gen3,
+			.formats_rdi = &vfe_formats_rdi_845,
+			.formats_pix = &vfe_formats_pix_845
+		}
+	},
+	/* VFE6 (lite) */
+	{
+		.regulators = {},
+		.clock = { "cpas_vfe_lite", "vfe_lite_ahb",
+			   "vfe_lite_csid", "vfe_lite_cphy_rx",
+			   "vfe_lite"},
+		.clock_rate = {
+			{ 0, 0, 0, 0  },
+			{ 300000000, 400000000, 400000000, 400000000 },
+			{ 400000000, 400000000, 400000000, 400000000 },
+			{ 400000000, 400000000, 400000000, 400000000 },
+			{ 480000000, 600000000, 600000000, 600000000 },
+		},
+		.reg = { "vfe_lite4" },
+		.interrupt = { "vfe_lite4" },
+		.vfe = {
+			.line_num = 4,
+			.is_lite = true,
+			.hw_ops = &vfe_ops_gen3,
+			.formats_rdi = &vfe_formats_rdi_845,
+			.formats_pix = &vfe_formats_pix_845
+		}
+	},
+};
+
 static const struct resources_icc icc_res_sa8775p[] = {
 	{
 		.name = "ahb",
-- 
2.25.1


