Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96CFEC61CE8
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Jun 2025 20:40:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=HAUEi/41KnReRsulb+HDrztyfSA7vWns3JFO7b+pFLM=; b=MOfhpZemU1/DLxykn4Q2jDAyg4
	mEX9qGEculm84+XT81mNA0FViA4U+WHVuP07X42aENnYb0oMoPILxMlZ7D8p3DEowqIELYz2I69O6
	QHO8V0D9RnkR9Fnm1Vi/tI2HVcR+ECHCTbRLf5ifYzudIjv5a8KDLgM/UsBUlp1xUNQM4qQlhwFVr
	SdOpIzXtFPrNJtqVDAixI1NtiYQQ9XHKggmlt7nZsqZP41MRD63ZzZPNcNPyKMaZbuWZGRp6gZo6s
	psxQXwwRczYWwJeZ3CGpP6jy485D1A20RY9DBnie8q+TS0JrPqjWQQzU6Vcj47cVWCMmlLTkcNbsp
	emxJmKkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOjHZ-00000005AlH-22wb;
	Mon, 09 Jun 2025 20:39:49 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOjFE-00000005AL7-2sh4
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 09 Jun 2025 20:37:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=HAUEi/41KnReRsulb+HDrztyfSA7vWns3JFO7b+pFLM=; b=ISKQFieySo2w6yc400HpUFdb8Y
	tFXzzq4vLNYd/wdKst5vwiN24Eu22kTuP/MavrUGEV5g79QNhuSWyPxPk6aLvRBnBXe4zTpjqperG
	PVeD9ch8nnAnvQff7ei6FDrTRiylCkir+bHFOcX3cIB15olr9K9uQzVgM4J0l9be9daQLu8odd9Qo
	aX055i+TqJovssSUT2MsPpBhdcO8eKfzHbSjH9p9kd6RhY0NTvvW50rpT3wv3QPHMdxWT36uIpJN1
	0TO/bQt+DgYurN8rdJhrOfbBJeRTqOGGQr/IcpKEvIV42NnyxFLGbxSE00QiqKNR+PHVyU/fG50dw
	59jDiqog==;
Received: from dfw.source.kernel.org ([139.178.84.217])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOjFB-00000001f9q-3FiK
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Jun 2025 20:37:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 404AF5C4CFF;
	Mon,  9 Jun 2025 20:35:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7EDC5C4CEEB;
	Mon,  9 Jun 2025 20:37:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749501436;
	bh=9xyeqjqPV2Bdmkwjgp/CbUzX3IxOrEVjsENrNl37A1I=;
	h=From:To:Cc:Subject:Date:From;
	b=PREvJkjXRrUTD2ohmHgu8GmoV3QmKwPa5SK4tdH9POkEkHmM7VaQBwLZMOwjHl0ml
	 bPdnHm6VgIWECfqzsxDgcQsCNYio+m6II339JJw2C9NdOuiCwQ2CL5Pt3+xfwhwhQZ
	 fP7l4Ac/Byl16SRTSFBuwAFu3TCMLxwUWwlpj/LFnglVT3HmVovWF0LbAKSzkVxCaK
	 eT59MYYLqUG6F1K1NtiYqHeTQWXcQo3xb1fklSfE0nObeqx6nnB3wSl9fnOQ4IBDEf
	 Jey2HkaNKc/krBTRONo6wA15qaF1Z2h3/booD7FF0Rt2sx3hJuTK8dAw9Je/173nWV
	 5UKtGuBw7BdbA==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: broadcom: northstar2: Drop GIC V2M "interrupt-parent"
Date: Mon,  9 Jun 2025 15:37:04 -0500
Message-ID: <20250609203705.2852500-1-robh@kernel.org>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250609_213722_243259_1588547A 
X-CRM114-Status: UNSURE (   7.64  )
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

The default interrupt parent is a parent node containing
"#interrupt-cells", so an explicit "interrupt-parent" is not necessary.

Fixes these dtschema warnings:

(arm,gic-400): v2m@70000: 'interrupt-parent' does not match any of the regexes: '^pinctrl-[0-9]+$'
(arm,gic-400): v2m@60000: 'interrupt-parent' does not match any of the regexes: '^pinctrl-[0-9]+$'
(arm,gic-400): v2m@50000: 'interrupt-parent' does not match any of the regexes: '^pinctrl-[0-9]+$'
(arm,gic-400): v2m@40000: 'interrupt-parent' does not match any of the regexes: '^pinctrl-[0-9]+$'
(arm,gic-400): v2m@30000: 'interrupt-parent' does not match any of the regexes: '^pinctrl-[0-9]+$'
(arm,gic-400): v2m@20000: 'interrupt-parent' does not match any of the regexes: '^pinctrl-[0-9]+$'
(arm,gic-400): v2m@10000: 'interrupt-parent' does not match any of the regexes: '^pinctrl-[0-9]+$'
(arm,gic-400): v2m@0: 'interrupt-parent' does not match any of the regexes: '^pinctrl-[0-9]+$'

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 arch/arm64/boot/dts/broadcom/northstar2/ns2.dtsi | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/arch/arm64/boot/dts/broadcom/northstar2/ns2.dtsi b/arch/arm64/boot/dts/broadcom/northstar2/ns2.dtsi
index 5a4b81faff20..9888a1fabd5c 100644
--- a/arch/arm64/boot/dts/broadcom/northstar2/ns2.dtsi
+++ b/arch/arm64/boot/dts/broadcom/northstar2/ns2.dtsi
@@ -367,7 +367,6 @@ gic: interrupt-controller@65210000 {
 
 			v2m0: v2m@0 {
 				compatible = "arm,gic-v2m-frame";
-				interrupt-parent = <&gic>;
 				msi-controller;
 				reg = <0x00000 0x1000>;
 				arm,msi-base-spi = <72>;
@@ -376,7 +375,6 @@ v2m0: v2m@0 {
 
 			v2m1: v2m@10000 {
 				compatible = "arm,gic-v2m-frame";
-				interrupt-parent = <&gic>;
 				msi-controller;
 				reg = <0x10000 0x1000>;
 				arm,msi-base-spi = <88>;
@@ -385,7 +383,6 @@ v2m1: v2m@10000 {
 
 			v2m2: v2m@20000 {
 				compatible = "arm,gic-v2m-frame";
-				interrupt-parent = <&gic>;
 				msi-controller;
 				reg = <0x20000 0x1000>;
 				arm,msi-base-spi = <104>;
@@ -394,7 +391,6 @@ v2m2: v2m@20000 {
 
 			v2m3: v2m@30000 {
 				compatible = "arm,gic-v2m-frame";
-				interrupt-parent = <&gic>;
 				msi-controller;
 				reg = <0x30000 0x1000>;
 				arm,msi-base-spi = <120>;
@@ -403,7 +399,6 @@ v2m3: v2m@30000 {
 
 			v2m4: v2m@40000 {
 				compatible = "arm,gic-v2m-frame";
-				interrupt-parent = <&gic>;
 				msi-controller;
 				reg = <0x40000 0x1000>;
 				arm,msi-base-spi = <136>;
@@ -412,7 +407,6 @@ v2m4: v2m@40000 {
 
 			v2m5: v2m@50000 {
 				compatible = "arm,gic-v2m-frame";
-				interrupt-parent = <&gic>;
 				msi-controller;
 				reg = <0x50000 0x1000>;
 				arm,msi-base-spi = <152>;
@@ -421,7 +415,6 @@ v2m5: v2m@50000 {
 
 			v2m6: v2m@60000 {
 				compatible = "arm,gic-v2m-frame";
-				interrupt-parent = <&gic>;
 				msi-controller;
 				reg = <0x60000 0x1000>;
 				arm,msi-base-spi = <168>;
@@ -430,7 +423,6 @@ v2m6: v2m@60000 {
 
 			v2m7: v2m@70000 {
 				compatible = "arm,gic-v2m-frame";
-				interrupt-parent = <&gic>;
 				msi-controller;
 				reg = <0x70000 0x1000>;
 				arm,msi-base-spi = <184>;
-- 
2.47.2


