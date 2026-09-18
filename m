Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16CB8C982D8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Sep 2026 15:33:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Subject:Cc:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WtQrZyaQlO+mtHmYw2SBSJxPWTjmzlVgI7Rp9b5tPg4=; b=eY5rjh7KNdJMpRidhBGzhje7lH
	hh3Q4OpfIbKWzN3SaK1GCLLLd3NoZH2SHKp8DVoGpHUSb3YE59j/xm8LR3L+YQtahHDWNiDZHEY4d
	6q/xJh0EAFO81xoGT8tNlFfYVJCCXVOevU8fF+NmHkHZD7O7IMAgsDaM1cwEY2q+8c/F46cHw+RNq
	knE4urrzdMY4/pRMYC5FnAHoXOnQNw1REPQ3UAIpA4GjZ8kLW7Vxo49DsaW2h5gPvHWsZhRXHPaEX
	rG+StyLMNuvIdVvgExSH9Six47oi0WJZbvt94qQJDMltYdk97wYYkwTYTVjAh07piUGBEfoQ7ZsPY
	XKC+f6rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7aaK-0000000EtVr-04rD;
	Fri, 18 Sep 2026 15:33:08 +0000
Received: from smtp.forwardemail.net ([121.127.44.73])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7aaD-0000000EtTY-2IHa
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Sep 2026 15:33:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ubuntu.com;
 h=In-Reply-To: References: To: From: Subject: Cc: Message-Id: Date:
 Content-Type: Content-Transfer-Encoding: Mime-Version; q=dns/txt;
 s=fe-953a8a3ca9; t=1789745579;
 bh=WtQrZyaQlO+mtHmYw2SBSJxPWTjmzlVgI7Rp9b5tPg4=;
 b=BEUEoqAGW1PzF8V2O16n7oJ7lr7h1N/QjkXrrCZ3c9gIJp2rrv8DcYy7nu8T3+mrUP2Q0AMaf
 S0DLVV9zBDUNmtvTbHhAWj4zTd3CNfkWkh8vIu70l2ByyaEPTVcFOJhGTHNgBi/geBSA8kP0r2b
 RddDLqc42Omslgo/Fzx3JoTkktfvKAREbVGViOHu1jzyvbJQ2Z/uGoyn++8g+IHt4WogzWTTWMB
 TGahxDH5qfjtbqLsEeEgbZvJLZjBejFVt58auTb0D2J73ot7wrtXIRkbeNuB7mgZrdxm4IAgsYK
 XUnN+P57W3Qq/vWkUf1fxwmBn9sJpy+7FWRdzNaaCpYA==
X-Forward-Email-ID: 6aad59a12df78bc22ddeff38
X-Forward-Email-Sender: rfc822; jpeisach@ubuntu.com, smtp.forwardemail.net,
 121.127.44.73
X-Forward-Email-Version: 2.14.2
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8; format=Flowed
Date: Fri, 18 Sep 2026 11:32:45 -0400
Message-Id: <DLIJUQCKB76W.3RHK9KPO5JSOZ@ubuntu.com>
Cc: <linux-phy@lists.infradead.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <mfd@lists.linux.dev>, <linux-clk@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>,
 <linux-rockchip@lists.infradead.org>, <linux-riscv@lists.infradead.org>,
 "Marek Szyprowski" <m.szyprowski@samsung.com>, "Maud Spierings"
 <maud_spierings@murena.io>, "Graham Markall" <hello@big-grey.co.uk>,
 "Icenowy Zheng" <zhengxingda@iscas.ac.cn>, "Chaoyi Chen"
 <chaoyi.chen@rock-chips.com>, =?utf-8?q?Uwe_Kleine-K=C3=B6nig?=
 <u.kleine-koenig@baylibre.com>
Subject: Re: [PATCH v4 00/20] drm: starfive: jh7110: Enable display
 subsystem
From: "Joshua Peisach" <jpeisach@ubuntu.com>
To: "Michal Wilczynski" <m.wilczynski@samsung.com>, "Joshua Peisach"
 <jpeisach@ubuntu.com>, "Vinod Koul" <vkoul@kernel.org>, "Neil Armstrong"
 <neil.armstrong@linaro.org>, "Rob Herring" <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>,
 "Andrzej Hajda" <andrzej.hajda@intel.com>, "Robert Foss"
 <rfoss@kernel.org>, "Laurent Pinchart" <Laurent.pinchart@ideasonboard.com>,
 "Jonas Karlman" <jonas@kwiboo.se>, "Jernej Skrabec"
 <jernej.skrabec@gmail.com>, "Luca Ceresoli" <luca.ceresoli@bootlin.com>,
 "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>, "Maxime Ripard"
 <mripard@kernel.org>, "Thomas Zimmermann" <tzimmermann@suse.de>, "Lee
 Jones" <lee@kernel.org>, "Andy Yan" <andy.yan@rock-chips.com>, "Philipp
 Zabel" <p.zabel@pengutronix.de>, "Emil Renner Berthing" <kernel@esmil.dk>,
 "Hal Feng" <hal.feng@starfivetech.com>, "Michael Turquette"
 <mturquette@baylibre.com>, "Stephen Boyd" <sboyd@kernel.org>, "Heiko
 Stuebner" <heiko@sntech.de>, "Paul Walmsley" <pjw@kernel.org>, "Palmer
 Dabbelt" <palmer@dabbelt.com>, "Albert Ou" <aou@eecs.berkeley.edu>,
 "Alexandre Ghiti" <alex@ghiti.fr>, "Dominique Belhachemi" <db@domibel.de>,
 "Brian Masney" <bmasney+clk@redhat.com>, "Jerome Brunet"
 <jbrunet+clk@baylibre.com>
X-Mailer: aerc 0.21.0
References: <CGME20260915153213eucas1p148f013af239a334fc78cdc249c0f8a61@eucas1p1.samsung.com> <20260915-jh7110-clean-send-v4-0-f0e4fd6f2cc8@samsung.com> <DLGBPXP4F8E0.9X0QMZ9GFQVF@ubuntu.com> <136d6789-2f0c-4a91-ab2d-de3a3f119d5d@samsung.com>
In-Reply-To: <136d6789-2f0c-4a91-ab2d-de3a3f119d5d@samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260918_083301_642016_0991FB92 
X-CRM114-Status: GOOD (  19.73  )
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

On Thu Sep 17, 2026 at 1:22 PM EDT, Michal Wilczynski wrote:
>
>
> On 9/16/26 02:45, Joshua Peisach wrote:
>> On Tue Sep 15, 2026 at 11:32 AM EDT, Michal Wilczynski wrote:
>>>
>>> Testing
>>> =3D=3D=3D=3D=3D=3D=3D
>>>
>>> Tested on a VisionFive 2 v1.3B using modetest.
>>=20
>> I.. got nothing. I did have to manually modprobe the modules, but
>> unless I am doing something wrong.. I didn't get anything and modetest
>> just gave -2.
>
> Hmm have you also changed the DTB not just the kernel and the modules
> (you can also built in everything).
>
Yes (I didn't built-in everything, but I did make sure the DTB was
copied and flash-kernel was run)

> Also note modetest needs -M verisilicon.
>

"failed to open device 'versilicon' with busid '(null)': No such file
or directory"


> If that is not it, could you send "dmesg | grep -iE
> 'verisilicon|inno|hdmi|vout'" and "ls /sys/class/drm/"?
>
the dmesg output:

[    0.090950] /soc/display-subsystem@29400000/hdmi@29590000/controller: Fi=
xed dependency cycle(s) with /soc/display-subsystem@29400000/display@294000=
00
[    0.091029] /soc/display-subsystem@29400000/display@29400000: Fixed depe=
ndency cycle(s) with /soc/display-subsystem@29400000/hdmi@29590000/controll=
er
[    0.104227] /hdmi-connector: Fixed dependency cycle(s) with /soc/display=
-subsystem@29400000/hdmi@29590000/controller
[    0.104272] /soc/display-subsystem@29400000/hdmi@29590000/controller: Fi=
xed dependency cycle(s) with /hdmi-connector


/sys/class/drm only contains the file "version"

-Josh

>>=20
>>> ---
>>> Michal Wilczynski (20):
>>>       dt-bindings: phy: Add starfive,jh7110-inno-hdmi-phy
>>>       dt-bindings: display: bridge: Add starfive,jh7110-inno-hdmi-contr=
oller
>>>       dt-bindings: mfd: Add starfive,jh7110-hdmi-subsystem
>>>       dt-bindings: soc: starfive: Add starfive,jh7110-vout-syscon
>>>       dt-bindings: display: verisilicon: Add starfive,jh7110-dc8200
>>>       dt-bindings: soc: starfive: Add starfive,jh7110-vout-subsystem
>>>       drm/bridge: inno-hdmi: Split probe out of bind
>>>       drm/bridge: inno-hdmi: Allow the register map to come from a pare=
nt
>>>       drm/bridge: inno-hdmi: Add .disable platform operation
>>>       drm/bridge: inno-hdmi: Add .mode_valid platform operation
>>>       drm/bridge: inno-hdmi: Make the PHY configuration table optional
>>>       soc: starfive: Add jh7110-hdmi-subsystem driver
>>>       soc: starfive: Add jh7110-vout-subsystem driver
>>>       clk: starfive: jh7110-vout: Allow pixel clock rate propagation
>>>       drm/bridge: starfive: Add JH7110 HDMI controller driver
>>>       phy: Add common Innosilicon HDMI PHY helpers
>>>       phy: rockchip: inno-hdmi: Use the common Innosilicon PHY helpers
>>>       phy: starfive: Add jh7110-inno-hdmi-phy driver
>>>       riscv: dts: starfive: jh7110: Update DT for display subsystem
>>>       MAINTAINERS: Add StarFive JH7110 display subsystem entry
>>>
>>>  .../starfive,jh7110-inno-hdmi-controller.yaml      | 121 +++++
>>>  .../bindings/display/verisilicon,dc.yaml           |   1 +
>>>  .../mfd/starfive,jh7110-hdmi-subsystem.yaml        |  95 ++++
>>>  .../phy/starfive,jh7110-inno-hdmi-phy.yaml         |  49 ++
>>>  .../soc/starfive/starfive,jh7110-syscon.yaml       |   1 +
>>>  .../starfive/starfive,jh7110-vout-subsystem.yaml   | 218 ++++++++
>>>  MAINTAINERS                                        |  13 +
>>>  arch/riscv/boot/dts/starfive/jh7110-common.dtsi    | 121 ++++-
>>>  arch/riscv/boot/dts/starfive/jh7110.dtsi           | 105 +++-
>>>  drivers/clk/starfive/clk-starfive-jh7110-vout.c    |   6 +-
>>>  drivers/gpu/drm/bridge/Kconfig                     |  11 +
>>>  drivers/gpu/drm/bridge/Makefile                    |   1 +
>>>  drivers/gpu/drm/bridge/inno-hdmi.c                 | 112 +++-
>>>  drivers/gpu/drm/bridge/jh7110-inno-hdmi.c          | 297 +++++++++++
>>>  drivers/phy/Kconfig                                |   8 +
>>>  drivers/phy/Makefile                               |   1 +
>>>  drivers/phy/phy-inno-hdmi.c                        | 298 +++++++++++
>>>  drivers/phy/rockchip/Kconfig                       |   1 +
>>>  drivers/phy/rockchip/phy-rockchip-inno-hdmi.c      | 168 +-----
>>>  drivers/phy/starfive/Kconfig                       |  20 +
>>>  drivers/phy/starfive/Makefile                      |   1 +
>>>  drivers/phy/starfive/phy-jh7110-inno-hdmi.c        | 579 +++++++++++++=
++++++++
>>>  drivers/soc/Kconfig                                |   1 +
>>>  drivers/soc/Makefile                               |   1 +
>>>  drivers/soc/starfive/Kconfig                       |  43 ++
>>>  drivers/soc/starfive/Makefile                      |   3 +
>>>  drivers/soc/starfive/jh7110-hdmi-subsystem.c       |  73 +++
>>>  drivers/soc/starfive/jh7110-vout-subsystem.c       |  82 +++
>>>  include/drm/bridge/inno_hdmi.h                     |  10 +-
>>>  include/linux/phy/inno-hdmi-phy.h                  |  85 +++
>>>  30 files changed, 2337 insertions(+), 188 deletions(-)
>>> ---
>>> base-commit: fd73f4a6659897191fa0d40695fe370925dd3780
>>> change-id: 20251031-jh7110-clean-send-7d2242118026
>>>
>>> Best regards,
>>=20
>> By the way, something weird happenined while I applied the patches
>> using git am. Somehow, some were out of order. The 10th patch
>> adding .mode_valid tried to be applied before .disable even though
>> in the series, the order is correctly set? git would obviously
>> fail because the .disable entry did not exist in the header, so I had
>> to manually put those in.
>>=20
>> I guess it's possible that something went wrong here? I personally
>> pulled the mailbox from the lore.kernel.org mbox.gz file.
>
> I would recommend using b4 shazam instead
>
>>=20
>
> Best regards,


