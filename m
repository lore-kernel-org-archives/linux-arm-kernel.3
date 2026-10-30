Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20B0C606A33F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Oct 2026 09:41:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Cdt2KNht;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=m/07jegu;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Zysn61no
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=604WWfBFOPhhAYv1Yn4g0E2jTeoJJdDuMRYpyyPIRkA=; b=Cdt2KNhtcQTF7d
	u4IUNxWVuQvO7LHf6+aLZZMt8rkuFaFwcAHjikoG7ZUbQGKx/CXY0S0thVJcF2k10B99TRnPykjfi
	gYAcrhbQKdBUzXU4G0DmyvMYECsJhZ1e6dY12NA42VJ4caTpPHLJA43/vlGoYe5qteWfxYA4Q4ti/
	G656LS+2UB8ds6lquWuobWc5gLRutc3vCJxL11cLN6yIzBbRB/9YEEEHX9lYQ8zfAXUdcI3s2Bi7/
	ugPUKdpvm1YnWUJqkseH7Xc/N0xj+9gUIxd1+Fqilo4GQ7J6yeYVZFV6KK6xb9kl92VURa0ZFLFhE
	NeLR/MEDSL5AecNSMCkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMj6a-0000000BGRY-3MyS;
	Fri, 30 Oct 2026 09:41:00 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMj6I-0000000BGEP-2hgw
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 Oct 2026 09:40:44 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69U8F1QM1120516
	for <linux-arm-kernel@lists.infradead.org>; Fri, 30 Oct 2026 09:40:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	604WWfBFOPhhAYv1Yn4g0E2jTeoJJdDuMRYpyyPIRkA=; b=m/07jeguMeUQJOhu
	wjJcd5PtT0pzOD0sTs4QZ7RAzgNPdFaUxQZHR3Lec8VLWVYcuZJYF//oD+YEisBF
	miGuoCCcUv2kVP+K5SF5iUu0CSGMGLqCShK1HwYXEKxP9WqBSbX33g7HP7LMKv2R
	UprtO1YpuFrIYX8D15EBuPjA3dYeC2Wcd+cN1O8ryBJ4X+WnZ5P6W5uZiyk565Bg
	VVtI+pySXNyDP9g8fSlVyaP2qKGgdH5SipYmLlRXK76ytssVoZISV2bjjXam3I4z
	LVXiDatkFLsOrhSyaZK1C5znsSKJdI1bfiIrAfW58pBGJw5a2B4akFfrLmdsm7z/
	rCkuww==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hme6pj8js-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 30 Oct 2026 09:40:42 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-35cbea41088so802989eec.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 30 Oct 2026 02:40:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793353241; x=1793958041; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=604WWfBFOPhhAYv1Yn4g0E2jTeoJJdDuMRYpyyPIRkA=;
        b=Zysn61noedWzBm2O7YaWuGD83kRI4Fyg/B3xbHfYa7HJ2JvMNjLZzZYklYnlRurUzL
         jzNHUgTZBHMjvsjRVKLiUDZv1BwQ0JaTxDHz0YegQUduWsCfXN4kYwArQeiOOyedcYFH
         ipQGhfcXwWs37vXOuaPyv55xJ7I+Wl3CMz3P0upfq3J1yv/k8Ec8slsP0oD9ZQ9qA6DS
         K81eMGTNmCFSm/VahZTcu1zEZT6jFF0WPUJ1Tdbs8xTob9yDL1fzdeU2yTVew8oLXLkA
         FMAd3ZEPaL38gc1UUNKEZd195d5krtYpCHvbWJ7uxBzOKeF1Dadbe9r1FuKlUKUxnU/Z
         mbaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793353241; x=1793958041;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=604WWfBFOPhhAYv1Yn4g0E2jTeoJJdDuMRYpyyPIRkA=;
        b=AVSUKq/1z7Ti3+2u1WKnG/rjmysiS5lAfc9PzpbKCPO0jMluNau/adbC2a7QHkBXwa
         UvX0KSlSlEj0HR2D1LlOBew0FHDzg8SCKAp7enAouKSav8XWWXyFL/kcMfx1N8QhrSdP
         fBIHAx9cPeh2hpmh9y1qmwncl93DH+/nRwyU9I80fa/wGBE6xbUTeY9TbJZaNrSuCHAa
         nI51u34qwy98dPDkFBhl0EfNQu4B3UrMf2BRXpRl6eotQyzwp8SXh1+kB9h+dD7kYtkb
         +RNnQXkgBOfn443xOKn4L0uu4NM52duLNhlAU6h4sBf4pxYZCOlQx9oEuUekgujmY4ee
         A4JA==
X-Forwarded-Encrypted: i=1; AKwUvBy6gkjpb8wVsYDZc4joveYR5BgyCySNnChKn78hfyXpf/7VrcqnAN7j+b5uZllBuuwh/4fLl3r1Z0ar8WZmm541@lists.infradead.org
X-Gm-Message-State: AFq9FYIAmRg1Snf5mjrjhBSZdr4YiLB7IR5oiZWi0/KDY5apeULyWxLZ
	LhaU7NDk98cG3aACEDV0foF2330Mw07AVYjPNc9lkb0ZEbKE7XNugu6WZFYS1AlCyOykrCsTUJw
	Uzty7ZCyyB7F9oBwICtemF4H1sfqTH8PiO7599uPM3SrRcPytMLdl04xyx3rOXSpK6tzyg2TsNz
	pElQ==
X-Gm-Gg: AYBFou1QCF6dzMD7njGuDEN5jqFRiPxWM2VBmR9RZ67+tx1VPoahFQT5y9bV38DAx9V
	o9Q2o6/DFXsOORl6hYWbLcSkWPpRr8f4Gg9lST6+ffIG0fvviu1wYsVMAxPFWEBoqbwchv3uZ/1
	3ENrqN9ZdMDoqqQDczoMIaWbJg8Pbi0vM/Eki2zL+UPCiFE/Znm10QxlpJWDKv8zK1Th6LyNfgb
	YRT5JHXAzcbfjDFJiqrAPtf759Qb99q1OsGaRzOIkGcuYl+9sMjKS44eTvFbOyXbZCfLFdV5VnW
	/irlW81CMVhkv58UUaYHlkcxQL4MS9uZZoNob7dylgyZ+LSeFyeIMgMyV/HHFQ98g0Z1kcDYMhD
	cdTAOoASQbdiHdlUpFcshAzSAnIYNnZm9TwFW30DWLYKYypv8MpeULKBbGzQkl+D67lwH0bfGiV
	eUJ8Ch
X-Received: by 2002:a05:701b:4211:10b0:1a7:99b9:2eb9 with SMTP id a92af1059eb24-1ac5de4e8a1mr2459714c88.27.1793353241193;
        Fri, 30 Oct 2026 02:40:41 -0700 (PDT)
X-Received: by 2002:a05:701b:4211:10b0:1a7:99b9:2eb9 with SMTP id a92af1059eb24-1ac5de4e8a1mr2459671c88.27.1793353240473;
        Fri, 30 Oct 2026 02:40:40 -0700 (PDT)
Received: from hu-anantiwa-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac193b8179sm6723418c88.11.2026.10.30.02.40.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 02:40:40 -0700 (PDT)
From: Anand Tiwari <anand.tiwari@oss.qualcomm.com>
Date: Fri, 30 Oct 2026 15:10:09 +0530
Subject: [PATCH v2 5/6] arm64: defconfig: Enable PWM_CLK for backlight PWM
 support
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261030-lyra-display-upstream-post-v2-5-906302159392@oss.qualcomm.com>
References: <20261030-lyra-display-upstream-post-v2-0-906302159392@oss.qualcomm.com>
In-Reply-To: <20261030-lyra-display-upstream-post-v2-0-906302159392@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org,
        Anand Tiwari <anand.tiwari@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793353209; l=683;
 i=anand.tiwari@oss.qualcomm.com; s=20260717; h=from:subject:message-id;
 bh=ibeQtMqFX8c7zgjBUXuxtpUpCw4tiu7UXa9CVvzuzQ8=;
 b=xZy1v3yJxpgEEnp/0GEy3IHTrAvHzXOiPECRrvHRncpdH0z6F+MunUlikP1iD2jLtS9DagvwY
 RSOxQJSEq43C/5Lz/ujnztCihDlXO3zxZKaItM1K/qYup5YQQr+y0sX
X-Developer-Key: i=anand.tiwari@oss.qualcomm.com; a=ed25519;
 pk=ygURjl6LxwG8EhgPNHYYgCZLsaXFgWZZoHRRyud5B40=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDAzOCBTYWx0ZWRfXzaEILoHijOin
 lf9IOCALXIzAqRkLJslAXrYcAr6CNd9nRaBy8/SvpdPXHOJbQyTfxPC7lrGUhgzBTKUXw8z1v3J
 7UE7tgf+hj6Ngg/cw4G06rNXnMVqf8vZSlGdb7VzMZmhTC7rEVzMtRCZBM2CdbJNvLhm5ZyUZ+8
 MR4wFeTYxjZ+ythI8pyMhV4ZyVBIrkuj4cjwBKLVriOU5ldeEhFfPQfU4vbbzkoYPY+6uXPVeCT
 Sf6a1SRQ5I9RX9naO4SVIWIANEqe6mSZqiChCycG1tRIqMRl1oA6j7kDzgaf+ESdSm9JvuvVwy+
 vdavjgWUj96DtPeAsQ1PxycaL9L1siJyuW06PS2dUKU1YTpfAOm+4NFOgxx4b3V3jObU4mBvxKf
 yeWF9v3TyxhweYsiV/SKz3oJZAWxn8qvOEIaB481N0vCxBQ8XUvgJthEbhkHhfUEqLOmdwQPAJM
 jB2Jl+Plqlbd4CTR8Xg==
X-Proofpoint-ORIG-GUID: wbyDFhqM_caMCLogh9lsgSPUZJSsfx5D
X-Proofpoint-GUID: wbyDFhqM_caMCLogh9lsgSPUZJSsfx5D
X-Authority-Analysis: v=2.4 cv=AJ83otAg c=1 sm=1 tr=0 ts=6ae4661a cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=FxRAHWTHE1z7yW8SwP0A:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDAzOCBTYWx0ZWRfX06p67Hl6oQ08
 aJR26tmBztpIQzxnkp6vpk+iRVPAZkC2e1kjjU49UqYbDbPY5e67QIZQXeJAMBPgXREd9uYn+jl
 mhJQy/Yo9KjuPXAuYmPEALgKQishuRQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 bulkscore=0 phishscore=0 malwarescore=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610300038
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261030_024042_683261_BCA7B28D 
X-CRM114-Status: GOOD (  12.79  )
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

Enable CONFIG_PWM_CLK so the generic clock-based PWM driver is
available, used by the Qualcomm Talos Lyra EVK LVDS panel overlay
backlight.

Signed-off-by: Anand Tiwari <anand.tiwari@oss.qualcomm.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 50d6357727af..365a69470d13 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1620,6 +1620,7 @@ CONFIG_PWM_ADP5585=m
 CONFIG_PWM_APPLE=m
 CONFIG_PWM_BCM2835=m
 CONFIG_PWM_BRCMSTB=m
+CONFIG_PWM_CLK=m
 CONFIG_PWM_CROS_EC=m
 CONFIG_PWM_IMX27=m
 CONFIG_PWM_MEDIATEK=m

-- 
2.55.0


