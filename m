Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08468606A328
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Nov 2026 14:40:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=OSBPr4mT;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mOGrOIDX;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WggIaXda
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=YUThmGPJuRTY+/MkH9mkmVSk815/jCpzFpL5hSBqw4c=; b=OSBPr4mTWV7PUOPqL20jnzp0BP
	72V9fYeJlsMeV/RT9HvTxg34s/Fja4PttTZCGh9Ea5Xatdw1ya+bSsTDjxnH7eBEjB8nYHxgftXl/
	8Z1vsQkKPbc/heBaPalq4wKsssGsHLBkuWPpaaqbB+Q5QPh2JcVjhhopPAP4ZB5AAQKQExKN+bZYT
	F6VpQVOFrW7rBtzxh7iLyi6Ra2i2lgnqobXKkISTf79TRpYmQ5elDIWMwfGN3vxRbaZEeOTzAgGyR
	pCtAXeoSb//LPn4cjKA+YA0w7/h1tO+zU6CaA4pWn3r0kKsBbPbMmzhSpacDD0C1L6QAGXwI2kR/h
	XsFrwyyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOcAP-00000005fKQ-1JjN;
	Wed, 04 Nov 2026 14:40:45 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOcAN-00000005fK0-1rfT
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Nov 2026 14:40:44 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A4EHVF32016652
	for <linux-arm-kernel@lists.infradead.org>; Wed, 4 Nov 2026 14:40:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=YUThmGPJuRTY+/MkH9mkmV
	Sk815/jCpzFpL5hSBqw4c=; b=mOGrOIDXbtFnOB86NQYAgCbaTeI4aalIaOy5bV
	0e25t/v0ZZnubehxFyZz6kuW3u/45zn1JOqJF4OYjpE5y3o+hwSd9swEmBtEzb4x
	ELu9KGYib7JdxaZxCF+S0+uGH3qw3v3gH0IDwlPKKf6O1XQU8BxtgR2t6hsMVyxW
	b6Ou2yYWRNzmdlLHieANXPKqQ+Yy7rl/BcYN9YPHMNYAAzt9jXLrzcVwhdreX40c
	AvpzDl70CJ1gxUsD2Y3poYh/UmigA31x3DmVtKelUAzKzBfbTNIxV8H3C5/sl0Dv
	gPMeaEsRRP2G19M/I9Ee/fAqOR+STHjQi6oanKXzfpWcWeSA==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hr6bdr2qr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Nov 2026 14:40:41 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-7c0f07b4e81so188914137.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Nov 2026 06:40:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793803240; x=1794408040; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=YUThmGPJuRTY+/MkH9mkmVSk815/jCpzFpL5hSBqw4c=;
        b=WggIaXda+1Xf1OlIlPDXowdqQL5I4WUfX1QuzTg7/764FIT8/03EWdudbP3kjpfQ81
         8BQ29O7GlNhOINoMtlI83qBG2pA8bhRNqisoqgS2/VJ4UYa9Q3aO4LXv7yPZ6HxOR3At
         O3PROHBMVcibHRs3GDUuQMssEZqCNXGFez3NornJ//5GlGLROTcz1LeRJ6gfaAh6J9p6
         XKPaQFa52aWYBYyuAF1EX9oPIDMU5BfWrlw1zXciBTHoInKHTFBUE6/vfOSXR+KKoO6x
         tKg3sN4KAHGlgU8H6dT6d5WO55myIsMJPtjLtLXfiAVYvkETHn9KYebY7aPPAFd4PJWU
         QuQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793803240; x=1794408040;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=YUThmGPJuRTY+/MkH9mkmVSk815/jCpzFpL5hSBqw4c=;
        b=SksMB8Ekxy49BRjqy9So5tFm0ryT3fXB4e180pmxweoLPyu21RrVM130Yifr9YwA3A
         iiU0W1yXl8px1lrV2D5hjN2XAD/1VoTrYn2ELJMw6axGi/fxgsd1z1q3U80GxsCtwPVD
         Ffw6TwsgXTw6gtMngmHkMGCst21p+FoW/8HF0uq/cBKMVLv3X6qUU2BDGnZBol4LWo1+
         WO+KzB11HM3iMtKi1U3DpwA3KntZ6OVjaO5ClyB4muED4/9BmTCQqwoLWSSj/jHhJqW4
         XGcpzMPxpoODQ2Vd6N9ZwEwJDFFlfKIbQ+yU02UePY/wy4DOxG2gTtKd6/ZlEhkQPwnc
         bkHg==
X-Forwarded-Encrypted: i=1; AKwUvBzrUAyqOcBwvp8hjIjXaOGD2EYZ+XU1h2CbBJdcPHrbBJLe4Lfg04eBXqBIkRg9UGCB9QpiS4sh/MOgaXyz5dIi@lists.infradead.org
X-Gm-Message-State: APuU4Z+2cMyZpyPW4W2W7ZLeX7LJ+6gD67h8Xa9AU3sVtZ7v4yWt10k+
	9zYqujnno4B3nctdbXoWt9VxvG67PYfviMOxyEEWhN80AZ6jrgLCm3y4u0XrkK6gTMhaeRCPBha
	2ahj0Tb4gU4IRC8UnLII73j6j5mPISsY5dlhC55wDRAI7kIihR/qF2819C8ApxXyUt/cT0bhSWA
	ElnQ==
X-Gm-Gg: AYBFou1uAj3V+fQIb1RcDSBvW9bMiUheh8lwjroo3zDfYUxXOpTmun0f+D6MH9BMt6G
	QM9b46LqbwuE2JthCvBRw75xJC3dDmHpg0HizZgYTK1FP6NqEBsQ+xjujhaU8ZWUwZ1xSHJMd2a
	i+/BT6lNZo30FDUOqU9a/tWxtm5TH2H7sBh0z8BOUvR/ntf+HxgUxv7stcjM+iYma8/79FQ0Yau
	08eIoZwZT1aHYKYJmk61osmW6efmezLNZz10U+mqqQXdH/uYYkt6dDDypuX1K6SMMmJz68iRg3t
	orgFv8kZShZ8soP7ngxg0bFhxUWu2LMnED70ZklIH/HKzcjeKdZiPneUf9yaScC/33W234jLTSG
	EhJcSo4Cb3trgGjcgb80g9Vo6SQCL4PC3IlPmg7AL3Gn09kbcU4Pu2kabgVGCb4ZDX4wXkQ==
X-Received: by 2002:a67:e9cf:0:b0:7d2:7266:2c71 with SMTP id ada2fe7eead31-7d2726664ebmr541517137.0.1793803240023;
        Wed, 04 Nov 2026 06:40:40 -0800 (PST)
X-Received: by 2002:a67:e9cf:0:b0:7d2:7266:2c71 with SMTP id ada2fe7eead31-7d2726664ebmr541510137.0.1793803239544;
        Wed, 04 Nov 2026 06:40:39 -0800 (PST)
Received: from [127.0.1.1] ([178.197.218.7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fea181085sm4381946f8f.1.2026.11.04.06.40.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 06:40:38 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Wed, 04 Nov 2026 15:40:26 +0100
Subject: [PATCH v3] ARM: defconfig: qcom: Drop Qualcomm SoC drivers with
 defaults
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261104-qcom-soc-kconfig-v3-1-6bd233ccd1ba@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/33N0Q6CIBQG4FdxXIcDJI2ueo/WBeBRqZQEZTXnu
 wd20U3r5mz/9p/vX5AHZ8CjY7YgB8F4Y4cYil2GdCeHFrCpY0aMsJJwJvCobY+91fim7dCYFlM
 lVEFrUREmUXx7OGjMcyPPl0/2s7qCnpKTGp3xk3WvbTPQ1PvDB4oJLoWSe05U0YA4We/zcZb32
 OzzeFBaCezrVJT+cFh0uBSkAlJydqA/nHVd3xDCDUgRAQAA
X-Change-ID: 20260429-qcom-soc-kconfig-1b9b31d9702a
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3289;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=p8GWd+LZo6xbYp9ZyzCcCx0yLw7NoaI+cPAfAFUemgo=;
 b=kA0DAAoBwTdm5oaLg9cByyZiAGrrQ9zIKyKsIVfJ7bndpRgMBWu7uZcvhYtzMTI3bDb+GHXdm
 4kCMwQAAQoAHRYhBN3SYig9ERsjO264qME3ZuaGi4PXBQJq60PcAAoJEME3ZuaGi4PXI6YP/2JC
 DDNNrk/Q5ZOAwaG4T9Amdayf/NjGT8Vz1lzXJDuO+Uc98RSDlztt/ITPc3Cce7WoCrCwyjjzGHj
 TzKqMRR+a00PSNk1QUxPtCaFVPW0e3HVY2W0ZwB9sf6X14/zVo4bLZhEdSf3w41ENItCyczRFyz
 DL7Ge2WFbHcLeMZCC15T1bJ248fEZzB5fqYseJK716FIJAeFZ5XyOwkn3vfxd3oqswd5YiSMzh9
 IKa2o1bo0SN0U1+L/kSFuuMDzh9RFFa0DP7ZQfWDYbza7ppyBUN2y+2DElc35kVzNfOjVQSRx3P
 UZl56XDpec1zwxHSzIjIw+OQcthmClz8f9avig49JAE92ChXRYwB1QdOXUlSq3xXZEnRRz8+FCc
 ENz6qniC2ry9WDOFBM7aqIv7noxMcITZvvRdFJXvAJlZ6pDQ/BvoYS9UASdLDUoQV2sObrzcsrJ
 E0Xz7BK1JIleMYDaW+IC1m/xDIC2XHdPuKf6N1qwwVcRAFXlywRpDQIjFTFfyiC4/ImdABBwiBF
 ZY2JtJZfTGovx0XUHbjuRlFogavZbSRn9abwpbL44KI34yAK3Z4JtiWL+gsyWwVmnje/A/1O50e
 fAHv2mRF1yPt3m2aGVTgiMptO0vG/+9gZEQSfY7hZ//VdV9UOmBRtwTBBN3ZzqiHSfIrPQx56ZM
 Q+1hZ
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDA1OCBTYWx0ZWRfXyfwIWYrbA2vC
 Hzj0SHVM8C7zRqUKc0bOZmlNF9KBuc11+DnF00kzGC4qQiQpqZjTQeFeBIzNwCw6nSIDOOQgDQL
 1YbpJNhQOdfkZshu3JQgyrvxljHOswA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDA1OCBTYWx0ZWRfX/7f0XeI1EUxg
 yswybRoh/HwS5UzgJ8uYDcOhz7a0YugFfa+UpvN53izxbVIX3IkVFIwJBXLygUnDKMAivhxpuad
 IUB/zT6Jg7+1wVI0GGn4qeY55bBMjLWw7ePxQ3bWaJaoRaBWiMVSU8NmlXqGo5e7rPi7H5oLJkk
 qVf6mJdOJubhOV5KcZIgrA/KeBFFmBL1aFly3UXSd4eor6lvoEULes03q+b49U0pSUd8OVJds4Q
 7L3GzfSVSk2nn/AYovEg7gjtFuppK+fFxMPeoZ601hjSU9Wgu9Gez3KFr7govu16Fp52/9QXzpQ
 Hpug9wOS2jLuNtXZfqPJmv3Jfn2Jb6q9flp8+RiOYZ7BWnj27vTTPIORr/ZwLv83Ln3tKGeAEN/
 x1/g/zKaAT4u5lEZ+7lzE8wqbpZ44OycejIigPXZsXBOmq8DRXY8uKE/JBElRTUXD/P2vMzN6qF
 25mBYHgK4l/4TvK5EOQ==
X-Proofpoint-ORIG-GUID: yqr0YqCb_0pLgq7J35f-HjtpSYq7eGJW
X-Authority-Analysis: v=2.4 cv=D4XSufRj c=1 sm=1 tr=0 ts=6aeb43e9 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=uyPgTw0bjBTS2cVxpiNm5w==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=P_Rs_jpJqzNIsTW6RbUA:9 a=QEXdDO2ut3YA:10
 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-GUID: yqr0YqCb_0pLgq7J35f-HjtpSYq7eGJW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_04,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 bulkscore=0 clxscore=1015 suspectscore=0
 impostorscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611040058
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261104_064043_493240_BEF11F48 
X-CRM114-Status: GOOD (  12.90  )
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

Several Qualcomm SoC drivers have defaults, so their defconfig entries
are redundant.  Keep the few options which choose specific choice
different than the default.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
No dependencies, this can be applied as is.

Changes in v3:
- None, just rebased/resend and dropped all other patches which got
  merged

Changes in v2:
- Implement review - changes in individual patch changelogs
- Add tags
- New patch: soc: qcom: Avoid SCM and SPM for cpuidle drivers

Make important drivers default, so people will not have to choose
obvious things and few other re-organizations.

This matches my other work for Qualcomm drivers (clock, interconnect,
pinctrl).

Best regards,
Krzysztof
---
 arch/arm/configs/multi_v7_defconfig | 11 -----------
 arch/arm/configs/qcom_defconfig     |  7 -------
 arch/arm64/configs/defconfig        | 18 ------------------
 3 files changed, 36 deletions(-)

diff --git a/arch/arm/configs/multi_v7_defconfig b/arch/arm/configs/multi_v7_defconfig
index 069d5a49f01c..92cb615b76c1 100644
--- a/arch/arm/configs/multi_v7_defconfig
+++ b/arch/arm/configs/multi_v7_defconfig
@@ -1133,17 +1133,6 @@ CONFIG_ASPEED_LPC_CTRL=m
 CONFIG_ASPEED_LPC_SNOOP=m
 CONFIG_ASPEED_P2A_CTRL=m
 CONFIG_QCOM_COMMAND_DB=m
-CONFIG_QCOM_GSBI=y
-CONFIG_QCOM_OCMEM=m
-CONFIG_QCOM_RMTFS_MEM=m
-CONFIG_QCOM_RPMH=m
-CONFIG_QCOM_SMEM=y
-CONFIG_QCOM_SMD_RPM=y
-CONFIG_QCOM_SMP2P=y
-CONFIG_QCOM_SMSM=y
-CONFIG_QCOM_SOCINFO=m
-CONFIG_QCOM_STATS=m
-CONFIG_QCOM_WCNSS_CTRL=m
 CONFIG_ROCKCHIP_IODOMAIN=y
 CONFIG_SOC_TI=y
 CONFIG_KEYSTONE_NAVIGATOR_QMSS=y
diff --git a/arch/arm/configs/qcom_defconfig b/arch/arm/configs/qcom_defconfig
index cc93a32342af..8dec2a56f169 100644
--- a/arch/arm/configs/qcom_defconfig
+++ b/arch/arm/configs/qcom_defconfig
@@ -221,16 +221,9 @@ CONFIG_RPMSG_CHAR=y
 CONFIG_RPMSG_CTRL=y
 CONFIG_RPMSG_QCOM_GLINK_SMEM=y
 CONFIG_RPMSG_QCOM_SMD=y
-CONFIG_QCOM_COMMAND_DB=y
-CONFIG_QCOM_GSBI=y
 CONFIG_QCOM_OCMEM=y
 CONFIG_QCOM_PM=y
 CONFIG_QCOM_RMTFS_MEM=y
-CONFIG_QCOM_RPMH=y
-CONFIG_QCOM_SMEM=y
-CONFIG_QCOM_SMD_RPM=y
-CONFIG_QCOM_SMP2P=y
-CONFIG_QCOM_SMSM=y
 CONFIG_QCOM_SOCINFO=y
 CONFIG_QCOM_STATS=y
 CONFIG_QCOM_WCNSS_CTRL=y
diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 7b4985b29b21..37075de6c727 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1546,25 +1546,7 @@ CONFIG_MTK_CMDQ=m
 CONFIG_MTK_DEVAPC=m
 CONFIG_MTK_PMIC_WRAP=y
 CONFIG_MTK_SVS=m
-CONFIG_QCOM_AOSS_QMP=y
-CONFIG_QCOM_COMMAND_DB=y
-CONFIG_QCOM_GENI_SE=y
-CONFIG_QCOM_LLCC=m
-CONFIG_QCOM_OCMEM=m
-CONFIG_QCOM_PMIC_GLINK=m
-CONFIG_QCOM_RMTFS_MEM=m
-CONFIG_QCOM_RPMH=y
-CONFIG_QCOM_SMEM=y
-CONFIG_QCOM_SMD_RPM=y
-CONFIG_QCOM_SMP2P=y
-CONFIG_QCOM_SMSM=y
-CONFIG_QCOM_SOCINFO=m
 CONFIG_QCOM_SPM=m
-CONFIG_QCOM_STATS=m
-CONFIG_QCOM_WCNSS_CTRL=m
-CONFIG_QCOM_APR=m
-CONFIG_QCOM_ICC_BWMON=m
-CONFIG_QCOM_PBS=m
 CONFIG_ROCKCHIP_IODOMAIN=y
 CONFIG_TI_PRUSS=m
 CONFIG_OWL_PM_DOMAINS=y

---
base-commit: 2637bdec0535a2044cd830eba9a79363651d9043
change-id: 20260429-qcom-soc-kconfig-1b9b31d9702a

Best regards,
--  
Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>


