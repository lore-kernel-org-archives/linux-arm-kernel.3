Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C80B3FF8868
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Apr 2026 14:24:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=djj08T+YPT9WmejZ47kv3TGOahII0KpljVMTQtp6NzM=; b=2VhlsilGNwp0e1cb1ugcDMI8OM
	lXuaI8e/HlTPXetRaf2Q/F4OmriOPSLvJ4Cp/b3ErKk7Hk/ObNWAf97tku+g3BZjZwYEj6U1OjU4k
	/gz5Xdv4vZgMohpe0uValrmKCf2Vka1OgSmjkcWmsasFfXrve3ocN421px6UITD4zCLeJjzc9UubH
	PGmDIvciUTNhfDtmtRMz7a59QtHE3BTZ+CA+J9lRkeJB49aThxGtCiMoh6DOG2SkNWX7opt5qs5+u
	L3ZgOFdV+4/CYU4ck41FH3PEiGKQHItSkkSwokugsjBuRsZtCyxIrjb4oIhmEUDWKtnT8xhhNNP2G
	GWJygQew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHMsj-0000000H5dn-3RwZ;
	Mon, 27 Apr 2026 14:24:17 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHMsf-0000000H5az-1YcZ
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 27 Apr 2026 14:24:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=djj08T+YPT9WmejZ47kv3TGOahII0KpljVMTQtp6NzM=; b=TWakmz0EUeUGqZ5YE00gkzYT60
	8B7F62w7j2xFkLlXv0ExyQZJLI6x69pT+uu6Om2Vs2BNJV+VYqRlDol6bTCKv6JjVkSJqHqZhzOf2
	8QRsojzfjzdcHIjjuDk9tigWAn8lvUbLXscIxKF7pd6qZMmYcyqkIOOCCGhP5UvK6LkZhWJn389UN
	Y1y5rRo1mkXr4O0Y4GJnQH2FKjz6w903017vdNpRoG8EgKAStqN5+CmQJlv5uu1vWOX9BuHkndzxi
	ylM8TFyJiG6N0azGFBwDdrky2CLx0r6SNscrUPIcnBfF6xQIUpBa2ZLkZkWIna1N4jz/ugzw/nwgg
	s98ofRVw==;
Received: from sea.source.kernel.org ([172.234.252.31])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHMsZ-00000000nag-3a6o
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Apr 2026 14:24:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1FC64443C3;
	Mon, 27 Apr 2026 14:24:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC263C19425;
	Mon, 27 Apr 2026 14:23:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777299843;
	bh=ftZ0XwT6UuuizUHV9Pp1aiajU/PBr+uLiW96IGbuHvs=;
	h=From:To:Cc:Subject:Date:From;
	b=sRxiN7hp9DE6K4vJvQH/+GCR3cimtAOQLXQRpPar3WCm/X1+DprIIJ9tPpB42EQzY
	 gJZVVJ/q+C9Bg+wDDMKyXHpFzgZH8ejXky0uZNzCYBKfq41c6hTr4yELINTYGgtA6E
	 iLLlV+oQ8iF0RA2aPWsHxFPPcvPezbJiX0+sNZPtuAYzDQYViCJC96oM6piu62PkoW
	 Q0cG2/saUzrOE3HhFzCWWXQbFsDAGkopAuJlzSqjZtdD9UWP5T+EH0sWWIcePGd4La
	 G1hEd7FnuYb/tmGpJz7ARATyxFgORRBvToKLMziTOJuE9WF98qDH9UBZueeuxeuRHE
	 IsRuwgNFl6Smw==
From: Arnd Bergmann <arnd@kernel.org>
To: 
Cc: Arnd Bergmann <arnd@arndb.de>,
	"Aaro Koskinen" <aaro.koskinen@iki.fi>,
	"Andreas Kemnade" <andreas@kemnade.info>,
	"Bartosz Golaszewski" <brgl@kernel.org>,
	=?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
	"David S. Miller" <davem@davemloft.net>,
	"Dmitry Torokhov" <dmitry.torokhov@gmail.com>,
	"Eric Dumazet" <edumazet@google.com>,
	"Felipe Balbi" <balbi@kernel.org>,
	"Jakub Kicinski" <kuba@kernel.org>,
	"Johannes Berg" <johannes@sipsolutions.net>,
	"Kevin Hilman" <khilman@baylibre.com>,
	"Krzysztof Kozlowski" <krzk+dt@kernel.org>,
	"Linus Walleij" <linusw@kernel.org>,
	"Paolo Abeni" <pabeni@redhat.com>,
	"Rob Herring" <robh+dt@kernel.org>,
	"Roger Quadros" <rogerq@kernel.org>,
	"Tony Lindgren" <tony@atomide.com>,
	linux-wireless@vger.kernel.org,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	linux-omap@vger.kernel.org
Subject: [PATCH v3 0/3] wireless: p54 devicetree conversion
Date: Mon, 27 Apr 2026 16:23:52 +0200
Message-Id: <20260427142355.2532714-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260427_152408_428870_5B527C02 
X-CRM114-Status: GOOD (  12.87  )
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

From: Arnd Bergmann <arnd@arndb.de>

This is an older patch of mine that I lost track of. We already decided
a while ago that the OMAP2 platform should probably be removed entirely,
and this is the only known user, but it's probably a good idea to still
get the driver changes in, in case there are other out-of-tree users.

We probably don't have to worry about bisectability any more though,
so the devicetree and driver changes can just get merged independently
through the OMAP and wireless trees, respectively.

     Arnd

v2 Link: https://lore.kernel.org/all/20230404082401.1087835-1-arnd@kernel.org/

Cc: "Aaro Koskinen" <aaro.koskinen@iki.fi>
Cc: "Andreas Kemnade" <andreas@kemnade.info>
Cc: "Arnd Bergmann" <arnd@arndb.de>
Cc: "Bartosz Golaszewski" <brgl@kernel.org>
Cc: "Benoît Cousson" <bcousson@baylibre.com>
Cc: "David S. Miller" <davem@davemloft.net>
Cc: "Dmitry Torokhov" <dmitry.torokhov@gmail.com>
Cc: "Eric Dumazet" <edumazet@google.com>
Cc: "Felipe Balbi" <balbi@kernel.org>
Cc: "Jakub Kicinski" <kuba@kernel.org>
Cc: "Johannes Berg" <johannes@sipsolutions.net>
Cc: "Kevin Hilman" <khilman@baylibre.com>
Cc: "Krzysztof Kozlowski" <krzk+dt@kernel.org>
Cc: "Linus Walleij" <linusw@kernel.org>
Cc: "Paolo Abeni" <pabeni@redhat.com>
Cc: "Rob Herring" <robh+dt@kernel.org>
Cc: "Roger Quadros" <rogerq@kernel.org>
Cc: "Tony Lindgren" <tony@atomide.com>
Cc: linux-wireless@vger.kernel.org
Cc: netdev@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-gpio@vger.kernel.org
Cc: linux-omap@vger.kernel.org


Arnd Bergmann (3):
  dt-bindings: net: add st,stlc45xx/p54spi binding
  ARM: dts: omap2: add stlc4560 spi-wireless node
  p54spi: convert to devicetree

 .../bindings/net/wireless/st,stlc45xx.yaml    | 58 ++++++++++++++++
 MAINTAINERS                                   |  1 +
 arch/arm/boot/dts/ti/omap/omap2.dtsi          |  4 ++
 .../dts/ti/omap/omap2420-n8x0-common.dtsi     | 12 ++++
 arch/arm/mach-omap2/board-n8x0.c              | 18 -----
 drivers/net/wireless/intersil/p54/p54spi.c    | 68 +++++++------------
 drivers/net/wireless/intersil/p54/p54spi.h    |  3 +
 7 files changed, 103 insertions(+), 61 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/net/wireless/st,stlc45xx.yaml

-- 
2.39.5


