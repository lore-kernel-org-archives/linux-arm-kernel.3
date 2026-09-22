Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E7F5C982FF
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 13:34:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+GdK6pvcgWilvifm77f5f7Er+eZFy0j70nbF6Poz82E=; b=GZmGcT33VtOjLMFQb/1UEkpaMx
	Ssp4jEnNJxSeDjaDrpiyjhkvFPfnRw1fjFU1kIEkrhyFrBmCFBaWVLjPzHbFkbhVZSs/XZ0PRQWVu
	9hztFjEPwxXgvspCz9EDWORC7j8Fq4jxYTkdFYmJjjPWnirI5oYJK9ik1hQl1wEhyX/ixx4/6wXQJ
	gCjLGH6XxDR5kjNzQnwxq7pwORTbNhH28I2QEcDeXtWPq0ZqxKAt9oEindzsqmTb3ltHW1Fsrx4Os
	I9iH10fgm1xdHQf6h8vXeAfTllubQHj67CgC6mmIde0Jb9VEGhbT/gM8SibgJXzyj06k4RZmB6usx
	fzEzIthg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x90dU-00000005XSC-0ut9;
	Tue, 22 Sep 2026 13:34:16 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x90dQ-00000005XQD-0lPn
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Sep 2026 13:34:12 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 58AAC60A82;
	Tue, 22 Sep 2026 13:34:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 298D51F000FF;
	Tue, 22 Sep 2026 13:34:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790084051;
	bh=+GdK6pvcgWilvifm77f5f7Er+eZFy0j70nbF6Poz82E=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=kjFUrtQK451Ff80i9fopWt+Sz06531eTQLgjDNYF3lcBiceq7T8EhueLNBE+0PPGX
	 854i5bsSmiltE2pdgg3aYmXgul25h+Ce6vF2ccke6XHAjPGfez63pCeJvQL68nQ49R
	 ZC9MkPxLF9JIIlv1btUpzcojHkCoKhkaoZUapukyZ2QonX4NxGUoVBCfv7C83k5ql9
	 MixCUitgDS9w8eAhpnnSsJfARhC/ZRQPGTESNE2K7jHNbilSEo395XT74s1KApMDAz
	 7qyzeL9HBGXvwv40D3Bokn57DbiyJzdwcDYN4p0Hq+rrzEpiJnpFSr6KxrXJBy4cyu
	 IkVd93eS5dT0g==
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 22 Sep 2026 15:34:01 +0200
Subject: [PATCH 2/2] arm64: dts: renesas: r9a09g057h44-rzv2h-evk: Add ISP
 and IVC nodes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260922-mali-c55-renesas-dts-v1-2-cd63cdb51033@kernel.org>
References: <20260922-mali-c55-renesas-dts-v1-0-cd63cdb51033@kernel.org>
In-Reply-To: <20260922-mali-c55-renesas-dts-v1-0-cd63cdb51033@kernel.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
 Daniel Scally <dan.scally@ideasonboard.com>
Cc: linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, Linus Walleij <linusw@kernel.org>
X-Mailer: b4 0.16.0
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

From: Daniel Scally <dan.scally@ideasonboard.com>

Add nodes to devicetree enabling the ISP and IVC that are found on
the RZ/V2H(P) SoC.

[Rebase onto v7.3-rc1 and sort the board overrides by label.
 - Linus Walleij]

Assisted-by: LLM
Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
Signed-off-by: Linus Walleij <linusw@kernel.org>
---
 arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk.dts b/arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk.dts
index 637fc92dcc26..74b75be599ae 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk.dts
+++ b/arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk.dts
@@ -305,6 +305,14 @@ versa3: clock-generator@69 {
 	};
 };
 
+&isp {
+	status = "okay";
+};
+
+&ivc {
+	status = "okay";
+};
+
 &mdio0 {
 	phy0: ethernet-phy@0 {
 		compatible = "ethernet-phy-id0022.1640";

-- 
2.55.0


