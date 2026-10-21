Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C81160A3815
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Oct 2026 14:22:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=4ra5Ke4b;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VewUM90t;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=K/+GD6if
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E1CSK7DzG4wIXFH1i74mGmfuJP8bmUM2Qn9do40iEAA=; b=4ra5Ke4bcQOGsRIZxOe8RQbXVT
	UUhM0nhlPjUQ48y7+zYzjUeLMqvev+D6zi2GQv4NVuqJY2LfbrvhcGoNk9sTpBBX3TF81Lsxab+iO
	xKUmsrOffDYDOg9iSqyc6/NlbG+g38Ge+DVCuc/gj0oKupCqzQjtpil0ylgcsy1tGBbcmos29zcZ5
	iJii+Ql9JaHJ/p7XhlS0OirkuuYlBCFiFAgz7+BQD8MdBwGbZ9CxrqjxCE60zI3lvCZsnrVWtBI07
	eg7xyC9hX5eKsWqo1ux5dYbhfZvAReCBMT7FwqKlKpXcn8e6iyiwqgoRW6cZXo+a+KO9uniWXUsrc
	9SsHJymQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJXDQ-0000000C5EL-0O2F;
	Wed, 21 Oct 2026 14:22:52 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJXDG-0000000C5AD-2ZoB
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 Oct 2026 14:22:44 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LEF3Cu1933555
	for <linux-arm-kernel@lists.infradead.org>; Wed, 21 Oct 2026 14:22:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	E1CSK7DzG4wIXFH1i74mGmfuJP8bmUM2Qn9do40iEAA=; b=VewUM90tac1EJ1iD
	u2kspP3k5ottnaeCKtfGoIvVN6yjkn6NOJG/esUL6PM9njmP4XpFo/u2YgZihGXL
	SYIZy3XhPjHiWDh7foq1K0xW34hapKkLbNQj4WwTLjjYoz8k34D6zhzQzIA/vlfT
	GwVAyexTgrJmByVkds4JfQ0utjNUYbChT5mz3HQicLdfVMfTzDHtojEpLMqlSK0E
	oy+jJ3fdqFtHqwM8kJkaeZN13+Ut4JQSCSaWFdq8pW0jupPNH9tea1J3UzvwlUt3
	e1Kvs/B8WA/i7p3VP8WLbGqNeFj9TbCoh8266hbvQUFV4n2BTbM2SF5KKnOQ2rfR
	3pcy6A==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4heuhugwvv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 21 Oct 2026 14:22:42 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-35935fae332so78457eec.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 21 Oct 2026 07:22:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792592561; x=1793197361; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=E1CSK7DzG4wIXFH1i74mGmfuJP8bmUM2Qn9do40iEAA=;
        b=K/+GD6if+G5COEGL3hXN5sx3MEObTxleOuCYtAAxuy1KO6e2M7mr4ozIo2CgNEmCoQ
         CmQonDIRh6JN3zPKEpZ4pQ40uBULcwlKBW9xtC30/IsGe2EZjgzoTKDJK82xYpN7dz3l
         +7QJLaEGV1ecZq76Ohq8GcBvk4hI5vnRkR+ja1iNFGj35qR7u2aEuBoXvA8rOA0+Lw14
         Or/FfdgNMiMAkzA9ZI0L8RM0iEXS/GpoJOQVB9gxinI1SEcJOh6NQLgqQkCatdnJpBXy
         QPJB4BgdWn+ApvXzbB+4VYhQAxiCseleVEZyvsD+8lZfD0V9dTNq4FvhuTS0pdjY7X8a
         5oLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792592561; x=1793197361;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=E1CSK7DzG4wIXFH1i74mGmfuJP8bmUM2Qn9do40iEAA=;
        b=EFJ/ySEjQeXmX4Q6CVgRAIHH5akzBOo1qtJB0lri8Iqh2GqTYjOy6V3A3pnIOBxwsM
         q7byU0KqzApc6eqBpBEbofqw2Y4l6QZuxN30cdO3q9TFe7nidzCfdHZ7FqFPvaoq0o2O
         ydfBV3zMmjMHXRGHXCuY8tHSzD7mlyEI4YNefFTGwjeHCFuwMPdQFr64MEtO8k9w9f2+
         j/CbjAV7wPJTU+UKjKqly9D5YM5+983dlT6TT++821YhqxATOYkjl4YJrlUArxUS7hBe
         h0U6/OZjBSF7FtypEn4NfhHTnz5GFthObCW865gb1fPahdasGgtOYC2REM7w5Mievyni
         v3dw==
X-Forwarded-Encrypted: i=1; AKwUvBycXEijlE6uDRJjiuU5TmC3zqZumC/VXm2jEx8HB6/al/QwI4g4qVMW5ERqOht8O7Hpw8wEI2j16xT8gsly84Sm@lists.infradead.org
X-Gm-Message-State: AFq9FYKeGicMZlW2eQyy7N+2Gp/XNakuuIep8BLUdeu8EgHa2KOaneiR
	uOua8+9HLmWL/D2dwlGM8PX7v7bAn5AvXHccuzQEuk5m2G+kbpBcA+AGJkGjGzx8pMD8vYJHTRQ
	7zezK3Eg/oi4mZlexZzTt2KWxKWJt9QOuc7xrYaEpA+UBmyw4d83V3VkiM5NMR92aJurjR5fEkm
	+dsg==
X-Gm-Gg: AYBFou3rb1jxD8gYZfsYQrMgj3+nvLbAZMM8L8pGailxhi9LdZVBwdqGyVNJZFPrxXA
	wiDaqRb6RuDTc/H4SrXCV90ey/nSYI2LP8PiPqlEsAegJM2Of6MffJ62rby29QhoBTzXQvsBG91
	3JDic3Npm2QCvQjrp+x00PjjPD2U/MvGdkNDniEFQu0bTf0nWZKzuMzUkNCXC6FAwl3i71m4TbF
	uYfpV1iIi+85aRA5ms56FaRMvyssQsLmPzNcNYFy2NMKlO490U9walGSTJuULn/z8nrGB9WzHbX
	otbeM1RQ2Ybmdti5I8LBuvPOU9a/Ghdne/f4ubf5Tjtg9vBlVrjL7FnNDdzqSwxrzuBgwudu8Da
	ZK+xlpkzQXKGtA4ZcmqUhGp6ndpiNZAegHS0M30Jv0IADl8TMUK8MEyeqCzZIAUruWMhi4RWy3w
	BOW8RqPH8bu2JG0KzHiPHe0dXDtNjx/XwAHDSwcSNxQPlRxklJaVs=
X-Received: by 2002:a05:7023:a5c:10b0:183:d275:cf76 with SMTP id a92af1059eb24-190a370711dmr3992467c88.2.1792592561127;
        Wed, 21 Oct 2026 07:22:41 -0700 (PDT)
X-Received: by 2002:a05:7023:a5c:10b0:183:d275:cf76 with SMTP id a92af1059eb24-190a370711dmr3992373c88.2.1792592560306;
        Wed, 21 Oct 2026 07:22:40 -0700 (PDT)
Received: from hu-vishsain-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36740cc88b5sm8074818eec.10.2026.10.21.07.22.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 07:22:38 -0700 (PDT)
From: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 19:51:47 +0530
Subject: [PATCH 4/7] arm64: defconfig: Enable RPi touchscreen V2 regulator
 and ILI9881C panel
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261021-shikra_display_overlays-v1-4-adaea735999f@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792592515; l=1221;
 i=vishnu.saini@oss.qualcomm.com; s=20251113; h=from:subject:message-id;
 bh=U8f+j/BLf/HSFgdLnfHMeSGonjaUCp8+bl//vReoFnE=;
 b=DzMMfaEXvKx2FFuZQfwCxTAstnLov5p96AEPmDFiRpSHF3LH3TYw/+3dMpqJct+TP4Xzzc2rL
 Py3tRE/V3FsDndfVbDG11q6MLSzHliassiWoyYADNnoENEPXXsXiYJi
X-Developer-Key: i=vishnu.saini@oss.qualcomm.com; a=ed25519;
 pk=8hlXlF8j/3GeOaDK3w2LYhkv9FanCQru0c7kRH/It7k=
X-Authority-Analysis: v=2.4 cv=d4JgWhjE c=1 sm=1 tr=0 ts=6ad8cab2 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=Y4Inp1xfyx_JXr0qu3kA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA1NyBTYWx0ZWRfXz+vQahaRZ7Xy
 FZ0mL5DZbm97VHmmAHlUdUsX3yktToMRyjufAJy/e2DdQ6lJKzIMkmfN6CmCTPJSLc/kETr1deg
 xOZpr74Klf38fJJpPEw+wRPPzhtj/aQ=
X-Proofpoint-GUID: YOoI-dQBchEh_V_OnE6gBdoyJETggEB-
X-Proofpoint-ORIG-GUID: YOoI-dQBchEh_V_OnE6gBdoyJETggEB-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA1NyBTYWx0ZWRfX7mHFRlzuUiEB
 F2rI2lp2qnWH2ICP1b3y1phf+eiDidVjGfIq6kyKjH0VNlkW+LJqZEAKOAajDRFbHMlVvEX1/9a
 hH2aiK26RjjVtPk/O9Bp7a0gCKv+lw6mdG4g2+pZEQQ/0VdIt5PovblTbmi2ndEVwfI5th1xRhE
 qigyH5XlzJdP79HKGJyrTXxN0zoRI8w0fSNBALu3G1xn+sA0EA0NfGe5zzchbl+XIlOl5SxCQsY
 iYhhCWN1zIdviafGkmjsc0AdfJ8aO9CVIyD+YiCmnBa3AYEKi5DKSKbDbBBDkD+RyJJXF2cu4bd
 JiwPZpVzWH4CIlVRXP/zoiFWeaqfgAOJ/OfMNGQNzVhR2yiLhr86xic8/QxSmaMbqtdJ3W2u9t5
 0uoeu2EY3TgwwkCMPkEnlmMHJ3KOy7F582A9wXUxnr8PS99f1u+1dEzOsnVVVEKhySvy0Xw/A9S
 JDvTTGfOV41vP1ZM56w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-21_04,2026-10-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 spamscore=0 malwarescore=0 priorityscore=1501
 adultscore=0 impostorscore=0 bulkscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210057
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261021_072242_850712_CC9DA819 
X-CRM114-Status: GOOD (  12.73  )
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

Enable the regulator driver for the Raspberry Pi touchscreen V2 power
and backlight controller, and the Ilitek ILI9881C DSI panel driver, as
modules, for the Raspberry Pi 7 inch DSI panel on the 22-pin JDISP1 DSI0
connector on Qualcomm Shikra EVK, Talos Lyra EVK boards.

Signed-off-by: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
---
 arch/arm64/configs/defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index d18f72e55330..9c4c47a44af9 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -900,6 +900,7 @@ CONFIG_REGULATOR_QCOM_SMD_RPM=y
 CONFIG_REGULATOR_QCOM_SPMI=y
 CONFIG_REGULATOR_QCOM_USB_VBUS=m
 CONFIG_REGULATOR_RAA215300=y
+CONFIG_REGULATOR_RASPBERRYPI_TOUCHSCREEN_V2=m
 CONFIG_REGULATOR_RK808=y
 CONFIG_REGULATOR_S2MPS11=y
 CONFIG_REGULATOR_SGM3804=y
@@ -1029,6 +1030,7 @@ CONFIG_DRM_PANEL_HIMAX_HX83112A=m
 CONFIG_DRM_PANEL_HIMAX_HX83112B=m
 CONFIG_DRM_PANEL_ILITEK_ILI7807S=m
 CONFIG_DRM_PANEL_ILITEK_ILI9806E_SPI=m
+CONFIG_DRM_PANEL_ILITEK_ILI9881C=m
 CONFIG_DRM_PANEL_ILITEK_ILI9882T=m
 CONFIG_DRM_PANEL_KHADAS_TS050=m
 CONFIG_DRM_PANEL_MANTIX_MLAF057WE51=m

-- 
2.34.1


