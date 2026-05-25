Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB41BCD5BB1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 May 2026 14:48:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IY5VpH1QCqNL+Hxqm+EMdHN3zeBtEzU6Oz9nJybwNNI=; b=VoRJoXsbSS3KvkUUGh0zOt7BAZ
	saxp3fAhdtE3YWt3s2KoylPyS6J4dCD0XtjhSWgI8Ee7Gy7cF+Co8XInKJZk+jM430spE5Y3JGS5Y
	Usw5HonTsuViI69FtYh+3HQVunBMpU2cdf3b3um4hLLqN5oISJw6HiLz4Dwcz82aqIxVgfjxbpLKr
	Xqc6o5LB2/QY7Bc2ntKDQ0ARvXj2+lBzsVkj32idJgBG7fpXHjO5uo1sRn7mC4Sgb1LZRU/YNPBnY
	ClwkgHd94pWcquLYvlZuz0ZU5wDKuLwHnU7FXKSVIRMizR5/M5CNbbHIhcqic3K51RUzXBrjyyweL
	vdTD9RBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRWbC-0000000HRwW-2d14;
	Mon, 25 May 2026 14:48:10 +0000
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRWb9-0000000HRue-3LN7
	for linux-arm-kernel@lists.infradead.org;
	Mon, 25 May 2026 14:48:09 +0000
Received: by mail-pj1-x1035.google.com with SMTP id 98e67ed59e1d1-36931e4f5e8so8990719a91.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 25 May 2026 07:48:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779720487; x=1780325287; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IY5VpH1QCqNL+Hxqm+EMdHN3zeBtEzU6Oz9nJybwNNI=;
        b=sl9sawBZaSHWpkJP+u02eeFk+ejhxrKO50Gv/nvr75CzN57ypxSx7QriFCOYiu881T
         I/ch9tqAKmpIEZ+X7loBdQAUJ8JyRmTz7J0Ed0A5JPkYdYO+vz/K6DogFAkQl3HFX4+c
         eXgFYWpshH5VA2rHcMNmLWSfCkL/B2xLQ0EA01cy5TOFdXBnAv24RkhkSVgpa24nhIcG
         Us6Hkhzw4KBn2zuSACoxQLSFHUpdBXxiG8PmVu/vpBKoysMsqMqFhVtbJXvGGjykbHbS
         SJICm5lNyY5zWEiLsNdziPWESBTKX45Mj+f1VF1tt0L51YtUcJhtc3t8vpzP5sBOuO+K
         ryRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779720487; x=1780325287;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=IY5VpH1QCqNL+Hxqm+EMdHN3zeBtEzU6Oz9nJybwNNI=;
        b=WDxQ5df9k1pLuYfOf/ae6rndF1zTGyEY7MEoRukCgAEJJUCz5uUeI6LdEYbLJXMG1Q
         MT8Oqu9E7wma5O+Pj53UvOkQeN408CNc9hn4GLSH2fBerxRF3SsgvJ44dOE0zJNiXW3T
         Rud5bSPz1ttsqVBF/WvNzqT87Jw3/EQvFfSbQV1wacd4yA7QW64KaXjeDQJnLTfqaHYy
         CanZH5fE7+2Tm++jC2zUiWbZK3dLj96DyHxMrHySUpFoyIkugs2DorEFV8VZ19GsnEBw
         2OisacrRmbAY4DK4TSRmfjN0ajdu7V8zeMibgLr6Q6XXdOVAO6gFbeZ7Kb9Ullto/bGd
         GtYg==
X-Forwarded-Encrypted: i=1; AFNElJ+70gsEfJSVurK0R3g6K+uG5FAUmVb7qpa/kT0kM1dNKeIrCHMbcRaXmTC9JlCm46Q18jwoRC5erkgcKNLVJZyh@lists.infradead.org
X-Gm-Message-State: AOJu0Yx7XINMlEqTuk/DpgryyHqPQVNq+Cj4u9ZH9qVxQFcRbmgN2rMG
	oUzcS3DW8axKYVCRpb8o2bgob2Qqu+8P898ipr+4T+vKyQP8s1cxeDw1
X-Gm-Gg: Acq92OFNkga0tmaiHtZl89BVpiTgC5Hoa4Qauojl+igNfuU/57ATieP7kXJP01ZNMUJ
	Xj6fKOmcz61canPb3x5QiCd0zy8hClnHSH6Aphd1rBNwfY+uxL5W9ibkohQ4AxXEoncgFF3W0Tk
	ez6dCBkRAdrLI99EL99BXpQ9l7BGclTWbWeslwCO1+ThreSdaDd2o3JurnYFp5r2wftKhbw6nbe
	p2X95PwH+PUREH6b5mBuDIO/8AnUYBrjrVJkkXSx/4PGAjz3fOh/VYhDHHusIYZnI080dqSRXRL
	Zc5MoFH7e48jHrHXwttJnTdxMQh96xKJS9pEfT1IHhawyAGHvgwy2SnPiePUqm9NKbfmr2EYLm+
	uY6MyBYHdsD9zXtkhLdGLSbE5HzVmOducejskwFx/5LGIyvvZZLxXf5cKob96QLJbW8EJyhxmjl
	/4EynMy352XR6RXTQo+N5AX7nOix6gqHsFyGTtp+lxaUrSymiXHrGrXHcBPj2n
X-Received: by 2002:a17:90b:2e88:b0:369:a359:b18e with SMTP id 98e67ed59e1d1-36a67449708mr14002024a91.9.1779720486941;
        Mon, 25 May 2026 07:48:06 -0700 (PDT)
Received: from arch.localdomain ([2409:8a28:a5f:4fa1:cc65:18c0:209b:38a4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36abfe17c95sm2721993a91.0.2026.05.25.07.48.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 May 2026 07:48:06 -0700 (PDT)
From: Jun Yan <jerrysteve1101@gmail.com>
To: linusw@kernel.org,
	dmitry.baryshkov@oss.qualcomm.com,
	Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Andrew Lunn <andrew@lunn.ch>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Vincent Knecht <vincent.knecht@mailoo.org>,
	Grant Feng <von81@163.com>,
	Andre Przywara <andre.przywara@arm.com>,
	Baruch Siach <baruch@tkos.co.il>,
	Shawn Guo <shawnguo@kernel.org>,
	Paul Barker <paul.barker@sancloud.com>,
	Robert Marko <robert.marko@sartura.hr>
Cc: Jun Yan <jerrysteve1101@gmail.com>,
	Pavel Machek <pavel@ucw.cz>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Wei Xu <xuwei5@hisilicon.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Patrice Chotard <patrice.chotard@foss.st.com>,
	linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org
Subject: [PATCH v2 6/6] arm64: dts: marvell: armada-7040-mochabin: Fix is31fl3199 shutdown GPIO polarity
Date: Mon, 25 May 2026 22:46:12 +0800
Message-ID: <20260525144629.498630-7-jerrysteve1101@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260525144629.498630-1-jerrysteve1101@gmail.com>
References: <20260525144629.498630-1-jerrysteve1101@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260525_074807_836704_82940360 
X-CRM114-Status: GOOD (  12.51  )
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

The is31fl3199 shutdown pin is active-low [1]. Correct the GPIO flags
from GPIO_ACTIVE_HIGH to GPIO_ACTIVE_LOW to match the hardware.

[1] https://lumissil.com/assets/pdf/core/IS31FL3199_DS.pdf

Fixes: 737929191283 ("arm64: dts: marvell: add Globalscale MOCHAbin")
Signed-off-by: Jun Yan <jerrysteve1101@gmail.com>
---
 arch/arm64/boot/dts/marvell/armada-7040-mochabin.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/marvell/armada-7040-mochabin.dts b/arch/arm64/boot/dts/marvell/armada-7040-mochabin.dts
index 6bdc4f1e6939..cf690a85cc2a 100644
--- a/arch/arm64/boot/dts/marvell/armada-7040-mochabin.dts
+++ b/arch/arm64/boot/dts/marvell/armada-7040-mochabin.dts
@@ -236,7 +236,7 @@ leds@64 {
 		#size-cells = <0>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&is31_sdb_pins>;
-		shutdown-gpios = <&cp0_gpio1 30 GPIO_ACTIVE_HIGH>;
+		shutdown-gpios = <&cp0_gpio1 30 GPIO_ACTIVE_LOW>;
 		reg = <0x64>;
 
 		led1_red: led@1 {
-- 
2.54.0


