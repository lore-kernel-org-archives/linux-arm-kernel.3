Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69BC1C28B30
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 23 Mar 2025 12:43:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ghg4/1p1Vx/9yucYOPf5XjCoztjbu8eG7PAA4sv2HeE=; b=GlyNfeH/V9RC7NfW4i36NZQ4wX
	eGQNDl/stukHwBcNOc0rIJ4oDpRG5IpWjdKRacUi58//C83Gi6p+MyYwZsHN9UD7ARLTkvCeL5pOs
	3eLW6+Vh0Vhny2Ibv+GlffpHbpYFnH84Qpwat20tHi0D8aWc9G3bTWSbN6p6GwB/Cjcqbdu1QLbfU
	wSnx4zrtY1oy1/M948t37mcmDZh/eOurjuZJioEBTwsIzVdu0mqP+OK2rUqrWfqbsYT8dxYcRQ/VE
	ORwwQejaBUORWIAxe5kV7ROJ+x47Q//oo2g7THJHonaYf77ySpP9IUmVFl8RwzJLgGT8auV8Mrxyj
	4FIqID/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1twKfd-00000001CSZ-17o7;
	Sun, 23 Mar 2025 12:43:17 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1twKat-00000001Bm4-3Jc3;
	Sun, 23 Mar 2025 12:38:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 8DFA65C5D0B;
	Sun, 23 Mar 2025 12:36:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3C6A9C4CEE2;
	Sun, 23 Mar 2025 12:38:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742733502;
	bh=jd9wYHpyu6ZnNxDkrFxMFeP4lePw1I2neHhddWVkDjo=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=ttew/u6nQgjsmZc1H9mSur13NYjaBgIn/ReJVcimK3/wybUxVdwjM+4wEHv6fXxy7
	 41Azx/0Crxal6TbG2QQSK7seb3qVxRoOqMohF+VdrA7LwxcUmBlQmF6L93enqmsEKT
	 /J4fd6wk+/R+ysOrgjgjM/Yk00vsWJT4KGNQ7DpGZd4BFCIzLX4o8bYhxuY1Wzrd7G
	 Y1Fi5w0w4NLZ4FKC2z/d5RcpfkG6KWoC1OkjmWPIAFUyReMHOiXFkQawmt0JOe1wwL
	 SFo3J3FMzl7HYh+KE/wq7If7jAwL/WC7aJLsOLm1+hujELvwg5ogLO4EmzpTBb/35j
	 Bvr4bY11Zk3TA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24762C36002;
	Sun, 23 Mar 2025 12:38:22 +0000 (UTC)
From: =?utf-8?q?J=2E_Neusch=C3=A4fer_via_B4_Relay?= <devnull+j.ne.posteo.net@kernel.org>
Subject: [PATCH 0/3] Board support for Fernsehfee 3.0
Date: Sun, 23 Mar 2025 13:37:49 +0100
Message-Id: <20250323-fernsehfee-v1-0-2621341cd37a@posteo.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAJ0A4GcC/x3MQQqAIBRF0a3IHydoIlFbiQZmz/wTC4UIxL0nD
 c/g3koFmVFoEZUyHi58pQ49CPLRpROSj24a1WiV0VYG5FQQAyB36xBmo7ybQD24MwK//2zdWvs
 Ay4jP+1wAAAA=
X-Change-ID: 20250315-fernsehfee-b5aef930ca7e
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1742733500; l=1063;
 i=j.ne@posteo.net; s=20240329; h=from:subject:message-id;
 bh=jd9wYHpyu6ZnNxDkrFxMFeP4lePw1I2neHhddWVkDjo=;
 b=AMu+SEgV81icPPkhvIuoyn3r3e/kUZ9XHrbb3+w4UrKlZvVcnjOaV72cWbnRxz1Tq+ff46kXf
 HnZqH8mi1+GCDMiKMW7SNQtuKWKX4QVY/VSCHW+Icx2oN8iNGjFWRtI
X-Developer-Key: i=j.ne@posteo.net; a=ed25519;
 pk=NIe0bK42wNaX/C4bi6ezm7NJK0IQE+8MKBm7igFMIS4=
X-Endpoint-Received: by B4 Relay for j.ne@posteo.net/20240329 with
 auth_id=156
X-Original-From: =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250323_053823_867941_AE15234F 
X-CRM114-Status: UNSURE (   7.21  )
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
J. Neuschäfer (3):
      dt-bindings: vendor-prefixes: Add TC Unterhaltungselektronik AG
      dt-bindings: arm: amlogic: Add TCU Fernsehfee 3.0 board
      ARM: dts: amlogic: Add TCU Fernsehfee 3.0

 Documentation/devicetree/bindings/arm/amlogic.yaml |   1 +
 .../devicetree/bindings/vendor-prefixes.yaml       |   2 +
 arch/arm/boot/dts/amlogic/Makefile                 |   1 +
 arch/arm/boot/dts/amlogic/meson8-fernsehfee3.dts   | 219 +++++++++++++++++++++
 arch/arm/boot/dts/amlogic/meson8.dtsi              |  18 ++
 5 files changed, 241 insertions(+)
---
base-commit: 4701f33a10702d5fc577c32434eb62adde0a1ae1
change-id: 20250315-fernsehfee-b5aef930ca7e

Best regards,
-- 
J. Neuschäfer <j.ne@posteo.net>



