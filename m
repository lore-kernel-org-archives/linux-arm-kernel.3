Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56734CCA490
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Oct 2026 00:40:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/H5+v+eU9kgfKz/Mj9VwzvLXt9DOhZLPVVmlABdoLxA=; b=1uhMXpLaREbSFk0YI9r4kk4nzh
	Z7Z1va9UHynwdVES+hQjhJuw2+NhYFP6rReb5x6IFaiEtbnRkfv7yJOmbtjn6OIQoYxK0dWd2um4Y
	WCh5Ft7OsM3YThuUTEwMGn2pU2qNYxx/5jg+y0922vqlMWDoIzCc2Vo7g2RUZ6F9NU+8iCLg1IPqi
	FzKBzBmIetbfjOf7yQ08KG8W/AvZNIE7dT59aiEISMz/WOB94I0CYBlMYXtB0QoHV76DfZtDrnmxz
	WEJEnHWYlk6XLbmtJNgB2il3nPWua29A4UuKcKVbpNRGg+qGD6Kbc+N1QhNnCwG8EidRMNMciUZ+R
	/0qWr5hQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIbQk-00000006LFu-078S;
	Mon, 19 Oct 2026 00:40:46 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIbQi-00000006LDU-2UmH;
	Mon, 19 Oct 2026 00:40:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 85D5860DA3;
	Mon, 19 Oct 2026 00:40:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2D916C2BCC7;
	Mon, 19 Oct 2026 00:40:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1792370443;
	bh=Vzcnb7fHZtnglUZyGE1LG4oLfK8EgPIOWvY+smgPiZ4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=o/k4pss6LwOwLKq4RM4ZjOX5nLYOApDAhReGsl4EzyKlB/LDtWFnQvlxAXNV0MFgm
	 8KVKlmBYd6pQEENzTSgpqL0ZHtpCt+RR/m5Kcf0HCdAvG9cb+o0jxtLX40cpvAEwcc
	 /hkcCUThEaDdB39B/DuaFs6RznnzlBLpgrCx4NLyi/+iOKbKgQFXtBSzfefhdyF2tJ
	 QsH3kLRThBJeUP8IyG6KsDaO/zWGhoNhMc+1lqjC3aOFJNCYBZkE1W2xjrPixOEZZs
	 UlMkNBqgbecfr9xR7AVusAWlLe5LuCgdJl8a4XSLbF2lcn8ADOnW18W8WyDvwWJuGE
	 BMFUNHVQVD7Uw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B8D8CCF2D4;
	Mon, 19 Oct 2026 00:40:43 +0000 (UTC)
From: Ben Grisdale via B4 Relay <devnull+bengris32.protonmail.ch@kernel.org>
Date: Mon, 19 Oct 2026 01:39:57 +0100
Subject: [PATCH 1/8] dt-bindings: arm: mediatek: Add MT8163 Amazon Echo Dot
 (2016)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261019-arm64-initial-support-for-mediatek-mt8163-soc-v1-1-f2462b2d2437@protonmail.ch>
References: <20261019-arm64-initial-support-for-mediatek-mt8163-soc-v1-0-f2462b2d2437@protonmail.ch>
In-Reply-To: <20261019-arm64-initial-support-for-mediatek-mt8163-soc-v1-0-f2462b2d2437@protonmail.ch>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Sean Wang <sean.wang@mediatek.com>, Thomas Gleixner <tglx@kernel.org>, 
 Radu Rendec <radu@rendec.net>, Daniel Lezcano <daniel.lezcano@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, 
 Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Guenter Roeck <linux@roeck-us.net>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-serial@vger.kernel.org, linux-watchdog@vger.kernel.org, 
 Ben Grisdale <bengris32@protonmail.ch>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792370441; l=894;
 i=bengris32@protonmail.ch; s=20261018; h=from:subject:message-id;
 bh=Sj9uUU4hqeBMvxPCCdbhjJhVHzkddt07Do2ZWZ88abg=;
 b=i8t+LWCw5nZGoTonFvFX5VP1Sm9vmycUfNTUKkT7CgI1E1JImpienLWsMNsdvjkiFmuush4kG
 Wz0jic5UwFfArO7uIHcpAwPQ19q8KsjeQ4Zwxei/b5GOmlQCq3m1T1m
X-Developer-Key: i=bengris32@protonmail.ch; a=ed25519;
 pk=4ewFRC2yNph/tXokHVzIDlgOA9Hxecf1AlBuD4eOnaU=
X-Endpoint-Received: by B4 Relay for bengris32@protonmail.ch/20261018 with
 auth_id=1233
X-Original-From: Ben Grisdale <bengris32@protonmail.ch>
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
Reply-To: bengris32@protonmail.ch
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Ben Grisdale <bengris32@protonmail.ch>

Add compatible strings for the MediaTek MT8163 SoC and the Amazon Echo
Dot (2nd generation, 2016), codenamed "biscuit".

Signed-off-by: Ben Grisdale <bengris32@protonmail.ch>
---
 Documentation/devicetree/bindings/arm/mediatek.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/mediatek.yaml b/Documentation/devicetree/bindings/arm/mediatek.yaml
index 180e6e4948e7..15db402552c1 100644
--- a/Documentation/devicetree/bindings/arm/mediatek.yaml
+++ b/Documentation/devicetree/bindings/arm/mediatek.yaml
@@ -129,6 +129,10 @@ properties:
           - enum:
               - mediatek,mt8135-evbp1
           - const: mediatek,mt8135
+      - items:
+          - enum:
+              - amazon,biscuit
+          - const: mediatek,mt8163
       - items:
           - enum:
               - mediatek,mt8167-pumpkin

-- 
2.56.0



