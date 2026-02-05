Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2B7DE91266
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Feb 2026 06:04:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=5IpDHy8jM0plfyUnky7jH31sN1HtLB4Q77kKPXYLOCA=; b=kMvMGtWtgzjEQIye+WKGJCEzE9
	n9YU0RLepiM4FKSePqIVjMaJ+DyMU5uhBsCtfbrn/DClbMD/Rof5LUlXIRec5wTRrqG19h4Qux9rA
	0AE1FZCt12LLLqcO6k0flaNQTiCuh1+NS0+s14OJhBIL6LJdUKnD6Ot1/hJOTi5cfZFITSA6ra5uz
	aZ+kdhd1qZomoaQhqGKM7W957fVKWb9vpm+r4ecVXnBL+b56qk2IxEx0Du6UJX2IHahfnO6O8jGgc
	t8nGQkY155OZiQjYnzIEKz2uLO476VRV5UHGDXMQl0LrSvoVYG0qjZdJSTrZwyK+3ye6uDIZ9jZAl
	DsnRibHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnsTL-00000009Tao-2Q2F;
	Thu, 05 Feb 2026 06:04:11 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnsTH-00000009TYr-18s8;
	Thu, 05 Feb 2026 06:04:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E226943C52;
	Thu,  5 Feb 2026 06:04:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id BD55BC4CEF7;
	Thu,  5 Feb 2026 06:04:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770271445;
	bh=ps7j2+Z67QCIPw991CX7xaz/DhDRBR1m3knxUYmHUEk=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=RZV8p2IwkhcO4+zokH5xJsweYtkag2g+8gpUvEwo+cJDnWJLyHNJATUWnNvLZTF7m
	 bm6CfH2g9q0jTH7wKx0fEkGSbls97UOEvcNtF+hxT4rLkc58NcTARdXFIAmzVKa8iX
	 l5Sk1opzAJlydj/CPpOzeCo9c9TgmrCU6G7yjFSAwkt+4ZbBX/3xnFJd9K95WCSjm9
	 ScB9PvVVrh/4MXwmuGkgrdDyMc/stZNqnmh6AERZlnZjfMNGJiKeBDTtoDwfONwGOD
	 WpgqXzkfAQ2CnTFmjkE57bJjQaFNl1PWTKXjaiJ9ZpoylSpdZfVc0Cq3qoXuU/fPSW
	 0WdcYy1eyVDJA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B092CE91263;
	Thu,  5 Feb 2026 06:04:05 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Subject: [PATCH 0/3] baisc devicetree support for Amlogic A9
Date: Thu, 05 Feb 2026 06:04:01 +0000
Message-Id: <20260205-a9-baisc-dts-v1-0-1212b46f95a7@amlogic.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANEyhGkC/x3MMQqAMAxA0atIZgNpQVGvIg5tTTVLlUZEKN7d4
 viG/wsoZ2GFqSmQ+RaVI1WYtoGwu7QxyloNlmxPljp0I3onGnC9FIP3ni2TiQNBTc7MUZ5/Ny/
 v+wGIh2F0XgAAAA==
X-Change-ID: 20260205-a9-baisc-dts-cbbbe2e01f80
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
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770271444; l=870;
 i=xianwei.zhao@amlogic.com; s=20251216; h=from:subject:message-id;
 bh=ps7j2+Z67QCIPw991CX7xaz/DhDRBR1m3knxUYmHUEk=;
 b=a/G09XieespzzJlySSaPDZ0TgKEJThWA1puCkS6knfHGGWUWbLvYbDZKpVmF0Xd1NCxulbqAx
 R4kjdoSHiYDDIqCUmlxkhluqDOhCAktxMfVEDPOTxXOnDV/GDsFK54a
X-Developer-Key: i=xianwei.zhao@amlogic.com; a=ed25519;
 pk=dWwxtWCxC6FHRurOmxEtr34SuBYU+WJowV/ZmRJ7H+k=
X-Endpoint-Received: by B4 Relay for xianwei.zhao@amlogic.com/20251216 with
 auth_id=578
X-Original-From: Xianwei Zhao <xianwei.zhao@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260204_220407_368741_70CF7204 
X-CRM114-Status: UNSURE (   7.51  )
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

Add the new A9 SoC/board device tree and related bindings.

Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
---
Xianwei Zhao (3):
      dt-bindings: arm: amlogic: add A311Y3 support
      dt-bindings: serial: amlogic,meson-uart: Add compatible string for A9
      arm64: dts: add support for A9 based Amlogic BY401

 Documentation/devicetree/bindings/arm/amlogic.yaml |   6 +
 .../bindings/serial/amlogic,meson-uart.yaml        |   1 +
 arch/arm64/boot/dts/amlogic/Makefile               |   1 +
 .../boot/dts/amlogic/amlogic-a9-a311y3-by401.dts   |  41 +++++++
 arch/arm64/boot/dts/amlogic/amlogic-a9.dtsi        | 127 +++++++++++++++++++++
 5 files changed, 176 insertions(+)
---
base-commit: e3194dfb772304a1b7ca3bcfccacefec3468b7bf
change-id: 20260205-a9-baisc-dts-cbbbe2e01f80

Best regards,
-- 
Xianwei Zhao <xianwei.zhao@amlogic.com>



