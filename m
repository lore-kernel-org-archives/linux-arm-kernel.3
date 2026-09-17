Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE795C982D6
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Sep 2026 15:38:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t+5kItn/dLA8g58laqBchtZJn0cTJ6aBuyxpWo3F+/g=; b=bmZIkxGYrIspmW94wY1UAxWVAj
	gtp0+LS0hTs2rwQqAwCzOMLbKH8rQKdEnCWJmcGY3qx78kPYBvQYvYR4VQaD4xUSyAPk7hSqeF2Hy
	T8hva9FueN6gXlxVOxO1yCQuZl70g8GNspVlDicl1AA3uuORDnsHnPjldGq8u3TRV79nsJC2USRJM
	xQflSCr3tJvz7zxJysziBY/QuS7nkg2VZQh+UHP8G7q0JBOwA1cyyREKeDSBQ7EjcA9vjBpToUCKD
	ytwcQ6+rrdzdXY5d8xJP3qLgWkFMPX/pX2vdSccP/TEUIbo/69BgM+I5yCcJ2tFt+b5MKvtyUJm40
	cNbeCPVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7ECG-0000000Bi8l-0tnq;
	Thu, 17 Sep 2026 15:38:48 +0000
Received: from mail.fris.de ([116.203.77.234])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7EC3-0000000BhxW-13lW;
	Thu, 17 Sep 2026 15:38:37 +0000
From: Frieder Schrempf <frieder@fris.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fris.de; s=mail;
	t=1789659510;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=t+5kItn/dLA8g58laqBchtZJn0cTJ6aBuyxpWo3F+/g=;
	b=F6H//oNaO327ZdfV/rDbhljYdTbW5+MVBw8qvKjv5SwWq8PaibGgbOaaASQeK/2TKAPkNd
	o5dHFXh13HIc4v1jX2U9cD2zhb0wZ7EoTgb8c/mshnCVaZGDIHnzFB7iI60mnxjN7wCfWU
	ilJq4b8cAqeAfW7iMLwwf+bj6daT5nmoes6GykMNyw8irWXrTITs7wXmp8ZgfSRe6Kfi0q
	iEP94PX7zT8n1wYH5W2kZoKgmqS/HaVk87zZGE4/K5IXNlfVdGw0Jcd1EjSLxgQHqD83qt
	ZXz60xw/b3m/sQyB+jhFgo2V8qxxvYcox4+zyMzTV5GeLDp3RfHRYlhDwym2TQ==
Date: Thu, 17 Sep 2026 17:37:35 +0200
Subject: [PATCH 1/3] dt-bindings: spi: Clarify what rx-sample-delay-ns
 describes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260917-spi-sample-delay-cleanup-v1-1-0e4eddbfb1ce@kontron.de>
References: <20260917-spi-sample-delay-cleanup-v1-0-0e4eddbfb1ce@kontron.de>
In-Reply-To: <20260917-spi-sample-delay-cleanup-v1-0-0e4eddbfb1ce@kontron.de>
To: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: linux-spi@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, 
 Frieder Schrempf <frieder.schrempf@kontron.de>
X-Developer-Signature: v=1; a=openpgp-sha256; l=2775;
 i=frieder.schrempf@kontron.de; h=from:subject:message-id;
 bh=TlRhZ1qfD0/hQwYMH3NUSnheV4zFAnhEGcsyBBxk8ps=;
 b=owGbwMvMwCWWWSatKlDTJMZ4Wi2JIWsNZ+nETV9LDq5L5uW0WVdyuvysleLum95a9/zqIzML1
 k8qeF/TUcrCIMbFICumyCLFb/Ha1izWR/5YdRTMHFYmkCEMXJwCMJGteYwM+2vPf+EJKH1xevrS
 EKaZje2996Lznd8kJ0zb4s8vXFr2g+F/bdOxKI+Lq4SbnhxnVjI39iwMKi7u3Tt33nWvtX79jUF
 sAA==
X-Developer-Key: i=frieder.schrempf@kontron.de; a=openpgp;
 fpr=1A0F38EB3D365D4C1FC67B5A69761B25107C8216
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260917_083835_451159_B6E6EDEB 
X-CRM114-Status: GOOD (  14.54  )
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

From: Frieder Schrempf <frieder.schrempf@kontron.de>

The property is documented as an offset from the controller's default
sampling time. That says what the value does, but not what it is meant to
describe, and it leaves room for two readings: a delay that belongs to
the board, or a stand-in for the peripheral's own clock-to-output-valid
time, which has no other expression in a device tree today.

The first reading is the original one. The property was introduced for
Rockchip in commit 76b17e6e4923 ("spi/rockchip: Add device tree property
to configure Rx Sample Delay") to deal with "boards with high-capacitance
SPI lines", where "the controller samples the Rx data line too early".
The current wording arrived later, in commit 5ce78f4456a9 ("dt-bindings:
snps, dw-apb-ssi: Add sparx5 support, plus rx-sample-delay-ns property"),
where it described a DesignWare register and was qualified as such. That
qualification was dropped when the property was moved to the generic
schema in commit b658be56e867 ("spi: dt-bindings: Move
'rx-sample-delay-ns' to spi-peripheral-props.yaml"), leaving a register
description standing in for a definition.

The distinction matters because the two compose. A board delay is
specific to one design, while a datasheet timing parameter is the same
wherever the chip is soldered, so a mechanism that derives the chip side
from the chip would add to a value that already accounts for it.

Spell out that the property describes the board. Nothing changes in what
the value means or in how existing device trees are interpreted.

Assisted-by: Claude:claude-opus-5
Signed-off-by: Frieder Schrempf <frieder.schrempf@kontron.de>
---
 Documentation/devicetree/bindings/spi/spi-peripheral-props.yaml | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/spi/spi-peripheral-props.yaml b/Documentation/devicetree/bindings/spi/spi-peripheral-props.yaml
index 880a9f624566..afcf9c41c058 100644
--- a/Documentation/devicetree/bindings/spi/spi-peripheral-props.yaml
+++ b/Documentation/devicetree/bindings/spi/spi-peripheral-props.yaml
@@ -91,6 +91,14 @@ properties:
       The delay from the default sample time before the actual
       sample of the rxd input signal occurs.
 
+      This describes the board rather than the peripheral, namely the extra
+      delay this particular design needs, for example because of the flight time
+      of the clock and data signals between controller and peripheral.
+
+      Timing parameters of the peripheral itself, such as its
+      clock-to-output-valid time, are the same on every board using that chip
+      and should be described with the chip.
+
   spi-tx-bus-width:
     description:
       Bus width to the SPI bus used for write transfers.

-- 
2.55.0


