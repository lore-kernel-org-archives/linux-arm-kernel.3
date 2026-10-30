Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B69A9606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Oct 2026 14:03:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=bWCPidXQ;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WI4N3ImJ;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UDYxEcga
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=IFjgsi/GRlis4bzhLMHvpJ/jURFZy6HO4rYGSHjoXuo=; b=bWCPidXQos0pjDsmwfm1RfY/0G
	0s1zcdAZCzqS7riySPz8ndpBbJqK1ue0VVfK8+Dc+3BbOARy6nVxxvMb2qZwdDsLUXITd41bkY5dR
	aSPdzedpXrRJc+ou/t1D7DP/drSYb79fG7sBL0Kbpk85PmlR1kAomjEFGJqonIfDTXkAYzSII4E9A
	NoYsiMS92NxFriYte57/3pkgIg5Glo7ZQBCznDrRPeahzyt1iH26p14BFFEoKC4cQ4gZHRQ87AkBm
	wXTyNRzoCwfyxz9lY0fcnjXgTf4MFg4GoGKb13kENBQ6J/cgcJQcZWPpo35gmyNxMHisA3lLetRst
	vUsXctNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMnC7-0000000BoqQ-1l0a;
	Fri, 30 Oct 2026 14:02:59 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMnC4-0000000BopC-0mT7
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 Oct 2026 14:02:57 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69UDnQEx2883798
	for <linux-arm-kernel@lists.infradead.org>; Fri, 30 Oct 2026 14:02:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=IFjgsi/GRlis4bzhLMHvpJ/jURFZy6HO4rY
	GSHjoXuo=; b=WI4N3ImJpfIaQ2wEpfmHv9zPO6aOB8ROutVdbRWf6l1oNMX0KMr
	ayHgnh/HbpgRTktmGVXPoVheO2IJfoqyN+BfGxsAAFu0lknSPym2atWBQ8v2ZoAu
	01Jk2LpEblNKn6Kvqyo9sm1g3eDJ1kg+AFxUGeb0nsLXobVMUwaFkiWJHlsKU7XK
	6+sAB7wGfvNBPAya6HAS8VV6ub3UifixLyX9uKaVGgnynMD+k/auco7izI5l9SQV
	KqTfvLA8tKcYTbg/l/cBYS11ntCFULvDCBss0QpcV81Hdl5/CfbFV91yXTUT3MfO
	gvKTXdGK2E5nwx0LES0WYwH9Bm4lRFp9gWw==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hme6qkch3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 30 Oct 2026 14:02:55 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-7bf45382794so575991137.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 30 Oct 2026 07:02:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793368974; x=1793973774; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=IFjgsi/GRlis4bzhLMHvpJ/jURFZy6HO4rYGSHjoXuo=;
        b=UDYxEcgaRYSHBB8uQCfvrn+GjMNavwYKlz774PiBTbyCvS3oSleB80OpYROyDTJhVF
         sNtoDO024oceuuDP/3PeNLfTFMLYfBVukxp2t24+93MtRv8fsriGx4w1JqmaK32iHEgz
         /e7Ziw0mNCyd32as7jzGFKhpOuMhqXHPIZta6aQEzN/CFF4JKcgH7GvHdEWYm0QgXIVC
         kXaX3OPJ1N3DrO0184uVb2UMSu6RW10r7tLY769hu+/fAEmA47MOW73dwbn4uodIwu9O
         EqxvyhzrbGi6Wa1wD9z4VXEkQ7eph43VtihqvjWOf4gXKH6tpapid9IHxCF5Ao0zdEic
         sK0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793368974; x=1793973774;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IFjgsi/GRlis4bzhLMHvpJ/jURFZy6HO4rYGSHjoXuo=;
        b=NTZYccaiDievf6uq2L7W4OyGHat0+hdOHpD+NC121H6zjbie7T0R4SsZMSNNmPWIRx
         WTvwngEQjuW8RkjaCbX23XSdXDVUz3cV75wAc2BjNrk2059vnD9H8JrxdAFTSAjneKr7
         vwM17MZ6s5t+9v6wDqnlD2UBykATNznxCusR+/ifv17OCJpbspXjQZ81mSNHgzzcextD
         ZIEDOUwFkO9opIm4ANuKZgqgpWSYXS7QhCt5soyAwDR8Y/0LA2n92wddWpLnRbWx83gJ
         wjv6SI5/82Kz725Uli0OlQAP4Z+wOoaB2uhmNA3bQAtgx64MoZa+5w6+TPcw1L1CqxMQ
         zK1A==
X-Forwarded-Encrypted: i=1; AKwUvBwr9/EfBtZ06T/tdolu8xD2i05OG+Xu4PdL/PKNVjIEl54qKn1kS7iExsFyWR7D6EJCrDGFBAIfkB1nUCOH9JHK@lists.infradead.org
X-Gm-Message-State: AFq9FYLwqaxN5vGeTFnpeOCWta2iDCCTjYnWJ8sRoztHFoM78jz4yVVk
	tczeF2NJCzeFBpAI5cLGuDqQ5+UTbUIhDdhZ3bhH3iacADqwAriR+Eaf6K/Pc8Kz7keph8v1uaf
	OW5mwRMIuNQg3f3tpwsB/5q4wbxiF8E5fmT2qA5CYBZCuODE+k9gvzkeKnhyWMVutJRbo96RLYc
	nh+g==
X-Gm-Gg: AYBFou3J8ZXPB9slitrl1E05RnetqKHstRz+Qlo5ajUFgOIACVXaEIzXKnUrllQej2/
	MLCthc0by8iXtq74PV9y5C7lbreplfTi7iaKJ8g/9v6gL5xPFJq/iCp/HviKuPTFQGV8fvXlB2M
	UqpIR76dm0eJ2lCivHtMOFTfP101lU8zLnNrz4FCOTB9WmEnkl9yFoUVS18+Ihixaao0Hg2Ru9+
	jBugGOY8EaaE6wfoF0EduW1valiy/qJnukbts2zjVhbIdVjtXmMdbxTkgnt8/islj3eSjo4njhD
	xRzxd4I6vyn3Yxvl/IqExGiPjBUs3amdwO9vpmPJfo9NqNxaJAi3/iUriE/9FcwrlCUkzUjEMC2
	/BAz/6RXE1E6Y/ECDxeH3vD5QP0cAoWAoN5RMiPdRxOdwldsGpkxrcZJql5MQig==
X-Received: by 2002:a05:6102:5809:b0:7c3:872c:8be6 with SMTP id ada2fe7eead31-7d0727248a5mr1300603137.25.1793368973779;
        Fri, 30 Oct 2026 07:02:53 -0700 (PDT)
X-Received: by 2002:a05:6102:5809:b0:7c3:872c:8be6 with SMTP id ada2fe7eead31-7d0727248a5mr1300332137.25.1793368971551;
        Fri, 30 Oct 2026 07:02:51 -0700 (PDT)
Received: from quoll ([178.197.218.7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa81a896ecsm146146995e9.9.2026.10.30.07.02.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 07:02:50 -0700 (PDT)
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
        Charles Keepax <ckeepax@opensource.cirrus.com>
Subject: [PATCH v2 1/2] mfd: Constify mfd_cell arrays
Date: Fri, 30 Oct 2026 15:02:41 +0100
Message-ID: <20261030140240.211786-3-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=11016; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=EWIm3544qpQQKeJj+/fAFQXHPlPP2luT+MUHI1/vUow=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBq5KOAOln00t9A7RhXWH7gHS5bSpR8Rw5ik8jtP
 Gf/8s+8riGJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCauSjgAAKCRDBN2bmhouD
 14r2D/9/Dkt85cLMU8CIES/4xAfvTDALI/eE49ZK5xnM2GUrwAltfCjqZCyGDT171axS0naD52e
 dJ8ZtrHCKSVa7b/YqWD8Aqmu26E9cpqFnByM5HI38WYkgn1TxSPDE86ylI6onH23pRMCUNaN27S
 Zzo3yFdzGDNCfkU83lmMxwWS5xKqAnoXVm+Otw1YUYwVt8U6CzKaNfvlcBy/9OWCA2RXqs+FnG2
 BgijlyOoJkJZYjLDPneGF9tCvdZ0Xe33/e9hEJRO1rR7JIHI5u8zJq3GY06sPjdi+Dny+OctXHp
 HuoVkcFjW3csK5fyyfmoKZUpa4e6cFaehv+RE3BGfaQzPR2KYRd0aBaPXnvdIxIZI91aPdYwZFp
 jkUDxHsVfNVdtpifFPIYHa3wO68rRzfXlRVUqr13Oo39c8VdrciwmuWM3vM1/M5G3YgWtf2zz+P
 koiXhLRKvh+m9yo+LpsiDhcM3j9XFm2YOO/aGS5E98VimUPWO6fxrS8e3pECxa/UEQOeGuA8RYR
 aZPmt6WzJ3aN8PSBe2ljgzV+LRO0JV0XrROr8q6OQSLUB8ZdvSvQqkHaDCkG2f5KyjpNSigfkv4
 z9c/1L6d/ulrKwVu90uTlRg+uxev4U8oFaYsqnNh5V9Pn6aJ3b2srY56JQEJs6daRJaZfJpLkQf tggO7Py57jexoXA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDA1NCBTYWx0ZWRfX60ZCm5J30+f4
 pzBnwtnwEbJBF3KZDBsYdT8r6zaHUlQpE2d4myqpzIFkrvHPLXfpvwzF2LNKbh+mVhztGraHRNc
 xMQyYCZ75xSf7maO5LvmjWquzkBn9VOJQh/yIQXxvrgWXT6UrlmiVXvSjCDRJhUc/x6TPcTAVqN
 rboLYO6NU7pWyEO2mJRCslwby5/olV67xXn8D/IatibU9XXOaxq9yifA43E745XiGJqggxWzd83
 cMmBl9jjyc2O86jLwuUK9X9I34BaeOk21si1QzivkCV3jSrGCh/kgJkqOvvJAA9j9Se5JIP/pbD
 KHIi+sITV3GP3egv30JdFG7+kgo4i41BvGbDxHNQDFw/75VIgPkZ4AESi5DSleqvTTL8w3Ar0mT
 DjobNTAvU/gdQrTQENmlcdzfbiClBrvNK6p+3m200z99NLRQxKUDkWWRHjofOv3K4FF+7LNTim7
 DURnNPluQc/7HM76sUQ==
X-Proofpoint-GUID: J6Qk3bETli2dBFmin5b6IeGQVweBH1PL
X-Proofpoint-ORIG-GUID: J6Qk3bETli2dBFmin5b6IeGQVweBH1PL
X-Authority-Analysis: v=2.4 cv=IumL47/g c=1 sm=1 tr=0 ts=6ae4a38f cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=uyPgTw0bjBTS2cVxpiNm5w==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=VwQbUJbxAAAA:8
 a=w1d2syhTAAAA:8 a=P-IC7800AAAA:8 a=EUspDBNiAAAA:8 a=_gzb5aec3OYO3pdMjf0A:9
 a=-aSRE8QhW-JAV6biHavz:22 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDA1NCBTYWx0ZWRfX+KRv9EmpgpHn
 VVRiqqRh6HtsTJbaINNDcl7RAkZ/UAsjaIiooLHvPLXB2NGe2ALWKUhRvaknz7EFIKpJObInoW5
 egr+pqFT7rTYVGXmZMvkG7hP2z+xVUE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 clxscore=1015 spamscore=0 bulkscore=0
 malwarescore=0 phishscore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610300054
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261030_070256_231947_0FE7A099 
X-CRM114-Status: GOOD (  20.11  )
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

mfd_add_devices() takes pointer to const, so 'struct mfd_cell' arrays
can be constified whenever driver does not modify it in the probe.

Acked-by: Chen-Yu Tsai <wens@kernel.org> # ac100 & axp20x
Acked-by: Charles Keepax <ckeepax@opensource.cirrus.com>
Acked-by: Thomas Richard (congatec GmbH) <thomas.richard@bootlin.com> # cgbc-core
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

Changes in v2:
1. Add tags
2. Drop wm97xx-core.c, it was not intended to be committed
---
 drivers/mfd/ac100.c                   | 2 +-
 drivers/mfd/axp20x.c                  | 4 ++--
 drivers/mfd/cgbc-core.c               | 2 +-
 drivers/mfd/cs5535-mfd.c              | 2 +-
 drivers/mfd/intel_soc_pmic_bxtwc.c    | 2 +-
 drivers/mfd/intel_soc_pmic_chtdc_ti.c | 2 +-
 drivers/mfd/intel_soc_pmic_chtwc.c    | 2 +-
 drivers/mfd/intel_soc_pmic_crc.c      | 6 +++---
 drivers/mfd/max77705.c                | 2 +-
 drivers/mfd/menf21bmc.c               | 2 +-
 drivers/mfd/mxs-lradc.c               | 6 +++---
 drivers/mfd/rohm-bd718x7.c            | 6 +++---
 drivers/mfd/rsmu_core.c               | 8 ++++----
 drivers/mfd/stmfx.c                   | 2 +-
 drivers/mfd/vexpress-sysreg.c         | 2 +-
 15 files changed, 25 insertions(+), 25 deletions(-)

diff --git a/drivers/mfd/ac100.c b/drivers/mfd/ac100.c
index 8f47c392cbd1..51b4d468c51d 100644
--- a/drivers/mfd/ac100.c
+++ b/drivers/mfd/ac100.c
@@ -75,7 +75,7 @@ static const struct regmap_config ac100_regmap_config = {
 	.cache_type	= REGCACHE_MAPLE,
 };
 
-static struct mfd_cell ac100_cells[] = {
+static const struct mfd_cell ac100_cells[] = {
 	{
 		.name		= "ac100-codec",
 		.of_compatible	= "x-powers,ac100-codec",
diff --git a/drivers/mfd/axp20x.c b/drivers/mfd/axp20x.c
index 50df66de24e0..4d770e718716 100644
--- a/drivers/mfd/axp20x.c
+++ b/drivers/mfd/axp20x.c
@@ -1055,13 +1055,13 @@ static const struct mfd_cell axp152_cells[] = {
 	},
 };
 
-static struct mfd_cell axp313a_cells[] = {
+static const struct mfd_cell axp313a_cells[] = {
 	/* AXP323 is sometimes paired with AXP717 as sub-PMIC */
 	MFD_CELL_BASIC("axp20x-regulator", NULL, NULL, 0, 1),
 	MFD_CELL_RES("axp313a-pek", axp313a_pek_resources),
 };
 
-static struct mfd_cell axp717_cells[] = {
+static const struct mfd_cell axp717_cells[] = {
 	MFD_CELL_NAME("axp20x-regulator"),
 	MFD_CELL_RES("axp20x-pek", axp717_pek_resources),
 	MFD_CELL_OF("axp717-adc",
diff --git a/drivers/mfd/cgbc-core.c b/drivers/mfd/cgbc-core.c
index 2becaf797646..3460c50047ea 100644
--- a/drivers/mfd/cgbc-core.c
+++ b/drivers/mfd/cgbc-core.c
@@ -231,7 +231,7 @@ int cgbc_command(struct cgbc_device_data *cgbc, void *cmd, unsigned int cmd_size
 }
 EXPORT_SYMBOL_GPL(cgbc_command);
 
-static struct mfd_cell cgbc_devs[] = {
+static const struct mfd_cell cgbc_devs[] = {
 	{ .name = "cgbc-wdt"	},
 	{ .name = "cgbc-gpio"	},
 	{ .name = "cgbc-i2c", .id = 1 },
diff --git a/drivers/mfd/cs5535-mfd.c b/drivers/mfd/cs5535-mfd.c
index f3becbef19f5..d91d60dc5416 100644
--- a/drivers/mfd/cs5535-mfd.c
+++ b/drivers/mfd/cs5535-mfd.c
@@ -37,7 +37,7 @@ const struct software_node cs5535_gpio_swnode = {
 };
 EXPORT_SYMBOL_NS(cs5535_gpio_swnode, "CS5535");
 
-static struct mfd_cell cs5535_mfd_cells[] = {
+static const struct mfd_cell cs5535_mfd_cells[] = {
 	{
 		.name = "cs5535-smb",
 		.num_resources = 1,
diff --git a/drivers/mfd/intel_soc_pmic_bxtwc.c b/drivers/mfd/intel_soc_pmic_bxtwc.c
index 117517c171b5..5aa9e52401f0 100644
--- a/drivers/mfd/intel_soc_pmic_bxtwc.c
+++ b/drivers/mfd/intel_soc_pmic_bxtwc.c
@@ -245,7 +245,7 @@ static const struct resource tmu_resources[] = {
 	DEFINE_RES_IRQ_NAMED(BXTWC_TMU_IRQ, "TMU"),
 };
 
-static struct mfd_cell bxt_wc_dev[] = {
+static const struct mfd_cell bxt_wc_dev[] = {
 	{
 		.name = "bxt_wcove_thermal",
 		.num_resources = ARRAY_SIZE(thermal_resources),
diff --git a/drivers/mfd/intel_soc_pmic_chtdc_ti.c b/drivers/mfd/intel_soc_pmic_chtdc_ti.c
index 6daf33e07ea0..8412a25d37ff 100644
--- a/drivers/mfd/intel_soc_pmic_chtdc_ti.c
+++ b/drivers/mfd/intel_soc_pmic_chtdc_ti.c
@@ -53,7 +53,7 @@ static const struct resource battery_resources[] = {
 	DEFINE_RES_IRQ(CHTDC_TI_CCEOCAL),
 };
 
-static struct mfd_cell chtdc_ti_dev[] = {
+static const struct mfd_cell chtdc_ti_dev[] = {
 	{
 		.name = "chtdc_ti_pwrbtn",
 		.num_resources = ARRAY_SIZE(power_button_resources),
diff --git a/drivers/mfd/intel_soc_pmic_chtwc.c b/drivers/mfd/intel_soc_pmic_chtwc.c
index aa71a7d83fcd..f27985a58c87 100644
--- a/drivers/mfd/intel_soc_pmic_chtwc.c
+++ b/drivers/mfd/intel_soc_pmic_chtwc.c
@@ -50,7 +50,7 @@ static const struct resource cht_wc_ext_charger_resources[] = {
 	DEFINE_RES_IRQ(CHT_WC_EXT_CHGR_IRQ),
 };
 
-static struct mfd_cell cht_wc_dev[] = {
+static const struct mfd_cell cht_wc_dev[] = {
 	{
 		.name = "cht_wcove_pwrsrc",
 		.num_resources = ARRAY_SIZE(cht_wc_pwrsrc_resources),
diff --git a/drivers/mfd/intel_soc_pmic_crc.c b/drivers/mfd/intel_soc_pmic_crc.c
index 627a89334908..ce4c9ef59198 100644
--- a/drivers/mfd/intel_soc_pmic_crc.c
+++ b/drivers/mfd/intel_soc_pmic_crc.c
@@ -54,7 +54,7 @@ static const struct resource gpio_resources[] = {
 	DEFINE_RES_IRQ_NAMED(CRYSTAL_COVE_IRQ_GPIO, "GPIO"),
 };
 
-static struct mfd_cell crystal_cove_byt_dev[] = {
+static const struct mfd_cell crystal_cove_byt_dev[] = {
 	{
 		.name = "crystal_cove_pwrsrc",
 		.num_resources = ARRAY_SIZE(pwrsrc_resources),
@@ -93,7 +93,7 @@ static struct mfd_cell crystal_cove_byt_dev[] = {
 	},
 };
 
-static struct mfd_cell crystal_cove_cht_dev[] = {
+static const struct mfd_cell crystal_cove_cht_dev[] = {
 	{
 		.name = "crystal_cove_gpio",
 		.num_resources = ARRAY_SIZE(gpio_resources),
@@ -142,7 +142,7 @@ static struct pwm_lookup crc_pwm_lookup[] = {
 
 struct crystal_cove_config {
 	unsigned long irq_flags;
-	struct mfd_cell *cell_dev;
+	const struct mfd_cell *cell_dev;
 	int n_cell_devs;
 	const struct regmap_config *regmap_config;
 	const struct regmap_irq_chip *irq_chip;
diff --git a/drivers/mfd/max77705.c b/drivers/mfd/max77705.c
index 2e9b81f26414..771015c229c8 100644
--- a/drivers/mfd/max77705.c
+++ b/drivers/mfd/max77705.c
@@ -15,7 +15,7 @@
 #include <linux/regmap.h>
 #include <linux/of.h>
 
-static struct mfd_cell max77705_devs[] = {
+static const struct mfd_cell max77705_devs[] = {
 	MFD_CELL_OF("max77705-rgb", NULL, NULL, 0, 0, "maxim,max77705-rgb"),
 	MFD_CELL_OF("max77705-charger", NULL, NULL, 0, 0, "maxim,max77705-charger"),
 	MFD_CELL_OF("max77705-haptic", NULL, NULL, 0, 0, "maxim,max77705-haptic"),
diff --git a/drivers/mfd/menf21bmc.c b/drivers/mfd/menf21bmc.c
index 0f24de516d72..252d5c81db6b 100644
--- a/drivers/mfd/menf21bmc.c
+++ b/drivers/mfd/menf21bmc.c
@@ -17,7 +17,7 @@
 #define BMC_CMD_REV_MINOR	0x81
 #define BMC_CMD_REV_MAIN	0x82
 
-static struct mfd_cell menf21bmc_cell[] = {
+static const struct mfd_cell menf21bmc_cell[] = {
 	{ .name = "menf21bmc_wdt", },
 	{ .name = "menf21bmc_led", },
 	{ .name = "menf21bmc_hwmon", }
diff --git a/drivers/mfd/mxs-lradc.c b/drivers/mfd/mxs-lradc.c
index 64afc7631790..71ad5184f7e0 100644
--- a/drivers/mfd/mxs-lradc.c
+++ b/drivers/mfd/mxs-lradc.c
@@ -90,7 +90,7 @@ static struct resource mx28_touchscreen_resources[] = {
 	DEFINE_RES_IRQ_NAMED(MX28_LRADC_CH7_IRQ, "mxs-lradc-channel7"),
 };
 
-static struct mfd_cell mx23_cells[] = {
+static const struct mfd_cell mx23_cells[] = {
 	{
 		.name = "mxs-lradc-adc",
 		.resources = mx23_adc_resources,
@@ -103,7 +103,7 @@ static struct mfd_cell mx23_cells[] = {
 	},
 };
 
-static struct mfd_cell mx28_cells[] = {
+static const struct mfd_cell mx28_cells[] = {
 	{
 		.name = "mxs-lradc-adc",
 		.resources = mx28_adc_resources,
@@ -128,7 +128,7 @@ static int mxs_lradc_probe(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	struct device_node *node = dev->of_node;
 	struct mxs_lradc *lradc;
-	struct mfd_cell *cells = NULL;
+	const struct mfd_cell *cells = NULL;
 	struct resource *res;
 	int ret = 0;
 	u32 ts_wires = 0;
diff --git a/drivers/mfd/rohm-bd718x7.c b/drivers/mfd/rohm-bd718x7.c
index 0b0f8e27e329..bd087004dde8 100644
--- a/drivers/mfd/rohm-bd718x7.c
+++ b/drivers/mfd/rohm-bd718x7.c
@@ -19,12 +19,12 @@
 
 #include "rohm-pwrbutton.h"
 
-static struct mfd_cell bd71837_mfd_cells[] = {
+static const struct mfd_cell bd71837_mfd_cells[] = {
 	{ .name = "bd71837-clk", },
 	{ .name = "bd71837-pmic", },
 };
 
-static struct mfd_cell bd71847_mfd_cells[] = {
+static const struct mfd_cell bd71847_mfd_cells[] = {
 	{ .name = "bd71847-clk", },
 	{ .name = "bd71847-pmic", },
 };
@@ -113,7 +113,7 @@ static int bd718xx_i2c_probe(struct i2c_client *i2c)
 	struct irq_domain *irq_domain;
 	int ret;
 	unsigned int chip_type;
-	struct mfd_cell *mfd;
+	const struct mfd_cell *mfd;
 	int cells;
 
 	if (!i2c->irq) {
diff --git a/drivers/mfd/rsmu_core.c b/drivers/mfd/rsmu_core.c
index fd04a6e5dfa3..02bfb84653ae 100644
--- a/drivers/mfd/rsmu_core.c
+++ b/drivers/mfd/rsmu_core.c
@@ -22,7 +22,7 @@ enum {
 	RSMU_N_DEVS = 2,
 };
 
-static struct mfd_cell rsmu_cm_devs[] = {
+static const struct mfd_cell rsmu_cm_devs[] = {
 	[RSMU_PHC] = {
 		.name = "8a3400x-phc",
 	},
@@ -31,7 +31,7 @@ static struct mfd_cell rsmu_cm_devs[] = {
 	},
 };
 
-static struct mfd_cell rsmu_sabre_devs[] = {
+static const struct mfd_cell rsmu_sabre_devs[] = {
 	[RSMU_PHC] = {
 		.name = "82p33x1x-phc",
 	},
@@ -40,7 +40,7 @@ static struct mfd_cell rsmu_sabre_devs[] = {
 	},
 };
 
-static struct mfd_cell rsmu_sl_devs[] = {
+static const struct mfd_cell rsmu_sl_devs[] = {
 	[RSMU_PHC] = {
 		.name = "8v19n85x-phc",
 	},
@@ -51,7 +51,7 @@ static struct mfd_cell rsmu_sl_devs[] = {
 
 int rsmu_core_init(struct rsmu_ddata *rsmu)
 {
-	struct mfd_cell *cells;
+	const struct mfd_cell *cells;
 	int ret;
 
 	switch (rsmu->type) {
diff --git a/drivers/mfd/stmfx.c b/drivers/mfd/stmfx.c
index f683fdb6ece6..b0db33c0a7f2 100644
--- a/drivers/mfd/stmfx.c
+++ b/drivers/mfd/stmfx.c
@@ -73,7 +73,7 @@ static const struct resource stmfx_ts_resources[] = {
 	DEFINE_RES_IRQ(STMFX_REG_IRQ_SRC_EN_TS_OVF),
 };
 
-static struct mfd_cell stmfx_cells[] = {
+static const struct mfd_cell stmfx_cells[] = {
 	{
 		.of_compatible = "st,stmfx-0300-pinctrl",
 		.name = "stmfx-pinctrl",
diff --git a/drivers/mfd/vexpress-sysreg.c b/drivers/mfd/vexpress-sysreg.c
index f49cee91f71c..c5f375cd22ae 100644
--- a/drivers/mfd/vexpress-sysreg.c
+++ b/drivers/mfd/vexpress-sysreg.c
@@ -69,7 +69,7 @@ static const struct software_node vexpress_sysreg_sys_flash_swnode = {
 	.properties = vexpress_sysreg_sys_flash_props,
 };
 
-static struct mfd_cell vexpress_sysreg_cells[] = {
+static const struct mfd_cell vexpress_sysreg_cells[] = {
 	{
 		.name = "basic-mmio-gpio",
 		.of_compatible = "arm,vexpress-sysreg,sys_led",
-- 
2.53.0


