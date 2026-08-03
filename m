Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1AFBC55179
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Aug 2026 12:09:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9P9bubSjejExvocqDDS92y3ppWHsNSy9m2WTpszexZM=; b=UJV3We/HVIQWRkgiaxDXzGFfve
	2z9hIjsqOp1A+WEjozBV+LL9MYW0HYIN7nSxLPCHpCXKT9WSO+seb5kNDNUO18lZyAhEOJwspl7j+
	dJt0Y5JTyPDWMrvJW5YNhQhPi1HgB/xQ/CLILQWtg2eIbP6GBCjxjkhUrI2gg5djIlbhQDgubMiO2
	Qqoaq0SE8hIXzr8cmCAQhzJEPgWjVvVLys2yqDrvfZ18eeXa5dAdeHUkhwyznXqehSgBw+O8yH6yf
	HeiwFlbiW5zTM/zX64TWx17DyE3qwXZVy3M+eUZrr6x0vj3T0R1S0vNJl0VKEQaWSzs6z56LjBs80
	ZcI/qasw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqrU6-0000000Gzcq-222n;
	Mon, 03 Aug 2026 12:09:34 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqrU4-0000000GzbE-29bt;
	Mon, 03 Aug 2026 12:09:33 +0000
From: Gregor Herburger <gregor.herburger@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1785758969;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9P9bubSjejExvocqDDS92y3ppWHsNSy9m2WTpszexZM=;
	b=RSr+EuCq+yptKngLpYYlfcOmMZL3vXigh5X7FD/nfhs1O6uH5xpTsQvhp1bXKgkTU7pEML
	STUWY9BezYCnNYrMZZ0rQiNYYEx5pJoWGqvxOeKqAku6hyHrQtJ8J2B6XOavk6KoMW91kY
	G0ht5QYiY2nipoqUotEWESxeB+uGwNT3umumF7yr1vSZLf5qgy+fUfePsBdMNZHiue2KRa
	k42Kt2tXLMnjXyDcIspjT1gCdSTn9P1YvcjoY0BcFZTCGHNQntPSdI4NYgJCkpFSz/b9ur
	iTmkFsOhlN3ACMkFhNNQgqfNfuulj2wAy25qVbcdJnLFV3RqolD9TY6sot4jgg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1785758969;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9P9bubSjejExvocqDDS92y3ppWHsNSy9m2WTpszexZM=;
	b=HNp72QlFJfRZcOl5+c6kkvHqZGIivOfZmA+6dCTxHZX+cmiPhRYJfS66Y8CJpmLbGGwVKr
	gqb8sEvMKFtBJnAA==
Date: Mon, 03 Aug 2026 14:09:25 +0200
Subject: [PATCH v2 2/2] arm64: dts: broadcom: bcm2712-d-rpi-5-b: add
 compatible
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260803-bcm2712-d-stepping-compatible-v2-2-803017e4ba7a@linutronix.de>
References: <20260803-bcm2712-d-stepping-compatible-v2-0-803017e4ba7a@linutronix.de>
In-Reply-To: <20260803-bcm2712-d-stepping-compatible-v2-0-803017e4ba7a@linutronix.de>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Eric Anholt <eric@anholt.net>, Stefan Wahren <wahrenst@gmx.net>
Cc: devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Gregor Herburger <gregor.herburger@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785758968; l=1240;
 i=gregor.herburger@linutronix.de; s=20260226; h=from:subject:message-id;
 bh=DSPSDoGviOFyo8k3qvSQl5w8Jy3UBcbhVpFibB9/rT0=;
 b=UXJkRE6rP6HIDotcOWiaYWjId5rj2+yfA+gQ4NT6v446bhuMZP0jCSvEVYi/2/ffeMtvIm0Xh
 CMUi2Z2e3q1A7z2UWi/uJixavo2vbLQhLlQM4Rn6f+nHjaakmKQp4hH
X-Developer-Key: i=gregor.herburger@linutronix.de; a=ed25519;
 pk=u72Lv7+/lS5CC1hmSrb17lv/6CK7HBh4Lvz77PHA5LM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_050932_683648_518EBB94 
X-CRM114-Status: GOOD (  10.16  )
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

The bcm2712 found on the Raspberry Pi 5 is available in the d Stepping
and in a c Stepping. There are two separate dts files. The
bcm2712-rpi-5-b.dts for the c Stepping and the bcm2712-d-rpi-5-b.dts for
the d Stepping. The d stepping does not set its own compatible/model
string but uses "raspberrypi,5-model-b".

These two steppings are not compatible. Booting with the wrong dtb file
causes a crash at boot.

Add a compatibles string "raspberrypi,5-model-b-d0" to allow us to
distinguish between those two steppings.

Signed-off-by: Gregor Herburger <gregor.herburger@linutronix.de>
---
 arch/arm64/boot/dts/broadcom/bcm2712-d-rpi-5-b.dts | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/broadcom/bcm2712-d-rpi-5-b.dts b/arch/arm64/boot/dts/broadcom/bcm2712-d-rpi-5-b.dts
index 127be0fc27c2..11a38cd53401 100644
--- a/arch/arm64/boot/dts/broadcom/bcm2712-d-rpi-5-b.dts
+++ b/arch/arm64/boot/dts/broadcom/bcm2712-d-rpi-5-b.dts
@@ -3,6 +3,11 @@
 
 #include "bcm2712-rpi-5-b.dts"
 
+/ {
+	compatible = "raspberrypi,5-model-b-d0", "raspberrypi,5-model-b", "brcm,bcm2712";
+	model = "Raspberry Pi 5 d0 Stepping";
+};
+
 &gio_aon {
 	brcm,gpio-bank-widths = <15 6>;
 

-- 
2.47.3


