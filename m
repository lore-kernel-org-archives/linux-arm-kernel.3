Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C3DC60A260F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Oct 2026 09:40:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=nceKzGl9;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=V9QdXPMo;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=aZiG/C3B
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=CfivT7f6AzXhM+eASp8z6BDLEz8vb+/X/mhHCdqRcYc=; b=nceKzGl9MHM4cuLgslEoEXsio8
	Vyyxqp3YfcMDTDA91sxI+AgjVCUIrehKmwczeCsQWK2HG4JnnDPQPjNLSs9t6dEIeOdp7Qa7XnkoB
	xoDCaNUmgzksMyWhpRkCD3yh8Lc1PuMgyEHYuSydEaex84hmOE5Jhz1FOzhselIA2LmpBWepCletQ
	Xr1K8hEEyxdaJHW0l18eHOvD4cqLefLFWIjieJCJS8bcWPqrg2x3Wscp++ZgMxd6aFmUUUfhEjNa+
	0UwUS2tTaWhQ2jviNzkW9x1xRRd94LpRtxggJsS6ZWrAwMLtQMRBx1JsQbA5a7f6QSDey/r/yeK22
	e0NYwZgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMj5w-0000000BG1U-1La5;
	Fri, 30 Oct 2026 09:40:20 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMj5t-0000000BG0R-2dbZ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 Oct 2026 09:40:19 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69U8F0vY1119732
	for <linux-arm-kernel@lists.infradead.org>; Fri, 30 Oct 2026 09:40:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=CfivT7f6AzXhM+eASp8z6B
	DLEz8vb+/X/mhHCdqRcYc=; b=V9QdXPMonMVn/SqgE8m+cs9R/C92q2Z5sFW4+Z
	PO4V9mpFxa+SsfWMNijM4lGNQKgGT7fxVvrEsP/Mtvsre3X9MRgklJiz3BZNSiq/
	eNWKN/JlZ/FSn6yTWrpHZE5x/GHbQNfDLsg/b5Du79hXUe5Xh+ozuTMzG98L752m
	A10fXKAXPutguijTR+9XVtD1ArOcMZ0sltvmmSr7HXh/mLC2fvNFX6jCrULMKlVR
	4ahr/KebIP1ADrDpnZFPaoPxvEPBnXZ7EdbUUKkwgIea70kEzdO1XZfbMJ9iWBe7
	Rpl+Fj09LqGjPbZGK+hcz8q1IFcnyJOtPOR1xfBEwCoV/8KQ==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hme6pj8h7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 30 Oct 2026 09:40:16 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-35c5aef2a74so2453965eec.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 30 Oct 2026 02:40:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793353215; x=1793958015; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=CfivT7f6AzXhM+eASp8z6BDLEz8vb+/X/mhHCdqRcYc=;
        b=aZiG/C3Bqx+w4kp8qEEgJLgNX5eiQ6iYO2ECBftkgivc9Rrj9PpMIbuXiDZdQpfPvX
         w+w63jIILEiNd9tPZUwtMUhbo6t5wTUgwLM1QtLl2ioNzoH8Ic0D/dYXGuUKFG/Nto+6
         bStYzEuHWQd6N3sxAWhAUhwsjCMQGG0T48SCTrFfz37Qiy85HRbA6apyp89hbIGGzPAT
         GLqPaXM/Fja7p5E6dWA0yR00O+0VneD354eH+nDXntKKQu1/OO5mI0o3QYCMS5DesBvp
         nTVIFcWJsaJqLv5wwr6Tdy4hgmnkC/xGDPjMKyONR0+ss64C3tj2kfeVd6+0WkETjnKL
         tN5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793353215; x=1793958015;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=CfivT7f6AzXhM+eASp8z6BDLEz8vb+/X/mhHCdqRcYc=;
        b=PM53jpgLqZ28JjhefMD5v6RBAU/tvQAuQ3h8bjzIL352hmgUpcrkOqo5auz9EabO0Y
         Xs/5sX5bM56cjjYdVWiFM3Lf99j++EIwH8MjY7Obi+D+o95dv10jOaILt5ENYuGFX3Gj
         Le8bM2YXB09jI+ZGQZPTzrhR4I3oBm4jNOeho7zpJGij6pHtvshWMV5wcO8vX9FpMgWe
         WrTU6W5xlDyn33qXhkfBd0130uhMjCHCq19AjupOcvO3w2fvxPSwohvqBXLuesHVguTV
         J2igsHJyAP86olyiDJI9FGi458hm2wKbjyHfJ2FSK04xQqxm6Mh6wTDsf0487oxciOwb
         ADAg==
X-Forwarded-Encrypted: i=1; AKwUvBxPjOTZeNjPXRQf2E5C/G+o1Ap64uNIUKTXzEtzdaN9OcHH9zPTnuYfLYbk1fDM3TKCR7qldB/Z6WJC5/fHcpla@lists.infradead.org
X-Gm-Message-State: AFq9FYJ2gmjTYsziz/eQ+waHph3I71VlCWNME405Y4un56gSjJ+ade0h
	w3QchmxfE0uzp37e5lxgVUWimXlEtiW4UHu7XmVVxgw0O88R3/9+sleGcFlAWHTtKAv9YHfkVuz
	Fsp4ae6eeXhcvUW39K4dNs9pBPAvwHnPfFkwNduB0pMduDvg9A1toWyWQ/XXP9ahsIu3urvehOw
	BVanG0rZJ5sg==
X-Gm-Gg: AYBFou0KD+THfDg1w54qNEhAZqz5XCXTP3HUZEYDnr7ljiPMX8Os5VKGhoZ1thJFsQ+
	aks87hWgRsSmompggAJBp4yxe/7mP5QJnjbirSnm8lPc7mroSKBw1PCEi1GlpZCEgvEMO7yusGh
	Ss4Al0tUt5DwI5q0+efrXKwF5PoUddSy/6TjyoqdFtz4HB2muwjAt3iUlPl1ncLGKZD0ADmJ9CI
	d6zwt38Y0FPnAyN2vEeqAUwzh/0G6WuLLiW4Wc/6AjStdxWfaEq8BSvu5J2XJeNDuIiKFPaVLjB
	laaGaXESPT/ADGWQYks8q1uxaeqjDqO1YJ4SfAOYfXzIRptq1BdL9/8iFEPFFO3ny9m8e+mYB9p
	9J0BSzqxftvaGbnQHihtpNUkZD/Lm2XTkL+ZlRj5NZqECs/TCozHDE8K3gjY9NBcztXVvqNAt2l
	yuXA8L
X-Received: by 2002:a05:7022:258a:b0:18c:e014:6f1d with SMTP id a92af1059eb24-1ac55f2d3cemr3037956c88.1.1793353215220;
        Fri, 30 Oct 2026 02:40:15 -0700 (PDT)
X-Received: by 2002:a05:7022:258a:b0:18c:e014:6f1d with SMTP id a92af1059eb24-1ac55f2d3cemr3037909c88.1.1793353214643;
        Fri, 30 Oct 2026 02:40:14 -0700 (PDT)
Received: from hu-anantiwa-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac193b8179sm6723418c88.11.2026.10.30.02.40.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 02:40:14 -0700 (PDT)
From: anand.tiwari@oss.qualcomm.com
Subject: [PATCH v2 0/6] arm64: dts: qcom: talos-lyra-evk: Add display
 overlays for EVK board
Date: Fri, 30 Oct 2026 15:10:04 +0530
Message-Id: <20261030-lyra-display-upstream-post-v2-0-906302159392@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPVl5GoC/32Py2rDMBBFf8VoXQVLtl6mlP5HyUKPSaPWjh2Nb
 BpC/r1ynF1DN4IrhnPuvRKEFAFJV11JgiViHE8l8JeK+KM9fQKNoWTCay5ZzQztL8nSEHHq7YX
 OE+YEdqDTiJnyVgrJpbam5qQApgSH+HOHf+y3jLP7Ap9X4npxjJjHdLnbF7bePUSc/SdaGK2p0
 MJb2xgflH8fEXfn2fZ+HIZdecj+tgkTnOcyKm8tyACI9j6qq14fKkWz7UfchLB804XTpSkGKfQ
 hCKvAG/PH8Lb2f4YrzbORjHm6qNJUF1BrlHam1UYe2HOQswh0/Ym5q1pwXGjpQlsHx1VQynvhF
 G+9NY2WEGqvWBBNGXn7BTlKlnbBAQAA
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
        Mohit Dsor <mohit.dsor@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Shashank Maurya <shashank.maurya@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793353209; l=4288;
 i=anand.tiwari@oss.qualcomm.com; s=20260717; h=from:subject:message-id;
 bh=l/KjP8oydKHmymn+QMM/p6UUas/pmtAZFnZX0nIpC0U=;
 b=YTU8fsSxpHE/c9kAWWkPTH9oSzsXwF4O5t1mp/6y1PgZVzm94C+fbfsPYgl3FGyXuIPET9MAE
 cvwjUbScDIYBe2NYIKbW1fld7t7ifBzj9HHSoFOrBHKZ8u7s7hQVRKI
X-Developer-Key: i=anand.tiwari@oss.qualcomm.com; a=ed25519;
 pk=ygURjl6LxwG8EhgPNHYYgCZLsaXFgWZZoHRRyud5B40=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDAzOCBTYWx0ZWRfX+5gxBcOZ8ihd
 b1BMoSyYs/XSvrCBr7mcoaU7nvgv9K8m4gKJccTiPBnBD8Ue7b1hSyy9W66LtX7n7wc3lArUTH+
 F4Kmq1I02biZyxOZeChSVzwYLrNZuZ/+tO2P6vMsPZDlsq6Yfcu31iiSHXCTvMwweXfuzIACf4n
 65cGgbtW9Vwrat9JLNnQL4m2DFASKyYxFK+ZCPacrAnDZRNQddK9gag8YsQlKs0Btl2vk70Fxs2
 7NLNoCTMiEoNseJyivShK84k6iJkoPKxnaUV/iFHd8bNjS2lGXHYVgjxdqoYA8c0x9uyMHarPPp
 xdFRfvsycoVlcrnIw8DW3lXhcfAqj5UpHk8gb11r3IQPrm/83Z6DdCWZOiqWylcqJdZ0Ghqll8+
 GWIaWwUmRevJTfuFpU92lNBYE728UrP4dqlznf0hMry6rQteaeLEPUv/5GLoaIPV6XuT3ds6ARw
 DajzIOC4KY8IJ7rbQaA==
X-Proofpoint-ORIG-GUID: 0KamaTUJi7q6HnviL_Ktqy7ayjLgwU2S
X-Proofpoint-GUID: 0KamaTUJi7q6HnviL_Ktqy7ayjLgwU2S
X-Authority-Analysis: v=2.4 cv=AJ83otAg c=1 sm=1 tr=0 ts=6ae46600 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=bC-a23v3AAAA:8 a=Q-fNiiVtAAAA:8
 a=JfrnYn6hAAAA:8 a=X9uYJ1hcyrHnrYopOo0A:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22 a=FO4_E8m0qiDe52t0p3_H:22 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDAzOCBTYWx0ZWRfX/gkZSri5Iucs
 Rq9de6LtA0AZiC+4A1Ejqw7Zov8VShto841Gakoc4mPl0641G8ereW+zuOrTDB7yMjYJqmTklod
 SaUOpWBDALwMGerRQ2EtN+J3Xxdc/Wk=
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
X-CRM114-CacheID: sfid-20261030_024017_679605_FBA84173 
X-CRM114-Status: GOOD (  15.97  )
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
Changes in v2:
- Fold in the hdmi_connector port remote-endpoint indentation fix.
- Drop the per-patch Depends-on trailer on the LT9611UXD HDMI bridge
  patch; the dt-bindings dependency is now declared as a series
  prerequisite (see base-commit/prerequisite info below).
- Drop default-on from the DLC0697 backlight node.
- Add the ilitek,ili9881c fallback compatible to the RPi 7-inch
  panel overlay to fix a dtbs_check "too short" binding failure.
- Reword the PWM_CLK defconfig commit message to name Qualcomm as
  the SoC vendor.
- Remove a stray blank line and non-ASCII characters from the AUO
  LVDS panel overlay.
- Link to v1: https://patch.msgid.link/20261021-lyra-display-upstream-post-v1-0-585caa39cd7c@oss.qualcomm.com

To: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>
To: Abel Vesa <abelvesa@kernel.org>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Florian Fainelli <florian.fainelli@broadcom.com>
To: Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: linux-arm-msm@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-rpi-kernel@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org

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
 .../boot/dts/qcom/talos-lyra-evk-dlc0697.dtso      |  77 ++++++++++++
 .../qcom/talos-lyra-evk-lvds-auo,g133han01.dtso    | 133 +++++++++++++++++++++
 .../qcom/talos-lyra-evk-raspberrypi-dsi-7inch.dtso |  88 ++++++++++++++
 .../qcom/talos-lyra-evk-waveshare-dsi-8inch.dtso   |  75 ++++++++++++
 arch/arm64/boot/dts/qcom/talos-lyra-evk.dts        | 106 ++++++++++++++++
 arch/arm64/configs/defconfig                       |   1 +
 7 files changed, 498 insertions(+)
---
base-commit: 4eb2586bd40db27d77cc5b724ca9386ed0c71d53
change-id: 20261019-lyra-display-upstream-post-24656268a902
prerequisite-message-id: <20261027-talos-lyra-evk-v2-v3-0-658fd5a7ec99@oss.qualcomm.com>
prerequisite-patch-id: 0dfae1e9d0c620866489eecacb4b7201b9333621
prerequisite-patch-id: 94923ba8f57911649364a7e0e5494c7cfd478367
prerequisite-patch-id: 660755293839baa7364b4baf3a2dd6b4018de48a
prerequisite-message-id: <20261021-lt9611c-v7-v18-0-4978b94896f1@oss.qualcomm.com>
prerequisite-patch-id: 49f1e01bb5594ce9c4301ce4b16715834ece7f41
prerequisite-patch-id: 21cfbbfd71515961501a768edad476740336c13c

Best regards,
--  
Anand Tiwari <anand.tiwari@oss.qualcomm.com>


