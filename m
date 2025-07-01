Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C60CC8303C
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Jul 2025 08:52:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=egH8dl43nAY1tV9JJ+xwdkgzAbvvOZ1BwKT3m3Erp24=; b=X9ssQ6D3pnSaPMKHXrdtzyPEgS
	f7RGW++wEAiXywE0Mm5sL2ikmKXReC1YpfGo25OzT/SGS7mkvmNp4/0LCG0yDONBXiV/Md3Dm6iwv
	iQz3QIqxBwyMQXF3zSNGLZZWsyqWnHIEy4Bk0aD0AyOtglcZWuKEN8XAgD0G22ohRXAPZvC1JM7dE
	SUya9LCtEi4nSAjd/CDkfF7FRKvkyoOjC5fUfZbmfND83fMi3UpzlL5iy0HVAWOq1zocBYf4UfVbc
	k1Nn0lqW89RBvITHN9zF+tuuhNsmPIm9aWyCS7TX2xRt1qEqRc3lCgUj1vA8Yua9674XXspryFLjc
	+b4dfdeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWWiy-00000004TTF-2cXv;
	Tue, 01 Jul 2025 08:52:20 +0000
Received: from mail11.truemail.it ([2001:4b7e:0:8::81])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWWAl-00000004O4r-0X43
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Jul 2025 08:17:01 +0000
Received: from francesco-nb.corp.toradex.com (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch [83.173.201.248])
	by mail11.truemail.it (Postfix) with ESMTPA id AA5611F8F7;
	Tue,  1 Jul 2025 10:16:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1751357813;
	bh=egH8dl43nAY1tV9JJ+xwdkgzAbvvOZ1BwKT3m3Erp24=; h=From:To:Subject;
	b=BWm8ZG3mr2YJaTJ3Nwd0dnFoF2mHEWu/QtTzMKuQFza0MOPWwbc4win3l9EMORyac
	 vpwp2QbsteZnQrRn/AnvjUKKJvElaceyMiZNpG9YjmKp7xcLyiPJlYINhNfUM8mofg
	 BrQZ6h+tI9YeBFe45ivpzxzRxev6YzmqZKqsvnV4+rKjMhJRmFXXBpzdCnk7hrOPlt
	 ZdobBw1pYng4KC3/PzjpDqCSUgRPj9cQ3eKVQDY/Gyz0IS2VwwoiJZeutMZZcAtFku
	 QLs6jforESiRk00UiHyk+wwuztc6W0w6o+lAm2qwU/zazx9Hgbtc0istIe/UwsS2IL
	 /0f9R/czBT3fw==
From: Francesco Dolcini <francesco@dolcini.it>
To: Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Francesco Dolcini <francesco.dolcini@toradex.com>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1] arm64: dts: ti: k3-am62p-verdin: add SD_1 CD pull-up
Date: Tue,  1 Jul 2025 10:16:43 +0200
Message-Id: <20250701081643.71406-1-francesco@dolcini.it>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250701_011700_197525_B31FE454 
X-CRM114-Status: UNSURE (   9.45  )
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

From: Francesco Dolcini <francesco.dolcini@toradex.com>

Add internal pull-up to the SD_1 card detect signal, without this the CD
signal is floating and spurious detects events can happen.

Fixes: 87f95ea316ac ("arm64: dts: ti: Add Toradex Verdin AM62P")
Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
---
 arch/arm64/boot/dts/ti/k3-am62p-verdin.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/ti/k3-am62p-verdin.dtsi b/arch/arm64/boot/dts/ti/k3-am62p-verdin.dtsi
index d90d13287076..85c001aef7e3 100644
--- a/arch/arm64/boot/dts/ti/k3-am62p-verdin.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62p-verdin.dtsi
@@ -433,7 +433,7 @@ AM62PX_IOPAD(0x01b8, PIN_OUTPUT, 7) /* (E20) SPI0_CS1.GPIO1_16 */ /* SODIMM 19 *
 	/* Verdin SD_1_CD# */
 	pinctrl_sd1_cd: main-gpio1-48-default-pins {
 		pinctrl-single,pins = <
-			AM62PX_IOPAD(0x0240, PIN_INPUT, 7) /* (D23) MMC1_SDCD.GPIO1_48 */ /* SODIMM 84 */
+			AM62PX_IOPAD(0x0240, PIN_INPUT_PULLUP, 7) /* (D23) MMC1_SDCD.GPIO1_48 */ /* SODIMM 84 */
 		>;
 	};
 
-- 
2.39.5


