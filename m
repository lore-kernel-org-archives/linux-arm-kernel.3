Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16D39C5DF81
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 23 Aug 2026 15:47:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Date:Subject:From:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=7a5/dX47J5QKh3B16JurxcwsSOf53xn+McRrB8Lj/oY=; b=MY7vfFXL4IbF74
	l4lKz0k3hYwj4oHvAJmLZDAaLLKmyKM1BqZxQ0nb1XjfEIaQVCNvr/hKOOH6ogjDWxNUmQRbTFY3/
	GuTv2UmRsaAgpIEysWdEwJGFYETyavUD5lS6LDKP9su1HJq7cQttNf8XFdeAoNz6AJokyHa4Rs2PE
	86USkbME2O+A2xYNYI4boYi8A2zPtchruNRU+h7hB7vK84qu50llP1yhV3uA/NWQvjs5b9WYFvv16
	iOgio9jS0X2PdbU1Y9LFn6of/cRQjmb/+sBOD4YR+euVxwgX2SohAW+OPCc/Ito4qExlwomXbv8Tw
	gTzPHqphcVvtSFPGAW2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyAQ5-0000000FSbW-3Maw;
	Sun, 23 Aug 2026 15:47:37 +0000
Received: from xmbghk7.mail.qq.com ([43.163.128.44])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyAQ2-0000000FSaI-1n3D;
	Sun, 23 Aug 2026 15:47:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1787500041; bh=7a5/dX47J5QKh3B16JurxcwsSOf53xn+McRrB8Lj/oY=;
	h=From:Subject:Date:To:Cc;
	b=B72mqi87Xh6INs8qeIr5aVcziMoLcBem7zV+mdzv/95ghmllEtYN0aHwRf+g/vCk8
	 k1/0y0IdDObNhg4Wd7jaCnCMI5wbbgX4UCFTTZ2J3j95SE+WP8WJJlwAtVaBIYLaQk
	 I17g9swtoXRV3KAQQ2h/SoC8jL07a2Jr74SCq7a0=
Received: from ubuntu2204.localdomain ([2409:8d20:2b:671:9e54:40ff:fe02:3f0f])
	by newxmesmtplogicsvrszb51-1.qq.com (NewEsmtp) with SMTP
	id BD29E410; Sun, 23 Aug 2026 23:47:18 +0800
X-QQ-mid: xmsmtpt1787500038thq5dia1r
Message-ID: <tencent_16321809632326015A886B7E7C4D91347808@qq.com>
X-QQ-XMAILINFO: MllZffuBkEb5U7YrK567bc0VsgX46AB58XJqzNRRiGHHOYsO//d3+gf9qelMDo
	 b0PZwEZWi44wjg+wvrs8KQdekQ9mtVYNYM+07BzBzBsxF2DR42aGug/RIk+mHfRsB26zodzDmyrd
	 9O2ye7ldd67O4w464hEGpDtpb907FLjAF0O86beyv+QnoRN0QBdHMQ9pGmpzYQW1ae7QmHM8xe2i
	 aiqx/OIWA/Xq+7jniKc26rxz8qqOlDSuBI/1hGwhndynqAySM76wxQ3GPBYiW3mCmBYSPFYewgMo
	 CYukYBDXb236WoDhwNa2cQCVTXsD6Y/nxmPuhJGo/ChxH8pLxbeKrEldXE4pjn4zO0sVt6TTKwp0
	 9IIiYwx5kYWg3LyHn6IhXlVS/Gp2TiurXzNmjXylGsELDbWf75v315s2dWF+RV1Oalf29xU1G6fL
	 M0hvaE9mlzPFWCS9X3OB7+Mxc1T23RkebTqecAI7ckKvkGhGObb89jFrwMOnqdh9cj9kIf+GfODM
	 7yrGVpdnQFIe20vJdS7OIHDfPwvkKpl7Cl8ZIuQpUDcC1uhw5+H5ZM/X4N+P/+K4usng5ajVgahS
	 3aAiDZMrSOu/BjcrSbYPPw6hyE8LVdE5M690FutP+bNrThAw+wxzK3wpIZcqKa3DgaaRxa7ZSBmL
	 g5Ml3lR32DUHLyXwJic+0kUGY6VFszICAvlX4mN7YH2SkQe1bp3nEFVtyfTA8Vx4/H1+tjp+OtPG
	 +SodLFqv5aYtt7rKqPIVkVh+4ZvfN7MNMB4oUircCpiET2HOLA3i/i59b27wCYc606sp7UkstYDr
	 4GrNZa1tRRwJ4sdjZ1RptQtXit7dEi0N5AVyAUXQLZyL5u3oYtpzNYfW0Y12EzrPvRX0PrqZv6pt
	 /DkqUwJdmHWqBLfwNfYtayJYrKXGsK6Q4BTokituNhdcnqvSM6GQLkn+hvm1UCMX6hqLzWe5e45O
	 L9aYV6qDVrolHYuclMpk9ZzT0xvyFyr0mm3RwxBVDiD55PiFbZ71kbk8CuChIRN8zFa9csLuNXW1
	 DMTvAH3M0Ki8NwmtPKyhqF8jlciZEjcEPh/UVxdWnNJz6W9GeMbNTZhYQT3W6a1p+ixmfnjDXp7I
	 be8mJLBaf6hg4VfLkburysUTgDOhUy9WJ/vrEIxYWhJp/QW+duFMJPuFe1EGZIwxV2499GJgVKVW
	 KSRctDZA/GveMaqB8Cz5Ax3u/l
X-QQ-XMRINFO: Nq+8W0+stu50tPAe92KXseR0ZZmBTk3gLg==
From: Cunhao Lu <1579567540@qq.com>
Subject: [PATCH 0/2] arm64: dts: rockchip: Add LubanCat 5IO board
Date: Sun, 23 Aug 2026 23:46:52 +0800
X-OQ-MSGID: <20260823-add-lubancat-5io-v1-0-e6b7894e8c60@qq.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOwVi2oC/yXMQQqDMBBA0avIrDsQU0yDV5EuJsmoUyRKoqUg3
 r1Rl2/x/w6Zk3CGttoh8VeyzLGgflTgR4oDo4Ri0EobZfUTKQScNkfR04qNzKhU7xvD1jG9oGR
 L4l5+17J7386b+7Bfzw8cxx/VZcg0dAAAAA==
X-Change-ID: 20260823-add-lubancat-5io-00fc56e8bea7
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Cunhao Lu <1579567540@qq.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260823_084734_959918_92D59CFE 
X-CRM114-Status: UNSURE (   9.08  )
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

This series adds dt-bindings and initial device tree for the LubanCat 5IO.

The EmbedFire LubanCat 5 is an RK3588-based BTB core board. The LubanCat
5IO is its carrier board.

The following features were tested:
- eMMC and microSD storage
- 2x RTL8211F Gigabit Ethernet
- 2x HDMI output and 1x HDMI input
- 1x M.2 M-Key slot with Intel 760P
- 1x M.2 E-Key slot with Intel AX210
- 1x Mini PCIe slot with Quectel EC200A (4G modem via USB2.0)
- 2x CAN-FD interfaces (CAN1 and CAN2)
- 2x UARTs (UART4 and UART7)
- 4x USB Type-A ports
- 1x USB 3.0 Type-C port with DisplayPort Alt Mode
- HYM8563 RTC
- PWM-controlled fan

This series requires the following patch to provide the RK3588 CAN-FD
controller nodes:
  [PATCH v6 3/4] arm64: dts: rockchip: add CAN-FD nodes for RK3588
  https://lore.kernel.org/linux-can/tencent_95532630016C2421000111DBAFADA99A8605@qq.com/

Signed-off-by: Cunhao Lu <1579567540@qq.com>
---
Cunhao Lu (2):
      dt-bindings: arm: rockchip: Add LubanCat 5IO board
      arm64: dts: rockchip: Add LubanCat 5IO board

 .../devicetree/bindings/arm/rockchip.yaml          |    7 +
 arch/arm64/boot/dts/rockchip/Makefile              |    1 +
 .../boot/dts/rockchip/rk3588-lubancat-5-btb.dtsi   |  548 ++++++++++
 .../boot/dts/rockchip/rk3588-lubancat-5io.dts      | 1062 ++++++++++++++++++++
 4 files changed, 1618 insertions(+)
---
base-commit: 2709dd5ae32f0828f386327c76bba9f39f63a1c6
change-id: 20260823-add-lubancat-5io-00fc56e8bea7

Best regards,
--  
Cunhao Lu <1579567540@qq.com>


