Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F67ECA5FEC
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  3 Oct 2026 13:51:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:From:
	To:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5esmclXfINE7e+ODY2UVaCe/K20RlH/jvsbQt/jE3TQ=; b=GIow7SPGnATzJCYZbuL0hWP6fq
	qAQDfuzNm7arhXGkn7fm5KegWui/RX0nVvfP8TJmDuf63mMfsKF7w315C6ReBwoRwNOyk3gGVHB/m
	yrgIEHiwgo2BAhyxY3xT8PvL5F+j0cSoE5RPulZoh3EV0WXXt28VmDLDTuPz26xG6HFfIjDhAVmY/
	+GUHdKDlSEXt4GvXHnu2j4R5MEXpnLZEWr+/FdT+2vy8RkM0VJd1a2zbMSeva1X+HrM9VpdAG5XWf
	u3QVfnbh4o6teUUIZsh+CFY3gCW06UQb794ly7lXqW/Fq5FzhzcGLdvNzzqNVHAdZ+nifW9dlOGI1
	D6w2mO+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xD09F-0000000DYid-39Lj;
	Sat, 03 Oct 2026 13:51:33 +0000
Received: from mail-24425.protonmail.ch ([109.224.244.25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xD09C-0000000DYhr-2Uzt
	for linux-arm-kernel@lists.infradead.org;
	Sat, 03 Oct 2026 13:51:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail2; t=1791035486; x=1791294686;
	bh=5esmclXfINE7e+ODY2UVaCe/K20RlH/jvsbQt/jE3TQ=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=ZjSIQyda8igUn06fxq2rth+XbR79X+ksYhUDXpi6fBKb5icZwaMyzzGDIrl8TKXxm
	 Q+RUcr0eenHjfr5oFFKyVmC/BIsWHs3PAhskTuZoMNHuPOQ1DTQyIPgNEwBDvPhgTk
	 Y+GPG6LUn5Qs9x3LZBwwjHAWsaxEBoIYi5mGQ9RXAvmbWQOjy3LWICGCyaxof9N4a1
	 pIBZSsS1LdDLfa4zymq53v7+L1Jkukjb2Jcr16HCKK5UHOxOzB7Ywj+FR3adAkD6g2
	 kjTXeQOp2rUAxBPRv+kEqPM81AZVwdiZSf36ZyI5T7nwtO6dQrd7jP7lZHpj70VbH7
	 yX6zTypjGtSAA==
Date: Sat, 03 Oct 2026 13:51:18 +0000
To: wens@kernel.org
From: Norman Herms <dockseed@proton.me>
Cc: Junhui Liu <junhui.liu@pigmoral.tech>, Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, Philipp Zabel <p.zabel@pengutronix.de>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Richard Cochran <richardcochran@gmail.com>, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, netdev@vger.kernel.org, Jerome Brunet <jbrunet@baylibre.com>, Enzo Adriano <enzo.adriano.code@gmail.com>, Andre Przywara <andre.przywara@arm.com>, Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, Yixun Lan <dlan@gentoo.org>
Subject: Re: [PATCH v5 0/8] clk: sunxi-ng: Add support for Allwinner A733 CCU and PRCM
Message-ID: <12tBoL9q9y1pvorTf-okmf5LAEsMvGkkiicbETQ2NIW8_EPVPaWiMsfDxKLjl-_z7QVckUM_HzTS9eMgpTB0EZiSdiyQU6H5EeHT5KrDLr4=@proton.me>
In-Reply-To: <CAGb2v66O7Ze=TiHO_5q=76QpU8ZXraFyV+HfO+_HpkTDr1U-nQ@mail.gmail.com>
References: <20260930-a733-clk-v5-0-11175b41cd2d@pigmoral.tech> <CAGb2v66O7Ze=TiHO_5q=76QpU8ZXraFyV+HfO+_HpkTDr1U-nQ@mail.gmail.com>
Feedback-ID: 144388465:user:proton
X-Pm-Message-ID: 113b53f2b023b44b4ff4ec0d170cdfbd43559309
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261003_065131_265662_536F0FC1 
X-CRM114-Status: GOOD (  10.31  )
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

Hi ChenYu,

> And presumably things work now because the secure/non-secure access bit
> isn't in effect right now because you aren't using secure boot?

Yes, on our side. One data point from a single board type, Radxa Cubie
A7S, two boards. The measurements and this summary were done by AI
agents (Claude) working on my boards, so please read it as a report,
not as a Tested-by.

- Secure boot is not enabled on these boards: SID + 0xA0 (0x030060A0,
  SID_SECURE_MODE in the vendor boot0 sources; the UM does not describe
  the SID) reads 0 on both. The notes under PRCM_SEC_SWITCH_REG (UM
  V1.00 4.2.5.26) say these registers are always non-secure when the
  system is in non-security mode.

- The vendor BL31 blob in Radxa's u-boot package (v2.5) opens the
  switches at boot: PRCM_SEC_SWITCH_REG |=3D 0x7, then 0x7 to
  CCMU_SEC_SWITCH_REG at 0x02003F00. TF-A's sunxi_security_setup()
  does the same for the H6/H616.

- On the A733, CCMU_SEC_SWITCH_REG is at CCU + 0x1F00 (UM 4.1.6.278),
  not 0x0F00 as on the H6/H616; here 0x0F00 is SPI0_CLK_REG (UM
  4.1.6.160). The A733 TF-A port at github.com/dlan17/trusted-firmware-a
  (branch A733, f4c0b0dba, the commit Radxa's package pins) still uses
  0x0F00. On one of our boards the 0x7 ended up in SPI0_CLK_REG until
  we moved it to 0x1F00.

- TWD: UM 4.2.5.9 marks S_TWD_BGR_REG as fixed secure. We have not
  measured it.

Boot chain on these boards: vendor boot0 (DRAM init), U-Boot SPL and
U-Boot from Radxa's A733 tree with a few board patches, TF-A
lts-v2.12.15 with the A733 port above plus our fixes.

Thanks,
Norman

