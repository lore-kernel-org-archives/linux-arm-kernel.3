Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C787CA9EBD
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 11 Oct 2026 12:48:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tc4V+xIZtbnNtu5VuNlUkSpZOtINy4fiu5ZiuvxwfGA=; b=FJOMciu3FIdVv5lG9HMf8iTe9A
	6YWcp/VXCHUyQPN1VDjwqDVccoyeeJHOxe+4sjaEenQjPeYXUc5U7/JDjYdSIJ32Z7R9ZpHFR+Y9N
	jgmbGIMWOhUEb87QHn5RyyeUXN1x2hGTN/9wg0nuDSRJZK2r0j2nMDtqxjD8HAkRH41fqwPiiflm9
	Iey7pdyKaLOHUyNOVj57YJsvcb52W1pIERlVRaqTPKas7w00SqgoKl4AiTARyY/UeojiZNcHDXmB2
	EFpfV4GINtWlOAxsJzsPBtYnCZzWdMnTkKT2Y4Lxvz1WytNuoEpjdyvePDkQiTKD8tXHNvd9qb9iZ
	Tl9YElIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFsyV-000000091Ld-0BBS;
	Sun, 11 Oct 2026 12:48:23 +0000
Received: from mout-p-202.mailbox.org ([2001:67c:2050:0:465::202])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFsyD-0000000919D-21wu
	for linux-arm-kernel@lists.infradead.org;
	Sun, 11 Oct 2026 12:48:12 +0000
Received: from smtp2.mailbox.org (smtp2.mailbox.org [IPv6:2001:67c:2050:b231:465::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4j2gPG5wGFzMlV4;
	Sun, 11 Oct 2026 14:48:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=timmermann.space;
	s=MBO0001; t=1791722882;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tc4V+xIZtbnNtu5VuNlUkSpZOtINy4fiu5ZiuvxwfGA=;
	b=cC2j9Uq8R4rOsCP5BCh3EOSK1t1KiZFkMhQa2xOCAQTXCvZKr/QIQ/IM8kvsjRs7hJPwpG
	8NrLkgK8+R7ZN/SnudOBnx9RaefUl7j9mUCSGlbKC98rIZ/PY/0b5kPeJGVBdXGB6l2Rpn
	cEb/akNRy4CLhptt4xJid1pM34bHJVF9RQPXCg9kyfQSxu/9ElOMaxJvWWcNPpkF4LQIX2
	7XxdSwPNYIlUGK+T3xAjfztysKSc2u3qDv3ecF6M0y+PWvWfjPGoithBiXrKulJ1AxvEvj
	sXUGtyvT8F0m+y4TpaYAM0p6BvwN6egM5+BGwhUkFIIgZspybLayVjR3JmNEnA==
Authentication-Results: outgoing_mbo_mout;
	dkim=none;
	spf=pass (outgoing_mbo_mout: domain of foss@timmermann.space designates 2001:67c:2050:b231:465::2 as permitted sender) smtp.mailfrom=foss@timmermann.space
From: Lukas Timmermann <foss@timmermann.space>
Date: Sun, 11 Oct 2026 14:45:00 +0200
Subject: [PATCH 5/7] arm64: dts: exynos: gs101-pixel-common: add labels for
 touchscreen supplies
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261011-lat3st-google-raven-touch-upstream-v1-5-2a9f55159b9e@timmermann.space>
References: <20261011-lat3st-google-raven-touch-upstream-v1-0-2a9f55159b9e@timmermann.space>
In-Reply-To: <20261011-lat3st-google-raven-touch-upstream-v1-0-2a9f55159b9e@timmermann.space>
To: Lukas Timmermann <foss@timmermann.space>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Andi Shyti <andi.shyti@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org
X-Mailer: b4 0.15.2
X-Rspamd-Queue-Id: 4j2gPG5wGFzMlV4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261011_054805_682018_08277DD5 
X-CRM114-Status: GOOD (  10.51  )
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

The Pixel 6 boards use different touchscreen controllers. Label the
touchscreen supplies so board files can reference them.

Signed-off-by: Lukas Timmermann <foss@timmermann.space>
---
 arch/arm64/boot/dts/exynos/google/gs101-pixel-common.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/exynos/google/gs101-pixel-common.dtsi b/arch/arm64/boot/dts/exynos/google/gs101-pixel-common.dtsi
index a12f2b88d72d..92b1640c0612 100644
--- a/arch/arm64/boot/dts/exynos/google/gs101-pixel-common.dtsi
+++ b/arch/arm64/boot/dts/exynos/google/gs101-pixel-common.dtsi
@@ -399,14 +399,14 @@ s2mpg10_ldo22m: ldo22m {
 
 			/* ldo23m & ldo24m are unused */
 
-			ldo25m {
+			s2mpg10_ldo25m: ldo25m {
 				/* touch */
 				regulator-name = "dvdd_tsp";
 				regulator-min-microvolt = <1600000>;
 				regulator-max-microvolt = <1950000>;
 			};
 
-			ldo26m {
+			s2mpg10_ldo26m: ldo26m {
 				/* touch */
 				regulator-name = "avdd_ts";
 				regulator-min-microvolt = <2500000>;

-- 
2.56.0


