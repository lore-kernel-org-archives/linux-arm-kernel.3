Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D83E2606A328
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Oct 2026 15:18:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=pwRISX6r;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=juMBFt5f;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EqLevpNP
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VtTNcob6wDI6W4Rur9wkYiGVF70PDqK7oa/KU9FOQJk=; b=pwRISX6rS8RcwBMwnx6Pmq08Kk
	nSXziWdHhzXukLgLjFFAR7UT6EWU6pgrMFt8vZ+tzpOjUvHOsNrDuwGkXLydtnH/Qn3KdsTMByKqp
	la4p4Nn/OMpFluoyGD2t02VUAmnlwNj6JMsz9VkD4zaaSRHHDRPnw6QHx8KL5K0Qaaogv5G2BJYjT
	g/BY3FZlnSv/4oS15p9lz+dfZvLGYtPZ6g1pZuRRTo3uUp8rFopPf5zmtpLdVip8yJR1zMJHJUMTS
	HgokDCAg8sfwiY3nez9OYKOng9zZVqrBIWvNlJfNuMKxL6nhdIwkKTGEBV9StPPHzyFEX+NqB0ZcY
	rTBzRVWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJY4w-0000000CEKj-1tW7;
	Wed, 21 Oct 2026 15:18:10 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJY4t-0000000CEIB-1pa3
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 Oct 2026 15:18:08 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LEF5kw823460
	for <linux-arm-kernel@lists.infradead.org>; Wed, 21 Oct 2026 15:18:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VtTNcob6wDI6W4Rur9wkYiGVF70PDqK7oa/KU9FOQJk=; b=juMBFt5fQg6G/ln9
	RkrfhmZCpWEYfGry4aXOj4/+pMiGw6UMNV/pX+x7BdIxsXxxbIZOyKvzH4/HT12z
	zFcBgJpDibSmsig15qm7ZJyPW0jtPmIJ1ZW4Y29pWbPHHrQusT4ViQTTSlOa7BNs
	JDSkcPiMEBa2DhxDA6WAes9SwVwQ24l9XGAW24OeqKH0xVXI0e4l8OzNzgn+YHz2
	EJLtDt4yQO+2PIU+rZVNpc5PnDjyfiOsAK7LlfllYuIFahPPL5XkSvLT42lQcAoN
	DVKH0drXCZPCOwEUfLATZUB+rVeylG2f57P0W4GkJg8gdEM/LsSS5QTjTK9dGr++
	7f1DQA==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4heh5r3qqr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 21 Oct 2026 15:18:06 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-30c0d568830so2013227eec.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 21 Oct 2026 08:18:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792595884; x=1793200684; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VtTNcob6wDI6W4Rur9wkYiGVF70PDqK7oa/KU9FOQJk=;
        b=EqLevpNP81JlYGWQxngC2xuOcRyRynactAHBQFCIRNXYAmkxZSLZOHrGp0PJWrbmhA
         lL8W+IYLM+Afij3X9hoykNYWeUS2lhTy8bzl9YsAQRNT8Vc3znjeznte7iKyPaD/GFrB
         ZGDjIAnsIbAcktJ9jH6FDeiIzZSQWzvPxRoqD2YmPw2n+JTR55l1CEFtR3Kn93NrBk7Z
         RHxL6cePh0xmfCuxP04gZCETzAz6y0ZBfoZd1EiJVgS5GS3UXnBHYmUlwkCSuAElOOpt
         mJrQHIXr/R/nyvQ1R/GjP54EfD0NmjVpyPn/UP5/UNvKi/g0rDRgaWbQagBK+rf/AHe/
         HwOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792595884; x=1793200684;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VtTNcob6wDI6W4Rur9wkYiGVF70PDqK7oa/KU9FOQJk=;
        b=wjM6X3UzadEKb3AEB7L3mOhGYFDxXDY6Bf/bT+PmXikSui34xD9paFDtcAhe64LFdt
         CMFbiXy/mJxz+lMxFVToNVcz/nqmn+/Zywq3+ZCtyD5DrSulMwNoVUIdPIuKhprsfrFf
         ucYOqUSuBYcy9D3F+wUaNJ5+xBpqXMMD2Q9/pPT9yYTfoX0JwOFczYZ59dm31zeak/xl
         tKCMB9NTGVEDhucVcmxQ4lXzcGz85z4/YI5EgMo7FhxbVM9uk3nxgFdNUaA6XwErY8SA
         KIQxuV3qykhmAmKmDDtxyw3oMAaBL6MbkMbc6aBYFA9V+lInEIVDUboz+cnA0EFvm+pK
         mJwA==
X-Forwarded-Encrypted: i=1; AKwUvBzhZZQMP4gVWrdcmGhCH0WMdZYBjJRyeSTUMkLe68Y611xvGDbjW8/6v4s1btcbYogmK+FUViFeRlt5f4DQQ6cp@lists.infradead.org
X-Gm-Message-State: AFq9FYLE19t43gx2TtIeiET6mqQ+a9aPQdVFA7WKef28Xe2nQSLeRtxQ
	U7Qs8EdJhPj2cBSf1Nfpo/7uLCIGtHZdKb+jt0QNRZgF7VHI8BB+6VeVUyPbNUK8qM9M3lYMW1/
	OPV2b9HH4drz8+So6LW6q4ryy7rv9saJE+0Iwvkypd3RW67XLqAb4ciWOx659Gff3GqN2brMomB
	9XwA==
X-Gm-Gg: AYBFou3cT1EunKlxOe/2V5oywX361Inm2E6u0HL8JZvl8Nu35RIx2j4b0bAjpDmd0qE
	BaMU5PWnpx6L3bOM52MTrkPs7FUfzX9TQSE2syeZHsaOkqEUE9WkEUY3ZgkbbH61TrnBktb16IE
	BBRsznP4AaGswT0t9MrppnL9mlWm9kpH7plF6431nqKeIpqY/OG9E+DlWyIq8vMRDJw05XFcfjp
	cpyW1MAtPBHs4gsZ0ychmRKfWWLFbZ/jqjb3ZSI6WP8ywuEobBpumyXtzAS3KStitu9iybYW2Lb
	VxBSlHK9pgxlKYvlRCSBen/s9/v99e8iaw59YDaL35WRCcYYvcGykRdPM0v2Do0FV3cVUTRDwXx
	9U+OettV21jvARKPlkoXZHedw0islWb1K
X-Received: by 2002:a05:7301:d813:b0:360:f13a:ff0e with SMTP id 5a478bee46e88-3674d753a4cmr3341577eec.23.1792595884471;
        Wed, 21 Oct 2026 08:18:04 -0700 (PDT)
X-Received: by 2002:a05:7301:d813:b0:360:f13a:ff0e with SMTP id 5a478bee46e88-3674d753a4cmr3341545eec.23.1792595883840;
        Wed, 21 Oct 2026 08:18:03 -0700 (PDT)
Received: from hu-anantiwa-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36740cc8c6dsm9142117eec.12.2026.10.21.08.17.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 08:18:03 -0700 (PDT)
From: Anand Tiwari <anand.tiwari@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 20:47:29 +0530
Subject: [PATCH 5/6] arm64: defconfig: Enable PWM_CLK for backlight PWM
 support
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261021-lyra-display-upstream-post-v1-5-585caa39cd7c@oss.qualcomm.com>
References: <20261021-lyra-display-upstream-post-v1-0-585caa39cd7c@oss.qualcomm.com>
In-Reply-To: <20261021-lyra-display-upstream-post-v1-0-585caa39cd7c@oss.qualcomm.com>
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
        Anand Tiwari <anand.tiwari@oss.qualcomm.com>,
        venkata.valluru@oss.qualcomm.com
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792595849; l=673;
 i=anand.tiwari@oss.qualcomm.com; s=20260717; h=from:subject:message-id;
 bh=PvJgpXbjwbKmN5hdDTOHLEi0wLguTf8dYpZBKf8nIB0=;
 b=QD7bkVOSV9SdvGpM2J2FTKAwcB/SWheGW/3C0KQYWHaSnIMXjLZrXgJmlttGvhy3Chng6xe3x
 7tOviLzTbojBgyDV6TwzXknfvvMOCGL9TJV8pOjb4Qeslv3iArQqBfr
X-Developer-Key: i=anand.tiwari@oss.qualcomm.com; a=ed25519;
 pk=ygURjl6LxwG8EhgPNHYYgCZLsaXFgWZZoHRRyud5B40=
X-Authority-Analysis: v=2.4 cv=aI5lOr9m c=1 sm=1 tr=0 ts=6ad8d7ae cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=FxRAHWTHE1z7yW8SwP0A:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-ORIG-GUID: 05iReCs34n3mjVp83mavZUxSNR2eJjuH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA2MCBTYWx0ZWRfXwwL19WD7EzBa
 Mquhv/QN+J0UDJ34lKQ3hj++wMsMPO+SE3N9sszbvZrQS3lNSf3ynMmeF0h96d2Z50+IOEUbUVt
 cNdwFadKhUuU5EQViRn60U+FyOMnwAiZ6PYxW453Z19Fb/3OcDa6eWrZrAT3zME1gtS43Mn61vJ
 W0g21fXfeiFeMnPzc6Y/yc13/0V+1r5QLfQ4zxs3WpdOWH3CfHQwxfxf5qjqWDIH8w9ZNKvyfob
 b4heUWSejN9gRJQ4gMGVPyOHsflieZg3YsjtCZQp8uYDxTraMXyfXLavSTmEIis9HyKmLBhsYXV
 FM76dJpmnaC4SOr/qqNvqy6sElMmnuiogbOUDvnWnOZsZOBiqG+Rx8G6w/my1ixuG1/DnU8cEaS
 o3MK9CO8pDaYNddklhDifaEuzN6rC382wARb+WozOUnSuE+zcpYPqXNrTgdA7Cb+gAh03flzuYh
 o5G+FMlF96/78yEQIdw==
X-Proofpoint-GUID: 05iReCs34n3mjVp83mavZUxSNR2eJjuH
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA2MCBTYWx0ZWRfXwTMKOpidEJ2Y
 rDCuRTwepfJx0t7Rra1T2BOEBoCgBKfYFAeCBggrnjMhmGCt2pQwcVxiz/sm68NX55sgRNxR427
 Ol6R9i/sDlPCbdEB7S93AT7Pn8zf2Jw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-21_04,2026-10-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 impostorscore=0 spamscore=0 bulkscore=0
 malwarescore=0 suspectscore=0 adultscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210060
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261021_081807_599221_65E1605D 
X-CRM114-Status: GOOD (  13.14  )
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
X-Spam-Status: No, score=-19.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Enable CONFIG_PWM_CLK so the generic clock-based PWM driver is
available, used by the Talos Lyra EVK LVDS panel overlay backlight.

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


