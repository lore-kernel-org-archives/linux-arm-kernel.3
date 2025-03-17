Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56E4AC35FF3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Mar 2025 07:18:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=9ieS8Pl6lKwwCqMazJxamsOY+afGeucqj0mgpDAlt6g=; b=CMnRSFmTVkQwmsPYRai6Rodxfv
	i8dxs4y7ibmNUtw1zwg+tfPCfvmqullByh3xf2d/awxbHeYfdmVfB3B2B8hHBK0cmDk1EFrNQJRWX
	89TUC5l6n7D4Py8IizLYaRmiASxKV4Qo3l+LqnEapEEJOzVCgfDPHN6VWBrssifS6otjfmz4uhccw
	gnxauDyBkgfZQYMSwrugXN4QCvt1LwDoBk3iWxSsa0d9EwBW2YCLaFN+jWquI4fCVvdVF2pgYRFwe
	e3COaKXsiuXL9PJSe8x154ubeuo0fSDThxgztvoZFi1J81Iu0jR6uXx0AShD4XJ66SXrgzE7bBrGe
	v1VQWBHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tu4kD-00000001XH1-3rNV;
	Mon, 17 Mar 2025 07:18:41 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tu4iW-00000001WmO-10wv;
	Mon, 17 Mar 2025 07:16:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 0C702A46D26;
	Mon, 17 Mar 2025 07:11:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4DBD8C4CEEC;
	Mon, 17 Mar 2025 07:16:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742195814;
	bh=wL9gUnrlsPQNAWa/Td3yrEb1Mzg5Mf+QmQXD9OzX72w=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=ef+oFqegpteYd+UM3MsMEVF+QkF5iBAu9RBV02JpdRABpsFtdrILxzUzFMNt58Skz
	 WHp3pq1KvvDwsnON6hggASuw6wYydh0iM9IlnaKrEMVolKCMLW7D+mlJI6QlTYA2bq
	 B4pODHMApmXaxIwZULvAXSHw+p7s0iAp+UvHaB7c2/PKoSLZNVxC/qCpK7t1E0kecp
	 l6zn0638rk9szP0o/lIL631lUGgVgG55pP6jsiHFFX/LXrrwOsExa5wIKwIpb4MSV+
	 CyBqy/xHnQmg5CLyLqE0xYanFJbe9kH4zY2LI8HKDTjKRoYW8arJQ5yK4eNBhUytyQ
	 EPERWtIQ3nxlQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 327E4C282EC;
	Mon, 17 Mar 2025 07:16:54 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Subject: [PATCH 0/7] Baisc devicetree support for Amlogic S6 S7 and S7D
Date: Mon, 17 Mar 2025 15:16:51 +0800
Message-Id: <20250317-s6-s7-basic-v1-0-d653384e41f3@amlogic.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGPM12cC/x3MMQqAMAxA0atIZgNpi1a8ijjUGjVLlQZEKN7d4
 viG/wsoZ2GFsSmQ+RaVM1WYtoF4hLQzyloNlmxH1hrUHtXjElQibo4oOhq85x5qcWXe5Plv0/y
 +Hxwrow1dAAAA
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-serial@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, Xianwei Zhao <xianwei.zhao@amlogic.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=ed25519-sha256; t=1742195812; l=2174;
 i=xianwei.zhao@amlogic.com; s=20231208; h=from:subject:message-id;
 bh=wL9gUnrlsPQNAWa/Td3yrEb1Mzg5Mf+QmQXD9OzX72w=;
 b=DudI+EZbNWKj/cExJWHpLtrhBZq5G0gH1aBEaWY7T5W6Q5fTXxZpYlb0lsmNgLYJ4ScXYKMYM
 63/vxuVARWeAv3IcZip6ckG3PmaVmkDFz9zOOBC3vVCunosibV9eRy9
X-Developer-Key: i=xianwei.zhao@amlogic.com; a=ed25519;
 pk=o4fDH8ZXL6xQg5h17eNzRljf6pwZHWWjqcOSsj3dW24=
X-Endpoint-Received: by B4 Relay for xianwei.zhao@amlogic.com/20231208 with
 auth_id=107
X-Original-From: Xianwei Zhao <xianwei.zhao@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250317_001656_422502_207BA227 
X-CRM114-Status: UNSURE (   7.49  )
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
Reply-To: xianwei.zhao@amlogic.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Amlogic S6 S7 and S7D are application processors designed for
hybrid OTT/IP Set Top Box and high-end media box applications.

Add the new S6 SoC/board device tree bindings.
Add the new S7 SoC/board device tree bindings.
Add the new S7D SoC/board device tree bindings.

Add basic support for the S6 based Amlogic BL209 board, which describes
the following components: CPU, GIC, IRQ, Timer and UART. These are capable of
booting up into the serial console.

Add basic support for the S7 based Amlogic BP201 board, which describes
the following components: CPU, GIC, IRQ, Timer and UART. These are capable of
booting up into the serial console.

Add basic support for the S7D based Amlogic BM202 board, which describes
the following components: CPU, GIC, IRQ, Timer and UART. These are capable of
booting up into the serial console.

Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
---
Xianwei Zhao (7):
      dt-bindings: arm: amlogic: add S6 support
      dt-bindings: arm: amlogic: add S7 support
      dt-bindings: arm: amlogic: add S7D support
      dt-bindings: serial: amlogic,meson-uart: Add compatible string for S6/S7/S7D
      arm64: dts: add support for S6 based Amlogic BL209
      arm64: dts: add support for S7 based Amlogic BP201
      arm64: dts: add support for S7D based Amlogic BM202

 Documentation/devicetree/bindings/arm/amlogic.yaml | 18 ++++
 .../bindings/serial/amlogic,meson-uart.yaml        |  3 +
 arch/arm64/boot/dts/amlogic/Makefile               |  3 +
 .../boot/dts/amlogic/amlogic-s6-s905x5-bl209.dts   | 42 +++++++++
 arch/arm64/boot/dts/amlogic/amlogic-s6.dtsi        | 97 +++++++++++++++++++++
 .../boot/dts/amlogic/amlogic-s7-s805x3-bp201.dts   | 41 +++++++++
 arch/arm64/boot/dts/amlogic/amlogic-s7.dtsi        | 99 ++++++++++++++++++++++
 .../boot/dts/amlogic/amlogic-s7d-s905x5m-bm202.dts | 41 +++++++++
 arch/arm64/boot/dts/amlogic/amlogic-s7d.dtsi       | 99 ++++++++++++++++++++++
 9 files changed, 443 insertions(+)
---
base-commit: 73e4ffb27bb8a093d557bb2dac1a271474cca99c
change-id: 20250221-s6-s7-basic-f300c30877e6

Best regards,
-- 
Xianwei Zhao <xianwei.zhao@amlogic.com>



