Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC751C369B2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Apr 2025 02:59:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aNtTtBKzJ1XNAZvQRdiog4t4RNRQ2IHj1hKEWHqeJzE=; b=LWhEI6YMwm3YUy87b4k2UDQ+rR
	X96OMktz1n2OVqmb8lyZ7WKxwIytK66CSrgHUWiMOBqHlvKdYj5eaLERlLG3vE6l0aaQisJXCrZP3
	gb2E+NOpPxvPPgLiG21d83ZM5ZGXxM+xvzz5HddzMqAZUbtO0JgHfdA+iu4s24/7R4o49UOpDmAHM
	TDfIDq8nT4HmnAFV7IUbbK1ABbeUQVLusDtkIGrYBy9KPA9e09p8bnOH52EdGidvSDfuoE2XDb0Al
	bd6zoTCznqott1V+8E+yro9wLWFclWVMyndFIFO1tIh4f7sm5E3FvqnVf4KiQ53TTD0TwVcaohGw9
	GQa1TSVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4WVn-00000004GLw-1d7j;
	Tue, 15 Apr 2025 02:58:59 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4WJD-00000004DRV-1m3t;
	Tue, 15 Apr 2025 02:46:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 3BBDEA41490;
	Tue, 15 Apr 2025 02:40:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2118DC4CEF9;
	Tue, 15 Apr 2025 02:45:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744685158;
	bh=EopiHNkPR1CFk53P+qfQdgoA0cAjgXrR1L67F8XEVbc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=gTWnUizBefWJTKYR2DIYa8m2pLfxUFwjfh+8cUCyjfFRlczeTAciVl8rOe8jf7wMI
	 /7xnjHnmdKrjT1PZVHsFSUj1RNB04jsqr6miHi2vuW/mHZxiCF79HjiqoqLFsCDPBd
	 GVE6zIb3mH0z0rZLpXhwD0eGgerfEkOVamH7Kzqtc0mDbPH1CXzZlVlZq7rflAIjpf
	 wIBlW8VxHEujTfYtsnt+WOl/yrbDLEn7vQdthZVb0ED+ttJaCI6o2WxylhW5VvCK6i
	 GtvueIyE2DHmPCqXszPoo03B97URUj0Gl3xFoVJJ/rk75mnza/3q+DdFzq6IRA/pUA
	 Q0b/ZzBLrOjFw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15963C369B4;
	Tue, 15 Apr 2025 02:45:58 +0000 (UTC)
From: Chuan Liu via B4 Relay <devnull+chuan.liu.amlogic.com@kernel.org>
Date: Tue, 15 Apr 2025 10:45:29 +0800
Subject: [PATCH v3 6/7] arm64: dts: amlogic: C3: Add clk-measure controller
 node
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250415-clk-measure-v3-6-9b8551dd33b4@amlogic.com>
References: <20250415-clk-measure-v3-0-9b8551dd33b4@amlogic.com>
In-Reply-To: <20250415-clk-measure-v3-0-9b8551dd33b4@amlogic.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Chuan Liu <chuan.liu@amlogic.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1744685155; l=834;
 i=chuan.liu@amlogic.com; s=20240902; h=from:subject:message-id;
 bh=AKlPTU8xGIGqlFdU3xVKc7rvyc2ZehKyhODovUNRMo8=;
 b=xRl0UutH0q4YaOvedHCl+vBzUekFHFCb6eNZCJrSl64c0mIqDdsgPBF8Kya2VzubX1w0FPjju
 IjvPZr1CYt8B7+UphyE2a8QFI2wcyifCiIg7WSXG3mLRe4mrYOk2BsO
X-Developer-Key: i=chuan.liu@amlogic.com; a=ed25519;
 pk=fnKDB+81SoWGKW2GJNFkKy/ULvsDmJZRGBE7pR5Xcpo=
X-Endpoint-Received: by B4 Relay for chuan.liu@amlogic.com/20240902 with
 auth_id=203
X-Original-From: Chuan Liu <chuan.liu@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250414_194559_559619_D9A803E9 
X-CRM114-Status: UNSURE (   7.79  )
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
Reply-To: chuan.liu@amlogic.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Chuan Liu <chuan.liu@amlogic.com>

Add the clk-measure controller node for C3 SoC family.

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Chuan Liu <chuan.liu@amlogic.com>
---
 arch/arm64/boot/dts/amlogic/amlogic-c3.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/amlogic-c3.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-c3.dtsi
index fd0e557eba06..cb9ea3ca6ee0 100644
--- a/arch/arm64/boot/dts/amlogic/amlogic-c3.dtsi
+++ b/arch/arm64/boot/dts/amlogic/amlogic-c3.dtsi
@@ -760,6 +760,11 @@ internal_ephy: ethernet_phy@8 {
 				};
 			};
 
+			clk_msr: clock-measure@48000 {
+				compatible = "amlogic,c3-clk-measure";
+				reg = <0x0 0x48000 0x0 0x1c>;
+			};
+
 			spicc0: spi@50000 {
 				compatible = "amlogic,meson-g12a-spicc";
 				reg = <0x0 0x50000 0x0 0x44>;

-- 
2.42.0



