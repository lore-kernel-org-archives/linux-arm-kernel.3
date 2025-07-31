Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04106C83F17
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 31 Jul 2025 06:28:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=/XZRRwln8zZt/L+45jSn1EDXrXjAeJJRPzpTgOE9Ijk=; b=Jnu3YeNVH8TU7rrkb8fRGJImye
	PHvrqiw+HxfoiLWyk4GxjBsDr8VWAKeElScrL5hl6vMrHMMuPPqgIaJlAK+WqAxotVS8JFhGQw1P0
	lbee/zhyGTy0ITq8Y5XYAMKF243/cZTESju4akeIdF4/bUixIOEl/sc8SuGqk9p5/B8gnkxRmZAmi
	Mao7l142kMwPNf5e1Vu01cLSjfJy5d7C0a3UXcdJ5vNp+RcBUMVsQXU2paVmJroQCwebRZN04iLbu
	cgLVCmQG7iZlHlLxAa6EW6AwlK7IO6WqTkTpxLDBMOE3Z1gs4VBhOQ1tgtAI0RcDK/6pAppNZVwEV
	vaZSndxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhMmL-00000002zQ4-26QW;
	Thu, 31 Jul 2025 06:28:37 +0000
Received: from smtpbgeu2.qq.com ([18.194.254.142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhMjo-00000002zIt-0EZg;
	Thu, 31 Jul 2025 06:26:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=airkyi.com;
	s=altu2504; t=1753943111;
	bh=/XZRRwln8zZt/L+45jSn1EDXrXjAeJJRPzpTgOE9Ijk=;
	h=From:To:Subject:Date:Message-Id;
	b=I5+qkNu+J1dYX1Gm56VcXpd06JG9sC8V9NjHV9Of4AyZuRVEoAQzdSje0NmVKD5rC
	 JNAzBjU6po+LSw8P6HpxTPyJmmLtQWeqzlGGn3GY1CTIyis0EW49PPOTZps2aUiI8u
	 7i75UKM4IhzXkARd9qVPEUa8CKl6a8v5vFq/DFwA=
X-QQ-mid: esmtpsz18t1753943109tfcdbbb8a
X-QQ-Originating-IP: 6KrmzkmmKpLZr/I1Po+usBh5ILwo6prMsK8XHxjwqzU=
Received: from DESKTOP-8BT1A2O.localdomain ( [58.22.7.114])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 31 Jul 2025 14:25:07 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 2550660293380765054
From: Chaoyi Chen <kernel@airkyi.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Shawn Lin <shawn.lin@rock-chips.com>,
	Andy Yan <andy.yan@rock-chips.com>,
	Detlev Casanova <detlev.casanova@collabora.com>,
	Kever Yang <kever.yang@rock-chips.com>,
	Chaoyi Chen <chaoyi.chen@rock-chips.com>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: rockchip: Enable eMMC on rk3576-evb1-v10
Date: Thu, 31 Jul 2025 14:24:15 +0800
Message-Id: <20250731062415.212-1-kernel@airkyi.com>
X-Mailer: git-send-email 2.17.1
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:airkyi.com:qybglogicsvrsz:qybglogicsvrsz4a-0
X-QQ-XMAILINFO: OBlwWD/GWDEoG5KfjqtGMt2cKFbPfOq0mbLLJXO9w1LxbfhDAXz9GTkU
	phIO/mlxZMk1gcZlf0bKJ0TFe7A+LVoaOFS2YtJ3BvE+EQ9IfPUVSPzeid98b9mkDM9YP9Q
	26RqaCR6GOcDWtF8kh9uqcVSkLH7ta5ecvmjolr+AiVTQityNsqgdW5rZeJpI22m7Y2ulC7
	RqruWiIvM4DJgdv3f4LDQ0a47ixIHYm45zo+/TwU4ypEsFOiziPQvs/9ST5VEZ08xBiPe/A
	a6ODyv4Qw0nbyCRS7wYF/WkvC25mJymftcoAjRZkz6c1gUjUHmJg6SLUWQ1LFCeUzkAFBdX
	NriBvOxJ+h/qMmp/edle5pHZEG/lJM55+lLG6bBmvTbSpNxgT5a8KXHsAND9uXJ8zp9kdsW
	EyRrXKbXv4/JqXwqfaZvwoYQqioNJnOxEl786fOQAh1bnGVLrIjfYWdQXk1qxI6l0kWd5B/
	Fv1PFDUH7im8Zl14FxOPF9Ecxf9DxvmgTx1SkwuA3Wn9K/d/iZ4Ml/mjcE2gyJndgzMCCne
	Xf1nyz5rFLLbYTq2cOVkLqsKPe7ZG6ua+Jgk+Se9N747QLYNdEwWqbiB/DaPP1RHOJBrwH+
	ACsjrCFD+6pVcN2kGdWnQ4XUT/Lfe1ChYh9MLi+J/XmZvn8wq/gTIrRV4kPm2IKaxllPDaQ
	xz7WIaWCb1auAJLLPCTlO9TzXAKUIP2MNzbQatpHWZRNcA9Detf0oKEZ2Paa7BC9cVCbFXE
	90NlUAJJZf085kgbshKBlv1V6SVqZbMmR7bOMSdu86WpXJKiNOAkwKcgukZzP/X8dDRXOaU
	XHOyfjlOKnbM3gvN7Bt1gK0O08RLcbGuF/ZW1ImwY/HAj7wfItCH8aNbAHR0MLRuc8NNvpT
	CzAit7E5tuaRnDLKvYatQTYJgTDG+dbhNhDvkkjj/9xdFhtRdNd1B9p/C4fOLNHrc8zseuH
	QTCOaiiFKISIAM/9YVLNCkCQREzBcxW8i2cE=
X-QQ-XMRINFO: MSVp+SPm3vtS1Vd6Y4Mggwc=
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250730_232600_645122_4C9A8BDA 
X-CRM114-Status: UNSURE (   8.46  )
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

From: Chaoyi Chen <chaoyi.chen@rock-chips.com>

Some rk3576-evb1 boards use eMMC instead of UFS. Enable eMMC for it.

Signed-off-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>
---
 arch/arm64/boot/dts/rockchip/rk3576-evb1-v10.dts | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3576-evb1-v10.dts b/arch/arm64/boot/dts/rockchip/rk3576-evb1-v10.dts
index 56527c56830e..a60dee0de9f9 100644
--- a/arch/arm64/boot/dts/rockchip/rk3576-evb1-v10.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3576-evb1-v10.dts
@@ -723,6 +723,18 @@ usbc0_int: usbc0-int {
 	};
 };
 
+&sdhci {
+	bus-width = <8>;
+	full-pwr-cycle-in-suspend;
+	max-frequency = <200000000>;
+	mmc-hs400-1_8v;
+	mmc-hs400-enhanced-strobe;
+	no-sdio;
+	no-sd;
+	non-removable;
+	status = "okay";
+};
+
 &sdmmc {
 	bus-width = <4>;
 	cap-mmc-highspeed;
-- 
2.49.0


