Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BC3A606A330
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Nov 2026 17:24:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=2K/GBKUg;
	dkim=pass (1024-bit key, unprotected) header.d=cyberchaos.dev header.i=@cyberchaos.dev header.a=rsa-sha256 header.s=mail header.b=wg6FE/U5
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=ProipenWM1wsykY7V3fdTvREC7WOIdzWpyQEuX+SOqo=; b=2K/GBKUgtjv9QqoXaAlHnoQSbg
	ZMpMM1P2QK59d8iHCq2JEB6ZMRybtlaCLNRt6+cURguOpYhoFbZHBXmY+aaGius6zaDoZ2YQhOQqs
	RwImcuHCh01mHnoW6wCIRznU3GhrxdofP3f9Tikgl/Qm55rBfCFCtL+QI/4IjGl6tUaPjjlmOx5H2
	Qq05PA8uxD0KMs6GfNmLAPJ4ZvZRxsEIJ2t8rhHOtJEZxXWr10Oc5/tpgkc5ik/lFp2l6VzWbaa7i
	GWtAw71ENYvD3JErglQb9O5P8hSE05wDEL8BuFSMaktDL748h9qrMwP1IZRHDIxJZyt6R+WYS59Yw
	F/4C7pZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOej4-00000006Bcn-3lMk;
	Wed, 04 Nov 2026 17:24:42 +0000
Received: from [2a0f:4ac0::3a11] (helo=mail.cyberchaos.dev)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOeiy-00000006BMK-3AW6
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Nov 2026 17:24:40 +0000
From: Yureka Lilian <yureka@cyberchaos.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cyberchaos.dev;
	s=mail; t=1793813061;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ProipenWM1wsykY7V3fdTvREC7WOIdzWpyQEuX+SOqo=;
	b=wg6FE/U535xAqcV/smG3wF/uGO6wTvQMZGhOdf9od3sA8JWLM7ckyDoP+lG9NX0jNCyJmZ
	AxSPdzrYw1sVf/zQ3wuXy7wv0qpQlB0Ndo1cqgcppNag7faXln6WNaQ6vFxt3FtBntYdz/
	2CDFuc2ChXyNAOx1mfXg3dzjQWe0qtc=
Subject: [PATCH v2 0/9] Initial Apple Silicon M5 device trees and
 dt-bindings
Date: Wed, 04 Nov 2026 18:24:13 +0100
Message-Id: <20261104-apple-m5-initial-devicetrees-v2-0-fd727a82d380@cyberchaos.dev>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/32Pyw6CMBBFf4V07Zi2WFBX/odhQdtRxiBgW4iE8
 O+Wx9rlTe6cc2diHh2hZ9dkYg4H8tQ2MchDwkxVNk8EsjEzyWUmuMig7Loa4a2AGgpU1mDjlcH
 gED2cLHJ9ydVFp5pFROfwQd8Vfy+27Hv9QhMW5tKoyIfWjat/EEtvV8n8v2oQwEGkKhNnoY3i9
 mZGjS6Obv0xFlkxb0KHnz6+FfYV8/wDpk9Fl/QAAAA=
X-Change-ID: 20261016-apple-m5-initial-devicetrees-4de0b9759b3b
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>, Thomas Gleixner <tglx@kernel.org>, 
 Radu Rendec <radu@rendec.net>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, Hector Martin <marcan@marcan.st>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, 
 Sasha Finkelstein <k@chaosmail.tech>, Linus Walleij <linusw@kernel.org>, 
 Mark Kettenis <kettenis@openbsd.org>, Andi Shyti <andi.shyti@kernel.org>
Cc: Yureka Lilian <yureka@cyberchaos.dev>, asahi@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-pwm@vger.kernel.org, 
 linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261104_092436_970567_28D0413F 
X-CRM114-Status: GOOD (  11.55  )
X-Spam-Score: -1.3 (-)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi,

This series adds initial device trees and dt-bindings for the Apple
Silicon devices using the M5 (t8142) SoCs.

This series covers only a minimal amount of hardware, which is useful
as a basis for future developments. The hardware added here has remained
largely unchanged from the earlier Apple Silicon generations.

I applied some version of dt-check-style formatting to all new files
with the exception of the generated pmgr nodes.

Merge strategy:
Since there are no actual driver changes, we'd prefer to merge the
dt-bindings changes through the apple-soc tree once Acked by the
respective maintainers.

Signed-off-by: Yureka Lilian <yureka@cyberchaos.dev>
---
Changes in v2:
- Dropped the watchdog dt-bindings commit, as it's been applied to the
  watchdog tree
- Fixed ordering of pinctrl dt-bindings list
- Link to v1: https://patch.msgid.link/20261027-apple-m5-initial-devicetrees-v1-0-1356181bc50d@cyberchaos.dev

To: Sven Peter <sven@kernel.org>
To: Janne Grunau <j@jannau.net>
To: Neal Gompa <neal@gompa.dev>
To: Thomas Gleixner <tglx@kernel.org>
To: Radu Rendec <radu@rendec.net>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>
To: Hector Martin <marcan@marcan.st>
To: Uwe Kleine-König <ukleinek@kernel.org>
To: Sasha Finkelstein <k@chaosmail.tech>
To: Linus Walleij <linusw@kernel.org>
To: Mark Kettenis <kettenis@openbsd.org>
To: Andi Shyti <andi.shyti@kernel.org>
Cc: asahi@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-pwm@vger.kernel.org
Cc: linux-gpio@vger.kernel.org
Cc: linux-i2c@vger.kernel.org

---
Yureka Lilian (9):
      dt-bindings: interrupt-controller: apple,aic2: Add t8142 compatible
      dt-bindings: arm: cpus: Add Apple M5 CPU core compatibles
      dt-bindings: arm: power: apple,pmgr-pwrstate: Add t8142 compatible
      dt-bindings: arm: apple: apple,pmgr: Add t8142 compatible
      dt-bindings: pwm: apple,s5l-fpwm: Add t8142 compatible
      dt-bindings: pinctrl: apple,pinctrl: Add t8142 compatible
      dt-bindings: i2c: apple,i2c: Add t8142 compatible
      dt-bindings: arm: apple: Add M5 based devices
      arm64: dts: apple: Add minimal t8142 (M5) device trees

 Documentation/devicetree/bindings/arm/apple.yaml   |   15 +
 .../devicetree/bindings/arm/apple/apple,pmgr.yaml  |    1 +
 Documentation/devicetree/bindings/arm/cpus.yaml    |    2 +
 .../devicetree/bindings/i2c/apple,i2c.yaml         |    1 +
 .../bindings/interrupt-controller/apple,aic2.yaml  |    1 +
 .../devicetree/bindings/pinctrl/apple,pinctrl.yaml |    3 +
 .../bindings/power/apple,pmgr-pwrstate.yaml        |    1 +
 .../devicetree/bindings/pwm/apple,s5l-fpwm.yaml    |    1 +
 arch/arm64/boot/dts/apple/Makefile                 |    3 +
 arch/arm64/boot/dts/apple/t8142-j704.dts           |   36 +
 arch/arm64/boot/dts/apple/t8142-j813.dts           |   36 +
 arch/arm64/boot/dts/apple/t8142-j815.dts           |   36 +
 arch/arm64/boot/dts/apple/t8142-jxxx.dtsi          |   50 +
 arch/arm64/boot/dts/apple/t8142-pmgr.dtsi          | 1131 ++++++++++++++++++++
 arch/arm64/boot/dts/apple/t8142.dtsi               |  512 +++++++++
 15 files changed, 1829 insertions(+)
---
base-commit: b01f6764df0254308bf0c33b9f7ef01ef4975d28
change-id: 20261016-apple-m5-initial-devicetrees-4de0b9759b3b

Best regards,
--  
Yureka Lilian <yureka@cyberchaos.dev>


