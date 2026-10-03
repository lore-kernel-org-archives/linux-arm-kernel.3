Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0874FCA5FEC
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  3 Oct 2026 15:06:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:From:
	To:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PLPFLfTkHiZ6Gx7z+NgvsssZ8RKOEn+Vn2kNApBR+go=; b=AWRdoF15KRzsg61OBOpK+FPcJ7
	t9uVZk7nyDHK44KnEx/RPrgXvOg4z8X4aV03GzxGl1NF814vpJO+MNJkPlj7lzbXtsCi8aFFm8EBI
	MhaxCS7qNJWrgmFHj5UZoE3+8ENthp7FNcDvsx3dVB7z/LdfdJI161MSc2nYqAQmQOM9XO6A3AmvQ
	+mq8Fh3A17NvEt8SfQvEns0vo925ZJsFYab+Z7oOoeXyIQ4M8z2990EuAn8PkxRW5vVcBBQekTXhU
	sa8Pd9RNiM0Jy53rEcxd7xlkZutz2MhJmsEPjF8Po9NSXSB6V3PRJGl51QQ6sYP9PqEqYQ/Li6U3X
	c/AwqJ+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xD1JC-0000000DfR2-0mMs;
	Sat, 03 Oct 2026 15:05:54 +0000
Received: from mail-10631.protonmail.ch ([79.135.106.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xD1J8-0000000DfQ9-0624
	for linux-arm-kernel@lists.infradead.org;
	Sat, 03 Oct 2026 15:05:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail2; t=1791039946; x=1791299146;
	bh=PLPFLfTkHiZ6Gx7z+NgvsssZ8RKOEn+Vn2kNApBR+go=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=I53wjgiRtN2Zf3E00/oDjZu7I2kKSi0fP0e0+WI6gyHeErOIjgfs1bX/mHGk6/cMT
	 cgCYI2EUCxtf0PgaQ2+7CRypNdK711PvqRpzXbiOP/eNl+OUlJOrbKwalkWWKuIQkP
	 2Hizt97LgqZo9TcMgbXXyJjVXIjjR+pT5t+8uV+tUcsgCxFNo5DKW69Zw8FfKY72jT
	 si0G4HuaXcVYRUBHN0nolP+U+VFmEKj72wWq5NnznNv/cVzZ2FwFItGzppDQ05q1QK
	 uRXYvcjTmfyRW816I24WGMubeKelUsoTp0nD6kQmfWZoI7kmNrKRDBMwFwMwzzGdxx
	 PF5832HmQ6pgQ==
Date: Sat, 03 Oct 2026 15:05:39 +0000
To: Junhui Liu <junhui.liu@pigmoral.tech>
From: Norman Herms <dockseed@proton.me>
Cc: wens@kernel.org, Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, Philipp Zabel <p.zabel@pengutronix.de>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Richard Cochran <richardcochran@gmail.com>, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, netdev@vger.kernel.org, Jerome Brunet <jbrunet@baylibre.com>, Enzo Adriano <enzo.adriano.code@gmail.com>, Andre Przywara <andre.przywara@arm.com>, Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, Yixun Lan <dlan@gentoo.org>
Subject: Re: [PATCH v5 0/8] clk: sunxi-ng: Add support for Allwinner A733 CCU and PRCM
Message-ID: <BZm0Br5_P98xkwslO2JLeCMSyqps8EfQzDnH1Ox34cpoxCpkznXDa4RUM40-b1WKuZ3w3Cy0LPBE31oL8T1nq1Z8iT9Z51wUJBRp3iQIn-Y=@proton.me>
In-Reply-To: <DLVA17A4RRG7.2ECQKV3SJDAGI@pigmoral.tech>
References: <20260930-a733-clk-v5-0-11175b41cd2d@pigmoral.tech> <CAGb2v66O7Ze=TiHO_5q=76QpU8ZXraFyV+HfO+_HpkTDr1U-nQ@mail.gmail.com> <DLVA17A4RRG7.2ECQKV3SJDAGI@pigmoral.tech>
Feedback-ID: 144388465:user:proton
X-Pm-Message-ID: 012ea9b791ccfacd729444e4ea18d26359c9bbc6
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261003_080551_403175_19430A83 
X-CRM114-Status: GOOD (  17.89  )
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

Hi Junhui,

> Thanks for pointing this out. This is indeed something I had not
> considered before. I will try enabling secure boot on my spare Cubie A7Z
> board and test it on actual hardware.

First a correction to my earlier reply in this thread. I answered
ChenYu's "presumably ... the secure/non-secure access bit isn't in
effect" with "yes" and quoted the UM note that these registers are
always non-secure in non-security mode. On our non-fused A7S boards
(SID + 0xA0 =3D 0, also when read from EL3) that does not hold for every
register. Read from EL3 with a test BL31, CCMU_SEC_SWITCH_REG is 0x7
after BL31's security setup, S_TWD_BGR_REG is 0x1 and the SPC status
registers are 0xffffffff, but from non-secure all of them read 0, and
non-secure writes to the first two do not stick. So secure filtering
is active on these parts even without the fuse.

> For the PLL and AHB/APB bus clock controls, the user manual indicates
> that the relevant security bits can be set by TF-A to allow the kernel
> to access these registers. This also appears to be how this has
> traditionally been handled on sunxi platforms. So I think we can do the
> same in TF-A for the A733.

That is what the BL31 on our boards does: PRCM_SEC_SWITCH_REG |=3D 0x7
and 0x7 to CCMU_SEC_SWITCH_REG at CCU + 0x1F00, as the vendor BL31
does. From EL3 both read 0 before and 0x7 after. The 0x1F00 versus
0x0F00 trap in the A733 TF-A port is in my first reply.

> For bus_r_twd_clk, I will test whether the register is indeed always
> secure. If it is, I think the clock can be removed from the kernel and
> left enabled by its hardware reset value or by the boot firmware.

On our non-fused boards it is already inaccessible from the non-secure
side (reads 0, writes ignored). From EL3 it reads 0x1, the UM default,
so the gate is open. Details are in my reply to ChenYu on patch 3/8,
which crossed with yours.

Same boards and caveats as before: AI agents (Claude) on my boards, a
report, not a Tested-by.

Thanks,
Norman

