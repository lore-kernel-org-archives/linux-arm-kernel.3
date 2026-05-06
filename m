Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E307ACD3436
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 May 2026 12:28:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=81MPp/cPmY31f4oil6TsY2E5xHh8dQK79p3Ch11N/PI=; b=j+9ev2bg1oqjQl6idgxPNu/WtU
	ZgbPvO+cdSyWQNEwEqH6D1dGgKZaBq8PNs0TQEXvSYVx0VQoL2/I4lgpUnb+ocx6zgGrucqj0ATH6
	RnkyZ0WhcOXJLYw/izrEuCOyRgLZZmhpnKO47RdssF7mSuxCrU2wHHBZlShjad5VcQX5X+he+Gimi
	w1kWkax91/HNCInp6V6Q7yC5AvF0t1n7OCpjxLbD6CNzUfUCqRWfxqRIeLltotRMwOqVFIUiDaMiV
	kQLlwWN4syUVy8e6moVgdw6x5HoAk/cVKoXqBusIPxZEvPYMWTU6oWtVuI7iq2NHNAZPlGHVDMpLA
	XrwZwepg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKbMn-00000000kqy-2xRC;
	Wed, 06 May 2026 12:28:41 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKbMh-00000000kkp-0Wfw;
	Wed, 06 May 2026 12:28:35 +0000
From: Gregor Herburger <gregor.herburger@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1778070512;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=81MPp/cPmY31f4oil6TsY2E5xHh8dQK79p3Ch11N/PI=;
	b=oMipbHDuz7jHZ7kQlqsyTvIDCJv8dbs+leMtbnO16IqA16Ws4OQvZsEsAzXeSzxhBlo32G
	CkmHA9WEGvogE3hGl/Hr1nOIV+XX8kZ+bRWIVhYgFlZfjWW70yBZFcRrxEO9ET7FqSo9pr
	lrp4Qxhz/n9AMWdefFUGP6JsP3keuj29u44c/xQZp0cSiTdiz1vq0fpQOY1PPakyArKdYZ
	Y86cL9NE943ciwUhr+fFA0PqunFyaIJH+b2eJExryYqmwGHvNtmf70CLlpj1lNT2sqsO2f
	v1YcyIQbn47ynmog9bp0jL0sonEbEly9VWR/2ngIl/M0LxpWU5Da4Iq4S9+Tlw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1778070512;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=81MPp/cPmY31f4oil6TsY2E5xHh8dQK79p3Ch11N/PI=;
	b=01sC0nxbEWUe6WhuAm66nnDKOwfrWP4AHKaMcBhFojTMC5PbWyW3lEv4tH1bwOFI0wwcI8
	6rkau1EvNd9Df+Dw==
Date: Wed, 06 May 2026 14:28:18 +0200
Subject: [PATCH v3 4/4] arm64: dts: broadcom: bcm2712: add
 raspberrypi,bcm2712-firmware compatible
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260506-rpi-otp-driver-v3-4-294602663695@linutronix.de>
References: <20260506-rpi-otp-driver-v3-0-294602663695@linutronix.de>
In-Reply-To: <20260506-rpi-otp-driver-v3-0-294602663695@linutronix.de>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Eric Anholt <eric@anholt.net>, Stefan Wahren <wahrenst@gmx.net>, 
 Srinivas Kandagatla <srini@kernel.org>, Kees Cook <kees@kernel.org>, 
 "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-hardening@vger.kernel.org, 
 Gregor Herburger <gregor.herburger@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778070510; l=1152;
 i=gregor.herburger@linutronix.de; s=20260226; h=from:subject:message-id;
 bh=gyTIyYto7tzKXHDd6kMNK0OhSiLeThERn6mhwt9FF3w=;
 b=Gzlfl1GuLTZcLn96DVY3bF9xAHrAq8qFXqN+MIjMGwDgn0+hI2axTKfQnXJVDD8+HVDKR0kkI
 bHiurxQX9sCB/4dQd8B02vaCimYJbr9CrG1yw/dRnDRG73xAfiB0h7y
X-Developer-Key: i=gregor.herburger@linutronix.de; a=ed25519;
 pk=u72Lv7+/lS5CC1hmSrb17lv/6CK7HBh4Lvz77PHA5LM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260506_052835_312033_70C9AC9F 
X-CRM114-Status: UNSURE (   9.50  )
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

Signed-off-by: Gregor Herburger <gregor.herburger@linutronix.de>
---
 arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-base.dtsi | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-base.dtsi b/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-base.dtsi
index b7a6bc34ae1a..4aa8ec7601b8 100644
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


