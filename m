Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DA85606A328
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Oct 2026 15:17:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=hpJz1F54;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=I/5/5o/3;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ISVQRY/0
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=sMmjYtG/rjFjeMhRDVGkf/87tw6pvM/e0yvKC2pDRLg=; b=hpJz1F54sFt8b2
	p3Slfg0yiNwWH8DcJlt3fAFRODX/89ciOU2aa5svlbsojKP/RQd4DVEpgJ1lZTdHaHV0Ojbo5Hh9/
	7t1B9TpODbIimsU1mEWNWIjepGh6XGGNIW4QAGp/nyaGstSzMa9IyXgxYIwyA+YjVIF+kKTdBqRvU
	WjgFtO2/HeloFTfEC/FO3MfHxuNLhsxHuVnv+u+EZdiuU2qSltdcZ6rPQs4re9HBNdO9mRUcXfqas
	GsGuSv0L4wa/wQK+JbNyiEAvH5YvxGqNuyLAZqFT2cnj7dHX56jWQ2XWkQUIOwNnIfkW8MFzG/j3C
	h65FyQopv7+TvQaSlCqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJY4U-0000000CE4P-0kYF;
	Wed, 21 Oct 2026 15:17:42 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJY4Q-0000000CE3f-1alH
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 Oct 2026 15:17:40 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LEF5Bf3558071
	for <linux-arm-kernel@lists.infradead.org>; Wed, 21 Oct 2026 15:17:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=sMmjYtG/rjFjeMhRDVGkf/
	87tw6pvM/e0yvKC2pDRLg=; b=I/5/5o/3w+GXYaqYMYOy5XXTKXJ4O+aPrJtD8D
	q8n3+swFpVlK7tsTSeUhbOlkxaO+YtTwARHNPLp6lCzJrGsqr1hnHMcKFfADGpdF
	tMTWiMZN/RjtEpfem5WRIp9wrN9ySsBLyeLywNwxG+uGtpuT6+KanMaEKLC6Fnn/
	0maZclydMceUFEvpyqrSijs0vOHjgcLRCYM2H2s34C500Szl/NQZRhpRAmi4qCSU
	a2jP7tHiO2MRIP9CC1uFz1nVur0wSi9t3+S0BuP+gfgXJjQ/A769vseMOE69K9n6
	XAeCoKYtk94sU4b1auyyPbg3yJA4glIy1tCpp8Vpr7FX2zUA==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hesy79rj9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 21 Oct 2026 15:17:37 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-30bcb065bfdso1398921eec.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 21 Oct 2026 08:17:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792595856; x=1793200656; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=sMmjYtG/rjFjeMhRDVGkf/87tw6pvM/e0yvKC2pDRLg=;
        b=ISVQRY/07zc5CJMbCTVPtq5lANxtLntmBmVrfrdwKf2q56jz46wTiODeCU0/SCKt84
         PGRQw0fRSi26Cv0sXJe4t7Vale45Dtm1L35RReV/py4MyBpdJm2iUzEf9JJcJ0WybARh
         w5vL8lJD7R5sOr1X4zOOnPGkKmRasvRfLCnLzCvICSJqisdkINhMOnTr6jg992zqJVnW
         y65fNEzkm/YhrR34qVE3Ic+dcS8gOFfxVeK54IOLZTJgpIL9Y9eamCJkMTA5vQ7hkrAf
         XDG421PDw5LtE5nf9rGlRL264ij99Z96MzOgIqz5uee3aK1eqLnCoOcsB8xkKHCm3urt
         E7AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792595856; x=1793200656;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=sMmjYtG/rjFjeMhRDVGkf/87tw6pvM/e0yvKC2pDRLg=;
        b=XkRbLh6tbu6+jBy15HbJMX1bp/CyEWkNG7BWL8lOVRNKpWKx8jHLOtY2CqtWLX1kAQ
         K5Rr43rVlESaA1pQPJ+IStlAcjMcOT/JhcosdH5sKHGbmtwZFwOSa/bZnOpqrUjctL5G
         lzMpyuiDdMgpbcqQiHpuC75ulWqh6ZVC4Dh52osxHRu8Ky9btfiD7uWyilTi0BI3Sg/C
         tRzwtTzlgbvlYrMuA71smR4DkhYeOZufjTwQhqlrnAlQi10e+NWCFbJcBeaGfcSH1v9b
         ZWcSfv2L8ahxYOQiruwAxEVM3c8Ikm3wXte1XLykcCQiXBA8d+0SM8iwSg452xEuksVM
         A6lA==
X-Forwarded-Encrypted: i=1; AKwUvByThi4qCFljN5eWc3NPUrKHC01wXMUyLHxpSrtZPUbcfyiQoUMtqN5HVRBVP/Wcvv7FEXnB4H3Ax1ILEF5/Yig9@lists.infradead.org
X-Gm-Message-State: AFq9FYISUG7GKNzGx7BPccucXo/MuNeZDd842TpmgvOsT0wdKlndNJK6
	qhTRllkc+72Lu58BpQ7gt7RkHsXZ4hUg9QZmfH5k1Os81pvTfPTqvsCfr10ZX5evTnmrJaEm6Vs
	/kO2eKs0EJNA7oaYZUOvr9uKLzuJ1fhWYdN4flXci25rHfgl1oynjdD0p282yfzETkV40Y2WqqY
	sCIQ==
X-Gm-Gg: AYBFou1mfIsM2A/eIRkNBm0ghP2x8JvdNJ43zLglB0Zz3cSt/+4DCKeKhhe3ynEiSPV
	03jR3nu82wUT1OsQ/wci4h7+z3mCDw3Onp5ZsIANtRmC7qJ7OGPHeYw3u9YBrI55gexoj2mkVhY
	wgp1NbekumrLewLqDW9rKSfksVz4a1A4zakhaqZD//oi3ApAsJqvyWQcD/1OSlbrkRu9rhv4nmG
	3b4YwNSMgq0305ArTpKN9/OuWgxGr4C7kuoxKD43QtCapFx4uwHeuOixlpw98GeG9zTrGcuXKfN
	V3aa3X8kQRBxzJKGXXKnKDI9OVyu3+GXLwSROdfz4KXeSpgOPAtIP+zvQYFOMa6QZ5+4rFP9E47
	LLPMGGhoM6+TBeyliiGLQvwU+4onKuS7B
X-Received: by 2002:a05:7300:de42:b0:351:dbc:b663 with SMTP id 5a478bee46e88-3674e54a412mr3556458eec.31.1792595856419;
        Wed, 21 Oct 2026 08:17:36 -0700 (PDT)
X-Received: by 2002:a05:7300:de42:b0:351:dbc:b663 with SMTP id 5a478bee46e88-3674e54a412mr3556416eec.31.1792595855604;
        Wed, 21 Oct 2026 08:17:35 -0700 (PDT)
Received: from hu-anantiwa-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36740cc8c6dsm9142117eec.12.2026.10.21.08.17.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 08:17:35 -0700 (PDT)
From: anand.tiwari@oss.qualcomm.com
Subject: [PATCH 0/6] arm64: dts: qcom: talos-lyra-evk: Add display overlays
 for EVK board
Date: Wed, 21 Oct 2026 20:47:24 +0530
Message-Id: <20261021-lyra-display-upstream-post-v1-0-585caa39cd7c@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAITX2GoC/yXMwQ6CMAwA0F8hPdtkW2QRf8V4qFC1BmFpB4EQ/
 t2px3d5GxirsMG52kB5FpNxKPCHCtonDQ9G6YohuBC98w32qxJ2YqmnFadkWZnemEbLGI6xjiG
 eqHEBSpCU77L88sv1b5tuL27zd4R9/wCrlwP7fgAAAA==
X-Change-ID: 20261019-lyra-display-upstream-post-24656268a902
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
        venkata.valluru@oss.qualcomm.com,
        Mohit Dsor <mohit.dsor@oss.qualcomm.com>,
        Shashank Maurya <shashank.maurya@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792595849; l=2465;
 i=anand.tiwari@oss.qualcomm.com; s=20260717; h=from:subject:message-id;
 bh=/x6VoMzCsBiTnvMH8LNkojMMeM9fxxZt7W8E4IaOH9U=;
 b=AuvkK5Dy6j2wfe5kYXF/E2SbeA9MltC3kcc7mwKTrxraE7JHfYgZnPiNHnMgUDVZg3iCUQwIC
 gF1B65Jtm6ADjLInfuOs5fVdHgQ6+KRPsO/A7bpuuO2vSGgyMuKR9bY
X-Developer-Key: i=anand.tiwari@oss.qualcomm.com; a=ed25519;
 pk=ygURjl6LxwG8EhgPNHYYgCZLsaXFgWZZoHRRyud5B40=
X-Proofpoint-GUID: zmIlkUfxEW1o9zes_eMg-FEjCiJT8VQw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA2MCBTYWx0ZWRfX2FPviFZZIXyM
 wv3E3vqkbbe9LeQ/otbB0A+JtuC1E7VM8UfqOo8eWLngZ11lIbahDubVlmDhwG6Oo+VNv58GS08
 RiKfZ4ud2otyNjv2ecwuNQa8BjM/kiPC3zEgyHd0NS3K743QCLPPvp6uCusTMo+9thH2i/FLowK
 P/NYeElHjm56j+xliZUKKQBqrJ3wx5b5FBp7M40etuAEfzp/sb7iG+Ygy2z04hqGD7yO/t0+WlC
 dj49tV8yFDQWNzqO50awJNQMAhXEgeN3GLA6xRtef2uwhloWJmM8XaSXTWVfsXE9qpwg4cm6/Zq
 uGQZ4zKI7p1K/LwQL1Rf+fKbwV6tC9jUjkpK6qD/GU17g1wL+OzJd94wrFZfBay7uM2LURZWlOZ
 ryyagv0J0vHbVP+28/3ipT2gEiI9PqZx+GFxw1LTBighEoYLnDvrMZzZv6oqpt29968lfPMWe3/
 mavTWqn48GpGjobrSqw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA2MCBTYWx0ZWRfX4lWm8xeMX0ew
 Uz2f9fXq/VAVrEX8ylVvp7KvNbbvptEHQnXQ42MN5SWsRn9wAl5DsxWfN+dvwQb+AdAY9fij6vi
 u62St0rvO1Tecxc4xPOn4oV6j2nzNwc=
X-Proofpoint-ORIG-GUID: zmIlkUfxEW1o9zes_eMg-FEjCiJT8VQw
X-Authority-Analysis: v=2.4 cv=IPaXmQvG c=1 sm=1 tr=0 ts=6ad8d791 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=tMPW8O63IxkL4n0aSRoA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-21_04,2026-10-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 malwarescore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 impostorscore=0 spamscore=0 priorityscore=1501 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210060
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261021_081738_429138_CA00690E 
X-CRM114-Status: GOOD (  14.40  )
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

Talos Lyra EVK SoC card are mounted on the Lyra carrier card. The
DSI0 interface from SoC card is routed to either the 22-pin DSI
connector on carrier card named as JDISP1 DSI0 or to the DSI0_B2B
connector, through a MUX which can be selected by a hardware DIP
switch. There are multiple daughter cards designed that can be
connected to this B2B connector.

The below B2B display interfaces are enabled by default in base DTB:
  - DSI-to-HDMI using the LT9611UXD daughter card

Below overlay DTs are added for additional display configurations:
  - talos-lyra-evk-dlc0697: DLC0697 DSI panel for Lyra with DLC
    daughter card
  - talos-lyra-evk-raspberrypi-dsi-7inch: Raspberry Pi 7-inch DSI
    panel with touch via the 22-pin DSI connector for Lyra
  - talos-lyra-evk-waveshare-dsi-8inch: Waveshare 8-inch DSI panel
    with touch via the 22-pin DSI connector for Lyra
  - talos-lyra-evk-lvds-auo,g133han01: AUO G133HAN01 LVDS panel for
    Lyra with LVDS daughter card

These overlays are applied on top of the corresponding base board
DTBs.

Link: https://lore.kernel.org/r/20261012-talos-lyra-evk-v2-v2-0-dcc9316ebb59@oss.qualcomm.com
Signed-off-by: Anand Tiwari <anand.tiwari@oss.qualcomm.com>
---
Anand Tiwari (2):
      arm64: defconfig: Enable PWM_CLK for backlight PWM support
      arm64: dts: qcom: talos-lyra-evk: Add AUO G133HAN01 LVDS panel overlay

Mohit Dsor (1):
      arm64: dts: qcom: talos-lyra-evk: Add LT9611UXD HDMI bridge support

Shashank Maurya (3):
      arm64: dts: qcom: talos-lyra-evk: Add DLC DLC0697 panel overlay
      arm64: dts: qcom: talos-lyra-evk: Add RPi 7-inch DSI panel overlay
      arm64: dts: qcom: talos-lyra-evk: Add Waveshare 8-inch DSI panel overlay

 arch/arm64/boot/dts/qcom/Makefile                  |  18 +++
 .../boot/dts/qcom/talos-lyra-evk-dlc0697.dtso      |  78 ++++++++++++
 .../qcom/talos-lyra-evk-lvds-auo,g133han01.dtso    | 134 +++++++++++++++++++++
 .../qcom/talos-lyra-evk-raspberrypi-dsi-7inch.dtso |  88 ++++++++++++++
 .../qcom/talos-lyra-evk-waveshare-dsi-8inch.dtso   |  75 ++++++++++++
 arch/arm64/boot/dts/qcom/talos-lyra-evk.dts        | 106 ++++++++++++++++
 arch/arm64/configs/defconfig                       |   1 +
 7 files changed, 500 insertions(+)
---
base-commit: 1128acbf0e37fb5fe5b67d7e2494fa45905afda0
change-id: 20261019-lyra-display-upstream-post-24656268a902

Best regards,
--  
Anand Tiwari <anand.tiwari@oss.qualcomm.com>


