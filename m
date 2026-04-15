Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82A25FA0C4C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Apr 2026 08:34:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Tt2O8byLeKz+WIs0DFENr3nJMjXQIbkIz5h4aDhZEI8=; b=3ZZ/T2w9URyyCuX4wZ3R7htt5r
	nJ9t4BCVUbiFbu8hDy3MGJNjSUZ8kHeHQPVVzY6jAG17Txi0YgtYQ9+zyR1F34DM0bDJo7fk28GAq
	6KXoOSaOtI+pqz/NRt7phawdB8AzAraOYowwJbt8KU6n9BKMapiIr9bfKKyw2ytjt5kOOENhpfMHW
	P9PujYfZPwXCpZCJAMRYdLomSnTIraB0wq4G7zEZB7BCMTzLh65R72SzJlMmQOnNXHJCSv9HRh81U
	KpvQDwPpbidRzzo0f8tPqB/Vs4j/ABCshn/01WK+21FHWJMXXqA1c2qDXtoI1r618ZTS7YnSwEnqY
	W8ngN+qQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCvhU-00000000p7o-0EoP;
	Wed, 15 Apr 2026 08:34:20 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCvhN-00000000p2p-2kO4;
	Wed, 15 Apr 2026 08:34:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 2C1194457B;
	Wed, 15 Apr 2026 08:34:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 08AE8C2BCC6;
	Wed, 15 Apr 2026 08:34:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776242052;
	bh=HNl0K0UlF9d+szw90ANkiXfQ6YKI/SjoS/k9HXrb6kU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=ezhmRegYJyy2vf759wHwQt4IzLzPXCa1gg/YZ+eLptCOMUkpgA/uLmIa4SuaGCnZl
	 hTAvwYA7udtjk1SVlHtPjymXimgZCtzfC6JYTODqyScmkJ84J+i4VtOAcRt9vpjeob
	 bCvqRGkfVfzStdbEmPO4w8H2Cu40Y2gb7PBPoBoLrDrm35x0fTsTypneB3NtkL6omb
	 yUvPLDJYnlGQZ6awok8DHkk9wbp7jQ7dYMMyNWK8LOq9qKCmJuRNVXcCQlKTnC4bsj
	 toT9bq5RjsztFsw+SCjmg6/Gl9w78nbFd1IWKvqy2/wpsZVV9+R1Lgz4HtnNqpLENW
	 vsHPPRKwgg8jg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC8F7FA0C50;
	Wed, 15 Apr 2026 08:34:11 +0000 (UTC)
From: Jian Hu via B4 Relay <devnull+jian.hu.amlogic.com@kernel.org>
Date: Wed, 15 Apr 2026 16:33:44 +0800
Subject: [PATCH v2 4/4] arm64: dts: amlogic: t7: Add clk measure support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260415-clkmsr_a1_t7-v2-4-02b6314427e6@amlogic.com>
References: <20260415-clkmsr_a1_t7-v2-0-02b6314427e6@amlogic.com>
In-Reply-To: <20260415-clkmsr_a1_t7-v2-0-02b6314427e6@amlogic.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Jian Hu <jian.hu@amlogic.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776242050; l=789;
 i=jian.hu@amlogic.com; s=20260415; h=from:subject:message-id;
 bh=RYhHoZhvQkCfRu2Sr48dUeuj2wFszXlz2Xg36uj+pEw=;
 b=oFzE4h7RYeGFS+Vu1Zw6G3+FCukgp3/npaLhYAXhAHEPnNvfj0gFLlZR+pO2GcZ825xHWbiOE
 SJrBh4ex5ydCP18XuAN+GDUqNUxZYRmbn6KzGJUxzR3Q1HflCq31IJd
X-Developer-Key: i=jian.hu@amlogic.com; a=ed25519;
 pk=zHUE+rNtH9z+Sb8au1/elWknjFQmy5QDVkBoxleuOIA=
X-Endpoint-Received: by B4 Relay for jian.hu@amlogic.com/20260415 with
 auth_id=735
X-Original-From: Jian Hu <jian.hu@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260415_013413_746445_36EA96CA 
X-CRM114-Status: UNSURE (   8.49  )
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
Reply-To: jian.hu@amlogic.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Jian Hu <jian.hu@amlogic.com>

Add the clock measure device to the T7 SoC family.

Signed-off-by: Jian Hu <jian.hu@amlogic.com>
---
 arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
index 7fe72c94ed62..cec2ea74850d 100644
--- a/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
+++ b/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
@@ -701,6 +701,11 @@ pwm_ao_cd: pwm@60000 {
 				status = "disabled";
 			};
 
+			clock-measurer@48000 {
+				compatible = "amlogic,t7-clk-measure";
+				reg = <0x0 0x48000 0x0 0x1c>;
+			};
+
 			sd_emmc_a: mmc@88000 {
 				compatible = "amlogic,t7-mmc", "amlogic,meson-axg-mmc";
 				reg = <0x0 0x88000 0x0 0x800>;

-- 
2.47.1



