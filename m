Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 042ECCA5FFF
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Oct 2026 03:35:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:From:
	Subject:Cc:To:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7EEv66TfkkqDC0vBD6k5R4XJT1WUveDu+xqFWjFMwS8=; b=zsjyytS/ewDcqglGR1Qv7vv4X+
	TJ6EIYRuqPxH4ihx8ZRb75oXO36Y/1wjU0bQhizHhTU+xr48wNLfPct6lLrXF5QTGYhsviQ6Xwf0E
	cVFn56R+mOCVDDJ3HTEpRVEh+syA9aqFAel9BYG/6gKK1/ReZbdY7Wa/LhvJ7xs4P+25MUo1Syeoa
	LIXE/LT5+A35cbM1iHjchfoW0mxyFLkVm+6nhCQCM2jNlxobZzjX8iL3y3rnyT8K4VuKUgTOc/efO
	drNz0fi8JzLiP2T7S4YTrW79znsUSh91lDSR8thLAw0mBBqsvEgqxZdettxqQZi/U2i2rLbPZ2Lge
	HUO3JwhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEIRF-00000001fyD-2wpU;
	Wed, 07 Oct 2026 03:35:29 +0000
Received: from sender6-op-o12.zoho.com ([165.173.180.12])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEIRC-00000001fxp-2TqK;
	Wed, 07 Oct 2026 03:35:28 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1791344101; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=EMt2HxZjGxKqN3KMja356Ejlm4RJ3ba7GuoEX6EUHQ11KKvVi/AlTLXrVwZkxPQFoHXC2LwGWUjI5cwh53QZConfu700rGSNok0yINxejDfgC4WPDw5S0pJqMo6zSdJiN0CpO7ReMGrXY/KVAefrmvMEFgrCdz1MsMrReBIMc90=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1791344101; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=7EEv66TfkkqDC0vBD6k5R4XJT1WUveDu+xqFWjFMwS8=; 
	b=l09IKvPiFoQMX2AX3F1fOIWVtTXZREcVQyzldMWz0+tZ8xOSQYyblRiDWkWmxg4EZ5zBLoXBv3b9B0s6Z0q2Fny0MWidmzBKZsDWz4s/sdjCyBYR5a6VNIQn40ecbW82JoQ9oCDbnNvyOF0d5ymxtqwYHoXTK3mqdQn+11WsUOo=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=pigmoral.tech;
	spf=pass  smtp.mailfrom=junhui.liu@pigmoral.tech;
	dmarc=pass header.from=<junhui.liu@pigmoral.tech>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1791344101;
	s=zmail; d=pigmoral.tech; i=junhui.liu@pigmoral.tech;
	h=Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Date:Message-Id:Message-Id:To:To:Cc:Cc:Subject:Subject:From:From:In-Reply-To:Reply-To;
	bh=7EEv66TfkkqDC0vBD6k5R4XJT1WUveDu+xqFWjFMwS8=;
	b=ngjjKCMToI6FGmexYDJ/b1KiQmPlOSMsEgTrZ1Bj27Cu5QVcCjFprimUKNkf1sYU
	A5Bksc5nvWbdRiJ5nUGNCEssIHzFQgZ9YVyrNw6nk+G1S4Q6xuauG+CvM6kkgkftsNq
	RzjUMpRmbx+tDp0XBw4HCwVTxhtGOhNEnUh06Anw=
Received: by smtp.zohomail.com with SMTPS id 1791344099855931.7368458013717;
	Tue, 6 Oct 2026 20:34:59 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 07 Oct 2026 11:34:49 +0800
Message-Id: <DLYAHDTH3129.3AYF0OSHL8RJ8@pigmoral.tech>
To: "Vinicius Pedrosa" <vinicius.eduardo.pedrosa@gmail.com>, "Junhui Liu"
 <junhui.liu@pigmoral.tech>, "Stephen Boyd" <sboyd@kernel.org>, "Brian
 Masney" <bmasney+clk@redhat.com>, "Jerome Brunet"
 <jbrunet+clk@baylibre.com>, "Rob Herring" <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>,
 "Chen-Yu Tsai" <wens@kernel.org>, "Jernej Skrabec"
 <jernej.skrabec@gmail.com>, "Samuel Holland" <samuel@sholland.org>,
 "Philipp Zabel" <p.zabel@pengutronix.de>, "Paul Walmsley" <pjw@kernel.org>,
 "Palmer Dabbelt" <palmer@dabbelt.com>, "Albert Ou" <aou@eecs.berkeley.edu>,
 "Alexandre Ghiti" <alex@ghiti.fr>, "Richard Cochran"
 <richardcochran@gmail.com>
Cc: <linux-clk@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-sunxi@lists.linux.dev>,
 <linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
 <netdev@vger.kernel.org>, "Jerome Brunet" <jbrunet@baylibre.com>, "Enzo
 Adriano" <enzo.adriano.code@gmail.com>, "Andre Przywara"
 <andre.przywara@arm.com>, "Norman Herms" <dockseed@proton.me>
Subject: Re: [PATCH v5 3/8] clk: sunxi-ng: a733: Add PRCM CCU
From: "Junhui Liu" <junhui.liu@pigmoral.tech>
X-Mailer: aerc 0.22.0
References: <20260930-a733-clk-v5-0-11175b41cd2d@pigmoral.tech>
 <20260930-a733-clk-v5-3-11175b41cd2d@pigmoral.tech>
 <20261005183038.417798-1-vinicius.eduardo.pedrosa@gmail.com>
In-Reply-To: <20261005183038.417798-1-vinicius.eduardo.pedrosa@gmail.com>
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261006_203527_079458_891ED8F7 
X-CRM114-Status: GOOD (  17.64  )
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

Hi Vinicius,

Thanks for testing.

On Tue Oct 6, 2026 at 2:30 AM CST, Vinicius Pedrosa wrote:
> Hi Junhui,
>
> On Wed Sep 30, 2026 at 1:26 AM CST, Junhui Liu wrote:
>> +static SUNXI_CCU_GATE_HW(bus_r_msgbox_clk, "bus-r-msgbox", &r_ahb_clk.c=
ommon.hw, 0x17c, BIT(0), 0);
>
> [...]
>
>> +static SUNXI_CCU_GATE_HW(bus_r_riscv_clk, "bus-r-riscv", &r_apb0_clk.co=
mmon.hw,
>> +			 0x21c, BIT(0), 0);
>
> I'm bringing up mainline on a Radxa Cubie A7Z (PCB V1.11, 1 GiB). With
> 7.3-rc6, this series and a local common-DT integration, PSCI reboot and
> power-off hang once unused clocks are disabled. The boot chain uses
> vendor boot0/BL31 and source-built SCP/U-Boot.
>
> Keeping both of these gates enabled fixes reboot; either alone still
> hangs. With only these two marked CLK_IS_CRITICAL, reboot returns to
> boot0 and power-off drops DCDC1 from 3.3 V to 0.7 V and turns off the
> green LED with power still connected. I haven't checked whether each
> gate is needed for power-off on its own.
>
> My guess is that BL31 talks to the SCP for these, but I haven't traced
> it, and it may be specific to the vendor firmware.

Yes, it appears that the vendor SCP firmware runs on the E902 core
instead of the ARISC OR100 core on the A733. Disabling either
bus-r-riscv or bus-r-msgbox breaks the SCPI communication path between
TF-A and the SCP firmware.

>
> Would it make sense to mark them CLK_IS_CRITICAL, like bus-r-cpucfg
> already is? I can test the next revision on this board either way.

Mainline TF-A uses native PSCI for reboot and power-off on the NCAT2
family. Even if Crust is ported to the A733 in the future, I would
expect it to run on the ARISC OR100 core rather than the E902 core.

(Also see discussion in [1].)

The E902 may also be supported by the Linux remoteproc and mailbox
drivers in the future. In that case, bus-r-riscv and bus-r-msgbox
should be managed by their respective drivers instead of being kept
enabled globally.

I don't know if marking these clocks as CLK_IS_CRITICAL just for the
vendor SCP firmware is a good idea...

[1] https://lore.kernel.org/linux-sunxi/556cd32394062960a3ea4af0011155cfa83=
ae91f.camel@d-silva.org/T/#u

>
> Thanks,
> Vinicius

--=20
Best regards,
Junhui Liu

