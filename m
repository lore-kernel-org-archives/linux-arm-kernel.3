Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79500CC6B2E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Oct 2026 21:32:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vli4XWkCGgE+k+Bp7PajRgTaGj17Lg4tJrd8O22L1MA=; b=MzjfxoQUGGopeLbxSNOyhlJg6y
	Xs5YtMIlW5hKaJIC+OyxosIQm9aH5dA7c55U0yoeWZpREg+Dy9DwDTVaWf84bYkTW/XX3yknrDJXD
	BA2lIUWPi1oPBppAF9zQDJP3oqBmkup3BIcQEHBLBq18EgDUH89tiRhZI0SpM+BeCmiVyQXxjaUUL
	ctwoFR1LtjxdYDCgIEaJci+nrT52/WE9rfTzreQ8V2hoT5M8asGeoDKWFybdFO8AB7VQC0gYhTggp
	hhm2ciwuFTsBBXy8h7EgqgoJg5Bs6+Rpwci6k0kYDILQPvNlNOb+NU6jOCiRe8RTL7RIjwMLcfZY5
	03ER50Dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xH6Zz-0000000GKVd-2xxe;
	Wed, 14 Oct 2026 21:32:07 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xH6Zx-0000000GKUK-3PlN;
	Wed, 14 Oct 2026 21:32:06 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id E18B660230;
	Wed, 14 Oct 2026 21:32:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F6631F000C5;
	Wed, 14 Oct 2026 21:32:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792013524;
	bh=vli4XWkCGgE+k+Bp7PajRgTaGj17Lg4tJrd8O22L1MA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=Gg7xzYci6dE6NvCUlsdbYHcGCbGqLqtFTrvhHjOuK7pyPaPRKmpl9s9Bpp+UeDvaW
	 5FitQOsLJYiWtr53spW33Le//5yhjGEtC3SNHTDtOpKaAgb9gaVtzdTB1/utlX0Zcf
	 IAHH6FaUAarKp20UCKaSy+YcV/wuQDXPq25ZzUbXkjD6alFBC7vk6GOH9upCUYL7Cq
	 NXj1z1NRNGpopMkuj6nnYit1vIl3H6d2yQinSlf8Y7W1n9u32iA1pbWbTgxiJVFNuL
	 /K1lWWsG43I1UO/6jSckokidTe75ULeLibFVxVTGKiqFehHKUsafdBwt2FpW/UWjZj
	 5AG5PrOVtwKqQ==
Received: by venus (Postfix, from userid 1000)
	id 70E1D181256; Wed, 14 Oct 2026 23:32:02 +0200 (CEST)
From: Sebastian Reichel <sre@kernel.org>
Date: Wed, 14 Oct 2026 23:31:52 +0200
Subject: [PATCH 4/4] arm64: dts: qcom: Use DP AltMode defines
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261014-dp-altmode-dt-defines-v1-4-b657c9b6e4c3@collabora.com>
References: <20261014-dp-altmode-dt-defines-v1-0-b657c9b6e4c3@collabora.com>
In-Reply-To: <20261014-dp-altmode-dt-defines-v1-0-b657c9b6e4c3@collabora.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-arm-msm@vger.kernel.org, kernel@collabora.com, 
 Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1760;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=FNkZ2ecgtAZu035MahbG+CkbV9GSNyIveV9yT//RHgc=;
 b=owEBbQKS/ZANAwAKAdju1/PIO/qaAcsmYgBqz/TSLz4dULI0PmDmsCpwfPt9dmMUXuu4VNKi1
 ulOIwVMoiuJAjMEAAEKAB0WIQTvZg0HRj+Lcmp5VBPY7tfzyDv6mgUCas/00gAKCRDY7tfzyDv6
 mnawD/9EjsxdoO7IEhSYuKYaie84j6N16zaWLa9H0gBWVY+CCxKFYRn1xjEdpDuXBTa5GNl3mfT
 mCECi7BHbshUeyq5N5E5pC/deRzsTtKtx8z/rFyshkkQCBtBxoJLODxCzlWAnmrsXxPR8YKmP6Q
 w0Y1llhNLcGvmusQbCXmlqBUhbp5VomfmOKOQwiZpxAOT0JL6dHkyuxukXa/ERq1MPQNFdRFr2r
 M0tc9HKZAMXg6r6d8ykD3pa/mSspMqrHM+e2nCVmQ3LD1k0sTkPYj8GYt4s6azirHD5/4+lxar2
 qgMKXi5VqjILPW3nvE08jfNVW4MMx3rVfppw3Fj9EnxOIKlSInFBSPLxwtc2fo6tEwuFEXAXRjq
 U6xiOv4/cEDgwWPAuWFQyioXuMGnug64m1zvM6dE7+yp3DvPQ8+Wp70yj/F7yrxd7xKFA3V0PBD
 s93VikuMLVySm/qwR5DKE/s+hHz4FtBN8fLeD8om94C1Bl2LaKDS2YQ7rUSLt858qq1cM1RMa0k
 anld6cdvFw8/abiG+EiLep7sQIG3sYGuNZp/sthe9XmY7j3Ej5sbxFCC9e41XZzQSwXddAw3JNT
 umhQXh9+bmTpkzTCRlktme1yZQkq/uJ/WTBk85BGqeXQvzz/VTpHjIzQBHCFPX7FjRtajCJpIB6
 1LN+8eUqwjMQgTQ==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
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

From: Sebastian Reichel <sebastian.reichel@collabora.com>

Use the new USB-C DP AltMode defines for the SVID and the capabilities
VDO to make the DTs more readable.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 arch/arm64/boot/dts/qcom/qrb5165-rb5.dts | 8 ++++++--
 arch/arm64/boot/dts/qcom/sm8150-hdk.dts  | 9 +++++++--
 2 files changed, 13 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts b/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
index d6af679abe1a..d21b94e872ce 100644
--- a/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
+++ b/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
@@ -1508,8 +1508,12 @@ PDO_FIXED_USB_COMM |
 
 		altmodes {
 			displayport {
-				svid = /bits/ 16 <0xff01>;
-				vdo = <0x00001c46>;
+				svid = /bits/ 16 <USB_SVID_DP_ALTMODE>;
+				vdo = <VDO_DP(DP_CAP_DPAM_V2_0, DP_CAP_CABLE_TYPE_PASSIVE,
+					      DP_CAP_UHBR_13_5_UNSUPPORTED,
+					      DP_PIN_UFP_NONE, DP_PIN_DFP_C_D_E,
+					      DP_CAP_USB2_USED, DP_CAP_RECEPTACLE,
+					      DP_CAP_SIGNALLING_HBR3, DP_CAP_DFP_D)>;
 			};
 		};
 
diff --git a/arch/arm64/boot/dts/qcom/sm8150-hdk.dts b/arch/arm64/boot/dts/qcom/sm8150-hdk.dts
index cdced5c848d3..3d83dd305954 100644
--- a/arch/arm64/boot/dts/qcom/sm8150-hdk.dts
+++ b/arch/arm64/boot/dts/qcom/sm8150-hdk.dts
@@ -581,8 +581,13 @@ PDO_FIXED_USB_COMM |
 
 		altmodes {
 			displayport {
-				svid = /bits/ 16 <0xff01>;
-				vdo = <0x00001c46>;
+				svid = /bits/ 16 <USB_SVID_DP_ALTMODE>;
+				vdo = <VDO_DP(DP_CAP_DPAM_V2_0, DP_CAP_CABLE_TYPE_PASSIVE,
+					      DP_CAP_UHBR_13_5_UNSUPPORTED,
+					      DP_PIN_UFP_NONE, DP_PIN_DFP_C_D_E,
+					      DP_CAP_USB2_USED, DP_CAP_RECEPTACLE,
+					      DP_CAP_SIGNALLING_HBR3, DP_CAP_DFP_D)>;
+
 			};
 		};
 

-- 
2.53.0


