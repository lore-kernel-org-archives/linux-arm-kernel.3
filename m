Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76F83606A324
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 04:49:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=uK+17tJ4;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=Z+iei15s;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=HW/gtEYO;
	dkim=neutral header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NtQV1e6+
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=aLQirFytpFjaE6BC34p8KJJHy2Uy3xoA/cAaFgViJ0I=; b=uK+17tJ4Ps52Bn
	FqSE4gRUFWV6DEER6e0gFQvNDdmHCNf0aBCR7jq5Skr8fwBxKSRnLykNtE7wL9n/c53whKk+M+SuA
	BIYBNSrifpYKSsUKgCNQz9gsc2k3Wwr+aSrqOqQEHoEA/dR7qRs7HCouXJ/NifHbYjWZfK64GbAsv
	viTVuik7MpHLppHXI656DOQg2oRDxmoU2adysRd9ROeu3037Xm9dRzjrND9gS8K7LaTPk2jC6yv/N
	T64it+qwVzW8vwm59jxRjQvGQUZNHIQ5JqyfS2iP3y7VmyMpjxAyEedWAoc+Ycl4IC+DvLQ/nNi2e
	TGJL9+6BUxD7pqkQH1sw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xO6Sb-000000015ps-43UW;
	Tue, 03 Nov 2026 04:49:26 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xO6SV-000000015fo-1Vza
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 03 Nov 2026 04:49:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=aLQirFytpFjaE6BC34p8KJJHy2Uy3xoA/cAaFgViJ0I=; b=Z+iei15sRIYqhiWj03MjToaNap
	ZAfqKoVgnvEtFVBT/OT8o6mF/7RHICikVcYY2GYIVXi1qqY2XiOpeFeVMB8kK4DkUga4jmLLhoAry
	nTZVFyoyYpfkxWivBNvLaEHTSg6u8Q9NnFZI1ERaFoD7PPiycZjcYuXj6XbnFwrmVr5PECJiLHs0i
	oO7u/F5jsMivvdTfPGdppfN0sYSDrJXV+BhIhDansTmEk4L9/ka1B/LnoUP/1xSrasM4Zr3EuWjm9
	82yvazxe7Od2bzptYS2AFbzWXSpJVQoiiwyteNSQhiJ5a5eC1n0oBd3DTFiAk7RlrwAAuxb2EK1qp
	j3RXmF4w==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xO6SR-000000001Ym-0w6c
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 04:49:18 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A34h7IF750935
	for <linux-arm-kernel@lists.infradead.org>; Tue, 3 Nov 2026 04:49:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=aLQirFytpFj
	aE6BC34p8KJJHy2Uy3xoA/cAaFgViJ0I=; b=HW/gtEYOYq7qPFBq0/gQqd/3Np+
	RcWkro5MXkDQIBNCR1TXtNRsGdHdCsQiKw66Sx/kGOr08qK1PaXIYeiYJ/wry6uM
	IU7tQM6geAV3UkQw7gLioBgYAttptD8T/JeAJmiwFCc9gFObLAjDR+kgZ4ePka+/
	DIwNKCEntBWFyADddc8uBtmmvwNeqL0lke39UycuBFBUqhVai/E8ChTizHlMoEZF
	SliM+VOWEWpM+qr655TBkIyu0lnOX/Q+j1HrAaXJXhi1af8JH+sJorsELhWbkyMN
	uYU/CWsrEhRLd3ffRmnO+FLwWOy4ETQslXaj0tuelDfhTGhWCPmWUNlgDVQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hq8u5g0m2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Nov 2026 04:49:12 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93f5844cb60so71067485a.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Nov 2026 20:49:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793681352; x=1794286152; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aLQirFytpFjaE6BC34p8KJJHy2Uy3xoA/cAaFgViJ0I=;
        b=NtQV1e6+4WXuZHXdg6NvOsvFeRTfYfYK5qbiIBtrJ2O/ewfo0EYWkDeJYnzwHOabPy
         cjilrP9wmLvVjW7Tq4EdmxcamuLDNXOOFtu/HXeJTfxO9I+xu2RIHaAT1yODRgDamM2p
         qMUBDn+LYNsOyQYoifPMrkkdy4GAM4LMAfCo8/MNbkRGQfHHEi1yuP+sIxEYkkN4UXCd
         o0UI6vwRY8ZYuNSA4znqLkytuLMxtiLbh9RvXCzye9Lo04UV+/P87TD8Y6QwiiIxTbcI
         dCXcZYdVVc14Y9UekAOJjOB4/S/CcYzrlE8hOgdmxreIEiF89FVGN1LybMCWsxT5y3x5
         7KRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793681352; x=1794286152;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=aLQirFytpFjaE6BC34p8KJJHy2Uy3xoA/cAaFgViJ0I=;
        b=AGd2XS1asCmh/0Cj2RFLHPqN0eWtnlV/K8qfFyvROnDEzJQP5JqYQdmf1v2NcR84vr
         p+JNsYi1s8nBPXO0Yhn+kzOvuslCrBfKB91WA7Wm7pzs8n8PVJ7Sy0Eq5pBQWUvSrPoL
         sW7tEg7E8ulBKT4MANkgMjg+yU8KuGpiwkF1NWw9S2AqfjLrKmc0X4oqsnt6e5L9+r01
         PYJ5QC18akEDLOhTU8dhNME1Kr9pfnrBDDg0wLUIhVKrbh7sgZT7DSJxedusWBbiHV4D
         eS+0vYcPeuziEEupzg4cBb9Pd+Gz468iDOBtPn/F+DJRaTM0TfWCpCQ+hm9ZxHkaJl0/
         71OQ==
X-Forwarded-Encrypted: i=1; AKwUvBwKfJ2Q9bvEvxO8YVcmkuB2ir7D1+BzLzGCjy4bra1WZUwSBBroKIyJng8B5wGPILA3wI9YEysOwWRI9cIVoed0@lists.infradead.org
X-Gm-Message-State: APuU4Z+aBn9Ad2okIYhdZBVvh5h+hQfbbWwbuEIRtekk8VxAs41HlkvX
	r5yr1j7vZPr1rZygMlj21tTzMnvIFoscnB40oFXDJzuv/ToAg7+XcRIKfEaHgoPCJn3xHQBZ73M
	PwXHQJFauI9cnv5qTjiWafbURFM7zvqggs+fTwRPu+XdcAUy15hsCgQb+ApQqb2C8B8+HvDUzq3
	91BA==
X-Gm-Gg: AYBFou0U2YFTxzdu58xYrL3z8shyKUp9YOYgKPOqW42nxbZpOWMkWjG9Pn4s7ddeYtw
	RejMplBVj+AzhU4WT1SztYysk+fNJPbIaMax//Pk63bythxvHHBgdzfKHjEBkBSNsYevVRSDQXj
	C0QqPSWHsHR9xof2LRcoEgn/Z+m5QzGxrmyoLhLGNZai71mcA6axWC1KPePKqumgGSW1iJI8O6K
	jtpthS3FXMQiDqzP2y+2efsMFQBhgI3gFatqE1iPrR78VOBAdEl4b9D8ALTe+wRHM+WX8SAdsGK
	qXAuIym9yDv9hHHhjPXi2HCjGGEhBm/SgkLAvMbkWXHo1xRSB7GeR2zkzj5bVf/KfyNVgDe+ubo
	CCwg//JEHehzbqBLBEOsplIe68vLguk4fDixBr+2DmlzQTLnGgC7uL+b9dDzP6W7KBog47W7dxD
	VG
X-Received: by 2002:a05:620a:4052:b0:93c:290e:9e9c with SMTP id af79cd13be357-9441337e6c2mr2383284185a.16.1793681351792;
        Mon, 02 Nov 2026 20:49:11 -0800 (PST)
X-Received: by 2002:a05:620a:4052:b0:93c:290e:9e9c with SMTP id af79cd13be357-9441337e6c2mr2383281885a.16.1793681351285;
        Mon, 02 Nov 2026 20:49:11 -0800 (PST)
Received: from mai.box.freepro.com ([2a05:6e02:1041:c10:8b9e:7797:dd05:11cb])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b2a879fb29sm25685445e9.4.2026.11.02.20.49.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 20:49:10 -0800 (PST)
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
To: rafael@kernel.org
Cc: Daniel Lezcano <daniel.lezcano@kernel.org>,
        Heiko Stuebner <heiko@sntech.de>, Shuah Khan <shuah@kernel.org>,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>,
        Lukasz Luba <lukasz.luba@arm.com>, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-kselftest@vger.kernel.org
Subject: [PATCH v5 6/6] powercap: dtpm: Add RK3588 hierarchy
Date: Tue,  3 Nov 2026 05:48:20 +0100
Message-ID: <973998404b628e5a995a06fbd0febce0802f79bd.1793666444.git.daniel.lezcano@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1793666444.git.daniel.lezcano@oss.qualcomm.com>
References: <cover.1793666444.git.daniel.lezcano@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: SH0OrjygLEAauobSs_UCJvB4-oh_fyoy
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDAxOCBTYWx0ZWRfX1s+a/TpMzK41
 pOUt1kXZqmtN0XaLOyG/xyZbBvXTLcvdROTercDbyug8caRGp+5s1M9Zzk3Wn1djYn2dUrGgNc4
 G4ZeAK/k8u0s2snNa/7lED3ErKj0Oto=
X-Authority-Analysis: v=2.4 cv=RZ0FmFtv c=1 sm=1 tr=0 ts=6ae967c8 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8 a=7CQSdrXTAAAA:8
 a=8Fys3Dm6xgAeGQ2jRPYA:9 a=PEH46H7Ffwr30OY-TuGO:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-ORIG-GUID: SH0OrjygLEAauobSs_UCJvB4-oh_fyoy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDAxOCBTYWx0ZWRfX5Mv70ACrh2Sa
 +3oPALumbw4jsqAMgt+1xS4aySusc+4dOSJeRi8F2mr6FWa1F6H6/YyEvHHHmNADGxIR0w4iaCG
 r3SNhBlLnXUVxpbbRU9JoWmtfHbuiAkhwwzPf0DNupa8HT5zx2rY5c54pfG4aoSeI6hMOm7Ci+b
 fvUhg0fLmyDNm6xn3BesI001eeuLVxqfBFFcrGzjTIcThVkbTiIfQ3pfpvW970POhknEBtc2vvy
 z8wzF4dI2oM/wGdzJ5uH8h064kRtRjvG4cpWr2J/QnZxHKJHIW8FMsiVLhZsSh+V73okQEPveRl
 rUARUDAyuxqeqdecU90xNGbETNn2vEoamI2BN4F8ub5DVpEEOaJu8C019GsmqaXVKVN1MWqs51t
 WR7g+ZIZUWW1JleYRwVbJ3XYBen3doWAsWozHFHe2G0L5x4rq5haGKboH7QefqzX10yBBz3P+9c
 8xm2McBOJDraLR8SXOg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_01,2026-11-02_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 impostorscore=0 phishscore=0 suspectscore=0
 adultscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611030018
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_044915_391814_3051FD7F 
X-CRM114-Status: GOOD (  18.82  )
X-Spam-Score: -0.9 (/)
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
Reviewed-by: Lukasz Luba <lukasz.luba@arm.com>
---
Changes in v5 (since v4):
- Add Reviewed-by from Lukasz Luba; no code changes.

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


