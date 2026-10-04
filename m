Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13900CA5FE6
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  4 Oct 2026 11:04:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4+5J5Wk0O+uOTKnZfw9tvqFIpDGg/5JIdr6gLxye25A=; b=MpSP70EO/Am+H/
	j+pgYNU0slfZjNLA6w3RF03euGNu4TmmhRrpQFgxD5u32FCxmIADp0F4YeqhTTag56H0bCgfeW1i0
	IMkUAbQzsbbL9zxbHaoi2kIbrwxHzZWTNHWPxCxh6tRsGjicxutqWrkfqTNcb6zAMNGA2MjbfWXfa
	apa27kbqu8d3hSLfsHZX6lenqXS6Jsiycch639F2IGVDw4z2rEjVujN/cIvcda7oxT4ol7oyurrR/
	8tl8kNwgbIzFbRQrOphR7YE2EujhH+2y/3Izou7nQv4LTC0+et4RaoSORBOJSiaKbmvxdig80GYD7
	cgyMlM+LY59YenZkuvAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDK14-0000000EhO8-3GM2;
	Sun, 04 Oct 2026 11:04:26 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDK12-0000000EhM6-1z4a
	for linux-arm-kernel@lists.infradead.org;
	Sun, 04 Oct 2026 11:04:24 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 02137412AD
	for <linux-arm-kernel@lists.infradead.org>; Sun,  4 Oct 2026 11:04:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA3DD1F00898
	for <linux-arm-kernel@lists.infradead.org>; Sun,  4 Oct 2026 11:04:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791111863;
	bh=4+5J5Wk0O+uOTKnZfw9tvqFIpDGg/5JIdr6gLxye25A=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc;
	b=SBx0WO9CxzsArV8P/z64gCOTXQshWfg8Uror7eEDwZdi5aZTCJBQL8qoqrANfEksk
	 mvFOanfmnyco6OyowlaaJ6TrfOtYf6kn93SwgffFfhiHzHcnwssPbFTsfct/AKoqC9
	 /tGCWkevB7fcn9D5aV3ifilhLKt6YnxujLcPJDxbNW9G5cugUjaMIZ6GMLhGATypyK
	 iqGteZb4k/JHXCi9yls6xnv3sDbCdjVeFone4PeJRkjLI5DJ6X00Ch4zN76r6Brsmi
	 YV7SIyDgrEUfkX5W1HMPNv2zitYX60sI+FIRCZx2k5woXVy6UjQwwXaNCRteDbNw+H
	 nP4vpqJV7v6vw==
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-3a75f960be3so12273141fa.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 04 Oct 2026 04:04:23 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxblWv0MPiyAC3KyQrc50g46KBq3xAiEuJBM8+FG0LybaZ2CxvvcnaYbSfzUgTK3jZbkfTazFwzqT0mut6tDK3t@lists.infradead.org
X-Gm-Message-State: AFq9FYKSW4JblZdtFlYo6hro+luaxtBjLuw+q8oNOfr7Sd+b0LfhoA3p
	glsFr9S7RSLpoiDU6saO9sZOA/43zimzk8ObOM4zaZGlbsyBocsWONSoBD7P7z6rKYQX0VCtNRO
	nMe5y29DXTLYRFESHgnTf75AQmtCKSlA=
X-Received: by 2002:a2e:b8c8:0:b0:3a9:82c2:ec1e with SMTP id
 38308e7fff4ca-3a982c2ed98mr3375891fa.15.1791111861878; Sun, 04 Oct 2026
 04:04:21 -0700 (PDT)
MIME-Version: 1.0
References: <20260930-a733-clk-v5-0-11175b41cd2d@pigmoral.tech> <20260930-a733-clk-v5-8-11175b41cd2d@pigmoral.tech>
In-Reply-To: <20260930-a733-clk-v5-8-11175b41cd2d@pigmoral.tech>
From: Chen-Yu Tsai <wens@kernel.org>
Date: Sun, 4 Oct 2026 13:04:09 +0200
X-Gmail-Original-Message-ID: <CAGb2v653CS4jFNAo+p=-_7wspObh=Cd=pUaSnPA1vu1hegsAOg@mail.gmail.com>
X-Gm-Features: AclHuK_0n2_x4qIGHT4NpCYNH-L_cZ0FJ47BSqio0LkXDY9BAqYTPBXGwXZuSXo
Message-ID: <CAGb2v653CS4jFNAo+p=-_7wspObh=Cd=pUaSnPA1vu1hegsAOg@mail.gmail.com>
Subject: Re: [PATCH v5 8/8] clk: sunxi-ng: a733: Add reset lines
To: Junhui Liu <junhui.liu@pigmoral.tech>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Richard Cochran <richardcochran@gmail.com>, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, netdev@vger.kernel.org, 
	Jerome Brunet <jbrunet@baylibre.com>, Enzo Adriano <enzo.adriano.code@gmail.com>, 
	Andre Przywara <andre.przywara@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Reply-To: wens@kernel.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Tue, Sep 29, 2026 at 7:28=E2=80=AFPM Junhui Liu <junhui.liu@pigmoral.tec=
h> wrote:
>
> Add the reset lines for the Allwinner A733 SoC. These reset control bits
> are integrated into the Bus Gate Reset (BGR) registers, typically
> sharing the same register address with their corresponding bus clock
> gates. Integrate them into the main CCU driver using the existing
> sunxi-ng ccu_reset framework, allowing the CCU to also function as a
> reset controller for the SoC.
>
> Tested-by: Jerome Brunet <jbrunet@baylibre.com>
> Reviewed-by: Andre Przywara <andre.przywara@arm.com>
> Signed-off-by: Junhui Liu <junhui.liu@pigmoral.tech>

Reviewed-by: Chen-Yu Tsai <wens@kernel.org>

