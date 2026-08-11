Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78B58C5B56A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Aug 2026 16:04:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=u6qNz38/JdB9Y/D41x0YpIgRaUHYTP+PD4EDIH15nEo=; b=B7hy9t/qUh/nVq
	AQzMj6QM0n2Wz3Y7Gw3rA2iOnbsraScl4oKBP2wc6MKxA0eJE8CAM5UoEvOywzmsyF4pUAJ45GVmo
	fKZ3HRw6AxHPrbiBXMITkCecn4lhUEKsGXlnQqupAGeNFHLhbDd91eTuo1ywWTwp6SzLJ0aya6pF7
	TcF/p8aqbyXalCT5RXAo8vkeTdjqy+8Vc822B7bDZZZNIsqrSkF7JPw/vJbN0QqbSMXksYHIJMgG7
	MwakhhS4gOZwrSLb5+Yv8A1Eq4NgDqhcqn2XHB7XX1mcuOjirfjLNgvfanroEMmhtxEhb3/yaPfuB
	T6N0bF6xFtv2R5Uiu6Sw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtoxr-0000000EQZV-0NJV;
	Tue, 11 Aug 2026 16:04:31 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtoxl-0000000EQVa-2ezv;
	Tue, 11 Aug 2026 16:04:27 +0000
From: Gregor Herburger <gregor.herburger@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1786464260;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=u6qNz38/JdB9Y/D41x0YpIgRaUHYTP+PD4EDIH15nEo=;
	b=OId5a8Yq1enVRNT3bskCUVeMX3rWX32hC2w7AFr8gSW6JbrxK/E1nsnu1fMRkR0Nt9+00U
	EPiYhTQL7Nqi2cUvHYuFC081H98+bqgIy/XrVGwVtJdyRxHHATfvLndFNYv1d7kNQFDhxs
	wcxuwCEpqmMrk/0R1D+/A6jW5dsdlndEo2c9lIgupV+9pNOwewQ7CZ8CnDCNMjXVJ+PJ6y
	mgppWOf4sUIcNH67cgq2yic+2MBXCMDp/fhb+T2G87QdAlM0N7l7cMbFlqRoN73B8uFOV9
	pVmVX8YnYoyWwk+b3Vq5v6rRaTag8/e6Gsv4mOm7ojIPNHGVIzK6F+FguFJd3A==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1786464260;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=u6qNz38/JdB9Y/D41x0YpIgRaUHYTP+PD4EDIH15nEo=;
	b=jQ6iH8KwHh1hpn7TNnfZIcyyny4e2XrA64JMtd4QQlvQz5tCVJGKjxCu5hx2fIqUTgO73T
	FOw3iDV0hXA9c4Ag==
Subject: [PATCH 0/2] arm64: dts: broadcom: bcm2712: Enable SPI
Date: Tue, 11 Aug 2026 18:04:14 +0200
Message-Id: <20260811-bcm2712-spi-v1-0-4c1708d354bb@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAP5He2oC/yXMTQ5AMBBA4avIrDVpSxBXEQutKSPxkw4iadxds
 fwW7wVg9IQMdRLA40lM6xKh0gTs2C0DCuqjQUtdyEopYeysS6UFbySKPDeldIiZcRCLzaOj67s
 17W8+zIR2fxdw3w+6HxIRbwAAAA==
X-Change-ID: 20260811-bcm2712-spi-644b70fee3bf
To: Andrea della Porta <andrea.porta@suse.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 Gregor Herburger <gregor.herburger@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786464260; l=675;
 i=gregor.herburger@linutronix.de; s=20260226; h=from:subject:message-id;
 bh=XgsT4Q3MstgcyMrNRJFYMGnErGnNKp2g6tLPRWScjO0=;
 b=DpSf4Bt9IChZwuV9jEDPS6n6iFE9Fjcqi52tpXTSG7hjlI1v2Irrvu7XHRDZydC+AtxExQnMG
 xqCstc1nKvLDvcv3LMzLbWfwWLUFFxBanF8ajQdOjcoFUpVkv30o0if
X-Developer-Key: i=gregor.herburger@linutronix.de; a=ed25519;
 pk=u72Lv7+/lS5CC1hmSrb17lv/6CK7HBh4Lvz77PHA5LM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260811_090425_829509_B525699F 
X-CRM114-Status: UNSURE (   4.96  )
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

The RP1 chip, found on the raspberry Pi 5, has nine spi controllers. The
spi0 is routed to the pin header. Add the rp1 nodes and enable it for
the Raspberry Pi 5.

---
Gregor Herburger (2):
      arm64: dts: broadcom: rp1: add spi controller
      arm64: dts: broadcom: bcm2712-rpi-5-b: add spi0 interface

 arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts |  16 +++
 arch/arm64/boot/dts/broadcom/rp1-common.dtsi     | 119 +++++++++++++++++++++++
 2 files changed, 135 insertions(+)
---
base-commit: db2ddb87143519e20a95aa36c60b36107b736a58
change-id: 20260811-bcm2712-spi-644b70fee3bf

Best regards,
--  
Gregor Herburger <gregor.herburger@linutronix.de>


