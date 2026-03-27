Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C703610AB830
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Mar 2026 14:21:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=/u4Ijto1v1x/yyoo52v522lmtI2oQ1tM97X3NpqH2yc=; b=s0s53CnRenHbeg9VwXUoGUS7l0
	GhHKezNIebGLLR/Xy9mvjW3ySjskCujlbdpBr8MpdosjA+pNKJPATZMfItCIuZvvLf72exM6WUCCB
	+R1GG6OI8uEJXlkGS0/YOJtrS7m2s6ed9KqdYnXDFkihbAoJlXBp5/hZMO+F3YK69XSh5r2bzSAXZ
	kRwIhmEHVY1ath/Ndhk6zPkpUTMt6KKI1AoXzG8Ge4aDehNtgaCkS0PhqruqBQX3hdtd7OPgOiABe
	XfKwP9Uxwv8zedjpNXQF5dEGkA6VaEvfWdRf9MQsjbHu7rh4edHhFKjZwSnKq1+m9fP/D10u6FW+o
	ku6Bi+iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w683p-00000007b96-38YE;
	Fri, 27 Mar 2026 14:21:17 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w683m-00000007b7c-1T2J;
	Fri, 27 Mar 2026 14:21:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1774621270;
	bh=DurxzAWMVmUfvm6R3SbJKFIGxokQNpjEf3KA/bMfMiw=;
	h=From:Date:Subject:To:Cc:From;
	b=ZEawk3NHlwo3wKnP6M+wy3Ui9SRkzYldPxhOqXwGRILCWD4Hosph0aYHTz2AalXyS
	 y9XVyuS6KLVCOk1GjL9xDPBE6HRqLkXc2Fw5pyTeSyEfcnUo+qY+0MUmfMbMofIzaC
	 0POwii+8yFQgtdD4ypweBgUtTQIgx+O25zwRwQ7AukTiDIm5w7kLUEu8jMyGdQbMXv
	 yEwC2wIhCje6MbPSVJTHvI1EQxmrKgLrbcGHiTAALQBjF91tt7UQo2N2t+ovtwkaTO
	 Jb3VSIbIGz3QjZiY+9As4UJW5LY0HFAhnZEUwXeSwntML7gTVtvbb1FUWVWjO10ICT
	 YCCpebG/dXuSg==
Received: from jupiter.universe (dyndsl-091-248-085-253.ewe-ip-backbone.de [91.248.85.253])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 459AE17E46AB;
	Fri, 27 Mar 2026 15:21:10 +0100 (CET)
Received: by jupiter.universe (Postfix, from userid 1000)
	id EB4D048002A; Fri, 27 Mar 2026 15:21:09 +0100 (CET)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Fri, 27 Mar 2026 15:21:06 +0100
Subject: [PATCH] MAINTAINERS: Add Rockchip keyword matching
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260327-maintainers-rockchip-keyword-v1-1-7f4634f761a6@collabora.com>
X-B4-Tracking: v=1; b=H4sIAFGSxmkC/x3MPQqEMBBA4avI1A7EZP3Bq4hFiKMOYiITcVeCd
 zds8YqveQkiCVOEvkggdHHk4DOqsgC3Wr8Q8pQNWulGGd3ibtmfOZKIEtzmVj5wo/sbZELbqdp
 VtTbzx0BeHEIz//77YXyeF4SBtYVuAAAA
X-Change-ID: 20260327-maintainers-rockchip-keyword-a805c1523f43
To: Heiko Stuebner <heiko@sntech.de>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, 
 Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1387;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=DurxzAWMVmUfvm6R3SbJKFIGxokQNpjEf3KA/bMfMiw=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGnGklVwa7R0qjXnc9g7Yo0b5P3ZBNyqNXvTC
 C3XoFxYoP3XCIkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJpxpJVAAoJENju1/PI
 O/qaGVUP/3QPlZJpFPHgPrB8a2IXh17ZrFEor+4kn0UN1XSyAXs/qkCtU4TZ+jaCndEIxH3scs+
 BBpEaRzBV2BJYBHcQF5Dw/crJ4lwXo9etFRzyYMuALMilx5Z0cm7KyEv7xiLfWLEJJqgqkuvCjV
 29NmGv+yZw3PbD3g1wB1JJ3ew21NiuLbK5R+W/JzGiiG7Tj55s+n+nBB9zwXeN1FdyfP1iisJbs
 zvI1jIg3aLxfVD/Ofsmv0cSUP1ui53N/DPypnztH01aasODjgs+vz/a2TrHUgdwYPI/GSKqgYjP
 1j0SR5obmzZoVUFezrRMN6kudVB22ufIkDMGEsOl/YpPS+R/Rz7VUeMm8j4tnj2H81BTsM6Bz/i
 ssjuKTXE3hrEtzcbNUW+tGwqN+yzG/2BxUuJcq5YV5FckoSCjFNR84lfamVTjOROhk1PvDM5mTt
 8Y1PWetEAjwq8NQnl67+hlwklgt9L/sZ4ZgLvREgUJdzN7Gtc57QWRKukoyEF+Huzf0B7K+CJXu
 QyaJ4WSgpvaII2tRijs8d30BE/Y8zg+PTRyNJFbd9fUnf64YreNvK5GXhP+7n4aun4jXoU65FUf
 7IVk7i30rCQm2MOaFzozxWGzecJ89I3P6Y/rsFBoEzlRGj/eX/ZA4ONexHsijtI42zUl7Ba8kUy
 RHArAGLRzJeC5l22M5Xs1vw==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260327_072114_567058_56A915E6 
X-CRM114-Status: GOOD (  11.98  )
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

Add keyword based matching for 'ARM/Rockchip SoC support'. This will
match rockchip, Rockchip, RockChip and ROCKCHIP separated by any
whitespace character or underscores.

The goal is to match arm64 defconfig patches, which should go through
the Rockchip tree as they right now only match the LKML and thus are
easily lost. The keyword matching is quite good for this, since it
also applies to the commit message and the config options itself might
not give any hint about being relevant for Rockchip.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
This is not perfect (people need to write good commit messages), but
should improve the current situation quite a bit.
---
 MAINTAINERS | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 55af015174a5..9f036f812823 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3416,6 +3416,8 @@ F:	drivers/i2c/busses/i2c-rk3x.c
 F:	drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
 F:	sound/soc/rockchip/
 N:	rockchip
+K:	\b[Rr]ock[Cc]hip\b
+K:	(?:\b|_)ROCKCHIP(?:\b|_)
 
 ARM/SAMSUNG S3C, S5P AND EXYNOS ARM ARCHITECTURES
 M:	Krzysztof Kozlowski <krzk@kernel.org>

---
base-commit: 2e930174c99bf75c71f898779f3ce777d7db6fd1
change-id: 20260327-maintainers-rockchip-keyword-a805c1523f43

Best regards,
-- 
Sebastian Reichel <sebastian.reichel@collabora.com>


