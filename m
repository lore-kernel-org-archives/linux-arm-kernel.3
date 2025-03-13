Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFF17C282DE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Mar 2025 09:10:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=edSvTVRYkJB3xj1mbDqSyEie2PDMbiQ6u9jeNdI3H0M=; b=OfTKEvF1K6GZevSYixDt7p508L
	52Gwd1/nRuLNYBii+QkRaY7GbKdvW85v18bi4qXo9MYHQ/8fecoCSoPB1B899jE6Afg0XN6xeanT4
	wp8qBBpaaxTmb4Cg4pacPFWHMk9w9LMCwPM5F1/EcfeoUP4sIlVmGWNxwJUW8HDPueMfOT3YadglT
	7RCE6lU9lIvsign0+DX9JpXkgPT5peqkBDf0NvjY5/Q+adM/W3zXpdlf+NPHoLGePdxetT6ZG/Ep+
	+9RYceP5Ef1NRAX8BcmwIj6aYyveY+1WgBoeSHS69sjkAv6rpz0nRn/d8SLuQTjPx7JEBNjUfQCN0
	pOb2HFJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tseZg-0000000AgA1-0wQN;
	Thu, 13 Mar 2025 09:09:56 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tseWN-0000000AfPI-2GFi;
	Thu, 13 Mar 2025 09:06:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id BDC605C58ED;
	Thu, 13 Mar 2025 09:04:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2521BC4CEE3;
	Thu, 13 Mar 2025 09:06:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741856788;
	bh=1ja7mHZeHudNCodpKe3qYm3l9veMaBwyP3hwIp5NWr4=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=Bza46KCm/po/0NmJzXHx8CnYXBVzoXsebR/FP18uu3aHSfrCWZ+QOuxuVEuFSSJBc
	 jCbDOxAM2uCc2O4fwjiEkLvwvzrzUz/rN97LTIvHHjNTxWnIkUc0TgzgnY6hmKJeRA
	 /TlCY0EbuDfaIoBuhMBBSM7wxSPMg+N3BoHhdcS5rAm4P6tvGBa4ZJiziuuYmaIrsp
	 MH2yGbaERZeIJBoxYjrdENS51UyB6zWZwU5o4aKStl523x9C0eQOSvLnVcfl5eVz1H
	 WUKDuDBhu7s8+l7eLmxoWQSbY0AjtYFe1mJ25zSc0jydgcoDBu/30DkL/4XGWN7b5I
	 5OwzrwagWzv8A==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0803CC282DE;
	Thu, 13 Mar 2025 09:06:28 +0000 (UTC)
From: Kelvin Zhang via B4 Relay <devnull+kelvin.zhang.amlogic.com@kernel.org>
Subject: [PATCH v4 0/3] Add support for Amlogic A4/A5 Reset
Date: Thu, 13 Mar 2025 17:05:33 +0800
Message-Id: <20250313-a4-a5-reset-v4-0-8076f684d6cf@amlogic.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAN2f0mcC/zXMQQqDMBCF4avIrDsho0mMXfUepYtUxxhQI4mUU
 vHuDYVuHnyL9x+QOQXOcK0OSPwKOcS1QF0q6Ce3esYwFEMtay0batApdBoTZ97RmM6wfpJlklA
 eW+IxvH+1+6N4THHBfUrs/g0lO7KyVTWRsNK0SPjhOa5eDGVubpmjD73o4wLn+QVKZgpXnQAAA
 A==
X-Change-ID: 20250313-a4-a5-reset-6696e5b18e10
To: Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Zelong Dong <zelong.dong@amlogic.com>, 
 Conor Dooley <conor.dooley@microchip.com>, 
 Kelvin Zhang <kelvin.zhang@amlogic.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1741856786; l=2180;
 i=kelvin.zhang@amlogic.com; s=20240329; h=from:subject:message-id;
 bh=1ja7mHZeHudNCodpKe3qYm3l9veMaBwyP3hwIp5NWr4=;
 b=+y6YpahXn/H8d6uBxPaLg0oIdcj3Whr285cRL5hi5hAjNJpt/pR8MZbPy74o3ZyW3XZdyiiFL
 yAJEEaYHUltC55VwID1a4W+FwgAxlSZDF2VWghoy11wLeK5un2gSVeB
X-Developer-Key: i=kelvin.zhang@amlogic.com; a=ed25519;
 pk=pgnle7HTNvnNTcOoGejvtTC7BJT30HUNXfMHRRXSylI=
X-Endpoint-Received: by B4 Relay for kelvin.zhang@amlogic.com/20240329 with
 auth_id=148
X-Original-From: Kelvin Zhang <kelvin.zhang@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250313_020631_672489_D5DC4BAF 
X-CRM114-Status: GOOD (  10.51  )
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
Reply-To: kelvin.zhang@amlogic.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Add dt-binding compatibles and device nodes for Amlogic A4/A5 reset.

Imported from f20240918074211.8067-1-zelong.dong@amlogic.com

Changes in v4:
- Remove the superfluous 'items' in the dt-binding.
- Rebasing due to recent upstream changes.

Changes in v3:
- rebase on 'amlogic,t7-reset' patchset
- Link to v2: https://lore.kernel.org/all/20240715051217.5286-1-zelong.dong@amlogic.com/

Changes in v2:
- remove 'amlogic,t7-reset'
- move 'amlogic,c3-reset' to the other enum list
- move reset node from amlogic-a4-common.dtsi to
  amlogic-a4.dtsi/amlogic-a5.dtsi
- Link to v1: https://lore.kernel.org/all/20240703061610.37217-1-zelong.dong@amlogic.com/

---
Zelong Dong (3):
  dt-bindings: reset: Add compatible for Amlogic A4/A5 Reset Controller
  arm64: dts: amlogic: Add Amlogic A4 reset controller
  arm64: dts: amlogic: Add Amlogic A5 reset controller

 .../bindings/reset/amlogic,meson-reset.yaml   | 23 +++--
 .../arm64/boot/dts/amlogic/amlogic-a4-reset.h | 93 ++++++++++++++++++
 arch/arm64/boot/dts/amlogic/amlogic-a4.dtsi   | 10 ++
 .../arm64/boot/dts/amlogic/amlogic-a5-reset.h | 95 +++++++++++++++++++
 arch/arm64/boot/dts/amlogic/amlogic-a5.dtsi   | 10 ++
 5 files changed, 223 insertions(+), 8 deletions(-)
 create mode 100644 arch/arm64/boot/dts/amlogic/amlogic-a4-reset.h
 create mode 100644 arch/arm64/boot/dts/amlogic/amlogic-a5-reset.h

--
2.35.1

---
Zelong Dong (3):
      dt-bindings: reset: Add compatible for Amlogic A4/A5 Reset Controller
      arm64: dts: amlogic: Add A4 Reset Controller
      arm64: dts: amlogic: Add A5 Reset Controller

 .../bindings/reset/amlogic,meson-reset.yaml        | 22 +++--
 arch/arm64/boot/dts/amlogic/amlogic-a4-reset.h     | 93 +++++++++++++++++++++
 arch/arm64/boot/dts/amlogic/amlogic-a4.dtsi        |  8 ++
 arch/arm64/boot/dts/amlogic/amlogic-a5-reset.h     | 95 ++++++++++++++++++++++
 arch/arm64/boot/dts/amlogic/amlogic-a5.dtsi        | 10 +++
 5 files changed, 220 insertions(+), 8 deletions(-)
---
base-commit: 9fbcd7b32bf7c0a5bda0f22c25df29d00a872017
change-id: 20250313-a4-a5-reset-6696e5b18e10

Best regards,
-- 
Kelvin Zhang <kelvin.zhang@amlogic.com>



