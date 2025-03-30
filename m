Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58F53C28B20
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 30 Mar 2025 12:26:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WwJhni5/5Bwr5fJgMYHBreJV2sFccs1GFIX3R6qhvEw=; b=lLS/NW1bpI5tU7wUer0yjnTFgB
	ZnoDFNEFMhjTink8FeW3NdV0Dl7RqJnfaP2oFzrxEvJCR07mo38Gx50+1gce7oPfqzUzT/6P64aJ5
	bzXxcUp7GEgtSEM3XoNfifpIQBP8jnQbNJK4Uqa+2sXaiMTlwFx7Pec1ADQVwJx9P6lYdSHDKEtWV
	NiKMqmFkbvKA7g2fVaGewtYy/XFCVjFa+SivTUjcUDAMkDg1jWHQgeQUcymftJKUVb3MHzs8wf8bA
	8SsovTxdMlCir0r705DrA5LEUm5/xF3SG6tblvGH8Wb/+/Umy8wu5tLi/T1C96S+bWWnRz35eCDsu
	z8xJe9oQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tyrk8-0000000GCPm-1JT6;
	Sun, 30 Mar 2025 12:26:24 +0000
Received: from zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tyrYY-0000000GBDZ-0er2
	for linux-arm-kernel@lists.infradead.org;
	Sun, 30 Mar 2025 12:14:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=WwJhni5/5Bwr5fJgMYHBreJV2sFccs1GFIX3R6qhvEw=; b=FA6g00
	eW0oW5XhVpYFDk3DaLerrM1NuDMRoUdNvMJQS0EHbscumIPDsjfBkshE3SYIncfm
	CiltdblvvlqgB8CYZjxBao7Zw9ghF2/EPizCV+PIA6irjGsi+gFbk0c9LnHMW+B0
	RudyMP3WHYb0LMW0ole/SqroAT/AzDfW89JWykLDMvdD8w1rsyIihIUfnzde9Qie
	EzWC+pMvKt8M/MY+P6pq8maJTqr9F/h6NdhIvS/3HZlzOlDtjlg6kUJC5aomD6CX
	XgvNMnacaa4lQvEwVZSSibRnBMxCkbuMLZCX1scf5vAAg/uik0rFDRKaHPmZfG7p
	Mk8VhSDk+EI7n2Fw==
Received: (qmail 855931 invoked from network); 30 Mar 2025 14:14:24 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 30 Mar 2025 14:14:24 +0200
X-UD-Smtp-Session: l3s3148p1@cmCAPo4xgExtKjBa
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Alexey Charkov <alchark@gmail.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org
Subject: [PATCH 5/5] ARM: dts: vt8500: fix faulty ohci/ehci node names
Date: Sun, 30 Mar 2025 14:13:28 +0200
Message-ID: <20250330121326.9069-12-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250330121326.9069-7-wsa+renesas@sang-engineering.com>
References: <20250330121326.9069-7-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250330_051426_468298_FE2770DB 
X-CRM114-Status: UNSURE (   9.41  )
X-CRM114-Notice: Please train this message.
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

They should be named "usb@".

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 arch/arm/boot/dts/vt8500/vt8500.dtsi | 2 +-
 arch/arm/boot/dts/vt8500/wm8505.dtsi | 2 +-
 arch/arm/boot/dts/vt8500/wm8650.dtsi | 2 +-
 arch/arm/boot/dts/vt8500/wm8750.dtsi | 2 +-
 arch/arm/boot/dts/vt8500/wm8850.dtsi | 2 +-
 5 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/arm/boot/dts/vt8500/vt8500.dtsi b/arch/arm/boot/dts/vt8500/vt8500.dtsi
index f23cb5ee11ae..09f5ed3e6821 100644
--- a/arch/arm/boot/dts/vt8500/vt8500.dtsi
+++ b/arch/arm/boot/dts/vt8500/vt8500.dtsi
@@ -109,7 +109,7 @@ timer@d8130100 {
 			interrupts = <36>;
 		};
 
-		ehci@d8007900 {
+		usb@d8007900 {
 			compatible = "via,vt8500-ehci";
 			reg = <0xd8007900 0x200>;
 			interrupts = <43>;
diff --git a/arch/arm/boot/dts/vt8500/wm8505.dtsi b/arch/arm/boot/dts/vt8500/wm8505.dtsi
index d9e1280372c5..c81810b967bb 100644
--- a/arch/arm/boot/dts/vt8500/wm8505.dtsi
+++ b/arch/arm/boot/dts/vt8500/wm8505.dtsi
@@ -207,7 +207,7 @@ timer@d8130100 {
 			interrupts = <36>;
 		};
 
-		ehci@d8007100 {
+		usb@d8007100 {
 			compatible = "via,vt8500-ehci";
 			reg = <0xd8007100 0x200>;
 			interrupts = <1>;
diff --git a/arch/arm/boot/dts/vt8500/wm8650.dtsi b/arch/arm/boot/dts/vt8500/wm8650.dtsi
index 35d12d77efc0..555008120a3e 100644
--- a/arch/arm/boot/dts/vt8500/wm8650.dtsi
+++ b/arch/arm/boot/dts/vt8500/wm8650.dtsi
@@ -179,7 +179,7 @@ timer@d8130100 {
 			interrupts = <36>;
 		};
 
-		ehci@d8007900 {
+		usb@d8007900 {
 			compatible = "via,vt8500-ehci";
 			reg = <0xd8007900 0x200>;
 			interrupts = <43>;
diff --git a/arch/arm/boot/dts/vt8500/wm8750.dtsi b/arch/arm/boot/dts/vt8500/wm8750.dtsi
index b292f85d4e69..309f6e5129fb 100644
--- a/arch/arm/boot/dts/vt8500/wm8750.dtsi
+++ b/arch/arm/boot/dts/vt8500/wm8750.dtsi
@@ -251,7 +251,7 @@ timer@d8130100 {
 			interrupts = <36>;
 		};
 
-		ehci@d8007900 {
+		usb@d8007900 {
 			compatible = "via,vt8500-ehci";
 			reg = <0xd8007900 0x200>;
 			interrupts = <26>;
diff --git a/arch/arm/boot/dts/vt8500/wm8850.dtsi b/arch/arm/boot/dts/vt8500/wm8850.dtsi
index c61717ebb4f1..3f4a514d65e2 100644
--- a/arch/arm/boot/dts/vt8500/wm8850.dtsi
+++ b/arch/arm/boot/dts/vt8500/wm8850.dtsi
@@ -238,7 +238,7 @@ timer@d8130100 {
 			interrupts = <36>;
 		};
 
-		ehci@d8007900 {
+		usb@d8007900 {
 			compatible = "via,vt8500-ehci";
 			reg = <0xd8007900 0x200>;
 			interrupts = <26>;
-- 
2.47.2


