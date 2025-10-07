Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04386CCD185
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Oct 2025 05:56:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qjRZKtwToa3ZCTaZRIJrwsT2lwjjOtjHot+5hsonslw=; b=Xmx6E59XzU69LTIaLbGgTD4AbU
	6REviUXiQx5KniuTG1XdobtJGVaDwuIp4FOgLtTtgdoPO+ImA+xD53HA+UM6u8EJrQMpbsARmXIpY
	VvusM/ArFicOHr+XhB0gY495CMoZ7l7Q8Kx1lV208MgPlTDdLgaP0XIAntG5Qami+ZCK8PlBEtADs
	ttSDrdzidklZg/i/PhD7ZtgggTVC5RleE6ARBvC9pH9GBSp/nX1pL6MH/d4hDJeO9ZnEED64w2IUf
	DimUWsTyCmm5s8RwY5Z6EUQhJ1zbCT64FFdhb7BDWn8wY7+kR78j3IilPnI6nQ2vv9axSQMZkH2mK
	C9K/GTOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v60fz-00000001JXH-3tOz;
	Tue, 07 Oct 2025 05:55:55 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v60fu-00000001JS2-1gKE
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Oct 2025 05:55:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 4BBF046911;
	Tue,  7 Oct 2025 05:55:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 13A97C16AAE;
	Tue,  7 Oct 2025 05:55:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759816549;
	bh=L6upHGNIYk6LiIUvrs8zcdks11R9wmaJquSLT/WgQMc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=puWxnLaITyjQd2Z3HoxtPeMB6VgQCMUHhW6A7h1eSWQykKQR7uNZWIXdKWHhL4njI
	 NaBy8rnESRaHb47vUTVzThpm1z756xnwtwN+4AqacWcwhlJCrZ9qrqNcO1fNJlNpMr
	 Epcl68XcsXt8qu0UfKYTVKyMhDvxpTnymuHMZrOAeuOEFKdde2JhitB+nj49yPsb3g
	 1bFDlRvTa17z9thj/86HxtSykwU6ae8saRradXlxmY/UdAeX9E5wamM3PSlAuqixew
	 DZ+WIVjXEDqFIKcaJ7D/4rRThYV9Mme7WzPy95YxlUFt3B6vBg1cEgFTbF5SfdKFjJ
	 1aQKqScRrmBcA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B93ACAC5B0;
	Tue,  7 Oct 2025 05:55:49 +0000 (UTC)
From: Alexandre Messier via B4 Relay <devnull+alex.me.ssier.org@kernel.org>
Date: Tue, 07 Oct 2025 01:55:44 -0400
Subject: [PATCH 3/4] ARM: dts: qcom: msm8974pro-htc-m8: add Bluetooth pins
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251007-m8-dts-additions-v1-3-53d7ab3594e7@me.ssier.org>
References: <20251007-m8-dts-additions-v1-0-53d7ab3594e7@me.ssier.org>
In-Reply-To: <20251007-m8-dts-additions-v1-0-53d7ab3594e7@me.ssier.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Luca Weiss <luca@lucaweiss.eu>, linux-arm-kernel@lists.infradead.org, 
 linux-arm-msm@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 phone-devel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Alexandre Messier <alex@me.ssier.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1759816548; l=1058;
 i=alex@me.ssier.org; s=20240603; h=from:subject:message-id;
 bh=0cC08gikvTy5BFUHETIstK9cv6Jxb/k0e5mDBRsGtzY=;
 b=5VQisWZuZSSDwAomDfZ0ayVYlEE0twKfTIhmKAuwlu0bDHKQXqPsQwv86sihrcKEsRr3BzdIt
 a9/jEQH50c2AbD0BUjmuzpYxxhOaIOxhQwH2IWswkQBZ4PJKEyk/pT0
X-Developer-Key: i=alex@me.ssier.org; a=ed25519;
 pk=JjRqVfLd2XLHX2QTylKoROw346/1LOyZJX0q6cfnrKw=
X-Endpoint-Received: by B4 Relay for alex@me.ssier.org/20240603 with
 auth_id=168
X-Original-From: Alexandre Messier <alex@me.ssier.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251006_225550_472976_21742DB1 
X-CRM114-Status: UNSURE (   9.30  )
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
Reply-To: alex@me.ssier.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Alexandre Messier <alex@me.ssier.org>

Add the required pin configuration to enable Bluetooth.

Signed-off-by: Alexandre Messier <alex@me.ssier.org>
---
 arch/arm/boot/dts/qcom/qcom-msm8974pro-htc-m8.dts | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/qcom/qcom-msm8974pro-htc-m8.dts b/arch/arm/boot/dts/qcom/qcom-msm8974pro-htc-m8.dts
index 4026d6fedfbe..36eb42f0f3d9 100644
--- a/arch/arm/boot/dts/qcom/qcom-msm8974pro-htc-m8.dts
+++ b/arch/arm/boot/dts/qcom/qcom-msm8974pro-htc-m8.dts
@@ -359,10 +359,19 @@ cmd-data-pins {
 	};
 
 	wcnss_pin_a: wcnss-pin-active-state {
-		pins = "gpio36", "gpio37", "gpio38", "gpio39", "gpio40";
-		function = "wlan";
-		drive-strength = <6>;
-		bias-pull-down;
+		bt-pins {
+			pins = "gpio35", "gpio43", "gpio44";
+			function = "bt";
+			drive-strength = <2>;
+			bias-pull-down;
+		};
+
+		wlan-pins {
+			pins = "gpio36", "gpio37", "gpio38", "gpio39", "gpio40";
+			function = "wlan";
+			drive-strength = <6>;
+			bias-pull-down;
+		};
 	};
 };
 

-- 
2.51.0



