Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62714CF6BE5
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Jan 2026 02:10:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SIi5VrV3rslXaWv2880i0WLjLcUtjGaxHpCEiTdBYIs=; b=FJyAfZ0GjUErzkOBHIh0jvFnri
	+eUjzneqCitJwa866IvMPxTxj3J3i8C3w1s6qnAmy/+3Um0xXrKXOXsBr7P7WGb9gylGJVvwfGihX
	nueY48ZO9kosyR0YeBGZ03FQDzBR2APmAG/kM+fqUc/OmoxKkXENSPzlBPM1QbcQ/+eHivOzHhEXB
	k9n2eR/pl3mF9Png/1zioupSGgiOBrULEyEEEPDavpvHqi0IczEoce+LOT/zSjL8xHTlO534b2mUc
	8cSdLL81dDs6lAfyXo8SSNkMLDq4rFRKrS73ymUTE0Wr1zLMKh8KhdujN0SnFhD8T+R/qwWustdd9
	PnGuFDhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdJ0D-0000000E2Oy-1MoR;
	Wed, 07 Jan 2026 02:10:25 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdJ02-0000000E2Eg-3X5f;
	Wed, 07 Jan 2026 02:10:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 33E0E6014C;
	Wed,  7 Jan 2026 02:10:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BCA15C2BCB1;
	Wed,  7 Jan 2026 02:10:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767751813;
	bh=Xsi2g7wNLM/uiPYx6ZLn31xLrO1oLlCANznqRmeCMQg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=ggueNVGUEpnT6zMcO3RsSbKkbZ/gg/pSTERTBXIHAE2H80qvsPF7wH2v+IAXQSM8X
	 U+NjPMD7tI4MKeGSfLdsqKrWfTzPJNXnVPOjc8TkKSxZ/jfDUIdXVSirXUsUxjAwCw
	 Ir1TCpg1urfkuyUx/xGroQz++qrAGPagpHR4KuRroHQkLgeT2MQfmDt6M8RljHorJ2
	 TdoiaZt/QVclm0xcBlYy7HD4ovTZI2b4PP6drBfwzCxeMKBDVueQM7YK0GhZP+HsTf
	 idENZRAjmxJLy0v06Wxgxdojv0G/Z2h9jIffe0IZx8XWyTLvRpgcsNSDVTUcdknygY
	 3tAlOT56TYTQA==
From: "Rob Herring (Arm)" <robh@kernel.org>
Date: Tue, 06 Jan 2026 20:09:46 -0600
Subject: [PATCH 07/13] arm64: dts: broadcom: stingray: Move raid nodes out
 of bus
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260106-dt-dtbs-broadcom-fixes-v1-7-ba45874e4553@kernel.org>
References: <20260106-dt-dtbs-broadcom-fixes-v1-0-ba45874e4553@kernel.org>
In-Reply-To: <20260106-dt-dtbs-broadcom-fixes-v1-0-ba45874e4553@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>
Cc: devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.15-dev
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

The 'raid' nodes are not MMIO devices and are not part of a bus, so move
them to the root level. Drop the unit-addresses as they don't have any
address.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../boot/dts/broadcom/stingray/stingray-fs4.dtsi   | 112 ++++++++++-----------
 1 file changed, 56 insertions(+), 56 deletions(-)

diff --git a/arch/arm64/boot/dts/broadcom/stingray/stingray-fs4.dtsi b/arch/arm64/boot/dts/broadcom/stingray/stingray-fs4.dtsi
index cf3cb9199ce4..d704c4ab2147 100644
--- a/arch/arm64/boot/dts/broadcom/stingray/stingray-fs4.dtsi
+++ b/arch/arm64/boot/dts/broadcom/stingray/stingray-fs4.dtsi
@@ -51,68 +51,68 @@ raid_mbox: raid_mbox@400000 {
 			msi-parent = <&gic_its 0x4300>;
 			#mbox-cells = <3>;
 		};
+	};
 
-		raid0: raid@0 {
-			compatible = "brcm,iproc-sba-v2";
-			mboxes = <&raid_mbox 0 0x1 0xff00>,
-				 <&raid_mbox 1 0x1 0xff00>,
-				 <&raid_mbox 2 0x1 0xff00>,
-				 <&raid_mbox 3 0x1 0xff00>;
-		};
+	raid0: raid-0 {
+		compatible = "brcm,iproc-sba-v2";
+		mboxes = <&raid_mbox 0 0x1 0xff00>,
+			 <&raid_mbox 1 0x1 0xff00>,
+			 <&raid_mbox 2 0x1 0xff00>,
+			 <&raid_mbox 3 0x1 0xff00>;
+	};
 
-		raid1: raid@1 {
-			compatible = "brcm,iproc-sba-v2";
-			mboxes = <&raid_mbox 4 0x1 0xff00>,
-				 <&raid_mbox 5 0x1 0xff00>,
-				 <&raid_mbox 6 0x1 0xff00>,
-				 <&raid_mbox 7 0x1 0xff00>;
-		};
+	raid1: raid-1 {
+		compatible = "brcm,iproc-sba-v2";
+		mboxes = <&raid_mbox 4 0x1 0xff00>,
+			 <&raid_mbox 5 0x1 0xff00>,
+			 <&raid_mbox 6 0x1 0xff00>,
+			 <&raid_mbox 7 0x1 0xff00>;
+	};
 
-		raid2: raid@2 {
-			compatible = "brcm,iproc-sba-v2";
-			mboxes = <&raid_mbox 8 0x1 0xff00>,
-				 <&raid_mbox 9 0x1 0xff00>,
-				 <&raid_mbox 10 0x1 0xff00>,
-				 <&raid_mbox 11 0x1 0xff00>;
-		};
+	raid2: raid-2 {
+		compatible = "brcm,iproc-sba-v2";
+		mboxes = <&raid_mbox 8 0x1 0xff00>,
+			 <&raid_mbox 9 0x1 0xff00>,
+			 <&raid_mbox 10 0x1 0xff00>,
+			 <&raid_mbox 11 0x1 0xff00>;
+	};
 
-		raid3: raid@3 {
-			compatible = "brcm,iproc-sba-v2";
-			mboxes = <&raid_mbox 12 0x1 0xff00>,
-				 <&raid_mbox 13 0x1 0xff00>,
-				 <&raid_mbox 14 0x1 0xff00>,
-				 <&raid_mbox 15 0x1 0xff00>;
-		};
+	raid3: raid-3 {
+		compatible = "brcm,iproc-sba-v2";
+		mboxes = <&raid_mbox 12 0x1 0xff00>,
+			 <&raid_mbox 13 0x1 0xff00>,
+			 <&raid_mbox 14 0x1 0xff00>,
+			 <&raid_mbox 15 0x1 0xff00>;
+	};
 
-		raid4: raid@4 {
-			compatible = "brcm,iproc-sba-v2";
-			mboxes = <&raid_mbox 16 0x1 0xff00>,
-				 <&raid_mbox 17 0x1 0xff00>,
-				 <&raid_mbox 18 0x1 0xff00>,
-				 <&raid_mbox 19 0x1 0xff00>;
-		};
+	raid4: raid-4 {
+		compatible = "brcm,iproc-sba-v2";
+		mboxes = <&raid_mbox 16 0x1 0xff00>,
+			 <&raid_mbox 17 0x1 0xff00>,
+			 <&raid_mbox 18 0x1 0xff00>,
+			 <&raid_mbox 19 0x1 0xff00>;
+	};
 
-		raid5: raid@5 {
-			compatible = "brcm,iproc-sba-v2";
-			mboxes = <&raid_mbox 20 0x1 0xff00>,
-				 <&raid_mbox 21 0x1 0xff00>,
-				 <&raid_mbox 22 0x1 0xff00>,
-				 <&raid_mbox 23 0x1 0xff00>;
-		};
+	raid5: raid-5 {
+		compatible = "brcm,iproc-sba-v2";
+		mboxes = <&raid_mbox 20 0x1 0xff00>,
+			 <&raid_mbox 21 0x1 0xff00>,
+			 <&raid_mbox 22 0x1 0xff00>,
+			 <&raid_mbox 23 0x1 0xff00>;
+	};
 
-		raid6: raid@6 {
-			compatible = "brcm,iproc-sba-v2";
-			mboxes = <&raid_mbox 24 0x1 0xff00>,
-				 <&raid_mbox 25 0x1 0xff00>,
-				 <&raid_mbox 26 0x1 0xff00>,
-				 <&raid_mbox 27 0x1 0xff00>;
-		};
+	raid6: raid-6 {
+		compatible = "brcm,iproc-sba-v2";
+		mboxes = <&raid_mbox 24 0x1 0xff00>,
+			 <&raid_mbox 25 0x1 0xff00>,
+			 <&raid_mbox 26 0x1 0xff00>,
+			 <&raid_mbox 27 0x1 0xff00>;
+	};
 
-		raid7: raid@7 {
-			compatible = "brcm,iproc-sba-v2";
-			mboxes = <&raid_mbox 28 0x1 0xff00>,
-				 <&raid_mbox 29 0x1 0xff00>,
-				 <&raid_mbox 30 0x1 0xff00>,
-				 <&raid_mbox 31 0x1 0xff00>;
-		};
+	raid7: raid-7 {
+		compatible = "brcm,iproc-sba-v2";
+		mboxes = <&raid_mbox 28 0x1 0xff00>,
+			 <&raid_mbox 29 0x1 0xff00>,
+			 <&raid_mbox 30 0x1 0xff00>,
+			 <&raid_mbox 31 0x1 0xff00>;
 	};

-- 
2.51.0


