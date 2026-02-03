Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EED3E87856
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Feb 2026 18:42:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=fbiX8N3x1bYSDT7QFS/EV8FgaHPeSAiQrtKeg/n32nc=; b=4jixpkIbS2B2IQ
	DKUfMLxBklH6PbCafVAah4Voh0V3EICJF+ntmpyh8HCH9ekx1IrxsGMFFmDgM030LRQ66PIClBme/
	/3J/R28LsAZ0yZqdAgdhx3N85Tz1qc0t3ibHrLXr6NPpKbcDvfr637k4Ryq68fpE7THxZRYLIHU45
	bI99bYtwqa6LYsaHnHoYTWtTz5EWg8KycoSWmeQp0xTcz1zK/3cq0FIZqPuYJ330feE/Ki7OKFi6L
	WQF/I0mCK0dj2KalivVLHpLvb+KtkrvFo5hPACRBteHUyUbCAc88nqonsBrmQ+mQdS9pZp8h1mSlb
	MjjZ4/sFz1v1OoIYyEcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnLLw-00000007B6L-2Pv2;
	Tue, 03 Feb 2026 18:42:20 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnLLr-00000007Awy-2g7K;
	Tue, 03 Feb 2026 18:42:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:From:Sender:Reply-To:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=fbiX8N3x1bYSDT7QFS/EV8FgaHPeSAiQrtKeg/n32nc=; b=erHyyMK1rDpJeIM/D2gK80DWSt
	eXD83VL9nNTS08sHB4Ra267J29c30TUR6Ay8XfW+cQcQcBes62bZovoTGhadf2VMicSqYj4k9msBJ
	AonA8DODBDlYNu3CIj16f1sw2LrHP6pr93xaH+F99KXjXa/YZJ3ZleLhD1bmBjMhwCw+fz02Ka49U
	S1GuWvz+PGDGN9o2Rf8TY66Xgg74aOF6kAYBbIoZQibMuYeYRKgmzOeH5t3k3G9O+JWrZedz0KKJN
	whMoxNmGssW1YevOFEJQBA23qcepidysJpO1pE58kV7rhvCA9sIh7PSDlYHgX5BF6RB6laWVGXALu
	fJIwyAKw==;
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnLLn-0000000GsBd-27ol;
	Tue, 03 Feb 2026 18:42:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1770144125;
	bh=mO23Kx6eq55R7Z0MyMar5wYSwXRgqxNhogVerhCEHd4=;
	h=From:Subject:Date:To:Cc:From;
	b=QWUNpb6cEKBfoHbWPXvNu6Ai4/Q8rDmvxGBOv2h5VpFCNKYfr+/sThxU8mAtRx+nq
	 EgDMDINB2KMTk0KPZOlbsubm14SkMCQ+HWMwTmlMjxlVcbeQjkyzH0IphTSpMQGhiz
	 v8f/MMy+wf7/GXPtMsD38QYHylXaq2F+eogwNh/fimh06AoTacQ9OGB6q3AkGAy05O
	 Mq41lAvoS5aVVP/Oo5DWENQGjfnFylXkU/Uq5PXxyB5pq8C6w70GiROiTmmHbglso0
	 xJwjvaFE+7fk8eXAxLxJsQ2CZqdfdwgwQVygFtVVpMwfIEFjtHbAS4/ObsF2vVrahS
	 2ftOyuGU8WE0g==
Received: from jupiter.universe (dyndsl-091-248-189-143.ewe-ip-backbone.de [91.248.189.143])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 8585917E13D6;
	Tue,  3 Feb 2026 19:42:05 +0100 (CET)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 496C4480024; Tue, 03 Feb 2026 19:42:05 +0100 (CET)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Subject: [PATCH 0/7] phy: rockchip: usbdp: Fixes, DP 1-lane support and
 cleanups
Date: Tue, 03 Feb 2026 19:41:26 +0100
Message-Id: <20260203-rockchip-usbdp-cleanup-v1-0-16a6f92ed176@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFZBgmkC/x3MTQqAIBBA4avErBswQ6GuEi38mXIoTJQiiO6et
 PwW7z1QKDMVGJsHMl1c+IgVXduACyauhOyrQQqphRQ95sNtLnDCs1if0O1k4plQWTX4xSrdmR5
 qnDItfP/jaX7fD9mr2B1oAAAA
X-Change-ID: 20260203-rockchip-usbdp-cleanup-5b59dfb561a3
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Heiko Stuebner <heiko@sntech.de>
Cc: Andy Yan <andy.yan@rock-chips.com>, 
 Yubing Zhang <yubing.zhang@rock-chips.com>, linux-phy@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, kernel@collabora.com, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Frank Wang <frank.wang@rock-chips.com>, 
 William Wu <william.wu@rock-chips.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1614;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=mO23Kx6eq55R7Z0MyMar5wYSwXRgqxNhogVerhCEHd4=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGmCQXyLrkAxPumrX2hn7NLs48wa6QZfKfadt
 aAAkLIkwlNlqokCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJpgkF8AAoJENju1/PI
 O/qa7w8P/3APVmiYbkziAamy/fniiLaxmx7YfRBCgu60bfYfMUM8AdS/0QpIQxlBH1QPXd5FGyd
 db/vWkAOpMN8zkp3OLjq4hWySjwFh+Wnt9twTGqylj5wqB6OtdNP5zRAgiuOEJ4ia6Np2KkAsDL
 ddAghqwReJvqF8gveJiBo7hxEG8Pi1WJcqIYJTBVYesTCNwafV+CT2WN/tkfgOwhaNX+rwKXF7t
 By4wAsHdNKg9P8QfNzyyhOzLULE7jjwnEL006ZlZ+7XsuuiihorIrNTdjm14+5nHMil4A5CWFWJ
 p9Ontfx+/yg+Suh9CupQOzev81+1beHYVZMg93UuWpJY6OlAKELwciz/hBhiF85qJXrmThl8hMD
 DTrbctSbEMihOgOlkRnu0DoSGRmOWx58tJlRd7SIpjgqow5RAsYMOr15bSjUMsZhDzMGez0o5Ew
 Za6G3E8g+o+kFCgiBXYmjqqDgcyRlm+KqSe6AKfOSMHQQ4BzYnPJEQfd2EvQwE4oYj9iIXp7nl1
 1ENqwOEfhTFYLX44tDPDWfKXUK2g9VVBpxz0FPmBQkJqbtoN8Faa4syvJI1CqV0nq54zB3BsCez
 /hPRZvikBcyvEKX6SQvJIMbGMwGuLiKThbPEORHj7NUFOE+glcamG8ua9sR1UoyDYAm6vMhIxiO
 aIsDPaTqlZcHsv7NY5GgsHw==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260203_184211_692220_C13E2BDA 
X-CRM114-Status: UNSURE (   9.32  )
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

As there are some issues with the DisplayPort support, I went
though Rockchip's BSP kernel tree and looked for fixes. I found
two small changes for the initial register setup, which do not
help with the DP issue but seem sensible in general. Afterwards
I added one more fix, which corrects an issue that effectively
results in USB-C adapters with combined USB3+DP capabilities
not being able to use the DP part.

Afterwards I added one more patch adding single-lane DP support
(found in Rockchip BSP kernel) and a couple of cleanups from my
side. These are logically independent from the fixes, but I put
all together in a single series because they need to be applied
in the right order to avoid conflicts.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
Frank Wang (1):
      phy: rockchip: usbdp: Amend SSC modulation deviation

Sebastian Reichel (4):
      phy: rockchip: usbdp: Add missing mode_change update
      phy: rockchip: usbdp: Rename DP lane functions
      phy: rockchip: usbdp: Use FIELD_PREP_WM16_CONST
      phy: rockchip: usbdp: Cleanup DP lane selection function

William Wu (1):
      phy: rockchip: usbdp: Fix LFPS detect threshold control

Zhang Yubing (1):
      phy: rockchip: usbdp: Support single-lane DP

 drivers/phy/rockchip/phy-rockchip-usbdp.c | 114 +++++++++++++-----------------
 1 file changed, 48 insertions(+), 66 deletions(-)
---
base-commit: 18f7fcd5e69a04df57b563360b88be72471d6b62
change-id: 20260203-rockchip-usbdp-cleanup-5b59dfb561a3

Best regards,
-- 
Sebastian Reichel <sebastian.reichel@collabora.com>


