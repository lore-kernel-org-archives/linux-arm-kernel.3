Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B599606A326
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Oct 2026 14:03:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=qpgZ9qtI;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=M1awF8dR;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LFuVxROE
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=3tMVC+s+E/Yqx5hATUyQFQL68T+WWVkH8GEQ9ryGSx8=; b=qpgZ9qtILg5Wqn
	2CYDQONxXcjqJE2a3zWlGU7AfyfpDj5eQ18tT6IaqtTPSFqJYZOGoQRCUKXt3N7/UpL7YdTPSeM1f
	pXr/EfBcbnFFsVrMnHPJoq6jkl2ebEv1gf2EfZssdhe6B2Zv/mfUxEcpp/m5ag+DE5+/XSgQ7qmTI
	E0MmCLb/+/pczhIQbu4+IdZQIA2odgkBGFRt0jU1eltXHEyXNytbLGgZMVwS3+YpQ34WGHQUX28g7
	FhSL4dfGM4L3Ua/HD0ehgO53Z3xXkQ/y//GnDh5lFRVxv04O4vsBCxnW4srLLCeJTwEiTTJFKutbw
	OWbQUhPxwqgMAYCABlRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMnCE-0000000Bosz-2AWO;
	Fri, 30 Oct 2026 14:03:06 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMnC4-0000000BopT-3dt7
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 Oct 2026 14:02:58 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69UDnPPJ2883779
	for <linux-arm-kernel@lists.infradead.org>; Fri, 30 Oct 2026 14:02:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=3tMVC+s+E/Y
	qx5hATUyQFQL68T+WWVkH8GEQ9ryGSx8=; b=M1awF8dRp/omx4H8TE5KB6zRkHQ
	fOkEyIkmJHzcfwHvjB5tedHg3Ri8eOFjH7JdYQnERSNTsCs0YvIQXrM1SsuuGzTS
	5jmXeiPHCjI2NM8sXEPFMW32BDqkmhjIdMeSGMMbP8mUqEaaYyiYkDjtq22+1JhG
	Tzvncr1k1Xz+JFcnePvCAUVC3hta4SwR1NRhq3QTOetwCom5QAuuLkZk/2upCsJ9
	yeJMa8IEailf6aTvL3jDBQ+V4ptVnFByFnZj+w23jdRwpA8AVF05MeQAE2pk6eEP
	WT93DP4kXVeF0uY2f6mG2uJJZBu8yiU+4+X8c7ntLMUS6wZF3hijHnRxb1g==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hme6qkch7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 30 Oct 2026 14:02:56 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-7c10b8abe29so513070137.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 30 Oct 2026 07:02:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793368975; x=1793973775; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3tMVC+s+E/Yqx5hATUyQFQL68T+WWVkH8GEQ9ryGSx8=;
        b=LFuVxROExlsVB80PWghS6NqRZDvPx1nkVM/+XwQKQ3YHK8L46c56OWhlL2XC1yca7E
         o/v0XbtG5Ws4zob/UtKpZdBYqtZJtXgCUOR3MU93tW+KF5pcE/Noyypu5sjgWULPxVK8
         GrHgnYruSxVwR5Xm8x9NBXQwf1cdGEGvY3iUCX2SowyDUDYXggKeEfkLXsq1h0KkmWUb
         pjvs/qPBt9VAhV3vxz3nra6DElXShA8vLby1XTTOCsMs2izc/DIwD3QJdIqWW9NIP8b4
         SqfeSZ7j8QQGSAKsDvdvWKu+/WNQuSx7uANWte4tjuMJ7uHgATqOgo3W1GhxfMjyJZha
         HNWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793368975; x=1793973775;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3tMVC+s+E/Yqx5hATUyQFQL68T+WWVkH8GEQ9ryGSx8=;
        b=jVHwxDB7AWI7Iy+2SyiXFjdBWdJqCbhiMN/0kB8gPr+oMReeV11Ks8WybGqeC7+nh8
         Il/bsB5WWZEZDBUq9Um3o6V5ErE8udtQ8PMs3MfLfaMn+zg7VYh1SS2cY5gjFjFBlxVS
         WbmBwoK8T49WfA9I1+b4hh9dLw2PvpS4iJgXLVzlGP1kzc5rdCTNy3noHYJqENACgy5E
         B7sI8Pwk3b1IA4ErMWMaowlTbV0A6//vgxtQ+Q2m6BBBe90cqk61LORLZWmT+yY0baK+
         tGKPTA3SUci/C2UybOrv3c0nQgwaqb7GnlGXs+n0qu4VsFERbDseIrH3VZMuVn4RiX40
         S1Qw==
X-Forwarded-Encrypted: i=1; AKwUvBxfWigSxxAlAwxloKdNZorAz6+XBnVn/Xgd9eEMKBT+y81EYR0+uT+vdVoKh92PloNl3TOiCfOWkBgizeg8DLdC@lists.infradead.org
X-Gm-Message-State: AFq9FYKORm9i3Kgvl6XWn9zpPIpxumLMXVYtv7/qz1Fsc4o004V6Ze31
	TGuikE5lu1FM6FqhdhnL93ZVowjllNtyySPMsvaEZdUJjA/mTbHvEas5W7bk6vzG2v/x1q0wDdH
	Atdc/NNzOVQxAo8f4Lx8GtB0E9+qA967n7mTRAUVbFYxk0MHqvYiPkim2f87RyOAyzxrLSbDxAB
	VO2g==
X-Gm-Gg: AYBFou0gQ/zhcX3evjiUMoxdFqLgWBgOvLtdLrz/bh+Xb5kKy0Nwe46tC+roopIsH5z
	TG+q8WRCwtt8zlLsDjJJ5+ChO2pa1Wer4PpGps3oNDZk2ohv0u6BeE7zWF2HmUcGZeshRMyJYaC
	Hc4zghH+KuOMvfwB+hboLRMHa64HhyXLlD+BKmJCM/OUhxe7NlMpHVOeKASeygXEgn5/zXDlfZt
	vzMcOxlHZ9cknGIIk+CPAfcoatamjhDM9p3TaKFFoiKxhlNy1hQgKxCbNb7jNVg8bxyqNroKps4
	GZCVfMutWymS/An5MP4WkN1O5QRD4K0vhqrfxDt8zdjIwE0bbcEJUOZTOc/HbJJcHem+Mf0ys+K
	kLZ1h8+XCzWIlGrJUU+nS8JAdj37pq2RtbIzreIFkVZMKGWWNmDCKFI+9MB3Saw==
X-Received: by 2002:a05:6102:6058:b0:7ce:9ccf:8713 with SMTP id ada2fe7eead31-7d07262d603mr1093375137.10.1793368975261;
        Fri, 30 Oct 2026 07:02:55 -0700 (PDT)
X-Received: by 2002:a05:6102:6058:b0:7ce:9ccf:8713 with SMTP id ada2fe7eead31-7d07262d603mr1093264137.10.1793368974313;
        Fri, 30 Oct 2026 07:02:54 -0700 (PDT)
Received: from quoll ([178.197.218.7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa81a896ecsm146146995e9.9.2026.10.30.07.02.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 07:02:53 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Lee Jones <lee@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
        Thomas Richard <thomas.richard@bootlin.com>,
        Andy Shevchenko <andy@kernel.org>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Andreas Werner <andreas.werner@men.de>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Matti Vaittinen <mazziesaccount@gmail.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Liviu Dudau <liviu.dudau@arm.com>,
        Sudeep Holla <sudeep.holla@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>, mfd@lists.linux.dev,
        linux-kernel@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org,
        linux-stm32@st-md-mailman.stormreply.com
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Andy Shevchenko <andriy.shevchenko@intel.com>
Subject: [PATCH v2 2/2] mfd: cgbc: Allow compile testing
Date: Fri, 30 Oct 2026 15:02:42 +0100
Message-ID: <20261030140240.211786-4-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261030140240.211786-3-krzysztof.kozlowski@oss.qualcomm.com>
References: <20261030140240.211786-3-krzysztof.kozlowski@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=966; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=AfeMZsx3zqqMT4vEfgLT41qQLlFUhH5PXM+/16YdHOg=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBq5KOE8OZLBL1KSPOzy2PTf7D1fbtJWm/X8QGMh
 1uEadY8ZKSJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCauSjhAAKCRDBN2bmhouD
 1ztBD/9sstFWk1A9Ng49ETxFwagmCGyZ4AVotBxT8ZddXnTTzWQvY8eKKKs/2fuAtwZ3HefHs4E
 TdQ9UiBFcatGhgGt+Ugbk4Jx+QpVg6P8hAILjJSLLvxAlBwcbpfToTVmQdPazXI+iBFf4WFBxML
 BGHhmSmn0FSedMNLBIXFvxgjd7zM3BzjtBwbsXEGrqp6j3iB5rrWT5LryYpJiRpIAbTPQE5fmNM
 3eOq/SiWNO6aZpZGvjrT7QnsBsvGrekphmm4hH2rUnFo/1v27uOu+Ppt03FQ052U9pjGufwl0k4
 lPOLmdWOdeHA4BP8YfmL8RM3bpHo0QQ26VRgr9XnGr5KaDn5xLX3BGcJMWmRTkUK/yuJtzAZPlN
 bw5bQvr0G7P2vDJEK6QJJEVoqL4ia8lD7FWP1/cUbgZ8Raj7gFxI5NvuR+PBQseKfeKE8kE7+RT
 CrPgvEt+jhACYfWKSnVwl14U05BKOAg0fGZnI1vzsfVECg/jz/QtnZ8T/CnbELozZPIE5kRBOD8
 72mfqYZ3eUaRAHbfYLmPzCMqebZTFjo8KG1cXWvArk4BXRGYoC/W8PNhmmexHfIB4sOqdX9Wv7w
 DCR0F6hiiDIM0YYkNQTCS31KmHGg7sNcD0PZEm8XLcZi6xq3sXtPGDhR5TDf2vkGb+aWvoIpDVx Rxb/pLyVr/TPJyg==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDA1NCBTYWx0ZWRfX8QfYDmLkywMl
 eAr4ZrlFLHhDYEhezkpU2r6NTfXtqM04T8DApahy4jGii+Nc1ZrLb5RhVRdHT6g0trGstmIhywZ
 7gEI3EioTrviw4Wqp8/dni7KDUazUeWBhoPRbofrxnMkdJELngeUR5VtDC6WFN3lEo7YFcMnNcJ
 2IyCGBwcyGbuyRZnUvfPNhyw13JTOyQNbGtWq7f+3/r84xkYtD/2503cJdhW5uRWX+EHuoWuuzT
 vP0MjgwehlO5TScutubBnejvLZT7Q8rfPnKwkfGTrXm7CetkNEJja5e0sV1J/lgR9QRUzkZguH3
 Mbvp69DnCv0WwTCbB/tI+AZ1roNpKM7GN7o36W+GmxeI2j7PoDaQp9ZJfz9Q846KasuugyhqOIX
 DEdF4yN+FcxxbZ/7YqWaBJtFhi/qJb3LDh5QbvtrlYLETg/nrYS/W7kYVn760/raHoSWX/iqtfy
 EkYqd4BCzE0Nno7/r5g==
X-Proofpoint-GUID: _FCzclJC01FriNjp7_yoLZ64WzBsXXyP
X-Proofpoint-ORIG-GUID: _FCzclJC01FriNjp7_yoLZ64WzBsXXyP
X-Authority-Analysis: v=2.4 cv=IumL47/g c=1 sm=1 tr=0 ts=6ae4a390 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=uyPgTw0bjBTS2cVxpiNm5w==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=QyXUC8HyAAAA:8
 a=P-IC7800AAAA:8 a=EUspDBNiAAAA:8 a=rKWnc9nNlL7eC5Y4R5YA:9
 a=gYDTvv6II1OnSo0itH1n:22 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDA1NCBTYWx0ZWRfX07OGcXiEvMM7
 k5vs5/dqpAn9ohgtN3yMw4Ks517T6im60LzLgZGqXEBoG508UMRpp1JO5oGrl4hVPCktxL68fp8
 1FRVYTnHpV2UIx/CznmUfikX6crCgzs=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 clxscore=1015 spamscore=0 bulkscore=0
 malwarescore=0 phishscore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610300054
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261030_070256_910702_8B5F9243 
X-CRM114-Status: GOOD (  17.18  )
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

cgbc-core.c driver does not use any X86-specific headers, so looks like
it can be build tested everywhere for increased build coverage.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
Reviewed-by: Thomas Richard (congatec GmbH) <thomas.richard@bootlin.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

Changes in v2:
1. Add tags
---
 drivers/mfd/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
index 87ed55c155f0..de957f574056 100644
--- a/drivers/mfd/Kconfig
+++ b/drivers/mfd/Kconfig
@@ -255,7 +255,7 @@ config MFD_AXP20X_RSB
 config MFD_CGBC
 	tristate "Congatec Board Controller"
 	select MFD_CORE
-	depends on X86
+	depends on X86 || COMPILE_TEST
 	help
 	  This is the core driver of the Board Controller found on some Congatec
 	  SMARC modules. The Board Controller provides functions like watchdog,
-- 
2.53.0


