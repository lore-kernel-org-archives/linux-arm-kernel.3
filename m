Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDF23CA5FC7
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Sep 2026 16:26:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=d/n2Q7iLBDzlJSxI9q5zVVPLJKZXlFAXccXeWNTAMwU=; b=uHh8xcYhodCknyXGlPSgeu9a3e
	R0m9z8R3Te3k1CzVz1sE41kBTmM1Y/lg2/dCaYCZXDI3QT2wRApSLgxLkAwPSZvlCxmAcN3OmDeDJ
	xmzvPlL7PsnrdTuxzHttmAqbtnsGO3X4iSvQ2O48J/pQ132VXSjMgpbpe9iZbp1k6IozmjNa8awR7
	Yh0INoXZtrlrhRwi1ceMv2czxcwk/iywSpOKHxjdNYHjKYiiPZbjt2dvQ6NQ/vULqqqI+YxOxG95A
	8lu9KiwWdaF55HSbqB5ii7P7ODeSlGqI0cnslPCRqr+8aQpgS5AzpKjVxDkHRfoG2RKp+pAjkWEOu
	di7LDXew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBx8B-00000006hAe-0qSJ;
	Wed, 30 Sep 2026 16:26:07 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBx80-00000006h78-3Zul;
	Wed, 30 Sep 2026 16:26:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:
	Subject:Cc:To:From:Reply-To:Content-Type:In-Reply-To:References;
	bh=d/n2Q7iLBDzlJSxI9q5zVVPLJKZXlFAXccXeWNTAMwU=; b=yaRIcbs+Yn1kstzUv+9ol1GoeZ
	5LGLiCuBMzCb74RnH8vseVWpY+i+ggkWFPw//9drVl/6reqm18kGMMoMwGZZ+svLcZA4Ocay/4GYL
	Gvi8oxgs8DdXMPnOqz8eE90nUq/FmRQciDxo8azg/Qqwf5M68g//6/UmSkyb/l52iPsO0SXjUpb5/
	lDjL0sGdakuRoWTa+f1dBJ33Lr9zQahNMPI+qpv1ALu1e660I1ooJLai+pkJJqRDGrtKnhoIwVZ/x
	3xfAIbxUbOMPI4Is6Oah+gRUmtQnoncGN2h575qQ2Q130zTva+8MowzWygrXoZiOi2vNDQXTesK+U
	Di0BLniA==;
From: Heiko Stuebner <heiko@sntech.de>
To: heiko@sntech.de
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	quentin.schulz@cherry.de,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	damon.ding@rock-chips.com
Subject: [PATCH v5 0/2] Add RK3588 Tiger DisplayPort carrier
Date: Wed, 30 Sep 2026 18:25:42 +0200
Message-ID: <20260930162545.2357505-1-heiko@sntech.de>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260930_092556_908824_5A854B36 
X-CRM114-Status: GOOD (  13.18  )
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

A board that allows easy testing of the Analogix eDP controller on the
RK3588. Requires Damon's recent work on hotplugging the eDP controller
displays [0].

Concerning displays, my current setup is

  DP-carrier -> DP-port -> DP-to-eDP converter from Aliexpress -> eDP panel

which produces a nice 1080p image.

changes in v5:
- didn't take a year since v4 ;-)
- drop wrong quotes around Rob's Rb
- drop wrong link-trailers that slipped into v4
- disable mmu600_pcie for the time being
- move hpd-gpio back to the dp-connector where it belongs
  With v3 of the hpd series, this now works as expected

changes in v4:
- move hpd-gpio down the the analogix-dp node
  As stated in commit cb640b2ca546 ("drm/bridge: display-connector: don't
  set OP_DETECT for DisplayPorts") the dp-connector can't just read the
  hpd-gpio and mark that as monitor detected, instead 

changes in v3:
- rebase on top of 6.17-rc1
- still should wait on the analogix bridge support

changes in v2:
- collect Ack/Review for binding
- address Quentin's comments
  - sorting in Makefile and dp-connector properties
  - ethernet alias
  - drop data-lanes comment

[0] https://lore.kernel.org/dri-devel/20260928081418.3605775-1-damon.ding@rock-chips.com


Heiko Stuebner (2):
  dt-bindings: arm: rockchip: add RK3588 DP carrier from Theobroma
    Systems
  arm64: dts: rockchip: add RK3588 DP carrier from Theobroma Systems

 .../devicetree/bindings/arm/rockchip.yaml     |   6 +-
 arch/arm64/boot/dts/rockchip/Makefile         |   1 +
 .../rk3588-tiger-displayport-carrier.dts      | 113 ++++++++++++++++++
 3 files changed, 118 insertions(+), 2 deletions(-)
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3588-tiger-displayport-carrier.dts

-- 
2.47.3


