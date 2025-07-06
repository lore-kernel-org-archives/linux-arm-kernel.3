Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C230EC83F03
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  6 Jul 2025 21:57:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RvZgwDhd8R+31/oVgTrgK7V+PUBtSsqxq+ciLntuUVw=; b=elBuyLqRrgi2bpyqcB86uszjSy
	UILgqcg1TiBh937I18CQ0gUQ2jvPsdUXdSnIY+Ww/yivYrVOYqg3kKPlaqCm+IF0K3Ab7C4kNkaTT
	v6QKareBNtJ/U9Ulnt66FTs9roAjI/08FzjZ68DnoOl2sD2c47yRsB2+nKHa9Y65S49Q3aEKgCBdy
	5wa8qv1taT3E5x9TAHjA8JfSVyzKnVuzBmL5izKJaxuLLuKQJEcy+7vNI0LLd6lH403gzlVLgCI9C
	G4GJVn37cmQ/fE0NilT/GWK4hgQ678kcyHhmWnCEo4PXj4GyajVvmTh6kRS08dY6NY7yuRbmLsCzP
	Kh+RvLNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYXMt-00000000sBf-3Ti4;
	Sun, 06 Jul 2025 21:57:51 +0000
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYX6w-00000000qoB-15z6;
	Sun, 06 Jul 2025 21:41:23 +0000
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-74b52bf417cso1511921b3a.0;
        Sun, 06 Jul 2025 14:41:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751838081; x=1752442881; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RvZgwDhd8R+31/oVgTrgK7V+PUBtSsqxq+ciLntuUVw=;
        b=RSzXbJUy7H9EtGGmpsovsl4Aexro9ksKvFKknmmx5OIx7bU8zVFC04uUh773DmNfoM
         lgpvznZKpufU390RxwE1hzap8Y72O45u3+VjVu0ZqdDDOENjBrLsi72Fl+z6mdsHtt7P
         QNfMJmplHXeSxtunafsC4xWxZIKR10Xxwozmn6fWw/iktTIYKhjkcgCWLg4XgU1i9UJR
         XDGiQhpuvYkGm99OydwmNFuMiEuWuEw/OW0abylyq5ko4QSWV1nn3UOU6BABK8XU+5CP
         DXk5BiYe8cVqYUagzm1HOewf8sbvQYRL/58reCRglUr7ivPiuqYJPOSQCRICQbumXtZb
         CFeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751838081; x=1752442881;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RvZgwDhd8R+31/oVgTrgK7V+PUBtSsqxq+ciLntuUVw=;
        b=ufo5s2wWLuXhzxGj1ok9JKaHmLfiJkDzdFlF/ZG4DAlfDSmnJh+nT4DZyVJPhnz/Nh
         HE9ThcGZtO7C9DH1ALMssE946Jb1YsGNj5bJV1gQt5yq4SoZWgFUz8g/nZmHyBr8CQ4S
         jk9coXC5lTQMcX4mRk8aOqb77BcOVOXmYS7hHmn1ixRC+TGSLg0s6zZhD1MLpV9FUYCU
         ysMrmL7OrXknFIsgUOZ/7qqzuPEtCFdwENkRX11VGiAmIJiSWph4Knq//2zeLbQmO71m
         HGwaXeYsqzn1sV9NCi66H4NzfBbyDd/QAmnwldj1Yuz+1MREmEGXtYiSBmPhz5xy0pLW
         2UWA==
X-Forwarded-Encrypted: i=1; AJvYcCUGPpx2OGoDkjel52BpGPMR2OVuWsj71m9feDgNMdBhcB5LZR6+L9B2v4ATMkbrGYWm/8KS4FkRlgaaLE8dhDc=@lists.infradead.org, AJvYcCVPS/MQf0e334VXpTsGhrOO2eB5YOPVHunbF6VjaN7Cjs5lA65HVXIVqQOnSw6s4xRG5/CQZwYgGHj6PESCEd+N@lists.infradead.org
X-Gm-Message-State: AOJu0Ywx7+CFGU6kbVfrLp/AHxLY03d0QV65nVxi0zDwWQLoX7vXFemY
	wpYR34p8QWyqTCspX4ktFpQk4bJJ5vwQsomzTWxaH3mWBp+p0KXsbAoN
X-Gm-Gg: ASbGncvHnGzlHB646Mxpja1OeLekCKM/kE+QoGdFEy2q3TWTN7P30ShgBYfPTFpdVyn
	mGhvjgivSd/s1rR6vDitITxpNcjYmmohbbSToNfksyOiKY1HIA4hOeUwYottHiCgSVmVVOBO3dG
	nse5i8R1gKwAXOOL1y65p1QdmHTTvIOeLLZ/BVLycyZHkD0KxQsSI5CFMcgwED4EtTESX2uBmSY
	EmZfoDWVkADM3eueDlvd6ducXKFyYc74/4OJUB8cQqCnFE34k/NqW+QCGo39JNvp0V3osNNHmku
	NExkTL2QHpeLP+/iWWXq1IuWwaCPoOxFwciQ+5pqMqI=
X-Google-Smtp-Source: AGHT+IEphJnWnMpJ5IZuXkzIdAl/4PySIfNR7SCiDO+NvDhnTpiFTe9sAWW/ka2hDv/gm3VHHolLYQ==
X-Received: by 2002:a05:6a21:3282:b0:21e:7d1b:4401 with SMTP id adf61e73a8af0-225b9484b0bmr16419609637.22.1751838081538;
        Sun, 06 Jul 2025 14:41:21 -0700 (PDT)
Received: from archlinux.lan ([2601:644:8200:dab8::1f6])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74cfad75020sm4126416b3a.109.2025.07.06.14.41.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Jul 2025 14:41:21 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-wireless@vger.kernel.org
Cc: Johannes Berg <johannes@sipsolutions.net>,
	yangshiji66@qq.com,
	ansuelsmth@gmail.com,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Stanislaw Gruszka <stf_xl@wp.pl>,
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-kernel@vger.kernel.org (open list),
	linux-mips@vger.kernel.org (open list:MIPS),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Mediatek SoC support),
	linux-mediatek@lists.infradead.org (moderated list:ARM/Mediatek SoC support)
Subject: [PATCH 6/6] MIPS: dts: ralink: mt7628a: add wifi binding
Date: Sun,  6 Jul 2025 14:41:11 -0700
Message-ID: <20250706214111.45687-7-rosenp@gmail.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250706214111.45687-1-rosenp@gmail.com>
References: <20250706214111.45687-1-rosenp@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250706_144122_297910_A95B535E 
X-CRM114-Status: UNSURE (   9.21  )
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

MT7620A devices all contain a wifi device as part of the SOC. Add it
here to get it working.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 arch/mips/boot/dts/ralink/mt7620a.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/mips/boot/dts/ralink/mt7620a.dtsi b/arch/mips/boot/dts/ralink/mt7620a.dtsi
index d66045948a83..460164bdd430 100644
--- a/arch/mips/boot/dts/ralink/mt7620a.dtsi
+++ b/arch/mips/boot/dts/ralink/mt7620a.dtsi
@@ -62,4 +62,14 @@ uartlite@c00 {
 			reg-shift = <2>;
 		};
 	};
+
+	wmac: wifi@10180000 {
+		compatible = "ralink,rt2880-wifi";
+		reg = <0x10180000 0x40000>;
+
+		clocks = <&sysc 16>;
+
+		interrupt-parent = <&cpuintc>;
+		interrupts = <6>;
+	};
 };
-- 
2.50.0


