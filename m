Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86455606A327
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  1 Nov 2026 19:08:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=O8FJSGwz;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=e4RJky7v;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Ds5sqv0h
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=D50N3E011gOlYPi42VK1o9ynvsH8cEI0ETSUZB5t0Rw=; b=O8FJSGwziOJJOW2eam+wEJTpxu
	sVMjHj+CCM7rT19hNPhysRufKdVT6Biw6SIfyOPz8jZquHt391kxJZeET9lik7eqGgU7COvGSGdXd
	zye34gcocXqnqhoHZDSdHyNo2pCkGz7Npukag9whDxJqu5RLJD85WRjzeLG9lt2L+8P1/VkNyy9Lg
	1q7TQrf+IFVk76qhXrIU0fVNfTZTyzy5BTTPCNRFVeKwqFv2a3QwoysTzO8TMSrJJp4OHwPtT32TW
	40SUOQuqJuCpTAw/jV2JtlYfHM7bnCkVdJqXQuHGFbm9nDCpCNg+hROChz5Yr+/dN65DRBiuvRb9e
	3ydSZS5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNauI-0000000EnPo-45fA;
	Sun, 01 Nov 2026 19:07:54 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNauG-0000000EnPP-1xcY
	for linux-arm-kernel@lists.infradead.org;
	Sun, 01 Nov 2026 19:07:54 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A1HPthF2464045
	for <linux-arm-kernel@lists.infradead.org>; Sun, 1 Nov 2026 19:07:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=D50N3E011gOlYPi42VK1o9ynvsH8cEI0ETS
	UZB5t0Rw=; b=e4RJky7vigSuez7SOj8vLlDmtJL947CrDq+2/Ilf82kZca9VArj
	wDtMef2X7w+6er91RHbJASREjK7J3OuUSur8D4z1tyqabMYpdi/VK4EuoQOhmNBS
	icBDwtm19D+H8zYRRyzwF8HzzgcqK5UxBtE9cSYJ4H2FEqUW55tsNeoCj//OphEW
	R2w/m2D4BktbiSAoi9kiiFyUb36+CTgsv6d0gDTb/sWnhibAdxJSodcBa+P0QIfa
	SX/UkCuL2iGueGMHPk4FpLmCu1ZNaTnRcM4lTHppv3kzqntvKb/G59UUSpDEJVc9
	W+OMFUQXJtzaETmghf3w76ZY5LkY25ivXLw==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn79rv55j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sun, 01 Nov 2026 19:07:50 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-7cc175cb172so2091184137.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 01 Nov 2026 11:07:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793560069; x=1794164869; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=D50N3E011gOlYPi42VK1o9ynvsH8cEI0ETSUZB5t0Rw=;
        b=Ds5sqv0hY0rG9ARY1U9wgBk+45RJnRqNPvJLDWjajcJwg8NqOdxG9P2GEQ2VqS6MmJ
         YMq7d5ld7LTbgZtPjDLgbmWGkAKQAXJAYW60y+y/nLaXw+IxPxxDo0bQGeFEn9yN9RrX
         vdbLRs+8yuEhRDurSpW2fxXS8SWB6gPsur6sa9YakkCfAFiNKPZIrmxHtEP7vTpjmBpS
         QeY3tuRJYTYT8lEQqVm1XLhEodtEz2vhBQtiX8RuWbsNtR+5+SVYPvkX6TM790XFAvGi
         fousg65aWqeQ5J3gdvBh/Y1OT0hpvM76Rwk9b486mY2zERqDWX57FRcXTdw2gOPivnd5
         ybaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793560069; x=1794164869;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=D50N3E011gOlYPi42VK1o9ynvsH8cEI0ETSUZB5t0Rw=;
        b=eoOTEK495yzoG5J88pdBQEt6e+8U+1kbrrWroFjINnEhi/O99ymi3putO1HIX7irXm
         BeYNbkQcVyJM3vABp5BB0h8cT+sV6aigNcZu1oK2Kbi32q3NbtwCevOS6crxL3CcYIE8
         qik6lvmG1YhQWq/kIdKyYZr767Zl+L3Qzz7tPsP/wMlSVAPULDg6EJNwRDENJOBdwa+c
         lXg/B3FbaTQ21twZuf25eZp1V+fKMQIXHXpUytWrCZeJP8Jw0aReqrwcS4V7Z/hf/lSX
         gzNkdhn7xskLp0mMJ/r8T1doEUYAbkpZZm7j3Cl2+sQjwVwJm8jXK+MVSUWXSja5ZkT1
         9yYg==
X-Forwarded-Encrypted: i=1; AKwUvBwIgMtjKkVo1ooeNnw/iOpepctm5e5mkiKTng9AZYP/WSphgrU3m1IyOr6Glk/50Si7h/nDCAL+Yjn+4UDYHhb+@lists.infradead.org
X-Gm-Message-State: APuU4Z9Ckfy7w6fY4DObf0yaK/nXgVAe7i4Dd2bWVUQU6839iANy4z4x
	tc96dtJITiAiEW5U91kiw0WPC5NF2YpG/uMNJuCBhXthXqajh6PskA+kjRA7dPgeFgwKdPYdVPa
	8MMJspRgCircJAZT1rHSnnj2nYHZwDpYTeE2gJlj4qpXnoz3SESR8JGCO6CdWmm6jjuNcDugOps
	woVQ==
X-Gm-Gg: AYBFou0tP02XMjufpnE7WFBX+86tn38qi/KU2kAQ16Ok5iNfuV0DcZwUVJenE4pfVFm
	NySg5jBQGz2rLULWeSby5N8PdbfdrhSaPatPkerzcAZZ8ItBASSd8A3wMpheF+vJkZRCo+VwWr9
	NbY3tW1AHSw1cFBE1ZiBEt9qoId0/a+C4C30/yXHXqFqf5WAQOwv21sycLslQL6PtYhvPoLDfmO
	+xydn4pP3bRaO/Ia8htRzGhJGLjJ1chDt5unpu8pTUTr24I+pkmJ1si+543eNoxqm6W8VH2bIgx
	yLBpZQe6PA9Luzg9nSz4/Nr9EcgToPrzGcnivFa2qisM7mwynKNGcxWuIsTBbzWTJN8B9F/1cN0
	7tYIU08WhLp1pzDrIzdGcELNJ6YVdmi6S1tRvxGOIHRrJQeVy2hDw1Ll9GoPtDA==
X-Received: by 2002:a05:6102:f0e:b0:7cc:9d59:9b6e with SMTP id ada2fe7eead31-7d07261530emr3709701137.13.1793560069566;
        Sun, 01 Nov 2026 11:07:49 -0800 (PST)
X-Received: by 2002:a05:6102:f0e:b0:7cc:9d59:9b6e with SMTP id ada2fe7eead31-7d07261530emr3709675137.13.1793560068768;
        Sun, 01 Nov 2026 11:07:48 -0800 (PST)
Received: from quoll ([178.197.218.7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71a4d3f9sm17168223f8f.4.2026.11.01.11.07.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 11:07:47 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Claudiu Beznea <claudiu.beznea@tuxon.dev>,
        Srinivas Kandagatla <srini@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Boris Brezillon <bbrezillon@kernel.org>,
        Mark Brown <broonie@kernel.org>, Andy Gross <andy.gross@linaro.org>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        stable@vger.kernel.org, Wentao Liang <vulab@iscas.ac.cn>,
        Sashiko <sashiko-bot@kernel.org>
Subject: [PATCH v2] memory: atmel-ebi: Disable SMC clock on probe failure
Date: Sun,  1 Nov 2026 20:07:34 +0100
Message-ID: <20261101190733.121473-3-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2824; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=wFhbia9prCL442JdEQf4UMZvrrCKTAZ4Ok3cjklDBLo=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBq5431ZGq+kapElhK6n6TsLDGbX08W8YZOq0EEI
 pWpSLYJq8mJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaueN9QAKCRDBN2bmhouD
 11BJD/4rGHGPC3eDno1qwrwJ5AX+E7EoRTP7s+pFcL0UxUmbCUXZV5vO/ffHuhSCK3mCKIci8n/
 mstT8q3d65BY78QMP9OdDRRj3+GYIzeXH9gDm2x7G/2nbLafOWe2q1rrqWIeo/0SaTSIAE9UtbN
 v2x0D+Uzk/bQwHUUGZFJyDn8gUv0DnRgiQRo+l5vOr8OIQmS/nOG4g0OY1uSp1+vDe7KqBaplmN
 Pei/k99slCzzfbIbWT9floiWP8qCOQP/EKPYSUapCezn5EMJyJqJfN8djae8xXNLNovLHaTwZIj
 oxLaVpSMKMZc9RgJHYknVELcSrXTrkw7Mu1Lud3xYLu28wn09u6klUcXzAW7WF2FJAqBkOpUjrb
 9RQnPTucq7/yutKC5rTtAYf4HsX+WsyaXG4KUqf5dIzFniJJ4vHnQsKH8wIcBhKNFIBuVyz3WZh
 r6HSidqOMTWZ6+d7fjUFXMtdpQivXY9jjTECA4RbIFjMTJ+t59d0TnYdCwJ6du6qgRISbW/D674
 DC8nzGwrNeqfWVObK7O11dRUGF9UVyKTyLbYhTbQ1VLftheJGqLJXWqNQLhKt1I7ikztdSuVDzu
 se+LQLD2EfLAIsucEkWyVhNN/iD8RhhkyrRrefoaSa3JTNXyax8vnVCnsmqcX/fnEoId6GaZlCX eCuifc2g0dZOysw==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: vUpXdmYoeWRc2M9XfzLUlc1PVLnp-4bj
X-Authority-Analysis: v=2.4 cv=Wtq+otfv c=1 sm=1 tr=0 ts=6ae78e06 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=uyPgTw0bjBTS2cVxpiNm5w==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=VwQbUJbxAAAA:8
 a=c92rfblmAAAA:8 a=EUspDBNiAAAA:8 a=BSGzfMJf4aLG5m6vmWAA:9
 a=-aSRE8QhW-JAV6biHavz:22 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAxMDA3NiBTYWx0ZWRfX69tAP468NLjM
 BdU0OglfSsHWxD2m6nFiibrKO4Ll/M2U63PFbdM7OSmc7M4yYqxWxjj1QKSTvKyfoFr7fjAC3Ph
 21k63OnzCnfq7f7OtiMZcSpkU0nM8Mc=
X-Proofpoint-GUID: vUpXdmYoeWRc2M9XfzLUlc1PVLnp-4bj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAxMDA3NiBTYWx0ZWRfX9waKrkdDZxz8
 lErJkMwPPHTicex1T1UD86XUH6os+Xlk5rgUANEMboRnsPnX5HtqxL3eNIj2x8iuLWHOscE9oT9
 IIDqTY67Q0njVk/TRm3L0EztwSprtkWuiPbpPQXFSAhXe7ZHDjSQatnsed8WRkX4O42kGnq0RmT
 gEvrJAEqd9ECE2Lb05dMaykuwKg3mKRQG+N5KNUmoKQIPr2fPKx+MTf+B62TKgHcB/Yhx1H+Whe
 xJyxefkmerpaQufK7H1X++cCnrt/w4TODN45o1Bk1CBgCqgLS0O7BJcqkH0d0xMrLlpXmRHuQ+5
 oGqS5epzwZtESvtdOQxSOqjFxo7ZSO8uOzSeaDWnfcYjmjHyci3xF6pRAwn8GxlWv0M+sliSEOs
 w5A4bWlYA9q8tNajUL8k7Siz7ViIWBiH9cbwC50FlNqq4Cf5RnWjSECPCrvjJIxOuctJF+8dOzR
 pIpkf0Pn8rDFf5lG4WA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-01_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 impostorscore=0 clxscore=1015 bulkscore=0
 priorityscore=1501 spamscore=0 adultscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611010076
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261101_110752_507650_647A8661 
X-CRM114-Status: GOOD (  18.76  )
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


