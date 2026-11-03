Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 708416082BE0
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 13:34:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=agqJP0mR;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PaX60grQ;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fslOS7em
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=DTqLAUKcdunUoMIDUDVQW9cBAtclBrFvLZfGH8GUl2Y=; b=agqJP0mR3c9MGt
	NbSCJQLHO7qC+ja7l613DfuEid7nbpdRrlhbNFc0cETk3+ASdn3GGLuBWJ+USyxqaZFKxOq5Rdng5
	pbF13kyY8XjCsjW49kXqvaoulypA7uf7Phrb+S69cxMlu4cuhT5jfLzJdqW/a7UJPW6kAtk5KHnqL
	Fm4ypwGFgC3o8wU/pPeUVCCae9GkDfJ+uFU21JlEcaHrJ7T1WAwDi27gKzYOs0Uo+fpPUG0PoZ/jJ
	kc7f8tsOforR+FmHFJqqLvd8wydAUhNiaJZBlMUQqL29vQJLrsyhiL9fCelYV9bIOFfjq09keasxW
	jwb/PdW/fomTwOEO1U/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOEee-00000002ZXC-1HoW;
	Tue, 03 Nov 2026 13:34:24 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOEeb-00000002ZV8-2gEJ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 13:34:22 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A3ClNbT2866294
	for <linux-arm-kernel@lists.infradead.org>; Tue, 3 Nov 2026 13:34:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DTqLAUKcdunUoMIDUDVQW9cBAtclBrFvLZfGH8GUl2Y=; b=PaX60grQy2eNFep0
	DO3/PPj54urDEBHx1h8NEYiDFY57Lq8fD8MmHEsFlTANYufLvVHkzSUTCk4EScwK
	Tku3i4Z9MMln/T2hs8xTmb/LZ6w5rpWZ1TRqdwGY0Z74mvFXntUURJaQ44jQs3dY
	52Ymhjr2KHdreS87YmrR+bxRFhXEca1Jy/yVd2FolB/o6mc0s2K07nRXLImQZGN6
	Mt6xSUdmj66I2ALx4D+zOIvSPYbn7h04f+qNfDhfjlCh3Xnv54fPrW04CYHtYKPc
	3+Kyzp6RbKix2u5uwG7hxj8L9iq4BfR8Avf1GjKafw76pJcANkM/PnxBdHqnIEz/
	7xxHNg==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hq4v5jve8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Nov 2026 13:34:20 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-7c0f07b4e81so717854137.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Nov 2026 05:34:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793712860; x=1794317660; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DTqLAUKcdunUoMIDUDVQW9cBAtclBrFvLZfGH8GUl2Y=;
        b=fslOS7emBcsm29WG+i+rqp7YW5xB1EkyQwS8PoxZzH0NYtJMOxc9aL113PF94NkwDb
         ly8UTpIPkcAmhGRvIetCE2qKV4wVmxFJuCSG/aWU9Ce2cag0uSwgVHo4DaGpXe1FUakx
         BxetSxIz5Ny+Aww2xRPhjbZpuOzklBlVkcNp+8dmDviY+BKIu9vddcN1N7ZrHTnxL1JL
         Ba31tCZP9khsH2MzbpH10JTNO6MDaxaPj1FEjc3ws1hUioFPO0KUGLyxaaflQsxLkKll
         QMHQaiKDNbOr1+xJuEDJrrqU/3fEPFgyElEMlaL1lUyLMwxlQt2IjkHepW/ct4FDN1Cj
         wzPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793712860; x=1794317660;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DTqLAUKcdunUoMIDUDVQW9cBAtclBrFvLZfGH8GUl2Y=;
        b=JgluUNVFw2IH1H9jxZFpk2d3cXqtLYVu/TOGe785RmM2dbMeitrzoMJa0RSQ7bj6U/
         gbCjv8aUFiSjS4vcB9g0M010isKX0QxZh+BK1ZUQbJ0lTAk/VugOqo9NH41ZleO8pqZk
         ufUNYP94GimMOsoG82TNsnnx0EOjcAvU87fW5BKcSlR8UY21RQOs6QL3FMkyuZlb/OpK
         PUjpSOhc+Ic7FpRZBA41KQpayrjgULM8n3rBiKpN+LrJjMU+wBQ162n12BjO4b5KvDPL
         85ibKpvvm0etYPGcc0Z7wnQlAmCbA0/zS335LLt7ik+IiaUX8ExD4yKtEk9ThXkLe+b3
         rQGg==
X-Gm-Message-State: APuU4Z+Q1XmzcGe6OEF5B4NT4qcHDUe4Qs781OwaCmy5dgwwiQqGm0Ln
	JVvXbD2o5FGN6J4/eNCdNyZk0qieYrHvUjBYONDeyfbJBakT3xnYGHhvOfl4E6Xxn1cIFT/sApK
	L7QSivwvsUQLjAlfR8SsrqoXZOxwLQi8yILNLSq7KEYpA40XzIkKXWEzguKhugg6Dh12iXYNS8Y
	0BhA==
X-Gm-Gg: AYBFou3b9O5Lp/weTRsE0R/yL5dp5c5cTRkx3jZUESEmMLtqXgSIAbcACIzN3JnnJYo
	oi9wmMwZamHxS4c1i/ZgMQCrzn+4EQt2qmew/IajLslVViowNAHR4t90ov7LopoQ4ILIbpslL13
	YMmE+ZX8cYqI1kYRZdKn1KAK8vg/EZ9eYCrt0S4prr2YVFDkIQup5eTESheMHgbf9sMYOiUQJmS
	+WiFuj1Y0VYMMSmuQZoGJ1iiu2AVThysKNCeGn5Rv1qmc1PmqTNAj5hkFtYqGMjUnBOvK7MfwUM
	7WpDLy31zZ9qGqpe/bVeC3b4ZXXprzmomv0be7vPbaiF2pIi3NBLR8a+O7f+5EwNEKS3iGH56wP
	iKP2ijR3juYL2m0XAF3tBDEUd6NKl3QfWQ2n4yvx4LKMXpAvvu5lGVRntJopm2gDd4oVXhvYZqF
	W95g==
X-Received: by 2002:a05:6102:604b:b0:7cc:9d46:ac88 with SMTP id ada2fe7eead31-7d072626935mr3533215137.18.1793712859597;
        Tue, 03 Nov 2026 05:34:19 -0800 (PST)
X-Received: by 2002:a05:6102:604b:b0:7cc:9d46:ac88 with SMTP id ada2fe7eead31-7d072626935mr3533187137.18.1793712858980;
        Tue, 03 Nov 2026 05:34:18 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71ba7168sm26866970f8f.55.2026.11.03.05.34.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 05:34:18 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 03 Nov 2026 14:33:54 +0100
Subject: [PATCH 3/3] drm/panel-mipi-dbi: drop GPIOD_FLAGS_BIT_NONEXCLUSIVE
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261103-panel-mipi-non-exclusive-gpios-v1-3-aa862c1d71e3@oss.qualcomm.com>
References: <20261103-panel-mipi-non-exclusive-gpios-v1-0-aa862c1d71e3@oss.qualcomm.com>
In-Reply-To: <20261103-panel-mipi-non-exclusive-gpios-v1-0-aa862c1d71e3@oss.qualcomm.com>
To: Russell King <linux@armlinux.org.uk>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Chen-Yu Tsai <wens@kernel.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
        linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org,
        linux-sunxi@lists.linux.dev, dri-devel@lists.freedesktop.org,
        linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1340;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=L77EVNO37nJ8bqShHP/VkH28Qj8EpKeHm6Kw3WFdyMI=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBq6eLSAKCGRs/5xWd0LbuvTkv0Yz4BLBG2Wt+fx
 WEuk0Rn70OJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCauni0gAKCRAFnS7L/zaE
 w1m7D/oDxRKdjJGFSMRo90SmI08LhWyVliSQHqb9JufJtsRCV3NGcX4zCS+jMU4grEWv0lfuXu4
 6+4yVk6EQyvgJWHhRyWISjQbGRLHjMgBMZ9BZ/aJdVT74Y+OyN1fNWO6Tjwt3hll/O4txb57Cx6
 DOxKARd/3QmK0BGXUEdHAafVAddJBW9ERKPc3rzCjHVamct6gAoJlElxXM1KRmyTGBsYjXQ0Y4Y
 OE40frmKz80lBd7jlFF3Xp2+pS4uL76NuhhpcIQTOYcvixff+ItacRK1syYVL40xIG+SD3FBlh7
 z7t3xJ8ES0U0guj5vwRBpJa2xOFdKe7z4zHQAA7rFtwA0vmgKpPaK+KzlVi7mNLZwStySmisjC0
 wfhKFNv4uuTiaza96qK6pzeg6UC41Ejwfn8y1DbtNuHYebdPLTUQKHNvve5FNAJLr0xkcNErbr5
 ubhpZ9hiOtBdsG2AEXM0C0sryKXmynqccTydaaYRrtaY9xABHDk288XLpglrFrF6Hoe3zBbBrZr
 eLkqDB8W/ZgRR9exnAXnfgO+aURE3oqvdFz4blA8o/dMao86USkCnoxUVDxGxz8EH9Jrlj8CN3H
 zaSMeQ7LI1ZT3IvnNKhc5Pt84Wnc1aYPXV8DqAn4hNaP/e/4fBE7HyaWGDRDPE6KYvHBq29oNHX
 sE7DR92bWXgVLvg==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-ORIG-GUID: hRBU4AU3C9qR4PVA-8rd4x1uNrzdRXmb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDA1MyBTYWx0ZWRfX4TwFRAWZ/cbF
 2EwVfZ7UkRWvcf73Ga/qT5TB9NXsmSUgeCpIdkbRc2ZxLrA5+pGRnUjF1MBoi9ds4CYuEUkCZD+
 p26IE0x2UZYQIc1Xs6+kAOX+ZtI0AUVtu5Aw6DpK+kj8NK80zE7uQzCAjz7shosRqhl9lR5JDBf
 hyEZZRDZCMiydp+J4DDjEvJHNWdDRPodKfnf8ZjmIWQS84e8clSs6s+PjMZaNTQvfg3yrqzIP2o
 VfvXWVWwFiUDIufBSygAYTfmu0ZLZPFzsFjshvJ0eEebU07owFx0B9udCJ+XhGyKdwRR18VBL7U
 Ja+uoif4Ghl7da+joc8DUnI2TKB66LQ1M1bgZ73uGTBZ/eY0yXp5UhVUjX6LcVz1RJ4waagh0nC
 B8I978+vQwFBKpgZ/2O0dUBDXIHjykmPjJQEZ/+Db2HdxtqATIHReOQimf8xfq7WN73+VXeYI2r
 i4KkZEdRa999jPMCnFQ==
X-Proofpoint-GUID: hRBU4AU3C9qR4PVA-8rd4x1uNrzdRXmb
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDA1MyBTYWx0ZWRfX3/Yuz8LbUIk0
 PBZ8Ryxvti/mg+Y4cZfQIWJnHLimkyt7vB9J+wKaDVn8nz8waLalVItrJoVUAegfQRBoYLaw94m
 T7coFhAMfVtAKrWapHRKnNGad/HMiRE=
X-Authority-Analysis: v=2.4 cv=NeZzRGD4 c=1 sm=1 tr=0 ts=6ae9e2dc cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=Mb4fkPDSjR1CXLPVujoA:9 a=QEXdDO2ut3YA:10 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_02,2026-11-03_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0 priorityscore=1501
 adultscore=0 suspectscore=0 clxscore=1015 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611030053
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_053421_693707_89B48545 
X-CRM114-Status: GOOD (  16.14  )
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

GPIOD_FLAGS_BIT_NONEXCLUSIVE is deprecated and will be removed. The
preferred way of sharing of GPIO pins is relying on the GPIO shared
proxy provided by GPIOLIB. There are only two users of this driver in
upstream DT sources and both now select HAVE_SHARED_GPIOS so we can
safely drop the non-exclusive acquisition of dc-gpios.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/gpu/drm/tiny/panel-mipi-dbi.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/tiny/panel-mipi-dbi.c b/drivers/gpu/drm/tiny/panel-mipi-dbi.c
index 60cd65cae41d8d4f4f6e5fbc57d5d34058ca4d38..6f09b723cd7c352b0a1ea9f11a2e58052978cf0d 100644
--- a/drivers/gpu/drm/tiny/panel-mipi-dbi.c
+++ b/drivers/gpu/drm/tiny/panel-mipi-dbi.c
@@ -418,8 +418,7 @@ static int panel_mipi_dbi_spi_probe(struct spi_device *spi)
 	if (IS_ERR(dbi->reset))
 		return dev_err_probe(dev, PTR_ERR(dbi->reset), "Failed to get GPIO 'reset'\n");
 
-	/* Multiple panels can share the "dc" GPIO, but only if they are on the same SPI bus! */
-	dc = devm_gpiod_get_optional(dev, "dc", GPIOD_OUT_LOW | GPIOD_FLAGS_BIT_NONEXCLUSIVE);
+	dc = devm_gpiod_get_optional(dev, "dc", GPIOD_OUT_LOW);
 	if (IS_ERR(dc))
 		return dev_err_probe(dev, PTR_ERR(dc), "Failed to get GPIO 'dc'\n");
 

-- 
2.47.3


