Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FD63CA9EC1
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 10 Oct 2026 17:00:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=fLXZZ1L151t45JkonBfBOtO5v8S6SRCwNhIl/Wras5E=; b=EIKbp83ug9DMaH
	VtHrYZiDoT07P8gbVoV7x/Hn0luu0X5G/zcjKmKjZw17j2Ouibk9W7iVYJzfMjOTh1mO36x5EV8Mi
	7gsraMMyil4eAwNxe0imNs6k0VmCk5QW1li1ydoBunnd15vMccK56FGUs65YfexYQdR/OI51HvbsD
	5etbPGPEpDVrORHYzTL+ky9h7DDN/qgTV3rpvxWXT4biz9cmGelSWsSC6/Yb5PbqavPZTZre9zf1x
	5dnky1h1XNsTtBJRJDFbsx/zQtge4H9PCDQUsiKHLeo5mLMAuJbeGn/3q0rvp2q+iaadoTBLEUi8Q
	MaIHtxhgREnOWQcwAzbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFaR1-00000008IKK-2369;
	Sat, 10 Oct 2026 17:00:35 +0000
Received: from [195.39.247.168] (helo=mail.cyberchaos.dev)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFaQc-00000008ICS-3w8P
	for linux-arm-kernel@lists.infradead.org;
	Sat, 10 Oct 2026 17:00:13 +0000
From: Yureka Lilian <yureka@cyberchaos.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cyberchaos.dev;
	s=mail; t=1791651587;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=fLXZZ1L151t45JkonBfBOtO5v8S6SRCwNhIl/Wras5E=;
	b=T1j59MlIQ02HMioEi8fSfn3jZTsHeZ22K09+7AWoJocubbDHljKcCSKRRhuhZrJo8cT9dg
	Bv6Kq6bxwDmCgsXblNc7hrQNX4dQKY5hbxaxlBMMKVTi5NA/Fke1E9wfx1DoYzinamUEkO
	ZM2QMKbpBMmatJxF1MdvGh3nZ2uAzoo=
Subject: [PATCH 00/10] Initial Apple Silicon M4 Pro/Max device trees and
 dt-bindings
Date: Sat, 10 Oct 2026 18:59:21 +0200
Message-Id: <20261010-apple-m4-pro-max-initial-devicetrees-v1-0-781fb3f2d9f6@cyberchaos.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXNwQ6CMBCE4Vche3aTUoyir2I4LGXQNVCathoSw
 rtb9fgd5p+NEqIi0bXaKOKtSRdfUB8qcg/xd7AOxWSNPdXGXFhCmMDzkUNceJaV1WtWmXgoa4c
 cgcSu6W0zylnaFlRSIWLU9Xdz6/5Or/4Jl79t2vcPRsMu4ogAAAA=
X-Change-ID: 20261009-apple-m4-pro-max-initial-devicetrees-c3b23fa7a88e
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>, Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
 Radu Rendec <radu@rendec.net>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 Hector Martin <marcan@marcan.st>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, 
 Sasha Finkelstein <k@chaosmail.tech>, Linus Walleij <linusw@kernel.org>, 
 Mark Kettenis <kettenis@openbsd.org>, Andi Shyti <andi.shyti@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org, 
 linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org, 
 Yureka Lilian <yureka@cyberchaos.dev>, Florian Klink <flokli@flokli.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261010_100011_181481_30082016 
X-CRM114-Status: UNSURE (   9.84  )
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

Hi,

This series adds initial device trees and dt-bindings for the Apple
Silicon devices using the M4 Pro/Max (t6040/t6041) SoCs.

This series covers only a minimal amount of hardware, which is useful
as a basis for future developments. The hardware added here has remained
largely unchanged between the M3 and M4 generations.

The dt-bindings changes should be mostly boring (in a good way!). The
device trees themselves are roughly organized into the MacBook Pro
models on one side (t604x-j614-j616) and the Mac mini and Mac Studio on
the other side (t604x-j575-j773). I'm hoping to re-use these dtsi files
for the M5 Pro/Max versions of these machines in the future.
I applied some version of dt-check-style formatting to all new files
with the exception of the generated pmgr nodes.

Merge strategy:
Since there are no actual driver changes, we'd prefer to merge the
dt-bindings changes through the apple-soc tree once Acked by the
respective maintainers.

Thanks,

Yureka

Signed-off-by: Yureka Lilian <yureka@cyberchaos.dev>
---
Yureka Lilian (10):
      dt-bindings: watchdog: apple,wdt: Add t6041 compatible
      dt-bindings: interrupt-controller: apple,aic2: Add t6041 compatible
      dt-bindings: arm: cpus: Add Apple M4 Pro/Max CPU core compatibles
      dt-bindings: arm: power: apple,pmgr-pwrstate: Add t6041 compatible
      dt-bindings: arm: apple: apple,pmgr: Add t6041 compatible
      dt-bindings: pwm: apple,s5l-fpwm: Add t6041 compatible
      dt-bindings: pinctrl: apple,pinctrl: Add t6041 compatible
      dt-bindings: i2c: apple,i2c: Add t6041 compatible
      dt-bindings: arm: apple: Add M4 Pro/Max based devices
      arm64: dts: apple: Add minimal t604x (M4 Pro/Max) device trees

 Documentation/devicetree/bindings/arm/apple.yaml   |   26 +
 .../devicetree/bindings/arm/apple/apple,pmgr.yaml  |    1 +
 Documentation/devicetree/bindings/arm/cpus.yaml    |    2 +
 .../devicetree/bindings/i2c/apple,i2c.yaml         |    1 +
 .../bindings/interrupt-controller/apple,aic2.yaml  |    3 +
 .../devicetree/bindings/pinctrl/apple,pinctrl.yaml |    1 +
 .../bindings/power/apple,pmgr-pwrstate.yaml        |    1 +
 .../devicetree/bindings/pwm/apple,s5l-fpwm.yaml    |    1 +
 .../devicetree/bindings/watchdog/apple,wdt.yaml    |    1 +
 arch/arm64/boot/dts/apple/Makefile                 |    6 +
 arch/arm64/boot/dts/apple/t6040-j614s.dts          |   24 +
 arch/arm64/boot/dts/apple/t6040-j616s.dts          |   24 +
 arch/arm64/boot/dts/apple/t6040-j773s.dts          |   28 +
 arch/arm64/boot/dts/apple/t6040.dtsi               |   65 +
 arch/arm64/boot/dts/apple/t6041-j575c.dts          |   22 +
 arch/arm64/boot/dts/apple/t6041-j614c.dts          |   18 +
 arch/arm64/boot/dts/apple/t6041-j616c.dts          |   18 +
 arch/arm64/boot/dts/apple/t6041-pmgr.dtsi          | 2297 ++++++++++++++++++++
 arch/arm64/boot/dts/apple/t6041.dtsi               |  713 ++++++
 arch/arm64/boot/dts/apple/t604x-j575-j773.dtsi     |   47 +
 arch/arm64/boot/dts/apple/t604x-j614-j616.dtsi     |   65 +
 21 files changed, 3364 insertions(+)
---
base-commit: a8ac6027e82415f431bbba49ab535c44f2edaf4d
change-id: 20261009-apple-m4-pro-max-initial-devicetrees-c3b23fa7a88e

Best regards,
--  
Yureka Lilian <yureka@cyberchaos.dev>


