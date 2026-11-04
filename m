Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C84E606A339
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Nov 2026 08:11:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=YpfIgNcM;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Q5Hl/FUK;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jxjXJ76w
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=SHoCPwg3yKGYoepxE62TQiEAKgIIh9UVY9jZRidEOuw=; b=YpfIgNcMpODcco
	2Q636MatJlOVlBgv6uhj9JP+G/EJ1+1mlGLRkols0M+A+Dq/VuvZkA6p46hsHKGt132txIAwVwYJ7
	QYqOLWQl5eVaUvxSfsAaIj9dkVCJSy5w1vDh5UlAzFED/xrYpLjtktZa2DpoJQ/XBufcFyHot4eew
	cEpBJE0Y2KtDGgZ8d5jFI0JCbhhPc5N75x/lnDfqGg3gSDtPfCr6qxbzzUOoVHoru/dVDrvaigiwf
	zc01hCtJDklE5nto0ogx5zo+gN3+efEwFtohMhswINWf4Ul2M8OnkQxEdiC/zlGMhqemaeY1HK8HB
	c60r13H6DuNeln4T3mKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOW5T-00000004f6M-1a5g;
	Wed, 04 Nov 2026 08:11:15 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOW5O-00000004f2O-2PKS
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Nov 2026 08:11:12 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A46uqmM809992
	for <linux-arm-kernel@lists.infradead.org>; Wed, 4 Nov 2026 08:11:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SHoCPwg3yKGYoepxE62TQiEAKgIIh9UVY9jZRidEOuw=; b=Q5Hl/FUKLsIrDvnJ
	h8l8F7cD8QbVmi1BSMZG8XyGAH5dW1ezAryoqO/XJfHg+nX4NAyoJ6PdsM0x9GLg
	VRngGW9BW7IJOcTGX3Uu09gfTfMFzaD+wwO523W7RDyECOfypRcA6UVn4FrBaOhJ
	QYmcIPPsJhWuUb21Q4SQrddWJB1h5T5BU2qjHqe1MgYSGn6vcodLGKe4Siot/hAl
	wd0eiAb262P4cbEVNvp8buNLUV4DvkFlMKHPvJkidSj9zewJrWXFPxPvVG3Dtq+c
	gJPI46lZtSavOb9zAgpOcZU1cL3Xk1bpHnKWYK1AyMNBEquY/A0xjKMLqaSD+SKj
	1uU3Tg==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hqkgpbcs8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Nov 2026 08:11:09 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cdacb64970bso319246a12.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Nov 2026 00:11:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793779868; x=1794384668; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SHoCPwg3yKGYoepxE62TQiEAKgIIh9UVY9jZRidEOuw=;
        b=jxjXJ76wZP2uTRxfFU6VSSLpNInnKNc9nhYiFfWWzLEyk/Kf0xfQtEJQFaNRBfmO40
         NEU9myKxFsBbGlAgbjaKu6n2Uyhrib+fbguiThnlySEDhbKdjhRrP3cOKNOdr35bWo9G
         xbMA36pi7aXNp6108XLpWUMt5ePx203HSKEUl4RKxl6DpKsWUuRnj49coBI1ByGxWvRA
         Ke4mpxByVsDvUhhpkDWOW4fdbFV4dDHU3I8GgbnH0wnm7wmL1E+RJKmPe4M0WYamOp3S
         jGeUnCUzazjXyQqFXM1rpiNP8tACIe2HW+56qJhv7+R5ml3+W0wvurnxPbeaO8oBUN9G
         Wnlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793779868; x=1794384668;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SHoCPwg3yKGYoepxE62TQiEAKgIIh9UVY9jZRidEOuw=;
        b=oLPbFGMh+4DVoGRLqHYnAOG6lpLojXIoaVu+jyXRtmoAUaKolxt2iBmQccVP9BJCFK
         X4cr3vNCCd3qqBzQqpw64pk0JeZkvwHVKKu0hXzHu8wfUjaSJ3cjWxt8zylGRxMFjIcw
         EOuByBxVhaaTnwJyrAPWw3mMLam1aamzXYgxk879N5/JTRz4XKDUqc2QCQBM1+0WZbJu
         bHuqGgy2zNdSf7jU+/f5kFX/bReJN7OFQyBtgm0YoPRhicDNGfnmn+0CBhqRPQj5Uesv
         SxFexnsbFX3AOx3zPjTLAdn2q2qkJmKYPHIDvlkaRBwqlqMbfqAqBx2c0+lq6KsTEpJp
         90aw==
X-Forwarded-Encrypted: i=1; AKwUvBw4g0N5v9Hygk5grAbpnOB4fafcVCn2CJnlVEy0olmFp6kPVzOCSXSvJovjkqI+7QJylKBxBlvhXaje3fSjbr1L@lists.infradead.org
X-Gm-Message-State: APuU4Z8r8hKL3miPt2ZReniPo1xH2xEYch9HYOhWvsVU6m0+MOLTKc/E
	2FMgvuUHVbnwMZpN/ntwP+SHv4p/S5nTg1z/nS5t1OB3nbZmkygfqtMZpUkLGGxiyjp3W5Aw0/h
	CEV/Kzw64fviX8K4GmPJOwmT5ZU4Pdt00WUVO6wseg0o1+nfg/8OZL1OnFaLltCXiad8MueSH0y
	4HVQ==
X-Gm-Gg: AYBFou3sLzrhgblC7MbIT0v3T0eyUKyobHf8An7BfQF1OZWqLa+DNw5dH7k/iePKNm8
	GzcVQ0IM0e5Paq1Iaz4SpMyy5rSES3LaLf41nJJHaT78ZeKEbiuaA0TWnIhAV5hW8V5Jm3hDS6E
	JqyLeM/0FPGs9Rw3gRqcqb+XP9tD/fN0EHJyWjhQ46aETB1Xb9xnMEpWH7DdQwhmRsTjWPDZ/1L
	lcwjpNXQg4iEsMgUIbY5tfnH4+ewLxTcjvUWOdNnsNfonphzcJdw+acVojKxuKnUThFPluViJfR
	yv08YoGu7qVVo2FcMvTl8PAm8Z4Cu8yo/EFv/mL1DzBAmFbmnkKEsY9S6FMplKE5B49iaY5ELJh
	2pIemS1o8QS+tRdTEDE7iNBqMVqUhhXDCsmZbxZNTBptulhceq7W6kpljiqAHvclI+2mv1JtzWc
	9kit9H8d9zfQ==
X-Received: by 2002:a17:90b:514f:b0:3a4:9dd7:296f with SMTP id 98e67ed59e1d1-3ae897e224bmr11430309a91.40.1793779868309;
        Wed, 04 Nov 2026 00:11:08 -0800 (PST)
X-Received: by 2002:a17:90b:514f:b0:3a4:9dd7:296f with SMTP id 98e67ed59e1d1-3ae897e224bmr11430278a91.40.1793779867692;
        Wed, 04 Nov 2026 00:11:07 -0800 (PST)
Received: from hu-ssmaurya-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b08759344dsm6089920a91.13.2026.11.04.00.11.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 00:11:06 -0800 (PST)
From: Shashank Maurya <shashank.maurya@oss.qualcomm.com>
Date: Wed, 04 Nov 2026 13:40:48 +0530
Subject: [PATCH v4 2/2] regulator: rpi-panel-v2: Add vcc-supply support
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261104-rpi_reg-v4-2-3578e794ff45@oss.qualcomm.com>
References: <20261104-rpi_reg-v4-0-3578e794ff45@oss.qualcomm.com>
In-Reply-To: <20261104-rpi_reg-v4-0-3578e794ff45@oss.qualcomm.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
        Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org,
        Shashank Maurya <shashank.maurya@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793779851; l=1681;
 i=shashank.maurya@oss.qualcomm.com; s=20260828; h=from:subject:message-id;
 bh=QWiYTLoT7AkiN37vBI/AE7LlJlRi/CqB8G17hwaEjjU=;
 b=DVVLCw4My7UiHN4FMaawHLE6nfj1PEFdkTtDbGuC4Uc8xs2R2kBnhY1R2CXl59nV6prVtRdwI
 MNy1Pr+uH0aAnwZmZJz/05OZFSF14PXJ+wjAgHFDCkkHC+/mCBWii9h
X-Developer-Key: i=shashank.maurya@oss.qualcomm.com; a=ed25519;
 pk=xld72d+QYBwDMDcn3+QLCb5AUsj/D0j8klGIuxWd860=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDAzMiBTYWx0ZWRfXw1fQAIhwfe3t
 hFCKB+B52dI+htLlYSFtPho4fPKjB5rtk3CetDGAqA246or92jh1Datmnt+GAxELBTlgj6Q5cpI
 P3kswOJRHRFaLhdk7cTMeDvQfHMO8+6jJ8wLk3XrC3JCorZCmIbFXrwjzudqwzHG58VWP7j4THJ
 QS79Hc3JYAo2al0sZ7eea/SdWVk7xQtMKtWnkp3tOmhRGeSL7+PgQmbMnFlmPCen+eL+EBJSGT6
 seuxxgLfb23rxcbCRCCp+mG6N6ONNgmHaywdtiGwDmyodz4RAxXtMtePV+k3oW3N6Qj1KK7HmEg
 fcQTb9zd83LA7Q9W0ZMcmsq/LQUkndUmYppg8TOv7M0TEWGmSoPcl5lB//3cwDlJRCmCc2bh0C7
 GP4Yag8wa0kGID1r4M96ab2r5NegDp0neB8GfnR0aqHUsTfmXtI9YpBq9BSCQfQJwX7dQfqASFN
 lpnFgYzgmWY63BhANhw==
X-Proofpoint-GUID: FzDTHrLBGBF_VXQ1J_Zgr_pb6kYy3b1g
X-Authority-Analysis: v=2.4 cv=Yoya1IYX c=1 sm=1 tr=0 ts=6aeae89d cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=RYO69U5GnIJllgjd4B4A:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDAzMiBTYWx0ZWRfXzR5xsz5rVxDv
 gW2Xs8XIQAkL/AaQZcYixPETxchNPYwGMIBu3CFr+YqxmxdL9/Ue4kAwrxVzD41iIVPwGr4sikh
 jcAhCb43lUl4JeJeTKRnzpudVxo7WGI=
X-Proofpoint-ORIG-GUID: FzDTHrLBGBF_VXQ1J_Zgr_pb6kYy3b1g
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_01,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 clxscore=1015 suspectscore=0 spamscore=0
 phishscore=0 impostorscore=0 priorityscore=1501 lowpriorityscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611040032
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261104_001110_776714_0CA6410D 
X-CRM114-Status: GOOD (  18.18  )
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

The Raspberry Pi 7" touchscreen panel V2 MCU is powered from an external
power rail which has to be enabled before any I2C register access is
attempted. Use devm_regulator_get() to obtain the vcc supply and enable
it at the start of probe.

devm_regulator_get() returns a dummy regulator when the supply is not
described in the device tree, so device trees without a vcc-supply
property keep working as before.

Signed-off-by: Shashank Maurya <shashank.maurya@oss.qualcomm.com>
---
 drivers/regulator/rpi-panel-v2-regulator.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/regulator/rpi-panel-v2-regulator.c b/drivers/regulator/rpi-panel-v2-regulator.c
index 30b78aa75ee3..e54d675962e7 100644
--- a/drivers/regulator/rpi-panel-v2-regulator.c
+++ b/drivers/regulator/rpi-panel-v2-regulator.c
@@ -11,6 +11,7 @@
 #include <linux/module.h>
 #include <linux/pwm.h>
 #include <linux/regmap.h>
+#include <linux/regulator/consumer.h>
 
 /* I2C registers of the microcontroller. */
 #define REG_ID		0x01
@@ -66,10 +67,21 @@ static int rpi_panel_v2_i2c_probe(struct i2c_client *i2c)
 		.parent		= &i2c->dev,
 		.reg_set_base	= REG_POWERON,
 	};
+	struct regulator *vcc;
 	struct regmap *regmap;
 	struct pwm_chip *pc;
 	int ret;
 
+	vcc = devm_regulator_get(&i2c->dev, "vcc");
+	if (IS_ERR(vcc))
+		return dev_err_probe(&i2c->dev, PTR_ERR(vcc),
+				     "Failed to get vcc supply\n");
+
+	ret = regulator_enable(vcc);
+	if (ret)
+		return dev_err_probe(&i2c->dev, ret,
+				     "Failed to enable vcc supply\n");
+
 	pc = devm_pwmchip_alloc(&i2c->dev, 1, 0);
 	if (IS_ERR(pc))
 		return PTR_ERR(pc);

-- 
2.34.1


