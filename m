Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79B42C021A1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Feb 2025 06:59:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kcrBcoZxZD0KOSfIajrWXKnkY7Tho0NlrAQP/789iY8=; b=HpMtLPN0spG2Ea
	qSqGED58niZMFlPQMKBuxf28UdLRE2vIEpi9BEnlHJE80EO02P7E3+nfv/vJS+xlTUpTHfH2ebQIY
	KsKN11AdN1kqu7unyn50fNC9QcdCr5DgsHn+05IWBSFN1rdJBGd2bJkzTGZegG9fWpvIXIvWEpH9p
	W2bRe1acJDyLaHT2urC4SQd4wCq40rZ14SljWaXZIQjohQb7iWHu7AzQMW5x7UR1Kr+qE50LOsL7z
	BczlVkukjdwasa6QkTuIRBepuDTMlCGvpkRgIJ68qjMOmI943rCeubpoizoIf5wE3yxd4Faj1dBOF
	9JKH9bF051yDIrIMaacQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thkFC-00000002ldv-43ra;
	Tue, 11 Feb 2025 06:59:42 +0000
Received: from mail.thorsis.com ([217.92.40.78])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thk8u-00000002kcf-10e6
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Feb 2025 06:53:13 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 372FF1487178;
	Tue, 11 Feb 2025 07:53:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=thorsis.com; s=dkim;
	t=1739256790;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kcrBcoZxZD0KOSfIajrWXKnkY7Tho0NlrAQP/789iY8=;
	b=Uj41sTPVbuELc7zWPiWuQOLNaPqUKRlyhq7COUvGzHhUjh4zIP9i1BucViH/E6nL7iezJ/
	u06N3hZn7t+yzEdzw/0kEeiZjBAJWn16TO8Z7Mmuv2MyUhwPRyY4mRviZ2Xz7yjzTjrAug
	jBzigh7V2l4XHPK54bBjG2r2c0CfHhDxig+XDrCO5GstJPEtcWlOzKgPS8Ez+MXYtpqDU6
	RhY+is7N+3QPE3EChkE+Kn5Rh/ZZ1ssauiFM4FfZV/1H3y3ZuBSOsQtReuzFOkaME875Fx
	zG2iqSZpUAWIR9vIJ0eAHd03RzQOx1xDQNpGzPfgAX28PUgGlzDiEHVe1dSRhg==
From: Alexander Dahl <ada@thorsis.com>
To: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Subject: [PATCH v2 14/16] ARM: dts: microchip: sam9x60_curiosity: Enable OTP Controller
Date: Tue, 11 Feb 2025 07:53:02 +0100
Message-Id: <20250211065304.5019-2-ada@thorsis.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250211065304.5019-1-ada@thorsis.com>
References: <20250210164506.495747-1-ada@thorsis.com>
 <20250211065304.5019-1-ada@thorsis.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_225312_434232_1B4476F9 
X-CRM114-Status: UNSURE (   8.88  )
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Ryan Wanner <ryan.wanner@microchip.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>, Rob Herring <robh@kernel.org>, linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Allows to access the OTP memory now, and Product UID later.

Signed-off-by: Alexander Dahl <ada@thorsis.com>
---

Notes:
    v2:
    - same as in v1, no changes

 arch/arm/boot/dts/microchip/at91-sam9x60_curiosity.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/microchip/at91-sam9x60_curiosity.dts b/arch/arm/boot/dts/microchip/at91-sam9x60_curiosity.dts
index b9ffd9e5faacc..c110a8e87568a 100644
--- a/arch/arm/boot/dts/microchip/at91-sam9x60_curiosity.dts
+++ b/arch/arm/boot/dts/microchip/at91-sam9x60_curiosity.dts
@@ -252,6 +252,10 @@ ethernet-phy@0 {
 	};
 };
 
+&otpc {
+	status = "okay";
+};
+
 &pinctrl {
 	adc {
 		pinctrl_adc_default: adc-default {
-- 
2.39.5


