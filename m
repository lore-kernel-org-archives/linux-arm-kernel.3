Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74AA1C88E6F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Sep 2026 17:56:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=MFHANsOlVjpv8Fp7sgZEgOBC57kTvkzD0gDUZ1FTuIc=; b=sJ2bkxWRGej+FxWIC0Kk5Bq019
	mBWC7Ox3A0HHNHuTJ3hogsvSKopc6LZ5NbPmAQQ28KFc2SEQCr9gJy8vSAaV69wB1OqXRgxaD256H
	DjY6wQX+LD7MmB9z9NsKiiyj5JCbUso/bK8i4SsPMTdW1h0wSFpc9iwcoe5K7JxqOI3lMYBd7gQ3C
	WnDaRDuWIIQ/LR3DChHyHebnw9RRmFOQstktBPyUxrPplOCozxNzKEpcJ49g/Ue905M9D501SeEbM
	KnDakjX6eRM8lclY0UXoOggw6BAqmYD9shnjSBl1eeRnkH+uShJAay4gUzKokHP71CoUomO1HSYcY
	0Y50GfVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6AuJ-00000004Pn4-3RZn;
	Mon, 14 Sep 2026 17:55:55 +0000
Received: from mail11.truemail.it ([217.194.8.81])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6AuB-00000004PmM-2BXk
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Sep 2026 17:55:54 +0000
Received: from francesco-nb.. (xcpe-178-82-167-143.dyn.res.sunrise.net [178.82.167.143])
	by mail11.truemail.it (Postfix) with ESMTPA id 2D5DE1F8BD;
	Mon, 14 Sep 2026 19:55:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1789408545;
	bh=MFHANsOlVjpv8Fp7sgZEgOBC57kTvkzD0gDUZ1FTuIc=; h=From:To:Subject;
	b=oa1jHHYOXKKofnpplpNXWeWcxv0adOqu3Tb0cNDdWUQ4k1Q6XAZ34eXf8va3RF5ut
	 r6YfL73uVfxiWNGT9naACuenHqQlBVnuqTJV/8n7y5+2jNgkTp96R+tKvyjkYiLa7f
	 0nclhloOeV1dNVVkw6qlp78MO8i7bLWzsoZ9jve/8ErT4+iE5H9bozfsl7S0O2kGdW
	 Hihkpv2o5stkJimz8OvjcfrVSL7KZxPRP79wTejJE1AG2+eBY6sxnW8K0VJ/ofEQ+S
	 9g+PFUyRVp9/znMz3PNDii4y7ENTK+gkZtkisvs7pYhEVzzzUZfLGRCgrhj1bGZaIU
	 uuQ2TWa0K26Og==
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
Subject: [PATCH v1] arm64: dts: ti: k3-am62-verdin: add SODIMM_84 gpio-line-name
Date: Mon, 14 Sep 2026 19:55:40 +0200
Message-ID: <20260914175541.11041-1-francesco@dolcini.it>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_105548_220375_76C0BB11 
X-CRM114-Status: UNSURE (   8.83  )
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

Add SODIMM_84 gpio-line-name (Verdin SD_1_CD#, used as cd-gpios for sdhci1).

Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
---
 arch/arm64/boot/dts/ti/k3-am62-verdin.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/ti/k3-am62-verdin.dtsi b/arch/arm64/boot/dts/ti/k3-am62-verdin.dtsi
index 895b1b7dcac7..e65d0e9c0373 100644
--- a/arch/arm64/boot/dts/ti/k3-am62-verdin.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62-verdin.dtsi
@@ -1065,7 +1065,7 @@ &main_gpio1 {
 		"",
 		"",
 		"",
-		"",
+		"SODIMM_84",
 		"SODIMM_17",
 		"SODIMM_155", /* 50 */
 		"",
-- 
2.47.3


