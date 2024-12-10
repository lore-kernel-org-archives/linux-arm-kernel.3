Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29E59E77180
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Dec 2024 19:44:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NFQJq6eZhNqtGGYjTvcs0g3D5ctUjhX2pcBAPWKzWqo=; b=R/IhQBbsb2KYhUU28jUZA31AUU
	XgRek9m+ckB4ejbnPINZTRUGHdp0+aTqbz//H/iKbyWKmk/zeaQhvyTJ0+PxNet+zFy2C0nNUpoSK
	/Y9nxfwGfT6ebz3GVLepoRLdh8XGwvy3uJlsJdvA0kkPSfu2bHdt1Ndqdls1YHbyiFoGB6qWgLTDL
	Uo7GdEM2w/prL3loXJB0eeqJ8w7+HFJV1Y/d7suwdo2M7POQx7uDTloJj8NJKIV7vlsKiD19mKq7u
	QRlRMZjDS3boV8XE0j6NX86KbCsemJqP7yxuf3+jIQIVl6iPfa45rkE5BAMXF/Ony2ismSQGsM2kI
	ODjYRlrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tL69Y-0000000CYWC-0dp9;
	Tue, 10 Dec 2024 19:44:16 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tL665-0000000CXul-2l44;
	Tue, 10 Dec 2024 19:40:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1733859639;
	bh=/4RZbyvnAxjSwIetXPV5ahVyR7xjhkpwwsXpSPAIkEE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=EAJpdy7ZKyFsUzWj4TqXBOoMD73civK+JSFUj41MBVuJE3TACUTpcmKpRktQNmdmU
	 xcvYDsbKVgcLi8fJryVvf6XsA5MM4OjzBNzbXXG4eXghNRw6oLwV5ow1uDVkwgEqPc
	 pQjE9935rxiSJYqRDUIQSv0r8LGvz+s3GoUK0kQf49CY8t4qcXquiyZHVNiKJricY3
	 TVBO66JobiEdc2hTJdjsBCUkhZQIBseaSEHPxsFlEQm9gO+81Jk35RO+54nO72Vbyn
	 2tsHlSaMNPoqZQRbgeFz/nrEEQzAqjupVeekOQ7XUGH6OBSbm5PnyMP+aqIMvImVYs
	 AbCTgdzZgYzyg==
Received: from shreeya.shreeya (unknown [110.226.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: shreeya)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 317F917E37EB;
	Tue, 10 Dec 2024 20:40:10 +0100 (CET)
From: Shreeya Patel <shreeya.patel@collabora.com>
To: heiko@sntech.de,
	mchehab@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	p.zabel@pengutronix.de,
	jose.abreu@synopsys.com,
	nelson.costa@synopsys.com,
	shawn.wen@rock-chips.com,
	nicolas.dufresne@collabora.com,
	hverkuil@xs4all.nl,
	hverkuil-cisco@xs4all.nl
Cc: kernel@collabora.com,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	shreeya.patel@collabora.com,
	dmitry.osipenko@collabora.com,
	Christopher Obbard <chris.obbard@collabora.com>
Subject: [RESEND PATCH v5 1/4] MAINTAINERS: Add entry for Synopsys DesignWare HDMI RX Driver
Date: Wed, 11 Dec 2024 01:09:01 +0530
Message-Id: <20241210193904.883225-2-shreeya.patel@collabora.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20241210193904.883225-1-shreeya.patel@collabora.com>
References: <20241210193904.883225-1-shreeya.patel@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241210_114041_852774_9812E1A2 
X-CRM114-Status: UNSURE (   8.25  )
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

Add an entry for Synopsys DesignWare HDMI Receiver Controller
Driver.

Reviewed-by: Christopher Obbard <chris.obbard@collabora.com>
Signed-off-by: Shreeya Patel <shreeya.patel@collabora.com>
---

Changes in v5 :-
- Added a missing closing bracket for the email

Changes in v4 :-
- No change

Changes in v3 :-
- No change

Changes in v2 :-
- Add a patch for MAINTAINERS file changes

 MAINTAINERS | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 7700208f6ccf..3960c3ca1849 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -22768,6 +22768,14 @@ F:	drivers/net/pcs/pcs-xpcs.c
 F:	drivers/net/pcs/pcs-xpcs.h
 F:	include/linux/pcs/pcs-xpcs.h
 
+SYNOPSYS DESIGNWARE HDMI RX CONTROLLER DRIVER
+M:	Shreeya Patel <shreeya.patel@collabora.com>
+L:	linux-media@vger.kernel.org
+L:	kernel@collabora.com
+S:	Maintained
+F:	Documentation/devicetree/bindings/media/snps,dw-hdmi-rx.yaml
+F:	drivers/media/platform/synopsys/hdmirx/*
+
 SYNOPSYS DESIGNWARE I2C DRIVER
 M:	Jarkko Nikula <jarkko.nikula@linux.intel.com>
 R:	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
-- 
2.39.2


