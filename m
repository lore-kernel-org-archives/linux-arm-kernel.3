Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 731FDC0219C
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Feb 2025 10:26:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dG6q0eUvla25R2FN1Jt5744C+rNB8H4vL7BzPhRVw7I=; b=FUx3oFQKGnp2RXAfhliysZf1pv
	Uw+S1v7oGbCd5zYVtiIZaAC6iGKrzs7CpWUw5sF+G5Pamj3v0bnIzv0zJFn2qRCJp3dP8/UpkY9gT
	p4eCnhgJ8eBjuUusvVYqefevzNwM1GVohLIQxmrgA0SL0dI4KJbS8mpb6Yw919UTOeJ/WkOi51zbd
	CZxf39xQ2kPNkmPFO1Q1ZiQj920cwtR8vAsTGxQ5c5Wrhwo1ETF2xXvfTdrrCVbr/NWDSe9tAWHmO
	CwHlvVqkUdwdHxmujgZfy45WdoJ1kLwhI6JfeGCp3rV1kLGtOVEMszlh614FXFIbVDI01l/7PxpKw
	92J7EQ/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgLYh-00000009C6j-0XYU;
	Fri, 07 Feb 2025 10:26:03 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgLXJ-00000009Btx-1lKT;
	Fri, 07 Feb 2025 10:24:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=dG6q0eUvla25R2FN1Jt5744C+rNB8H4vL7BzPhRVw7I=; b=MQxr0Ge02yi1anyweNjp+NJip3
	3nVH1uovjLmlZ/gZe3oJ2HvpBY1jQG3NNHL6LLCrsaF23RUIraLIvQQXPtioryDs6/fK3MOzX7neN
	FOSPOVYmbdDfavI867F2i56PdPt5vkrrewQnsAbquB5+BC4HQhXHLoIBh1/j5C7gcZyhTz1VoExNx
	6fh6JTajV8FU6e0CBq7D+NDZWxvx4kIcOp4lFG1LkMWD1d1h4KuDLHU49vW0WtJHOohA1S4SX82Mz
	I0AdlAS4/PHvZnuIiegSHoYyenVQuzdpeN+jtu2tMJymaWI+eC+diWxdVhoYjCL9uLHwFim3dxFs8
	vrCqjECQ==;
Received: from i53875bc0.versanet.de ([83.135.91.192] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1tgLWX-0004HP-Ru; Fri, 07 Feb 2025 11:23:49 +0100
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: linux-kernel@vger.kernel.org, Quentin Schulz <quentin.schulz@cherry.de>,
 Detlev Casanova <detlev.casanova@collabora.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Alexey Charkov <alchark@gmail.com>,
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
 Dragan Simic <dsimic@manjaro.org>, Jianfeng Liu <liujianfeng1994@gmail.com>,
 Niklas Cassel <cassel@kernel.org>, FUKAUMI Naoki <naoki@radxa.com>,
 Kever Yang <kever.yang@rock-chips.com>, Johan Jonker <jbx6244@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Algea Cao <algea.cao@rock-chips.com>, Chen-Yu Tsai <wens@csie.org>,
 Sugar Zhang <sugar.zhang@rock-chips.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 dri-devel@lists.freedesktop.org, kernel@collabora.com
Subject: Re: [PATCH v5 2/3] arm64: dts: rockchip: Add HDMI0 audio output for rk3588
 SoC
Date: Fri, 07 Feb 2025 11:23:48 +0100
Message-ID: <11286959.nUPlyArG6x@diego>
In-Reply-To: <2781606.mvXUDI8C0e@earth>
References: <20250203171925.126309-1-detlev.casanova@collabora.com>
 <bfe9cb98-12ba-484c-95af-e5842edaab76@cherry.de> <2781606.mvXUDI8C0e@earth>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250207_022437_478108_1144080A 
X-CRM114-Status: GOOD (  19.18  )
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

Hi Detlev,

Am Donnerstag, 6. Februar 2025, 18:17:51 MEZ schrieb Detlev Casanova:
> On Tuesday, 4 February 2025 05:14:37 EST Quentin Schulz wrote:
> > This is an address/bus-less device, so I believe it needs to be put
> > among other address/bus-less devices, which for Rockchip SoCs is at the
> > top of the DT? c.f.
> > https://www.kernel.org/doc/html/latest/devicetree/bindings/dts-coding-style.
> > html
> > 
> > **I** would put it between the firmware and the pmu-a55 nodes.
> 
> I wasn't sure about this. It makes sense to move it with address-less devices, 
> but the rk3399 device tree has it above the hdmi node, so I wanted to stay 
> consistent with that.

the general "rule" is to
- sort by address (the part after the @)
- if that's not present, alphabetically by node-name (not phandle)
  and have address-less things more to the top
- &phandle {} references are sorted alphabetically

And yes in the past there were more creative variants ... like keeping
hdmi-stuff together sounds really great [also to me in the past ;-) ],
but then you end up with a huge list of exceptions.  [0]

So just following the generic sorting thing causes way less confusion,
hence we go that way for new stuff.


Heiko



