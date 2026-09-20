Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E8EAC982F1
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 20 Sep 2026 10:25:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QMr0HbRDzB6ksvZ6n9KrmZzNM350hOHw0sc123CX7JI=; b=sFbxZTqqkp3yqTT/5lMVeIaInM
	GFaofu9b8eJdaepHp+qS7Px/qxyFP0Ad4bICiAdBbjV39l4Bs0TzU2kZ8NoqhwMHmqjvvz7CridIo
	ykJIDRN9rUU9I1mymTcQF87Q/WONHMjcvwx207BrXeS6cTuUzSIsmNx/lfjo+mEu+GP74nRDqBQUo
	TPlAQlUgc7NvgJc1yUht0QHPQvSQnUk5KpExqXbaweq3Y1m18hD025ApEdYl9/iaTRVfoOEVSH2dX
	7Hj6fR88NgGb+lFezYQS2HLdOiGx0Vk58cItbjo7WBmLSArM5amTygeGsI9ZRlcA2RoAxzw0VJvls
	oj8FUi5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8Ejh-0000000HFkY-0Usk;
	Sun, 20 Sep 2026 10:25:29 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8EjM-0000000HFPB-29I5;
	Sun, 20 Sep 2026 10:25:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id A175460AA6;
	Sun, 20 Sep 2026 10:25:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 66D80C4AF15;
	Sun, 20 Sep 2026 10:25:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1789899907;
	bh=7yUvmIDMbzfZAF93qAmLa8Oi5bfk4s5SvGz6m0eGErI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=X1mMz0CUbvKFxWP0aC3JYkN+k5/UVO7mRy2B09flWVK8uZl2sNFXMJBuE3qCklLXN
	 ltgm4CYfOOQ2t0SPI4X7Inlfy9+l/WtTOqO+bxXtfKo1h4Yb39q8ulk8d3Yp9Ikzjh
	 B4gzTtdVpAsFIon/Z3v3nYifUTZfC+WOFsAydSq0J2ZGzeUiMR0WsZmWZapLP1DjnU
	 bkC+MDpwFc+zyeRIflWpMeJ8TuTOoAdm5Qid9lb+HQYFpUhzP5936UPXesXRgG/aPh
	 +/GA8tPymbT98h+IjFeu26RxMSxO0jQ39I1SrjwqgfbCnPmfUdtmhpp7mIFRCqGaX7
	 zElaDQUPJwtlw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53585C982D0;
	Sun, 20 Sep 2026 10:25:07 +0000 (UTC)
From: Chuan Liu via B4 Relay <devnull+chuan.liu.amlogic.com@kernel.org>
Date: Sun, 20 Sep 2026 18:25:09 +0800
Subject: [PATCH v2 07/12] arm64: dts: amlogic: a5: Add clk-measure
 controller node
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260920-more-socs-to-support-clk_measure-v2-7-224382a429e8@amlogic.com>
References: <20260920-more-socs-to-support-clk_measure-v2-0-224382a429e8@amlogic.com>
In-Reply-To: <20260920-more-socs-to-support-clk_measure-v2-0-224382a429e8@amlogic.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Chuan Liu <chuan.liu@amlogic.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789899904; l=735;
 i=chuan.liu@amlogic.com; s=20240902; h=from:subject:message-id;
 bh=m5R5k55AN/MNKbp84EDgUAXLk3E5z1TMK4ptSdMbBlo=;
 b=o3JaiEL+aRnvotUYIh5NHQ4EnpH4qmkpE6JzCCATMhxdOCOaG7hehas2rqKuMAtfPA4g4UuMZ
 PQAEVnxwnclBeLHFj3pU7h7mPupa7IL+eH9R6QsEr5XfdqWGnrWdSp4
X-Developer-Key: i=chuan.liu@amlogic.com; a=ed25519;
 pk=fnKDB+81SoWGKW2GJNFkKy/ULvsDmJZRGBE7pR5Xcpo=
X-Endpoint-Received: by B4 Relay for chuan.liu@amlogic.com/20240902 with
 auth_id=203
X-Original-From: Chuan Liu <chuan.liu@amlogic.com>
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
Reply-To: chuan.liu@amlogic.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Chuan Liu <chuan.liu@amlogic.com>

Add the clk-measure controller node for A5 SoC family.

Signed-off-by: Chuan Liu <chuan.liu@amlogic.com>
---
 arch/arm64/boot/dts/amlogic/amlogic-a5.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/amlogic-a5.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-a5.dtsi
index 2b12d8284594..0be176ace337 100644
--- a/arch/arm64/boot/dts/amlogic/amlogic-a5.dtsi
+++ b/arch/arm64/boot/dts/amlogic/amlogic-a5.dtsi
@@ -157,4 +157,9 @@ gpio_intc: interrupt-controller@4080 {
 		amlogic,channel-interrupts =
 			<10 11 12 13 14 15 16 17 18 19 20 21>;
 	};
+
+	clk_msr: clock-measure@48000 {
+		compatible = "amlogic,a5-clk-measure";
+		reg = <0x0 0x48000 0x0 0x1c>;
+	};
 };

-- 
2.42.0



