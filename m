Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40D05C7115B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Jun 2025 15:49:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zvxZO4N9F3SNKNOm1onD9xO6i9NtGujY17iYa22sH2E=; b=PbpaCbM+GaSy+6puYWPVJDFyUY
	hFvmp2t0w8NemaAQcG84AD5yZkg5LRj7yDH4OkHFKcqmCv/jrewh+oQfcDprTD3saSuPC2xPSFdXg
	qaAfKu1QZnqpAs/TaMlGyGs8ax8iVX1OtA78Cj1YEb1jPUejFz1gNL+JSY7kg3oXnU5a7k8Sl4GuU
	QLqswXp1gTEaGL0nhrJOA4RKVrxDvH3cfh4Na1E097DhwMS9ik7J9FG1S69E9X1xslKVrZP0CQGde
	kLSmyyrHU8QiOuSSbNu/QskXHo42Oex5NTsV6LxtxvWirwLGSi1C2EW/UtYtBVWQL2WG3xuMycfvd
	EdPwikrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSdz7-0000000G2rb-3EyB;
	Fri, 20 Jun 2025 15:48:57 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSduE-0000000G1RE-48Wp;
	Fri, 20 Jun 2025 15:43:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3FB1A4AF86;
	Fri, 20 Jun 2025 15:43:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id DE8FEC4CEFD;
	Fri, 20 Jun 2025 15:43:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750434233;
	bh=/M12+r3YGfgPHhzGTzEcUUQ8kBfgerEmUSZKMmlZH00=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=sayVJNVZKgLKISWVLQnDSfZVXSuRJUYolV3t/8JZfkBqqb2XB1enavSnQwa2nsJB9
	 +mIyyMOLPPeEPuTdYCcUYLgtX51OXZcrOYviOEAns2IAK0v75hr/VaT+uZMlRh/PiD
	 NWi7v9OkLX9C0X7GEVzvLLMxQMDQddCO+MCcuM4XcUMIOY3y/hpKXfi/MOElcUcvXk
	 eQqbKAhJaUsxWxs/GpwBY8KKYoRunxkT3CsABeTE5BU9ce1BWwbBgBYyXluCv8Y6KQ
	 CEdnjNHAOkmnIYv55HZcphQt89Yjw1P4fjRrhy+CfGoW9dUM0VJ4MdBglsg8pYmCCJ
	 FBt1LS/jItfBQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D516DC7EE2A;
	Fri, 20 Jun 2025 15:43:53 +0000 (UTC)
From: Max Shevchenko via B4 Relay <devnull+wctrl.proton.me@kernel.org>
Date: Fri, 20 Jun 2025 18:40:46 +0300
Subject: [PATCH 07/11] ARM: mediatek: show the hardware name for the MT6572
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250620-mt6572-v1-7-e2d47820f042@proton.me>
References: <20250620-mt6572-v1-0-e2d47820f042@proton.me>
In-Reply-To: <20250620-mt6572-v1-0-e2d47820f042@proton.me>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Thomas Gleixner <tglx@linutronix.de>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Guenter Roeck <linux@roeck-us.net>, Sean Wang <sean.wang@mediatek.com>, 
 Russell King <linux@armlinux.org.uk>
Cc: linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-watchdog@vger.kernel.org, 
 Max Shevchenko <wctrl@proton.me>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750434231; l=692;
 i=wctrl@proton.me; s=20250603; h=from:subject:message-id;
 bh=rvoGWdqv2dSMmfg1LUoO8gwzH9kguQfgav6FpmmRDKI=;
 b=nNMbs5zJQLhpvdSJJKi/yGGVZeDkYGDkjeiXJDReJgWtS1NTPEzGxUCKW4O4tcSkxrG1bIzE3
 UJdouGOoePyClnORUtCLwsqvZzsYQ4bqCml/qnPubIdUn8ju1nwwA7E
X-Developer-Key: i=wctrl@proton.me; a=ed25519;
 pk=JXUx3mL/OrnRvbK57HXgugBjEBKq4QgDKJqp7BALm74=
X-Endpoint-Received: by B4 Relay for wctrl@proton.me/20250603 with
 auth_id=421
X-Original-From: Max Shevchenko <wctrl@proton.me>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250620_084355_049868_5F3D98D4 
X-CRM114-Status: UNSURE (   9.91  )
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
Reply-To: wctrl@proton.me
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Max Shevchenko <wctrl@proton.me>

Add a compatible string for the MT6572 SoC.

Signed-off-by: Max Shevchenko <wctrl@proton.me>
---
 arch/arm/mach-mediatek/mediatek.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/mach-mediatek/mediatek.c b/arch/arm/mach-mediatek/mediatek.c
index e6e9f93a1f01c7d043cf4312b9406b25c8897198..5c28124bd0078b31665fef647e496f4131b82c8d 100644
--- a/arch/arm/mach-mediatek/mediatek.c
+++ b/arch/arm/mach-mediatek/mediatek.c
@@ -38,6 +38,7 @@ static void __init mediatek_timer_init(void)
 
 static const char * const mediatek_board_dt_compat[] = {
 	"mediatek,mt2701",
+	"mediatek,mt6572",
 	"mediatek,mt6589",
 	"mediatek,mt6592",
 	"mediatek,mt7623",

-- 
2.50.0



