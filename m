Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3A5B606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Oct 2026 16:58:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=nNrRaDdB;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GXs86wpK;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EYFrANb1
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=hTV/3nn/Rkcmn0hRyZbdsZoeAcUIyL6tsSbtRE9aXY0=; b=nNrRaDdBTFwUGc
	UY4US6asBZvmvyXPDnrf51En9tFPVIyABI8cs58E2znpfQDObJiF2yhqRrBxCRbB/dyPqxvSJWpds
	z6WAIT6AQIvKJ5aoxqS3nyxV98WxnbEgddeWYcvBTrG+x8KMXHqnto3+vO3dYX6xt2Q+RellJ9MzT
	grUWxNtbTg9sIaCfZ4uFVAnD239zpIBuIvRsiv95FmL1r8HJWoJyqLfLnT1Hh0VlmlNuWfZhvDj1g
	v9sbFaRhasfJStXJ2w63HrVNqXtfhcvW5Ylc7RYKso5liRkT5jqPF8sa7TswlJxKDw8hf5Z5gJmnJ
	tuw4Dreb2R7cx5nSP1mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMTS9-00000009tzK-20EP;
	Thu, 29 Oct 2026 16:58:13 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMTRh-00000009tQa-2FK0
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Oct 2026 16:57:48 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69TGDPb3594481
	for <linux-arm-kernel@lists.infradead.org>; Thu, 29 Oct 2026 16:57:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=hTV/3nn/Rkc
	mn0hRyZbdsZoeAcUIyL6tsSbtRE9aXY0=; b=GXs86wpKTuJaEtB7IvbsrQaIJiD
	Vzau5SA5Ip+Va4Mf7Yqhhf2vXf1VBswh8RUkDV6XmXP4UTiDz83JhUF+8vSeo+Fl
	SIxDn4xWqgvL126WPyWvXV31hOW1RV9v3jnDpX/7UDRCeP7qR0c97qiVWXf5HEFc
	tD/swatm7oFrd2gPzLbFoMU1FyoI9OTwCeprbTcqlsSzoiqUukoqjDDju6Q6CrpU
	uLNUnGdd+69JCAh4/HgijN6/8kUn+oiYlhFekVGKj5hfMFiTK5vO3LLWUtD0fA6/
	ymfcWcqp4hGlkl3kp1PsW9LTPKvtkyJiIm3nt3868LpR3rnGO/ombmT9hQg==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hkut3kjag-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 29 Oct 2026 16:57:45 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-988be118d98so564547241.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 29 Oct 2026 09:57:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793293064; x=1793897864; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hTV/3nn/Rkcmn0hRyZbdsZoeAcUIyL6tsSbtRE9aXY0=;
        b=EYFrANb1VKBZzWZ2yikSLNwnlutT0zSb4RdgKkusg0O+eOjElV0QAMvil+X80rYwW+
         AmBKDjK6Kc+ouD+Phl44mF5pIZcXdjykI8Is4s2D7rSElavzN5Ge3bJho9J7whiBZPLZ
         EHPTpP5VIbFgGTr6boKap665ZDXWvmAyTlw9CHZgXhytiT8O1vs894rZjAFfBVGv7bE2
         K9ajV5CsWRruDu8pN0QN74WLlzZBfsDpXx0nUpic9Cc2j7lXc/MOmCAh9VySgs2oF2j+
         r3OEpj8de/NcMxZjKEGmmRk57tUkQNG2jOlpInD4ocqb2xIzqrEuXa7RVKb13di7uyna
         /kCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793293064; x=1793897864;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hTV/3nn/Rkcmn0hRyZbdsZoeAcUIyL6tsSbtRE9aXY0=;
        b=TGTMSXUN3nHFxwe4R6R3aYul/HKfcjhJYkEXQFvCXTvha9oq+4XCj8kRVOJ0P3Kk6h
         eiwKlyWeSIo0AgBjGXgrZgvlCKKxWGh6OBqPQeHdFa8FN0z6Ck0qESpffDVLhkrX8GqD
         9BpKRAWRq1wXB4RRT7dNZufYi4dnkAtbyXfkUWmlbQpzx7aJVDkOvQeqA9LCRBCSqIMX
         y8KMMZ8J0PspEGfNEcZG0lraCv+jtsUYKzHUIBw7xZU4peovkxLEtM2rWPwI31GAdzX5
         mYy1HbNfcftCE4vhS4OMndZkDsEaR4SOs6lXaN0SvK2iNWDjQOo3SYUSAq+wPn0ykSr6
         rgSw==
X-Forwarded-Encrypted: i=1; AKwUvBxkdgLoeJXGOIP9N2RN3Jxc17UeGhZvonLwomgV5/gqMp6ApSFsmpcuM+zEHX4acy7YIXxgR3NTdIQSGE1+s7bZ@lists.infradead.org
X-Gm-Message-State: AFq9FYKS1XIA1z97FAnyXLW4Hjrt7bO6kpOfA2PuNfuK7JCDK2C8Wrl3
	Rv9UFS7nSC8udnXcxvF/EhjIwfxuYK+HoG0XAuA1dop2Iz1rX40OIUw+cWDPpibewgin6194r/Q
	lZURN+JUhPjMnBvYk+ktMdVPN6Ry5LIqNND7u609UaSYP+QyTz7JkNTaAcEt2kCrByiB9itXNeG
	a25A==
X-Gm-Gg: AYBFou0rjlRLXoUj64bFbYDSn5+NoQs1euIdaBVjzS7D033rkPWpXPTcXVnQ2jSBHMM
	KkJvxrOoP5Ho4bYz/3d+lmak+wzOtEPMdO/0DadllbnV0WhcP4Qmr5TTdbcSGVlCPaqu6ISKXLT
	ZSJwhl9kaQBv8SJDmotZhlrYhjKU+H9YUKi6Xg+UQJ/QMjwtNHGNezo4RhnSxP14/zj7MEcM98O
	SddBAdsl29HdD+w077Jp44SJvZLrbmNe7ZBCsP1lkrSonEJHHGaO5263No2ivkzdzBWquiBTuw3
	zznzHPxqOXINENIKb1WkRv6lZWKd/lhm04Qf1RbOlKwft6w8OYYdAppRNy/N5vkO7ptgjja96/9
	tetvZy7g+bnzhtnjeA6J8wXYaCauJu6E1foZtx1aFbQnUIleFKdakjH2cW4QJdhXxRRZBhAzJYO
	fD
X-Received: by 2002:a05:6102:80a5:b0:7a7:19aa:f0d4 with SMTP id ada2fe7eead31-7d03a651783mr2367414137.33.1793293063984;
        Thu, 29 Oct 2026 09:57:43 -0700 (PDT)
X-Received: by 2002:a05:6102:80a5:b0:7a7:19aa:f0d4 with SMTP id ada2fe7eead31-7d03a651783mr2367399137.33.1793293063416;
        Thu, 29 Oct 2026 09:57:43 -0700 (PDT)
Received: from mai.box.freepro.com ([2a05:6e02:1041:c10:7fbe:151a:486d:a2cc])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e6df961dasm325669f8f.23.2026.10.29.09.57.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 09:57:42 -0700 (PDT)
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
To: rafael@kernel.org
Cc: Daniel Lezcano <daniel.lezcano@kernel.org>,
        Heiko Stuebner <heiko@sntech.de>, Shuah Khan <shuah@kernel.org>,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-kselftest@vger.kernel.org
Subject: [PATCH v4 6/6] powercap: dtpm: Add RK3588 hierarchy
Date: Thu, 29 Oct 2026 17:56:50 +0100
Message-ID: <50f06fc06f0e83ee59ecf9037071e02344ecd15b.1793288783.git.daniel.lezcano@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1793288783.git.daniel.lezcano@oss.qualcomm.com>
References: <cover.1793288783.git.daniel.lezcano@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDA2NiBTYWx0ZWRfX4FBZhgcwtw1J
 knPddkXCoN/b1TYn8zP+e3Bd8FHHdnC4YTJUScMxIwjYFU3gkf16NHnKHO2xD5XRwRhrrj2tuat
 brBn8GEMGyL2FbpS+phaOfGqmQf/PKY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDA2NiBTYWx0ZWRfX28G3DkhlDYlS
 Dvm9HqdFV1kFSoNAXIkEErgWVXFFtaAlKVNYH1ru1p+Wh56yotdM53i/ktdu9OdevKkIDDtStsk
 x4jEoJ9IEsiBqU1SkJhCWa59oceOMr5GdymCreubdzlFBdTw8j6bT7mzhVGlZ5XzCQdNHb8XTEB
 MeC530gDeQ4nLpJEUmG95BUQ4aMoFOMFJ357TtVTJrkuvMLDyChcb0mr8yMT9dGopXJUGRIwxWy
 LFfJGuN8yhsSPuc+iaFG2tsCHbEp31RLLa4WX5bsbhkJTu0+Q5kNDIxDpf7xjqmPC6Oj1rQ+hds
 KPmdvcK3FJKh9FDPzc4UedFKaCsPvaGWT8TpFAJGnMMkSnGaruZA4mbhCT9uhGPqQIHaBGJI9E5
 6CPHjX9nEFHeUKo6sfDiYVgRviEvZrz3X0ctw/ZxLpm6KBt17Dkne5X6pa65MPLq1aM+96CliyN
 2h6nuHffH6fSFRfr8RQ==
X-Proofpoint-ORIG-GUID: yBXXwbd4gL-mUFqgOG0Nxx_LS8a4f6z2
X-Proofpoint-GUID: yBXXwbd4gL-mUFqgOG0Nxx_LS8a4f6z2
X-Authority-Analysis: v=2.4 cv=HYSB3SE8 c=1 sm=1 tr=0 ts=6ae37b09 cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=xqWC_Br6kY4A:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8 a=8Fys3Dm6xgAeGQ2jRPYA:9
 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-29_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 adultscore=0 suspectscore=0 clxscore=1015
 spamscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610290066
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261029_095745_574187_4B39852F 
X-CRM114-Status: GOOD (  16.40  )
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

The RK3588 has three CPU frequency domains, with CPUs grouped into
three cpufreq policies.

Add a DTPM hierarchy for the RK3588 with one CPU node per cpufreq
policy, represented by cpu@0, cpu@400 and cpu@600. Group the three CPU
domains under a virtual package node attached to the RK3588 root node.

Add the RK3588 compatible to the Rockchip DTPM match table to select
the new hierarchy.

Signed-off-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
---
Changes in v4 (since v3):
- Rebase on v7.3; no code or commit-description changes.

Changes in v3 (since v2):
- Rebase on v7.3-rc7.
- Fix __initdata placement and the RK3588 match-entry indentation.
- No functional changes.

 drivers/soc/rockchip/dtpm.c | 48 +++++++++++++++++++++++++++++++++++++
 1 file changed, 48 insertions(+)

diff --git a/drivers/soc/rockchip/dtpm.c b/drivers/soc/rockchip/dtpm.c
index 5ae00680602f..664764f4b460 100644
--- a/drivers/soc/rockchip/dtpm.c
+++ b/drivers/soc/rockchip/dtpm.c
@@ -62,8 +62,56 @@ static struct powercap_hierarchy rk3399_hierarchy __initdata = {
 	.nr_nodes = ARRAY_SIZE(rk3399_nodes),
 };
 
+static struct dtpm_node rk3588_cpu0 = {
+	.type = DTPM_NODE_DT,
+	.path = "/cpus/cpu@0",
+};
+
+static struct dtpm_node rk3588_cpu4 = {
+	.type = DTPM_NODE_DT,
+	.path = "/cpus/cpu@400",
+};
+
+static struct dtpm_node rk3588_cpu6 = {
+	.type = DTPM_NODE_DT,
+	.path = "/cpus/cpu@600",
+};
+
+static struct powercap_node rk3588_nodes[] __initdata = {
+	[0] = {
+		.name = "rk3588",
+		.data = &rockchip_virtual,
+	},
+	[1] = {
+		.name = "package",
+		.parent = &rk3588_nodes[0],
+		.data = &rockchip_virtual,
+	},
+	[2] = {
+		.name = "cpu0-cpufreq",
+		.parent = &rk3588_nodes[1],
+		.data = &rk3588_cpu0,
+	},
+	[3] = {
+		.name = "cpu4-cpufreq",
+		.parent = &rk3588_nodes[1],
+		.data = &rk3588_cpu4,
+	},
+	[4] = {
+		.name = "cpu6-cpufreq",
+		.parent = &rk3588_nodes[1],
+		.data = &rk3588_cpu6,
+	},
+};
+
+static struct powercap_hierarchy rk3588_hierarchy __initdata = {
+	.nodes = rk3588_nodes,
+	.nr_nodes = ARRAY_SIZE(rk3588_nodes),
+};
+
 static struct of_device_id __initdata rockchip_dtpm_match_table[] = {
 	{ .compatible = "rockchip,rk3399", .data = &rk3399_hierarchy },
+	{ .compatible = "rockchip,rk3588", .data = &rk3588_hierarchy },
 	{},
 };
 
-- 
2.43.0


