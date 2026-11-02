Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA173606A326
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 11:49:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=OjWoYeWp;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=N3ow2HUe;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VfCGniGV
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=MIhl96XrVO6h3egsH716wpa0+bzeQt1syKhoX13a6Ew=; b=OjWoYeWpg1is0o
	bNNYdKDULSwp9ERHiH5FklSiQD49XurczG9Ntx5PbcKuUHqDmsLV5gc++FB81fSe+aOmzgLb9i1ZV
	Y2mb0/uyReBsOAsbFsISn8GTBBnrfiZIzBuPPD8Pcim49Gr2akkd3JDNHWn1fA7GOcI57SUV66D0a
	iqlitJLRL5vXRGhocg2P7kTaBxZrBik7Po937UqStDNraBYfP6OcNFgIn5CwG2layuiti/fhidqpA
	AySc3Wu2h6ltPQCSEUgB2dALHLR9AkJOVwzc8k/ZmWNN4ct5RrvIHUva3wEqGrItELsfwkz6HNqY1
	L9YMd+wMHItfFH+pSzjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNqXH-0000000GO7L-2iLX;
	Mon, 02 Nov 2026 11:49:11 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNqXD-0000000GO6A-2ViU
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Nov 2026 11:49:08 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A29AMLl1821122
	for <linux-arm-kernel@lists.infradead.org>; Mon, 2 Nov 2026 11:49:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MIhl96XrVO6h3egsH716wpa0+bzeQt1syKhoX13a6Ew=; b=N3ow2HUeRab9Viro
	5nysgmFgkDbs5ypqJJilqqtXkzVhOwlmho7t34QDW11POrylfI8KQ7kW66kEsNSw
	wcxCXBdxjlZsLXe3G+T8oLu1+JdMvShcWkJI+rqeMdcjoPftFEIzrAfCH1fLjP75
	0REt7Kb5VcY5O+bt4Rzkt8gyh6Ss9c5Twhkdb18/RCV2yHnBguxrQVv6UW+qiZJm
	1WkDDoyg4J109pjMIiNVE/XYpR1mB+2155izGnGMBEH+oK3umgFPPExrbXsmj3qU
	CSz8FrRG05nrWA8chnJ+I49xNnIK2LhTleI39hYUEF/9wLkDdRke+DiEi6785RnO
	xKFb3A==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpky4hgf1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Nov 2026 11:49:07 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93ce7a85f04so583280785a.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Nov 2026 03:49:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793620146; x=1794224946; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MIhl96XrVO6h3egsH716wpa0+bzeQt1syKhoX13a6Ew=;
        b=VfCGniGVfJMMf8ROfTcTaWfAvcLUQyAVKedBsmOmleODqY1eYVnmAFzNjg8NfZe68f
         s7IWr15CIMukamNl7HTI6opBwA0hkZ+irDxQgPkj0XaLuVv/Fes2uc46kqg/V+Mgn3aA
         wYd9i/nU6F8pueCoggmsR9c32tTrCI5d0BzCcKpmoYfv3L9wUMuRqS5/YuJ5MIaFKihM
         FwaEv7DUnkfJF7RKKa838sAStP9lksTU8k+8xkxOICdh1JGrTi+0pUTI8RyMl24hmiDr
         vc9Em0jUD1sBN8rqdoHdPNe347XKCiwPidChSUoQsREXhyIIjKVknZl4El8uEeZ8oIC3
         UgpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793620146; x=1794224946;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MIhl96XrVO6h3egsH716wpa0+bzeQt1syKhoX13a6Ew=;
        b=zykED4XC7jMYlc6TbOzXrWXJjS2QXr7d6yordUo4KnWm/bbUuxglsx0IAH/w1KPjSv
         cLK+GuAEkTiorAy1LfYaLGZHLX00ehMfebFtmnR6rcPbkgJUJftDkeAn9EEUJezaHqJj
         iyCVSr42TpshiRnvXBLSIG7bbgxo8EcDOsfyMnBBlinMVXr5DY3Y98fzcWC8o8PGNPM5
         svgfxhg8T9cmpgNiLX6oXTpbv0FxLQ9EEoizrgCyBiR/OpbPfQ9hS5LSd+PIQA7Kax2K
         gXvxt3vGl5fHX3jJ3aC/k2FgrKCzqM45YmENETLK43jB4O0jYn7qIkRuE2+RixBJUO2Q
         /dkA==
X-Forwarded-Encrypted: i=1; AKwUvBxWsiW/NlUc63nbQG+Atzz/K5K5E17b1YrGRtCNywVLz0JTAMyMYTCaPlxFQ0XH1aZ9c+LQN0+IqV8zcLTPdfO5@lists.infradead.org
X-Gm-Message-State: AFq9FYKLnL4IBOuM+wXwKJl68WUqayz9f+EG3PYih7xSdgovEfrSUn76
	67y+JGqLWwV9DinTIqQniCJivWRsGY0FCQX33pXEE1W9NGi0ker2uxcgYslAIPZUUh23RJihhIt
	c6Ib5knVP051W4wbs+oVNi1M0pKdKTbMAmn+gQZhYcviGNIoWQifdx3RDIfaC1y/X9zLqKPvb0/
	flPg==
X-Gm-Gg: AYBFou2BDAa+YnqdKuRCTdRciL+EenlRqBwSxL6pJS2W5gj6rIrzHoXJVfrSMFLfwRt
	Ys3IftV4MZgUchqnm1EKQJYJgyvXHv7QtbYc30sIdbEVLfmLpDSN6RbF9VP/GxNxVopg6vpimnM
	UOno77PSC9xdwPjK8pMAPILnEOSiomJ6s3piFnIPjI9gRQ9N5KiztB/OgVX9TAcNK3EHQCrs1sz
	/fwxvGC7hbNZEqh3LUcG7D9GnYlLFMO939PuL1TsoWaY/SCwFPll60b1Ku7U06TB2dIW//f2Gk6
	mesQC00OI52+cWlJq4DmJRCCt7vdKxIPZW/Vf2tO3E1jXR35hKtO0ChxAH/b35hHiuuCEJj05+0
	Mpjnvz0RwrSxSaZRR9C7A6GD+wD2L/Ffbi48Fmbjh/odNQg0iNi82i6f5ag==
X-Received: by 2002:a05:620a:2794:b0:93f:61a6:b7a with SMTP id af79cd13be357-944217b8e35mr1507869585a.62.1793620145785;
        Mon, 02 Nov 2026 03:49:05 -0800 (PST)
X-Received: by 2002:a05:620a:2794:b0:93f:61a6:b7a with SMTP id af79cd13be357-944217b8e35mr1507864885a.62.1793620145048;
        Mon, 02 Nov 2026 03:49:05 -0800 (PST)
Received: from [127.0.1.1] ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b725b8sm19766031f8f.20.2026.11.02.03.49.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 03:49:04 -0800 (PST)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Mon, 02 Nov 2026 13:48:50 +0200
Subject: [PATCH 2/3] clk: imx: imx8qxp-lpcg: Fix stack overflow with too
 many clock indices
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261102-imx8qxp-lpcg-duplicate-clock-indices-v1-2-1c3fc3fe727c@oss.qualcomm.com>
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
        Abel Vesa <abel.vesa@oss.qualcomm.com>, stable@vger.kernel.org
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1320;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=dhlDpkiSrZhRzO/cBPcN3/Bco39G80HHAf8kGP7ODtU=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBq6HipW6PTYPSJAlrKvb7+9EmcAI3l5HEoGI7/I
 2F4ZkNz09eJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCauh4qQAKCRAbX0TJAJUV
 VkNrD/9rDjIkvAY9Zjhn8SYl9PRi56nuL9RalFeecAW+CPPz37wCegFcwBum1JuVTWOtlGmnHoT
 5LGTqDf/fcJEQhLpb0c6MwAxvbQ3VqpeBRGzfkfN3NYAquxuDXmpaNqRYCOQDJn5U/KAINI46Bi
 v+zKjnd+i1IgUPIa3URFlvM0O+AQfoPKwPJjI5k9HMJ4Abu7WphOR0JAOCPp1IpcvdhfVG0JeG+
 zyaWy6yUPaqOgQERPFEkBRzpadAyOllZ5Jz2k5HzfkDMCKLnD8CMK9KEymw1n7jFPYMl47Yfznb
 zL9aLn1gEif5ciH6hJ8H/oS07giqUhGnJ6z1V87got0QndfFdjm3XP/nYI2RX/GS99nbP1Bin3h
 OoFQY8sPu3syIbMjei9MKmDRFpY+kctJ4rQlXoh5IiEGbhhs07X9PzfOTxpe/a+DKi1++yxQCo/
 KoR+QXmPc4kG77mJKvsf25NsMzjKKGjisECaJk07bswkgNGZF4pR10HQd2qczgYbeI2Uf5uBVgl
 HFE+I1wywFJuSZ/pGHo71+kCx7ar8VgLejjGssWuTLWPkFel3DrDeBIi97VAy7mglug8gVdLAw/
 H6q6heBVtbSP4Avb4mrOc7uBGB4J3P/1ejQfyYSRKjXLtaZY8gIRIf8iBIEyQrAGlpJsFVa68H+
 9r2f/OcNO43eJRA==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-ORIG-GUID: fF1gpLebDy-Gtd4wFoXkk6av7e3Cu2zq
X-Proofpoint-GUID: fF1gpLebDy-Gtd4wFoXkk6av7e3Cu2zq
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA0NiBTYWx0ZWRfX81fY5NcWAxGw
 3H7IQHTDhNqrhpDal7mf6S6uKBMKuA/By2dR4tsz7xgYFWOQR2eTZmvhlepqxeGK74gm0uCCzfO
 sT+af1wqoOuJm+lFL0pisUBo4q/3rRA=
X-Authority-Analysis: v=2.4 cv=QoHLTlyd c=1 sm=1 tr=0 ts=6ae878b3 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=ci3yrrcZy3FTaSNcm8YA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA0NiBTYWx0ZWRfX7kM2Rz9FZo29
 /XWf8CDF+ZsGnwSbliLNyTQx1DNr4HLyr5hNkX43IATHC6tk46pJMQ08Qvd2n52o1tbSrhQspOV
 MsHYLzKalJ8zf/QopF/+CO3EtXRGtgrk+u9AD9wd4Y/j3Qk5i8o/UAE5TwyHx2u9UlbKtp8lVVx
 7lN6cmK7OEgcx2Q70ar0n2QlRN9F9bGB3VzHlggl2jplP7UrjLZ5R6ClB8kKy/bU4CMyOf1sZ9f
 kyBsZSRlPOaWoYkNuqLOmcXnqWVaQofFu3LOl5/JR/xayyHHMNnUXo/QxaZrEhCJRC+7M/x92Q2
 kzbQjRcIjl5j95p1pTkElQKAuS5vv0apfgGyzGzrkV0qV/ar/JMxuVK4Wf6mZiMDiAOhxR3A+mP
 BR0a1jIcol1597PNBJqs6Gm0N++iC/utTYBdZP5k2jqHufMrhEfZlXv+hPW9U3+EqOxUCTuRULw
 GAcvXHJBIEzfWC1fZjA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 adultscore=0 spamscore=0 bulkscore=0
 suspectscore=0 impostorscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020046
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_034907_644530_9844D987 
X-CRM114-Status: GOOD (  15.54  )
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

imx_lpcg_parse_clks_from_dt() reads the clock-indices, the parent names
and the clock-output-names into on-stack arrays of IMX_LPCG_MAX_CLKS
entries, but sizes the reads by the number of clock-indices entries,
which it never checks. A clock-indices property with more than
IMX_LPCG_MAX_CLKS entries thus makes all three reads write past the end
of their arrays.

An LPCG has at most IMX_LPCG_MAX_CLKS clock outputs, so reject a larger
count.

Fixes: d5f1e6a2bb61 ("clk: imx: imx8qxp-lpcg: add parsing clocks from device tree")
Cc: stable@vger.kernel.org
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 drivers/clk/imx/clk-imx8qxp-lpcg.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/clk/imx/clk-imx8qxp-lpcg.c b/drivers/clk/imx/clk-imx8qxp-lpcg.c
index e57e7bc074a9..ae8cb5408246 100644
--- a/drivers/clk/imx/clk-imx8qxp-lpcg.c
+++ b/drivers/clk/imx/clk-imx8qxp-lpcg.c
@@ -200,6 +200,11 @@ static int imx_lpcg_parse_clks_from_dt(struct platform_device *pdev,
 		return -EINVAL;
 	}
 
+	if (count > IMX_LPCG_MAX_CLKS) {
+		dev_err(&pdev->dev, "too many clocks: %d\n", count);
+		return -EINVAL;
+	}
+
 	/*
 	 * A trick here is that we set the num of clks to the MAX instead
 	 * of the count from clock-indices because one LPCG supports up to

-- 
2.54.0


