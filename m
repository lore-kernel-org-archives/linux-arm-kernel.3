Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4761109E542
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Mar 2026 03:10:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:Date:Cc:To:From:Subject:Message-ID:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=zeUGGTYgyK94YprNuLur3t1PD0YGNWfrDQg8S912Lhw=; b=CoJG15KhTuGU2qBU7UMTgWTdyw
	yuondJuCCLh9IznV7iZItJWqR0IM6+itjEoktG93+kFJyIGJAIHqp+/UVAp0rwcsD9s/WlPExkUEc
	CeMbm7qkwfBXZbx/Rv3b1D3ydjvTtZ8SNC2GoRGoZTXNokE0yAp9yRm2nEiNjMKZdX0uV7wLLG+k2
	jGFOkpdusoEfc/we7iSHJogGrOGEpQvN5QxfnYi4qobam7SRee4sC6wKDvNERVACOkTwf1V+t+fAe
	Nvk4BEB41NAnESpCQ+7109jMx9hKPYATLxQnocfGVCWdG1nfQjmb7KbyHpf6mULo4VFmcki9rdW4m
	AsAGCM7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5b6c-00000004bvK-0s5Q;
	Thu, 26 Mar 2026 03:09:58 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5b6Z-00000004buv-3FgR
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Mar 2026 03:09:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1774494593;
	bh=zeUGGTYgyK94YprNuLur3t1PD0YGNWfrDQg8S912Lhw=;
	h=Subject:From:To:Cc:Date;
	b=h9tzlO7HVgpr7TKHSJj2CHl/BXQSp9jqI2Idzj2KXDfaP9GRr3XW/JDYKM0u5cwD/
	 rAA0ZCHXMqJykP5jihSrlPCB+p2DRCPC2is/7Nt3BEEEiG8iaNUhw0VzzhQUb+ybuL
	 YgrBjRkV3afc/awiiW+4sMx4JNX+oy44V0aHCI6f0cjMDjzbge+L+hymQFLVRASKX1
	 tjbspCnVMe5sjoc4ax7V7pDunlpEiV1mJ1uDDs8n5xIfThKsMYqfpJrU3JJVQ2i/Uf
	 l+D3SScdqg9BWOnhEfN5usNLs3nxOjJNn3OVJOdUYt2p/iKeWTWc8Hbs4hvgCcTZX0
	 TXl6HbAEMfkZA==
Received: from [192.168.68.115] (unknown [180.150.112.60])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 5929E645CA;
	Thu, 26 Mar 2026 11:09:53 +0800 (AWST)
Message-ID: <df8ef5ea7b9e254658934c18de20fd9805a82d74.camel@codeconstruct.com.au>
Subject: [GIT PULL] aspeed: first batch of devicetree changes for v7.1
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: soc <soc@lists.linux.dev>
Cc: linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org, Joel Stanley <joel@jms.id.au>
Date: Thu, 26 Mar 2026 13:39:52 +1030
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260325_200956_011549_E3182C44 
X-CRM114-Status: UNSURE (   5.90  )
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

Hello SoC maintainers,

Here's the first batch of ASPEED devicetree changes for v7.1.

Please pull.

Cheers,

Andrew

The following changes since commit 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f=
:

  Linux 7.0-rc1 (2026-02-22 13:18:59 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/bmc/linux.git tags/aspeed=
-7.1-devicetree-0

for you to fetch changes up to 76b4ec8efdc3887cdbf730da2e55881fc1a18770:

  ARM: dts: aspeed: anacapa: Add retimer EEPROMs (2026-02-23 12:02:22 +1030=
)

----------------------------------------------------------------
aspeed: first batch of devicetree changes for v7.1

New platforms:

- Asus Kommando IPMI card
- Asrock Paul IPMI card

Updated platforms:

- Anacapa (Meta): NFC and EEPROMs
- MSX4 (Nvidia): 128M layout for the alternate boot flash

----------------------------------------------------------------
Anirudh Srinivasan (4):
      dt-bindings: arm: aspeed: Add Asus Kommando IPMI card
      ARM: dts: aspeed: Add Asus Kommando IPMI card
      dt-bindings: arm: aspeed: Add Asrock Paul IPMI card
      ARM: dts: aspeed: Add Asrock Paul IPMI card

Carl Lee (1):
      ARM: dts: aspeed: anacapa: add NFC device

Dirk Chen (1):
      ARM: dts: aspeed: anacapa: Add retimer EEPROMs

Marc Olberding (1):
      ARM: dts: aspeed: Add 128M alt flash layout to NVIDIA MSX4

 Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml        |   2 ++
 arch/arm/boot/dts/aspeed/Makefile                               |   2 ++
 arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-paul-ipmi-card.dts   | 131 ++++=
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++=
++++++++
 arch/arm/boot/dts/aspeed/aspeed-bmc-asus-kommando-ipmi-card.dts | 117 ++++=
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa.dts        |  22 ++++=
+++++++++++
 arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-msx4-bmc.dts         |   1 +
 arch/arm/boot/dts/aspeed/openbmc-flash-layout-128-alt.dtsi      |  32 ++++=
++++++++++++++++++
 7 files changed, 307 insertions(+)
 create mode 100644 arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-paul-ipmi-ca=
rd.dts
 create mode 100644 arch/arm/boot/dts/aspeed/aspeed-bmc-asus-kommando-ipmi-=
card.dts
 create mode 100644 arch/arm/boot/dts/aspeed/openbmc-flash-layout-128-alt.d=
tsi


