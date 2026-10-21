Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E5F7606A324
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Oct 2026 14:23:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=0Hlk+87U;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=npG3JVPe;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OLkcPDxY
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ilogfIerAIOdSnwNNbXQRexfXEEtio2AIV3VuZD+dCc=; b=0Hlk+87UAcZcI/IT1DZbL6axmW
	Be7fTJhLssvcXAriP/SpLqd+aV1B92YnjW576XZVJsn7Hgonu+9gAYQermY3WMOAAJRFg8aFnd/sW
	aAy51xUPme2OHjX/u+G+3EDeNc2ktKHtrIoJ8CHG9dZ+iaQz9evwkEGBz6YCay1DAT3bJLMeVQGRc
	3DDAdUDL4T/1MK+Z8RgLl1NnMQtwXFqrWsqIToyN+zIj8+Tsw3/QnMn/nLIFdCFM+UfURtgXjlXMX
	HG0WTsdHOm5Tr7R2JbK9xpvY+GMO+LkNdiqCcHogwKlWFz0Q2ktEuSDDPe8UTst/ImSnPaA5oi/x2
	lHWFV3yA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJXDd-0000000C5Mi-2ZFR;
	Wed, 21 Oct 2026 14:23:05 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJXDT-0000000C5GY-3H2J
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 Oct 2026 14:22:57 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LEFkIq3994852
	for <linux-arm-kernel@lists.infradead.org>; Wed, 21 Oct 2026 14:22:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ilogfIerAIOdSnwNNbXQRexfXEEtio2AIV3VuZD+dCc=; b=npG3JVPex9jt6z10
	QuZIaEnlHy40zUnbeFPSTkYUmeMDGFZCXcebettzkxQbnZqXYb1i17KBG/KDiysh
	UelSLZXKjkX/RyEf17chZpDVJSP5F5OrerMgAeXCQOciEjkHGbYyXvTJ/wSzwf5b
	7I4hQsZzIda/5wP6dgYsd3XUw4yeXQ7u8dhF9I6Hb3aPNQ7wMnGjaudfezCAgk+G
	M4rwAjpOd00qImACEhz8A1xLA2Q5bbM+bpxB85kz9yQwp3CTMxT+fYRGXbChb/VK
	rmjLEx+/xW/y0UITXFQEkJY9uJ6zQPq54qDgy7HF9QrtTdJyppbceRbGD8VsAU+r
	80lMdg==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hex5q88pc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 21 Oct 2026 14:22:54 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-339628f2bbaso83222eec.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 21 Oct 2026 07:22:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792592573; x=1793197373; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ilogfIerAIOdSnwNNbXQRexfXEEtio2AIV3VuZD+dCc=;
        b=OLkcPDxYxYW6TDwGknRB6eG3b8Db4JH3tKSqyM/SMEY5LlzLMwX7kL6jZhaWRExwgv
         OORHyqHnNZ1pUwTIHxlRG8eMwWLQaUUs1NysP+2RZcMaAG+v5N5bv4lAs44x4o9zxJGw
         /Y2U2X2csAkqPIpqInaKiNWOQcO7PfmPtJo18aMk2t8fDMnqBsa6mkF/2i/TwLH5kI54
         M1d+s0GkYuXGo9OHo+RvJG4vvOGI33+edMjiblLzjm6ygTf5Kt5pheADXpsnl84QGL2H
         UVDBVjbGLo6myLBrMwO4HOrv9KjlIKGr0FSPx8ieTqrxaAuDHNyY5tT7Y+Hgmw9qsktF
         QCCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792592573; x=1793197373;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ilogfIerAIOdSnwNNbXQRexfXEEtio2AIV3VuZD+dCc=;
        b=FX00rh0sgM7lvKTKlqfhCxSaoSGNPt3NpSG5VLIE+gYf04p/Aiw1KepsWEQ1Izt+NF
         Q7o/yT74e++PHOivpNXI+nZn6Oph451gHKyQp1K+NRGW6HDWsB3lRJwKBwK2upmGiA/Q
         WJA/bdc4W39vKsoYtGwGEL585NjThpPSggZtCv1TmF8emUXSHhi/XjxACO0/+a+/FO71
         XY/mPEu6iodnARLZNg8XHVFsw0ABzoF/tYB6omdAU0IOYzzbluD/99mrlcbeOv8kvaQz
         +6IcmVm/jBNtBykBwV0oZ5GQXzIwbl6YdLwL/6UV16+CdAjnPMWyaerGfOcj5IKBdISL
         ynKA==
X-Forwarded-Encrypted: i=1; AKwUvBwiJWvFwhX7hiF5n5WGuEEOdF+/8P67HM2ICUibPt3Z+xLmr8YycbAo5BiIy0/kQkivQXzNhfbXzsKTB0Ta3TB+@lists.infradead.org
X-Gm-Message-State: AFq9FYL5mcOZfqa5tZowM7KbUFoy1wYIX7VqbEyAy2KoNr2Qjo2Y9pQJ
	MTL4U4XwywuL3saO19IpGkQA4napjQfVGSdSKq40rvpHJd0kTmNslqh5rUgT6EUB7+pwaEXuiGQ
	m/BMTXcJPtijMTEEtmlETj0nzOumu9UTdM9h6/KinkPle6KUn2xNci3N2LCDcOh0bOis5aKtjFh
	UrNA==
X-Gm-Gg: AYBFou1fwgMIgSlplbZy0uQjBmUKwKCSBMhOlrfFp9BqYxvt/bVLbwIqcbjN4oRE8cP
	0yinbz3I/sU8+Fmbnfl7pilDNmx5LFYcz1mls2Pj1mH5p1Uuh+ctQdpkpx/1TtzXDS9BTiJDBrl
	rP1QjIXqkQlyUmQNef4AxcA30xEMjJIUnbqrZE66r3jwteoiJzAXnVzvp5oGgXz0odn2Or/xSIY
	tBw7my1Ul4ZmvPKZpP+xb3gJ5oGAdZwZvyRbNoBOjbGF5LrK7FXmphS4Dj9pDNmUlLqgexN/Rhq
	E0SBzRF3mD7b4uB4ffpcINoM1A/o4ViJJAXfrDqvhXNqCJOinmZMNaWJojEVQSVI+czDBLfQUko
	99PjBw8VE+XZEc3i4RMZzTV6aGw+vGAY5dbxLioHwR0eXGsjHCjHrJgN3TtofrLCsBaqO0wWY1X
	wCQqtHgM0FVV2GFWFuNdGQSQpDJB3+VOAPd8K18R+AU/C6LRj1a00=
X-Received: by 2002:a05:7022:43:b0:12d:c389:ae54 with SMTP id a92af1059eb24-190a465c342mr5156126c88.2.1792592572927;
        Wed, 21 Oct 2026 07:22:52 -0700 (PDT)
X-Received: by 2002:a05:7022:43:b0:12d:c389:ae54 with SMTP id a92af1059eb24-190a465c342mr5156022c88.2.1792592572043;
        Wed, 21 Oct 2026 07:22:52 -0700 (PDT)
Received: from hu-vishsain-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36740cc88b5sm8074818eec.10.2026.10.21.07.22.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 07:22:51 -0700 (PDT)
From: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 19:51:49 +0530
Subject: [PATCH 6/7] arm64: defconfig: Enable Waveshare DSI panel and touch
 GPIO drivers
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261021-shikra_display_overlays-v1-6-adaea735999f@oss.qualcomm.com>
References: <20261021-shikra_display_overlays-v1-0-adaea735999f@oss.qualcomm.com>
In-Reply-To: <20261021-shikra_display_overlays-v1-0-adaea735999f@oss.qualcomm.com>
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
        Vishnu Saini <vishnu.saini@oss.qualcomm.com>,
        venkata.valluru@oss.qualcomm.com,
        Jessica Zhang <jesszhan0024@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792592515; l=1137;
 i=vishnu.saini@oss.qualcomm.com; s=20251113; h=from:subject:message-id;
 bh=wKRFTCBJIBMmNDY89gm1Ek35up9XQQNdIjIma7SHnF4=;
 b=0bZgy1KRlsumildNKdSdrtd+3ObPSv+aCKqiaI3pmsuFxXukpbKiDMIQXPRvPcNqNvwmsviKd
 MV0zGyK0DJHCPB8x8c36kDrYTQpLaoxVrIouWd1foll7OmwigRFK+Vl
X-Developer-Key: i=vishnu.saini@oss.qualcomm.com; a=ed25519;
 pk=8hlXlF8j/3GeOaDK3w2LYhkv9FanCQru0c7kRH/It7k=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA1NyBTYWx0ZWRfXz1Y+ZEdC0urG
 siJgMjqgS20tJdDJyo5ZUmNlJtLDjdfFuoDf/Temk5CBeV/gNdxPIltT2brBXTg9qUZWV8PDbLd
 VoFfJNYJA9Jol9B0grQBm0HEQgkzEOI=
X-Authority-Analysis: v=2.4 cv=eJaGH3p1 c=1 sm=1 tr=0 ts=6ad8cabe cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=Y4Inp1xfyx_JXr0qu3kA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-GUID: CSji4Vm-oQJgkQLcGwDdsGU0WIuMZ2l7
X-Proofpoint-ORIG-GUID: CSji4Vm-oQJgkQLcGwDdsGU0WIuMZ2l7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA1NyBTYWx0ZWRfX18pjkZ6Nrpt7
 4Yl7UQFFkGBFfA81C5HQyQAXBW7w7jusubbdYuCJo7IH2NedeZxOgDHku4CHXksr6y8Klhf/sWO
 tviNeuZ8cUhzJSMMdHcPBey+EqaB5WUWDU4P1hzSCSWQJebIEs3gubZRZleakvhLfGf1Qc6JiwM
 jKyMc+VMX635mYj+IzYp5n1sRTG48Pp6V7rHEBym1cqFUOImPXJZJ3jlTv/PUGrB4SkcuyeCTDi
 tKM6x9ckszS8wtemkI7zjmFjgL6x+OT/9OmMDoaOdVNkioYyAg2wkEtBO1i1lYCd9NX3opLt1eC
 WQGbYfdaVOP4LzhEelqmjICla49uZE/B8M13vzaEMeAZqNjqcEw6Ea+GT0FkR1yvKxi5XO0lfHl
 bGTDgae2z7VpvvJ3DnjplahP9L0CY+Z8dR0xFbtWAoMqozDHqtdakQIvPlPOWkp6Tpwx3R3LLbK
 abM5F/KVY8MdSqSEyXw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-21_04,2026-10-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 suspectscore=0 priorityscore=1501
 adultscore=0 spamscore=0 clxscore=1015 bulkscore=0 phishscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610210057
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261021_072255_939858_8250ABB6 
X-CRM114-Status: GOOD (  12.58  )
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

Enable the Waveshare DSI touch GPIO/backlight controller driver and the
Jadard JD9365DA-H3 DSI panel driver, as modules, for the Waveshare 8
inch DSI panel on the 22-pin JDISP1 DSI0 connector on the Qualcomm Shikra
EVK, Talos Lyra EVK boards.

Signed-off-by: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
---
 arch/arm64/configs/defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 9c4c47a44af9..73c07961f655 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -727,6 +727,7 @@ CONFIG_GPIO_SYSCON=y
 CONFIG_GPIO_UNIPHIER=y
 CONFIG_GPIO_VF610=y
 CONFIG_GPIO_VISCONTI=y
+CONFIG_GPIO_WAVESHARE_DSI_TOUCH=m
 CONFIG_GPIO_WCD934X=m
 CONFIG_GPIO_XGENE=y
 CONFIG_GPIO_XGENE_SB=y
@@ -1032,6 +1033,7 @@ CONFIG_DRM_PANEL_ILITEK_ILI7807S=m
 CONFIG_DRM_PANEL_ILITEK_ILI9806E_SPI=m
 CONFIG_DRM_PANEL_ILITEK_ILI9881C=m
 CONFIG_DRM_PANEL_ILITEK_ILI9882T=m
+CONFIG_DRM_PANEL_JADARD_JD9365DA_H3=m
 CONFIG_DRM_PANEL_KHADAS_TS050=m
 CONFIG_DRM_PANEL_MANTIX_MLAF057WE51=m
 CONFIG_DRM_PANEL_NOVATEK_NT36672A=m

-- 
2.34.1


