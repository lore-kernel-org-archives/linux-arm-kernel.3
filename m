Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E187C0218F
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  2 Feb 2025 18:41:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZnZkvZ6njFEhf9CAs0fWWykrIiqSo3/ttLNg1KiNnZM=; b=OgVYc2DJosgIsTlvMhat8NC1c5
	i2BTtRtwMVcKw6aTTE0fRuuog9GOem+vwp9knIT60SF7QI2FZxLKNt49I55+erHdj94zJQxr/fX6G
	LY9FLNBeXusre/nFXYLFx/MqMiY2juKmQZFaInoMztxMKCz+iT9qo8COnLmWRaww35b9eNawt4bh/
	quNTVtMd0uMlLEcfBPmfWSfaZLjllKKgneKn37YHn3utMTpRrfgVcC1z0w2JJ/h2eeRDa2/rpKZ5e
	tkzlKP6rdbWfICb/8Shlgu9AFZms+4GIRVJMeNYGYAVn4GGSzCeUb+VO8K1UPx1SGb1RD/ZT6MbbZ
	AJGAj8/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1teetz-0000000E315-397d;
	Sun, 02 Feb 2025 18:41:03 +0000
Received: from layka.disroot.org ([178.21.23.139])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1teerb-0000000E2ZW-1SoZ;
	Sun, 02 Feb 2025 18:38:36 +0000
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 071CB254F1;
	Sun,  2 Feb 2025 19:38:34 +0100 (CET)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6AhsCCaCtE3s; Sun,  2 Feb 2025 19:38:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1738521508; bh=/1IewTiZbmQBp1G6EX+8pjxa8xy0IWsaV+GmJE5iXFo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=HBreNpT+ttIa8CGLsZ5CcF08z1c+8sveRXPbZMTmUUqy+hblw1ddRyHjLiZ0MF+ok
	 i4NIJ1nrlvWjQWg0ey2lCnu3lzxdsZrzMRMdI1sSjIcPAdkDR5bLdubxACk/5cjmAt
	 433/Vfo/4G98V59OJdNA9NCcvFJ9p87sa/gG/69toYtftkF+NI2HhHqe3FLhUfjBjC
	 BHFYtaNMBK1hlnk+Bb8jBZhdXygk0tj/JhHg5SJUYPwe5ln4LuIbNQe+dus9GNzHfJ
	 B6IGV6HHlm5pQs2WJKZpS57JyFSwR8OVy/ggV+GCat4U1rzSBd0RK2zKjBtPBIK75J
	 goaIpxd1Nqgrg==
From: Kaustabh Chakraborty <kauschluss@disroot.org>
Date: Mon, 03 Feb 2025 00:06:34 +0530
Subject: [PATCH 01/33] dt-bindings: hwinfo: samsung,exynos-chipid: add
 exynos7870-chipid compatible
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250203-exynos7870-v1-1-2b6df476a3f0@disroot.org>
References: <20250203-exynos7870-v1-0-2b6df476a3f0@disroot.org>
In-Reply-To: <20250203-exynos7870-v1-0-2b6df476a3f0@disroot.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Conor Dooley <conor@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Tomasz Figa <tomasz.figa@gmail.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Lee Jones <lee@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Andi Shyti <andi.shyti@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>, 
 Jaehoon Chung <jh80.chung@samsung.com>, 
 Vivek Gautam <gautam.vivek@samsung.com>, 
 Thinh Nguyen <Thinh.Nguyen@synopsys.com>, Kees Cook <kees@kernel.org>, 
 Tony Luck <tony.luck@intel.com>, 
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: Sergey Lisov <sleirsgoevy@gmail.com>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-gpio@vger.kernel.org, linux-serial@vger.kernel.org, 
 linux-phy@lists.infradead.org, linux-usb@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-i2c@vger.kernel.org, 
 linux-mmc@vger.kernel.org, linux-hardening@vger.kernel.org, 
 Kaustabh Chakraborty <kauschluss@disroot.org>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1738521464; l=984;
 i=kauschluss@disroot.org; s=20250202; h=from:subject:message-id;
 bh=/1IewTiZbmQBp1G6EX+8pjxa8xy0IWsaV+GmJE5iXFo=;
 b=HPseafre3G8+clhlVS1WJKZVT7jwJzhFKM2sGawnkEHiBn7JiPjXw4NhJ7G0nQFgC59FtSAIa
 XxYQgScGyr/BRyfi3Ksk7w2C/l3g5/Gjn12L8Ju83LEviQCRTS4bHfn
X-Developer-Key: i=kauschluss@disroot.org; a=ed25519;
 pk=h2xeR+V2I1+GrfDPAhZa3M+NWA0Cnbdkkq1bH3ct1hE=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250202_103835_555477_1736E034 
X-CRM114-Status: GOOD (  10.00  )
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

Add the compatible string "samsung,exynos7870-chipid" to the documentation,
with a fallback to "samsung,exynos4210-chipid".

Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
---
 Documentation/devicetree/bindings/hwinfo/samsung,exynos-chipid.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/hwinfo/samsung,exynos-chipid.yaml b/Documentation/devicetree/bindings/hwinfo/samsung,exynos-chipid.yaml
index 385aac7161a0db9334a92d78a57a125f23ca1920..9105ad48563a42ecaeb3dbca37df734d5b93f52c 100644
--- a/Documentation/devicetree/bindings/hwinfo/samsung,exynos-chipid.yaml
+++ b/Documentation/devicetree/bindings/hwinfo/samsung,exynos-chipid.yaml
@@ -19,6 +19,7 @@ properties:
           - enum:
               - samsung,exynos5433-chipid
               - samsung,exynos7-chipid
+              - samsung,exynos7870-chipid
           - const: samsung,exynos4210-chipid
       - items:
           - enum:

-- 
2.48.1


