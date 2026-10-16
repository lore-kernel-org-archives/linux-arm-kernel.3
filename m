Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA2CCCCA462
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Oct 2026 08:41:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VZnpEzPR/fOj0NYp4YjGjICk3vVhGUGABaDpW1zvNrI=; b=Xxqex8EjDEzZxymmp9yLXD9og3
	iFDpfPS6X1C7vAFbT71HSdKHPtaif3HFshlVThjtUY4VdEo9KJmZDXW0rt4U4lVhkFhdtizOChMUo
	JDW5Idnf4KRxOlt7u8tq1pelJbtxHrRH2MO93D4BMm59uDJckrbggAMYnYOwqzgFK9v5A0OwxWaDH
	3J6yu/xja1S0s/yPJPOXY6V269JRarsH3rwWuxfNZmp9GM6fOWqioGBsIWXIXl1IOLjb3YwiyIVbJ
	Eycee6F3TRGDaga3TGVwCLxWyOriCXkg+zstG8hDdyzbKFYvGN0NPRNdREfkIbmyb6oqyMuOprlT8
	HSuu88tQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHdUv-00000002LzX-2S4E;
	Fri, 16 Oct 2026 08:41:05 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHdUq-00000002Lwz-2U4w
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 16 Oct 2026 08:41:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=VZnpEzPR/fOj0NYp4YjGjICk3vVhGUGABaDpW1zvNrI=; b=TDCyf63jVDqJWX1KAuIuDjP8Z7
	xOveLuZlZcHklsubWcZ/H02ibkgaKJatlJFfpVH9SKELBZerRiNA5H9FuYAiyMivK7zDt2sK9RGml
	jQ4/uGXqzekB+8GNqgCz3AUcigovNagujaSGW/kPZLAHEDUVpoz6S6YJZYeMA6No5POobyNndetkJ
	XSfTs882uk+tkzbDcxi61UI+NJX4zNfctUCuw1GCpJGXrQGMLS2Rs8Hki1ohDG659P/iEkA/04FQf
	lbHj3WKnVjreA59UlgHTDHcLSxVkD1K5oqWVp1PzzjC3MepqGmIZntkeDrzHe8UxfTZmILL1h1/la
	qHsmHAYw==;
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by desiato.infradead.org with esmtps (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xHdUn-00000001H5S-2AJ5
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Oct 2026 08:40:59 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-48df4f540ebso928931f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 16 Oct 2026 01:40:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792140054; x=1792744854; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VZnpEzPR/fOj0NYp4YjGjICk3vVhGUGABaDpW1zvNrI=;
        b=NWqnOn3jYI3Sa6AUFwiqtQVHl2xDrRt7y/KmlXEmKcI9mH3RT0bNWDOo/Vji0aBy/J
         uSZwpm6x9lN1KmmgKRUbE+UN/Sze9BmzHCegvjWGRr80KM2ZmcPZyNeMirSkPGNKaL4Z
         620QnO6J/9AYmD8h4YZohMTAw4LnuuxgNWnSz/j6gzpOkRv/DvyQKIa7eQEvXfy5u/Zm
         Zd7DNrEcp6Z4gTahTz4FD99+Xad9bU01aU1bMhQ2uHpCDIZpJ7dNGa1Z9fJRoG8kS/0U
         kkpQ20mHZrJuj6dE8yDzmCA+OIXTNFXv9oR92bLrDvU65HHrzBIEBb1vmyX6zDQR9jQl
         eayg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792140054; x=1792744854;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=VZnpEzPR/fOj0NYp4YjGjICk3vVhGUGABaDpW1zvNrI=;
        b=Q/G+21j4BW6mJeg3mcnM7iHD2Z9wugfxs/TjuPOwsgydNCRg2eZqF6SEZ8i7I8aNU+
         e1Ezis7pN2woq3DZgk0s7YUSre+uKRRt/DvwPwWoKBBzG+r+Ljv58I2bE0OklJZ2xOEi
         fE5WmRNloqFGNVF/YtZLCSWh/g+wmRhISzo/+cCrBp9/a5DDz5RWIkLf1r03p4vlP2qk
         OFc135ET/pM3mhnxgYLoKbCB3QVYXM5lWrBUzXpdbevF7yLtFpuvCK+76Dg3xRBxf/6V
         +IShzq0Ds5HadRS+9lwd9aRgwJ5wuYOhqPNUUjojbbbUGC5kNzesnpAkfzrtOXQ+gynb
         i5DQ==
X-Forwarded-Encrypted: i=1; AKwUvByXDEPB/BLiNh3HSP9vv7mJFu7soaSY7fqMzq0QpIkSPgx5jz9kyMCIiunXywlD1VbjrwMgLoXNX3lUjtjYLrz3@lists.infradead.org
X-Gm-Message-State: AFq9FYKjIKuxeKXfziQg06L7Kn74uuqTOBhTuP/jVG+pNLyuNjGGM7s2
	XqvmDsxpvh07JEErk+JJXVyzbwFsMP5igqU505ygAy38uhBKoqg0HfHk
X-Gm-Gg: AYBFou0Opomyl5lHIiTo5AtJz0/0jtVeroW1vnmRchiToy7dROtmVy7XDrbri+p1Zdn
	mgSQcjAWia0I3z4wuV3Iv3JHQG64Gy25XsDx1tHunlow61n6BnJ6zvdy7KGhfmfHAqAWxDGJnko
	32EP+epj63BAQoOY2Thb1spZ1euoByhISKNWjyj3Z1h8bpeQluzzQfMUf2st4368zTZ7VMwy9bJ
	XXKiNWF76liq7QkHeN91FYw6zr/ArRyVMI6tS3Y1sxIgC5uQsDb0ogS71/5QACLfAgOjx3e3Fzu
	/2/tOxyMVw4MiCKeuTs0BYm0CiAKaM90dGIgIGQblE1dgrUYyPEMsehMjyHkWHSN2iRlvfXMkqc
	r4CBO/kezYsc9Lvp4BoJkxPDfd/KSxdv0hcZH5KuYunLh7U5+HZ+ki4VwHLAACXcNNdzxHSS0m2
	CmCmd2WEOQNKHgkjEGKx84BeTN2IuTZEzk1FHVrHBbzD9IcG2imd3P4dG/sjv6O2YhhYMmEA4Kw
	fVA4RMJCFOtzlji4lUosuInlHxkZuW8kyC2c3emwgbkVAhz0toM+eb3DKymPtFeDf/G1ySMc7Qo
	IV0fZVe0wbM1HgqUTYd+Yw==
X-Received: by 2002:adf:fc09:0:b0:48b:451:4f19 with SMTP id ffacd0b85a97d-48dbacfddb5mr33079053f8f.51.1792140054238;
        Fri, 16 Oct 2026 01:40:54 -0700 (PDT)
Received: from Lord-Beerus.station ([93.66.71.207])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd5033a2sm3715233f8f.45.2026.10.16.01.40.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 01:40:53 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: Frank Li <Frank.Li@nxp.com>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Luan Rafael Carneiro <luan.r@variscite.com>
Subject: [PATCH v1 1/2] arm64: dts: imx8mm-var-dart: Enable WM8904 DMIC input
Date: Fri, 16 Oct 2026 10:40:10 +0200
Message-ID: <5309337578f99886c804c8e4ee82643574f1c19c.1792139809.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1792139809.git.stefano.r@variscite.com>
References: <cover.1792139809.git.stefano.r@variscite.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261016_094057_852496_642B1E60 
X-CRM114-Status: GOOD (  12.11  )
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

From: Stefano Radaelli <stefano.r@variscite.com>

The digital microphone data line is connected to the WM8904 IN1L pin,
but this connection is not described in the device tree.

Configure IN1L as DMICDAT1 to enable the digital microphone capture
path.

Co-developed-by: Luan Rafael Carneiro <luan.r@variscite.com>
Signed-off-by: Luan Rafael Carneiro <luan.r@variscite.com>
Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
 arch/arm64/boot/dts/freescale/imx8mm-var-dart.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm-var-dart.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-var-dart.dtsi
index c5f0e22f549b..183b4f7af009 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-var-dart.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mm-var-dart.dtsi
@@ -300,6 +300,8 @@ wm8904: audio-codec@1a {
 				   /bits/ 16 <0x04af 0x324b 0x0010 0x050e>;
 		/* GPIO1 = DMIC_CLK, don't touch others */
 		wlf,gpio-cfg = <0x0018>, <0xffff>, <0xffff>, <0xffff>;
+		/* DMIC is connected to IN1L */
+		wlf,in1l-as-dmicdat1;
 	};
 };
 
-- 
2.47.3


