Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D68D1CD3436
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 May 2026 14:43:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=81MPp/cPmY31f4oil6TsY2E5xHh8dQK79p3Ch11N/PI=; b=WQiSSooPcE6Aq7uRjenY03A2i7
	5x6n2cxGj+0Olzdj9SyMSMPTlsDZXJ11+Wj7XG5mx+y7JMf7Ks0f18qmI93PeYuMMDVMHlynhuQZe
	ep212BsKHqY3maxZI2udNWZf/QWNIApfnWYN4nQkEoLiCod6o3ppyDkFOecE+WpQadSQRZNHRsznd
	qJVKAeGEt2qbyPyj+6GvYpZGw9yr6UqORGNwYxWc8Af3t8cmzi9ZxcqBW5/J1y2ZKChmFf+4wLv7j
	t/GFZ0n9LqyaXQcy+EztvYm5JtWoSDu+mUjWbgS5DnW/ub5YBwdi570jqN8YPGph2ojsgU1UazTYO
	Bvuse79Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLMPs-00000006h9g-2OLh;
	Fri, 08 May 2026 14:43:00 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLMPn-00000006h4u-0Eyu;
	Fri, 08 May 2026 14:42:56 +0000
From: Gregor Herburger <gregor.herburger@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1778251372;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=81MPp/cPmY31f4oil6TsY2E5xHh8dQK79p3Ch11N/PI=;
	b=vfhgSZiCZi0GULsQBjuOZxGx7VZZW+2K1xRRZ9Wrehfsz958B3cDMUfgy52z+QXr7c4v7v
	QBSa3FLZAMveG6F/8819BdgueVUVEtyw5+zSVG6BoaUt0SQHLjIpsPU42qKawCUzhPAR3x
	rEgWmFp+Rpto89fRF5+PLBxVmJLWWoKphEKH8vtGSlAfsJdmN8+XJ/EtxCntZYn4/yCX3/
	JbfveMiKO6Kh+w02i7jwGsxqNmoZCn+wrnToRNqR6Nz//cwUo4kHQGpOqtDsgDs8oyf//p
	fGHKsVOfolmE+XEQpmmMYH5djbQzZIHQlXwii2svYvhId2yBebvYZ9lKKYpYbA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1778251372;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=81MPp/cPmY31f4oil6TsY2E5xHh8dQK79p3Ch11N/PI=;
	b=Kd/8eig3QYkQ/+RelaacDc4SOX7exZhk8eD+91IHQ5IqaE2CI58nkia2XQhHeyGYCSYG1k
	RVSdacbkdbmpqJBA==
Date: Fri, 08 May 2026 16:42:47 +0200
Subject: [PATCH v4 4/5] arm64: dts: broadcom: bcm2712: add
 raspberrypi,bcm2712-firmware compatible
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260508-rpi-otp-driver-v4-4-cf8d725d8821@linutronix.de>
References: <20260508-rpi-otp-driver-v4-0-cf8d725d8821@linutronix.de>
In-Reply-To: <20260508-rpi-otp-driver-v4-0-cf8d725d8821@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778251369; l=1152;
 i=gregor.herburger@linutronix.de; s=20260226; h=from:subject:message-id;
 bh=gyTIyYto7tzKXHDd6kMNK0OhSiLeThERn6mhwt9FF3w=;
 b=XnMQTKXSNyFtzEfMdOy4cZ5OMhxyyHp8g4rtPATiw58N1+t/QJgcqRZTlpGzHgvYsf5fPIv4g
 YhHgTXzLPzXDVT0Yev8Ye0wQnUF/xQBGrBj0rLcB2tIVXMdOcLHKnvu
X-Developer-Key: i=gregor.herburger@linutronix.de; a=ed25519;
 pk=u72Lv7+/lS5CC1hmSrb17lv/6CK7HBh4Lvz77PHA5LM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260508_074255_229165_10AD7596 
X-CRM114-Status: UNSURE (   9.19  )
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


