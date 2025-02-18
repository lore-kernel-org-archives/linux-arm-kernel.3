Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1AC5C021AA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Feb 2025 12:07:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=onCIRPcY3ZnXeO0K68ovO2YLbFr2LXlyKws4kj9k1k4=; b=Fz0hyUxwOBw1mM9DHJzLLPRe6t
	DyjBHJ6krt+kHbHbeydh5IE2JAAGMCcJtyj3aHpi+xeeCuI31xMXxC2fQqgydkvxS9C/ZcQkppI+L
	IVYrONp5yN3MOLTdD8jkXOXg5GyzqRmTTapL83yPcQfwlqDlnh3Vm2r0bv4B+liqecKjQQrHJpvK8
	yQTLOi4HdtiH2T5IdkEwt8pEK083vLT1xn6WvXlY0eis+nAmYuNfhRGuOUbI8q8mc18c3bYGQUBAm
	meIhcFTwy5d+xAmZwgO8GksA1HsUXGDKIEE8+uSH8M1dNk0rGwZh0563MkwVWm8p/3P4q/C1874kf
	HXptDriA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkMNN-0000000855y-0rN0;
	Tue, 18 Feb 2025 12:06:57 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkM6e-000000081bU-2p1F
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 18 Feb 2025 11:49:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=onCIRPcY3ZnXeO0K68ovO2YLbFr2LXlyKws4kj9k1k4=; b=qvRcbgJyF7yf0BSd6k0ykHWZKw
	QEsvRHVwx9J/E4kylOZDTPnDrY3aJMR6QvvaEPTLxtcRkB2bXlzJFntewleMGCxHPlhWLGVB0dnR4
	NcQUjwK1h17WNqapXBagsGyEwGRQgGca4UI3WCflcKdfcqXmfIhb9Va+lNXnk5503YnXjwbu5KNrP
	ptWa+mdiLJc3zP0KDlIYlxm49b9x62rTJNR9n7TcXTdXQ7wx9KcchBakDiY2KhXqD45Bls/gbuLY7
	nZoGytldo/3iRSOFCGrguKjyiFnqRPW8JprbEigdybXY4s5FT3JcRGUWrgrLMUQr6XQvB1jJTkkWB
	jNumHFRw==;
Received: from smtp-bc0e.mail.infomaniak.ch ([2001:1600:4:17::bc0e])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkM6a-00000001zRu-3glX
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Feb 2025 11:49:39 +0000
Received: from smtp-3-0000.mail.infomaniak.ch (unknown [IPv6:2001:1600:4:17::246b])
	by smtp-3-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4YxyVj3NHhz4mn;
	Tue, 18 Feb 2025 12:49:33 +0100 (CET)
Received: from unknown by smtp-3-0000.mail.infomaniak.ch (Postfix) with ESMTPA id 4YxyVh6mK1zkLh;
	Tue, 18 Feb 2025 12:49:32 +0100 (CET)
From: Quentin Schulz <foss+kernel@0leil.net>
Date: Tue, 18 Feb 2025 12:49:19 +0100
Subject: [PATCH 8/9] arm64: dts: rockchip: enable I2C3 in Haikou
 carrierboard, not Ringneck DTSI
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250218-tsd-align-haikou-v1-8-5c44d1dd8658@cherry.de>
References: <20250218-tsd-align-haikou-v1-0-5c44d1dd8658@cherry.de>
In-Reply-To: <20250218-tsd-align-haikou-v1-0-5c44d1dd8658@cherry.de>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.14.2
X-Infomaniak-Routing: alpha
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250218_114937_291528_7A159E91 
X-CRM114-Status: UNSURE (   9.95  )
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

From: Quentin Schulz <quentin.schulz@cherry.de>

PX30 Ringneck only exposes I2C3 as LVDS_BLC_CLK/DAT on Q7 golden fingers
but nothing is on that bus on the SoM itself. Therefore, let's enable
the I2C3 bus where it makes sense, in the Haikou carrierboard DTS.

Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
---
 arch/arm64/boot/dts/rockchip/px30-ringneck-haikou.dts | 2 ++
 arch/arm64/boot/dts/rockchip/px30-ringneck.dtsi       | 4 ----
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/px30-ringneck-haikou.dts b/arch/arm64/boot/dts/rockchip/px30-ringneck-haikou.dts
index e4517f47d519cc08ec9ee705a6f51a740687f6df..16996cc6b8b62fb4f87ab5cff7e86ba751af1794 100644
--- a/arch/arm64/boot/dts/rockchip/px30-ringneck-haikou.dts
+++ b/arch/arm64/boot/dts/rockchip/px30-ringneck-haikou.dts
@@ -154,6 +154,8 @@ sgtl5000: codec@a {
 };
 
 &i2c3 {
+	status = "okay";
+
 	eeprom@50 {
 		reg = <0x50>;
 		compatible = "atmel,24c01";
diff --git a/arch/arm64/boot/dts/rockchip/px30-ringneck.dtsi b/arch/arm64/boot/dts/rockchip/px30-ringneck.dtsi
index ae050cc6cd050f730fb8fd7e3971a166d234d408..c166a9e3cc1c30bba3ab9b6a5ce3e1f67566ee8c 100644
--- a/arch/arm64/boot/dts/rockchip/px30-ringneck.dtsi
+++ b/arch/arm64/boot/dts/rockchip/px30-ringneck.dtsi
@@ -325,10 +325,6 @@ rtc_twi: rtc@6f {
 	};
 };
 
-&i2c3 {
-	status = "okay";
-};
-
 &i2s0_8ch {
 	rockchip,trcm-sync-tx-only;
 

-- 
2.48.1


