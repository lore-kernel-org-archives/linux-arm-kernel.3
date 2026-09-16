Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F804C88E77
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Sep 2026 00:45:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Subject:Cc:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s2V8BnF8h+8Uq8u8VZxp/reb7V9zH1peGA2ahNF542Q=; b=s836fPzxqBOy/STh2+EyXQ0l5z
	Yg+wJcEu56F73TVsI1LBTPbI+yTEKR3ngtucqwtgD7JIhda+ahMNE4KWIhGDsvdXY1o/F3FeOfl2+
	4HXhHl5kZqCC7YIv7neX1ZaPXllkma6tJu/sN7SaFmG/VI9Xtvtz37+aD2JX5B0gr3ffLa+SIuZKs
	bCtWylnbVaFWcMwDlEyvHQ1IphAPkIIJJ2Q9sLUFpl9/9hwgPvol5tZSRoodE7xUO9/5ptC0dXj4D
	BBVAM+VlKHxJkXgcWpei21CUzQOwgA1cPkGJJVLLxcQ6CXfrT7r5+cKIXrt3V93QEnMiIPVtLEU5H
	TLPoPeQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6dmP-000000088BT-2mzA;
	Wed, 16 Sep 2026 00:45:41 +0000
Received: from smtp.forwardemail.net ([149.28.215.223])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6dmM-0000000889t-0Zml
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Sep 2026 00:45:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ubuntu.com;
 h=In-Reply-To: References: To: From: Subject: Cc: Message-Id: Date:
 Content-Type: Content-Transfer-Encoding: Mime-Version; q=dns/txt;
 s=fe-953a8a3ca9; t=1789519536;
 bh=s2V8BnF8h+8Uq8u8VZxp/reb7V9zH1peGA2ahNF542Q=;
 b=XRW9PQnk7SBEuQDcaC3PMm0TRFUrm2H/Wgd+yUY/ufRi1WtsVoU4xICtlXlOjq+6vd5X27/Nl
 fQVJnViLukaeBzGf81Vrw4v9Le05qmrX7o6u9z44+huxEGLMeMNzTyr2lWG9y9e772GgCHwoWwY
 1fbbcMGhmbxPCGIZdlckMJcbZSNbneb+eLxXnmY6ISyS6AjlEcOtbI/8+lT5D59D7LEX74RKYuO
 o4ArkORrAjdIoReonvjOcEooYsSsaIe59/RE8rLZeaPV7uXT+eYt61V3+JQesfLB3LYnbu4uoVi
 ZkPZ+wkUJtpGPLEzlNhuBOuwBRYw7/+HO8FA5aM/pC+Q==
X-Forward-Email-ID: 6aa9e69076866d48a84e7189
X-Forward-Email-Sender: rfc822; jpeisach@ubuntu.com, smtp.forwardemail.net,
 149.28.215.223
X-Forward-Email-Version: 2.14.2
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8; format=Flowed
Date: Tue, 15 Sep 2026 20:45:01 -0400
Message-Id: <DLGBPXP4F8E0.9X0QMZ9GFQVF@ubuntu.com>
Cc: <linux-phy@lists.infradead.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <mfd@lists.linux.dev>, <linux-clk@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>,
 <linux-rockchip@lists.infradead.org>, <linux-riscv@lists.infradead.org>,
 "Marek Szyprowski" <m.szyprowski@samsung.com>, "Maud Spierings"
 <maud_spierings@murena.io>, "Graham Markall" <hello@big-grey.co.uk>,
 "Icenowy Zheng" <zhengxingda@iscas.ac.cn>, "Chaoyi Chen"
 <chaoyi.chen@rock-chips.com>, "Joshua Peisach" <jpeisach@ubuntu.com>,
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Subject: Re: [PATCH v4 00/20] drm: starfive: jh7110: Enable display
 subsystem
From: "Joshua Peisach" <jpeisach@ubuntu.com>
To: "Michal Wilczynski" <m.wilczynski@samsung.com>, "Vinod Koul"
 <vkoul@kernel.org>, "Neil Armstrong" <neil.armstrong@linaro.org>, "Rob
 Herring" <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>, "Andrzej Hajda"
 <andrzej.hajda@intel.com>, "Robert Foss" <rfoss@kernel.org>, "Laurent
 Pinchart" <Laurent.pinchart@ideasonboard.com>, "Jonas Karlman"
 <jonas@kwiboo.se>, "Jernej Skrabec" <jernej.skrabec@gmail.com>, "Luca
 Ceresoli" <luca.ceresoli@bootlin.com>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "Lee Jones" <lee@kernel.org>,
 "Andy Yan" <andy.yan@rock-chips.com>, "Philipp Zabel"
 <p.zabel@pengutronix.de>, "Emil Renner Berthing" <kernel@esmil.dk>, "Hal
 Feng" <hal.feng@starfivetech.com>, "Michael Turquette"
 <mturquette@baylibre.com>, "Stephen Boyd" <sboyd@kernel.org>, "Heiko
 Stuebner" <heiko@sntech.de>, "Paul Walmsley" <pjw@kernel.org>, "Palmer
 Dabbelt" <palmer@dabbelt.com>, "Albert Ou" <aou@eecs.berkeley.edu>,
 "Alexandre Ghiti" <alex@ghiti.fr>, "Dominique Belhachemi" <db@domibel.de>,
 "Brian Masney" <bmasney+clk@redhat.com>, "Jerome Brunet"
 <jbrunet+clk@baylibre.com>
X-Mailer: aerc 0.21.0
References: <CGME20260915153213eucas1p148f013af239a334fc78cdc249c0f8a61@eucas1p1.samsung.com> <20260915-jh7110-clean-send-v4-0-f0e4fd6f2cc8@samsung.com>
In-Reply-To: <20260915-jh7110-clean-send-v4-0-f0e4fd6f2cc8@samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_174538_448594_90049B8A 
X-CRM114-Status: GOOD (  15.18  )
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

On Tue Sep 15, 2026 at 11:32 AM EDT, Michal Wilczynski wrote:
>
> Testing
> =3D=3D=3D=3D=3D=3D=3D
>
> Tested on a VisionFive 2 v1.3B using modetest.

I.. got nothing. I did have to manually modprobe the modules, but
unless I am doing something wrong.. I didn't get anything and modetest
just gave -2.

> ---
> Michal Wilczynski (20):
>       dt-bindings: phy: Add starfive,jh7110-inno-hdmi-phy
>       dt-bindings: display: bridge: Add starfive,jh7110-inno-hdmi-control=
ler
>       dt-bindings: mfd: Add starfive,jh7110-hdmi-subsystem
>       dt-bindings: soc: starfive: Add starfive,jh7110-vout-syscon
>       dt-bindings: display: verisilicon: Add starfive,jh7110-dc8200
>       dt-bindings: soc: starfive: Add starfive,jh7110-vout-subsystem
>       drm/bridge: inno-hdmi: Split probe out of bind
>       drm/bridge: inno-hdmi: Allow the register map to come from a parent
>       drm/bridge: inno-hdmi: Add .disable platform operation
>       drm/bridge: inno-hdmi: Add .mode_valid platform operation
>       drm/bridge: inno-hdmi: Make the PHY configuration table optional
>       soc: starfive: Add jh7110-hdmi-subsystem driver
>       soc: starfive: Add jh7110-vout-subsystem driver
>       clk: starfive: jh7110-vout: Allow pixel clock rate propagation
>       drm/bridge: starfive: Add JH7110 HDMI controller driver
>       phy: Add common Innosilicon HDMI PHY helpers
>       phy: rockchip: inno-hdmi: Use the common Innosilicon PHY helpers
>       phy: starfive: Add jh7110-inno-hdmi-phy driver
>       riscv: dts: starfive: jh7110: Update DT for display subsystem
>       MAINTAINERS: Add StarFive JH7110 display subsystem entry
>
>  .../starfive,jh7110-inno-hdmi-controller.yaml      | 121 +++++
>  .../bindings/display/verisilicon,dc.yaml           |   1 +
>  .../mfd/starfive,jh7110-hdmi-subsystem.yaml        |  95 ++++
>  .../phy/starfive,jh7110-inno-hdmi-phy.yaml         |  49 ++
>  .../soc/starfive/starfive,jh7110-syscon.yaml       |   1 +
>  .../starfive/starfive,jh7110-vout-subsystem.yaml   | 218 ++++++++
>  MAINTAINERS                                        |  13 +
>  arch/riscv/boot/dts/starfive/jh7110-common.dtsi    | 121 ++++-
>  arch/riscv/boot/dts/starfive/jh7110.dtsi           | 105 +++-
>  drivers/clk/starfive/clk-starfive-jh7110-vout.c    |   6 +-
>  drivers/gpu/drm/bridge/Kconfig                     |  11 +
>  drivers/gpu/drm/bridge/Makefile                    |   1 +
>  drivers/gpu/drm/bridge/inno-hdmi.c                 | 112 +++-
>  drivers/gpu/drm/bridge/jh7110-inno-hdmi.c          | 297 +++++++++++
>  drivers/phy/Kconfig                                |   8 +
>  drivers/phy/Makefile                               |   1 +
>  drivers/phy/phy-inno-hdmi.c                        | 298 +++++++++++
>  drivers/phy/rockchip/Kconfig                       |   1 +
>  drivers/phy/rockchip/phy-rockchip-inno-hdmi.c      | 168 +-----
>  drivers/phy/starfive/Kconfig                       |  20 +
>  drivers/phy/starfive/Makefile                      |   1 +
>  drivers/phy/starfive/phy-jh7110-inno-hdmi.c        | 579 +++++++++++++++=
++++++
>  drivers/soc/Kconfig                                |   1 +
>  drivers/soc/Makefile                               |   1 +
>  drivers/soc/starfive/Kconfig                       |  43 ++
>  drivers/soc/starfive/Makefile                      |   3 +
>  drivers/soc/starfive/jh7110-hdmi-subsystem.c       |  73 +++
>  drivers/soc/starfive/jh7110-vout-subsystem.c       |  82 +++
>  include/drm/bridge/inno_hdmi.h                     |  10 +-
>  include/linux/phy/inno-hdmi-phy.h                  |  85 +++
>  30 files changed, 2337 insertions(+), 188 deletions(-)
> ---
> base-commit: fd73f4a6659897191fa0d40695fe370925dd3780
> change-id: 20251031-jh7110-clean-send-7d2242118026
>
> Best regards,

By the way, something weird happenined while I applied the patches
using git am. Somehow, some were out of order. The 10th patch
adding .mode_valid tried to be applied before .disable even though
in the series, the order is correctly set? git would obviously
fail because the .disable entry did not exist in the header, so I had
to manually put those in.

I guess it's possible that something went wrong here? I personally
pulled the mailbox from the lore.kernel.org mbox.gz file.

