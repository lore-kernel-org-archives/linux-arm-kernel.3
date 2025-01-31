Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9BAEC02190
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Jan 2025 16:33:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=L9UJqPgBORaXR/9oFp0g7cwrap4KGfpKmsClXzosUYM=; b=BjFtfjAo6uCg01
	Ppp/oSMzB0XNrt93brJyMXZldS3BIAxYs7b813ZR4PA4Q3Nz7eVOT+1D9AY1/TiU+kYi7fZ72gzdl
	8j/JDjq7VgSsy17OncbHS9QoVpPQZDVniFE0IY1vpAO003COkpZRPFjZBp3dUp+pXt9BqQ6ujhQsF
	1vNqJhImQR85skGv50svfwlhfxNeHdBTDrgs4oVGXKmQU9v/7hoWPGoJBYBQvxe6MRnfWGokUE3fh
	HUe+N2LHcQNJJCEMKppfdMRQQ03l2hGu2MJqULVtmDLr+r63Rl3+kYZDxOKse/f7fbJPOg0pPgbvw
	9tlHOnku077U6K1QxR+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdtww-0000000AzP0-2g5m;
	Fri, 31 Jan 2025 16:32:58 +0000
Received: from zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tdtqV-0000000AyKY-1DTP
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Jan 2025 16:26:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding; s=k1; bh=L9UJqPgBORaXR/
	9oFp0g7cwrap4KGfpKmsClXzosUYM=; b=jcEpFKd37KhDV7jSL3kMH4LMb7EC/c
	FF6lDeCf4bnhWxHG8Qfc/9dd6memfB8SR84rWSY2chYeHOCPWD2ntZFNIl+MeADE
	/A++mboo8sI3PzxIl5IMD3zuhssE7Z9DmAGATiOV+c/tnyX+jBaThhfG+q7ydOqK
	fiXKiFkWctyGeuV6tweSCUq3j0cGH0Di1bDmkKlP2TyFTCSA3xGDVtBbyOedbRtr
	QJtSqaTW+3zuG3O/6OIWTwVd5MR9RALCiyydMaDOPAZ4w+MYwQvNixG5zWN2C8da
	Wa2Aqk9PPjr3HrcMoNNIT++epXYbYnF2w3Yaue+PaGbbd/E2iY3r/0XQ==
Received: (qmail 1738667 invoked from network); 31 Jan 2025 17:26:17 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 31 Jan 2025 17:26:17 +0100
X-UD-Smtp-Session: l3s3148p1@IQ2EAAMtrC/Uph5e
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-arm-kernel@lists.infradead.org
Subject: [PATCH 0/2] ARM: dts: at91: calao_usb: improve LED description
Date: Fri, 31 Jan 2025 17:26:11 +0100
Message-ID: <20250131162611.33338-4-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250131_082619_597655_5841BEF3 
X-CRM114-Status: UNSURE (   7.57  )
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Rob Herring <robh@kernel.org>, Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, Wolfram Sang <wsa+renesas@sang-engineering.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

For developing on the road, the Calao USB-boards are still very useful
to me. Time to give their Linux support a little love. This mini series
fixes a wrong polarity and removes the default heartbeat. More to come.

Wolfram Sang (2):
  ARM: dts: at91: calao_usb: fix wrong polarity for LED
  ARM: dts: at91: calao_usb: remove heartbeat for User LEDs

 arch/arm/boot/dts/microchip/usb_a9260_common.dtsi | 3 +--
 arch/arm/boot/dts/microchip/usb_a9263.dts         | 1 -
 2 files changed, 1 insertion(+), 3 deletions(-)

-- 
2.45.2


