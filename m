Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDB9F606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Oct 2026 07:12:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=wGnRHFB4;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XHrkCHjW;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cL9rSfp6
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=qFT+rqRNAHe9ZehLPWsieIK4G697OzZYWHTxlznKNbw=; b=wGnRHFB4dA1X7d
	toX/wA/hjMmZ0yWlyw8fB8oGTtwRd6gNLYGl1yhjX8wZn+32trdbReUwdLrNA8bw6mrJCm7an//vy
	DuWBNyc9hpn/B/SSnHZ0ZJsSx5kFxVbZKlrXo4YTQXFCNxoSv6CfVAigBAgpRIt9R1imhx/kIYmDO
	hOFpqYW7UukUJnvgJ4NRjDgx3lCYzqBXJ0Nc8NUqgv6AQTO3DV8/KilBoZ6MMewC3OHhcvlSVwbSY
	Oyxg0nf1aCebfvVtahn9gSt2OxdWpVSNNJA78nVEFCugYx2JAmrRd99UIKH4naA/N/c7R7ZkfuZD1
	t4VqnMFuHKvnDJXQ2lMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMgmu-0000000AyUs-2gnP;
	Fri, 30 Oct 2026 07:12:32 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMgmo-0000000AyTW-3yGW
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 Oct 2026 07:12:28 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69U5FFnK2871336
	for <linux-arm-kernel@lists.infradead.org>; Fri, 30 Oct 2026 07:12:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=qFT+rqRNAHe
	9ZehLPWsieIK4G697OzZYWHTxlznKNbw=; b=XHrkCHjWjZFVZFOMZtyQhNQgXzM
	rQ6vLczAloEGGCf0chqGtOnYmlU41RxeibazQMWodij7k0PT2YCqf85qqFkEGaCd
	L9QJyr9u3ag/x/nJQ1Kz2pFPIrg04EaSrBv+MFY8Bw4bw0okp0Dk+ApSxAhYQu07
	qoitc+yfmT4+1OoubgAgBd1Hjl/3UwaiFXNVRZdku7VzUBj9MqyZynS16ZFLXRyW
	y31CslzNQ0w1HeRjWefI3C/pB0z4/C6Eark0CevfSSojyreQ5QZHt79QChtWG7L8
	JIQb0C8oTYNyaSixwyTpzROOLQ+oJ/q/ivvwkr0nsy9uTokTkmDhoUg+zRQ==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hme6qhqq8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 30 Oct 2026 07:12:25 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-91c0f73807eso6113706d6.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 30 Oct 2026 00:12:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793344345; x=1793949145; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qFT+rqRNAHe9ZehLPWsieIK4G697OzZYWHTxlznKNbw=;
        b=cL9rSfp69HbfVZJHI+opFtT3eHSoJoEjZRCe/c4VYXF2ZSofCtRHFHkEBNi5EQOEY4
         2oLmIkN73oIBYTUOis+0YTzEubZ+KpQj73IUxNQrqVIcnIFqxsnGjcqvPdfXe3tHqhdI
         UwYsb+nWuyVWQucSWPFNnB6e70FyZHKegTJkuSq2AgcHRGqK6frs3M95uFS54tTQIvP4
         We81fQk+rI0qrJkoGXZXgKgWfNRxUfzx819+av9aoVP6Gpa5b41RSBgPH37HmNy7HJx4
         dy3qAKWuQ/WvfisVC4M270b9wjQJnmR3YIGlxMcSMyoq+nJ6awd+mskI0ru6WpElrE/t
         4HyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793344345; x=1793949145;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qFT+rqRNAHe9ZehLPWsieIK4G697OzZYWHTxlznKNbw=;
        b=j7xp/E9j5yj2CXXz3jKDxcL/0jHg5/eH67CVOqrkB5RTJgJ92HL+CNU7aj/uRg/+FM
         jX+pFnuqmx9I5jic9dFxlm07WdfPLwWTy6bjKgSCsc5c3whxQVIUsAyG5WKQOVV/Ox/i
         Tb/SzXSS75OtqLIXU7XKxZE8JDxy5y01pHaZCT0UfAbJMvd68njQgJvsMqYQD7kE7KWC
         0qXrvpmBFKQUTX2nzP4kDXI4SrEEKiN0MztOFmoj0DXEnReLVuVbKpSa1SfabJG6znuK
         gR3WyYjR7xBjOl2T1r6X6OiGGOwCD+P4dXYj+/V0L66LmSnSu60zf1F6ijGGW0dAqHDf
         g8RQ==
X-Forwarded-Encrypted: i=1; AKwUvBz93JreU5PZGjZRTWDw9Ig1GPiAXenLTpHGmX8TA4rKeS0TjPPCyZLqj68Zmd9Ib0b7mjGsBBuR9zjmBLlGSbrC@lists.infradead.org
X-Gm-Message-State: AFq9FYJ6CUWwl+r8u2+PaTvEzZzoJ7TTw0L2NGbJEVXxBWTtMld2gywt
	jVVLjn4RQk/myc2r4Y8wco4/f5KaTym35Wuwewfz84o22ClAHPag39NDk6Q1t1zTp0qyTxV/jx+
	aoilrX15zZhdS0c8U3QtOmoli3r/xrJBb8mlqkbA/R6W96wr98DEuUvocrx/zhC0vGdemr+M0mn
	Uf3w==
X-Gm-Gg: AYBFou0xunBC+DwYEXBW1zcOmHGcrT5OXKWn4cauU79rXzm32zW3xDfGfKX3MjPuqqu
	Z7S19vHiCMWEoiLLwmfyB4bMMIba6gMI0JoAO8f9/3tdyjZdp5NhiLSWOQs26pudmawraYSysbl
	CLgnZajLCOHxNqNDXFFL+4TWRfh915mTvCFt3DJ9chFEjcSRlZwz/LlRx5izpt6rY6Qe2veeiUp
	l4B+Y3mvSQC76BmrRdmZSk1Uv/wf/3ZU7pDFKW3xCVq/ctVk06oifOvhDgtvZWzHaGg6YThIe/8
	YoobM4mb/W48A1qzuNU6DvZQDc0kPoLzTBBdPyZjXVzIUYOPHUwOz4EceW/WFvi1zwMm9msr9hp
	LH7FBQefyrmFvSubWinOaez894BDFGCGEVxOGwO8wX618ughXXATIzQbdAgHxdA==
X-Received: by 2002:a05:620a:7086:b0:93c:c2f4:9182 with SMTP id af79cd13be357-944216b70dbmr248481085a.20.1793344345297;
        Fri, 30 Oct 2026 00:12:25 -0700 (PDT)
X-Received: by 2002:a05:620a:7086:b0:93c:c2f4:9182 with SMTP id af79cd13be357-944216b70dbmr248476785a.20.1793344344767;
        Fri, 30 Oct 2026 00:12:24 -0700 (PDT)
Received: from quoll ([178.197.218.7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4abe7706516sm28581165e9.0.2026.10.30.00.12.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 00:12:23 -0700 (PDT)
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
        linux-stm32@st-md-mailman.stormreply.com,
        patches@opensource.cirrus.com
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH 2/2] mfd: cgbc: Allow compile testing
Date: Fri, 30 Oct 2026 08:11:39 +0100
Message-ID: <20261030071137.100954-4-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261030071137.100954-3-krzysztof.kozlowski@oss.qualcomm.com>
References: <20261030071137.100954-3-krzysztof.kozlowski@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=794; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=iIBMZPVdQPZ+Y3Em+kGpb62RltCMiF/RzmkyCWBCVdU=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBq5EMtMkDa5LbSiL1INh6FUP1HLxKbLkJugs+eD
 5RzHGmpH0SJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCauRDLQAKCRDBN2bmhouD
 1wwxD/40aD2wfkNRVpF3wnlQvhEjP3/OceMSbSL4UVJuhUCAu0/tmiiDgJZ95wp5nCCVZCE2qXF
 W0d7hrTtjD9nGsHv6zA/kCbHR2j1vZxUgEtHyXPobDcHzePDrgiPRhJP4KafCUPXV9HOXCNHiM6
 r0B4ctgotq6T3MTBP4WUdPQH39fLP3pjt+n/y3xnp3VqpKUHxaKG1eVgR8tqzAjEdb8PK0wCmi1
 2YNFx6waJnQ/PQaVSl427cFso5F3or0NtkMFKiZczsoBiY80po/YdGW0c9NiQeIBwUfds+0N310
 qiugQWw3oJIS8B2OxWFHbRJHvz+g6TASwdIiJ6sfZG6BILjbSP1lEQ6JojQYOah0XpPPCcmgJzg
 N4vveaxJOgCc6eFRVvI+YkmAXOqJtDP9XIKIxwmcI5dgE5e4kj5h6af3Q2EWwhJuXPZRhEZhTbD
 9rTxN8F4W3XFQGNUn2Bnsu/qNmZucJyGhAv+yqj6ZDFwf64fn28Z4XC/ZbT84ZDfTHVtGdAMOUq
 Y/NUCND4hN1OZren913zCAYCU1l5t8ePRabwrrBKNBhGyAnooWu555WdavF3YbMPFzEMpj573hG
 I7nox20k5zqB8VBK6ABcXG+7Lq9JYbKbbscIpsmffA9U/OcMII2x26mzMKDHiDOXAQdEWWGy85U e3c/n5VTDl2XApg==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDAyOCBTYWx0ZWRfXxkknUNb0HaHv
 42uKgx7faOxo8byBtTTy5k1cBl0d622dc5SEz3v1qDXt8GLrPGc55A2uW87T2TMstNT2Y2uMaWq
 8Adm58yBu3zdup7n1U/8pmXhBARpfV3eQ5Id8iovI/USGmZAwcqmkyf8BAoBaHD2EZ8rTy5oFIq
 lhyqma/Ig4EAdHUnCHcZdUqhXteu4XzeMAkms0Toim4Wjd1QDlHGelY140QVgwZQQRNpudVKrcO
 Wsbwq/Fh32SmQgvY6F3iCZY2z5gXrvDJdlL2zIPc95fdir13v9OC7OCx7/0+kPo5iGKfjg1r2jM
 n0O8TUoCYv5bhil3625PF3xnIqspMSBs4Fq78sL8UocUuhnswFnjE7LS4wvjW89+V55SrCyGklG
 cI8u5ukwDjOwxsJVH8Wm009kuArg7dIdMoQlt74pxFk2e/G0LTMsLrUy4WIKWamqFUbRbETBPy2
 E0eWxVWnjjktZwm5loA==
X-Proofpoint-ORIG-GUID: ijUZCJS-IxsR2uJiZLxSAphzxOkGL9_o
X-Authority-Analysis: v=2.4 cv=IeoSymqa c=1 sm=1 tr=0 ts=6ae44359 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=uyPgTw0bjBTS2cVxpiNm5w==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=rKWnc9nNlL7eC5Y4R5YA:9 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDAyOCBTYWx0ZWRfX0jAcO2yAoHz1
 /ePdDX8yVeOoo+i6rPgZSFX0+kizf+1ElrPwZt90G8zA8x73p2ugz+VdnrriXQEUJv3EABLinom
 D4lR5L6pOyNoJ840Y+AX//9rbuVXzRA=
X-Proofpoint-GUID: ijUZCJS-IxsR2uJiZLxSAphzxOkGL9_o
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 adultscore=0 spamscore=0 lowpriorityscore=0
 bulkscore=0 priorityscore=1501 malwarescore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610300028
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261030_001227_099879_A9E8B558 
X-CRM114-Status: GOOD (  16.30  )
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

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
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


