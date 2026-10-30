Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52F12606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Oct 2026 15:24:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=gaJ2B1gF;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=iT/cHDBL;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hSNaZvSH
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=D50N3E011gOlYPi42VK1o9ynvsH8cEI0ETSUZB5t0Rw=; b=gaJ2B1gFca4WLoyXG7lrUMBzOF
	vU9AqDvW3AgO0ze1zqjzOkAZOdxQ0Sa1hGSWI/DDK8Ir9eV04teRLuU657Ykch3EmBjYZfDD5pRlt
	gMt37jNh5p/SuJ3PEN9kqNDt3T+Y4tnP2UvoSuHjBjfbJ+86KAd+UzWaBvDVu5z6xvMBjTY9XkBgP
	/qyvItK9r3GoUFfyC4OXMtYrQpPuguVBG5qmuuVfG2yCgjNQaKf3KEmplPc+qxwJXiq87SOq75ShP
	zytHssZoLYzxGd22xzHzSXaCp2X201A+xiXi07ifxXDTYD6yHGc42PO8JPEMSv0vnVbGOAZ4gkNgD
	hbucFbOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMoSq-0000000C0JA-164X;
	Fri, 30 Oct 2026 15:24:20 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMoSl-0000000C0IG-1OXL
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 Oct 2026 15:24:18 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69UERuBw1953891
	for <linux-arm-kernel@lists.infradead.org>; Fri, 30 Oct 2026 15:24:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=D50N3E011gOlYPi42VK1o9ynvsH8cEI0ETS
	UZB5t0Rw=; b=iT/cHDBLzav35dNId9cT/Hal5Ga9KPaW5OTvdZ6xpWDvjKulWr4
	dZHETTNr7Krwq5JF3IaIQnQsEVKm1ex4YDANTH6FVgda9GMBIHWGIo8Q40ZDVav+
	4u1iJ1iebmZ2QHerl7Kq8Xhv9c5IivnCfQnHNrwGYBOGZdDtiR2DTThg+PlHhh5b
	KTvVPQPd8Lrdoh75DmeZLNpM9ESSEtYrHLWj0rcCXdfqGTwJoFQaRysdFiDUrFRK
	ANAFgigKfPlLjxHENKrzvKdSZQjN2L+KDCMPoOgXouI1zKD6tk2sOGOP+NaRvT/l
	4cBUV7llganiKTMfcgLabdS8P1wzdqH3hiA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hme6pkr8x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 30 Oct 2026 15:24:14 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f5844cb60so162735285a.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 30 Oct 2026 08:24:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793373854; x=1793978654; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=D50N3E011gOlYPi42VK1o9ynvsH8cEI0ETSUZB5t0Rw=;
        b=hSNaZvSH/3ggdFQ5mZnynBlPdaaZIeUafXyDFNOZE5A6oMCM2Pw29iX7pwDaUZvwn9
         Pmbmk4Qoo8lVKON+X+nmDufHEWJUOtCjlB2643mN68nudKKkS2JuGjagryVUh0qZeVOV
         WqPEogHB9XVcmKz+tcZJfOom8jBrUku9caNhChJBBBm/8apwbJlqS9AiSIY5LdJL572j
         scg5fWuW+pQ68ozmxqebBT0l5lSgggzg9vfHxUDQ/OeBFhwOSDEJ+vM2/wkMg+2G14Hu
         uuJE+uxtqaT1lHGzE/Ckkik1xk23gjeW/yluQISva9o5WyOl+/BNK8KQBBfX0Jqx7rRY
         1Ptw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793373854; x=1793978654;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=D50N3E011gOlYPi42VK1o9ynvsH8cEI0ETSUZB5t0Rw=;
        b=TlKh22/pOXlOoyT214DNzsjB9YLNElEIfdjUiO1jQRMRqIp2HQzr33BlchlyeQdC19
         919ci2HaN/5D3KUisc9F5nRLc12eugLJGpXjmP76/9HL1PzcX9HcbopzyT8WW73eSPLh
         rc316ni8Jitfcz/+15oA7YfBJZRTBzmA1dgrxlUPz+Og0rHfSjK2kLs56kjTgYx1V0os
         yig7zkom/cSqJMQXrchuqOwpA0kt9isATIGo1fm1E3fg/rUUq3y8FxUQNzsV4jI4RPvx
         HDLgDO/u92pVxyrcIkScAMXZ/PpgZ7DY8wNOq33B1Ml+TubNXJpa68IoJfBZ5o06b7N8
         D4RQ==
X-Forwarded-Encrypted: i=1; AKwUvBzz6xUVDu6fn5Z7B1zg6zTCvCk8Bilen7kcMhKqNZ+5oQfz2/RRWFFOP1wRydfGGdNfjLA+hRrak8h+C3x8Cz60@lists.infradead.org
X-Gm-Message-State: AFq9FYKnAUQOjckUxhqYyLoMWam9OUHlpQFzE/K52C2RyXXB8GOxEnyw
	h1Orny6DjQ5oXAQ9jW4HvLa+M66V60FXdi68tmS7/CZHjsmERsDUAd05oklIYU95iZfzvg+XlO4
	nJJfWI8j6mpye6tUWWlxkWNB8GYYG0YMsRAR7GFMB7ronVBffofqwWJxwiH5mc4XW88jqD+tsAy
	OqJQ==
X-Gm-Gg: AYBFou2y5qeyoSDfKALKBKwD1LJxQGzV0yoQNmS6hedj8OnOqCleiP4xY4I50YnkQ6l
	wkCO0zAzd3SWqa8S93thEtJlaxZjZEctXd7RgJ7vot/jk5CooaaU5uIydPMdGVpCqqpzUu6JFr2
	VDq6WMl4lB+9hQIdm8Ej0GSQZhpTZ7oTPi9FSAiFGUv/GVqOGvD06E0gqDHvNT1c5o48AP9vs0a
	XZMBlr9PxzSiiyuWoyL6MOV3mrqz9lQbT3PQwZaLSdJ9gkNWwL0QxrTS0AeKiCRrPq4lPAzuTW4
	hwSA3ePC8xBk3tp3s/ypNDJQwttzpiJ5pR248TPrBjzzXBIpfFBDH1JE1yM6VL8RdGEdlMq8BfR
	NN4FOwG+4/FZnMgD6/ywvxw9BoAlk4KTzGdfc164n26qxwH7j3wESWmepfK939A==
X-Received: by 2002:a05:620a:6187:b0:939:b053:ce44 with SMTP id af79cd13be357-94413389996mr928844685a.22.1793373853730;
        Fri, 30 Oct 2026 08:24:13 -0700 (PDT)
X-Received: by 2002:a05:620a:6187:b0:939:b053:ce44 with SMTP id af79cd13be357-94413389996mr928840885a.22.1793373853253;
        Fri, 30 Oct 2026 08:24:13 -0700 (PDT)
Received: from quoll ([178.197.218.7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa7f3229dbsm142847215e9.1.2026.10.30.08.24.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 08:24:12 -0700 (PDT)
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
Subject: [PATCH v2] memory: atmel-ebi: Disable SMC clock on probe failure
Date: Fri, 30 Oct 2026 16:24:06 +0100
Message-ID: <20261030152405.281376-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2824; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=wFhbia9prCL442JdEQf4UMZvrrCKTAZ4Ok3cjklDBLo=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBq5LaVZGq+kapElhK6n6TsLDGbX08W8YZOq0EEI
 pWpSLYJq8mJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCauS2lQAKCRDBN2bmhouD
 1xMhD/9ANg5eGH8UHPTagwQP1NLkMZXe+QyI5r0+r30Ya80uaHNYXwdC9Rwk61C9iGK00wdpQBN
 9WdzP7ugttjnzignv764U5jWwpLfym3bC0YRCVIxGNK13QiKKoIDfn0yz5zDIue9yIc06oECf6X
 XRMGL6HFkjyh6S3dNf+o0/M5LfpxpvGh2IxW6M3FkcgnYaUu2Uj68smuHDDdZw50boe/SsfGE8G
 nWloLFxXPpfSos715os12j+f9fNnJVXgaPOnQIGPp6U2mwvevJkh6WFhqmIbFm2cw7Jjbof0KmY
 w5WEz/wvlFIDTs5YGzVZNRfCcZPL32LZlABzL+dyCLUlal5/GtbvqgMZZ2aX++IBSGgMbJKM7mW
 CxjtyDoncdmxmhJK2Zmb/W4lUC9T9VGtV/fnkg4F283uk5u4zE6o3eVjWIEPE42leAcQmd3Wuqg
 560V8B+JH7awmpxcQ1B9z53cjSt4Wvjy2cYVBjUaK/n9EHMyXE5fQmy+z4oN8yA5rsrGOzFgBzY
 fSAFgh87mC4nQmDcXJTZScV1VAA2M9uesbc5od0yQsQ7jC55U0oxSAU0S3lx6PaKuuDpc6oUiHb
 RCsHt6hGKnY0GY24zOmaySOEox+Z0UoOcGdq5/WPFXuKbwMd25oKxFxGBhgHjNGN1T9aK2qHHJv hIORlticgFejOFg==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDA2MSBTYWx0ZWRfX4zGVDriTa4RV
 O/X1JwMM1kA+aO1h50Qj7cqDeTbdqhI7fLPHTr7c17YJUKHVRbJy2S0p9kdbX34T7oQdANZQ8wH
 1u8ETnKuvzMGeQqeZqFoIV8RlxM8FlaD10+rMfPad7YavwB+8FHcQhK5LZmPUvX6Vai0AW+3Pl3
 ophB+2KuDYU2hxAAY/yveKH4JiJFyzOTUY0liMDAc8RXbRY4oSnzOusz9l9MiMfMJypUAUYTEmy
 3pZH0ML7fHMnNPyz/VQtrV0F13ijZCXZmjdYnDto3l9+XH7EilWAO0c48b6DE2MnDobWQI6qyG/
 7K+VY7DMuWcXM0cTCNDJN+fFNW1/SJPqkM5cCsJGjafu1JbxTd1yt4WmC/Yyv4wP8GytT8zgKh0
 SFaZxXraLxZ3EnVEPyov0pIhiVY7ucP7LxTQZaUu7kgUBwG1yH6ymt1wJTzP0pw98pcycYL4sVL
 dGYCJ36HX5PbiST1jxA==
X-Proofpoint-ORIG-GUID: GvK4plUlXdvv0gQrw-u9rd7NykW8saxf
X-Proofpoint-GUID: GvK4plUlXdvv0gQrw-u9rd7NykW8saxf
X-Authority-Analysis: v=2.4 cv=AJ83otAg c=1 sm=1 tr=0 ts=6ae4b69e cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=uyPgTw0bjBTS2cVxpiNm5w==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=VwQbUJbxAAAA:8
 a=c92rfblmAAAA:8 a=EUspDBNiAAAA:8 a=BSGzfMJf4aLG5m6vmWAA:9
 a=NFOGd7dJGGMPyQGDc5-O:22 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDA2MSBTYWx0ZWRfXyDQ1Xj6M5OTp
 GywEkbSKLLiQgbR1RqSqPAbSXeRLDrXX9RUdus/602js+mvJBxbkSgNQnqKT2lsTf+NeVzCFhZn
 XDgQJV+/0HIMtpN2tYF/3EzkhVYNN0U=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 bulkscore=0 phishscore=0 malwarescore=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610300061
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261030_082415_379181_B4B53FBA 
X-CRM114-Status: GOOD (  18.25  )
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
so only credits for the report.

Changes in v2:
1. Handle of_platform_populate() error.
---
 drivers/memory/atmel-ebi.c | 27 ++++++++++++++++++++-------
 1 file changed, 20 insertions(+), 7 deletions(-)

diff --git a/drivers/memory/atmel-ebi.c b/drivers/memory/atmel-ebi.c
index 1e8e8aba2542..7dc2f7add1b1 100644
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
@@ -603,11 +605,22 @@ static int atmel_ebi_probe(struct platform_device *pdev)
 
 			ret = atmel_ebi_dev_disable(ebi, child);
 			if (ret)
-				return ret;
+				goto err_disable_clk;
 		}
 	}
 
-	return of_platform_populate(np, NULL, NULL, dev);
+	ret = of_platform_populate(np, NULL, NULL, dev);
+	if (ret)
+		goto err_disable_clk;
+
+	return 0;
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


