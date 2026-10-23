Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F352D606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Oct 2026 17:53:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=IP0S0QrO;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=esV9rDl8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=YQS+tCL9sVo9f7fH8XlWP/aawkwSF9CY9qYv7xaHfik=; b=IP0S0QrOw8a83vzCJYOJpPYMYH
	tRWwHhdqntAoefYJ+dClmpNCHCXvG/4YliVRl8Eg6q+go0TNZu0VQ93TGO3U8dpvnhWYUlqbcxCjP
	/rkUNONLZBKKtsVLvfz6ML2rhrRrYOnPpsjd9c8FAP9ZejhyctEy8w69FrNWufF2X5pcGOf+eR6eI
	ppJFLyHLr4FGISqkIW89gbz7qH5G5HTIyagJt7G+dE5SAtNhKupI0qLXXIODe1x94jAKsaqjsM3eb
	UrjX6v9lE9Q7h/kqHzP4p+Z2HfdNcDxPF8oWLhiXPNXV79soL1gCSpKrdG2FeyM0PS1nPZ0DYVB22
	EQJHEg+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKJS7-0000000Gl0y-12tY;
	Fri, 23 Oct 2026 17:53:15 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKJRz-0000000Gkx0-1HIY
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 Oct 2026 17:53:08 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-48e00eee27dso762206f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 23 Oct 2026 10:53:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792777985; x=1793382785; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=YQS+tCL9sVo9f7fH8XlWP/aawkwSF9CY9qYv7xaHfik=;
        b=esV9rDl8HBBNsn7TxOiX0xMk1iAdV+SQIc/SsorkAiPfobKJYTeC6ed5YEzCjeSpag
         2vxQhL9FzR64ro/IWlgLICiZUr1yN8MvxCtSyvdZgZ2ieOZqJ2mYOuB9Uu3/POA544TV
         0IjhuPTDNxHi22JahR5sP0YjcGCWoBF197d0MV3KB67l7K3Ar4+GM4gkVsSHlnFAk07X
         zrwAy5C24L36jeBCqOOI/dE7E+dNSArrOAK+kdcgmc6yDT+TswvpCBOCCk0kvjQGKtzJ
         usvom4Y38ZZc1ufvB/ZaCuf++zV2zAJCOq4npbi2dTjuiX8K1Qen9n0R/bmxjGjeZ2+H
         Tm0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792777985; x=1793382785;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YQS+tCL9sVo9f7fH8XlWP/aawkwSF9CY9qYv7xaHfik=;
        b=LmWfif09giQxSPpNQoZBv/sEWQietkQA0wY50BbYUXqdvWe7tJ+uc9dmoQP9mi6Vc1
         qAcDV0na8BTYMQT+LE6GqMSQ5WqVN0xXGyEL0sRFm8kS9nPWSh/bXMXdzAY1z8SdxHZf
         Y+Kk2AAxo0Emrkxi6oIj+gt2I5yIdcLui2VcoLTQXg3yfk2MK5sNKGqGd+4VYrcHBQQc
         f3uKoSr6ZWFj9hRF6TTZRFNOexVGKu8MZaKYuDEvIfuDbDwcif+/l6TAq+W7W60BUbo8
         0ZtvvbKnok48YtJ6cA6T+HZ12nGUrmny6GLi7DMedolJ9r/bfFiqY61Xvp1C+YhPTeOT
         tmzA==
X-Forwarded-Encrypted: i=1; AKwUvBw2EM4s5q05oaK5mP6ttdoRvqel6cAPyoTI/mixQPjsMvYS9wulwZ+Zae91VBDkxHKFKJPLO4GI+t7YCf98Gdp9@lists.infradead.org
X-Gm-Message-State: AFq9FYK7mi3PkBF3py0VW0TuesZ5tyQxLhrYrsv4XUR1osktg0Jg8+ny
	AclUhpABc9UkgSK5+WSMR1awPwrNOebT+OAITDAmVUVX9jOS/bi1MrqM7zitf46f+AQ=
X-Gm-Gg: AYBFou3pN0zSfsMKVlrS//nxAnOYd5lhppReBApUa2rZUwuuiqWHYZmGyjDpzpriK56
	+HeNjqG0tUJg5pO2zDCKe89NcbrZo5jfyKbaHLzIa9DqMa24dCNlZl7jg4Z+VAF06C4asJEpBjO
	yWu6RGBQ6PV3qn4PkE8uhp1TaKXEADAziQilzuW6UqAxZzaQ7IDIfVYw91j/7Cm9SfXoClBf5CA
	vNbsYhiRhaTqe+TKu8nuTSk9EsroF5wR1z2Ywyf4NkmIMhDcUBCusecfwHiRHa+u0RfU0yeyoJ4
	R/p74GVQ0fWgTXqPXY66uJ7p7vWVW22wBH9JtCIfjGpkxmX8Pobn+ALPWb4fbNmU7OxVSIqZfrt
	HDq2EELtx6FGDsDJpSWdsn0O87SAf8Y1wYhMnM6/D8ogktV6u5PDITds5Sny9HShYU40fPnWmmO
	KQaFvsggT9nd+AEvzZaUmL9Nb8wvtz4Jhi21+vDatawI7vf6Z+Hkc+bywoJ/bgVc+Pe21TWvy+r
	sZQpJBoxe7gv/dKHy/JYZLU1qc+w4tb4SGFRGRY8UHKedKuLAUaGyAVqbexYYu3wCne
X-Received: by 2002:a05:6000:184e:b0:48d:f855:d1e0 with SMTP id ffacd0b85a97d-48e385bf552mr4544912f8f.57.1792777984621;
        Fri, 23 Oct 2026 10:53:04 -0700 (PDT)
Received: from mikytux.basilicata.nnxx ([195.32.70.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3d3ee6bdsm1135313f8f.15.2026.10.23.10.53.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 10:53:04 -0700 (PDT)
From: Michele Salerno <mikysal78@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Michele Salerno <mikysal78@gmail.com>
Subject: [PATCH] ARM: dts: marvell: armada-385-linksys-rango: fix wifi card resets described as LEDs
Date: Fri, 23 Oct 2026 19:53:02 +0200
Message-ID: <20261023175302.2102555-1-mikysal78@gmail.com>
X-Mailer: git-send-email 2.47.3
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261023_105307_364527_4924AA5C 
X-CRM114-Status: GOOD (  11.94  )
X-Spam-Score: -1.9 (-)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-20.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On the WRT3200ACM, mpp45 (gpio1 13) and mpp46 (gpio1 14) are described as
the "wlan_2g" and "wlan_5g" LEDs, but they are the PERST# lines of the
2.4GHz and 5GHz 88W8964 cards: driving them low holds the card in reset.
With a LED trigger on them (e.g. netdev on the wifi interface, or
phyXradio) the card disappears from the bus, its config space reads
0xffffffff, and mwlwifi logs "adapter does not exist", "buffer is NULL for
tx done ring" and "can't get hw specs" until the next reboot.

Drop the two LEDs and describe the lines as the reset GPIOs of the PCIe
ports they belong to (pcie1: 5GHz card, pcie2: 2.4GHz card).

Link: https://github.com/openwrt/openwrt/issues/9517
Fixes: 41c865209626 ("ARM: dts: mvebu: add support for Linksys WRT3200ACM (Rango)")
Signed-off-by: Michele Salerno <mikysal78@gmail.com>
---
 .../dts/marvell/armada-385-linksys-rango.dts  | 31 +++++++++++++------
 1 file changed, 22 insertions(+), 9 deletions(-)

diff --git a/arch/arm/boot/dts/marvell/armada-385-linksys-rango.dts b/arch/arm/boot/dts/marvell/armada-385-linksys-rango.dts
index 4ab45f2..5209e06 100644
--- a/arch/arm/boot/dts/marvell/armada-385-linksys-rango.dts
+++ b/arch/arm/boot/dts/marvell/armada-385-linksys-rango.dts
@@ -63,20 +63,33 @@
 		gpios = <&gpio0 21 GPIO_ACTIVE_LOW>;
 		label = "rango:white:sata";
 	};
+};
 
-	led-wlan_2g {
-		gpios = <&gpio1 13 GPIO_ACTIVE_LOW>;
-		label = "rango:white:wlan_2g";
-	};
+&gpio_leds_pins {
+	marvell,pins = "mpp21", "mpp56";
+};
 
-	led-wlan_5g {
-		gpios = <&gpio1 14 GPIO_ACTIVE_LOW>;
-		label = "rango:white:wlan_5g";
+&pinctrl {
+	pcie_reset_pins: pcie-reset-pins {
+		/* mpp45: 2.4GHz card reset, mpp46: 5GHz card reset */
+		marvell,pins = "mpp45", "mpp46";
+		marvell,function = "gpio";
 	};
 };
 
-&gpio_leds_pins {
-	marvell,pins = "mpp21", "mpp45", "mpp46", "mpp56";
+&pciec {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pcie_reset_pins>;
+};
+
+&pcie1 {
+	/* 5GHz card */
+	reset-gpios = <&gpio1 14 GPIO_ACTIVE_LOW>;
+};
+
+&pcie2 {
+	/* 2.4GHz card */
+	reset-gpios = <&gpio1 13 GPIO_ACTIVE_LOW>;
 };
 
 &nand {
-- 
2.47.3


