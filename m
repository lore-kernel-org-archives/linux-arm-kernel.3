Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34D88C35FF3
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Mar 2025 00:56:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:To:Cc:From:Subject:
	References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:Content-Type:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PK/l0ijj4Ul692FxQgyWzk2dUjCLEg6ALuFsUIjdFvI=; b=rcteGrkF6KM0EUj3/mI1D9910H
	W0SL5qGxMJ10aDAu0ZWSWJP+cpp7XeYavH7JO99apmyvHlSR/9dnXd6jCyQQ79NEuyZ4WBAsHyzjO
	2ZldG77oiovMaI3Fu3oqq+dz80ZJEkXNxMaEqYW7QOKgeKbo9szxp9Hf+AIaMe0kHfuW9MdYgX4y5
	VAIqLb+PwkLojYlWHz+UoXzH/0vS5oZfh1TrMXOsephximN6IoTN54vwU958V+dpauMo4DoljXnmH
	QN/8CBUSgM9h3orsFhiXb60KRGaiBGbapr2rrKR1xCQvIJ0asg8vOYG0ziv8uXi0o/wfVfsaQdcql
	VDG1G4IQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tstLl-0000000CqTx-0DOI;
	Fri, 14 Mar 2025 00:56:33 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tstK5-0000000CqJE-0E3R;
	Fri, 14 Mar 2025 00:54:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 1D9A0A478C3;
	Fri, 14 Mar 2025 00:49:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85E79C4CEDD;
	Fri, 14 Mar 2025 00:54:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741913687;
	bh=KCYIbCrQZwsu+PQS1yLr2L5sQDC2z1fQCiKH9QPI7NM=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=OC9Y0ae0Cm9jR/tBzJ0LsYm4QsrDgPchHMdCYc6mO9rTPaeTMwMmQ8RA9Ulkp9QXm
	 NNdRiuYmFtndrQ/QG6ntfLfctDLlhLFzNnDOkDXLsdeSqcsI6rRyAftdsLTeKuyjMD
	 lMHUKqY/pJxI1VvKg+48uWjZsVUx1TblZ9FvmaGw1ZfVP/BJFWI5pmeoghM8QLKLKw
	 5u9z6ZiNSV/5r8rEoMyd2MBk97ZARe1kRX/2VloV/bGaIn2kOUcu86ElI7pvpw0LD1
	 MA7MzgtxKhZow5SyK8PkxP8B6UPShhV8tf74CAVHawAvZKeKA6Y//3CtQqggaWsBe6
	 cew9Uuyz+VJVQ==
Message-ID: <843824c0ef2e4cfc5307931c9a8aba2f.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250312215923.275625-1-heiko@sntech.de>
References: <20250312215923.275625-1-heiko@sntech.de>
Subject: Re: [PATCH] dt-bindings: reset: fix double id on rk3562-cru reset ids
From: Stephen Boyd <sboyd@kernel.org>
Cc: robh@kernel.org, p.zabel@pengutronix.de, krzk+dt@kernel.org, conor+dt@kernel.org, kever.yang@rock-chips.com, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, kernel test robot <lkp@intel.com>
To: heiko@sntech.de, mturquette@baylibre.com
Date: Thu, 13 Mar 2025 17:54:45 -0700
User-Agent: alot/0.12.dev8+g17a99a841c4b
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250313_175449_153491_8C5CC121 
X-CRM114-Status: UNSURE (   7.62  )
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

Quoting Heiko Stuebner (2025-03-12 14:59:23)
> Id 173 was accidentially used two times for SRST_P_DDR_HWLP and
> SRST_P_DDR_PHY. This makes both resets ambiguous and also causes build
> warnings like:
>=20
> drivers/clk/rockchip/rst-rk3562.c:21:57: error: initialized field overwri=
tten [-Werror=3Doverride-init]
>    21 | #define RK3562_DDRCRU_RESET_OFFSET(id, reg, bit) [id] =3D (0x2000=
0*4 + reg * 16 + bit)
>       |                                                         ^
> drivers/clk/rockchip/rst-rk3562.c:266:9: note: in expansion of macro 'RK3=
562_DDRCRU_RESET_OFFSET'
>   266 |         RK3562_DDRCRU_RESET_OFFSET(SRST_P_DDR_PHY, 0, 8),
>       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
> drivers/clk/rockchip/rst-rk3562.c:21:57: note: (near initialization for '=
rk3562_register_offset[173]')
>    21 | #define RK3562_DDRCRU_RESET_OFFSET(id, reg, bit) [id] =3D (0x2000=
0*4 + reg * 16 + bit)
>       |                                                         ^
> drivers/clk/rockchip/rst-rk3562.c:266:9: note: in expansion of macro 'RK3=
562_DDRCRU_RESET_OFFSET'
>   266 |         RK3562_DDRCRU_RESET_OFFSET(SRST_P_DDR_PHY, 0, 8),
>       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
>=20
> To fix that issue give SRST_P_DDR_PHY a new and now unique id.
>=20
> Reported-by: Stephen Boyd <sboyd@kernel.org>
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202503121743.0zcDf6nE-lkp@i=
ntel.com/
> Fixes: dd113c4fefc8 ("dt-bindings: clock: Add RK3562 cru")
> Signed-off-by: Heiko Stuebner <heiko@sntech.de>
> ---

Applied to clk-next

