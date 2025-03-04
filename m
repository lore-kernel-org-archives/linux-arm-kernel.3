Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71BF9C282C6
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Mar 2025 14:03:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=slDBIJJTX7Y3SStpOg2fPi6CMdESK2ZlRy8Oz1t5mRE=; b=Qa5Kcync6ai65z
	EObadQlEAOnmo2aoRMzLFdWBCK7StJPELz72f2sFtpcIhul8+Jyq8TLS6DDCz2uq9/pzwYGO0oTAP
	ShxqT32zGLdzU5xjJ+0nNTzGUnn/d95I/ixcz2OLwqvPTKLQn+kX0hTQatED4r2PtD7eYbVS6cM9H
	tcuUvqw12BQ/BbFIf1HKfye8RWAn/urD8PKlWsYWCz/Ue34GjFnFDL76rQvdwNTEBXjf4bFwNj0Ed
	DW3hAoTNTRO1AKtNts7XAryNZkOIKKTWzUcEKcXQlTuRE2QIeMX6loHa4xB+ZPEnvLZnytavv2G+o
	8d4K3xTxlGQ8kBWo5Kmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpSrx-00000004tdb-3HE9;
	Tue, 04 Mar 2025 14:03:37 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpSqN-00000004tJ3-2Y6k;
	Tue, 04 Mar 2025 14:02:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1741096917;
	bh=uiZsGkjVPALBqyMp/QBuYMSVQNJhd7VY33/kwzTcb58=;
	h=From:Subject:Date:To:Cc:From;
	b=S8cuiZyjljT3JMmX+9hETnyOta6k0GRU4it8yY/35FwzmfIUlRkDOOAhB3hsbuCb1
	 bJWt2KEtORIXlLwHLjLrGKm0TxXbzfha3YVhR6sx39o1qsg4x+mMeKOfqTDoRTQm2R
	 L4PlWbdkq8dMTcfM7KKCwAd4JN0dvs6Z7O4tbDzrZH0GSamsZvQP1gb3aOCWyufwT9
	 dsmX42SS752HzjU0Jbk/BNMp6FtxXgIW56oGFCZPAfcvCdOVP0SuAjS9rZwTX66zoh
	 6qFqmCN4sLpwy0zFUAX5juohusVRIETqtOFOJv0EKiZziajDQLmsJ420rHem8BDpUe
	 1yavBZ+okHL5w==
Received: from apertis-1.home (2a01cb0892F2D600C8F85cf092d4Af51.ipv6.abo.wanadoo.fr [IPv6:2a01:cb08:92f2:d600:c8f8:5cf0:92d4:af51])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: jmassot)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 242AD17E087E;
	Tue,  4 Mar 2025 15:01:57 +0100 (CET)
From: Julien Massot <julien.massot@collabora.com>
Subject: [PATCH v2 0/2] mt8395-radxa-nio-12l: Add overlay for Radxa 8HD
 panel
Date: Tue, 04 Mar 2025 15:01:54 +0100
Message-Id: <20250304-radxa-panel-overlay-v2-0-3ee6797d3f86@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANIHx2cC/32NQQ6CMBBFr0Jm7Ris1FBX3sOwGNpBmlRKpqaBE
 O5u5QAu30v++xskFs8J7tUGwtknH6cC6lSBHWl6MXpXGFStdK3UDYXcQjjTxAFjZgm0om5U43q
 jjdEWynIWHvxyVJ9d4dGnT5T1OMmXn/3fyxes0XBrrq0beib3sDEE6qPQ2cY3dPu+fwFbL20Nu
 gAAAA==
X-Change-ID: 20250226-radxa-panel-overlay-5424db95995c
To: kernel@collabora.com, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 kernel@collabora.com, Julien Massot <julien.massot@collabora.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250304_060159_821882_49DC4E0B 
X-CRM114-Status: UNSURE (   9.69  )
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

Hi,
small series to enable a DSI panel on Radxa NIO 12L.

The first patch adds missing dts nodes to expose some
feature of the DSI0 port.

The second patch adds the Radxa 8 HD panel as an overlay.

Tested on top of linux-next tag:next-20250303

Signed-off-by: Julien Massot <julien.massot@collabora.com>
---
Changes in v2:
- Moved video pipeline enablement to the overlay (ovl0, vdosys0)
- Keep backlight disabled in the board dts, enabled in the panel overlay
- Test again on Linux next-20250303
- Link to v1: https://lore.kernel.org/r/20250226-radxa-panel-overlay-v1-0-9e8938dfbead@collabora.com

---
Julien Massot (2):
      arm64: dts: mediatek: mt8395-nio-12l: Prepare MIPI DSI port
      arm64: dts: mediatek: mt8395-radxa-nio-12l: Add Radxa 8 HD panel

 arch/arm64/boot/dts/mediatek/Makefile              |  2 +
 .../mediatek/mt8395-radxa-nio-12l-8-hd-panel.dtso  | 84 ++++++++++++++++++++++
 .../boot/dts/mediatek/mt8395-radxa-nio-12l.dts     | 45 ++++++++++++
 3 files changed, 131 insertions(+)
---
base-commit: cd3215bbcb9d4321def93fea6cfad4d5b42b9d1d
change-id: 20250226-radxa-panel-overlay-5424db95995c

Best regards,
-- 
Julien Massot <julien.massot@collabora.com>


