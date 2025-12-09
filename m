Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 822C2D1CDC6
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Dec 2025 10:18:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=VIKUHy//UsiDQQq3gFHlqMlnJn/KY2ZQoPc1PYVRHXk=; b=D4c92/HL2Lgk/FLDZmEZCZ2txg
	ejXafT6SqGi6nIVFiURGMJZmjfn02H6hi0lYCEUYRAatY0ReSzngf56W7rP9wgQ8o/odVpl8ownXo
	3zk2s4WuIxawL0DRr/W0rc+bZBebx9XlU+oG/XNOdyHoyJc9G9gZSGAP6thZiAI0xRTjzBZwbiLKA
	HnpxDTXcHJpZWp1p+EhTFGd5KhbRPoIXiMw9VrEdpyhAG9T/N1N9XHV1tlXoW4dIUwUlh8kHq17xB
	reykgsfluKwAR+pXOgt2EU5GWy5ujeSBYXJERVGEoaLmTNDmZeI3NHDpsLvkAFxQXP8IkWxeGK/PT
	9jXt3cKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSunI-0000000E5q0-3KsZ;
	Tue, 09 Dec 2025 10:18:08 +0000
Received: from mail11.truemail.it ([217.194.8.81])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSunG-0000000E5oo-3zPF
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Dec 2025 10:18:08 +0000
Received: from localhost.localdomain (xcpe-178-82-120-96.dyn.res.sunrise.net [178.82.120.96])
	by mail11.truemail.it (Postfix) with ESMTPA id 0DDD42164A;
	Tue,  9 Dec 2025 11:18:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1765275484;
	bh=VIKUHy//UsiDQQq3gFHlqMlnJn/KY2ZQoPc1PYVRHXk=; h=From:To:Subject;
	b=dGqAWWhn99ZYOeGKIu7AV2FNBEnZ4OjxTv7NodfwWxnswdRWT2DI76zBbSJ5v8ENh
	 eYpzEORqKrCAnH+xVdya6YI8CPrthXaCI5go9Z0tsxg5q9Qmr9qB/8J/7DPopVr8Ru
	 YCAJJQhrD+b/XHEDFA1YWhr7pIdlDOnacPTpPyGnSHY2hNUY8UPNNlnYxXo3AC+sX6
	 oTAXDiGNlXRspwbKNiv08aAvV//lopsFnrwXK8v+veNQWvEW1CdWXssdig2jLA3esw
	 SBKOJbq8lwHHOlPgMFVOJjyZ0Nu6Sfvt80QD3WMv+SworQKEK+2XwEbAQDm5fZj1gI
	 HbmXypB0hoSag==
From: Francesco Dolcini <francesco@dolcini.it>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Francesco Dolcini <francesco.dolcini@toradex.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 0/3] arm64: dts: freescale: imx8mp-(verdin|toradex-smarc): Add HDMI audio support
Date: Tue,  9 Dec 2025 11:17:48 +0100
Message-ID: <20251209101754.54067-1-francesco@dolcini.it>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251209_021807_141997_95DD12C0 
X-CRM114-Status: UNSURE (   7.91  )
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
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Francesco Dolcini <francesco.dolcini@toradex.com>

Add support for HDMI audio on Verdin and Toradex SMARC iMX8M Plus boards, as
done in commit b21f87b8322f ("arm64: dts: imx8mp-evk: enable hdmi_pai device")
on the NXP i.MX8MP EVK board.

In addition a small cleanup on spurious comments.

Francesco Dolcini (3):
  arm64: dts: freescale: imx8mp-verdin: Remove obsolete TODO comments
  arm64: dts: freescale: imx8mp-verdin: enable hdmi_pai device
  arm64: dts: freescale: imx8mp-toradex-smarc: enable hdmi_pai device

 arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc-dev.dts | 4 ++++
 arch/arm64/boot/dts/freescale/imx8mp-verdin-dahlia.dtsi    | 4 ++++
 arch/arm64/boot/dts/freescale/imx8mp-verdin-dev.dtsi       | 4 ++++
 arch/arm64/boot/dts/freescale/imx8mp-verdin-mallow.dtsi    | 4 ++++
 arch/arm64/boot/dts/freescale/imx8mp-verdin-yavia.dtsi     | 4 ++++
 arch/arm64/boot/dts/freescale/imx8mp-verdin.dtsi           | 4 ----
 6 files changed, 20 insertions(+), 4 deletions(-)

-- 
2.47.3


