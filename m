Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17415C369C2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Apr 2025 11:40:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=bCu4gnKGLji0Lj1TJspCZ0JNdQdRUdGQa5Ujm73xOi4=; b=X2LGiPQCh+Ms8mTcV+OjZsXbWk
	ypaeemxMvD5sDJXuYy0e7IiiM1l3zpZ0QZcxzaZsy4FK8ftdUP2PQDc0mGE4fdshEbriN7IBTl9kU
	xWa8CxjVpny1HR1bYRiT0e1aFLKLFUjsmMDqGXqXkknTUFnQQn3Qh0LFNbKFfmOXU+b6qPXz/F98V
	opKLjTasD1O96GTZbM11A9YLQasqAA/pGKmb8wABw99NNgMkjt13To0wFWi0nMrQ/iWp5Z+qJOZvU
	qff6kDej3xxt0GacZjGpfciMPLLDAN/piLWguoyilUzDgvvKfapbwNREG568sMPlz11EXCKJCwukD
	0/c5z1lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8HQG-0000000Gzza-1DaC;
	Fri, 25 Apr 2025 11:40:48 +0000
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8FDe-0000000GW1g-2Pip
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Apr 2025 09:19:39 +0000
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-5499c5d9691so2216107e87.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Apr 2025 02:19:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745572776; x=1746177576; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bCu4gnKGLji0Lj1TJspCZ0JNdQdRUdGQa5Ujm73xOi4=;
        b=P8PoGyuyX1cOllsGafJAd7jiW+nNdTGXNXFlDmsSp+mGLTOId9uFrQH7AJBwIn0waU
         hOCzC2AM3efDQmlBPUh4QXkmH+pSk8VXBzruYUGJSMUGV4+jzHsaZUHqeVhCSIQDX0Dd
         4ioTJX7PtYnIeRbEDUjkLybKR4v6gbU/rMI9KAaP7672j6lcB/SlW4o0NVn5BTAtGXUo
         4s8rW/CLmqSIMUG3rdJufDCs500inDiNH4T44XOKi7TrxsUTDnhiH5RU7AYpiN1GwfUt
         i1zmzOqyJZ06NgkBz3o/k1k6lp6GnWR2O8hiB8a9oaATc6MG5lhn0ImHn1O3Utmo9x5l
         Wbnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745572776; x=1746177576;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bCu4gnKGLji0Lj1TJspCZ0JNdQdRUdGQa5Ujm73xOi4=;
        b=aLymddpGURxmYaKBd4KBYWQqXyvVbUx66yvSO2CYdB2pFTxF55ADHp2q1dK/h52Opg
         2OXjGLlYTLiB31qBLUi2Q4JSZSeo9HcSsmmDdKHugkz9fGPzDnGTXNqjlLQHLe+sKLWV
         mO1qErbGAEeMVB5uiN0dFpNKdPXM3Kol2j0N7JDuZTwNfLC7p2A/zNawetvKskDskmz6
         dXmRUMGeHfvPQCOP33J5kBiXLl6/uCxsRFIaAus5mFrU8FzsH6DENU9VdAW6RkVhqMSo
         NvsLhSn+y95dVCi0kTi+Cf3NBN5hPNj/9kiQrUkVheAlkATbn3F9SSx3M5AkXljeRX3u
         fmPw==
X-Forwarded-Encrypted: i=1; AJvYcCUJFzkQsH6GY7zlaNPC8WwbBKiEA+cCAIUx483JiF0ZLhiZUcSw19K4K8dWnzUPROMAvAR3PsOfxkjKE5KymwNd@lists.infradead.org
X-Gm-Message-State: AOJu0Yy7kFSLvHWVMxqhpkOvl9H+yBzM8Yj9Ok41mfH8pYj/+wSogTyg
	VBwrtRgKrq0EcTygLQqpnHWz7tQycTCWPUoqrMxrxSUuuctWTLUDIdIooNZj
X-Gm-Gg: ASbGncsFITELFemmDr8GgOZU+zLgv94AZnM8sWL4KcRSYsg6JFXAdwPIDa6T1YFZRkP
	Cv1/1e4y9p7KbLV825w0opb9F7qcAEMGCYqqxzt30h+0hRFHgYl6XUiBFfgQbisqjGppOzRxzA3
	cAAuyyNIUuFmjfk2VxdCHrFdIa7/HmvX2eAKrEZ83jgTlE4XnZlToAj3Sw1Gx6kebsumhSDom+U
	DkETNQx4MJfNplyJprkFn6JZloQzxuDOWDDR1muCCFfxcV4gycL1bhShVJG8/DtXOgZtQhuk8Pr
	wmaghim+VpkNe5YFYH+AOQdEHPMXrG/dewaRtRUUzsLAkwpv1dDCGCg504RsIPkQ3YLs6F4UYPQ
	dXJxhILR4xVdhq4FJxlwbKpdlVoDnzbIe+KoavEg=
X-Google-Smtp-Source: AGHT+IFQdGmsvgDmR6TVPSbh/xxX9pxHi/YRxyBrg1Y1rk5Z58OPuXPUin/wfhblrZ2GuZjz8ygL5w==
X-Received: by 2002:a05:6512:b05:b0:545:381:71e with SMTP id 2adb3069b0e04-54e8cc07e43mr451893e87.40.1745572775998;
        Fri, 25 Apr 2025 02:19:35 -0700 (PDT)
Received: from IRS-520670-Linux.atlascopco.group (84-217-94-150.customers.ownit.se. [84.217.94.150])
        by smtp.googlemail.com with ESMTPSA id 2adb3069b0e04-54e8c7f02d9sm214299e87.78.2025.04.25.02.19.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 02:19:35 -0700 (PDT)
From: =?UTF-8?q?Efe=20Can=20=C4=B0=C3=A7=C3=B6z?= <efecanicoz@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de
Cc: kernel@pengutronix.de,
	festevam@gmail.com,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	=?UTF-8?q?Efe=20Can=20=C4=B0=C3=A7=C3=B6z?= <efecanicoz@gmail.com>
Subject: [PATCH] ARM: dts: imx7d: update opp-table voltages
Date: Fri, 25 Apr 2025 11:18:40 +0200
Message-ID: <20250425091853.54437-1-efecanicoz@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250425_021938_611354_60144A4A 
X-CRM114-Status: GOOD (  10.69  )
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

Update accepted voltage levels according to IMX7DCEC Table 9 Operating ranges

Signed-off-by: Efe Can İçöz <efecanicoz@gmail.com>
---
 arch/arm/boot/dts/nxp/imx/imx7d.dtsi | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/nxp/imx/imx7d.dtsi b/arch/arm/boot/dts/nxp/imx/imx7d.dtsi
index 0484e349e064..d961c61a93af 100644
--- a/arch/arm/boot/dts/nxp/imx/imx7d.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx7d.dtsi
@@ -48,7 +48,7 @@ cpu0_opp_table: opp-table {
 
 		opp-792000000 {
 			opp-hz = /bits/ 64 <792000000>;
-			opp-microvolt = <1000000>;
+			opp-microvolt = <1000000 950000 1250000>;
 			clock-latency-ns = <150000>;
 			opp-supported-hw = <0xd>, <0x7>;
 			opp-suspend;
@@ -56,7 +56,7 @@ opp-792000000 {
 
 		opp-996000000 {
 			opp-hz = /bits/ 64 <996000000>;
-			opp-microvolt = <1100000>;
+			opp-microvolt = <1100000 1045000 1250000>;
 			clock-latency-ns = <150000>;
 			opp-supported-hw = <0xc>, <0x7>;
 			opp-suspend;
@@ -64,7 +64,7 @@ opp-996000000 {
 
 		opp-1200000000 {
 			opp-hz = /bits/ 64 <1200000000>;
-			opp-microvolt = <1225000>;
+			opp-microvolt = <1225000 1200000 1250000>;
 			clock-latency-ns = <150000>;
 			opp-supported-hw = <0x8>, <0x3>;
 			opp-suspend;
-- 
2.43.0


