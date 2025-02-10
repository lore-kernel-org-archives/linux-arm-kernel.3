Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 259FFC0219E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Feb 2025 21:56:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=z5oKt3XXLHGHJrEW0fq5xJQ0956ey9sHyzc1yPBS9mo=; b=GFgzdhEjr9i9+/ZG6Od/Vxcpow
	bY5rysMlXIS+9huftOI48sl1xAlAnUCk/VytJGbMLY6aFIx1/Fu6p5Oeifs0tPaIo55fIFTBLSDBp
	UnsfXlnhQ/09XZQbfL0RquVGI/096XPqjPzLO8VfBa41qFMXO5oYv4e59ZlIYsuPCA7ommm2wcyE5
	lOFFv7emoMCIFHhwQuASKmFHD7HpZP4JP9wHGyvbzICpr4hRXIMTyXgqIaR8NPhdwKGZNL37HAl4P
	wqwOSfdol3QP2kaOqLX7kwZAnYKiwh6GfzHa1BjeEgs1biPfYSGjwZUf4s+J4pMS2Ne2589L/XH3F
	Jb0JSvNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thbks-00000001Zmu-2Y8O;
	Mon, 10 Feb 2025 21:55:51 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thaks-00000001PRe-2wYB;
	Mon, 10 Feb 2025 20:51:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=z5oKt3XXLHGHJrEW0fq5xJQ0956ey9sHyzc1yPBS9mo=; b=F/4OTP0gpsUH+jW2VonLYlDq01
	VFmt17gsW8orpUTtLmIGcdYV+akCrfPzjQp657D3UKF/CGdeBr16YyXeqU+e+nNgl8EdKVNb23wDm
	Tt5v3aArOPY0D4yrhCZ5MCwxs9vWxW/vc/F7Rj0hO48AogyGlk0utti3FG8DxdgkdjAovoklrKbcf
	2mDwoPQUOMn/kxDuq9g1Qm5NewIWGiY41TvzFefGyvHmFPE/xzPi16ykWzIiZ8y4zRkTE5kWpzVQM
	QU/rkNEAS4PW6mz4JrAhxLfThA/b9I4A4J8INnWoSurgqUsoO9gwSCcc4fmmdtuUZyjYvwHO7ZY1U
	Tc2n4vrA==;
Received: from gloria.sntech.de ([185.11.138.130])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thakp-00000000Fyg-3nVu;
	Mon, 10 Feb 2025 20:51:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:
	Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=z5oKt3XXLHGHJrEW0fq5xJQ0956ey9sHyzc1yPBS9mo=; b=DhQgYNuegMfRUdP6y+pJ7b0F/p
	hvXTQ3yf3WsjmvC1T5fTdnFP8Zyu4/wR1MV+QZ/pS5lbskN3TcRF/YcWhQ01JbHfkq02fM5+bg5ZL
	MW9TtwP9/fMVaOIvBvkT5hYKQzo/KCjj7cOmS8lZtjrZtHI45iT3dvsKXiqkfODAuno0qf9DwKT1d
	cLSGup0x1PK3sDOeXcmCK5ChAlhXErijQLUd/syNHP13CQbXUi9IDtm4YEETofliQLdNrj6nAn7+6
	0iYS8704BbaFro8wdfdjknpqqwF7/VgzsgKoMubZ0UmEVCtM2unxY+Wv2erP93WnTkzXUQkrdBk+i
	GagVWZdw==;
Received: from i53875bc0.versanet.de ([83.135.91.192] helo=localhost.localdomain)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1thakl-0007Ka-IT; Mon, 10 Feb 2025 21:51:39 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: heiko@sntech.de
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	jonas@kwiboo.se
Subject: [PATCH v2 0/2] Rockchip - add Firefly ROC-RK3576-PC board
Date: Mon, 10 Feb 2025 21:51:24 +0100
Message-ID: <20250210205126.1173631-1-heiko@sntech.de>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_205144_110466_71840E96 
X-CRM114-Status: GOOD (  11.13  )
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

This adds a second board based around the rk3576 SoC.

changes in v2:
- add Rob's Ack on the binding
- move ethernet-phy-reset control into the phy-node (Jonas)
- some sorting cleanups

Heiko Stuebner (2):
  dt-bindings: arm: rockchip: Add Firefly ROC-RK3576-PC binding
  arm64: dts: rockchip: Add devicetree for the ROC-RK3576-PC

 .../devicetree/bindings/arm/rockchip.yaml     |   5 +
 arch/arm64/boot/dts/rockchip/Makefile         |   1 +
 .../arm64/boot/dts/rockchip/rk3576-roc-pc.dts | 736 ++++++++++++++++++
 3 files changed, 742 insertions(+)
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3576-roc-pc.dts

-- 
2.47.2


