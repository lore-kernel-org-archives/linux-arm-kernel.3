Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D792AC55179
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Aug 2026 12:09:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ciVhpq5ikrs/g8UKoTMTXnw1HTYpSMVps359TESmbaY=; b=UYpmfc36jPCFuW
	/aQdk+BMX7b9gGroIqF05WlalgxXwtb+ky+k6lxmpciWHi9Xcu8FW+ih8WmngSnmJA2O9ZfTzztnE
	erQGHPpAQ0B82V8GDT8GP6ivCOr4RjxyjHsuY0jXXZRFJ2Zm2cyM2kWkYtUIVJF+RPbU5JyNamdPf
	bA/iTTggp+ltkQHgxLWwPvKE7Na3noeChPMf1i2CI7NK4UjkMHOPR5LwECyQirNKSq6sQSQfZIthi
	J0O9VSXK9ms1evx/I9o7bItVjQbNfm9BWNWTVLbjWNk9kijudHn8AhI8qNMYkowKqPFJCH+r4wOL8
	jLW0zuP2rDHJsbNW2vog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqrU7-0000000Gzdi-2Phh;
	Mon, 03 Aug 2026 12:09:35 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqrU4-0000000GzbD-291j;
	Mon, 03 Aug 2026 12:09:34 +0000
From: Gregor Herburger <gregor.herburger@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1785758969;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ciVhpq5ikrs/g8UKoTMTXnw1HTYpSMVps359TESmbaY=;
	b=ZTpzVEIMbH+8+upaO5vsFxQjndHyNIgUio3KuLFcawMDnL7pUClVO9WigvnUNcNStXiBoT
	rk8M/42/djlyqElfwOIioIzXubc0oBIxsbquLOdcaNsIXpdVv5hb7E5wcvnfmFjkxcqqur
	KZipDMPRCsNe1faBhpDT46oxq44CZVpnL9TYKj3r5wg1jCzT794/PNxz1zZHVpB3okUs3n
	3mjNWi/KpARM8XPNVCEX92AC7ntXMFFe0ocyQBKi3LlKxa3u/dN2ar+35ZsffvGPg9ZJC4
	uTKxEoGXz9+FX7eVMXJc6MNTv6LtGd+8/736+HTloCyMYc1bnRMIrCprkROx4w==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1785758969;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ciVhpq5ikrs/g8UKoTMTXnw1HTYpSMVps359TESmbaY=;
	b=wRW2ZQq7zAncR8xTmCkx0aEYycUJbCViZkYjR1ZH0GfBArq92B/KtMpVrnTsuKUjQQMwyd
	0gETdhhKIkeyv6Ag==
Subject: [PATCH v2 0/2] arm64: dts: broadcom: bcm2712-d-rpi-5-b: add
 compatible
Date: Mon, 03 Aug 2026 14:09:23 +0200
Message-Id: <20260803-bcm2712-d-stepping-compatible-v2-0-803017e4ba7a@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPOEcGoC/4WOSw6CMBRFt0I6tqYtRdSR+zAM+nnAM9CSthAMY
 e/yWYDDk9yccxcSISBE8swWEmDCiN5tIC4ZMa1yDVC0GxPBxI2VOafa9KLkgloaEwwDuoYa3w8
 qoe6ASi1ZzYzUVhVkcwwBapwP/7s6OY76Aybt0n3RYkw+fI8DE993Z+vO8j+tiVNGJeOPXOZFq
 aR8dejGFLzD+WqBVOu6/gC6oWXt4AAAAA==
X-Change-ID: 20260731-bcm2712-d-stepping-compatible-4b40f0c4bda5
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Eric Anholt <eric@anholt.net>, Stefan Wahren <wahrenst@gmx.net>
Cc: devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Gregor Herburger <gregor.herburger@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785758968; l=1220;
 i=gregor.herburger@linutronix.de; s=20260226; h=from:subject:message-id;
 bh=g8zTg/CnS5iZmq2ExdPvW4zE5tPDvBIAg00zrRGpeWc=;
 b=/wkU8mNzPbmhF39Woo3Cn+3FHeU6qLCThUO4K5DHJ3YGS0af9Bo+XP2T7/V2AwFMu6PJoTyrH
 dr8G1K3mBA5BjhekfczazXp7DMkq/euh9CKnAw6MW4w9EmOxWTTHj+6
X-Developer-Key: i=gregor.herburger@linutronix.de; a=ed25519;
 pk=u72Lv7+/lS5CC1hmSrb17lv/6CK7HBh4Lvz77PHA5LM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_050932_692903_2DE63996 
X-CRM114-Status: UNSURE (   7.92  )
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

The bcm2712 found on the Raspberry Pi 5 is available in the d Stepping
and in a c Stepping. There are two separate dts files. The
bcm2712-rpi-5-b.dts for the c Stepping and the bcm2712-d-rpi-5-b.dts for
the d Stepping. The d stepping does not set its own compatible/model
string but uses "raspberrypi,5-model-b".

These two steppings are not compatible. Booting with the wrong dtb file
causes a crash at boot.

Add a compatibles string "raspberrypi,5-model-b-d0" to allow us to
distinguish between those two steppings.

---
Changes in v2:
- Removed the wrong oneOf
- Link to v1: https://patch.msgid.link/20260803-bcm2712-d-stepping-compatible-v1-0-401934357a44@linutronix.de

---
Gregor Herburger (2):
      dt-bindings: arm: bcm2835: Add Raspberry Pi 5 d0 Stepping
      arm64: dts: broadcom: bcm2712-d-rpi-5-b: add compatible

 Documentation/devicetree/bindings/arm/bcm/bcm2835.yaml | 6 ++++++
 arch/arm64/boot/dts/broadcom/bcm2712-d-rpi-5-b.dts     | 5 +++++
 2 files changed, 11 insertions(+)
---
base-commit: 8ba098e6b6ff0db8edf28528d1552be261af30d4
change-id: 20260731-bcm2712-d-stepping-compatible-4b40f0c4bda5

Best regards,
--  
Gregor Herburger <gregor.herburger@linutronix.de>


