Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AD6ACCD199
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Oct 2025 10:08:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=09O5QDNgkPI4J0LH95vZriOMzylPRPvgRsjibc+KLU4=; b=b70XD0CQxlcLTrcwNkDRDZIBlQ
	UGFc/Juu/RY5lKWfw8Ys9P8AiYfQxQ/E3yIqKpPRplVI97dTQBXWqWvaE/AZ1kMvzjG/cR3mS6t4Z
	8udxApqotuF6r9LPwgreh3eRvXOS6LrN2uYYiKos1/qKkqfyZQGHV1M7vQJrYiFRiHvNmIajTIoJD
	DGo0sxXD93N1hgghuaZDHuDebCcap10J4A9Q7TCVSFfnVIgB9NL86n4oUFU0dMOUsyiOFR32uF2nd
	wGi7FI8CLzIlGEdbAQkIS4mlLE7L+wmGCRrz40SeM4lCW/4W6VeJ23h4x4KibgbdhlNVhcu2ZhPlI
	NvsOdCSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAmoB-0000000CkhO-2a0w;
	Mon, 20 Oct 2025 10:08:07 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAmoA-0000000CkgP-0WCB;
	Mon, 20 Oct 2025 10:08:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=09O5QDNgkPI4J0LH95vZriOMzylPRPvgRsjibc+KLU4=; b=LDNkFjNKM3cj/7riU4Kgl6si5p
	6iPTv1SvqzE2FZLffwK4f2lJyfpogCJHonFtD2LHYAMgSDqzWqSMw/D5kY3nv2ijxJPKzKvcSh6Yv
	b5MidXPfVXVGNy4l+Vf8QEhf+KiBHrzm293Adj3j0dkU49V3JfwuEh6zMTywL5g/+g8AuGYELrenh
	Vd/Km7s0uLM9RM0n6jRKixCFpSnBs5WuVHEmvPJLFlz1ldK4NsNJ7sPbTalWv+L1r1vBHIZ1QguSV
	Afs47LYkVgbJfBz66TBH2vTAgq1oUBGexsKpfUg1DU5ZDXD8y8Jk1o5Va/orjMZ0/q4AZBt648qaX
	K4ZSgZ6w==;
Received: from gloria.sntech.de ([185.11.138.130])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAmo6-00000009hql-2k93;
	Mon, 20 Oct 2025 10:08:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type;
	bh=09O5QDNgkPI4J0LH95vZriOMzylPRPvgRsjibc+KLU4=; b=rCM2TdgVQO/paW6fIz653Btvxa
	iTs+PWamYf6h0kV/WwF1PmzFXZzZtBIOipE/VYCfjrkZt4F674JKtaiy7ZVnYJopGc6bLrTwwxB+1
	pnwgOwBFhX/6texL6G0B8JH2QOHdA8hkUX/+o2tdAbG0gLGo/nncyaccdvDAsHM7WymAO7Y0plpuB
	m3Sh358k/iaO5a2jzL/40wmYwvXNyOxss56f+0H9KchiEvt6fDFsEwkDVlzg7UZTpUUqtHNYtlO0Q
	hiZF6HybGrOnQkzDusNCMKH9EKrpv6jZ3wv8Kse3BU+/+lWvAoUyKyWJzHF0cOmD9Icdkg4jAjlx1
	D4nzK9SQ==;
Received: from [141.76.253.240] (helo=phil.eduroam.local)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1vAmo4-00083f-0U; Mon, 20 Oct 2025 12:08:00 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: heiko@sntech.de
Cc: quentin.schulz@cherry.de,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Heiko Stuebner <heiko.stuebner@cherry.de>
Subject: [PATCH 1/3] arm64: dts: rockchip: add gmac reset property to rk3368
Date: Mon, 20 Oct 2025 12:07:55 +0200
Message-ID: <20251020100757.3669681-2-heiko@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20251020100757.3669681-1-heiko@sntech.de>
References: <20251020100757.3669681-1-heiko@sntech.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251020_110803_136897_85A3CBA4 
X-CRM114-Status: GOOD (  10.57  )
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

From: Heiko Stuebner <heiko.stuebner@cherry.de>

Add the reset of the gmac controller block.

Signed-off-by: Heiko Stuebner <heiko.stuebner@cherry.de>
---
 arch/arm64/boot/dts/rockchip/rk3368.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3368.dtsi b/arch/arm64/boot/dts/rockchip/rk3368.dtsi
index 892d35242259..47968032afdc 100644
--- a/arch/arm64/boot/dts/rockchip/rk3368.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3368.dtsi
@@ -498,6 +498,8 @@ gmac: ethernet@ff290000 {
 			"mac_clk_rx", "mac_clk_tx",
 			"clk_mac_ref", "clk_mac_refout",
 			"aclk_mac", "pclk_mac";
+		resets = <&cru SRST_MAC>;
+		reset-names = "stmmaceth";
 		status = "disabled";
 	};
 
-- 
2.47.2


