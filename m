Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FE22C369D3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Apr 2025 10:54:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=AupYURvdJFNPHez1VbmuVVpSIrWvpoBPibSisQh0h0E=; b=st4F4Nv6xNfNu4ayjXsI31uDC1
	JO6b2GEzq/PiEHCMrxFI3aUtIj7dcl+K8H7CgdeM+OXK7eKp3DSvnjwZXTKVD8qzggcL0lY0bd6Sl
	6qQgL31TVHz59XBn0VAe125quZb2wTri85fdERDxp7DnyH7AsSHufNj1XH7TL1jYCriSGB6iptuVQ
	m6PHsUXCDev4COKfALL9K/KogIpfNsPs7BuDRuAFO5z6rE6N8rwiyJaYjFslCf4X8FwIxqLiD5EkL
	XsUoD1+6Ca8q2p35srcKXIjGBFpqZhe8x/9zNUEI87qAIR4aDryT0BfYWDWAoRrNckrgvGAPipZjK
	GtFkM5qA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9M8C-00000005rE0-1Eaq;
	Mon, 28 Apr 2025 10:54:36 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9LyS-00000005pUp-1Z4P;
	Mon, 28 Apr 2025 10:44:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 0BA7E5C5A09;
	Mon, 28 Apr 2025 10:42:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id CA6E7C4CEE4;
	Mon, 28 Apr 2025 10:44:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745837070;
	bh=zoNoOQu9Fld7LEIioJ+wlApw7JJtAWg9ZZxxQWQdkQ0=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=heTRi+KnPNW2vy0rLctBRjFgRRBAennRpA8uIGdIiQhBNfvdzvqU6DnSTx1Zp4aFv
	 TbYJag4bmzfvMg7TCShf9Wda8Mqd1/ZKQOFIVyCS5F0GsnBNvBI9goB7dYul1tltN/
	 61rvK4ioEBvMCl7VN3aGW9PAojxwK0QT7YJfzWiPdFIfxNlTPhK9z6TlfKkZYDU+7T
	 5Jg+d2eKCk7EJ+jE5dmO3E2LGhNGSZd5AJpnHmgk9d8ltqXuaAjkBP2P06cCgaPm6/
	 JElbMQvL7w9txpTdN/eRb/CzMV6mKDCZLPsHaG6kccIIY8BGk5ejXsderrw7gHU8/9
	 wkQhQsNZoVspw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9F57C369D3;
	Mon, 28 Apr 2025 10:44:30 +0000 (UTC)
From: =?utf-8?q?J=2E_Neusch=C3=A4fer_via_B4_Relay?= <devnull+j.ne.posteo.net@kernel.org>
Subject: [PATCH v2 0/4] Board support for Fernsehfee 3.0
Date: Mon, 28 Apr 2025 12:44:27 +0200
Message-Id: <20250428-fernsehfee-v2-0-293b98a43a91@posteo.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAtcD2gC/03MTQ7CIBiE4as031oMP2KjK+9husB2EDbQACGah
 ruLjQuX7yTzbJSRPDJdh40Sqs8+hh7yMNDsTHiC+aU3SS41V0IzixQynAXYQxvYi+KzGUH9sCZ
 Y/9qx+9Tb+Vxieu92Fd/1x0j1z1TBOJNnKdRJzIsazW2NuSAeAwpNrbUPE2O1saUAAAA=
X-Change-ID: 20250315-fernsehfee-b5aef930ca7e
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1745837069; l=1421;
 i=j.ne@posteo.net; s=20240329; h=from:subject:message-id;
 bh=zoNoOQu9Fld7LEIioJ+wlApw7JJtAWg9ZZxxQWQdkQ0=;
 b=sloiws7PjerztavFOh+WRSwUGtcJ8z57ukYOGobwKBpWoMWMkPQdnhNLJFGvr24RatYRu5di8
 GLTh5fOlEknAphpjgeeMJ/wjmSSrkPR/7ufDGiz/ou72uuoN0GwH3MD
X-Developer-Key: i=j.ne@posteo.net; a=ed25519;
 pk=NIe0bK42wNaX/C4bi6ezm7NJK0IQE+8MKBm7igFMIS4=
X-Endpoint-Received: by B4 Relay for j.ne@posteo.net/20240329 with
 auth_id=156
X-Original-From: =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250428_034432_519940_58D2C8FE 
X-CRM114-Status: UNSURE (   7.64  )
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
Reply-To: j.ne@posteo.net
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Fernsehfee[1] ("TV fairy") is a family of set-top boxes marketed as
ad-blocking appliances. This patchset adds board support in the form of
a device tree for the third generation, Fernsehfee 3.0.

[1]: https://fernsehfee.de/ (German), https://www.telefairy.com/ (English)

Signed-off-by: J. Neuschäfer <j.ne@posteo.net>
---
Changes in v2:
- Apply ACKs from Krzysztof Kozlowski and R-b from Neil Armstrong and Martin Blumenstingl
- New patch 4/4 to describe PMIC regulators, after discussion with Martin Blumenstingl
- Link to v1: https://lore.kernel.org/r/20250323-fernsehfee-v1-0-2621341cd37a@posteo.net

---
J. Neuschäfer (4):
      dt-bindings: vendor-prefixes: Add TC Unterhaltungselektronik AG
      dt-bindings: arm: amlogic: Add TCU Fernsehfee 3.0 board
      ARM: dts: amlogic: Add TCU Fernsehfee 3.0
      ARM: dts: amlogic: meson8-fernsehfee3: Describe regulators

 Documentation/devicetree/bindings/arm/amlogic.yaml |   1 +
 .../devicetree/bindings/vendor-prefixes.yaml       |   2 +
 arch/arm/boot/dts/amlogic/Makefile                 |   1 +
 arch/arm/boot/dts/amlogic/meson8-fernsehfee3.dts   | 306 +++++++++++++++++++++
 arch/arm/boot/dts/amlogic/meson8.dtsi              |  18 ++
 5 files changed, 328 insertions(+)
---
base-commit: 9c8bd75378d70cd6087d503eb8317d1eea67164a
change-id: 20250315-fernsehfee-b5aef930ca7e

Best regards,
-- 
J. Neuschäfer <j.ne@posteo.net>



