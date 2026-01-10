Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98056D277CD
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 10 Jan 2026 02:47:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=fXKtqlPwe000x2IGDIxVeicvyElDK+Olqp8ARxq9yZw=; b=Xwco0wND1ILX9jEB5y+NkD0hL8
	G3Xq/PuYpMDKtJ07+kOqCmO6AqYcEifQKYxKwBjYizWrgWgRVxOVYaEWr0MgIjs7grUBg0W2WaVhg
	t4C/odfcndbk+VfltutDVDgtk3+uh1HOYdFkSwk7sgPIF2VYsM/ld4H3Sxw/devi+m4bA8kj6eKmO
	MXklBjxM2yo1969qzapxqL0GzKHYIbWw502RIwpKg062eUJiHA/wBLvKd0lz454LiAikMZVI0FpRf
	ND+hDjf7UtirtU2EmGircG3e70fQFi7BClPjveX1l9/fXpQXzWE07SSAdGa58Zj0vv+I7HR0eo69+
	1/OaqIZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veP0B-00000003CXO-2Etw;
	Sat, 10 Jan 2026 02:46:55 +0000
Received: from mleia.com ([178.79.152.223] helo=mail.mleia.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veP08-00000003CWE-19nv
	for linux-arm-kernel@lists.infradead.org;
	Sat, 10 Jan 2026 02:46:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mleia.com; s=mail;
	t=1768013210; bh=7aOrMixf22cms3+N44ctElI0QO2xH8FvGfQxgKQtJs8=;
	h=From:To:Cc:Subject:Date:From;
	b=mfb1KUYVCANP5spC8TQ2XVep9wmwAmXx7gtsxxRW4DJSfwpo3nn4SYNTTqiG2D5pu
	 3GZpCbld5oEiPMhQLdqzEAv067iQxYQRkaSzX5t9RNL2K1kbSaeSUUsMrF5tmXaqj4
	 0Bv61rwlucf5SSi96v6ZrZFmZGsQ434IPXhVOUTb6dJwdmNjaCloS16AA/o375S1YK
	 VVWg7bVZ2KM9ImnWMdgTq61LrUqRrqRnER8xb0U4ocHddpgz+nh8RudIEh1tIBL7dM
	 0AL3LU5y+YVzrF2/DXh5gpe/PiKXRKBF1+DQaisRZbrwqfE/qBC02qcxmsRXqAVf1j
	 3RwzUITVxggyA==
Received: from mail.mleia.com (localhost [127.0.0.1])
	by mail.mleia.com (Postfix) with ESMTP id 06EFD3EB7E6;
	Sat, 10 Jan 2026 02:46:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mleia.com; s=mail;
	t=1768013209; bh=7aOrMixf22cms3+N44ctElI0QO2xH8FvGfQxgKQtJs8=;
	h=From:To:Cc:Subject:Date:From;
	b=SJzLhJnO0zSUsVgEtbT1n0D/KBaWnHLCAL0bOKLIt9p4jCj7P/HZ6aJ2tI6nO0W42
	 VWARIMhcbdAxKnyL/lx7zAlst7VEaoJashIOLqbd31o077//6GxfIX8LCqHfDoIxe4
	 8NO96Ccu1Nklf4PxOG+Bv54Wn600VHhhBbVtV5/6xgd2cw8p3AZgfBMoc8Pz29kvy2
	 LgRauXAvbCPxiIhQ0yhEgc0SCEjaSLeeqL+eQtd/CnRxnVla1o5/IzdJr54+FydD4B
	 WYcuBng8Vm1E0ze8PZvryC5/GYdfOp4vb1Lh1qmNKtGNZQ0Erq4GiLM/lrf8tAqsk/
	 obA8Fvv7dyLug==
Received: from mail.mleia.com (91-159-24-186.elisa-laajakaista.fi [91.159.24.186])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.mleia.com (Postfix) with ESMTPSA id 498B03EB2D5;
	Sat, 10 Jan 2026 02:46:49 +0000 (UTC)
From: Vladimir Zapolskiy <vz@mleia.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Lubomir Rintel <lkundrak@v3.sk>,
	Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,
	devicetree@vger.kernel.org,
	linux-serial@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 0/2] arm: dts: lpc32xx: Specify compatibility of platform UARTs with 16550A
Date: Sat, 10 Jan 2026 04:46:45 +0200
Message-ID: <20260110024647.3389345-1-vz@mleia.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-49551924 
X-CRM114-CacheID: sfid-20260110_024650_047016_9F1A678B 
X-CRM114-Status: UNSURE (   7.96  )
X-CRM114-Notice: Please train this message. 
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260110_024650_047016_9F1A678B 
X-CRM114-Status: UNSURE (   9.94  )
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

NXP LPC32xx SoC has 4 16550A compatible UARTs with 64 byte TX and RX FIFO
sizes, and the platform UART hardware is well supported as a standard
16550A UART.

Vladimir Zapolskiy (2):
  dt-bindings: serial: 8250: Explicitly make LPC32xx UARTs compatible with 16550A
  arm: dts: lpc32xx: Add ns16550a compatible value to UART device tree nodes

 Documentation/devicetree/bindings/serial/8250.yaml | 2 +-
 arch/arm/boot/dts/nxp/lpc/lpc32xx.dtsi             | 9 ++++-----
 2 files changed, 5 insertions(+), 6 deletions(-)

-- 
2.43.0


