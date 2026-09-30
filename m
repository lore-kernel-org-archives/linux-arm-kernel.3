Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A15FCA5FBE
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Sep 2026 10:08:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SHJ8hA6cabe4Iy/NBsVsa6CmVruqC9L/5DF3S0RW1vM=; b=HmaO06YCz4j4OpifPWo7G3Lz/0
	4+MDdDXlbWuUN/VdRxb0jLQw/t31gTO3bBwB5xYbhyVULlT3lF7PCpy2VvLtp7T1T5JIIB6XW3qcX
	3o9mCUm57m0ZxzcgJz0tO+FzU7CzoeIBrNE6pCuTz2I3knvYCF0ne4TS+1QECExsoe1PjG2Z6pYAr
	ATefxhljLFsZjwFtmEHbczkgmkk8z3WPzxoYmWdgmoM+CSpOhtbqrQxZ2rRYEGmwzIkVCnDz9Nw/v
	jsaXcHuXSun5KwtXKFU/jFkzyDAz5S2xKLN/bL3J6qiPPGev7S20oBFODKdxelDEUfLhrMsYOMgbd
	Xd3Et6Jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBrEG-00000005fsh-2TRN;
	Wed, 30 Sep 2026 10:08:00 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBrEE-00000005frw-0pKc;
	Wed, 30 Sep 2026 10:07:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=SHJ8hA6cabe4Iy/NBsVsa6CmVruqC9L/5DF3S0RW1vM=; b=eGdlbMWQKzvcgAr9rF59gzttIy
	jXONQXqjCqmZb+u+8sNnSDDe5skaRKLMeyYQoUIIkcy6HJUOWKNlnI7ksYql+vlBiLdcgvzrogEv7
	PLBHtKCRmBsZXFFKy40faSAFGvnWPQTXnBnb+4Kvof8aib58IF1z6yOIjhq2BNvYszN69p1CBsYzr
	eXQX1glxoZF+RH85bDcvcAhFgnRWk+sCqNOQsRCfT+464eRQhiEpILP9h9pCqQUnd/Eo1HmscTBTL
	7RSQnrYdBIabM4vgGm5f8uMlKOKwx5/emEh6AH8Jjb46UsVtYJqp2q8LV8ZDgqVm/Dnl8V0SRwsQW
	gVUsPr4Q==;
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Vinod Koul <vkoul@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Andy Yan <andy.yan@rock-chips.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Emil Renner Berthing <kernel@esmil.dk>, Hal Feng <hal.feng@starfivetech.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
 Dominique Belhachemi <db@domibel.de>, Brian Masney <bmasney+clk@redhat.com>,
 Jerome Brunet <jbrunet+clk@baylibre.com>,
 Michal Wilczynski <m.wilczynski@samsung.com>
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-riscv@lists.infradead.org,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Maud Spierings <maud_spierings@murena.io>,
 Graham Markall <hello@big-grey.co.uk>,
 Icenowy Zheng <zhengxingda@iscas.ac.cn>,
 Chaoyi Chen <chaoyi.chen@rock-chips.com>,
 Joshua Peisach <jpeisach@ubuntu.com>,
 Uwe =?UTF-8?B?S2xlaW5lLUvDtm5pZw==?= <u.kleine-koenig@baylibre.com>,
 Michal Wilczynski <m.wilczynski@samsung.com>
Subject: Re: [PATCH v5 10/21] drm/bridge: inno-hdmi: Add .disable platform operation
Date: Wed, 30 Sep 2026 12:07:35 +0200
Message-ID: <14018012.nUPlyArG6x@diego>
In-Reply-To: <20260929-jh7110-clean-send-v5-10-82b4d8e3c6c7@samsung.com>
References: <20260929-jh7110-clean-send-v5-0-82b4d8e3c6c7@samsung.com>
 <CGME20260929103227eucas1p1a8ef8d6ebb77a6f2cca192e8bc0b4e1c@eucas1p1.samsung.com>
 <20260929-jh7110-clean-send-v5-10-82b4d8e3c6c7@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260930_030758_240611_665B7241 
X-CRM114-Status: UNSURE (   9.93  )
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

Am Dienstag, 29. September 2026, 12:31:07 Mitteleurop=C3=A4ische Sommerzeit=
 schrieb Michal Wilczynski:
> The Innosilicon HDMI driver supports platform-specific behavior through
> the `inno_hdmi_plat_ops`. While it provides an `.enable` hook for
> platform-specific power up sequences (like enabling PHYs), it lacks a
> corresponding hook for power down.
>=20
> This patch adds a new `.disable` op to the `inno_hdmi_plat_ops` struct
> and calls it at the beginning of `inno_hdmi_bridge_atomic_disable()`.
>=20
> This allows platform specific drivers, such as the StarFive JH7110,
> to implement their own power down sequence (e.g., calling
> phy_power_off() and clk_disable_unprepare()).
>=20
> Reviewed-by: Joshua Peisach <jpeisach@ubuntu.com>
> Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>

Reviewed-by: Heiko Stuebner <heiko@sntech.de>



