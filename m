Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA6A1E9A74E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Mar 2026 09:37:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9VPsWSMOBnOCg9xR3vQur1m+erMGsAZo3Y9OUF3LYYs=; b=eODVHBJRzRC7hw682qio0hqMRc
	Y6gXNOn880l7Cd6TWoMTr9AEvRk+AE9zMVocZW13n/056w2MuPtOtVb1MdEkroGI1inDJJtwzub1m
	JRiIpDdDCWfMSuGEyyYfuxSItkm94KsD2WEI641IzvzHPblQ88343h0v267IP3K9MhG5A+tmRappu
	utoKXID0nmTa5vqMpjZw9m37+jAjTQEenm8NO77juNMsKTDhLsLh+I37iLsBS57d76+LK70Auofcu
	In//HZB7+2wva6HjiEtX+aeenp4aWK0Bj7cUQ5ngu8dZZbHP+WO5Ft3L0drizOLZaE+6UiENDLr6t
	mLaVnSZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4yCN-000000016Vi-3Whj;
	Tue, 24 Mar 2026 09:37:19 +0000
Received: from mail11.truemail.it ([2001:4b7e:0:8::81])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4yCL-000000016Tz-0AeZ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Mar 2026 09:37:18 +0000
Received: from francesco-nb.corp.toradex.com (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch [83.173.201.248])
	by mail11.truemail.it (Postfix) with ESMTPA id 16BBE275B8;
	Tue, 24 Mar 2026 10:37:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1774345031;
	bh=9VPsWSMOBnOCg9xR3vQur1m+erMGsAZo3Y9OUF3LYYs=; h=From:To:Subject;
	b=UU4pFGnU640PEqMULZZQ1N8jDM33+rKXQoWZvAEOBNYSb89lNnvM4ZJrUswNDLAKk
	 OK2iikjGxH4C4CBj3mQUNNH8TnyPa0u5fHDMeFWJnpiB9M8yor6cMIVRv0JBr3omZP
	 wN2aDP/oucEPdA9PCDNa2w/IDuz7vBe6gXr86w/3OaHSyjLL+j4KVcCRu1mGsLcZim
	 2LFQZK6k1oWxxZ9oBgN35o/SA0T3U2hw5laBEpG43Q3SJe2RlK/ek72aQBr4wTY+d6
	 IoWB67SE5vJBF6lYF6tjs2AQt+mKwg4zQ/72r2nlgCYnx6iMZWEwpUwvBKOT6VeCo7
	 2djJrkVBmnttA==
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
Subject: [PATCH v1 2/7] arm64: dts: ti: k3-am62-verdin: Fix SPI_1 GPIO CS pinctrl label
Date: Tue, 24 Mar 2026 10:36:57 +0100
Message-ID: <20260324093705.26730-3-francesco@dolcini.it>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260324093705.26730-1-francesco@dolcini.it>
References: <20260324093705.26730-1-francesco@dolcini.it>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260324_023717_235148_41668486 
X-CRM114-Status: UNSURE (   9.91  )
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

Fix SPI_1_CS GPIO pinmux label, this is spi1_cs, not qspi1_io4.

There are no user of this label yet, therefore this change does not
create any compatibility issue.

Fixes: fcb335934c51 ("arm64: dts: ti: verdin-am62: Improve spi1 chip-select pinctrl")
Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
---
 arch/arm64/boot/dts/ti/k3-am62-verdin.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/ti/k3-am62-verdin.dtsi b/arch/arm64/boot/dts/ti/k3-am62-verdin.dtsi
index 2a7242a2fef8..219b729d3caa 100644
--- a/arch/arm64/boot/dts/ti/k3-am62-verdin.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62-verdin.dtsi
@@ -278,7 +278,7 @@ AM62X_IOPAD(0x0018, PIN_INPUT, 7) /* (F24) OSPI0_D3.GPIO0_6 */ /* SODIMM 62 */
 	};
 
 	/* Verdin SPI_1 CS as GPIO */
-	pinctrl_qspi1_io4_gpio: main-gpio0-7-default-pins {
+	pinctrl_spi1_cs_gpio: main-gpio0-7-default-pins {
 		pinctrl-single,pins = <
 			AM62X_IOPAD(0x001c, PIN_INPUT, 7) /* (J23) OSPI0_D4.GPIO0_7 */ /* SODIMM 202 */
 		>;
-- 
2.47.3


