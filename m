Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D120E7716D
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Dec 2024 16:15:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OBAiE78C/7lpkLuRDoGbcMdDUBkbvwg4Nt9gAbxu4CY=; b=QpOBuKjiJqt0WNXetHrh9HY6/f
	qZ7AWWK0eTmNMzWfWb+f1Kyd4CY+xuidDXX/RXg0glaHpOrsgf5iMLLx3VVC/exdIbTuUWxg1hAf3
	mU5j1ye12NzFM+b12YWIMouPFUUkZQxqrQhZwZN5LZGKdJKJK1K9CXmi+gaKlGU59FNXYpRWkw2vb
	DsGZQ/uuz3ua1MUJmdr/FyqcK2Rf8JoG/cwzIOXGW/RgeNMrS9k0gkeRbhor9xW8cq/qU6eGoYKDS
	o4LConWI7gygqmtzDB7XcBuxgnQe07mM+i4aYo0blQUeGnDznhg4+ymQg3QrlBN/i9siRaU+p2Vc/
	d79rhSRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIs22-0000000D9I1-2D2a;
	Wed, 04 Dec 2024 16:15:18 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIrtb-0000000D6pF-2E6s
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Dec 2024 16:06:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E35745C6F77;
	Wed,  4 Dec 2024 16:05:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1A7C0C4CEE6;
	Wed,  4 Dec 2024 16:06:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733328394;
	bh=9TaGX6HffgIlLj9EAnKA1F6OunD1In0MqPvuPOMdWXA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=AnTVeGA0A6liJtCNIb9Hf3VZOUxRJvBYCS5i9F9Ndy3tUPgliLORfJf+jRtDSq84+
	 vt0HezbZJH7g7gBZxdU1r7ad+x+IyTG5wJ/OV+4pin2MikG/cx1kB49cDwVquqIZq6
	 mO3obxNWSx9M7rfk1LC+s9QZivgHOwnCgA9aKrvKOCLW2mdCZnoluZc02NfKMROonm
	 PHv/U5LUtkowAC+lQNoyS810kz/fKf1JQvkype6jSnEU9u6M+5T9A6HWs9mJ7n2Ezj
	 u5xiA1IWbZPdySbDNmzkBSoCHRBVSkwuwfv3bL9vv9+WTMUF5tPPWMYNanaxCo50G6
	 CO7PsGA/mSBCA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0DE10E7716D;
	Wed,  4 Dec 2024 16:06:34 +0000 (UTC)
From: Nikolaos Pasaloukos via B4 Relay <devnull+nikolaos.pasaloukos.blaize.com@kernel.org>
Date: Wed, 04 Dec 2024 16:05:28 +0000
Subject: [PATCH v5 5/6] arm64: defconfig: Enable Blaize BLZP1600 platform
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241204-blaize-blzp1600_init_board_support-v5-5-b642bcc49307@blaize.com>
References: <20241204-blaize-blzp1600_init_board_support-v5-0-b642bcc49307@blaize.com>
In-Reply-To: <20241204-blaize-blzp1600_init_board_support-v5-0-b642bcc49307@blaize.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 James Cowgill <james.cowgill@blaize.com>, 
 Matt Redfearn <matt.redfearn@blaize.com>, 
 Neil Jones <neil.jones@blaize.com>, 
 Niko Pasaloukos <nikolaos.pasaloukos@blaize.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, soc@lists.linux.dev, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1733328392; l=754;
 i=nikolaos.pasaloukos@blaize.com; s=20241111; h=from:subject:message-id;
 bh=p64eXXaIQjoPOizS0+i1yI0HfKEd6m8yRHyu9K+W+GE=;
 b=xiq+hGJ+bcWw9onTf2uX5rlzKc+E1DAv8+JHh2rcSL/LF3Oc1dtqsHetuoJ932y4rTYThe8Fn
 rIPtAh8dlLZB3H2WKbc3Znaeet/Fc4TWBTSF3E21T/UXhTtbp5us5MH
X-Developer-Key: i=nikolaos.pasaloukos@blaize.com; a=ed25519;
 pk=gGEjGCXdSuvCJPIiu0p0UeiPcW5LC710Z6KGN/dzo3g=
X-Endpoint-Received: by B4 Relay for
 nikolaos.pasaloukos@blaize.com/20241111 with auth_id=274
X-Original-From: Nikolaos Pasaloukos <nikolaos.pasaloukos@blaize.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241204_080635_680583_98B32BAD 
X-CRM114-Status: UNSURE (   8.45  )
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
Reply-To: nikolaos.pasaloukos@blaize.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Nikolaos Pasaloukos <nikolaos.pasaloukos@blaize.com>

Enable ARCH_BLAIZE to support the BLZP1600 SoC and the CB2
development board.

Signed-off-by: Nikolaos Pasaloukos <nikolaos.pasaloukos@blaize.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 5fdbfea7a5b295c4569f34773394ffe6eda778e9..4921669f89ae0a89e0c1489a2a4359be9698e5a2 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -44,6 +44,7 @@ CONFIG_ARCH_BCM_IPROC=y
 CONFIG_ARCH_BCMBCA=y
 CONFIG_ARCH_BRCMSTB=y
 CONFIG_ARCH_BERLIN=y
+CONFIG_ARCH_BLAIZE=y
 CONFIG_ARCH_EXYNOS=y
 CONFIG_ARCH_SPARX5=y
 CONFIG_ARCH_K3=y

-- 
2.43.0



