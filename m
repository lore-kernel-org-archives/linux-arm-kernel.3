Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94601FB3CFA
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Mar 2026 10:22:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Z6Lgou7qZaBGO/4jcfhaIsnEqBsZ3VUgcjbKKiHQFUs=; b=AjkeJs8RKV7NmL8l+jHAGOlnE+
	hcLiYs2RZepDTtTc07IwVFvzr9YTLzeVGSHdpn2DdmPjIoY+NrcRIHU3F15oLkBBZzjX90DI/Ur7L
	Wym82Xv8a0mJG0WAHWD4Mc43stu1I8TNlKgwizP+mqH7GUrQ2fs6l5/wr4VPnC4zZmSmEofArdk4g
	XYlWUfYgJBafQNtQK9Hn9guYvOAHkdH+TzszjNcfa48UY1RaCgWvXm1YZil3JQkdGszPENdFYn5ZG
	Ur04g6fPchtM45GSJOvdnml3Nn3eTBeL4Ug/Lpprv36kbZLVmZdEzPcVxW+ZqahroKGDbZ8DQZqbu
	uGFwjM6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w79lU-0000000B36F-2uVV;
	Mon, 30 Mar 2026 10:22:36 +0000
Received: from courrier.aliel.fr ([2a01:4f9:c011:1c83::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w79lR-0000000B358-1ZAr;
	Mon, 30 Mar 2026 10:22:34 +0000
From: Ronald Claveau <linux-kernel-dev@aliel.fr>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aliel.fr;
	s=courrier-s1; t=1774866149;
	bh=cHxCL+kgZEYYDlNTSJUvvX2k7Txna5iYqayS3SfoOig=;
	h=From:Date:Subject:To:Cc;
	b=UAkIxsmHBUhDJTThHvm72YM6MyKL+0rWwYa/mOBka0JeZFkLXdFbC4QfxW3PFBfbx
	 aAFRXkhJ+JSEnkFwMMF8x9fA4OQSOFw542w+j18ZUySXzMt3np5b0jmmCETAwOMFCB
	 K+G7hu1skHHZaH24EZvNAoUyA6VYrtjWOVWAsTFs=
Date: Mon, 30 Mar 2026 12:21:38 +0200
Subject: [PATCH] arm64: dts: amlogic: t7: khadas-vim4: Remove invalid
 property
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260330-fix-invalid-property-v1-1-e829c4d806cb@aliel.fr>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x2MSQqAMAwAv1JyNlBbF/Qr4kFt1IDUkooo4t8tH
 gdm5oFIwhShVQ8InRx59wnyTMG0Dn4hZJcYjDaVtlbjzBeyP4eNHQbZA8lx4zhSWbjG2rnOIaV
 BKHn/tuvf9wMinlkYZgAAAA==
X-Change-ID: 20260330-fix-invalid-property-bbe54d933f71
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 kernel test robot <lkp@intel.com>, 
 Ronald Claveau <linux-kernel-dev@aliel.fr>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openssh-sha256; t=1774866148; l=1261;
 i=linux-kernel-dev@aliel.fr; s=id_ed25519; h=from:subject:message-id;
 bh=cHxCL+kgZEYYDlNTSJUvvX2k7Txna5iYqayS3SfoOig=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgMGec55oxeeisqykQiUedekMYyOnR9
 BG9E/7rDWyqdNoAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QIq3EbCbzSFk16GagS7tZiZDzrUW8C9xkwkL4RQRuXb+XUI1pPI4dT8GmIlRE9C2b717YFqr5VQ
 Nc/hZ8T2OUwc=
X-Developer-Key: i=linux-kernel-dev@aliel.fr; a=openssh;
 fpr=SHA256:kch4osYZ6A1BrPps5AUs6KnfdE2wm4ocMtyTc8TmZMs
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260330_032233_737891_05499C65 
X-CRM114-Status: UNSURE (   7.00  )
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

Fix introduced invalid property for Khadas VIM4 sdcard regulator.

arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dtb: regulator-sdcard-3v3 (regulator-fixed): Unevaluated properties are not allowed ('enable-active-low' was unexpected)

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202603290828.5gt393t6-lkp@intel.com/
Signed-off-by: Ronald Claveau <linux-kernel-dev@aliel.fr>
---
 arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts b/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
index 11bfbc99191b6..003b3bcdaf2bc 100644
--- a/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
+++ b/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
@@ -65,7 +65,6 @@ sd_3v3: regulator-sdcard-3v3 {
 		vin-supply = <&vddao_3v3>;
 		gpio = <&gpio GPIOD_11 GPIO_ACTIVE_LOW>;
 		regulator-boot-on;
-		enable-active-low;
 		regulator-always-on;
 	};
 

---
base-commit: 3b058d1aeeeff27a7289529c4944291613b364e9
change-id: 20260330-fix-invalid-property-bbe54d933f71

Best regards,
-- 
Ronald Claveau <linux-kernel-dev@aliel.fr>


