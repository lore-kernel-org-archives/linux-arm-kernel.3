Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D2DDC55172
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Aug 2026 05:36:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:Date:Cc:To:From:Subject:Message-ID:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=HUzmDv8dlY9hJpk3TBvoU3edR9tSDvSdfT2jQQqZ4hc=; b=lXj/gw+7jqz5Gddqs03CSPw9LY
	HQihNGmxyCOsJk95yWqlg2RDpKV/ohTvDXlrHY8xCNFuEmINIKUcBb6wyxh/XheStZHyAyRbdlSFb
	Dlq0Cj/eozCoXgkHtNFFN5ok91h6i33xXzjGqephs0zuAuD5Z/3SWjnFZEa8GwBVXrsOmDVqLJ0Ub
	TJuhLLmp8PNdTCVzfu687I9ke2yGhIk6TkdoIAeOJhcA4/1x5QibiLr/0aUTEpK+r77NdXsB5HMsD
	Iikwh/l9uDkahCwROyI6PZPYN5RD2c3q1j4HC2TRZQ4pTjTVWmQ/rxMKl+SqmiWYYK1xyhVH8ZJag
	xOnbVjzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wr7ox-000000013GM-2Qtx;
	Tue, 04 Aug 2026 05:36:11 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wr7ou-000000013Ft-2f7A
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Aug 2026 05:36:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1785821766;
	bh=HUzmDv8dlY9hJpk3TBvoU3edR9tSDvSdfT2jQQqZ4hc=;
	h=Subject:From:To:Cc:Date;
	b=m1MRgEctHCoSjVbYDOJlLmw7m2Jk/8V65lDiaGymSNOhsntYXlV0556jD84kH0vI+
	 nDobRlI3Z+59Fxuqs+HeJJnm6HeUxMxFBV8nPzkkQsx/gW08QEPlIWatXlQD8DYQy+
	 7/vRK2OzKVISRSUF9DUdJxVGI9pXHqDjofP4soFT7UF3Y5hOCTBRyj6l/tFxn2DiFN
	 /BYhfryqxSvgVzIyBct1XXxWe24fTK097U4w0kU2sAZKIgA2h6AhcbbCz4JxBJvwAD
	 29mDGdK4zB6mGIWp5BZQ3pXtQKadJT2f5Ry7/BIaXFqQZLrSjybKpZtMR6zQN8kgQQ
	 oZKZYlCVhnUeA==
Received: from [192.168.68.117] (unknown [180.150.113.112])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 3FDF8655A9;
	Tue,  4 Aug 2026 13:36:06 +0800 (AWST)
Message-ID: <a0dbb1b1642b5d30f01adb5f48c51e426414dc90.camel@codeconstruct.com.au>
Subject: [GIT PULL] aspeed: First batch of ARM devicetree changes for 7.3
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: soc <soc@lists.linux.dev>
Cc: linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org, Joel Stanley <joel@jms.id.au>
Date: Tue, 04 Aug 2026 15:06:05 +0930
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_223608_862727_DE6E5D26 
X-CRM114-Status: UNSURE (   6.32  )
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

The following changes since commit dc59e4fea9d83f03bad6bddf3fa2e52491777482=
:

  Linux 7.2-rc1 (2026-06-28 12:01:31 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/bmc/linux.git aspeed-arm-=
7.3-devicetree-0

for you to fetch changes up to 749c34389679f8d56cb200a69b62f9a64670034f:

  ARM: dts: aspeed: Correct indentation (2026-07-23 00:52:02 +0930)

----------------------------------------------------------------
aspeed: First batch of ARM devicetree changes for 7.3

No significant changes this time around. Instead, several cleanups
for Meta's San Miguel platform, along with some changes enabling
dt-check-style.

----------------------------------------------------------------
Krzysztof Kozlowski (1):
      ARM: dts: aspeed: Correct indentation

Mike Hsieh (1):
      ARM: dts: aspeed: sanmiguel: fix PDB HSC shunt resistor

Potin Lai (2):
      ARM: dts: aspeed: sanmiguel: Fix FIO IOEXP interrupt pin
      ARM: dts: aspeed: sanmiguel: Fix PWRGD_RMC_N active-low hog configura=
tion

 .../dts/aspeed/aspeed-bmc-facebook-sanmiguel.dts   |  14 +-
 .../aspeed/aspeed-bmc-inventec-transformers.dts    | 432 ++++++++++-------=
----
 arch/arm/boot/dts/aspeed/aspeed-bmc-opp-vesnin.dts |   2 +-
 arch/arm/boot/dts/aspeed/aspeed-g6.dtsi            |   2 +-
 4 files changed, 225 insertions(+), 225 deletions(-)

