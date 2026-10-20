Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F100606A322
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Oct 2026 14:18:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=PgwNddSm;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=HTPDiGzf;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AHTXK47i
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Yt8E290dh+tISv7RUY4FIj09Mh2VhHp+yj63FHALQjc=; b=PgwNddSmR8MeyehJvHEQPLvsPY
	GZBXCf+9XdaPeMpnm1u2dwCU1OhUegkSqApALvhknZzY3RjG02xFrPQAQ4sVzyWVLWOzY/0iHvoTt
	pLT6NUupJ7HEQFtBzuo2RiK/YB82cE70d23xeDqCEKqigoEGzU2MMR9ZOglkWbQwT/AP8u8kel/i6
	0iJ7xwaNJ//gJKUS80JL+U7TDixNq5U7fltj4RcNlixZPUpamvx9d2kTglmVTU0jpXHWAlv08KENK
	I1a1iIrowNH+OaEaAE6Jq4uNu9dfDQlTenRi3seSci8k6E+o7ljXJPSuV/ZhKrffN4u0U9dg0tF8X
	Q644I3BQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJAfE-00000009ugp-1yGI;
	Tue, 20 Oct 2026 14:18:04 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJAey-00000009uPR-0nmc
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 Oct 2026 14:17:51 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69KDAHDo1209933
	for <linux-arm-kernel@lists.infradead.org>; Tue, 20 Oct 2026 14:17:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Yt8E290dh+t
	ISv7RUY4FIj09Mh2VhHp+yj63FHALQjc=; b=HTPDiGzfWdVUe/V1+jG0cjMtZDg
	whabYYTeFVEldVcYw0qR6EO1OYDdKi0ZaVAjAkOznL+PaOwru5/S7K6yF9njp9ld
	17R056nH4/QOBZ9gO2sRZgbXH9yTwvYuJ9+NWwlezCC9mmJsjVkZJCoCT1dVjXms
	lnBjyV8wDGo2eoV9WDnBQ0h8uydGxNYPUM4sNtdAS5siRok672umX+l+eg9L/Bqk
	XqA8wtOC3j4pEowXgV0hvvxN8ltatQaGNrD65uk+FKexRvO2+g5OT5FsG/il4Jp1
	VHMQYiDa/jW4fcxk2eIVxX3FM6Rej5JY+EnUK4HOlVEOekTTTWDrrSuQK9w==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5pav0v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 20 Oct 2026 14:17:47 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f3969a2a7so389596885a.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 20 Oct 2026 07:17:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792505867; x=1793110667; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Yt8E290dh+tISv7RUY4FIj09Mh2VhHp+yj63FHALQjc=;
        b=AHTXK47ihTKYmhWIskcZGC9MRVgvh8wwqqkhJ+gDoZR3vSfYWEVYg58lkFqp38iWcn
         1SL9UqGOR6H9/yNnqSeHlMvN5DJiQdYXGcGAbZkZxf8Wb64Weh3ACn5Enc/DGezHtaRl
         vKm5mCJpO/E0DT8xTw0UnB7mfF0GcY78XpLLu5nPEcKGEnbz3jyo0nFvW8X71tgKVSsl
         QHMMgsLgQDYULQrVHFDeoWWymgvhC2Yy+fsuiJGJUtrfpYH/fZXVLnlfJRxZ9E3s9EdG
         QpCXVGBUrVQo5+2sPT1rvT/yHsQUzpWTL7A2I+9aQni6mAKeyIBNhgEIr4rJxVojGgQQ
         jTAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792505867; x=1793110667;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Yt8E290dh+tISv7RUY4FIj09Mh2VhHp+yj63FHALQjc=;
        b=pjGIapSsdFbIDdnT6mCOE2Vjhmz113sX1flWRghbxZawcb7NhffjKV9/WQt2tjEMDp
         +PAGhx2jB73MV+W4x2naMpMekd/LHxwKjOCdnYJqdedCXgQ0kaP4RC/UU0ZOFE/hG72Z
         t59Yi3Hql858PNo8XR5Dy8ORzkYOenB9U1gmnM/4KuJeycPlhDH3LV94Hj8gCH7+UtFn
         InR8mfj8bnuiwOeEqh764FRIuycpCpX4MqNq8+hGMJGw6RIMjtIVRQ52qcr9XFcVDKVH
         8bk5HyYjfRpqEXJnSFF2BqQqWewcLTFNcv/BLU2XidEHfz1tjNTSF9upGTWmXdFfh51J
         zMOw==
X-Forwarded-Encrypted: i=1; AKwUvBxit8tx+kAk0043nW8NEAbfjJsOIiQnxldg4nwDJBN5ybzXcafcUMSwKbNRun35xPQT2JfQXUiGF8Md8q9VrTwI@lists.infradead.org
X-Gm-Message-State: AFq9FYJZhloFvtSujQu3LTDbOba49LywgRrLKSAu6rJZYcfVD/ZhGFsB
	vCNpjwRf5nXPnqnSvNQi1vrPgNlXuSgo83Duym3DS5y/61h1uXoH/VGuYEAy463vIpGGtOmXdT7
	WMId9R6k8aVQgeVEE/QL/o2SIYu5OMTxYlarLlDbuAPW7/xxYJgW6z1WBGSnHPcNczc82+Ltf25
	cazg==
X-Gm-Gg: AYBFou3fqNjJzbQoHGshD7nNOZzM+a2PneR+WSFPMNRBz1WeRzUIJIn7DNrTnhIWUiw
	rIrZKEBVIVFrvoSK61Jf6M5w9wQ7AdI87T5TaYoeUt/LiAy0aiprpYbVmGmkYAcYf77DIXvy7Ui
	fkGG0qKMXsZtKKsnIq75nV2Y2NGEvMvFiULUkMpwPwq6zJ6LrFIlGqFPCshKWr11j98lppMpfG4
	AtNxpUltvDo069x7WvnLGRMGCDx+PQ/6JwCYBtQdafWIjYdaG+klrqe6KfQVzn9Ps8y+eEVqwx1
	EnUwAQWf8iWSV8vi4V/RHmE3kAQnHxrzWN4y0+VCT0QyOYhOHKBcTv8O7RCtN8u6ZrfN94BhZa9
	eALXKlLFR8yBI8D1glAcgd/U4pVE=
X-Received: by 2002:a05:620a:2609:b0:93e:9934:d179 with SMTP id af79cd13be357-93f29d8f1b2mr1783591285a.56.1792505866761;
        Tue, 20 Oct 2026 07:17:46 -0700 (PDT)
X-Received: by 2002:a05:620a:2609:b0:93e:9934:d179 with SMTP id af79cd13be357-93f29d8f1b2mr1783586085a.56.1792505866248;
        Tue, 20 Oct 2026 07:17:46 -0700 (PDT)
Received: from mai.box.freepro.com ([2a05:6e02:1041:c10:4884:6e9a:d9ff:9fa6])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e1d810043sm6642276f8f.16.2026.10.20.07.17.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 07:17:45 -0700 (PDT)
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
To: rafael@kernel.org
Cc: Daniel Lezcano <daniel.lezcano@kernel.org>,
        Heiko Stuebner <heiko@sntech.de>, Shuah Khan <shuah@kernel.org>,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-kselftest@vger.kernel.org
Subject: [PATCH v3 6/6] powercap: dtpm: Add RK3588 hierarchy
Date: Tue, 20 Oct 2026 16:16:56 +0200
Message-ID: <e271d25192830ee02fe75bf0d5e698487b1579f7.1792504834.git.daniel.lezcano@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1792504834.git.daniel.lezcano@oss.qualcomm.com>
References: <cover.1792504834.git.daniel.lezcano@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: K2-NHPNrrHG_qvkagSj9ap_xpXiajSN4
X-Authority-Analysis: v=2.4 cv=fb84WEQF c=1 sm=1 tr=0 ts=6ad7780b cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8 a=8Fys3Dm6xgAeGQ2jRPYA:9
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDA1NiBTYWx0ZWRfX2XLzjNEpn21N
 aF2a0+DTgPvQ5cG/ONWgTPFjs9mNG/2RR4OIU4ABpHs0R7fJmO6IluwjRfKrfFsOVUB4ba3BO3l
 8QXDHTxFVsgZNmjD7cUtNJsfzeXmvoi6g6+TX2g7IJ25MxSvcTWcwrKvBZ6Ub98KPN6CfSR9Ep9
 gEwRq1OJ8n4C6VFqWfTthhivH6tRBOlyYh51dvFXNhSdcKRmW+ackwe1ISh401iKfNxqZ8juLzF
 e4Gjo27I29+vu5MGj85u34RPL47AtfVPqemYi0EWuGdhGEfT8FFadi5ZfjMb3vR6psOxjbvB6f7
 uvKwQzBaGPGE2CYfty80ezFJfYBb6gc2zfhKT1kuQXNvjWuGZv0hFlQJujSirBnDAjB37QRyDhy
 hQSLmkPEKUUl7bQRbwtEb4tfXbw55092VX2o4Q5sytTjnNFvC9nlkkiNlR/KVY+tdmzhmOuOtEW
 VhB0ad4FBIYhlW2wS6g==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDA1NiBTYWx0ZWRfX1Qxz6ZLgT6ra
 mM50q0tLU9IJk2WlV77tQIH0gkn+3cmp4BVhOhOE/Ve0LG4PaUIXGudr/dhMxT+ixI+96HapzUd
 xPEQXgVzfQV4qlWtQJjoQr7sIbWqZ0k=
X-Proofpoint-ORIG-GUID: K2-NHPNrrHG_qvkagSj9ap_xpXiajSN4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_02,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0 adultscore=0
 phishscore=0 clxscore=1015 bulkscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610200056
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261020_071749_325516_F3490247 
X-CRM114-Status: GOOD (  17.50  )
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

The RK3588 has three CPU frequency domains, with CPUs grouped into
three cpufreq policies.

Add a DTPM hierarchy for the RK3588 with one CPU node per cpufreq
policy, represented by cpu@0, cpu@400 and cpu@600. Group the three CPU
domains under a virtual package node attached to the RK3588 root node.

Add the RK3588 compatible to the Rockchip DTPM match table to select
the new hierarchy.

Assisted-by: LLM
Signed-off-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
---
Changes in v3 (since v2):
- Rebase on v7.3-rc7.
- Fix __initdata placement and the RK3588 match-entry indentation.
- Add Assisted-by attribution; no functional changes.

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


