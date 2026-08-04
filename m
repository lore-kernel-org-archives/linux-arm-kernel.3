Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75770C55184
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Aug 2026 13:14:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=IWQ2yiuZZZ9nMTqSwLeaIz1VI8vaeW+s5gl9IRIU8DY=; b=WBQllcDQQDzM/J
	R15z3TctuYH9aXYosG+/h4WEawRNuJYnFBPuA5DD9yrxVc8aCbmLcXgiwmrdeYnhMGVji+yatQI4C
	hl3D/lQ4gHzdF31ZRcQDBwLW+cWZEWG3/Ko9QM591aKv6CZkJPtwMcSKIg7d4G09lHeJgVYgjI9Bs
	vCrp9xPsHBfRePuBj0AFcJCIuNa08xoGpObSsAKqSodIbI241u2hOLaE0k3VrOW+Js5Eis/uGzrgm
	fidcVTdwFLH+L+IswhyrBZTb+B4OV8iO/bWm7d9yx49SCKeQ2faS3/vN4uCkUOGd4tzcCDkBejGsI
	HXFShGMPOXvoUMfV/YDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrEyE-00000001tfy-0YO0;
	Tue, 04 Aug 2026 13:14:14 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrEy8-00000001tcZ-3SZs;
	Tue, 04 Aug 2026 13:14:11 +0000
From: Gregor Herburger <gregor.herburger@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1785849243;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=IWQ2yiuZZZ9nMTqSwLeaIz1VI8vaeW+s5gl9IRIU8DY=;
	b=OTAdtVcqQP9cquYWNLgyCg/Hchx/0xltlW0fgkrMzp+YywtgXgOSVBA60QwzbYgQkH7dYP
	vydOjqTZ6HxpSp5OuK1CfNp6Iq+g6+mNAINeOiX0LNsAReNTdJ3QmIO24xx35TkqZK/jm+
	n1uy3MvpFhq56T6RLInsZMHc/njfLFZ1/WgQnLC4lE2JoCQ/RnHKKpgALq3dJxdC+ZP9OE
	GP/SgamG5dKYryfO3RniVkVDUO7Wo3cL6R76YTCjECMM+sZYzcCfLMJFCtjZgJiN0KsE26
	LK4o39urCbSm+iKUKxcJlBL5cWpAb0KFKIGMUesqYXKppVjcXviyNJG1vDDcsA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1785849243;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=IWQ2yiuZZZ9nMTqSwLeaIz1VI8vaeW+s5gl9IRIU8DY=;
	b=4SBf9NAmnUl/QezJhlvC8IUbdPZEL9oMDVHP7ZkUOYZjqeBQtgFH5Vxrr5A3KAH5TmyLiM
	uH9WnvIHbmI7W5DA==
Subject: [PATCH v3 0/2] arm64: dts: broadcom: bcm2712-d-rpi-5-b: add
 compatible
Date: Tue, 04 Aug 2026 15:13:47 +0200
Message-Id: <20260804-bcm2712-d-stepping-compatible-v3-0-1860094486eb@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIvlcWoC/5WOywrCMBQFf0WyNpJXjbryP8RFHrd6paYlSYMi/
 XfTunMjLgcOM+dFEkSERA6rF4lQMGEfKsj1irirCReg6CsTwcSWacmpdXehuaCepgzDgOFCXX8
 fTEbbAVVWsZY5Zb1pSHUMEVp8LP7T+cNptDdweZbOiyum3MfncqDwefdp7Zj80SqcMqoY30slG
 22UOnYYxhz7gI+NBzL3ivjLKKqxzhjXoKzR5ts4TdMbzH/+XTIBAAA=
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785849242; l=1373;
 i=gregor.herburger@linutronix.de; s=20260226; h=from:subject:message-id;
 bh=voWwmmacHSa8WPfvXhB2hot+vYwl1TCZKiEjJL8/wKk=;
 b=TjJcM79DnJlZD4xkr1La3dlok6jlddvfZES1CNAL4/jSBniawm/zyH+t/hPulXM2bsjn/IdP6
 RCA4AdE/fHSBFUrjiYzOkoiwq4Eqxr0DcggxlR4fys7eG7NgpGwUHgW
X-Developer-Key: i=gregor.herburger@linutronix.de; a=ed25519;
 pk=u72Lv7+/lS5CC1hmSrb17lv/6CK7HBh4Lvz77PHA5LM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260804_061409_090828_FF8E980F 
X-CRM114-Status: UNSURE (   8.45  )
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
Changes in v3:
- Remove fallback compatible
- Link to v2: https://patch.msgid.link/20260803-bcm2712-d-stepping-compatible-v2-0-803017e4ba7a@linutronix.de

Changes in v2:
- Removed the wrong oneOf
- Link to v1: https://patch.msgid.link/20260803-bcm2712-d-stepping-compatible-v1-0-401934357a44@linutronix.de

---
Gregor Herburger (2):
      dt-bindings: arm: bcm2835: Add Raspberry Pi 5 d0 Stepping
      arm64: dts: broadcom: bcm2712-d-rpi-5-b: add compatible

 Documentation/devicetree/bindings/arm/bcm/bcm2835.yaml | 1 +
 arch/arm64/boot/dts/broadcom/bcm2712-d-rpi-5-b.dts     | 5 +++++
 2 files changed, 6 insertions(+)
---
base-commit: 8ba098e6b6ff0db8edf28528d1552be261af30d4
change-id: 20260731-bcm2712-d-stepping-compatible-4b40f0c4bda5

Best regards,
--  
Gregor Herburger <gregor.herburger@linutronix.de>


