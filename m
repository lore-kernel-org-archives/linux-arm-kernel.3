Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3774ECA9EC7
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 11 Oct 2026 17:17:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=8VmkDx58J0TBOUJginkTfXCrFEvrgeOjW4e8cJyBLn8=; b=01tIXxR5M/9/eLrSjdXh1WiPqM
	LY9u9/0Ki4/Tv0R20wb3dVM8yJbygekaczBk/JULeimrRBldsjHgVtcyxz6r8osz2AfNg7mRD/YtG
	t3f38efkz73U8AlFYKzkVQBZVN/U49djRTIiqGPhhk2ZxZss2CyQv5QM1OkVP3UDPtOjQlF4UodDj
	xVAlvT6KhpiVf17Uz/HsCzpbbEwByBZZikwzdRUbZOKkPVBn01JXntf326YJZXf9k8Sz9eiHRygEZ
	7suz9GMyyRX/qLngfO9LeTYDD/tL2t2k/1wGttU5bYOHiWM2AvJrt0Z0klQAaO1pz8Ho0ZVJeTFjt
	443NF6Lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFxAr-00000009FGC-3yra;
	Sun, 11 Oct 2026 17:17:25 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFxAq-00000009FFY-2RoV;
	Sun, 11 Oct 2026 17:17:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 33BE160142;
	Sun, 11 Oct 2026 17:17:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D0A67C2BCF5;
	Sun, 11 Oct 2026 17:17:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1791739041;
	bh=ae1bPrtDyGrs2a0laMfc/OYJpM4BBJvlclfzCOSwtR0=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=jB3hNoR78WKmXQ4L9Wp5ay6zJxrncwO8yUKiLo91/ijokXW1OkCpGgJK5juaHAMfU
	 X/iVHNW4yaVbXyDOCCPVDdHoJ3TwncOBQHFliwcxhdN4gUHG5AgLXoaCk/idXTVCOn
	 17YTgZip5W+1hw4d8+KY2IgqkcNw9YSmuHWjSsQHgVZ9WT2gcyaHp3VcxgqRUvQ0jq
	 s71OzZTMb+FovxXwvz5HYfuhBN7sUvQ8tD8aQRooLH/F5Yh89PqO+FNxHcihf9zFgB
	 izTgKYJD36EV88n49Vxyk3BqhrU9d9eqb1Ais8pXgsc302ymDzn1f17Txhb5+3sPks
	 d6sCgpdAAZ3Yg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC7C1CA9ECF;
	Sun, 11 Oct 2026 17:17:21 +0000 (UTC)
From: Fil Dunsky via B4 Relay <devnull+filipp.dunsky.gmail.com@kernel.org>
Subject: [PATCH 0/2] arm64: dts: meson-gxbb-odroidc2: eFuse MAC address and
 LED properties
Date: Sun, 11 Oct 2026 20:17:20 +0300
Message-Id: <20261011-odroidc2-dts-v1-0-f9f0e779af88@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQ5AMBBA0avIrDXptFi4iljQDsZCpYNIxN0Vy
 7f4/wKhyCRQZxdEOlg4LAmYZ+CmbhlJsU8Go02FGlEFHwN7Z5TfRJW2031lCmsdQkrWSAOf365
 pf8vez+S29wH3/QBRMK56cAAAAA==
X-Change-ID: 20261011-odroidc2-dts-53a0b62433c1
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Fil Dunsky <filipp.dunsky@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791739040; l=1059;
 i=filipp.dunsky@gmail.com; s=20260930; h=from:subject:message-id;
 bh=ae1bPrtDyGrs2a0laMfc/OYJpM4BBJvlclfzCOSwtR0=;
 b=GVJBAWBcJccI7BftcnfSOQBKjaaNNOT8mkWe4pU5mIhBCjmUdbK1NotBESevNbZMlvCPP5WJD
 YvfS4QJfZUVAo8pp02GouscmEfXDjIGElN+Ru7FNwfYLmLpSzeqrrLF
X-Developer-Key: i=filipp.dunsky@gmail.com; a=ed25519;
 pk=JAYP8e2rJ54DHOmhNtXud8rl1igAaAXoOHxtJmVXI1g=
X-Endpoint-Received: by B4 Relay for filipp.dunsky@gmail.com/20260930 with
 auth_id=1085
X-Original-From: Fil Dunsky <filipp.dunsky@gmail.com>
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
Reply-To: filipp.dunsky@gmail.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Two small device-tree updates for the Hardkernel ODROID-C2, found while
adding OpenWrt support for the board.

Patch 1 wires the eth_mac eFuse nvmem cell (already described in
meson-gx.dtsi, but so far unused) to the Ethernet controller, so the
kernel reads the factory MAC address itself instead of relying on the
bootloader or a random fallback.

Patch 2 converts the blue status LED to the standard color/function
properties.

Both verified on ODROID-C2 hardware and rechecked against this tree
with CHECK_DTBS=y W=1.

Signed-off-by: Fil Dunsky <filipp.dunsky@gmail.com>
---
Fil Dunsky (2):
      arm64: dts: meson-gxbb-odroidc2: read the Ethernet MAC address from eFuse
      arm64: dts: meson-gxbb-odroidc2: use color and function for the status LED

 arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)
---
base-commit: a5ebb76233b79db01e82e061173cb73c6d2b5c6b
change-id: 20261011-odroidc2-dts-53a0b62433c1

Best regards,
--  
Fil Dunsky <filipp.dunsky@gmail.com>



