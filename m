Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8F37606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Oct 2026 15:21:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=hnDOPVhp;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=is2eDw+o;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=SO4GVTpI
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=hzVHA9oH1fp1U3bxD+Kp/H7EOO1vh46+RK07HTPMYsE=; b=hnDOPVhpj7Kzz+N7vEBtwEoBFD
	5A9dFlbnbjuhtzpXyp5tVpTy0Yzz5qAren4bKzb1BXqP7Km2Tyl6UOZuJfAWl9dGfndH6RjhSnHi+
	kHTwPrJm022x0+5Bi3KhOmBsva/+CVLDZ56JE+NaazVOuuaO+anmefUbFdOqaKajy5b69+61f2udL
	4PWx+h5G3X812alXeOE90wDI5jNrAQ6FxqEO/LzC1BYbTHmKKtcYcz8RpnYR07CSR1IPU/bSqqMqw
	E4NjEWraBdDRE3n/GGf8sqBySRK8efXSgjf/dxBEemmKsg6Jw5wU5plL8oyxsrzXvn9PqxQf+xksY
	Ta6mQcQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMoPi-0000000Bzaq-309F;
	Fri, 30 Oct 2026 15:21:06 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMoPg-0000000BzaQ-212C
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 Oct 2026 15:21:05 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69UERLl02968145
	for <linux-arm-kernel@lists.infradead.org>; Fri, 30 Oct 2026 15:21:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=hzVHA9oH1fp1U3bxD+Kp/H7EOO1vh46+RK0
	7HTPMYsE=; b=is2eDw+o/drrlO8mUmPy9wbZBprfadno4l/KkKbuwNKOMSLMQL2
	eIAc6ypR9D9asIhA/MUElCmHTHmdS0z61YvQ10i9A5ty03s+afRnJSWHqm3J+kaZ
	rZvOZhPpdF7sAneV7bhoP5gE+vxoVaEYL1VC/Y5FLMrtqHUAiza/+Gn5BUNf3Xxq
	LM4va1ttWB8lyfQSOZPhc19iBk5nMrcJYiXiNaiE75WnRJt6yVoINEkI0k8WYsUm
	JNFrcB8failP3+8V/oOb/L0q13jzK8GVtBCQ/DipJGgamreuxGesgCGFXIHwjGa9
	o42OUof0IhQU7frDkD4NkfRmUfGxf9AgxdA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hme6qkqm8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 30 Oct 2026 15:21:03 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93caf7856ffso172937085a.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 30 Oct 2026 08:21:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793373663; x=1793978463; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=hzVHA9oH1fp1U3bxD+Kp/H7EOO1vh46+RK07HTPMYsE=;
        b=SO4GVTpIPJwYCgu5jd2Y1mum4kjWwPXM53ic3ax7h6LErFiUT+Kv22kkIxPv+mhm2z
         JAynKd7Llx3h4bGtOG/M2iX+iWcJ4WloQjqF1ubmFMLn4Du/arpr793SwoEG1YBy+ueL
         71lhwh67wYekXooSUC0MEXcXMapHBQcWAQUZS5tkfLHsiy9jqZqT7M3hPRzZgCHkfDmh
         I0je+BTiJjCyAafhMj/txCGEdy5MJlGv4Daq+tksUNIG51IlrGWJSUJ+J23Bdr7SLoAS
         J4nA0/lD6oB+PBElh3hBbtgGy/aTp7ov0lk5J7F+t5ks2N/zPDeF4g0rB38H4C+bR6hk
         IsEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793373663; x=1793978463;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hzVHA9oH1fp1U3bxD+Kp/H7EOO1vh46+RK07HTPMYsE=;
        b=ri9JZKVNmiFUmHWN/NBrUktEgVHccjpmz2MD06RvaieeMAvnoDGjsQD2ozdBUjJRGY
         6J7+ncK+Z63RVzqLg5tjhUmczs8JpWiMqMPDLDJDvvGvQCMYrL0v1CkSvoeNpfQz1Es4
         AXK5f1h66UqWpyogyFZ1Sb3XbGRdabbHjFocg1EYouz0DNswXunzdfDVaWYHdoHaCJMn
         ZXswFSSAyIEd7BobR9M5V4odL3ZxDbBXqvTpxBk8EcIVgGX/T7IFXZgeWguPJjOHkhx1
         Sgd+PAry/aRYYsE55l4XcODR8vsd880KCXevyYEWg3QCFGFILfoVDlrVniZO524kb9Ba
         7wow==
X-Forwarded-Encrypted: i=1; AKwUvBzJCXxxwgIwzFu3mthLZNa20CUbnD+hbIZSibo6+uKzC11nq8Qk/J8QNMRZzsWArHSOLQB11l7BW2/lL1cfJQdq@lists.infradead.org
X-Gm-Message-State: AFq9FYLJ2rT1XaTy5miQXW+dC5ucYSlGUgdHj+0mZleSgyYHCJvb3QEM
	oxqIb71Ip7hmUef97g8ZokANgJOClgt4EVd9lBjSmyn8QG/kiEBq8geWyQWPyBTMRU5AgSa0eUh
	7mT6nyxMe8gIWmzzvKCfbnZwtzfszdpDsnjrVhe/PluplPgqee2fsK6Hdh60ut+biaTp3g6Z8bV
	Fg7g==
X-Gm-Gg: AYBFou06pEphvDVRMyLsP7c/Ajjm7cAYi6tWE2/jhfEJHFN5iROcWAR6IVzO8VAd9cy
	Y1OlKSDKSs1NAcCocM79A9/fz/sv/tSh9SWzSqD+eUYvVXQ0DdAOjytOenhy/prKQH2Q4OfJbW3
	jEhYY9VaCKRYr016tCaqwz40UJplNof4Fp9G0g27j1DBRSK5Fjr70VPIyUo+cZaBcVsR7j5TR7h
	q3X7zdl6Y9DE8iCfSur8QcMZy+xhZe+C+X/NispM3RRxU+ZaZ9rCPzxMDoj7QrxZusPHlbHz4fC
	6H3mE7yCEOD0twNxoIq1CDveGBCSEUcTB05/mrwr+ww5pmQGNgYCK1B2AN7dMRx9N/wjbOEblHA
	qpgbF9THGZrgJ19PyyA+u0MCsHl3AiSxVjHl9TUVRCpXTK5EcHaB3j0zGjzqvgA==
X-Received: by 2002:a05:620a:1a08:b0:93c:9d56:a860 with SMTP id af79cd13be357-944217439e4mr452269185a.19.1793373662562;
        Fri, 30 Oct 2026 08:21:02 -0700 (PDT)
X-Received: by 2002:a05:620a:1a08:b0:93c:9d56:a860 with SMTP id af79cd13be357-944217439e4mr452260885a.19.1793373661793;
        Fri, 30 Oct 2026 08:21:01 -0700 (PDT)
Received: from quoll ([178.197.218.7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4abeb77af8csm105732875e9.1.2026.10.30.08.20.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 08:21:00 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Claudiu Beznea <claudiu.beznea@tuxon.dev>,
        Boris Brezillon <bbrezillon@kernel.org>, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        stable@vger.kernel.org, Wentao Liang <vulab@iscas.ac.cn>,
        Sashiko <sashiko-bot@kernel.org>
Subject: [PATCH] memory: atmel-ebi: Disable SMC clock on probe failure
Date: Fri, 30 Oct 2026 16:20:56 +0100
Message-ID: <20261030152055.280193-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2649; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=dWU+lW1XZUsON1uVforDhInBvMK+7M9QnKSnKSK5E9A=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBq5LXXvtQhu6R3DuDcLTc1io0pSkK52E7jxYEMj
 PQ9ZI2DgImJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCauS11wAKCRDBN2bmhouD
 1+ZxD/9cveLk0aYNZU6/ZDm2z8I3ln6xbcr30h+oGeUWaRXMV2v0p22Kq5sQenJIRlqauutDHr/
 h3AS1sAyfz6MY9ddT9T63Xiojw0sFMiI6/w9CP13cCLbSHjpTYfU94joYFi0BOrkhDjEdtj3YWT
 w3nxAyiYJ/Tix3wIH36cPCCHCFkBOoE0uUN/ZgVGhIpfmUq5wfeAxtRijwCSKEuKKwRvm6R3+7s
 UnPgxRkXOntHBwUED5qaIlfAxjKfiCgnptev6qwqD6iHadDv59b0ZtMS4iQwq2ZKczy5O6w1PD3
 xViUFR1U3kfeQGsfoqWxeQDvte3EsS48iDMaA/TBYZkXySl63G0YZhj8GOn9ZrUfsVrgbZctfbd
 zbHyfUvunKEqc2ezEg2jcbgXi7tPzkMAf9UVPffBrXeL54IlyprOt6hbN0M5jOSTBFyqUwq8SnX
 mVyZQ0chCWrnchpEV8klQ1MALoGyJ4BYMft5U4NJeGyjtKjjxEm7U5347a+kUBj1y1jsE9CtqqN
 uvnSJ7wZUZLMA8wnce4Gu0zlVrxxd+gzSb+2Y3re/Ty9BDhu9otY/4ueiqhBPJtQ3mcrNc2Yz6T
 UMdZIzDZGGHwCLFgLSJNbHc93wsOO54s65ukkk1oUiBo1zaSXGkdHa2orqEAXj+ufrH66BxIgM1 aK6SJHObYL+HVWw==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDA2MSBTYWx0ZWRfXzceUUKcaQun/
 ZeKZI2NiyzwakfeXbxOS9WvlXtS/dOncS467jxKb+XsP9jHIOX11xn3RRHO1S1TW+VewaZSdNeX
 d5Xia6O1kqWSTaqRpgEQFr4CGUkzlOGIASPupmNWUc8y0M3EzrF8ifpuJhQtStQYUs3/RkX8i2b
 1+eNnqRHPHXaXJE9Nn8R9kET4bWg17Gw23PWzBXGgD4WQZe5Po0MRD4o16UKT9sqS20Y++TA6/T
 Ysq5n49HlAqS3zCb9fReS4GTGwf8naRWLYE+cgY7s/SiKR5N7ut5juIJnBlcDM1prM5wZfMSA83
 OgPi/0zKhyqHdWm7WwWIA3eL86cevkzU3Ub8D+2iG43IJJsVHS2FQIbuU0elJu3n+OWDIuzdUJX
 +7N/zQZtfcHoQ6sS3oe8IrG4bM337CsTSJvU9jgXZ7DvV8gE597tD35ZUK6FwFS0C6oaFsSFlPs
 66eoZhhdCknfYTEv1CA==
X-Proofpoint-GUID: i8VacIBAXWM2GmjnXcO7QI1TyFsv29sd
X-Proofpoint-ORIG-GUID: i8VacIBAXWM2GmjnXcO7QI1TyFsv29sd
X-Authority-Analysis: v=2.4 cv=IumL47/g c=1 sm=1 tr=0 ts=6ae4b5df cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=uyPgTw0bjBTS2cVxpiNm5w==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=VwQbUJbxAAAA:8
 a=c92rfblmAAAA:8 a=EUspDBNiAAAA:8 a=BSGzfMJf4aLG5m6vmWAA:9
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDA2MSBTYWx0ZWRfX1Kd4DbSiV6HV
 yUd+RwDb5lyqfQiSqhYCuc7H58mPIvYFYbT3+MySkvN/uPdIZMd5kuG5Da3btGV9hawKpUBa7At
 4wVvQdGpFj4cI5STPa0JGtOuPBBEkKs=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 clxscore=1015 spamscore=0 bulkscore=0
 malwarescore=0 phishscore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610300061
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261030_082104_526870_2877C61A 
X-CRM114-Status: GOOD (  17.75  )
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

Unprepare and drop the SMC clock reference, if probe fails to avoid
resource leakage e.g. during probe deferral.

There is no remove() callback, presumably on purpose so only error paths
are handled.

Cc: <stable@vger.kernel.org>
Fixes: 87108dc78eb8 ("memory: atmel-ebi: Enable the SMC clock if specified")
Reported-by: Wentao Liang <vulab@iscas.ac.cn>
Closes: https://lore.kernel.org/all/20260917101623.2146392-1-vulab@iscas.ac.cn/
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://sashiko.dev/#/bug/linux-8e236c81-01b2-4274-a213-11c3f31acfc2
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

I independently developed the patch and then checked the queue with
pending work of iscas. That one has issues and other complains from me,
so only credits for report.
---
 drivers/memory/atmel-ebi.c | 21 +++++++++++++++------
 1 file changed, 15 insertions(+), 6 deletions(-)

diff --git a/drivers/memory/atmel-ebi.c b/drivers/memory/atmel-ebi.c
index 1e8e8aba2542..dec2441173ae 100644
--- a/drivers/memory/atmel-ebi.c
+++ b/drivers/memory/atmel-ebi.c
@@ -562,7 +562,7 @@ static int atmel_ebi_probe(struct platform_device *pdev)
 	}
 	ret = clk_prepare_enable(ebi->smc.clk);
 	if (ret)
-		return ret;
+		goto err_put_clk;
 
 	/*
 	 * The sama5d3 does not provide an EBICSA register and thus does need
@@ -572,14 +572,16 @@ static int atmel_ebi_probe(struct platform_device *pdev)
 		ebi->regmap =
 			syscon_regmap_lookup_by_phandle(np,
 							ebi->caps->regmap_name);
-		if (IS_ERR(ebi->regmap))
-			return PTR_ERR(ebi->regmap);
+		if (IS_ERR(ebi->regmap)) {
+			ret = PTR_ERR(ebi->regmap);
+			goto err_disable_clk;
+		}
 	}
 
 	ret = of_property_read_u32(np, "#address-cells", &val);
 	if (ret) {
 		dev_err(dev, "missing #address-cells property\n");
-		return ret;
+		goto err_disable_clk;
 	}
 
 	reg_cells = val;
@@ -587,7 +589,7 @@ static int atmel_ebi_probe(struct platform_device *pdev)
 	ret = of_property_read_u32(np, "#size-cells", &val);
 	if (ret) {
 		dev_err(dev, "missing #address-cells property\n");
-		return ret;
+		goto err_disable_clk;
 	}
 
 	reg_cells += val;
@@ -603,11 +605,18 @@ static int atmel_ebi_probe(struct platform_device *pdev)
 
 			ret = atmel_ebi_dev_disable(ebi, child);
 			if (ret)
-				return ret;
+				goto err_disable_clk;
 		}
 	}
 
 	return of_platform_populate(np, NULL, NULL, dev);
+
+err_disable_clk:
+	clk_disable_unprepare(ebi->smc.clk);
+err_put_clk:
+	clk_put(ebi->smc.clk);
+
+	return ret;
 }
 
 static __maybe_unused int atmel_ebi_resume(struct device *dev)
-- 
2.53.0


