Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75862C98315
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Sep 2026 05:51:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=6tPOALNahWHqHIVZN21Pvs+g54qxXCo2LbDBwrp9/+E=; b=AMjDPLROLYtTcRs817gjSJvBHp
	wflMYG8gdixS6j8M3Dgk1q6pYKL7LxQm/CSLfLGYzyz1lzaXGWrvp+M8C/tpKTx309/sx0Xf6AfOb
	QqZexh3QwuR/Bvqjn/wdoPoCrWeVY39VFV5ylqtYPyWz74T/lA0+Ap4r2R2S/bA5bufIDHyKZY339
	cGTIjojuVRKqDtAUOU5MUqdvAYkRHVw/KcstzBxYoT33NLyNmAib4KvRqK1YCRrN1u2bLinKH9Vwm
	OZ+QNvHMxbLpWJpSrYgCJie6rgfpZBXwLN8CHKu2VVCS5uv4WM6VDRXLQmbcQYgoDwpzGUIPBLpvR
	BGStw3Zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9cMX-0000000A5NZ-3UVG;
	Thu, 24 Sep 2026 05:51:17 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9cMU-0000000A5MJ-2vt8;
	Thu, 24 Sep 2026 05:51:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id F090143AAE;
	Thu, 24 Sep 2026 05:51:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C02B4C2BCB3;
	Thu, 24 Sep 2026 05:51:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1790229073;
	bh=J2rvWMrWhfMqJAxvspLLK2ASHYw7aRT+eq8Zg90zFtk=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=DstY5oTp1Vkt9K1FI1qHqfG6M1Gfl23cfKGRTkKXwM2ADIiSkL82yi4isvytH6AM2
	 McerR94eQqPixknmyHbu8A5rOEKZGTW4cBJ8wtMwetkgUbUUEM+ycqwJvnik8iNcie
	 HFqm/9+XvA3L/mwmjC+G/wLA1o/kHUBe7mV0TkmpSLpGPdALUHUxBvdwSCyweJVu/I
	 Bp7HRhQSwBsSs5of/0yL471gXTQcj+ZepY4TFOi93Ed0i86APYnHow0a+t8sQwylkz
	 uA/EakmK0zjgNhn6zBcfN33d6EBcKcTQ3Qg9kxjSivaRImwzi1DCTMiJQmHQfwWsMQ
	 W49SmhDsNBNzQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB153C98312;
	Thu, 24 Sep 2026 05:51:13 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Subject: [PATCH v2 0/3] t7: add some nodes for Amlogc t7.
Date: Thu, 24 Sep 2026 05:51:07 +0000
Message-Id: <20260924-t7-node-new-v2-0-319d3c19b4b2@amlogic.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEu6tGoC/23MQQ6CMBCF4auQWTtmWhXQlfcwLKAdYBJpSUtQQ
 3p3K2uX/0vet0HkIBzhVmwQeJUo3uXQhwLM2LqBUWxu0KRLumrCpULnLaPjF55qZZXpL7amCvJ
 jDtzLe9ceTe5R4uLDZ8dX9Vv/O6tCQi6Z6jMZ1VF3b6enH8QcjZ+gSSl9AbmULGOoAAAA
X-Change-ID: 20260920-t7-node-new-381d1cf5d807
To: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: linux-spi@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org, 
 Xianwei Zhao <xianwei.zhao@amlogic.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790229071; l=1152;
 i=xianwei.zhao@amlogic.com; s=20251216; h=from:subject:message-id;
 bh=J2rvWMrWhfMqJAxvspLLK2ASHYw7aRT+eq8Zg90zFtk=;
 b=pk1EoyJAcbEiAZfM1ScQgUu79YaZw6QFQ0zRa71tyYhp1YfLQUuy2vnXEJLl2PpMw0YSbF2ah
 AVsUqKh0ENfDZuNFX3CqSwHkpYIjSzjIQMoEZd0H4WQK5h04/u4geS6
X-Developer-Key: i=xianwei.zhao@amlogic.com; a=ed25519;
 pk=dWwxtWCxC6FHRurOmxEtr34SuBYU+WJowV/ZmRJ7H+k=
X-Endpoint-Received: by B4 Relay for xianwei.zhao@amlogic.com/20251216 with
 auth_id=578
X-Original-From: Xianwei Zhao <xianwei.zhao@amlogic.com>
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

Add device tree descriptions for the peripherals on the Amlogic T7
SoC and the T7 A311D2 AN400 board.

Add the Amlogic T7 SPICC compatible to the device tree binding. 
Add the T7 compatible to the Meson DWMAC binding

Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
---
Changes in v2:
- Make some modifications according to the Sashiko AI's reviews.
- Link to v1: https://lore.kernel.org/r/20260920-t7-node-new-v1-0-e6e0840c1b0b@amlogic.com

---
Xianwei Zhao (3):
      spi: dt-bindings: amlogic,meson-gx-spicc: add T7 compatible
      dt-bindings: net: meson-dwmac: add T7 support
      arm64: dts: amlogic: add T7 peripheral nodes

 .../bindings/net/amlogic,meson-dwmac.yaml          |  17 +
 .../bindings/spi/amlogic,meson-gx-spicc.yaml       |  13 +-
 .../boot/dts/amlogic/amlogic-t7-a311d2-an400.dts   | 153 +++++++
 arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi        | 462 +++++++++++++++++++++
 4 files changed, 641 insertions(+), 4 deletions(-)
---
base-commit: a2530c83c458a503e55219966217dfd1c36a385e
change-id: 20260920-t7-node-new-381d1cf5d807

Best regards,
-- 
Xianwei Zhao <xianwei.zhao@amlogic.com>



