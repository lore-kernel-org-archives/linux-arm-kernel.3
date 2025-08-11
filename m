Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A364CA0EDE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 Aug 2025 22:04:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cFr9VUb0cj8rwbbjZXrPXjG5Re+YcSIhPghSrgnatjw=; b=oqQX2JjTUFfIeQRDil7YNXQvR0
	gik9nYlMYVrFJl0+eurKqRTjFEfc7x1GeO8JDONjxsSb7s6wGm4gt9AFFI8vB8Kn69pF+KqtkAhEP
	zUqtsbBazslaTmxKsI9DwfBLz7jknV5HI/bEnpgaW/5Si63iW059I812roCD/A7eXclMm32TAy6b9
	Wavsywn62th0vnDg5+ZsYunCNmve/QTRyxndTBKaWbsjQumXGgH69BzoY8V5hkr8DzbnO0EwBPaYN
	QWu6TQy3Y4h3MJqbrZFdu5E769nKxzKY9ktuEJfto5VtJh/aN9/rzEW4YEEiU2cOw1euJW3D3JHFh
	Uuq1YuLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulacg-00000009Cg2-3lJg;
	Mon, 11 Aug 2025 22:04:07 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulXOl-00000008oAU-1c5A
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 11 Aug 2025 18:37:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=cFr9VUb0cj8rwbbjZXrPXjG5Re+YcSIhPghSrgnatjw=; b=ZDRLVwEjQPuDLz2vwPmWIgzjbg
	MJgRlO8nZaaO6TK3zRQ8LOkuMW2jfuirH87Li7mJmPexsK8Wg4wSWSOZ/lbOx4kyhP50JUq1kCHn6
	nkiFQOCWLEQLwGFaALeWEiNY6Qdppvd0kJ1PZ20LXVWUEmIFS+pow4dq5AomKsuNmTzrvffhFNnzy
	ZHU6LCTtCFhrmQY4ZN+ZLpUhCKeKHwDmHHufYwZmYx6nPXCznwzUtIR8ZlHQ0dVIZwrRn/U0Yv7cs
	h1L5tjSdosk4dZGc/5uIkyEe/39WoiQ5d+TVzW/A+kbh01Q3F0AoKtupq+x4Z7WAklH5GTVfbwvcl
	HWFddxAA==;
Received: from zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulXOi-0000000FTTS-1May
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 Aug 2025 18:37:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=cFr9VUb0cj8rwbbjZXrPXjG5Re+YcSIhPghSrgnatjw=; b=Ejoafa
	M5zhIBl4wE3zY27M9Al7lChW2zDD8NjLnLfsBMnanpBzSsNGyYrxPhYAgyYm1nh5
	COuGsD8kizNF0qonPn9Si+tHqSTnWhSD4Ka/LIr2nTYBd6tIL22K2MIU6oMJcqgM
	5NO1sTCTcdLUyoq9VSgF2P/o2F8G7q0DublZJB5ZFb8wIrlwvUMa2alAOUeumfwl
	cBwvtI3QGE6BqapayuBkvMbdLya1nYRZJ3H1zfPjY2HEfNOz9dpLmPyaoH/KH58M
	7KuRGc7sETTX4A0Y2ukxAHVr88gbj+3XrRylEOi4/EEzu7JK1htkpeu6YcLDXneX
	8nfwJYiMJZbthoQA==
Received: (qmail 2896215 invoked from network); 11 Aug 2025 20:37:18 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 11 Aug 2025 20:37:18 +0200
X-UD-Smtp-Session: l3s3148p1@AtmSNhs82uptKLEm
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org
Subject: [PATCH RESEND 2/2] ARM: dts: stm32: use recent scl/sda gpio bindings
Date: Mon, 11 Aug 2025 20:37:11 +0200
Message-ID: <20250811183711.8980-3-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250811183711.8980-1-wsa+renesas@sang-engineering.com>
References: <20250811183711.8980-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250811_193728_649401_310AE134 
X-CRM114-Status: GOOD (  10.64  )
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

We have dedictaded bindings for scl/sda nowadays. Switch away from the
deprecated plain 'gpios' property.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 arch/arm/boot/dts/st/ste-nomadik-s8815.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/st/ste-nomadik-s8815.dts b/arch/arm/boot/dts/st/ste-nomadik-s8815.dts
index c905c2643a12..aeb58d2c08a1 100644
--- a/arch/arm/boot/dts/st/ste-nomadik-s8815.dts
+++ b/arch/arm/boot/dts/st/ste-nomadik-s8815.dts
@@ -117,8 +117,8 @@ lis3lv02dl@1d {
 	/* GPIO I2C connected to the USB portions of the STw4811 only */
 	gpio-i2c {
 		compatible = "i2c-gpio";
-		gpios = <&gpio2 10 0>, /* sda */
-			<&gpio2 9 0>; /* scl */
+		sda-gpios = <&gpio2 10 0>;
+		scl-gpios = <&gpio2 9 0>;
 		#address-cells = <1>;
 		#size-cells = <0>;
 		pinctrl-names = "default";
-- 
2.47.2


