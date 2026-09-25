Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91156C9832C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Sep 2026 15:14:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=OgJfJJKJ/+laQEfUcYdNtFUFXo5LNry895fTUTwP2ug=; b=YF9QCxsYdAZWLXgUrKqlVVoY5d
	C56+Kepsy84oNajQMsyc7Np3ayvnid1wWP9yA+Weksgod2VnuPLJtQgcLqg7DQoFbPhmpO0lm0xEH
	wmZJIKUgWiPi+azwFVLuba2ph3Aje2ZpDM4655hA6gsMEbnhIsvxY+MEik2+wIHuYIv8e0I3zEXsh
	pETuv2qXLaOl3Mi2Uc7xBZQUc2tkK0M3eXfN51koebwMR0ivxl4QQdWEnLRMMAvYdbWhI9dsuz1k4
	o7VOTohg9323Ep04YkGIQOPlD1+e3UBVBLcUV3VCcQ9PraRha2MqMV5gu6xwMXCIQKAF/fNvnO1JR
	apB3nxdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA7d4-0000000DjBM-0q15;
	Fri, 25 Sep 2026 15:14:26 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA7d2-0000000DjAS-4Ble;
	Fri, 25 Sep 2026 15:14:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 7F5A740726;
	Fri, 25 Sep 2026 15:14:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 51B6BC2BCF6;
	Fri, 25 Sep 2026 15:14:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1790349264;
	bh=BvV2GQqzvOzgjsW3tDmxKxPUarEcjrPWBP2eqzE21fM=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=HJPhbiGCgTKJl9zwGOsbB3OCygkhlc0nDWIjZ+o81/WAbXfGsCZuxVe6slSQTokBd
	 Afww3f7JtX/TYaE9uC9UydeWe6Xm7ULlFYVZ6K460HaUYbY9uhYrFwY3jzPiBdHVNl
	 69XG6E4H08RTz4ayDTzSUTkAPS5+47D9uNW9+bd7GqbiqMdisnrvmoT2JiyXUYYKFS
	 XhQBDPHGXsCokS1B59tHuYDKWf11axooYcWXIRicqUbCfTtt0ErVBCtribbBT3ibHw
	 jv7SkN5i4civLMmYuBSuHbatIyz7gTqq/lFze0RnX2KOus8v8Pu6Npp2dDepB0DI5/
	 dpLfR2Orl5SKQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D1BEC98325;
	Fri, 25 Sep 2026 15:14:24 +0000 (UTC)
From: Ronald Claveau via B4 Relay <devnull+linux-kernel-dev.aliel.fr@kernel.org>
Subject: [PATCH v2 0/3] Add T7 PWM core clock support
Date: Fri, 25 Sep 2026 17:13:27 +0200
Message-Id: <20260925-add-t7-sys-pwm-clk-v2-0-f23a22b71a5c@aliel.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/32NQQ6CMBBFr0Jm7Zi2UaGuvIdhUehUJlYgLakS0
 rtbOYDL95L//gaRAlOEa7VBoMSRp7GAOlTQD2Z8ELItDEqoi9DqhMZaXGqMa8T5/cLeP9EJcq6
 RHZGSUIZzIMefPXpvCw8clyms+0eSP/s3lyQKFOdOS2pqJ4y+Gc/kjy5Am3P+AkX83omzAAAA
X-Change-ID: 20260924-add-t7-sys-pwm-clk-f0eff81bee21
To: =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiner Kallweit <hkallweit1@gmail.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-pwm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, 
 Ronald Claveau <linux-kernel-dev@aliel.fr>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2113;
 i=linux-kernel-dev@aliel.fr; h=from:subject:message-id;
 bh=BvV2GQqzvOzgjsW3tDmxKxPUarEcjrPWBP2eqzE21fM=;
 b=owGbwMvMwCWm1SvKXP3cUInxtFoSQ9a2/l2i6w8dObVVRbIk5sXWuS//fDL1KMnwNvgg+Nppg
 8mzr3t8O0pZGMS4GGTFFFn651qeeHf56Jmve9RTYOawMoEMYeDiFICJeKcxMhzofRLKF3mzWUP3
 6iQV97xpf3bvcxA7fktmUcQ883mNfEUM/2P/RN7w3ty3Nf/rlZwv9+Y9CklbxLbw27Vqnj+HGzb
 ceMMOAA==
X-Developer-Key: i=linux-kernel-dev@aliel.fr; a=openpgp;
 fpr=DFD863F61375BF917F0012173953305EF1D0EC3E
X-Endpoint-Received: by B4 Relay for linux-kernel-dev@aliel.fr/default with
 auth_id=744
X-Original-From: Ronald Claveau <linux-kernel-dev@aliel.fr>
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
Reply-To: linux-kernel-dev@aliel.fr
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

The PWM controllers on the Amlogic T7 SoC have a system clock that
controls access to the controller, in addition to the two input
clocks of channels A and B.

It is currently not described in the device tree, so it is neither
referenced nor enabled by the driver.

This series adds support for it:

  - patch 1 extends the binding with a third "core" clock for
    amlogic,t7-pwm, and makes clocks/clock-names required for it;
  - patch 2 makes the driver get and enable the optional "core"
    clock, leaving other SoCs unaffected;
  - patch 3 describes the system clock (CLKID_SYS_PWM_*) in the T7
    device tree for all the PWM controllers.

`dt_binding_check DT_SCHEMA_FILES=pwm-amlogic.yaml` test is ok

  CHKDT   ./Documentation/devicetree/bindings
warning: python package 'yamllint' not installed, skipping
  STYLE   ./Documentation/devicetree/bindings
  DTEX    Documentation/devicetree/bindings/pwm/pwm-amlogic.example.dts
  DTC [C] Documentation/devicetree/bindings/pwm/pwm-amlogic.example.dtb

Signed-off-by: Ronald Claveau <linux-kernel-dev@aliel.fr>
---
Changes in v2:
- PATCH 1: Permits to use "core" clock on S4 SoC and all the ones that fallback to it.
           Rename "clk_a" and "clk_b" to "channel-a" and "channel-b". Thx to Conor's feedback.
- PATCH 3: Rename channel clock-names as done on patch 1.
- Link to v1: https://lore.kernel.org/r/20260924-add-t7-sys-pwm-clk-v1-0-05b91e87f0a9@aliel.fr

---
Ronald Claveau (3):
      dt-bindings: pwm: amlogic: Add core clock for T7
      pwm: meson: Add optional core clock for S4 PWM
      arm64: dts: amlogic: t7: Add core clock to PWM controller nodes

 .../devicetree/bindings/pwm/pwm-amlogic.yaml       | 33 ++++++++++++++++++++--
 arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi        | 28 +++++++++++++-----
 drivers/pwm/pwm-meson.c                            |  5 ++++
 3 files changed, 57 insertions(+), 9 deletions(-)
---
base-commit: a8c591ed6b672915e0be57843f943a2a723aff40
change-id: 20260924-add-t7-sys-pwm-clk-f0eff81bee21

Best regards,
-- 
Ronald Claveau <linux-kernel-dev@aliel.fr>



