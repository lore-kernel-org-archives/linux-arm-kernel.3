Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFCA9C7EE33
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Jun 2025 09:29:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8WK84sFFik2jcE0ZuFuWZOpfbJvTJzq1/ZN/NlRl4kM=; b=XhxPToSTARJq5kITGQtbc/AMBW
	5IHZEv+HvR6UHNCDfZ4WIGpRxiAAEZAYHr0wJEGLbjJPt0e+sjNVTBQSJ85rqAYU+Tf/9uqRlGPO6
	QjqMw4IuZhMk9u+irnY5UMEcCFuWg4oWAscBLlvfdslWBeMnDs+0vfCWkL5e++KvE88r+3fnKztv6
	b7O+Xox+fGdl9klYl49SUPfUE6J98qa3Q8S9xR9sXDwo89qWuGtobcrqdzCpKnTKcpKKbuECt5TS3
	M4mFNARN+/Am3UaJxjKdE4HkfJ3qYiGUqqY1YC2lV+Gj6lMbisQO5H1RMCET7U2sRAnJoUOP3WgbU
	eEZIO9Jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUiug-0000000B8eH-38KL;
	Thu, 26 Jun 2025 09:28:58 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUiMp-0000000B3A1-01yh;
	Thu, 26 Jun 2025 08:54:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id EEEFC5C5995;
	Thu, 26 Jun 2025 08:51:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id DC9F0C4CEF3;
	Thu, 26 Jun 2025 08:53:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750928037;
	bh=HT5DOECmw+qJQjOhfeeAewpQ2sqBhm5VDZ/UAJbmOXE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=aknFDWWBBstid5jQvcIHBXh3sHp82Uj6mcdmY+17Gh3WQ9JfS8ineQ1npCRTSPmCT
	 py1uuIWHGgKOtZ8GVHNS0wMQOs/cD4RobjgwdlYlf31K0i5WCOEYo9Pxd8gzf6Ntde
	 v2ZoK6O0kawJrQKVyjA9LqihXWeIZ/db8XeeBhHNsUXdoxelIYIvn7isZq2vjEvFzi
	 dYASaCDVbpsV3gehR61Kpa34ORxW+cHXjgzc0hczi7a5S0CNhkG8L9aOdBUrWt7wUU
	 6KBYAuWilMcw4IeJLYvpYUdzFdgWDwVnfwQLZfr0otq0EQjaL0PZ258RHEYLQHoCh0
	 iE9AQ3lPVTW8g==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2AAFC7EE39;
	Thu, 26 Jun 2025 08:53:57 +0000 (UTC)
From: Max Shevchenko via B4 Relay <devnull+wctrl.proton.me@kernel.org>
Date: Thu, 26 Jun 2025 11:53:56 +0300
Subject: [PATCH v2 03/11] dt-bindings: timer: mediatek: add MT6572
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250626-mt6572-v2-3-f7f842196986@proton.me>
References: <20250626-mt6572-v2-0-f7f842196986@proton.me>
In-Reply-To: <20250626-mt6572-v2-0-f7f842196986@proton.me>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750928035; l=946;
 i=wctrl@proton.me; s=20250603; h=from:subject:message-id;
 bh=pKc+52kw9xhdBQMXCsiB5LzZOa7p7E9Ha6qtuRDXwf0=;
 b=jGMqmFnD/srCE1sCo8NXid4jXhMmQp9ot88vWZDnOCdZQGx+lqz041UPoRSKr5ZCawPXZd8Bc
 im92IniLq4LAwyS3ep3B1KFH4VSQeGWF0m2sa+xDq12OjkxJUdRtnZu
X-Developer-Key: i=wctrl@proton.me; a=ed25519;
 pk=JXUx3mL/OrnRvbK57HXgugBjEBKq4QgDKJqp7BALm74=
X-Endpoint-Received: by B4 Relay for wctrl@proton.me/20250603 with
 auth_id=421
X-Original-From: Max Shevchenko <wctrl@proton.me>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250626_015359_139438_E0AEAFEA 
X-CRM114-Status: UNSURE (   8.65  )
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

Add a compatible string for timer on the MT6572 SoC.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Max Shevchenko <wctrl@proton.me>
---
 Documentation/devicetree/bindings/timer/mediatek,timer.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/timer/mediatek,timer.yaml b/Documentation/devicetree/bindings/timer/mediatek,timer.yaml
index f68fc7050c5687930e2ca6b6fa8f0b7a208803da..d5b574bfd2caad1bc54ef6bd1768d94055383727 100644
--- a/Documentation/devicetree/bindings/timer/mediatek,timer.yaml
+++ b/Documentation/devicetree/bindings/timer/mediatek,timer.yaml
@@ -26,6 +26,7 @@ properties:
       - items:
           - enum:
               - mediatek,mt2701-timer
+              - mediatek,mt6572-timer
               - mediatek,mt6580-timer
               - mediatek,mt6582-timer
               - mediatek,mt6589-timer

-- 
2.50.0



