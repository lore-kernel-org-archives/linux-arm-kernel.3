Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0629CAC59A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Sep 2025 06:51:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sx1a6uM8p4Me4w5FsdfOZKvDrwk07bhpLE586/ZGmZY=; b=eD938p6ONgqblqxAy0g+tF0j1H
	xSfYUK4Kpbdv4X8N8QF0ReHMUPCKBrAewMVr6ZweJdMwHpLuwKvJbKk+j80ldneGJj5ioDNIMBKbg
	X/4lBzwGWzENAyIeuQfBWJwtwYMtdSAg/5+oQvsK8mUw0/dNjxvctwUxFgyh65BXwtWJk86duEhKl
	0SF1uoo81RQyqXL8pPrXcC+hLjrSd+uGEOZEdTNCua5VcgzFbyJ+jE2Vv/t6V0D8A4XzgxxbbqTX8
	lJMaGLJTyQIbgE1cyr8tMuW+FPakQssm+f4MbiGUf+0WnD9+R7HB6px6kA1Wgu+w+FE9xkOObGfH3
	2iV5k/Jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzUxu-00000001yRw-1K1i;
	Fri, 19 Sep 2025 06:51:30 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzUxs-00000001yR0-02zJ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Sep 2025 06:51:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 414FD44C0F;
	Fri, 19 Sep 2025 06:51:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01B37C4CEF0;
	Fri, 19 Sep 2025 06:51:26 +0000 (UTC)
Received: from wens.tw (localhost [127.0.0.1])
	by wens.tw (Postfix) with ESMTP id 5DB455FC15;
	Fri, 19 Sep 2025 14:51:23 +0800 (CST)
From: Chen-Yu Tsai <wens@csie.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>, 
 Andre Przywara <andre.przywara@arm.com>, 
 =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
In-Reply-To: <20250918-x96q-v2-0-51bd39928806@posteo.net>
References: <20250918-x96q-v2-0-51bd39928806@posteo.net>
Subject: Re: [PATCH v2 0/2] Initial Amediatech X96Q support based on
 Allwinner H313
Message-Id: <175826468333.1301600.756686435381088795.b4-ty@csie.org>
Date: Fri, 19 Sep 2025 14:51:23 +0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250918_235128_066614_4167A755 
X-CRM114-Status: GOOD (  10.76  )
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

On Thu, 18 Sep 2025 12:58:42 +0200, J. Neuschäfer wrote:
> This patchset adds an initial devicetree for the X96Q set-top box.
> WiFi, Ethernet, and HDMI depend on drivers that are currently not
> available in mainline Linux, and I didn't even get the SDIO WiFi chip to
> enumerate, so I left these peripherals out of the in the devicetree.
> 
> The builtin infrared receiver produces IRQs when a nearby remote sends
> events, but they somehow don't end up in /dev/input/event0.
> 
> [...]

Applied to sunxi/dt-for-6.18 in local tree, thanks!

[1/2] dt-bindings: arm: sunxi: Add Amediatech X96Q
      commit: f9d3206506b4db2711eca0f6b3d9dc621cc1e650
[2/2] arm64: dts: allwinner: h313: Add Amediatech X96Q
      commit: 07c7f4f4e9504da240ef68adfd95a1150d3a6fd4

Best regards,
-- 
Chen-Yu Tsai <wens@csie.org>


