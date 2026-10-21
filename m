Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05827606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Oct 2026 14:22:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=nEHhT6Sv;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XVMDFT/t;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=aR8PxogQ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=uY7GWI5QIyzAWEBLfUN/IGVontugXjIcJCsl6jocYRY=; b=nEHhT6SvD90KKL
	Ie4zNiSveDoph2qhCA83Wfc8/KOtVXxb18kCQXSHYGDI5wRaDYeSEUElkpVn7P6MqYwRUStJ4mnoH
	4YE5fmW9vMeO29WCto8I+PO3IH0ijvX9bhyVEBHlEN6vXRwH7Sb9fCdSfcxsqlB7k3ctIbnzUn+mE
	81/3Khva7LzlzknqxmSbEPw1TBI4t3pqs5z/K0vJLJy7o+ZZ21uswCE67lXmn9TX/0Ghq9MPQFzgR
	7H1YgjVFAJhjGy+XmuMr39sv7sKMSf3dX6vU5fLmeU9+Z8Hm9MegGztkvs3VpwKTvv0vlK0aYelr1
	5DU8vdOtD9iNpSDLpBQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJXCh-0000000C4yV-3QD7;
	Wed, 21 Oct 2026 14:22:07 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJXCf-0000000C4xW-0mAc
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 Oct 2026 14:22:06 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LEFFR54163761
	for <linux-arm-kernel@lists.infradead.org>; Wed, 21 Oct 2026 14:22:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=uY7GWI5QIyzAWEBLfUN/IG
	VontugXjIcJCsl6jocYRY=; b=XVMDFT/tYvv2HSMzR+bLrJ0MWGWXNX8HlXIHHR
	09uruKxVqT+rIUDIKTngbOpYo83A8597ICwJgAFSXaXWFf3j7ubPe+uymlGR+6L8
	7DpWZZR+6H+4kJOSvXX1yjSfGywWqTmyhdwGw6rrpTLKAHoI4TZHgEi0YMr9+Psq
	6FIfGsfPlAxLm2oCSLDb3bxDdmC8RlCozcmN96UEdoJrzpY7YnZggF8iXTgyQiwg
	eJctNKjAKBvzINShEQ6ZsdVCXaxl8CBNEVYbZ23+e7aquqDxK4EcgSIiJIOamXSH
	3a9guUe5jlN+jChNns3M3Btk160ZeIXRv9Dl0d+hYZ4ZmXPw==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hex58892c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 21 Oct 2026 14:22:02 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-35fb6be0fcfso126934eec.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 21 Oct 2026 07:22:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792592522; x=1793197322; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=uY7GWI5QIyzAWEBLfUN/IGVontugXjIcJCsl6jocYRY=;
        b=aR8PxogQBbobJUYJAUKMWQxvw88SS0kFz439zOmuJF/SMmISzkrlw0oTIaPZARNTA2
         iy/mP7KI3TVSUK2ShS3n4tSU2eZE04CVmo9kZ05SYWRa2SiK9A/TmLbwKj1+kHGPACBa
         moDpSEfpXxeXWSJvapzxoO7THqL2NgYUCViXkUvVfocO7qHbLux/xZ1JL5MdC8ytywKL
         p0ytqY2vf8nTke1MvMQE1L1V6TCGvCZ+EcmIe2XSTFvfc02iPnqOY7vFc/ZjzMbGWyrX
         2M9soJ/FP4uBX3TbEJojIYMk3/OvTgMhNKqj7w8HmqfP0FYlejkqeiAwr+Ue4kMMpsEE
         DQNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792592522; x=1793197322;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=uY7GWI5QIyzAWEBLfUN/IGVontugXjIcJCsl6jocYRY=;
        b=VIgpN4x9lxrZPBtFTY+UGarIEfQjBBrNRmgYVwxNwTVuuoD4cQ7dUsqsTW4ziRLyLS
         k+4/HxgmhoonHsWkZ2/Uv2POxHgHYn+bjSWx/XLfA+VkgQjFMN9hEPPI3YLrOD/f2dux
         ERzKbAuH24fkFcKi9uvHWuqWY+uLknYyvHyQAwYB9EgYSkcIGjfvsFOVY9/VKTz0pTDP
         uihpmmj/O+JME8CV+m+t1x80QVs0D6Yiaxt6SSW9GFxaiDZFHkguQZ8qgxKzmY27E710
         RteIJAkAYupJ2AXX+ttNTLcLWmEU94q5wQHd8RFnOYeDDVzoneAYa6zPmVBY7WYPrMvF
         HEeg==
X-Forwarded-Encrypted: i=1; AKwUvBxZolBymCpXMo8DNzJDeW5/GpYyHh92+IkbGtgcM8zyVhtZPdBi11bkoX1RmBoiniMF4q5fGqTRYYqUJYybZFjw@lists.infradead.org
X-Gm-Message-State: AFq9FYLsMt+paT2PoQ/nRD3uTHtVTjXb3F3KcIZdnwamYOI844OAe1XJ
	k6bvn+3uFvFBCFfnnD9UG68tspi4AiGHfNIL6zzmGDk23qgIU6Gw8k5aTOjjaO6xs0YW1NV2bEY
	M/5IfQr6xUSQ4/pgrIwPH2jEohr5GUJ4V9FWSsvxFzgUY6BZdcSozwHv0V0kLTuAvFNVdS/sgUL
	sr1g==
X-Gm-Gg: AYBFou1Lkpnr/SpLVB4KUV6bdddUoNVZC71y4lGUMcDJZOxUMMc/jCITalMLzhr+55+
	IT4qnkNFljmiSl5xjS4oC5q+qgUiU4KyUwVxUTngBYzWwbavzkGxVl6ortlIsrUhEAfKj9rP1iy
	60ryBif80Y4SMC5fJHULQo+NtiM69G0nOyPqgUS5MZP4CuGWVTWtZzb5zUfyibKZMzmnzLKr/q5
	lISBcBWelmqfcJWFw7ymJeBN/ggtSzldGuzXbyaT/5Joh07Q51pbNyvIFO0CYbiwWcsIHtjIBPk
	9dGt/NcTgV44ip4Wm7zb/1qkW5O+K7T/p3nMilV7OREY4dscP8Zvi9fpnxuAoYXw1fdgDp1GZxJ
	wiW4eigIvlAYbu7qUsWrMmYelzO0I6Fma2aCTgrIldXAuZKpEdQPRdWvQgbYLZiuLWMG6hnXa+k
	uB+MBSwiD2CjWBX55EegvGw4TYfeLzKSAnoP8NhSQFLwbvAJ86W6k=
X-Received: by 2002:a05:693c:638d:10b0:35f:8c5d:5938 with SMTP id 5a478bee46e88-3674bd455c5mr5364025eec.1.1792592521980;
        Wed, 21 Oct 2026 07:22:01 -0700 (PDT)
X-Received: by 2002:a05:693c:638d:10b0:35f:8c5d:5938 with SMTP id 5a478bee46e88-3674bd455c5mr5363948eec.1.1792592521142;
        Wed, 21 Oct 2026 07:22:01 -0700 (PDT)
Received: from hu-vishsain-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36740cc88b5sm8074818eec.10.2026.10.21.07.21.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 07:22:00 -0700 (PDT)
From: vishnu.saini@oss.qualcomm.com
Subject: [PATCH 0/7] arm64: dts: qcom: shikra: Add display overlays for EVK
 boards
Date: Wed, 21 Oct 2026 19:51:43 +0530
Message-Id: <20261021-shikra_display_overlays-v1-0-adaea735999f@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHnK2GoC/43PTW7DIBAF4KtYrEs0gPmxFVW9RxVFgIcGxY4Tc
 NxWUe5eHLe7LLoBPSS+eXMjGVPETNrqRhLOMcfxVAJ7qYg/2NMH0tiVTDhwxYA1NB/iMdl9F/O
 5t9/7ccZU7kwlk96YwCQ4Qcrvc8IQvx7y+27NCS/XMmBaH4mzGakfhyFObaVqXQcLGgJ3Bphwt
 TNaFExr6YwXDhUaa/1CD5izfTRrq+1SDBoBv8VoN9G1eKazpEAN2qCksYDCvI05by5X2y9TN+V
 4fcqVPeUf9zmm4wpJBC05506B/TcEhvZToxjzdNZ0ZrpADE2QZU0eWPME2t3vP6sVWbKWAQAA
X-Change-ID: 20261019-shikra_display_overlays-515c88f150b3
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
        Jessica Zhang <jesszhan0024@gmail.com>,
        Mohit Dsor <mohit.dsor@oss.qualcomm.com>,
        Anand Tiwari <anand.tiwari@oss.qualcomm.com>,
        Shashank Maurya <shashank.maurya@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792592515; l=3439;
 i=vishnu.saini@oss.qualcomm.com; s=20251113; h=from:subject:message-id;
 bh=Y+zJhUSQ15wVjj0ICYb4OoQC+kv3UWa/33obn42FQiM=;
 b=6YaquSOSb9Af4655/GhnWH7C6gUaVnevKEJHswXkwk3wNVypVHgvy5mEOinv+7w1To1V0UrWf
 hBt33ZiFNEWDVMfJh3fGJjPuuNaaouOFXQRpQW9cmS4e3IuLDIgnoWR
X-Developer-Key: i=vishnu.saini@oss.qualcomm.com; a=ed25519;
 pk=8hlXlF8j/3GeOaDK3w2LYhkv9FanCQru0c7kRH/It7k=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA1NyBTYWx0ZWRfXzmOMX11ygXV2
 28o6ulkQURQDHeKsR5JQEcoik3/HD3ZbHtN19v+a9icpWxFQE3gtzBiaL8d7oPjwuT3WuTT3tvC
 WwOXBttZzYoNkrNrVvtGrvUCvJQ8i2k=
X-Proofpoint-GUID: oTAkGbGG-eKyRrNdjrbKKlQK7VYkgGq3
X-Proofpoint-ORIG-GUID: oTAkGbGG-eKyRrNdjrbKKlQK7VYkgGq3
X-Authority-Analysis: v=2.4 cv=Ku7YSmWN c=1 sm=1 tr=0 ts=6ad8ca8a cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=1DmlGK3jZovgR-jo5ScA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA1NyBTYWx0ZWRfX5EG4Df31hOG2
 xm0/pTi0U+uV3a76xD2HiMoR2oaBx/iuZS0nlZXp0vn7OKRZM7SluzVWeaELXK71mMCxJ21UX0r
 /VFtSmles24ZTeWe7zl1OC6OBXZnr/foPlWYUc6xOERWMlGiaVe+kfCQZk13gTrwptFpXVW3WMD
 UDnkuxT7dw28IYEYPKCBKq1gxZBx1lkhQQ5ugwSuRGKslGjZLJ4ba1/wF97b1n0kALxVm/rtXVC
 YElNCku2JAuc6x/jkL2RMwGMQxuobUCngOdQrGJ1MCwa3Nk72TqLQAblzXC3QIkSLrpT3iohP5h
 XrkpDka3zA7apZ+GPVprxnAUkXphI2h/dcQYiyrPKvxonO0/sFQ8ryOfLT6rtpoNeaAAawO95fV
 LnLvOcnaWEh0efyJh6jWwHmH5Blwl89CSMAlvqkB3Y3j/kNXDhUVr0W4IKW08y/vRyyB7O0GXIt
 kOWNkF59KeSOkGV99Aw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-21_04,2026-10-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 malwarescore=0 adultscore=0 clxscore=1011
 priorityscore=1501 spamscore=0 phishscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210057
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261021_072205_255169_20A88170 
X-CRM114-Status: GOOD (  13.83  )
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

Shikra EVK SoC cards (CQS, CQM, and IQS) are mounted on the Lyra carrier
card. The DSI0 interface from SoC card is routed to either the 22-pin DSI
connector on carrier card named as JDISP1 DSI0 or to the B2B connector
named as PDISP1 DSI0, though a MUX which can be selected by a hardware
DIP switch. There are multiple daughter cards designed that can be
connected to this PDISP1 DSI0 B2B connector.

The below B2B display interfaces are enabled by default in base DTB:
- IQS: DSI-to-HDMI using the LT9611UXD daughter card
- CQS/CMS: DLC0697 DSI panel using a DLC daughter card

This series adds DT overlays for additional display configurations:

- shikra-cqm-cqs-evk-hdmi: HDMI output for CQM/CQS with LT9611UXD
  daughter card
- shikra-iqs-evk-dlc-panel: DLC0697 DSI panel for IQS with DLC daughter
  card
- shikra-iqs-evk-lvds-auo,g133han01: AUO G133HAN01 LVDS panel for IQS
  with LVDS daughter card
- shikra-iqs-evk-raspberrypi-dsi-7inch: Raspberry Pi 7-inch DSI
  panel with touch via the 22-pin JDISP1 DSI0 connector for IQS
- shikra-iqs-evk-waveshare-dsi-8inch: Waveshare 8-inch DSI panel
  with touch via the 22-pin JDISP1 DSI0 connector for IQS

These overlays are applied on top of the corresponding base board
DTBs.

Signed-off-by: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
---
Anand Tiwari (1):
      arm64: dts: qcom: shikra-iqs-evk: Add AUO G133HAN01 LVDS panel overlay

Mohit Dsor (1):
      arm64: dts: qcom: shikra-cqm-evk, shikra-cqs-evk: Add HDMI overlay

Shashank Maurya (2):
      arm64: dts: qcom: shikra-iqs-evk: Add RPi 7-inch DSI panel overlay
      arm64: dts: qcom: shikra-iqs-evk: Add Waveshare 8-inch DSI panel overlay

Vishnu Saini (3):
      arm64: dts: qcom: shikra-iqs-evk: Add DLC0697 panel overlay
      arm64: defconfig: Enable RPi touchscreen V2 regulator and ILI9881C panel
      arm64: defconfig: Enable Waveshare DSI panel and touch GPIO drivers

 arch/arm64/boot/dts/qcom/Makefile                  |  15 +++
 .../boot/dts/qcom/shikra-cqm-cqs-evk-hdmi.dtso     |  90 +++++++++++++++
 .../boot/dts/qcom/shikra-iqs-evk-dlc-panel.dtso    |  78 +++++++++++++
 .../qcom/shikra-iqs-evk-lvds-auo,g133han01.dtso    | 127 +++++++++++++++++++++
 .../qcom/shikra-iqs-evk-raspberrypi-dsi-7inch.dtso |  91 +++++++++++++++
 .../qcom/shikra-iqs-evk-waveshare-dsi-8inch.dtso   |  77 +++++++++++++
 arch/arm64/configs/defconfig                       |   4 +
 7 files changed, 482 insertions(+)
---
base-commit: 6474fa070f2b8013b4b87350b775b8c3be6e8aac
change-id: 20261019-shikra_display_overlays-515c88f150b3
prerequisite-message-id: <20260930-shikra-dt-changes-v5-0-8eaf658a0e38@oss.qualcomm.com>
prerequisite-patch-id: 7631efa76e1fe98ae45c0f68e93ced4c523af27a
prerequisite-patch-id: 49396fb33427bd9b9214b537221a1c582d5d62ee
prerequisite-patch-id: 3cbb70da0a3009a2730813b562c29f432bd0fd8f
prerequisite-patch-id: 1c9ff594613a4cef8d605cfd37a3270866ba6414
prerequisite-message-id: <20261015-shikra-work-v5-0-5e075222b60a@oss.qualcomm.com>
prerequisite-patch-id: 326d8620d592d8f5f75fe62f88a2cb4dd8ec0b46
prerequisite-patch-id: 327308970dffdb2b218d4834e1badcc9e05cfd01
prerequisite-message-id: <20261008-lt9611c-v7-v17-0-1e8f5f2b2f19@oss.qualcomm.com>
prerequisite-patch-id: 49f1e01bb5594ce9c4301ce4b16715834ece7f41
prerequisite-patch-id: b909fe50eb311c7d8ca6778a29952e2c1a28d7ee

Best regards,
-- 
Vishnu Saini <vishnu.saini@oss.qualcomm.com>


