Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C516C7EE30
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Jul 2025 10:59:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=pKdITuxJaA8EUNftYYb9o+8QYm/n/GOV6BYJNqWHBdI=; b=TnAwmnw8TFr6Slg0ihhc/SiN4W
	VcxkPmH+WXcreXhI8tKuP2vmV12BXZzj5vl5C2r8qCYGtLRMqvbcrFqbmbeWZnYJAp9uX3yH4hjsS
	n8zJyBCcKyJPd4lyylgYARLB4JOPjbyEFTM4vkW6rJ4sMR7Bs6L0lGErGQ/CRYSEn+W1aGah1ewBS
	Toa5/eyhg66Xcs5ZWG4wsUnmegWLlyaCpFFGG22KTjBFJMXIVAMMldCcCeUT30ZIbrgwygiKHcH31
	PA7UzdXsW1d5nyZA9yiG/wEJJERCnxodLfsBDT5LUZsKEBSSLKZxc9C4wUBJybnT9qlD1u9/cUyCP
	kNsYeaWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWYi5-00000004odW-2T3j;
	Tue, 01 Jul 2025 10:59:33 +0000
Received: from mta-64-227.siemens.flowmailer.net ([185.136.64.227])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWYdW-00000004o0d-32nf
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Jul 2025 10:54:52 +0000
Received: by mta-64-227.siemens.flowmailer.net with ESMTPSA id 20250701105441cf8b66a38a8d4f21c2
        for <linux-arm-kernel@lists.infradead.org>;
        Tue, 01 Jul 2025 12:54:41 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=alexander.sverdlin@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=pKdITuxJaA8EUNftYYb9o+8QYm/n/GOV6BYJNqWHBdI=;
 b=NlTMdQLJsQKRO+x5KTq2hOtxXWNHIw353VOH8ecekqR3fqCkYXcy1GzkN9+2Xg9zIpPkNS
 sIRAboDhQrWMSj8jSueadSK4W+XMLHWoccNhJf+HoWpcXJjQQOnEB5m2EceC8fcDC62X3BtH
 kvzdFOmQUmHRD/2kVxsxPE6dhP3BdwfiGnGcGG976L4ED6bZJHdwd7D4KzCw1cYZz5AKsuR/
 Bo7Y2cGuwVUKQVGThkbxmxByWBd1p+EZr0DYDF6AajBbXL6eq8keZCa1AbFRUKdDyHKK6/dx
 RI578UZhJNo0TpgPfkvGI0xYWezdfGKm1q2MS8tWtcizhHKizrbVHTzw==;
From: "A. Sverdlin" <alexander.sverdlin@siemens.com>
To: devicetree@vger.kernel.org
Cc: Alexander Sverdlin <alexander.sverdlin@siemens.com>,
	Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: ti: k3-pinctrl: Enable Schmitt Trigger by default
Date: Tue,  1 Jul 2025 12:54:35 +0200
Message-ID: <20250701105437.3539924-1-alexander.sverdlin@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-456497:519-21489:flowmailer
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250701_035451_376139_64EE7F61 
X-CRM114-Status: UNSURE (   9.24  )
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

From: Alexander Sverdlin <alexander.sverdlin@siemens.com>

Switch Schmitt Trigger functions for PIN_INPUT* macros by default. This is
HW PoR configuration, the slew rate requirements without ST enabled are
pretty tough for these devices. We've noticed spurious GPIO interrupts even
with noise-free edges but not meeting slew rate requirements (3.3E+6 V/s
for 3.3v LVCMOS).

It's not obvious why one might want to disable the PoR-enabled ST on any
pin. Just enable it by default. As it's not possible to provide OR-able
macros to disable the ST, shall anyone require it, provide a set of
new macros with _NOST suffix.

Signed-off-by: Alexander Sverdlin <alexander.sverdlin@siemens.com>
---
This patch could be considered a v2 of [1] but the subject has been changed.

[1] Link: https://lore.kernel.org/all/20250627131332.2806026-1-alexander.sverdlin@siemens.com/

 arch/arm64/boot/dts/ti/k3-pinctrl.h | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/ti/k3-pinctrl.h b/arch/arm64/boot/dts/ti/k3-pinctrl.h
index cac7cccc11121..38590188dd51c 100644
--- a/arch/arm64/boot/dts/ti/k3-pinctrl.h
+++ b/arch/arm64/boot/dts/ti/k3-pinctrl.h
@@ -8,6 +8,7 @@
 #ifndef DTS_ARM64_TI_K3_PINCTRL_H
 #define DTS_ARM64_TI_K3_PINCTRL_H
 
+#define ST_EN_SHIFT		(14)
 #define PULLUDEN_SHIFT		(16)
 #define PULLTYPESEL_SHIFT	(17)
 #define RXACTIVE_SHIFT		(18)
@@ -19,6 +20,10 @@
 #define DS_PULLUD_EN_SHIFT	(27)
 #define DS_PULLTYPE_SEL_SHIFT	(28)
 
+/* Schmitt trigger configuration */
+#define ST_DISABLE		(0 << ST_EN_SHIFT)
+#define ST_ENABLE		(1 << ST_EN_SHIFT)
+
 #define PULL_DISABLE		(1 << PULLUDEN_SHIFT)
 #define PULL_ENABLE		(0 << PULLUDEN_SHIFT)
 
@@ -32,9 +37,13 @@
 #define PIN_OUTPUT		(INPUT_DISABLE | PULL_DISABLE)
 #define PIN_OUTPUT_PULLUP	(INPUT_DISABLE | PULL_UP)
 #define PIN_OUTPUT_PULLDOWN	(INPUT_DISABLE | PULL_DOWN)
-#define PIN_INPUT		(INPUT_EN | PULL_DISABLE)
-#define PIN_INPUT_PULLUP	(INPUT_EN | PULL_UP)
-#define PIN_INPUT_PULLDOWN	(INPUT_EN | PULL_DOWN)
+#define PIN_INPUT		(INPUT_EN | ST_ENABLE | PULL_DISABLE)
+#define PIN_INPUT_PULLUP	(INPUT_EN | ST_ENABLE | PULL_UP)
+#define PIN_INPUT_PULLDOWN	(INPUT_EN | ST_ENABLE | PULL_DOWN)
+/* Input configurations with Schmitt Trigger disabled */
+#define PIN_INPUT_NOST		(INPUT_EN | PULL_DISABLE)
+#define PIN_INPUT_PULLUP_NOST	(INPUT_EN | PULL_UP)
+#define PIN_INPUT_PULLDOWN_NOST	(INPUT_EN | PULL_DOWN)
 
 #define PIN_DEBOUNCE_DISABLE	(0 << DEBOUNCE_SHIFT)
 #define PIN_DEBOUNCE_CONF1	(1 << DEBOUNCE_SHIFT)
-- 
2.50.0


