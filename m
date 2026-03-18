Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DC29103E164
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Mar 2026 11:09:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xxuF0A8lhlStGRLI4TU+YRZI01nCSaQ/oekeKcjZoXU=; b=uaGRLn0DKQUIU/L002YwjMGeGR
	jQx8eTqs65E+3U3NM5TzeOhH0yJUyaOmgVon/w7DnW6XWrmhXSgn8Tt39OGSp7mcvYh0lsqo7txcg
	k1ZmEDthjz1h78VyuJu1ELAHN4Qq9mvswkV5CRNz9tfT8nz9YqnjcQUGqb7DZE/+CxLpSOTU/YgeG
	dLvlbLbn41NVAO8pYG2RGH2rDxnu8s3c37JFn+HyuFPer5MamwQr6EPPHYGKJaPS7sPAWfFC1zer3
	fDZDrGPtNXniTlwmXzjW4Ki0dcbWYSKMkHocw5Kp5WXKdcxP5sRllY4CONL92+NYdk/mY0V6ZiFVm
	Vp4hMlFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2olp-00000008HXb-2CaM;
	Wed, 18 Mar 2026 11:09:01 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2olo-00000008HWq-2jjs
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 18 Mar 2026 11:09:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=xxuF0A8lhlStGRLI4TU+YRZI01nCSaQ/oekeKcjZoXU=; b=nXldLMKTMhgGCCtuiw+2hr4UeY
	elFq2T+2nRQAyeRrpcokcChhdv2k0M1vVkItmGVlrZiAjbbisOB2F2LwxWeurl9u9kisJDT+yso3q
	AIFix71qhFovHXdrF9ukezBLSwZQIvL6oJGA7lgePtwQh3P4QUpdrLGElomi4kFRcqVqe932VB7hS
	c39pDIaDDGZbIzDIgj96UnhnXo7RksFkwBXB7fjN4rcxrApAdbZch/YGrkOqRTS0e9WAnlRJz6F0f
	ng+PW03KB6ZDLkY4ux5VRxBfExftRRh3l+TiW4/2BYmaMYPBxrXxLQWM7Urxvjm2/n58z8o52+/XD
	aRy4QNug==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2oll-0000000B2Ns-0tFk
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Mar 2026 11:08:59 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62I8mvUI3281048
	for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Mar 2026 11:08:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xxuF0A8lhlStGRLI4TU+YRZI01nCSaQ/oekeKcjZoXU=; b=TBpsbjZSx59FY0/u
	9lwU+bB1Dk9HqfJFUnlqQ8QoJNQIDRpoRyLfk++jBL15f5sSx/MJGC36P7ibfPSU
	duV3tKdpOqTZ7NfZzhapjK2qJb6fwIt8KgGorPT0j0LOwWxcSiT6v48Rn6/ueD1O
	tgywJttb4rSfYWqi3HZwZ80+YDnu3DGo2L0oHNRRctcrFYphkiamAN15LZAiMlMe
	nE8uQNdVnk1sH2w/6oKhOZqvHQGcwnU4scC3UZPV1ubp+NA9p0sEOz6zEYtUDd/a
	VRYEBtkbkyGL10v98zFQxxNmZyjBbtkh1fR4DfkSbA7iFBv+SL+3algykmIHVnpL
	GCtOxw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cya62v5ar-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Mar 2026 11:08:55 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50937cf66b5so1020813261cf.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Mar 2026 04:08:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773832135; x=1774436935; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xxuF0A8lhlStGRLI4TU+YRZI01nCSaQ/oekeKcjZoXU=;
        b=b/+ZFdpd3HoFvdbHdn3j2uvsPRlXiuc6zWVst3IdLCaXYb4EKv800DlKVxd2lIPkuv
         SkNAAqhlHNKNnmZrkQDfEY2W51twY/XgrP1IzNf8IXO0aRpVljytL/czy6cCoezASUHn
         tP0R/N/VKaMiuV7gKW0eJzznHC+bbWdkKt6UNvgaldt5ou08gExJ1mMJ4dO25jfJGGSO
         jtx58p4tmkOUdVOOmgIptVFnjDeQRHVAbwxOBQDbg9v+Rx+0Kv4YL0tYK4EYPwyPeH+g
         NhFwyhP8E6KyDXEpij/naBVOVxzjw7QQM5Lu1xK38pXRZO8AX7qb5s6JSR0dJY3HQOOa
         JQ2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773832135; x=1774436935;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=xxuF0A8lhlStGRLI4TU+YRZI01nCSaQ/oekeKcjZoXU=;
        b=jnWGrp8MEgkEzGDQdQZoIvvxbJXlBYmftIIcLnaD7hL3S/io+fNqfjupVtu7rIxQx7
         QefYc65crc0Y9AHzT6jMuDB+6Pc0JnnDy4UYaogTcEHJ14J81EWFDAJ6HWp4AL4T263a
         mvHEWmgik6m9nlz+4iqvaHxfVcy2LNQrjKp5wsMSuZQz8nIVxM9VeKEyuK57XIjVpdGK
         NHG5tqURCarpIfFhuOE+ZvLM7ANr3rbSLWaMV/d4D5NzQIqcmxam2+IGqc25xw7hf1PJ
         pOu3qmubX8Fxxu4vdWO1NPBZPfvDNS9x4oeFOPyWtwHysAUy8RSa3uAB9+MS0a/48skB
         E/VA==
X-Forwarded-Encrypted: i=1; AJvYcCXPViRDE5b6ZRcks/katvfaockMgnj3EbX9BdvG0+9m0obuyV3hxMxHaqhdZEjkR8SnNCWJHgPllMREsLokzk9+@lists.infradead.org
X-Gm-Message-State: AOJu0YxY2vXXqZOGG9OfJZwmqj9EKhenkcdscdS2AtjdGucdWnnGjpNR
	bsKJdam5cVPSaUaYTqmFh32vdtFLPVt4HuHaRjM4p0oFbQd95hy6XU+8kKYjAq3M4PvxQY2w4Am
	Up2EAjPATf1nHzcGqWlGDAL1aXPppDJQkIoAbjtd11CTvU0phyEvjYYJTHWXGZBMrK6cME8LyFV
	YJfQ==
X-Gm-Gg: ATEYQzw44/SCVtQBpAbbWg/gkkBy4IRMOr4oM16fwSPP4RUpVTx4EcvJiTZUjfimzzC
	YznpiJoG+M3iBkHu546z0ajv+Z8MsJGPkwhr4IyFDhk4qIO1dt2o9/U3Pkd/NyUWKRcSNPn+fUO
	wa5XT6MTXVJB/lUbDP1kpY0FZ6miaRZN1ghebFm3xawUNZh6oIjyxygKtbAe/jC0A7H/wuyXiuN
	xigzbYAVNX76Vi3JGOAnHBDqhXWTD/LJ69mFk3ior5YTfvAOItbCR8klVr+5mVq2wj3YcHsRjV2
	hXsx+zGF2CtV2jdSwV5IotFmSTEQ+TEZ5IcnHn5T2dXNEG0SN+F5uG5rxTgtk1VdU4/YnWBMGWE
	y2aKNVuFFAD0yGHchNoJbHAFTKH06pb/z+0M2VuEd+UJN
X-Received: by 2002:ac8:7dc2:0:b0:509:2efa:f054 with SMTP id d75a77b69052e-50b148b588bmr34689181cf.60.1773832135296;
        Wed, 18 Mar 2026 04:08:55 -0700 (PDT)
X-Received: by 2002:ac8:7dc2:0:b0:509:2efa:f054 with SMTP id d75a77b69052e-50b148b588bmr34688621cf.60.1773832134757;
        Wed, 18 Mar 2026 04:08:54 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b51805291sm7523646f8f.0.2026.03.18.04.08.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 04:08:53 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Wed, 18 Mar 2026 12:08:42 +0100
Subject: [PATCH 3/5] clk: qcom: sm8750: Cleanup redundant header includes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260318-clk-qcom-headers-v1-3-d5c6a3b11b67@oss.qualcomm.com>
References: <20260318-clk-qcom-headers-v1-0-d5c6a3b11b67@oss.qualcomm.com>
In-Reply-To: <20260318-clk-qcom-headers-v1-0-d5c6a3b11b67@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1224;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=rwd+fdD+sjWN3bjprGZY/SteXlcdMNP4NDxbH5slEHA=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpuoe8EOeRZLJaD7GgO6dv0KuniqRRyymTla7vh
 JTqjRW4usOJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCabqHvAAKCRDBN2bmhouD
 14sgD/9622J1xmbx/NPB8y+YfXK2DT8IpBi8tjYWPpNqXKCpfTO/RdFRwwCnCR1f7nekFuxhRcp
 3K+Vcd2wPOqKMfPsM8rsaSPsXaE/6GavEiBIiNedsVosrjpqZhvTQQoAfbiKgsRbUiMVIkYmQPm
 ekWpQ7DNPFAvoT9KHrLK34jLFJa0sBbjKsX7jwBfwlp8Bz0BVk+4LOYl7YqHrGjGYhaXl1M2Bbb
 ONDUfhSw+21vS1NbmfUM0TctuhCH2IOFTRDfulOhX5VS/La/5Dl1/99Zx1kXSUZ3d7eeUSBhUA1
 i0E8OTCrSXHIK+Mixth4vRvoGeF8g2Udvye8CPMXJlCGfFKlCMPJrVGj9YLYlm9VntTFIIl+JA2
 isXpztQcCBiafjhPol+VAhUbP4qZ1QL/V58Yy+pNkNPSr7h2C2ymme7gywfImhpZuVVcNBXnMO6
 vkgI+mv2ya1mUPNjBqLifviR6XUOFGB5KL/FfScVUGqRTlREvzYrUNEtDiPF78qM/JZ388esGz4
 PLB/B1OxCDdZIhevE7mL/9zfSvG0T+j/xoFVNLucXezbc3VkL2ZOtnr72YsQ4MG/KTPthSbH1oz
 Fi6FZBhAEb/Ci96N2/YGEd0wxDWenbEbGI0oXCc7OKvrprdLPtCNwtmPHoXnIesZx3v7+wY+lya
 aW5An99GP7lXqyg==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Authority-Analysis: v=2.4 cv=Ns3cssdJ c=1 sm=1 tr=0 ts=69ba87c7 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=J5YPY8RFlEepJke0YncA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: 85jmgxte_iTbBjEI6dI1ZyEPFyMjdjGI
X-Proofpoint-GUID: 85jmgxte_iTbBjEI6dI1ZyEPFyMjdjGI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE4MDA5NCBTYWx0ZWRfXyFdaXjazBIMC
 vjkDkrUHvwLg8xCM0IwYgtSg9l2aATaRA/aMw0RaBmrPge4BD8AKNLpyVx7WO2cE7I9qS+0n0Sm
 7rKt5rXsnpURzDYbWnp15SRukPSGS+WpoUpjXQdu3KJ/qoZ54txobghg3vBbm0o2ExRMLctL0Xy
 VtyTtCMGExHjoGPltWwznFYtELRZl7DzRk9xz9FrY1Bv55l4CbQmxLO9l2epBjepo4xziYVk516
 GfujQmGrj84NwPaQh9uXvJYPABsv27r22ExZYTkBJks1JNvqclfGGqRHfiwivFvADTOhtAPu/+7
 Kb5a1Dw91L/Q0dQaLiripgiDazcKaJ8pVaLb1Gx3kpDRnrC1PyCKc0tHuM4hNXYZtEXuIPtaE5b
 nDUBxHUrD8HkHv7lzkN4qhMeUO4WRwFxVK4ZjkMlPcdLuu0cmpuDVmrMi4hZmIzPfX6pDX7oWZL
 xt9shhGmeDS96uJEaNw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-18_01,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0
 priorityscore=1501 malwarescore=0 adultscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603180094
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260318_110857_691435_26B3284D 
X-CRM114-Status: GOOD (  13.94  )
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

Remove unused header includes - drivers do not use any OF or runtime PM
API, but they need declaration of of_device_id table.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/clk/qcom/tcsrcc-sm8750.c  | 2 +-
 drivers/clk/qcom/videocc-sm8750.c | 1 -
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/clk/qcom/tcsrcc-sm8750.c b/drivers/clk/qcom/tcsrcc-sm8750.c
index 242e320986ef..46af98760197 100644
--- a/drivers/clk/qcom/tcsrcc-sm8750.c
+++ b/drivers/clk/qcom/tcsrcc-sm8750.c
@@ -4,8 +4,8 @@
  */
 
 #include <linux/clk-provider.h>
+#include <linux/mod_devicetable.h>
 #include <linux/module.h>
-#include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
 
diff --git a/drivers/clk/qcom/videocc-sm8750.c b/drivers/clk/qcom/videocc-sm8750.c
index 823aca2bdd34..5c1034dd5f57 100644
--- a/drivers/clk/qcom/videocc-sm8750.c
+++ b/drivers/clk/qcom/videocc-sm8750.c
@@ -7,7 +7,6 @@
 #include <linux/mod_devicetable.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
-#include <linux/pm_runtime.h>
 #include <linux/regmap.h>
 
 #include <dt-bindings/clock/qcom,sm8750-videocc.h>

-- 
2.51.0


