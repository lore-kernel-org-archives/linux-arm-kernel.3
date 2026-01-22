Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2A43D3EE6A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Jan 2026 14:12:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N1c2ulb4XZV93JtF6QiBkHh80gbkCl7xW5ML51pLQ1Y=; b=WbxmyHJQwoINQABRDAVQV2Kf4F
	xRXQC8rWB/OZzMBI4Xg3Ohtu7S274cR3Jaj+1ow7rg7eQL/AhsB3CRZQuXbu7t33je/mMraisUlAm
	+ACAG5y9WotjzED70FfgrbMz5FZkQPNl35lys9Mwt7DHBzuzEWLk1rMkN3lHZZPopDiDDU2E8BkHC
	OWcOlBLSYaaYBbf1Q4B38CoZ9GblTEK9JMqrYSda5Xtpnmg3cxm4cHq+/HIlAc21Rh4xTLZv6q4Zt
	tXB6x0FAH2lAAVbZVjVfdEUzAimJEbvC+5YAkyWkY2condbYV6f3jKOKOMtyipstdUbM8DHQJIfbh
	qYtZoNKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vivQP-00000007D2v-3lzD;
	Thu, 22 Jan 2026 14:12:41 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vivQO-00000007D2m-2HvZ;
	Thu, 22 Jan 2026 14:12:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 9720C60053;
	Thu, 22 Jan 2026 14:12:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8684C116C6;
	Thu, 22 Jan 2026 14:12:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769091159;
	bh=ymxs9hipH3MSqO+EtSgebsTWpLkwdhKqEdneib0tRSw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hODvGDmjEMpnNSE/AOUDtxnF6/OV7V6piVNP+5RR6/2HKcDHe28W+kp/NIv49sT+l
	 tosLBcyWDzhINlcaAedBwHLjIjWvKMCcC0Q6zqDTcFtBD3Nk1BTAKeLBJJXpSUKvQ+
	 ykQ9RFg405pb7DpzxmcP8ghnnvrHQIimvJtQjdhcfzYWeXZ6Wk4AHQjwJAlrXU9Sgf
	 O5EROBbioRHV3gtjEClqORtd+8ZPT/38sBn2oubpmMEfgnyK2m+CbnZVRbqnHMMsQn
	 VUXeNEE7zkq4E60i+HnVAjz6HeHdC5f+NhuXURm11BGSUCX9MJlCkxQXgSKExzJMPw
	 H7NgjxCWRG8lg==
Date: Thu, 22 Jan 2026 14:12:33 +0000
From: Lee Jones <lee@kernel.org>
To: Joseph Chen <chenjh@rock-chips.com>
Cc: Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org
Subject: [GIT PULL] Immutable branch between MFD and Regulator due for the
 v6.20 merge window
Message-ID: <20260122141233.GJ3831112@google.com>
References: <20260112124351.17707-1-chenjh@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260112124351.17707-1-chenjh@rock-chips.com>
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

Enjoy!

The following changes since commit 8f0b4cce4481fb22653697cced8d0d04027cb1e8:

  Linux 6.19-rc1 (2025-12-14 16:05:07 +1200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/lee/mfd.git ib-mfd-regulator-v6.20

for you to fetch changes up to 3e10bbd9c8a6d5d016b8e52c5d4ceba93a2304a0:

  regulator: rk808: Add RK801 support (2026-01-20 14:58:12 +0000)

----------------------------------------------------------------
Immutable branch between MFD and Regulator due for the v6.20 merge window

----------------------------------------------------------------
Joseph Chen (3):
      dt-bindings: mfd: Add rk801 binding
      mfd: rk8xx: Add RK801 support
      regulator: rk808: Add RK801 support

 .../devicetree/bindings/mfd/rockchip,rk801.yaml    | 197 +++++++++++++++++
 drivers/mfd/Kconfig                                |   6 +-
 drivers/mfd/rk8xx-core.c                           |  81 +++++++
 drivers/mfd/rk8xx-i2c.c                            |  33 ++-
 drivers/regulator/rk808-regulator.c                | 243 +++++++++++++++++++++
 include/linux/mfd/rk808.h                          | 118 ++++++++++
 6 files changed, 674 insertions(+), 4 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/mfd/rockchip,rk801.yaml

-- 
Lee Jones [李琼斯]

