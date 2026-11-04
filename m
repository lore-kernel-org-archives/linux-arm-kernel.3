Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12AA5606A338
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Nov 2026 05:54:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=EKlyWifC;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=N3m4cG1O
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=teleq+CKugt1QK/s9Q02odvUXCBdWX4x0eH0UdC9R64=; b=EKlyWifCSnnjytmQRLHzbiic04
	BQPvC+4tgOFiLdQtJpBa/kGVlXtORRrF7aj4W7ijfKwFuc9DXrGxkwja+UOstLAES7cZlz0EOgxE1
	eA71RdDMtK7bQOFg0MjyK6aQ0t7UQhKpsxzRXLTMB8298kU3EFi6o/bwr5JYUL2NThi3VVyPXuW8f
	5U2pgHKXlFfQ4AXtwNqDxgsCpRG1CZvGUnLKIQJZpYlB+2HyoMt31gCY9P2ccaTg2/AWHIkFYBK8s
	K9/gWLiDRMDQ7pZYZarL1YaI3bJxdKmf/rlBBihwEgQ2D3TqquNziB07pzkINiAv4z2+AeNISo+RT
	aKvm2+8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOTxL-00000004Mnr-19hN;
	Wed, 04 Nov 2026 05:54:43 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOTxK-00000004MnN-1HnV;
	Wed, 04 Nov 2026 05:54:42 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 1483E43E6C;
	Wed,  4 Nov 2026 05:54:42 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793771681;
	b=XNilzmluRg7GRRAg58XkGyKrRWFJIhnzDk43bWjG0iSPk+UgdPZkFGBndGGc90JkAPb9
	 0P3bJlVKrA5lXOXHK/D4KQWwz+ozsW0xyKAFSpCwefTmkhnxYgTMJ1fhp4qLxko9klmXG
	 tyk3Hv2CYrLZWqK3zuWps9KP/Nk6WydwLBe1z5UhQUH+B+Pblq+SiJ+TcdcN6UEu1R5CP
	 6qmzCJdy1ZkFKRp3gDg4kiwJGLttQ3SVOH/n9yPvB8zqvMxGbIM/s41Id3QGKNq1+/F6O
	 +lqQyRNGmw/+REUHv1/OJDyoSggE/B4WkvPGsr8ixe5pyKwfwM3YrJdeCMLsKCG9B+g==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793771681;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=teleq+CKugt1QK/s9Q02odvUXCBdWX4x0eH0UdC9R64=;
	b=HXO8DE+EmqUeOeMw1qFLpebrC0F4FlrAy3VR52n1aRZG0KWNVPmuPNX8fiX0MzsULNgY
	 cr/WoLsQOcoAOdo3o1/jBtUD8YSkR3j+bIIHRRcsDgostUVY4fCU+RioZ3zVUteVf/1oZ
	 M6g75MY5wPR/gHXKVQbup1v5aGKHR5orBzfbsFqitNNCxoNYINEb93M4OkejQVy5Tbojz
	 Mxn0aiCj10WzpbX9D+Gbn1qiXVVyRw+QlxhhtSzsDX1HOsZ37IV30djspItFWtwRr43bZ
	 XinUJI/V4CeP9NBDCYqipx5oqyFjQ6iJH7+TCjXnUryBjVUJIU7KASBuWQyJP2zTS2Q==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 4486B1F00919;
	Wed,  4 Nov 2026 05:54:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793771681;
	bh=teleq+CKugt1QK/s9Q02odvUXCBdWX4x0eH0UdC9R64=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=N3m4cG1OLsa1y/sJ1UXGMjqV6Q9x1UeEwQ0Yn84SBf8jdEE4TOw6SGGsWZY7YlPTj
	 p/ni057gbFfg3aAEQZh9iJXMqUutG4qSRrmkQcJ6Pz93U1SKylmtiyTfVr9ZwBhtk/
	 tXF2PIzNqd8pdkBPz9V5sZ27sD2n8YOezmtE0xBhhZgdpdRPhw5MdZA5OnWsxzsjwv
	 wyn1RfpW/pKfTJx1EZoZKghFxOtFCZE7C1SPjAPgsy2A/gMUD3bMFPbj3jzu3b8R92
	 RxAY2A0XT2IRGDm5cLpuLp9WJxxzgu0avxsdIut8yaXFd81DuZqFgJBhafl7epQKYW
	 Tu8Oso0TnMydA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id C5EBB46C5E;
	Wed,  4 Nov 2026 05:54:40 +0000 (UTC)
From: Igor Velkov via B4 Relay <devnull+iav.iav.lv@kernel.org>
Date: Wed, 04 Nov 2026 05:54:37 +0000
Subject: [PATCH RFC 1/3] dt-bindings: rtc: Add linux,wakeup-states and
 linux,alarmtimer-priority
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261104-b4-alarmtimer-rtc-priority-v1-1-e996681b8086@iav.lv>
References: <20261104-b4-alarmtimer-rtc-priority-v1-0-e996681b8086@iav.lv>
In-Reply-To: <20261104-b4-alarmtimer-rtc-priority-v1-0-e996681b8086@iav.lv>
To: John Stultz <jstultz@google.com>, Thomas Gleixner <tglx@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Miroslav Lichvar <mlichvar@redhat.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 linux-rtc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Igor Velkov <iav@iav.lv>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3808; i=iav@iav.lv;
 h=from:subject:message-id;
 bh=03lyxM4SQ2zx0WHWIjnOxBbyYZuv2oiIWhQvdfHX1RY=;
 b=owGbwMvMwCVmNH1q96v4SmbG02pJDFmvTsz7PYtLJGfuw7h/x3gefC637LKTrvZlvP/gWsTcs
 82zHvIe7yhlYRDjYpAVU2SZcEjjVsaSq3/9PcwfwMxhZQIZwsDFKQATMYtm+MV8XeKmxqIldz/n
 6Qos2pOWzFUzL0iuYi2vyfUMTqlWtQuMDKe0zi11av/rZ3z210otX7mVS2STfe/M3X5qUfq3/O+
 l/3gA
X-Developer-Key: i=iav@iav.lv; a=openpgp;
 fpr=90C228DA68A4D5FD4F4837E03297958BEA5F7903
X-Endpoint-Received: by B4 Relay for iav@iav.lv/default with auth_id=1060
X-Original-From: Igor Velkov <iav@iav.lv>
Content-Transfer-Encoding: 7bit
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Reply-To: iav@iav.lv
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Igor Velkov <iav@iav.lv>

A board can have more than one RTC with an alarm that wakes the system,
for example an I2C RTC next to an RTC in the PMIC or the SoC firmware.
Which of them wakes the system depends on the sleep state and on the
board's firmware: amlogic,meson-vrtc is a register the firmware reads
when the application processors suspend, so it wakes the system from
deep sleep only, and whether an I2C RTC wakes the system from deep
sleep depends on the firmware handling its interrupt line.

Add two properties to describe this per RTC. linux,wakeup-states lists
the sleep states an alarm of the RTC wakes the system from, named as in
/sys/power/mem_sleep, plus hibernate and off, or none for an RTC whose
alarm wakes the system from no state. linux,alarmtimer-priority weights
the RTC among those that wake the system from the target state.

List both in nxp,pcf8563.yaml and amlogic,meson-vrtc.yaml, which do not
allow unlisted properties.

Signed-off-by: Igor Velkov <iav@iav.lv>
---
 .../bindings/rtc/amlogic,meson-vrtc.yaml           |  3 +++
 .../devicetree/bindings/rtc/nxp,pcf8563.yaml       |  3 +++
 Documentation/devicetree/bindings/rtc/rtc.yaml     | 29 ++++++++++++++++++++++
 3 files changed, 35 insertions(+)

diff --git a/Documentation/devicetree/bindings/rtc/amlogic,meson-vrtc.yaml b/Documentation/devicetree/bindings/rtc/amlogic,meson-vrtc.yaml
index a89865fa676a..bc4a1916f600 100644
--- a/Documentation/devicetree/bindings/rtc/amlogic,meson-vrtc.yaml
+++ b/Documentation/devicetree/bindings/rtc/amlogic,meson-vrtc.yaml
@@ -30,6 +30,9 @@ properties:
   reg:
     maxItems: 1
 
+  linux,alarmtimer-priority: true
+  linux,wakeup-states: true
+
 required:
   - compatible
   - reg
diff --git a/Documentation/devicetree/bindings/rtc/nxp,pcf8563.yaml b/Documentation/devicetree/bindings/rtc/nxp,pcf8563.yaml
index 22909a96123e..5aabeb074c82 100644
--- a/Documentation/devicetree/bindings/rtc/nxp,pcf8563.yaml
+++ b/Documentation/devicetree/bindings/rtc/nxp,pcf8563.yaml
@@ -32,6 +32,9 @@ properties:
   interrupts:
     maxItems: 1
 
+  linux,alarmtimer-priority: true
+  linux,wakeup-states: true
+
   start-year: true
   wakeup-source: true
 
diff --git a/Documentation/devicetree/bindings/rtc/rtc.yaml b/Documentation/devicetree/bindings/rtc/rtc.yaml
index efb66df82782..3b4b8ff90ada 100644
--- a/Documentation/devicetree/bindings/rtc/rtc.yaml
+++ b/Documentation/devicetree/bindings/rtc/rtc.yaml
@@ -26,6 +26,35 @@ properties:
       0: not chargeable
       1: chargeable
 
+  linux,alarmtimer-priority:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      Weight of this RTC for waking the system on alarmtimer alarms.
+      Among the RTCs that can wake the system from the target sleep
+      state, the one with the highest value is used; on a tie, the
+      operating system decides. An RTC without this property has
+      priority 0.
+
+  linux,wakeup-states:
+    $ref: /schemas/types.yaml#/definitions/string-array
+    description:
+      System sleep states an alarm of this RTC wakes the system from,
+      given the board and its firmware. s2idle, shallow and deep are the
+      states of /sys/power/mem_sleep, hibernate is suspend-to-disk and
+      off is the powered-off system, and none, given alone, means the
+      alarm wakes the system from no state. An RTC without this property
+      is taken to wake the system from every state.
+    oneOf:
+      - items:
+          enum:
+            - s2idle
+            - shallow
+            - deep
+            - hibernate
+            - "off"
+      - items:
+          - const: none
+
   quartz-load-femtofarads:
     description:
       The capacitive load of the quartz(x-tal), expressed in femto

-- 
2.43.0



