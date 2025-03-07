Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A3BBC28B23
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Mar 2025 17:16:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6nqlOysT4WBJ6c6RUX/B2Fceg+Pw2InWD4bgPTt2m4k=; b=Iq5odsNavRSrOPBZL/+A03Xkrv
	8+cdlAP2Wy7XDGEr6+bB2sDdMH7dFg/Cjde9IbFVZduIHBc25brv0rXDAITPcHW1lhxsRZyuMd+28
	mfo1MJDXBe4mt7UKZD/A+bz1fNrUsiaQDUS7DyBf9BLDLLBgPgSxRra5satn9aDj/8qByrMqdURtN
	sqDjVcu5bf/YIjdYUkebbCZK9ADnZL07Jugt840sEk/8eoZNqvM6Ai/+wuyepPQiNGN28j9fYq2d0
	lxdCP7bO20C2cyZSyF+9biXZUKxazbjieNkcfKzHzpup1EX5nBFMiQ429TXy4x8Y/Fq1+O7mz47DP
	5HIxR6Mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqbJC-0000000F1cG-1s30;
	Fri, 07 Mar 2025 17:16:26 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqbBf-0000000F0aB-0aOI;
	Fri, 07 Mar 2025 17:08:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id BCC0E5C5944;
	Fri,  7 Mar 2025 17:06:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3E40C4CED1;
	Fri,  7 Mar 2025 17:08:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741367318;
	bh=2MUxetF4tyBtf8QbKEGEF3P+QjNfEKaJtJGEcUXg7mM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=U/Rj2xu1Xi3TmGFEHezijuLZXqZ9j/jdhLhl3OBVIdMYHMzdDdMkXEpPQSIj1PMQ5
	 ZTomoGw3jgSGweVsEQjbu5YYuLsxH6wuKskHOu3dCdcXHXMk+cEsEWngQOwRc+67j5
	 NRSaJHz1nRlFJogBGv+g8KKLjC+uFjAkBPP47R0zPYyFbHbtt/xro8P8pC2etCkSm/
	 u3BtEjO0wdgi17Q+U1FARSIoJMCR2d7qSR3HZpvB3BZzTdmB/l8JNm70oOo8vMO5F4
	 +uq0qUy1d3Lpw0woIQW51tcmdsQkvjVdFiat1mm+mtFuHZBCOSXltEAG2wF0vn8YTi
	 z2L1RaB4OmT6A==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Fri, 07 Mar 2025 18:08:20 +0100
Subject: [PATCH 2/2] arm64: dts: airoha: en7581: Add gpio-ranges property
 for gpio controller
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250307-en7581-gpio-range-v1-2-de1262105428@kernel.org>
References: <20250307-en7581-gpio-range-v1-0-de1262105428@kernel.org>
In-Reply-To: <20250307-en7581-gpio-range-v1-0-de1262105428@kernel.org>
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Lorenzo Bianconi <lorenzo@kernel.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250307_090839_236728_D25D36F0 
X-CRM114-Status: UNSURE (   9.00  )
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

Introduce missing gpio-ranges property for Airoha EN7581 gpio controller

Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 arch/arm64/boot/dts/airoha/en7581-evb.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/airoha/en7581-evb.dts b/arch/arm64/boot/dts/airoha/en7581-evb.dts
index d53b72d18242e3cee8b37c7b1b719d662fd6db8d..a8f8a9f0b807a2ee4fd11f8418b8e810a6945d73 100644
--- a/arch/arm64/boot/dts/airoha/en7581-evb.dts
+++ b/arch/arm64/boot/dts/airoha/en7581-evb.dts
@@ -65,6 +65,10 @@ reserved_bmt@7e00000 {
 	};
 };
 
+&en7581_pinctrl {
+	gpio-ranges = <&en7581_pinctrl 0 13 47>;
+};
+
 &i2c0 {
 	status = "okay";
 };

-- 
2.48.1


