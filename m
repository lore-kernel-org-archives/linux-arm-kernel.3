Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 256D9CE8E97
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Oct 2024 17:14:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KM+2Y/Ep7Numps+5Lfqqe0R8i5vFqG/ExoM93/p9fK4=; b=MyIJKzPqbWlS20i65haBspYkt8
	3r+Dgjx4yhTODFucLpQ6OBM1bzQ3mUs1E+Prjc9jK/2+3oJN1H/H/DT/xquGI5RWmweebC8PKr+Gi
	VUbzXKpuzASs94qGS9ZHWLqGaMxH3gjVJd1DI+AEa/b3xiAtvmA1YHMzYs16CXjUzvDl8Ugev2TS9
	mnpxO6IMNxOhzpXU/3eM7Fa1kwU1tEH7MTYpBovDTkuwgTPYzMALaV4O3VrDs6wHPBnGpVErVvJcB
	BexVx1GHSPVzSQ5I39orkDPreTFrZjkeLzlh/9BgGMyNywzoNFg58ilKC6Pqmuv0NdG3EPhVHHvXM
	hijteG2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t41Q6-00000001F19-3KSc;
	Thu, 24 Oct 2024 17:14:46 +0000
Received: from thales.epochal.quest ([2607:5300:205:200::3a30])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t41LF-00000001Dlr-2qQQ;
	Thu, 24 Oct 2024 17:09:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=epochal.quest;
	s=default; t=1729789782;
	bh=RX+bua+zQmv95muSSfcwHCoRRExA1+Jmd6fbL7zvW6s=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=iQxJhzXurv5NTaqqSXTBmDxmvJU4Vp9eGzjP1KUdQMgA1xxT5UGg9Cu7oefMCrZQs
	 rVeFo0vRZm4G9AOmDRzn5AUliV7IdhiTKiAPiZ9hftmGxMQYh/DQpJAjR2ccS+3F59
	 hKzjtxoc3C5PvikWx/7/msKmgee7/jU67G+M7b2vhyIKauebjab0xfj1H5L2ZdWyZc
	 LMpjLnghC7scjYGdwNJA5T5YY6rkaNMtaqmBS6trj1i21sURoBjA81DnOMwNevUnBr
	 ZpxcxPHA7hQTRDpGFs5gNVm7oB+IymjDva84lJoLfjRzBZPsWdFDAd9sxWy4gyn3+z
	 pQnIJZiaiB9wg==
X-Virus-Scanned: by epochal.quest
From: Cody Eksal <masterr3c0rd@epochal.quest>
To: linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-usb@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Cody Eksal <masterr3c0rd@epochal.quest>,
	Andre Przywara <andre.przywara@arm.com>,
	Parthiban <parthiban@linumiz.com>,
	Yangtao Li <frank@allwinnertech.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Vinod Koul <vkoul@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Thierry Reding <treding@nvidia.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Maxime Ripard <mripard@kernel.org>,
	Yangtao Li <tiny.windzz@gmail.com>,
	Viresh Kumar <vireshk@kernel.org>,
	Nishanth Menon <nm@ti.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>
Subject: [PATCH 04/13] dt-bindings: usb: Add A100 compatible string
Date: Thu, 24 Oct 2024 14:05:22 -0300
Message-ID: <20241024170540.2721307-5-masterr3c0rd@epochal.quest>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241024170540.2721307-1-masterr3c0rd@epochal.quest>
References: <20241024170540.2721307-1-masterr3c0rd@epochal.quest>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241024_100945_823947_E7AC33D7 
X-CRM114-Status: UNSURE (   8.05  )
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

The Allwinner A100 contains two fully OHCI/EHCI compatible USB host
controllers. Add their compatible strings to the list of
generic OHCI/EHCI controllers.

Signed-off-by: Cody Eksal <masterr3c0rd@epochal.quest>
---
 Documentation/devicetree/bindings/usb/generic-ehci.yaml | 1 +
 Documentation/devicetree/bindings/usb/generic-ohci.yaml | 1 +
 2 files changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/generic-ehci.yaml b/Documentation/devicetree/bindings/usb/generic-ehci.yaml
index 2ed178f16a78..e00e98dd04af 100644
--- a/Documentation/devicetree/bindings/usb/generic-ehci.yaml
+++ b/Documentation/devicetree/bindings/usb/generic-ehci.yaml
@@ -30,6 +30,7 @@ properties:
               - allwinner,sun4i-a10-ehci
               - allwinner,sun50i-a64-ehci
               - allwinner,sun50i-h6-ehci
+              - allwinner,sun50i-a100-ehci
               - allwinner,sun50i-h616-ehci
               - allwinner,sun5i-a13-ehci
               - allwinner,sun6i-a31-ehci
diff --git a/Documentation/devicetree/bindings/usb/generic-ohci.yaml b/Documentation/devicetree/bindings/usb/generic-ohci.yaml
index b9576015736b..6ce81979781b 100644
--- a/Documentation/devicetree/bindings/usb/generic-ohci.yaml
+++ b/Documentation/devicetree/bindings/usb/generic-ohci.yaml
@@ -17,6 +17,7 @@ properties:
               - allwinner,sun4i-a10-ohci
               - allwinner,sun50i-a64-ohci
               - allwinner,sun50i-h6-ohci
+              - allwinner,sun50i-a100-ohci
               - allwinner,sun50i-h616-ohci
               - allwinner,sun5i-a13-ohci
               - allwinner,sun6i-a31-ohci
-- 
2.47.0


