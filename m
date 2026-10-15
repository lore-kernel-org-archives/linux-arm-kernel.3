Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2F4BCC6B34
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Oct 2026 12:59:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WhXW32ULll9zpgefHefrkMytXocm7R9Jk8nCG3El2sM=; b=jbJqLSiur9tcRna9EWAqXT3+tn
	YEZx1To3t++kyDEiruNbgGFf4X07ukMOIGUMqnnKCHli8nkG22qS5LBckAZ1Jd9VRpHTK7lzrQTej
	3TbieNzmz2DBsQ2L5zgwF4zRGPXEMJFnCoTPFuzlQhjiIdvrsGf9zdEFLRUpL3KGIZ950VDfM69Fg
	kDBnBB7orIbon3udYM3P1EEeeDPUIuGkSxlgO1mn4FsxiN4FpyqzvirEGnXJgjpIWS5RgZ7WgxI3K
	+8xqg3Q185esepGUqVqCzjmzVO0gzkCoQOwrIFtdaHj34Y+GATPKiAbHjw4CCdUQoX9+pXF2L0EhF
	wNAYqxIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHL2t-00000000Bt3-09aN;
	Thu, 15 Oct 2026 12:58:55 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHL2q-00000000BrC-2LZr
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 15 Oct 2026 12:58:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=WhXW32ULll9zpgefHefrkMytXocm7R9Jk8nCG3El2sM=; b=UN18E8dU24k2Re+z4Ds3nS1ErH
	/3xRTjYtCkwCRwG5syfKsFiV3CHgW5zf122c+DRGMsaUQ/U03XpUop66KfeqbOIABkkbltddjvA1T
	Hn7JJeMNxLb2htmh+WadrIuxc+gk3Q6NsGueRgU8kJnIa2Od2Y1uNle8+Vyq3MBYXzqG1brOFh5iL
	BU2Z7920ZZd5VWGBQ6B3L1zvWTCmlvx+Y59g1qtvL3CnkiIB2sNULohavW8cKtASJ/KzZy1/uKgxo
	H9eOwtHFF+j7nbNadK8phvOhRs2aE4SXgGtc+My8kiS1I8I+I9FRTxfq2CjGF8s8IqJz6bY1n7rCF
	vO6EEIxg==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xHL2n-00000000O4E-2C4m
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Oct 2026 12:58:51 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69FAQLaB1596905
	for <linux-arm-kernel@lists.infradead.org>; Thu, 15 Oct 2026 12:58:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WhXW32ULll9zpgefHefrkMytXocm7R9Jk8nCG3El2sM=; b=mUnzuwGTHpxO7hSq
	kbG5hR56HTwd+13wpdZ2jQ5U3y+WmZUIWJzJ3m8LiLr/utLFLT3U4z0G77M2UOMr
	xh1rRh1ltjxiICl4veSnwDM1A7UbG/tDvBNsbB/ebNlLmhvNuKab6v8aJSh934ez
	bwkaazSoJA5/CpBpwVfeV7O0Lce7WffvAJKdaQwrL5TLQ3BWMXmFeZo/yRVpdzRO
	EKUpzvR6R82PbjoisnB44apDFWbcpz2NodBj8FXVCbc4wWiGbDOsDci+U7u0Wx8H
	u3suT5AokRakVNdOw990LCtwH5hFQa+I6X1FgB3E4M2XyM7RVWLP6rwhdGfsDp4r
	m7BPFQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4haw2v8hmt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 15 Oct 2026 12:58:45 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2e60770381cso47580865ad.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 15 Oct 2026 05:58:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792069125; x=1792673925; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WhXW32ULll9zpgefHefrkMytXocm7R9Jk8nCG3El2sM=;
        b=cDeCUQZCcDmzfPO1ojiBUwl2aFW6qus04/fIYTllhJIDgxyJ7YfdqmQfyaNfXO+xrF
         9mGjD8eI01SGTU8mrZcnzIjdu9pzFDchGp0rhCRjEE9L0o4Vpyw8S7aHfARAAY5KiClw
         xmHUPAnv6rp5KAuDt26bgtjpL7zsYsFuHeovqN0f+x3pu7aQgPuVkCuhVzlO+P3gxQ+e
         hpHRWppquhEaA1b2VoJT+3JofZnU66luggp5/FeekS57l3IuAQF1fKR/jgbD8QO/LY4n
         hJWz5A1lEcLVgl2IBIcG/W0BGEkbp+Uiz6BDJa7ME7tSR8O3ftfYpRI6yG6bMJ2RpMUx
         w00g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792069125; x=1792673925;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WhXW32ULll9zpgefHefrkMytXocm7R9Jk8nCG3El2sM=;
        b=Eww910BbaOkdB/LEUrhPQ6mlv/HJDQtI5UDmZTZ2l90gH4Y5O/GwW7yi3O6uqTXHnY
         fywx9vjVW/AxjjT7q9mXFDWXoxbOiifm+CawgoHXPKk3pGsEPwX6leaBHu/EfPe2FXmi
         iJKxfdMU7wgIcqxZaS15TzYnjRIeAwXIMkFNAhgww3xojRd3kT2kPFRwPwyScmpW3Jpe
         In9yegy57mRuhXBkTwL/Up2IhI/nNlwcSWrMANWuYYTmhqekugYucvvxWASazowHk9Rl
         T51Mts+wcd17+zZW51dINq5T4Vx1kZZo6RNcmTGUFI8F+kPGho+DMauXm3KU7zQ/MTOK
         hXDg==
X-Forwarded-Encrypted: i=1; AKwUvBzSAGSsSwuMi8qeM8YEm4cW68VoqRkSu1YCVV4DJy5kpHcczg5m6VA0pTRTzoqvOqW4OgMHPGzKND9hlCKUtf5r@lists.infradead.org
X-Gm-Message-State: AFq9FYI+hwYKQx772sTWj/acA7n4cshqeWC7XzesRwYa52SwHh2r5hr9
	VA6qoVbWFdiJ6DqcR5ejRXB/uayzebiOFocM4undMsS4b/v9IALlCb/iimIseVXNvVH2I8gSQm9
	qlvfkhMRKcOy5lBjA/wOV9vbYKUzzmwO1Wx1ONfx0lapCIIynpyfBh36nQxP79Sm40UzZq2/31U
	0ypQ==
X-Gm-Gg: AYBFou2gdoNDGtg5nwuuSFqQgly59rbKntke3K/cDUixvxr5hhqg2aZ6F6931zFG3fh
	4g7Ox5uOrdKFnbxyZbd/7Lk/IvfcZY7yAPtcPId+g0w2T9CWkoyr3Swyvyj+qkuod6cvMA5+AGl
	HtlwmPKkAn4uSCdSWcse3ex3oSt0LFV/mhqRVbt6Vgl1saRj0Y7S0WAtaXsh0aeKx17EiRbYPh8
	rH9rn1VdVlpA7Q9439hbs3AcyADN0FAGrQQ3mV1pIuiRBbwjzYTd220FVieJSqt2H8OuPmpQVcA
	igFt4H5Xq3f5dN0czkHaEz+HsJL5QFt6KeqYwfP1f2cGzVTAj837WvrF+isdNVp4LwT71G83rni
	C7LPDpQTNa/hHChaHKvp9UAgNaEoDWj6OUg==
X-Received: by 2002:a17:903:1af0:b0:2e9:64b9:a333 with SMTP id d9443c01a7336-2e964b9a8a2mr17283485ad.19.1792069124629;
        Thu, 15 Oct 2026 05:58:44 -0700 (PDT)
X-Received: by 2002:a17:903:1af0:b0:2e9:64b9:a333 with SMTP id d9443c01a7336-2e964b9a8a2mr17283245ad.19.1792069124039;
        Thu, 15 Oct 2026 05:58:44 -0700 (PDT)
Received: from hu-ptalari-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e8422b8d8dsm79691705ad.52.2026.10.15.05.58.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 05:58:43 -0700 (PDT)
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 18:28:21 +0530
Subject: [PATCH v3 1/8] soc: qcom: geni-se: Populate clk_perf_tbl with SE
 source clock frequencies from perf OPP table
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261015-derive_clk_perf_tbl_from_perf_domain_opp_table-v3-1-5da1096243c9@oss.qualcomm.com>
References: <20261015-derive_clk_perf_tbl_from_perf_domain_opp_table-v3-0-5da1096243c9@oss.qualcomm.com>
In-Reply-To: <20261015-derive_clk_perf_tbl_from_perf_domain_opp_table-v3-0-5da1096243c9@oss.qualcomm.com>
To: konrad.dybcio@oss.qualcomm.com, Sudeep Holla <sudeep.holla@kernel.org>,
        Cristian Marussi <cristian.marussi@arm.com>,
        Ulf Hansson <ulfh@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>, Mark Brown <broonie@kernel.org>,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Andi Shyti <andi.shyti@kernel.org>
Cc: mukesh.savaliya@oss.qualcomm.com, chandana.chiluveru@oss.qualcomm.com,
        arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-serial@vger.kernel.org,
        linux-spi@vger.kernel.org, linux-i2c@vger.kernel.org,
        Praveen Talari <praveen.talari@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792069108; l=3334;
 i=praveen.talari@oss.qualcomm.com; s=20251114; h=from:subject:message-id;
 bh=+/7B6+KUNNec4YWmQ4JNwvQrLYiUUliG5f8LtCctDC8=;
 b=fFiCNnShKg/JXYqcb5rRMrHGBdzcQNaF+nbOiZty5cBjDCrCjmBi4o9iRX9bQn6GzC0VxXrLH
 mgj0y4acWl+CdV09lM3ZfUH/UfH0tg05NyT1/BVoK7hGzhqNi1Cz+hy
X-Developer-Key: i=praveen.talari@oss.qualcomm.com; a=ed25519;
 pk=NGK/88fjyHXgfhIKwag7+uIytOmyOypvZ/hDFaYPEss=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDA1MSBTYWx0ZWRfXxCf+vkopmn9S
 sxG31hIkYznYLIOvgOUKMShWcI5lDrq9+TH1O3TpbFXbfC2oLiPFXBtiJ640VNHE93ODV3MZ9Q2
 eGX878fEgGCYdvQcWvUehTSKvqY0SaEM+XM71zW6PEaeeufkPbVv73MpOny2VZ1zclbZ7To7jIy
 CjgJ6KQW3j1BHrQfrj++PigbW8xUA/ZexE2hFyljHuuF3E6yq66oBalOieM7MF6eUqLMM00LsJ4
 xrPzdCl2w7dYBraDTLPScDiz1wjmfFsVEJpIjfi80TephzvxE46KXBWa02NbiMqZmW6QgzoRPI8
 Yey1+1CIbKVVwQ01KXxIC+ACghph5kckUEVNi1pr0JBo8z8xqLxiUfjfy9c/+Qtp7E415kT7nSZ
 j77pIZM91hmC9NGEkJ7DY4wiZ/U/Y5zc9QWpLwivyiowPVZEBeMH+NPjg9Q9/Lage+7d8Jct+1I
 4Sp77HRW3mN2r1FrIQg==
X-Proofpoint-ORIG-GUID: PXZZPRUW0-W7mzk4xCpJ9tXnMRYRyKKD
X-Proofpoint-GUID: PXZZPRUW0-W7mzk4xCpJ9tXnMRYRyKKD
X-Authority-Analysis: v=2.4 cv=G/CJgNk5 c=1 sm=1 tr=0 ts=6ad0ce05 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=CVJBOM8IPza3kUTEG1YA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDA1MSBTYWx0ZWRfX2TCYloI6W9of
 Mc/6nJY3SeTV5FChtXz+0864omvRpOisUlhptMv52Wxycg/crW9sQAOX9wGr+BGeOq0fgD42u3T
 c58Yy8LOX+ZGZGuiYuSnZBhvUOsxoN4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 spamscore=0 clxscore=1015 bulkscore=0
 impostorscore=0 suspectscore=0 adultscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610150051
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261015_135850_082698_F8A68FF5 
X-CRM114-Status: GOOD (  22.50  )
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

Currently, on the SA8255P platform, protocol drivers attached via
geni_se_domain_attach() treat each OPP on the perf domain as directly
corresponding to a protocol value such as a baudrate or requested
frequency, and simply request that OPP via
geni_se_set_perf_level()/geni_se_set_perf_opp(). This does not allow
computing a source clock and divider combination for a protocol
requested frequency, unlike the Linux clock managed path which derives
this from se->clk_perf_tbl via geni_se_clk_freq_match(), and then
applies the matched source clock frequency with dev_pm_opp_set_rate().

Change this by treating the OPP table exposed on the perf domain
device as representing the actual SE HW supported source clock
frequencies, the same role clk_perf_tbl plays for the Linux clock
managed path. Populate se->clk_perf_tbl and se->num_clk_levels by
iterating over this OPP table in geni_se_domain_attach(), so that
protocol drivers on the firmware managed (SA8255P) path can also use
geni_se_clk_freq_match() to pick the closest supported source clock
frequency and calculate the required divider, and apply it with
dev_pm_opp_set_rate() the same way as it is done for the Linux clock
managed path, instead of relying on a direct frequency/baudrate-to-
perf-level mapping.

Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
---
 drivers/soc/qcom/qcom-geni-se.c | 34 +++++++++++++++++++++++++++++++++-
 1 file changed, 33 insertions(+), 1 deletion(-)

diff --git a/drivers/soc/qcom/qcom-geni-se.c b/drivers/soc/qcom/qcom-geni-se.c
index 074087c592cc..95eeb9438a29 100644
--- a/drivers/soc/qcom/qcom-geni-se.c
+++ b/drivers/soc/qcom/qcom-geni-se.c
@@ -1159,7 +1159,8 @@ EXPORT_SYMBOL_GPL(geni_se_set_perf_opp);
  *
  * This function attaches the power domains ("power" and "perf") required
  * in the SCMI auto-VM environment to the GENI Serial Engine device. It
- * initializes se->pd_list with the attached domains.
+ * initializes se->pd_list with the attached domains, and populates
+ * se->clk_perf_tbl from the OPP table of the "perf" domain device.
  *
  * Return: 0 on success, or a negative error code on failure.
  */
@@ -1170,7 +1171,12 @@ int geni_se_domain_attach(struct geni_se *se)
 		.pd_names = (const char*[]) { "power", "perf" },
 		.num_pd_names = 2,
 	};
+	struct device *perf_dev;
+	struct dev_pm_opp *opp;
+	unsigned int level;
+	int num_opps;
 	int ret;
+	int i;
 
 	ret = devm_pm_domain_attach_list(se->dev,
 					 &pd_data, &se->pd_list);
@@ -1179,6 +1185,32 @@ int geni_se_domain_attach(struct geni_se *se)
 	else if (ret < 0)
 		return ret;
 
+	perf_dev = se->pd_list->pd_devs[DOMAIN_IDX_PERF];
+
+	num_opps = dev_pm_opp_get_opp_count(perf_dev);
+	if (num_opps < 0)
+		return num_opps;
+	if (num_opps == 0)
+		return -ENODEV;
+
+	se->clk_perf_tbl = devm_kcalloc(se->dev, num_opps,
+					sizeof(*se->clk_perf_tbl),
+					GFP_KERNEL);
+	if (!se->clk_perf_tbl)
+		return -ENOMEM;
+
+	level = 0;
+	for (i = 0; i < num_opps; i++) {
+		opp = dev_pm_opp_find_level_ceil(perf_dev, &level);
+		if (IS_ERR(opp))
+			return PTR_ERR(opp);
+
+		se->clk_perf_tbl[i] = level;
+		dev_pm_opp_put(opp);
+		level++;
+	}
+	se->num_clk_levels = num_opps;
+
 	return 0;
 }
 EXPORT_SYMBOL_GPL(geni_se_domain_attach);

-- 
2.34.1


