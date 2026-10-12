Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E925CA9ED1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Oct 2026 11:52:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XQyn13FvDSEzRYwvK6acuY5FUVZPqAwaJjsc3VK6GTc=; b=oF725TRi1LC2pkAB5Hjr++tPIv
	OtRIvPcvtmKHECOnN3FkqVJ//DadzwMPHS+6V/6U5uwfVIDbOu0sDLUK5jAPYowZbPIhdT++5sfkV
	bJrR335xYUTcNr4Lgai3g0CECbUQKCdM9oNb6ABf5nNikYmVVsorsUTwhIm0ltZt0FwD2fAH95uqK
	JAXWP4xKVFuvL0i/XtUiXz3cBPWuwbcvNrFPTr89hk56QnpIAkOzU35KNtimLZYspPRx7F3l2Mj18
	LUshP/S0E/BOE4VUEBn+1d4HSeYjcTiSlS5VO91s3ctuXuyWpegASvgVtN3KBapaKQrLthV8+Ecpo
	useXGlzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGEaG-0000000ANj5-3izw;
	Mon, 12 Oct 2026 11:52:48 +0000
Received: from mail.cyberchaos.dev ([195.39.247.168])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGEaE-0000000ANhJ-3FUw
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 Oct 2026 11:52:48 +0000
From: Yureka Lilian <yureka@cyberchaos.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cyberchaos.dev;
	s=mail; t=1791805961;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XQyn13FvDSEzRYwvK6acuY5FUVZPqAwaJjsc3VK6GTc=;
	b=QRIn5kuD4Ot1gHvrq7H2NFtzsiWpUIggAbXDGdquPxy1iEqmONJR/vvMZq/c+ynmlUH9Mk
	yTMj41LNtkAkqDnYjPty6wO/mHXyGKneKDUQ9Nke7Of57aUE9rwW1gQMwhISnjCgox4W1Q
	azD8+FYu4iwb1ZlCQ99D9j3OK5SAP2g=
Date: Mon, 12 Oct 2026 13:52:32 +0200
Subject: [PATCH 1/5] arm64: dts: apple: t8140-j700: Fix property ordering
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261012-apple-a18-pro-dt-pinctrl-i2c-v1-1-6c757966a99e@cyberchaos.dev>
References: <20261012-apple-a18-pro-dt-pinctrl-i2c-v1-0-6c757966a99e@cyberchaos.dev>
In-Reply-To: <20261012-apple-a18-pro-dt-pinctrl-i2c-v1-0-6c757966a99e@cyberchaos.dev>
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Andi Shyti <andi.shyti@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-i2c@vger.kernel.org, Yureka Lilian <yureka@cyberchaos.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261012_045247_046631_50970389 
X-CRM114-Status: UNSURE (   9.68  )
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

The ordering requirements changed between 7.3 and 7.4.
The original t8140-j700.dtsi was developed against the 7.3
dt-check-style rules. Adjust it to the new ordering.

Signed-off-by: Yureka Lilian <yureka@cyberchaos.dev>
---
 arch/arm64/boot/dts/apple/t8140-j700.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/apple/t8140-j700.dts b/arch/arm64/boot/dts/apple/t8140-j700.dts
index 227b58a7ce64..15c21c9e3f2b 100644
--- a/arch/arm64/boot/dts/apple/t8140-j700.dts
+++ b/arch/arm64/boot/dts/apple/t8140-j700.dts
@@ -12,8 +12,8 @@
 #include "t8140.dtsi"
 
 / {
-	compatible = "apple,j700", "apple,t8140", "apple,arm-platform";
 	model = "Apple MacBook Neo (A18 Pro, 2026)";
+	compatible = "apple,j700", "apple,t8140", "apple,arm-platform";
 
 	aliases {
 		serial0 = &serial0;

-- 
2.55.0


