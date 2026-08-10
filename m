Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63168C5AD55
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Aug 2026 14:21:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hSq7OZ0xeIWTiSwoTzu6Q+tT3niFPej9d4P2mwNfxe8=; b=gfONII66K1XDPgaFBMiP4wOwtH
	Mbpn44/XE9WCsssBgv9M/FB0YUPuii7GQXhXKh3YLBdkPFg5nlmi7dfqeOTYs1z87SwGvu9MUmgRy
	lwHgPtros9ZwhwoD6TfzEMMpRftS8f84GRX3Pzm/vcqDoBJCp5Psus0d9XTeJ6SE7pXQWG6AQo53I
	gOruEth3/pbYEJ4Q5oyxB8agjDBNJt+1LJyEh7a/sHBKqXLUy0xQ3TtZ2HV+Vz1Lq4eDlkxVSHGK+
	MLTtPGbTb2iZolFd/G4vHGqc9JFWL2XxjsHOG33AhlDeo1X0i10Rp6x01xq+ekz7ZtOvnDeFqGaZQ
	X0nLsyFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtQs4-0000000Bz8T-14hl;
	Mon, 10 Aug 2026 14:20:56 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtQs0-0000000Bz4k-3f6H
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Aug 2026 14:20:54 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-495590dde14so24370095e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Aug 2026 07:20:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786371651; x=1786976451; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hSq7OZ0xeIWTiSwoTzu6Q+tT3niFPej9d4P2mwNfxe8=;
        b=Rfv7Gqs1hn/Op4qS+ChpID9gS6oT6D5r4LLoaV7R1zAd8dQiOxF0ICWao4LOWYoDAG
         sSNn8Q/pejPjyxB2Un12X7RLgDPCFNq+kp5vxba1W4VMZWYgUtORa6b7xYHzDlM0Vua7
         2iulXUaRmjfgnCm98p6RlGmpfNg+pOyGEjZxK08G2acMq2Sw4V5suNch9zk4rnuk9sHX
         mIV3grwjBFUzvq/TvEWrVvW3R0Ijs1eSgjsM6nU01TXM5KwPQRrPZvCWRbPVhjfI0E77
         CHKzFtgAjgCriEXVeF/y+11yBDcETgKtod0yeOwltNP3n/hjt8WQ10cWKgtGGmV7t/EU
         ZZpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786371651; x=1786976451;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hSq7OZ0xeIWTiSwoTzu6Q+tT3niFPej9d4P2mwNfxe8=;
        b=aUanYa3gBCNJZS76tGisy9Wwc0NH+fLSj1q0Rkc4TZquSsPabKQdsVcHl0taTBEKR+
         EZpK9YA8ZLHkwksxeBtb3g4EVjots8Lchpl4HCczQa+TR44ZikeYL9sAys25DP1YvdFx
         lrVnnJKhMChmeRbgHplinmSVIDAzP+PpSAGp1D1v6zBr8lIGWW1ljLbsDP3hH6RrPlSn
         ppSWMWkw5Wt3gmMj+3Gibl/Nxn7A+tQfxxv+KfHfH8nx3eVk4Al4Z7rU1l5k/Drp7BU1
         gFfR0EiWGUuUal+fY8hme1Al7qZrbpCuyt7k5wbyuxCrZ8eCbTj1nbD2pJ9arBJmwOrI
         /37Q==
X-Forwarded-Encrypted: i=1; AHgh+RqJNzn9OvSQ2IOjnq3VUqrxPaBhjGehRAJqgZGwYTfZ3dn/kT/SRoU+dnC0kXhM/KoxO9c0rrrvNKT8YEB6UK8u@lists.infradead.org
X-Gm-Message-State: AOJu0YzVrnFigdLcttktsfergIt9PANdXFmcFi3lkbjNOauHlCN0vZnC
	JWfdarO97qcpg473CoxHC5QTNELmNvXK+Du4sdRTZbFwiYR/1IS/n3FW
X-Gm-Gg: AR+sD10L63teAKSqLvb815xDswE5wTRb3nZsGwAmSQo0Tc5LKshTN+FUBlnpqJEDQAf
	YASqfj4k0e8tEBsm30fLeQIV7L5aKLlNQ7F5FylS19xvmaRXZMp6tlPDXXtNeNohbGNFW6hJaxW
	aK+/8SFBMx4wE7mOYLa4GNHjfyuQZAKIIRN5BbJxL/xe6MGMYauPYwhyuDQ2y3XtmIAbui8VyWi
	LTZCSPKoc/YSASEpR8IYUfqCLIUECnnqhiCaU40Zpz6jgVVjYEaVUKzFTNv7WDloGqm+Y0omXeW
	EMW07+QA1e/BSSjnzFzyblmYzleITuTxFnwav06UoFeccomLvm9TgWpIfPhL0SLhtsdFd+T03hx
	cR0MmnJrNzE19tGK7/MHWMjqgpVxlJgYZ5gTub5f2TnGoZm4JNXsNa9NSG5FOGsapPcTPeIw4VZ
	nA7qSXmEUwSQlZvW4aGKU7anLJtXhpXRAFi7ZcOc7yi36F01wL16h4JG6xgD+BTKCzw04=
X-Received: by 2002:a05:600c:4ed3:b0:493:e983:806e with SMTP id 5b1f17b1804b1-4994e72f795mr589286845e9.3.1786371650925;
        Mon, 10 Aug 2026 07:20:50 -0700 (PDT)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4995919df87sm354413055e9.6.2026.08.10.07.20.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 07:20:50 -0700 (PDT)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Stefan Agner <stefan@agner.ch>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Francesco Dolcini <francesco@dolcini.it>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/4] ARM: dts: vf-colibri: name the SODIMM gpio lines
Date: Mon, 10 Aug 2026 16:20:45 +0200
Message-ID: <20260810142047.2811230-3-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260810142047.2811230-1-mehmet.fide@gmail.com>
References: <20260810140053.2793495-1-mehmet.fide@gmail.com>
 <20260810142047.2811230-1-mehmet.fide@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260810_072052_931568_9F1BAA2D 
X-CRM114-Status: GOOD (  11.78  )
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

From: Mehmet Fide <mehmet.fide@screeningeagle.com>

The Colibri modules expose most of their GPIOs on numbered SODIMM pins,
and the i.MX ones already carry those numbers as gpio-line-names, so the
gpiod tools print SODIMM_43 rather than a bank and an offset. Do the same
for the Vybrid modules.

The 99 names come from the pinout table of the Colibri VFxx datasheet
(Toradex 101355). Verified on a Colibri VF50, where gpioinfo now names
every pin the datasheet lists.

Signed-off-by: Mehmet Fide <mehmet.fide@screeningeagle.com>
---
 arch/arm/boot/dts/nxp/vf/vf-colibri.dtsi | 144 +++++++++++++++++++++++
 1 file changed, 144 insertions(+)

diff --git a/arch/arm/boot/dts/nxp/vf/vf-colibri.dtsi b/arch/arm/boot/dts/nxp/vf/vf-colibri.dtsi
index 74afc7b..04b5d53 100644
--- a/arch/arm/boot/dts/nxp/vf/vf-colibri.dtsi
+++ b/arch/arm/boot/dts/nxp/vf/vf-colibri.dtsi
@@ -170,6 +170,120 @@
 	status = "okay";
 };
 
+&gpio0 {
+	gpio-line-names = "",
+			  "",
+			  "SODIMM_89",
+			  "",
+			  "",
+			  "SODIMM_102",
+			  "SODIMM_18",
+			  "SODIMM_134",
+			  "SODIMM_16",
+			  "SODIMM_14",
+			  "SODIMM_23",
+			  "",
+			  "",
+			  "",
+			  "SODIMM_47",
+			  "SODIMM_190",
+			  "SODIMM_192",
+			  "SODIMM_49",
+			  "SODIMM_51",
+			  "SODIMM_53",
+			  "SODIMM_37",
+			  "SODIMM_29",
+			  "",
+			  "SODIMM_30",
+			  "SODIMM_20",
+			  "SODIMM_24",
+			  "SODIMM_21",
+			  "SODIMM_19",
+			  "SODIMM_94",
+			  "SODIMM_81",
+			  "SODIMM_28";
+};
+
+&gpio1 {
+	gpio-line-names = "SODIMM_35",
+			  "SODIMM_33",
+			  "SODIMM_27",
+			  "SODIMM_25",
+			  "SODIMM_196",
+			  "SODIMM_194",
+			  "SODIMM_63",
+			  "SODIMM_55",
+			  "SODIMM_65",
+			  "SODIMM_45",
+			  "SODIMM_43",
+			  "SODIMM_73",
+			  "SODIMM_77",
+			  "SODIMM_71",
+			  "SODIMM_98",
+			  "SODIMM_101",
+			  "SODIMM_103",
+			  "SODIMM_79",
+			  "SODIMM_97",
+			  "",
+			  "",
+			  "SODIMM_85",
+			  "",
+			  "",
+			  "",
+			  "",
+			  "",
+			  "",
+			  "",
+			  "",
+			  "",
+			  "SODIMM_106";
+};
+
+&gpio3 {
+	gpio-line-names = "SODIMM_105",
+			  "",
+			  "SODIMM_93",
+			  "",
+			  "",
+			  "",
+			  "",
+			  "SODIMM_95",
+			  "SODIMM_22",
+			  "SODIMM_68",
+			  "SODIMM_82",
+			  "SODIMM_56",
+			  "SODIMM_131",
+			  "SODIMM_44",
+			  "SODIMM_144",
+			  "SODIMM_146",
+			  "SODIMM_52",
+			  "SODIMM_54",
+			  "SODIMM_66",
+			  "SODIMM_64",
+			  "SODIMM_57",
+			  "SODIMM_61",
+			  "SODIMM_140",
+			  "SODIMM_142",
+			  "SODIMM_80",
+			  "SODIMM_46",
+			  "SODIMM_62",
+			  "SODIMM_48",
+			  "SODIMM_74",
+			  "SODIMM_50",
+			  "SODIMM_136",
+			  "SODIMM_138";
+};
+
+&gpio4 {
+	gpio-line-names = "SODIMM_76",
+			  "SODIMM_70",
+			  "SODIMM_60",
+			  "SODIMM_58",
+			  "SODIMM_78",
+			  "SODIMM_72",
+			  "SODIMM_96";
+};
+
 &gpio2 {
 	/*
 	 * EXT_IO_0..2 belong to no device, so hog the pin group here rather
@@ -177,6 +291,36 @@
 	 */
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_gpio_ext>;
+
+	gpio-line-names = "SODIMM_69",
+			  "SODIMM_99",
+			  "SODIMM_104",
+			  "SODIMM_107",
+			  "SODIMM_127",
+			  "SODIMM_184",
+			  "SODIMM_186",
+			  "",
+			  "",
+			  "",
+			  "",
+			  "",
+			  "",
+			  "",
+			  "",
+			  "SODIMM_38",
+			  "SODIMM_36",
+			  "SODIMM_34",
+			  "SODIMM_32",
+			  "SODIMM_129",
+			  "SODIMM_86",
+			  "SODIMM_90",
+			  "SODIMM_92",
+			  "SODIMM_88",
+			  "SODIMM_133",
+			  "SODIMM_135",
+			  "SODIMM_188",
+			  "SODIMM_75",
+			  "SODIMM_100";
 };
 
 &iomuxc {
-- 
2.54.0


