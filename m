Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0E1BCA5FC4
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Sep 2026 18:29:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KpB2+GyR7l2sJC/XKhc+c/PRGCKpvMsfLkDzPQSlzK8=; b=nUKA/OJZ4PsN8EgXaF187vnihe
	ZcTELWqggOZ/CMkR+C2FUrrmbDNqKi9wm+KvB+yB/0BX0/mHKJQPPCZ4LYJQ5PvPUu0CV7sgjJpyk
	dP1bMRPU1IOaB0DtgOwQkr0Vwd1eyImKsXOWJF+gfTIjc7jyUclyx4QObxYRaYQPtg2+iA063wGKm
	7LQhdn+WIgNPlgWvz53NCjBUDiPkj5HYpIAtt7NLybkoinekO+8eOhLQvdzFiVb0DfUOnHRkhouTI
	X61/lEwwuDP8suofnrkDfjunMslBuVe+hNW3XF4hbint5aCVA8hOkcU+KRrsBSGrnTMVisFpLG1U/
	38mtJGKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBxXd-00000006kYI-25mw;
	Wed, 30 Sep 2026 16:52:25 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBxXY-00000006kWa-2Mck;
	Wed, 30 Sep 2026 16:52:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id DFFAF6053A;
	Wed, 30 Sep 2026 16:52:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5A797C4AF13;
	Wed, 30 Sep 2026 16:52:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1790787139;
	bh=f/PpISk6g+62l+NZnebi+m8lkyLjsj4FeTpom7vbKjQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=sY0pnqyF8/s6VHRIeJv7BYYFbow+9oPipA5lk+cKbbk/AyRwZq0iPBkiRWJb5D/mw
	 RGQBu2ZX2XSPrqLqrcF1De7TMcZ6gK223XxSTYLiIjkYa3hIJPZgoi6jBs2G8hobw7
	 ws701xHbcVC57dkb5R74szktohsobdrswe3KppD+vdVBHSV55mxbtvKM7N/Mi/lDgV
	 N9ysUpWVcZ7+0ekwDHTMTmrm7EeQshtlW0NNAUmKV3D4E99xfHoWbRzmx3x3M7xmap
	 JbgW4k6qaxp263Gnlcc9SwOYgFjEB+9nny1OvdBsTv5VGldJFkRHm1zfC1thGqnKn/
	 pYBBRCQDBoixA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48DDDCA5FCB;
	Wed, 30 Sep 2026 16:52:19 +0000 (UTC)
From: Igor Velkov via B4 Relay <devnull+iav.iav.lv@kernel.org>
Date: Wed, 30 Sep 2026 16:52:15 +0000
Subject: [PATCH 2/2] arm64: dts: amlogic: meson-sm1-odroid-hc4: run the SPI
 NOR at 40 MHz
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260930-hc4-spi-nor-v1-2-9a3351e2984e@iav.lv>
References: <20260930-hc4-spi-nor-v1-0-9a3351e2984e@iav.lv>
In-Reply-To: <20260930-hc4-spi-nor-v1-0-9a3351e2984e@iav.lv>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Christian Hewitt <christianshewitt@gmail.com>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Igor Velkov <iav@iav.lv>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1395; i=iav@iav.lv;
 h=from:subject:message-id;
 bh=EpGmYpLlMviVEwXG8x1TChGxSFfpKyMpVV1+YR4B4L0=;
 b=owGbwMvMwCVmNH1q96v4SmbG02pJDFl77RwN7TTrC1x5sp0jGAySzj6IuL8++L9j51HN4mebL
 dffPMLSUcrCIMbFICumyDLhkMatjCVX//p7mD+AmcPKBDKEgYtTACZSfojhf26vZp+N08/3J6ea
 mM6a5NhaxmwYmqr+Yu+zNctWLzS+U8fwz+7+31+tU4/uPjcne4p3tcAhr8PauWK30/wkUp1V3to
 t5AAA
X-Developer-Key: i=iav@iav.lv; a=openpgp;
 fpr=90C228DA68A4D5FD4F4837E03297958BEA5F7903
X-Endpoint-Received: by B4 Relay for iav@iav.lv/default with auth_id=1060
X-Original-From: Igor Velkov <iav@iav.lv>
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
Reply-To: iav@iav.lv
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Igor Velkov <iav@iav.lv>

At 104 MHz, reads return corrupted data: bit 0 of the first byte of a
transfer flips from 0 to 1 part of the time. The same byte read as the
second byte of a transfer was correct in all 100 reads. One 4 KiB block
read 200 times came back wrong 157 times. Writes are unaffected.

flashcp verifies while it writes, so a bootloader update erases blocks
it should skip and can abort halfway, with the flash half written.

The Hardkernel vendor device tree for this board uses 40 MHz. At 40 MHz
the same tests pass: 200 block reads with no mismatch, and 14 flashcp
runs with no block erased.

Tested on ODROID-HC4 with an XT25F128B.

Fixes: 7178f340e929 ("arm64: dts: meson-sm1-odroid-hc4: add spifc node to ODROID-HC4")
Assisted-by: LLM
Signed-off-by: Igor Velkov <iav@iav.lv>
---
 arch/arm64/boot/dts/amlogic/meson-sm1-odroid-hc4.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-sm1-odroid-hc4.dts b/arch/arm64/boot/dts/amlogic/meson-sm1-odroid-hc4.dts
index 5ce76a1bfe02..8f09f2b74bdd 100644
--- a/arch/arm64/boot/dts/amlogic/meson-sm1-odroid-hc4.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-sm1-odroid-hc4.dts
@@ -144,7 +144,7 @@ flash@0 {
 		#size-cells = <1>;
 		compatible = "jedec,spi-nor";
 		reg = <0>;
-		spi-max-frequency = <104000000>;
+		spi-max-frequency = <40000000>;
 	};
 };
 

-- 
2.43.0



