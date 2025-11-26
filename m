Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEB9CD1118D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Nov 2025 17:40:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yuBdo4Df7AcVAGzqPD11S2PZNb+g82HKKFiS0s50Rho=; b=FiObraPHJ4ce+xqgXRp3nd3xFB
	8/Ma2hLMsXVe3O5ZH0rvOsJCNc6DHwBSP9kAyIvRzZ7GvIeQOLjn9tJZEzdmmd8c/h9j5uZmU/w7l
	9Hzb1l4+BNe9G9oD5Y+cLWfke5al1V8j5HBbPzSiQAjkX8LFfa5vHzh0ykBBluHL7Y/U98MXMnoaz
	5Vy442U8ICt9YgcwVUhhRYzVhumJtEhIQZYdKz2Xu4dGbXquYS4OWuKXZGPeZLnv1Wup1Cs4o5JfQ
	+8fKx2iVGx22T+JsHNnbJsDWxxuiQPbVTwkCUWn/SJ9z+kr3vm1xjctb7PlZHn3EuNZ/eX/KkVw9S
	h5AbHlrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOJVP-0000000FQuS-0iKA;
	Wed, 26 Nov 2025 17:40:39 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOJVK-0000000FQrb-3dNK
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 26 Nov 2025 17:40:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=yuBdo4Df7AcVAGzqPD11S2PZNb+g82HKKFiS0s50Rho=; b=Vo1eDcW6CXPNLwdL9Q3msfRugR
	BumKkoBoNhAkTp7NDCkaLpJy1Sp0lUfQ24bzKqNOZEYCOxP7dB+3VbmpViX2pAKg311/fLADuerVW
	k7L9nuYf1APhwb5yKRbjF7HVKctsJ/A9AgRS6UmgCp7udHrVmb1yJChF9ZAiop3WNtfIXHqcHLTXi
	EEYknQxzV8Xfno/EsaujVKKsKKX40lv5Unm3/3Rt/fHYCC6A/U5AM8G9mUKVVmOUKUulkmHGM8cGn
	zXxFoj6P+mO/qth850Q1uFJJoOnd1l6psWgWbAtVNyfaywl2DljTnqFF7G8ibsVi7/oNXTQDU8klq
	3Pwt8CBQ==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOIdh-00000008Wny-1Hr3
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Nov 2025 16:45:11 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AQ90ro94048890
	for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Nov 2025 17:40:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yuBdo4Df7AcVAGzqPD11S2PZNb+g82HKKFiS0s50Rho=; b=Cj8kss0czCvnTOtK
	Oijfre79MZ9wzUFjAdOBAzakqYgkLLwcaGA3Ep2OJL+tKIMH34zsRzpjosJgvcvY
	TwTN5BTLT6jwCyBVwS3esUlBJ150Xa5cHMnHlQ86QobLdE+UdwdPd+dXuh/RcIMK
	owSWi+pm6vT99vArbQoe/fFzd6+Qi5tY5w9CoPm6TpR6MBjt2JlFnH0iQ8PiDRg8
	RxEvos7ozO//9HvBlGk09Bb/4bVB2czq9GEsep/zmkaUZItAXhn2sjnOEhX99dlC
	CVArODyt50cMve0X4h4EYOS0R1mMOtnjl5om6uUcMtWzHFp9wQ+d3DWx9YFlkgKI
	KEvu8w==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4anp2njueh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Nov 2025 17:40:30 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8b225760181so845878085a.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Nov 2025 09:40:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764178829; x=1764783629; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yuBdo4Df7AcVAGzqPD11S2PZNb+g82HKKFiS0s50Rho=;
        b=aXkdg5AivMzjhDuH1xG3HmEAS+soSj1G7em5pkzuSONYPtHDczBx1OU1gu6v5DqEgb
         tVRVY9YKVr/PrghTeJJsTBN5ca73auVuX/TGZWrqAzvu8U+kizeW0iwb8a/6iIlBU1TQ
         8v5+7i19dP+4fDHzDfSDrjpX0PWlOtFmDPtCMWY8VF9Sc/v6QpZKb62iZDDtKzsxWFXl
         Z5ZXokYaYyN8wGZz4oaCVWM5OHtMiEEjUb1wENNdmcSTO9Hve7G91N5381CDr15PpHDN
         yKdQeSmSw9UWhLm79hABc8+wpUOM5I/UVtBRaqPFKZQ9KborkOtQhJpQU7WqPrpYwV+Y
         AD/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764178829; x=1764783629;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=yuBdo4Df7AcVAGzqPD11S2PZNb+g82HKKFiS0s50Rho=;
        b=Hkuo9VuxEqAhB3MdwkpUqduZg0VcTSjMiaNfVv9M6078JQEmmIO2TP3kUeB5Bi/+fK
         ldYv6H0vU6jX9syKH4H9URVph42OqyLTNz3B8dI4DRIT89aJe7fJEtLMwz4EQLTR3ZxX
         O3ExWv1LnBw7AObaqFa/ihCmFDHBPPivfhrzj1BTePV4Bwl8sMQ2xUah1ujRo+WNChQs
         AH1FsZVwPLOtACfMzR+Q0kv/irxdgRQDKxqrQtPFOGbAYhqmAi19+4y1zR+xMoTmoBAD
         fCsTpSQ5TLfOxNDYuqaWp7GzvMNhDriLwCdEUUuz1Jq9rwhGfCzp+150TTbKLwBrv8c+
         +9nQ==
X-Forwarded-Encrypted: i=1; AJvYcCVN4Qj+hDrC9P4ynTXUxYXnozCuIxjtIpGUFeOCOsl20uxeWEblv4CTrNdSwOQ/O8tdkrHhfuWUQ1xwjnuVAKCc@lists.infradead.org
X-Gm-Message-State: AOJu0Yz53UXitjkEjWd/GNonBnNnHGiq/4uTL6i8aaiLBnyCCrqux99A
	9gqkFzBsoQM31NtSLi46jOTqgijLYknFwarZv7Uccyg8y2M5pLqi/WFP1y4jsd4bBpXt6u0E7Oc
	m8zBM6+spMskVED+ZbnbIMsNZEL3ipEcWJNOduGg+tp+1t20WUpW/C/H6FWMC65q43y5qntf/RP
	v3MA==
X-Gm-Gg: ASbGncvsEz/zYQaM3osp7FVREyw2sw1sngWnpagTODUB89qWzcDsvGklXntMa8Izi2w
	Qpg3rWaz2jie+Or8RBzE8rFfjTCFw0xV6jO2Ivy/nG8Azr5Lau9zPfkcQ3oCL5Bu3uQmQ/ft6GJ
	deWk3NNtAu3q4wWGgCIlpalHIyCYOmIqNedoHIr0GrYMEBWyWwBP9Fl/qG5PXf0436H7ElLensQ
	QRmmirGoj4I6ufu7zXI5cMMId9enIr12gqYKwW2rFYsj5sy1trVHtUaSUfYbfoo6mI77HnzI6SN
	xSmj9NP7xenBEFB1go/DK/rhSJMdZADjHJagXkIIPd+LgdTEOVf1TU3i1gVYm+5oUX8kmGIsXSn
	Jkaj8+u4kQWUTKtnXwcmCgYqhS2cyZgscnw==
X-Received: by 2002:a05:620a:4085:b0:85d:aabb:47d4 with SMTP id af79cd13be357-8b4ebc438d4mr964586285a.6.1764178829110;
        Wed, 26 Nov 2025 09:40:29 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG417jnmNWXAWdIRUdmzeTUa3tigqlN4NwGpHVGLuGH+RAKsdxFm+oamJUZ2Qjvp//ID20XHA==
X-Received: by 2002:a05:620a:4085:b0:85d:aabb:47d4 with SMTP id af79cd13be357-8b4ebc438d4mr964582085a.6.1764178828589;
        Wed, 26 Nov 2025 09:40:28 -0800 (PST)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42cb7fd8e54sm43226430f8f.40.2025.11.26.09.40.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Nov 2025 09:40:27 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Wed, 26 Nov 2025 18:40:10 +0100
Subject: [PATCH v2 6/8] regulator: mt6358: Constify pointers to
 'regulator_desc' wrap struct
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251126-container-of-const-regulator-v2-6-7ad3408d6f29@oss.qualcomm.com>
References: <20251126-container-of-const-regulator-v2-0-7ad3408d6f29@oss.qualcomm.com>
In-Reply-To: <20251126-container-of-const-regulator-v2-0-7ad3408d6f29@oss.qualcomm.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Samuel Kayode <samkay014@gmail.com>,
        Matti Vaittinen <mazziesaccount@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, imx@lists.linux.dev,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=984;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=F6pa/hBnZb7Gkzh+tLhiX1+7lOKGS/rRVschNyVww/Y=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpJzt/In1RckvHlGVJEYfhwVdbZbbsAIGgtydc7
 BD2Swj1fa+JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaSc7fwAKCRDBN2bmhouD
 13fND/9pvcnMehA/jPpNTRYcpmfk9vKCGiew9Tj1EjZh1iFgSuHQz61oCY/3cku2nvA2KygTSJv
 dks9xOd4kSRomwUJ5Lw4b38aWjDVl3L4a1JC2STgffMgUcShdezfwua8SbYDDUqUTCcUdrnrTMS
 VqvDN/aX77y2U/nWvtMSMou11DGAAk9uOf9x/hOLPwCZHhNopxHNyFkABCqs1IiYGO/XKZOIHTt
 zko4CGv2e4ltSHtYwT3c4kA+ECtC7DBdAmxb2bJXlc1cONLCeNOs6855LpVXbholJBzmyexR5JI
 Pt+PoyIA94CptVwY5Et65kkiY+VS9E+45Fs/Wwlq40H+QvIXtg0zJ1bNL1UUyqDdQu7TyAwGMB0
 cW4JA3si3sz/Mv7uqb9ui+sm2q7SoEAo76rTGvEmBYrsb5UY8MqPD6er0AtiPKcrd6xZd3rWnLg
 23ecm6uDkbSrKyFZKr2Hgcq4LRRSism/TqnCKSGgFrfL2OwW5GsUVVijevacMry9emhgIyqrzZB
 WlCqZXeNI/IGl5j/d8veBNhmttzzrmBlijszFSN5Epw+mdViihypemE+JhC8sYqEMimZ2magKSo
 AJOfEY9Rro4TjyIineaslcIxixvSna5hlvu/mfWZJtQ/jEgGV6MzV5N+MVN6duxg+neqtONjzER
 eGV0zqMMcxVGXaQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Authority-Analysis: v=2.4 cv=KerfcAYD c=1 sm=1 tr=0 ts=69273b8e cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=Iax6wTeSMpqzYiZSKl48GQ==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=FqRRrX31zAmjg7hXLkcA:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: vQaHkcEA3pnQXppW6mx3nt3EvmUz4_PL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI2MDE0NCBTYWx0ZWRfXy9U0FxGEy47j
 w+IfdFGgkgGf7X0LwFBWNEEWdS/wy9uP/JBq39ABBiXBz49JZo8XqW7O0uEmxpL0WlvKS17NS3E
 rqsvQ6m15iYrjF6gCLZ5jwKrwmmSdJON8hZxo9BuEUM7Pdaz+jWA8c0aBfB6rGhNct4LGhg4+wl
 ejF6n/3jN6GPljtTERSkV/CXqfHkXY8zMKPxs0d/OetotlBCphanTyubnuZ6l65H950mPm4Nq18
 BpRptnOoO+voDCVSJjaNJ4ugsfOkZDD0GLdaaMVeoyi9Xw8sJILk8EYWIBNH00ViOHk/7eA0L56
 F2oPwXD5Z9wmKyLpMvgi2rAfyisrlQpVKGxWxQ+P/Be4xvlaUQozqP8yx94BM3Ai7kakhmR4GFS
 bo3m8Qx990m2A8NOzktWB0vkyUUCiQ==
X-Proofpoint-ORIG-GUID: vQaHkcEA3pnQXppW6mx3nt3EvmUz4_PL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 priorityscore=1501 spamscore=0 bulkscore=0
 lowpriorityscore=0 phishscore=0 suspectscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511260144
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251126_164509_718619_A128DF95 
X-CRM114-Status: GOOD (  15.80  )
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

Pointer to 'struct regulator_desc' is a pointer to const and the
wrapping structure (container) is not being modified, thus entire syntax
can be replaced to preferred and safer container_of_const().

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/regulator/mt6358-regulator.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/regulator/mt6358-regulator.c b/drivers/regulator/mt6358-regulator.c
index e4745f616cea..2604f674be49 100644
--- a/drivers/regulator/mt6358-regulator.c
+++ b/drivers/regulator/mt6358-regulator.c
@@ -31,7 +31,7 @@ struct mt6358_regulator_info {
 	u32 modeset_mask;
 };
 
-#define to_regulator_info(x) container_of((x), struct mt6358_regulator_info, desc)
+#define to_regulator_info(x) container_of_const((x), struct mt6358_regulator_info, desc)
 
 #define MT6358_BUCK(match, vreg, supply, min, max, step,	\
 		    vosel_mask, _da_vsel_reg, _da_vsel_mask,	\

-- 
2.48.1


