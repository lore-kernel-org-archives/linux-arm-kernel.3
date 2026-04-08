Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0A41FD5F87
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Apr 2026 08:00:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8EN/IuRnokUf0WAqH0XL7x6/V8kym8QNk6F6GN9+GJw=; b=yInBe6e5QZY89ADeXK83IAJ5cp
	m+bSMUkD4zdTLIGYJP8wu341DiASbWEIiugKdzAjOUophsR9vB4QPwg9wCxGHX4JRlY+wZSB6LHbY
	I/VHR2K4jrkqapKZRfpIywXgLMVHpX+/mk0sTbNT/ZRZfRunqFuJOmN4Okp0K56HA8eyftccK7QwL
	KmasTb273DzIZNeefFCQ0WBgyo9f7kRByu1Dtmafoy7Omd8+J3eOJBWYzHR3PfBMcuh+8DgLlS+qX
	7k8jU1YWTMfV2II/jFRIN5DG2Vfl44MHupd3mbQ5nv+lpJ/IFnkk3Oronjn7ikrYhOoCgLjkOGKbU
	pdE9PJfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wANpz-00000008U4C-3XdA;
	Wed, 08 Apr 2026 08:00:37 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wANps-00000008U05-1LZ1;
	Wed, 08 Apr 2026 08:00:31 +0000
From: Gregor Herburger <gregor.herburger@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1775635222;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8EN/IuRnokUf0WAqH0XL7x6/V8kym8QNk6F6GN9+GJw=;
	b=WjJJOZDM5sKi3dUQXK8OOgeYkErhvvqsk0UwV/MuyNF+6RAZWI/QkPlu2Lwm1I7oSWlKi+
	v8diDnq2itLvqMqcDVJMDgAQggeZfgLSVxl6aEkgxOKdRYmSioiQp6x2SfCOlG59ARFHnU
	OCnR2EssIRQuvYyvg6UYY5M6LiRuEdtWgP8I/UywvtLyaUJl0vOEAf05DquWf35/lwSDyd
	9UhzNrpW3NL3+XAd1fWksZNGLzzK7IXJQlwAlW1Ykkca+CvazUt8e/x1gLO8KW3ioZI5PS
	e3Wnlh/jyhJdBmB8m5BSVZ06ehtvNyWW3Nluso2j+FZPAR5zVBXqnobF2B8gaA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1775635222;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8EN/IuRnokUf0WAqH0XL7x6/V8kym8QNk6F6GN9+GJw=;
	b=TLWFPRl/SnwkO0gCLEyIrz9L6HG9iBlO7DGq/EZH1afdpXKPji5EPIyR7NzoQIJZ5Es7Xr
	Nv4W1nxhcNFkp7Dg==
Date: Wed, 08 Apr 2026 10:00:17 +0200
Subject: [PATCH 3/3] arm64: dts: broadcom: bcm2712: Add the otp nodes to
 firmware
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260408-rpi-otp-driver-v1-3-e02d1dbe6008@linutronix.de>
References: <20260408-rpi-otp-driver-v1-0-e02d1dbe6008@linutronix.de>
In-Reply-To: <20260408-rpi-otp-driver-v1-0-e02d1dbe6008@linutronix.de>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Eric Anholt <eric@anholt.net>, Stefan Wahren <wahrenst@gmx.net>, 
 Srinivas Kandagatla <srini@kernel.org>
Cc: devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Gregor Herburger <gregor.herburger@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775635221; l=950;
 i=gregor.herburger@linutronix.de; s=20260226; h=from:subject:message-id;
 bh=zdocJ1O8/ww8z4gyHQWB27Qew7fUhNz1qLp8EhG/90U=;
 b=ojdxNXtZpCybmlkPxFdwFuc1YG0Sw7WdqhtphjO5I9psLadULu3k6LQGUq+ExG7lwbGdM4D8w
 xqsoz16FUxhDeYj7vORstXtVUMH+MvlJU/aRaS/ydLi4uDb8/Hff+Fp
X-Developer-Key: i=gregor.herburger@linutronix.de; a=ed25519;
 pk=u72Lv7+/lS5CC1hmSrb17lv/6CK7HBh4Lvz77PHA5LM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260408_010028_524634_2F2FB016 
X-CRM114-Status: UNSURE (   8.63  )
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

The Raspberry Pi 5 has two OTP registers (private and customer), add these
to the devicetree.

Signed-off-by: Gregor Herburger <gregor.herburger@linutronix.de>
---
 arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-base.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-base.dtsi b/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-base.dtsi
index b7a6bc34ae1a..676081198213 100644
--- a/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-base.dtsi
+++ b/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-base.dtsi
@@ -60,6 +60,14 @@ reset: reset {
 				#reset-cells = <1>;
 			};
 
+			otp_customer: otp-customer {
+				compatible = "raspberrypi,firmware-otp-customer";
+			};
+
+			otp_private: otp-private {
+				compatible = "raspberrypi,firmware-otp-private";
+			};
+
 			power: power {
 				compatible = "raspberrypi,bcm2835-power";
 				firmware = <&firmware>;

-- 
2.47.3


