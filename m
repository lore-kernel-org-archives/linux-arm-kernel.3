Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EA1ACCF2C4
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 17 Oct 2026 20:00:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DbUAi5s/epbEJq7KS/lY4NQVfKPrOJvYNdVByS66PKY=; b=xRWo2KM/9dnIondXJu8n+bJz2M
	easutdMUKI3D44H5SffKAMTZV5XgAQZkkRVrMqhtUGNBJWqtZ18ai7Q3gHXtCciO8OMXUlF2iDr2p
	mwJe6iOogXuVzHflQXXOw2L6PZ19hsaIHkdIeU7dihR+rLuzggas/IZ7vokxiYc46x6mRr7s3UbuW
	a+BAtWDsnL0zzcZOhdTLbx3uUu+IaH/Yb/YhJBF6/Ij+oQpvKSsVKcHSdzJ/uTCgRutGS4vOcqmZT
	CUl4mUE5vaasNQ+edqFOvyX5KJ/KbMJtpbscsFyM+I02MwD7bcEZZ3QEQ9WjhVv+HlKf8CWVjO3+d
	K6warutQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIAZY-00000005Bwn-01KD;
	Sat, 17 Oct 2026 20:00:04 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIAZM-00000005BpK-2FSK;
	Sat, 17 Oct 2026 19:59:52 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 18296438D6;
	Sat, 17 Oct 2026 19:59:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB1F21F000C5;
	Sat, 17 Oct 2026 19:59:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792267190;
	bh=DbUAi5s/epbEJq7KS/lY4NQVfKPrOJvYNdVByS66PKY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=PqkznLIJCUf3aiCsH3od2cjrFcuYF1sKoNM0n3y+p5Vn59j3DhF1bQJN722hEz1hm
	 scD72/3W3DbXFCr/KB1DQE/f8VVCimE1brZFEToNbxeMXaqounRRaZpYtMnzekNbZ+
	 qiHkhSWn/aerE6aGVNIn1HqZJOAeGq2usBGjDIXwn/hnNstcMI2xDPi9SCTV8wJ0jP
	 UpBudZnnOvnVc4s8TgNZHLD25k/BPhrEcvp0WVfTskQmknCTlkwVMfnIkkpWuvYvvW
	 ZFV+KU/JB0OLHwV6U/vKUxf4wGtlO7BmfiZLS1MFlT0rhT9JKqfa6TSCjX5y9W46tL
	 tEw5CIxQqCD8w==
Received: by venus (Postfix, from userid 1000)
	id E9D19182317; Sat, 17 Oct 2026 21:59:47 +0200 (CEST)
From: Sebastian Reichel <sre@kernel.org>
Date: Sat, 17 Oct 2026 21:59:32 +0200
Subject: [PATCH v2 3/4] arm64: dts: mediatek: Use DP AltMode defines
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261017-dp-altmode-dt-defines-v2-3-7ab3d93553dd@collabora.com>
References: <20261017-dp-altmode-dt-defines-v2-0-7ab3d93553dd@collabora.com>
In-Reply-To: <20261017-dp-altmode-dt-defines-v2-0-7ab3d93553dd@collabora.com>
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
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2181;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=lUWUiSLI+YaFT7aEtcEk5a+91BYCmCkb6yEWgXVYoFs=;
 b=owEBbQKS/ZANAwAKAdju1/PIO/qaAcsmYgBq09OzU56kAruS6XH0jeUVOAsXX0VLgpNj5JSHK
 TZVTFgyYnyJAjMEAAEKAB0WIQTvZg0HRj+Lcmp5VBPY7tfzyDv6mgUCatPTswAKCRDY7tfzyDv6
 mkXlEACmVA3ZqhwfxxThU1282lKcVyJooXjrqqZrIx0zBsXregypnVdsN3QUWXo9WGQBLkWAqBH
 9n9T3BxGtf0ivOuNYjGq3qetzjqqxGxZm+pN1bdkIQShZ7NhQMvNWekSTQc7ZQezfYjeapFir2E
 6NS9jLOYn05IMOZrqX2ZrhcUXaJyarHB5aW9lUyMm0UM1MXMif/G6TUuAE+4PbtSaoU00g1YdsU
 JUDaP4flajSKmAeTjIOIkny2vO/S1JP4kWrtKzx42aCU7mlSMNQyyn195f1M9ov8FiJAoUhu7qP
 b8e2ivINP7lvRdvOgRK6N4unwuWueKZDg2+xHnZBvgIGDylH6ttfi94CrnNdOVUUUYGH5VsqX62
 Dc4KxKXqPXsIx4KxasHkd8JrCxm5DoPBVLsugYDOk740Lta0J1LfjA4xRLqj7cznWfpujDooZFI
 gfGazSbrWiQcyfCjXuHv0jdXOPzGx9yxRIb4esu1kSd55sYsVSbFe7WZUZ3p6V5c5RIZF1/Q8T+
 aca8E5j0hhsS0Vd6B8jiIsFks9MKgkS9Te/6KsirWmAVMUdIosNrJxTe4J4z6gjpioYc0GPAy1H
 bKok3pp7VEjpQuzzjmI+zEzmXkUk5rscgZigP5CS88XaHWZvil/6rcBlRPYHuHvlPn8BcgWUXKo
 AtooJmxK93tXGtA==
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
VDO to make the DTs more readable. This also fixes up mt8390 Genio
platform incorrectly announcing UFP_D (upwards facing) support. This
feature is unfortunately not supported by the SoC.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi |  8 ++++++--
 arch/arm64/boot/dts/mediatek/mt8395-genio-common.dtsi | 10 ++++++++--
 2 files changed, 14 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi b/arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi
index 669eaec662f3..9f75ae3c32d2 100644
--- a/arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi
@@ -527,8 +527,12 @@ PDO_FIXED_DUAL_ROLE |
 
 			altmodes {
 				displayport {
-					svid = /bits/ 16 <0xff01>;
-					vdo = <0x001c1c47>;
+					svid = /bits/ 16 <USB_SVID_DP_ALTMODE>;
+					vdo = <VDO_DP(DP_CAP_DPAM_V2_0, DP_CAP_CABLE_TYPE_PASSIVE,
+						      DP_CAP_UHBR_13_5_UNSUPPORTED,
+						      DP_PIN_UFP_NONE, DP_PIN_DFP_C_D_E,
+						      DP_CAP_USB2_USED, DP_CAP_RECEPTACLE,
+						      DP_CAP_SIGNALLING_HBR3, DP_CAP_DFP_D)>;
 				};
 			};
 
diff --git a/arch/arm64/boot/dts/mediatek/mt8395-genio-common.dtsi b/arch/arm64/boot/dts/mediatek/mt8395-genio-common.dtsi
index aef908df530e..d41638e74291 100644
--- a/arch/arm64/boot/dts/mediatek/mt8395-genio-common.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8395-genio-common.dtsi
@@ -597,8 +597,14 @@ PDO_FIXED_DUAL_ROLE |
 
 				altmodes {
 					displayport {
-						svid = /bits/ 16 <0xff01>;
-						vdo = <0x00001c46>;
+						svid = /bits/ 16 <USB_SVID_DP_ALTMODE>;
+						vdo = <VDO_DP(DP_CAP_DPAM_V2_0,
+							      DP_CAP_CABLE_TYPE_PASSIVE,
+							      DP_CAP_UHBR_13_5_UNSUPPORTED,
+							      DP_PIN_UFP_NONE, DP_PIN_DFP_C_D_E,
+							      DP_CAP_USB2_USED, DP_CAP_RECEPTACLE,
+							      DP_CAP_SIGNALLING_HBR3,
+							      DP_CAP_DFP_D)>;
 					};
 				};
 

-- 
2.53.0


