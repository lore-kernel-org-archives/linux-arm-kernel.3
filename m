Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 416CB606A333
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Nov 2026 14:46:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=RfZcbOXw;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=AMv+GR0T;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XNcfgfO1
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=/4QbgBs/c0TTeo2pDtbxLuBrO703ms5M2m6y5vvr+PA=; b=RfZcbOXw1z+SsmwYDVvdB8110k
	U4zIUX/pFgrsZdZH3wSVvVFrmFakhY96HRWe5iP7fmsa1YNay6KU4cjJ8pncSB8Id3PurxPwJ8ts0
	ERXgxwhQ5tdDya6PSzl8eQOPBvGHCCK+/nNHokwtCxUe6KTk+/AWAmbM2wkp/TaSnZhpklCokwJQL
	cTvwMSh0cRTK8+QRpHw+qMTFwvb9FPPoOPtcf1GLdmWXCC5p2i9W1qBLiFx03EDNC8z0ymE7J9ZLA
	zucXs85HwHfQCYW6fBcRHRQvf1QTFLHIMHcf8NWCgVljkNcS9hiKNZuwm8RdB8gKIG9UTKqEIbprB
	eutxENgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOcFz-00000005gHw-43L2;
	Wed, 04 Nov 2026 14:46:31 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOcFw-00000005gGt-0pYF
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Nov 2026 14:46:30 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A4BZsfE2284175
	for <linux-arm-kernel@lists.infradead.org>; Wed, 4 Nov 2026 14:46:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=/4QbgBs/c0TTeo2pDtbxLu
	BrO703ms5M2m6y5vvr+PA=; b=AMv+GR0TnUb97oyiyqdIN8lpHnOOw+83b5pJAc
	JoZqPs0Dq/QzjQoUiePj5mX0bX3rgS9/jUNWswXv/v6kQuyFYlQvZlAMKlOBlBVR
	p8flCZcQxo5xLrTccC1fQfrksG+cBPYLp0shgHcfQO26rGJBbzv99OojsGpCzwdV
	r+jv+zhmcpmiDh6Xxir7Gbu8WkAXWad3nP//L6YiVW2/SX9zBw32/my1XMvH389N
	W9VykiO0KlserBc9VTNF6gjrd/Ic4bdH2ScwzEzYT4Wdkl1571yd28DWiuhg1QxK
	Xhanbvt+UfPyaQeb4BQ08i3+WwDT+wKBocuaGrOQdVB+yJsw==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hr284s5f3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Nov 2026 14:46:27 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5eae356241fso223824e0c.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Nov 2026 06:46:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793803586; x=1794408386; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=/4QbgBs/c0TTeo2pDtbxLuBrO703ms5M2m6y5vvr+PA=;
        b=XNcfgfO1TQlNChYy4R45hpG6LB3AwaDukS6XWTOmY4URLu5w0N8MWIidCvVCnCYpRw
         cwHyAUYJ0PgxOPxKeJohWpu8NmdmJ3QAuG1noHfTXL40pmvoL3Px6gcKdaflyXnUQUlW
         FQkXwwoYR6xqPuhHsUjktSxZ5SC9GYElExyYQVYmZxRiLNjqVzU0sFxT1AyQPCjDxKuG
         4ha3AAGsPmv2+X/UhmmZP+1GX8YT6O0njIojQ8kWy7d9qAgbSJXUpL8n1rNpwdParb7D
         OExirLkJtLUSrYJacyzbm/oZ3V2uO7ua/Fft+GqIgTjtjYR/XkzE2v7nK5M1NtuIMTre
         XBRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793803586; x=1794408386;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=/4QbgBs/c0TTeo2pDtbxLuBrO703ms5M2m6y5vvr+PA=;
        b=nnmUeJhm/uYIC/1zsOGSZA87O4uUhPl9wz6K1hc/qzsrNARzcrlT33GNop4LRgwVS+
         7eMPOFGpSzmWnDw9wWGNg9EAEdXFFRvf2gxhDARRa/H6eG53TPKXyxpbg79S1H6Z39Kg
         238ZtNdAjnFJiVBUmGh6GP4Vg9pPcL3vXzRaqhptfsxZuvZbSdgiACNo7dN57CypU2yw
         VvPfaEf17qyLE6XKV9eIWR/uDX/nCANiHVO+njUdVKq8Goik2piL17yZBjkUS+BJhcJR
         z3lltZ3qCoEw7FbjUTp4Dij9wiO5CnclpjOUBkw+SO7SldHfremeXJ6TRnWLDNkU1qHF
         3u1w==
X-Forwarded-Encrypted: i=1; AKwUvBw6ALnUn94rXX9eXGZX2Gso/23NTOZ0RvuGLnqymiuPs4t9ex9Zia98d+920adatKHpTZaYxVYEO0jv6CUEYkke@lists.infradead.org
X-Gm-Message-State: APuU4Z9VqzY4Cu6IlCn3mi6TgdAwbXNuzRKf3gPa1EW3t3jiXdQymrG8
	a52hhj/fnv308pf0Zav6PWvpP9WIWPdFykr2Z5FbDb/ileFcOHOfjK2FisiXBVV3Ntn4gCpNQmR
	dLj6ln2cNySMqIYQoIhtjV2Q4zhrmgkAfHZc7OfIjN/D2hVu3UCS2qePhRQ408fpxS612Pzqc3G
	w/WQ==
X-Gm-Gg: AYBFou350bbMi8I7GLnxeDOnOnyVocxvX9YTtqERNZihh2sDnj0Jf9kFBNuHYQpEvOL
	p0cbNE1QIkEtV2IGJKL8H2GQhS1VTHvW6rQ0qyT50uj6IV+69zSOu+X7LZVL1bnnqygrEc5J7PT
	qb3+/KIdWVLA6l38V94f2Y46LcvOJeXJZ3ckvgS1l9Hte2FshYe9+oSegcL0B3LEGLc5QeWiZGg
	P4Btr/AORMITPyeMyABryVPOOzT75lJOTI2gru6A966jb8NmNY5yYVdaL0GGSdFkF3mOUyWz5wj
	GAdWyzMAD8YuvcwrENJ4EnJtvheIrsco7xGWFPeQYes9Fuq9JmcF/0UAHlLPmnLMahj8mtjG/VH
	U4ZiWznuD09x5pW33bISfT0GtB+JkCHKCK1HcERbzo+U+nIaTP1fDC/yh/tWbcItTSaxaTw==
X-Received: by 2002:a05:6122:1b82:b0:5ea:c084:6f19 with SMTP id 71dfb90a1353d-5ec688253ddmr6391689e0c.12.1793803586151;
        Wed, 04 Nov 2026 06:46:26 -0800 (PST)
X-Received: by 2002:a05:6122:1b82:b0:5ea:c084:6f19 with SMTP id 71dfb90a1353d-5ec688253ddmr6391628e0c.12.1793803585526;
        Wed, 04 Nov 2026 06:46:25 -0800 (PST)
Received: from [127.0.1.1] ([178.197.218.7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fed553116sm4194906f8f.42.2026.11.04.06.46.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 06:46:24 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Wed, 04 Nov 2026 15:46:20 +0100
Subject: [PATCH v5] ARM/arm64: defconfig: Drop redundant Qualcomm
 interconnect entries
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261104-interconnect-qcom-clean-arm64-v5-1-395baa0c0bdd@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/43Oy27DIBAF0F+JWJcIhodNV/2PKgsek4YqhgYcK
 1Xkfy9OF940cjcjXenOmbmTiiViJa+7Oyk4xRpzakG97Ig/2fSBNIaWCTDQTEJPYxqx+JwS+pF
 efB6oP6NN1JZBS2rRB2s5KsEdacZXwWO8Pfz3w2+uV/fZdhd0aZxiHXP5fjww8aX331sTp4yid
 l4cu15AcG+51v3las+tOezbIMvJCVZUcbWFQkNtQHS+E8ro8AQVK9oB20JFQ40E7BE7dME+QeW
 KGi63UNlQ5cAz1NaA+Qud5/kH5pZp+eIBAAA=
X-Change-ID: 20260428-interconnect-qcom-clean-arm64-aecdaa1e531b
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3712;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=tgc5oYY7RgZCSYGAvdoJW0IQ9Q4bRrF4qkJ4QRoOlSI=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBq60U/VlCr4Vvfz0y+8WKIa98Rh6Qke5D4vneXc
 Pz9yUs+fB2JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCautFPwAKCRDBN2bmhouD
 12VAD/0WF+pAz2t1TjvxbHvL5Z3A1503H7KbTgiDdEv30JFilHv5EuLhvlgliIPNEVqWU3m2vlj
 V+4TGlX91TnE+1Wdc8txA0Vs5BEobr+dit0eQSFqWxOP1aGhQ2HO8est8MQ7C7QlLROKj5wtlo1
 x+AVukxjgXCyBrbhcUUbnb07UH7gzvp+TBygn1furpcwnfIx27CK2y/tN7mXVV91Na3vnvoBLlA
 IeVFHTyU9sGexShtVv3GM1T3WQuY/i4wWqQ1u2uiXPTLfYnJR+bXd7jXZotaXa4q/ALRdM0jCGL
 K5qo59/xsweGBOzu96+4xGd6oJ8TGPlmgk/BYxBZKqm2L8gX9Qp7kOw2GbL07/FSrtEb2pJdQY9
 abILLcE+nn6fJdDEFBdKMBxaOvSBhsEcVMLmjpknj92FJHBo3mM4prOg6kvWKmEId+d+pRpeCDD
 FLeUt2nVFHjwrE8zei2cCwLEwCODHrzyyJyZlA0AdXIgfpF2W9yPb8xliOE8Onva/gem00KJQGs
 jnXvX4o5KQmPwbxLsKfKU4RxHn6HFfkhPxo6u0B3w6VtHNdfEFnHothw4RanGxbDXFN7kqZg2Ck
 FOKfKLGVLOweMJO0QgTIAfmobApZuoAMrcDpHrJ1Rpu20ekxAawQyYoEmcRxNalGrEwYuDBkhBZ
 Lcf7loGAH8cxhjA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Authority-Analysis: v=2.4 cv=JdQpPkKV c=1 sm=1 tr=0 ts=6aeb4543 cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=uyPgTw0bjBTS2cVxpiNm5w==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=b2TuYX_1WW3iVv7oIL4A:9 a=QEXdDO2ut3YA:10
 a=XD7yVLdPMpWraOa8Un9W:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-ORIG-GUID: rz0RfjUi7P5mnRqQMnxCaz8iMfMd_Rml
X-Proofpoint-GUID: rz0RfjUi7P5mnRqQMnxCaz8iMfMd_Rml
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDA1OCBTYWx0ZWRfX0QeA7zIoghp4
 sRFo4HdzgyljMzqAjXnZBdspDBReTTaddDYimJ0sBMaHbWAY2s8QITIOFBnBV/162GNtSABTlOP
 03ixrfU5+6mvfLjE0d0UYCbX8WrGrWhwHso3Oo6VTGkyl4BgzBMCTp+O7tuBDocS75aqKdzNbNn
 omUBWveXcriq3SON4Xcv29G4KMHVW68wWiw4mAn54CAWSrvT/7TzgVLU6V8brd5EL98DjnBtIV9
 rWx+o6639tNHsiuFV40E0Bab5QEi9oY8uQB2KBYkivL0AwCtps82eQVHNZD1YA0eRCdthiuVLHI
 +l2jxx+kpvvBo0mAl32tGtsZ/CP/zlbyfzvGQapQDoty8w5brLYf/WqOw4KkwFpcqA/TINUcT0k
 DRzFGiWgy+Yw91/ETIpsNYWEcpIbNPtrZyn1QUDZ4uQeKNMhM/NqCh1IlOFPGSW8hBzF9ZmexIQ
 dYNPveybRsstmRUMtCw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDA1OCBTYWx0ZWRfXzckEV1jwAd8x
 NryuoxlcTO0XPccvSkEeHVSdyHTVBmcmLJ+cwyO1HivRrQFnHJj+IEG1MQ3kwQQ9ADDWgRMZI3S
 ed+CsM03Oeavzsk6LigL2GgCTOMcH4M=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_04,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 impostorscore=0 spamscore=0
 priorityscore=1501 bulkscore=0 suspectscore=0 adultscore=0 clxscore=1015
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611040058
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261104_064628_379638_E360530E 
X-CRM114-Status: GOOD (  13.23  )
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

Drop all drivers from defconfig which have defaults in Kconfig.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
This can be applied, all other patches were picked up.

Changes in v5:
- Drop all interconnect patches which were applied
- Link to v4: https://patch.msgid.link/20260914-interconnect-qcom-clean-arm64-v4-0-5b2c0e6a929a@oss.qualcomm.com

Changes in v4:
- Add also Shikra since this was waiting so long that other drivers got
  merged in between!
- Split out defconfig update.
- Link to v3: https://patch.msgid.link/20260720-interconnect-qcom-clean-arm64-v3-0-942e8ee7ebda@oss.qualcomm.com

Changes in v3:
- Update also Nord and Hawi
- Split defconfig to separate patch #3.
- Add new patch #2 for arm64 dependency for Hawi, Nord, Shikra and Maili.
- Link to v2: https://patch.msgid.link/20260515-interconnect-qcom-clean-arm64-v2-0-adeebc73596d@oss.qualcomm.com

Changes in v2:
- Patch #3: Switch to built-in for everything, with explanation in
  commit msg.
- Tags
- Link to v1: https://patch.msgid.link/20260428-interconnect-qcom-clean-arm64-v1-0-e6bc3f7832db@oss.qualcomm.com

Similarly to clocks and pinctrl, interconnects should not be a user
visible choice.

Best regards,
Krzysztof
---
 arch/arm/configs/qcom_defconfig |  3 ---
 arch/arm64/configs/defconfig    | 31 -------------------------------
 2 files changed, 34 deletions(-)

diff --git a/arch/arm/configs/qcom_defconfig b/arch/arm/configs/qcom_defconfig
index cc93a32342af..8e3278ec2d21 100644
--- a/arch/arm/configs/qcom_defconfig
+++ b/arch/arm/configs/qcom_defconfig
@@ -258,9 +258,6 @@ CONFIG_PHY_QCOM_USB_SNPS_FEMTO_V2=y
 CONFIG_PHY_QCOM_USB_HSIC=y
 CONFIG_NVMEM_QCOM_QFPROM=y
 CONFIG_INTERCONNECT=y
-CONFIG_INTERCONNECT_QCOM=y
-CONFIG_INTERCONNECT_QCOM_MSM8974=m
-CONFIG_INTERCONNECT_QCOM_SDX55=m
 CONFIG_EXT2_FS=y
 CONFIG_EXT2_FS_XATTR=y
 CONFIG_EXT4_FS=y
diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 7b4985b29b21..df780e5ca99e 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1764,37 +1764,6 @@ CONFIG_INTERCONNECT_IMX8MM=m
 CONFIG_INTERCONNECT_IMX8MN=m
 CONFIG_INTERCONNECT_IMX8MQ=m
 CONFIG_INTERCONNECT_IMX8MP=y
-CONFIG_INTERCONNECT_QCOM=y
-CONFIG_INTERCONNECT_QCOM_ELIZA=y
-CONFIG_INTERCONNECT_QCOM_GLYMUR=y
-CONFIG_INTERCONNECT_QCOM_KAANAPALI=y
-CONFIG_INTERCONNECT_QCOM_MSM8916=m
-CONFIG_INTERCONNECT_QCOM_MSM8953=y
-CONFIG_INTERCONNECT_QCOM_MSM8996=y
-CONFIG_INTERCONNECT_QCOM_OSM_L3=m
-CONFIG_INTERCONNECT_QCOM_QCM2290=y
-CONFIG_INTERCONNECT_QCOM_QCS404=m
-CONFIG_INTERCONNECT_QCOM_QCS615=y
-CONFIG_INTERCONNECT_QCOM_QCS8300=y
-CONFIG_INTERCONNECT_QCOM_QDU1000=y
-CONFIG_INTERCONNECT_QCOM_SA8775P=y
-CONFIG_INTERCONNECT_QCOM_SC7180=y
-CONFIG_INTERCONNECT_QCOM_SC7280=y
-CONFIG_INTERCONNECT_QCOM_SC8180X=y
-CONFIG_INTERCONNECT_QCOM_SC8280XP=y
-CONFIG_INTERCONNECT_QCOM_SDM845=y
-CONFIG_INTERCONNECT_QCOM_SDX75=y
-CONFIG_INTERCONNECT_QCOM_SM6115=y
-CONFIG_INTERCONNECT_QCOM_SM6350=y
-CONFIG_INTERCONNECT_QCOM_MILOS=y
-CONFIG_INTERCONNECT_QCOM_SM8150=y
-CONFIG_INTERCONNECT_QCOM_SM8250=y
-CONFIG_INTERCONNECT_QCOM_SM8350=y
-CONFIG_INTERCONNECT_QCOM_SM8450=y
-CONFIG_INTERCONNECT_QCOM_SM8550=y
-CONFIG_INTERCONNECT_QCOM_SM8650=y
-CONFIG_INTERCONNECT_QCOM_SM8750=y
-CONFIG_INTERCONNECT_QCOM_X1E80100=y
 CONFIG_COUNTER=m
 CONFIG_RZ_MTU3_CNT=m
 CONFIG_STM32_TIMER_CNT=m

---
base-commit: b0c953dba88a3412a700058817f08e7b5de4c338
change-id: 20260428-interconnect-qcom-clean-arm64-aecdaa1e531b

Best regards,
--  
Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>


