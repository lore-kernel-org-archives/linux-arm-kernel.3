Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C97EF606A33E
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 14:29:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=vvVc1bK3;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QXjKTJio
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=SB060tm94ok1G3ZrAKChHc1CAPBDl1EJH81JADMrd2I=; b=vvVc1bK3yAUJF3/UZT3iVevMJ8
	F9uVsxLrc7WMW4TviHNr9HBl9c9hL6xt9RlkraX3VXke0rBIxJrFJUlqCPg/l+tU1x/IiUPQQ/h5+
	deJ/U4ejEMBXY72DB43Xl9yXD2cJMrbig8AiSIxp1dU/PzOZ7+NEvzOXhXyAfdLiqRGk0tNRPR1LU
	1dH2pWY0+S9QhhUR3FC/LKEUNSOKwRgo5gBBZgUuzjYly8oeBDNtJb7gYNKi5RasBGQg1AOSt8gI5
	hCiLvE+65gcMP+lZEQoKxlG1vfZpa7jMIEUdy8Vp8VP9l8/o1exgLj154g2/pwKEZLlIkMOI9tfhJ
	P7wuik1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOySg-00000009Gk5-0uDD;
	Thu, 05 Nov 2026 14:29:06 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOySe-00000009Gim-1wAR;
	Thu, 05 Nov 2026 14:29:04 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 268FC43E63;
	Thu,  5 Nov 2026 14:29:04 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793888944;
	b=xkBMd7s8yjCUyUiRj/tQmEl5Rn3yc/umB2DQZu+TGKBgp0FCBhr8Sb1wkI2qkvFu4Yys
	 rumZvaPDBPvjze0o2HfUB6wqSHlGHk9xVFw2r1q3ZOeJSN/minFTZkgNsHWudp03Eg4Ow
	 rAqkA9MGv9XWuihBv3pYbRvSxcHyn89BIkCU33o+rDGvVBCBveiKdME2W6pmiG9HsylLc
	 Cy4TeJcffSd+W1dVsxn6+GjrMuCmYsgYKHAxBsRaaTUYnUIqFr4Bwjzn5zGc48BbWG2TX
	 0lOIADd7TDUOZC3KWRHZumLChvW9w7dd7Ki0JXNlu4csiB6KO1m4pJtJWdpjX7HwdZg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793888944;
	h=DKIM-Signature:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=SB060tm94ok1G3ZrAKChHc1CAPBDl1EJH81JADMrd2I=;
	b=Xl93jVLs+F3yt1b/oM3DoufmRvrFIxS4V5rUXcbwZhr7tWRiU0O9KAWWpEqyG2IEWXt3
	 zzCvtCf25y4FjW8XIalSNWotmQagdV0pXM6VTwsxJZvjX5krBArWVvJRb8teAKsAlXaKo
	 D833bCUoJfaF/sDFlsaOL+CHBJGkN4aAcob4lgIcxLmc2zcI8hPrK+cDAMVaFpdPUCZ9j
	 uDDJ/OQn7KOjcETWscBeIbCiobgZs1dt8ew1YmHFafLptKj8A88h1wJSZCFbiGo5DcLug
	 eECXIbog00/XdoIGO7rKiapOPlcEjJ5618KkfmrS2uGFbv3iFdVJAHX6wU1MNXUmyGA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id B01621F00919;
	Thu,  5 Nov 2026 14:29:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793888944;
	bh=SB060tm94ok1G3ZrAKChHc1CAPBDl1EJH81JADMrd2I=;
	h=From:Subject:Date:To:Cc:Reply-To;
	b=QXjKTJiowPoq09eaNbrqnkXtMkwV6FoFRtLqimoJKlru0kwtSJknSwMGTn4juhh9w
	 poEBu9KanHg9Lv0DzDwAIc0r7rAtChWC6WEpsLmuK3mFNaYbrjLAbKSjX/BYkx/TNO
	 vgFZMs6y1tf7IKjRLq+7BalJfGSf9E46WbU/u1XQwwqC0zPs4aw7528eYkf/85FUKo
	 G70C3bvwyGmYy/fz/QaCoWlpE8I0O5FNaluWbRWAvPTAXnfBJ8jPrv65EjQPuCalLF
	 oE+D74iySop2o3WNnDNVWAkYiV2ttuUukA1CN7rSyVJkmhxOcpdwYTExZTyiSwdLDD
	 wOV6VTQhDL7Mg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 12F16472B5;
	Thu,  5 Nov 2026 14:29:02 +0000 (UTC)
From: Ben Grisdale via B4 Relay <devnull+bengris32.protonmail.ch@kernel.org>
Subject: [PATCH v2 0/6] arm64: Initial support for MediaTek MT8163 SoC
Date: Thu, 05 Nov 2026 14:28:45 +0000
Message-Id: <20261105-arm64-initial-support-for-mediatek-mt8163-soc-v2-0-e68d7d428f99@protonmail.ch>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/5WOQQ6CMBBFr0K6dgwttaAr72FYlDLIKLSkLURDu
 LuA8QAuX/Ly359ZQE8Y2CWZmceJAjm7gjgkzLTa3hGoXpmJVCie8gK075UEshRJdxDGYXA+QuM
 89FiTjviEPhZcZRCcAdSnopa5qXKt2bo5eGzotfdu5ZfDWD3QxC2yGS2F6Px7PzTxzfu1z3+2J
 w4pNEIqUYlayCy/Dt5FZ3tN3dG0rFyW5QMb3audAAEAAA==
X-Change-ID: 20261018-arm64-initial-support-for-mediatek-mt8163-soc-ea58d47cb7aa
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Sean Wang <sean.wang@mediatek.com>, Thomas Gleixner <tglx@kernel.org>, 
 Radu Rendec <radu@rendec.net>, Daniel Lezcano <daniel.lezcano@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-serial@vger.kernel.org, Ben Grisdale <bengris32@protonmail.ch>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793888941; l=2514;
 i=bengris32@protonmail.ch; s=20261018; h=from:subject:message-id;
 bh=xYWhJdUiyf1YSsJbWggMRSuD7a4P0ZPx+YpqCfYj/AY=;
 b=Dy4ilgGz6/7wDjsLtjtacc2scZ/XdEP0ABXqQCC9jkR0mpFWmP8b6bmM9RLffsp3svumiHFGf
 Ghhl5a20pe6AQ89y1ZmLn6kM/xtS8cAla+R/oWBuHNoLd9NrRLE9Scj
X-Developer-Key: i=bengris32@protonmail.ch; a=ed25519;
 pk=4ewFRC2yNph/tXokHVzIDlgOA9Hxecf1AlBuD4eOnaU=
X-Endpoint-Received: by B4 Relay for bengris32@protonmail.ch/20261018 with
 auth_id=1233
X-Original-From: Ben Grisdale <bengris32@protonmail.ch>
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Reply-To: bengris32@protonmail.ch
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-21.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	FREEMAIL_REPLYTO_END_DIGIT,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This series adds basic support for the MediaTek MT8163 SoC.

The MT8163 is a 64-bit SoC featuring four ARM Cortex-A53 cores,
typically found in entry-level tablets and smart displays, such as
the Amazon Echo and Fire HD devices.

The bindings and SoC dtsi added here, together with the already applied
watchdog support, are enough to boot the 2016 Amazon Echo Dot (biscuit)
to a shell over UART0.

This series requires custom TF-A, U-Boot and OP-TEE ports for MT8163.
The stock vendor firmware does not provide a usable PSCI implementation
(the vendor kernel brings up secondary CPUs with a custom "mt-boot"
enable-method instead), and these ports also define the reserved memory
layout used by the board dts:
 - TF-A: https://github.com/iara-linux/arm-trusted-firmware
 - U-Boot: https://github.com/iara-linux/u-boot
 - OP-TEE: https://github.com/iara-linux/optee_os

This is the first of several series. Support for the remaining
peripherals will follow, starting with the clock controllers, pinctrl
and power domains.

Signed-off-by: Ben Grisdale <bengris32@protonmail.ch>
---
Changes in v2:
- Dropped WDT patches as they have been applied [1].
- Picked up latest tags from v1.
- Link to v1: https://patch.msgid.link/20261019-arm64-initial-support-for-mediatek-mt8163-soc-v1-0-f2462b2d2437@protonmail.ch

[1] https://lore.kernel.org/all/589d0ab4-46cf-4b8d-b4b3-5519dbf030ea@roeck-us.net/

---
Ben Grisdale (6):
      dt-bindings: arm: mediatek: Add MT8163 Amazon Echo Dot (2016)
      dt-bindings: interrupt-controller: mediatek,mt6577-sysirq: Add MT8163
      dt-bindings: timer: mediatek,timer: Add MT8163
      dt-bindings: serial: mediatek,uart: Add MT8163
      arm64: dts: mediatek: Add basic support for MT8163 SoC
      arm64: dts: mediatek: Add Amazon Echo Dot (2016)

 .../devicetree/bindings/arm/mediatek.yaml          |   4 +
 .../mediatek,mt6577-sysirq.yaml                    |   1 +
 .../devicetree/bindings/serial/mediatek,uart.yaml  |   1 +
 .../devicetree/bindings/timer/mediatek,timer.yaml  |   1 +
 arch/arm64/boot/dts/mediatek/Makefile              |   1 +
 .../boot/dts/mediatek/mt8163-amazon-biscuit.dts    |  68 ++++++
 arch/arm64/boot/dts/mediatek/mt8163.dtsi           | 243 +++++++++++++++++++++
 7 files changed, 319 insertions(+)
---
base-commit: 8b7179210b22f8e48a82c5ceacb9d56a9c4cfec4
change-id: 20261018-arm64-initial-support-for-mediatek-mt8163-soc-ea58d47cb7aa

Best regards,
--  
Ben Grisdale <bengris32@protonmail.ch>



