Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D6D1CD5BB4
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 May 2026 15:40:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tfKfhvP2du3rzKmOjT1cyHP3hfhMUxY9/nQXytvqksg=; b=0m2Yfa57s5WSrk9foQ0RDglLLC
	5Q37x/Jv0Yn10ystNYDrZ9HJfFQova0/8KbewYOtsXQ6t1L2+/lncnLWX4ILroT2Od8SxUDXC/cEl
	S3LrLEb3WTnexj5iQHzgqKGNeGQUJS10xplylXj9DrI8lgzoZMLe+tztcBfyzdGYkcKTP24EfxpBD
	fT17bj1AawyC5LIODHXBXzeyjmNpXGYYo6+HaY+n1Y0kV/pBbW9EIpa8QeKMyX4GQi9slxWY8tbJE
	G/DW7zHNVSh9EWQdFWYkd4ZvwGVlgC/vz5523jt3SbjHmnPeYWsfZ7o4mzc7w9I1+q52LCUqsPT75
	fk9W2e8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQRzE-0000000BI71-3iZL;
	Fri, 22 May 2026 15:40:32 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQRyv-0000000BHsW-2zIH;
	Fri, 22 May 2026 15:40:15 +0000
From: Gregor Herburger <gregor.herburger@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1779464410;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tfKfhvP2du3rzKmOjT1cyHP3hfhMUxY9/nQXytvqksg=;
	b=PxXz09F7qoDZWM8go/X2DhIqNwsSaJnic53ikfdN1+3R1bFwkU45pUAHGHziYsm/cu8y9R
	+FLWQTYW+LcVsHEY4a5dL59nDboNT05ercwdIs129hi7sI8qxwpchXswicKGQkvfnKFGN5
	9O8WS0N5WcPfzpG+kraWMtidrSa14rrS7pCCrVqGmgb6/3zXjWms82/MHmtEwLUpH2q/z4
	EcOKwcHE32Q+y/c+L3nwPOyYgVcL2MkU8IY9Wr1Xa+T6lLLWeep13peyOPcJl/JjqspDis
	hIVDaDBQRyeAosP791fJGOkBR7rPBdzw79f6/6h6R1UnxI7sAm9qHUV04ZpG/A==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1779464410;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tfKfhvP2du3rzKmOjT1cyHP3hfhMUxY9/nQXytvqksg=;
	b=fYN3MadhBZ0CfTScck+WjLZ08plOLj/rZ9Ki9yG7fWRXi96ngcTh8LDyVd/XY3wWspVwNw
	cERVoje3zj74SgDg==
Date: Fri, 22 May 2026 17:40:06 +0200
Subject: [PATCH v6 06/10] arm64: dts: broadcom: bcm2712: add
 raspberrypi,bcm2712-firmware compatible
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260522-rpi-otp-driver-v6-6-b0eac97d1428@linutronix.de>
References: <20260522-rpi-otp-driver-v6-0-b0eac97d1428@linutronix.de>
In-Reply-To: <20260522-rpi-otp-driver-v6-0-b0eac97d1428@linutronix.de>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Eric Anholt <eric@anholt.net>, Stefan Wahren <wahrenst@gmx.net>, 
 Srinivas Kandagatla <srini@kernel.org>, Kees Cook <kees@kernel.org>, 
 "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>, 
 Russell King <linux@armlinux.org.uk>
Cc: devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-hardening@vger.kernel.org, 
 Gregor Herburger <gregor.herburger@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779464406; l=1201;
 i=gregor.herburger@linutronix.de; s=20260226; h=from:subject:message-id;
 bh=dbam25rkEbN6V1TXAKuie6Ogixkx8DZyxneAOo0kOp4=;
 b=5pPf1O9USa6M5UoDXP0qSrdputP8iNWGX81P62kddkh7ONmmg8NtP85QRW4JIs5y8K0wquHig
 VUhQAE9ItstCmYpCvy7NXYSOIAN+RCNtnw7sohGXWhJlBZHLGV/0mXz
X-Developer-Key: i=gregor.herburger@linutronix.de; a=ed25519;
 pk=u72Lv7+/lS5CC1hmSrb17lv/6CK7HBh4Lvz77PHA5LM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260522_084013_918657_8145B926 
X-CRM114-Status: UNSURE (   8.90  )
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

The Raspberry Pi 5 (BCM2712) firmware exposes additional features such
as the additional OTP register region called 'private OTP'.

Add the raspberrypi,bcm2712-firmware compatible to allow drivers to
distinguish this hardware variant while keeping
raspberrypi,bcm2835-firmware as a fallback for backward compatibility
with existing drivers.

Reviewed-by: Stefan Wahren <wahrenst@gmx.net>
Signed-off-by: Gregor Herburger <gregor.herburger@linutronix.de>
---
 arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-base.dtsi | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-base.dtsi b/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-base.dtsi
index b7a6bc34ae1ab..4aa8ec7601b84 100644
--- a/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-base.dtsi
+++ b/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-base.dtsi
@@ -46,7 +46,9 @@ power_button: power-button {
 
 	firmware {
 		firmware: rpi-firmware {
-			compatible = "raspberrypi,bcm2835-firmware", "simple-mfd";
+			compatible = "raspberrypi,bcm2712-firmware",
+				     "raspberrypi,bcm2835-firmware",
+				     "simple-mfd";
 
 			mboxes = <&mailbox>;
 

-- 
2.47.3


