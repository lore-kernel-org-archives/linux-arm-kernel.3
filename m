Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FFF3606A324
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  1 Nov 2026 19:17:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=2Z3tn/Kr;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Lj/u2+tg;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DUFFok2K
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=UOs1j22LjLE1SIXla0/ZeRPDc93Djkkb3vt/+irTwsM=; b=2Z3tn/Kr/SAU2N
	OMZCs7oO0RXKi/882JFfTrUL8XFo1w4cLDyLNNa2E8yS9zz8B0r8a2I8GvIDJlbMwlsghS/Lv1yRq
	902kF2miOXEQWSJeV1RiaLz0DSueHgodesobRFvUbtVQHAiYDAr81mjq2PEu5wHfC2F9fbTYFAa88
	isxoUcU7mlwkcX7CkGbU5ZEbEhlvU5UoDfGqoCfISmOZiqQLUVjAGxyAEHhByIiIiIxLkquf9exnB
	0dsf2dSoJ4yFye24TKpCxJR4SLUPREHMqheyYx7i2xrLfTK/JLoFz9ORtVOHb/bdmIxqnr7AxkAMB
	AQCEjYJdxN39ui2g9yUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNb36-0000000Eo2I-0ceI;
	Sun, 01 Nov 2026 19:17:00 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNb33-0000000Eo1p-0FLU
	for linux-arm-kernel@lists.infradead.org;
	Sun, 01 Nov 2026 19:16:58 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A1HQfqu889461
	for <linux-arm-kernel@lists.infradead.org>; Sun, 1 Nov 2026 19:16:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=UOs1j22LjLE
	1SIXla0/ZeRPDc93Djkkb3vt/+irTwsM=; b=Lj/u2+tgp0cEoJGTBhM2RPfzUbd
	ZdX1QbQH2xav3dUclBCjHtSqspvB31kN3ImJf/6GK/s7QWBIIPIPaQF2yi0T0rh6
	v90h9lDTJp2Z+UjPqCH6hQZi5hGm6/217zhNPn1a7UtWNURuF+O7UkMqQ3j43fuw
	69qaPPf6VcvCs78nyhhe2QIVeSk4ff2uH26zSl5sdUJmTjQoqvXVu4GuyiZNt7ha
	qTqFVWGaevtnibDyl6/hO6DizgJtS/PkudXSS9t0kiBO3gDvONPABPrqJT1CqLO3
	p0Ba0ciC1z7s7/spva0JueoylYMMx7z+6PK+jUevJZPTvU5Y532pBBbrVWg==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn93ekvv1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sun, 01 Nov 2026 19:16:56 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5eabedcf97fso358238e0c.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 01 Nov 2026 11:16:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793560615; x=1794165415; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UOs1j22LjLE1SIXla0/ZeRPDc93Djkkb3vt/+irTwsM=;
        b=DUFFok2KtQLselwX8gdYhNfoAMbbPTaTTp3CtH0Z5dkSG6M93/Wy2WgzskfACNrIoq
         j8+Bk3Xt5zzfWZLHM4jeYHJwuTpc7jKpLBvUcvNJbzy8CIJJ68pL/S2C7hG5Bo1Vs02B
         SO4xp51J5c9GFoKg+TPlatDENRshrgOaQ9H24h0dWhfVamAJpGcV7uomJd5Y5ljc2Vjx
         LDnPvwhBtLHEfLuCz5UIW0uNHhd0aBN4CGS118pSQPWPSVqaO5j6YhJQaZ1uW66aKbal
         1my3RqMNBMdpEdJZ4CZgAKi2zSYpcV6trS9hDZ/VDewkNm87EkWwiQKlCLNnSABmFq5Z
         CZ0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793560615; x=1794165415;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=UOs1j22LjLE1SIXla0/ZeRPDc93Djkkb3vt/+irTwsM=;
        b=EQ+uHoeEdQGD3u4HAJL+O0hj3kzunaWgM8hSSm4ZCB2kpgTS9hK0vjIdmbBt2zeAPE
         YIiMihAYytDE9ZW3HgX6aSyCNvFd6LrUO+/OuNb4cAZ6lvxqGwh1pek9Fn3ofsQcNOS0
         dXshAEJcwqP5N/mdUVrVKH51WNaBDKz9ONe8OZly5EffxrcbuJGPrvFsB+zQsqctD9Us
         f1Y6CCaAPnleN3xFQgr8L9tn1VEZje31kvqxVCKEyVG3kWBQ4ve5f30CqLODzEt7eIp2
         vH2j2hLmKQZ4xDSaGwuQCraSXjuxPTM0cO672elsYuLymHERtGRqKgg5TR4JTK7xh2vS
         M85A==
X-Forwarded-Encrypted: i=1; AKwUvBy5TszaP5cAwGewP4BqbQUVaS39fFA87Iz7StMLdI7vDifGQAAA+CoVOiRyGhxJSKt04paGapU4l6rgT87uy0qT@lists.infradead.org
X-Gm-Message-State: APuU4Z8sKqX+24erjrTcBkcflNwrXXOr843EOlWZdT8IQssqn9dWPgEu
	vZMc0ce67FBVqyiyWPI+q/ChqNyMUzmknNIiWm4NvAjmpL+khLmV8PWw1Oj9xGYZGm6D1jwFfaE
	Le4TXzaT1P+AiKKbwJAZPxF8b6OdHLljQz8e9uIDwqOfoKTeau5TSTW+qlJwChNkdVGIicWnlnq
	86Kw==
X-Gm-Gg: AYBFou373p57y5gVgmBAuws8wIXtphNyCMTXI5sy3f70tTMX/DW2FekxO4cJnT1p2qs
	V2l+jt5qRRsOtKvnMEIWluGhFdf1BPC0PRzvG+7OvCPubfK2GbIiLnEY32P0KFO3JYyAOepGiZG
	FEgT9FAGlgkLui/xeXsiDyWRLaw3VN2sGR+2q+o508XMv8WzCVS3PYKEzR8oCvflN+J0Xz2mXWK
	/pTQffIuUjXy0YaXnFVW/9Wa1HcWGrUGd6ofmNy2tymw6Q8HUaEtnAMbBvCszPT+K/eYr8p+trS
	CuARIBdvhniyOtnRxJ1RQksVw8r0GOmoNiDxifDMkYQb73yaA2OSBV/s3h0pG9ts7ricedzmwTA
	ontCQqFTdKkcJDICZK3rx6sMrirkdQvrpPbE8Pj4GcfrkrqZEUzZsRDRyhkvZxg==
X-Received: by 2002:a05:6102:524a:b0:7cc:1ace:fd11 with SMTP id ada2fe7eead31-7d0726359b5mr2913453137.8.1793560615066;
        Sun, 01 Nov 2026 11:16:55 -0800 (PST)
X-Received: by 2002:a05:6102:524a:b0:7cc:1ace:fd11 with SMTP id ada2fe7eead31-7d0726359b5mr2913435137.8.1793560614547;
        Sun, 01 Nov 2026 11:16:54 -0800 (PST)
Received: from quoll ([178.197.218.7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71a4d3f9sm17168223f8f.4.2026.11.01.11.16.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 11:16:53 -0800 (PST)
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
        stable@vger.kernel.org, Sashiko <sashiko-bot@kernel.org>
Subject: [PATCH v2] soc: qcom: apr: Reject packets with header size larger than packet size
Date: Sun,  1 Nov 2026 20:07:35 +0100
Message-ID: <20261101190733.121473-4-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261101190733.121473-3-krzysztof.kozlowski@oss.qualcomm.com>
References: <20261101190733.121473-3-krzysztof.kozlowski@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2069; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=kJg/rvfiN7UDl3v4JnVjo0T2/XuVJN1WlSd/w2seENE=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBq5436kMlPdugyAQucba+rGuml7G8LnGlzYcMDi
 r4C/KyVAy+JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaueN+gAKCRDBN2bmhouD
 15SKD/9rfYsZQDHFYT5ukKYAd98y0gH0XOt/ww0qCH7VHPI2mp+aO43S7bAAR9v2TZQMN9tZvaN
 co6HZNn83E4znnaaNg/VZOPQxHhCVPJXaECLpRQrSXNMY7WjtUZXqTPI4jEh7E6szRxHSjnmXAv
 s2ZfruTWiVVLTP8U2Vhnzm77fOCbgwSiLo00BgWXyZ7s+7oIRT4A+E6xXaFb0d4APn6pE68CvI/
 XYhX+5XPv/V5Urs4iA+8QloZYddAXx6VwwCA009u8ksU8lgWVbMS0bc194nLIzfAxvggB69IDQ1
 m46Ji4vqediUExfubRsPPpEi+lHkQnquo2FAockRKUyKLbsb5+j5+czLQaj4GKFl0wIoiOCdBmD
 n957wW1OyUvoXuVtH80dFF4PyOpOxSGfTkGaBp/UfLKgYe40k/j+piY0reZjaQgT7FC4786AFRB
 YW9pptUes2+3a3J/BI2k1J90Xf6K3LJCbvmRwFDxGuhE0k2hQZog7xa6xlhr7mmmn5i8s11hRW8
 nQn3v/wC+6w8BXQU8prrKv0l5Tc8nYqeFwmUfqgWDKkX3Ehw2yP+m7s6zIBEznYHV12uqPTaIj9
 5j8/M2Cs7jkxmWliJG5JOIeg5UwpUMhNB0P0youYObuv3hpKMiAEjhxJXrNB4IE87U6puXTtaQD uT9sTflUQQlTrRA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAxMDA3NiBTYWx0ZWRfXxlMz8//BZNgG
 tUe0Z3t51WfhbZ1in+ER6AMpdGM2H9qGSEiBNFLU7T9+ANPKFPG7Z2aO20leyyLFfOCGSeg486S
 f7ihj0K+FBEFyppFbmTwqxtaSvwMDfXN/q23shuqJVXmbpVk2mP4n51wCnj5cD5tH+o5ZLEXMsY
 kjMS22mhu1DuecnJUxhLPvfhjxtP1rkyeNl3C1p6ExQGjuvdpGBaO95b4mrGZYp1t/O/QGqqQA/
 2LCVbzmGLKmztur39kDejIe6O0co6Eue3XVIALcfQsYH6crrybROhEu7OrmCu5SnK6vaqGGnKOk
 uHg4sSCoDSPpvjvFBLT6iNME+mGNAEc+KIQdTARK2rXXsGwptQBVRI5uoj3ppHpEm7weqCRxNkc
 YHaMBqm40DZPHnKErKdkaI0Eh9VJTpBiVZCUISUJ8Ynw1IVum29XodFvYWkPat32I3GOPxDxkEp
 lq++3S6XOPLdr4Q+sqA==
X-Authority-Analysis: v=2.4 cv=FciiV5+6 c=1 sm=1 tr=0 ts=6ae79028 cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=uyPgTw0bjBTS2cVxpiNm5w==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=c92rfblmAAAA:8
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=fiEMaWzmfHqX7dR_b_IA:9
 a=vmgOmaN-Xu0dpDh8OwbV:22 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-ORIG-GUID: nciu6wPgYkCKiAyPlMiq_7BiOHZ_MC6r
X-Proofpoint-GUID: nciu6wPgYkCKiAyPlMiq_7BiOHZ_MC6r
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAxMDA3NiBTYWx0ZWRfX3gRbPs41Xpry
 Ee16JyMQ2zYom7ic9n+E9qxajpPbFsOxe6uZmvmrIXoMgL2q5x6xigkE4DwVlzovsoFXwVJk9P5
 4QW4siy40deDH50nnk901PqBkCLTFdQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-01_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 impostorscore=0 suspectscore=0 malwarescore=0
 lowpriorityscore=0 priorityscore=1501 phishscore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611010076
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261101_111657_099543_1E1C8A22 
X-CRM114-Status: GOOD (  16.46  )
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

apr_do_rx_callback() and gpr_do_rx_callback() validate the header size
and the packet size separately, but never check that the header fits
within the packet.  Both sizes are u16, so with a malformed packet where
the header size exceeds the packet size, the subtraction computing
resp.payload_size gets promoted to int and becomes negative.

Further check "resp.payload_size > 0" would fail, leading to
resp.payload left uninitialized (stack value).  Reject such packets as
having a wrong packet size, although unlikely that firmware would
produce such packets.

Fixes: 6adba21eb434 ("soc: qcom: Add APR bus driver")
Fixes: ec1471a898cc ("soc: qcom: apr: Add GPR support")
Cc: stable@vger.kernel.org
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://sashiko.dev/#/bug/linux-82d40745-1593-4c20-8432-d86099836525
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

Changes in v2:
1. Test for <=, because hdr==pkt size still would leave the response
   payload uninitialized.
---
 drivers/soc/qcom/apr.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/soc/qcom/apr.c b/drivers/soc/qcom/apr.c
index 2d5645ff9919..e303562526d4 100644
--- a/drivers/soc/qcom/apr.c
+++ b/drivers/soc/qcom/apr.c
@@ -210,7 +210,8 @@ static int apr_do_rx_callback(struct packet_router *apr, struct apr_rx_buf *abuf
 		return -EINVAL;
 	}
 
-	if (hdr->pkt_size < APR_HDR_SIZE || hdr->pkt_size != len) {
+	if (hdr->pkt_size < APR_HDR_SIZE || hdr->pkt_size != len ||
+	    hdr->pkt_size <= hdr_size) {
 		dev_err(apr->dev, "APR: Wrong packet size\n");
 		return -EINVAL;
 	}
@@ -280,7 +281,8 @@ static int gpr_do_rx_callback(struct packet_router *gpr, struct apr_rx_buf *abuf
 		return -EINVAL;
 	}
 
-	if (hdr->pkt_size < GPR_PKT_HEADER_BYTE_SIZE || hdr->pkt_size != len) {
+	if (hdr->pkt_size < GPR_PKT_HEADER_BYTE_SIZE || hdr->pkt_size != len ||
+	    hdr->pkt_size <= hdr_size * 4) {
 		dev_err(gpr->dev, "GPR: Wrong packet size\n");
 		return -EINVAL;
 	}
-- 
2.53.0


