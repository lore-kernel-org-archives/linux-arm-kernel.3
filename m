Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 429C0CCD1BF
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 25 Oct 2025 16:15:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=69WfUIcNojzOhDirG/idag6fuLhCJf7GRuqX9tyiLv0=; b=XtnrkVI9nrYBqP8JAWqINxhbfa
	uTd88EJ3bHdtNFBJjAWz0i/wH4cacaAEKwsOYPlYBi2elAFymfqUC83IBrVQNPUSZoxOXYUDuzsb3
	96Ouz+gry+9ydfAlRWrWnNtWqwrEGp7y/bQzXKkqndXMvScHQwMX7c1zVEudfvOk+KCawGVBrC9NX
	p3JBIjGWGetm8Qg2AB7TLDpMSUOAWOVRDnVHyRj6wuhNYStRJM/ksnFoZpWnrVFNyTUqlGPYqQ5M9
	g8e5N+R+vDuUZBTLJpr2c9nHp3b3Z/H0qacnRyWvuUcN3cWz6X0eqSZHY/K6ez3EGzzl5ix+BPGs3
	KdtZPZ1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCgvh-0000000BRzG-1s8E;
	Sat, 25 Oct 2025 16:15:45 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCgvf-0000000BRyN-20Mf
	for linux-arm-kernel@lists.infradead.org;
	Sat, 25 Oct 2025 16:15:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id D1307605C9;
	Sat, 25 Oct 2025 16:15:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2CE8EC4CEFB;
	Sat, 25 Oct 2025 16:15:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761408942;
	bh=6YDHDy3zvbGQC15CA863eua98CfrMNJDClBepXmEZ4U=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=MpeBaCXXwsVSCbL1jeQrvkvdqGwaVP0b6XY6HNW7Ed8nwaxEGvxIZJXxfLPyepb8f
	 5xI78p40Gu+86QvxXXOVmOndyGC63sYK4if9qn+ZMXsiqZnFeSwnnYZcUUq2zQZtuz
	 Xb/gxmjaA8q5WDXrXRckh5NpskqkdbLvr1Ms8eRpN5Cjl+3aW+gUu11GOS9+gyU8ns
	 hNa+vzZ9+m2P7aJRwWB4Z4QyZHoJaCMGnjWd/YmNZIOEu1of/fDXWHPgILsiTlBIzX
	 cQXFShup3DpAci7Ir7vyUJ6v/kfmdz9LWvAC7VonCfEkUk0Z0ZdopwVs9ZY+nMR6K3
	 +Gx2GEgFWvd5w==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Robert Marko <robert.marko@sartura.hr>,
	Daniel Machon <daniel.machon@microchip.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	Steen.Hegelund@microchip.com,
	UNGLinuxDriver@microchip.com,
	alexander.deucher@amd.com,
	davem@davemloft.net,
	alexandre.f.demers@gmail.com,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH AUTOSEL 6.17-5.15] net: ethernet: microchip: sparx5: make it selectable for ARCH_LAN969X
Date: Sat, 25 Oct 2025 11:56:13 -0400
Message-ID: <20251025160905.3857885-142-sashal@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251025160905.3857885-1-sashal@kernel.org>
References: <20251025160905.3857885-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.17.5
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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

From: Robert Marko <robert.marko@sartura.hr>

[ Upstream commit 6287982aa54946449bccff3e6488d3a15e458392 ]

LAN969x switchdev support depends on the SparX-5 core,so make it selectable
for ARCH_LAN969X.

Signed-off-by: Robert Marko <robert.marko@sartura.hr>
Reviewed-by: Daniel Machon <daniel.machon@microchip.com>
Link: https://patch.msgid.link/20250917110106.55219-1-robert.marko@sartura.hr
Signed-off-by: Jakub Kicinski <kuba@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

LLM Generated explanations, may be completely bogus:

YES. The change extends the `SPARX5_SWITCH` Kconfig dependency so the
switch core can be enabled when building for `ARCH_LAN969X`
(`drivers/net/ethernet/microchip/sparx5/Kconfig:6`). Without it, the
LAN969x-specific driver entry `config LAN969X_SWITCH`, which is compiled
into the same `sparx5-switch.ko`, cannot even be selected because it
depends on `SPARX5_SWITCH`
(`drivers/net/ethernet/microchip/sparx5/Kconfig:28-31` and
`drivers/net/ethernet/microchip/sparx5/Makefile:1-23`). That prevents
any LAN969x system—the SoC is defined under `ARCH_LAN969X`
(`arch/arm64/Kconfig.platforms:187-201`)—from instantiating the SparX-5
core that the LAN969x code relies on (for example the
`lan969x_fdma_init()` path in
`drivers/net/ethernet/microchip/sparx5/lan969x/lan969x_fdma.c:357-392`
or the LAN969x DT match wired into the SparX-5 platform driver in
`drivers/net/ethernet/microchip/sparx5/sparx5_main.c:1116-1136`). In
practice this means current stable kernels that already merged LAN969x
support ship a non-functional configuration knob—akin to a build
regression—because the required core can’t be enabled. The fix is a
single Kconfig dependency tweak with no runtime side effects and no
architectural churn, making it a low-risk, high-value backport that
unblocks hardware support.

 drivers/net/ethernet/microchip/sparx5/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/microchip/sparx5/Kconfig b/drivers/net/ethernet/microchip/sparx5/Kconfig
index 35e1c0cf345ea..a4d6706590d25 100644
--- a/drivers/net/ethernet/microchip/sparx5/Kconfig
+++ b/drivers/net/ethernet/microchip/sparx5/Kconfig
@@ -3,7 +3,7 @@ config SPARX5_SWITCH
 	depends on NET_SWITCHDEV
 	depends on HAS_IOMEM
 	depends on OF
-	depends on ARCH_SPARX5 || COMPILE_TEST
+	depends on ARCH_SPARX5 || ARCH_LAN969X || COMPILE_TEST
 	depends on PTP_1588_CLOCK_OPTIONAL
 	depends on BRIDGE || BRIDGE=n
 	select PHYLINK
-- 
2.51.0


