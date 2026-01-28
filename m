Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B730DD3569C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Jan 2026 10:10:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=eWwZSVnTTdj+etI/fDq4YnbyDy94jcEEPt8yqACsXOY=; b=Y4OeohtD0oUFnywAbr3p+Ny+8w
	MMI0CelAwNIiiJVYXTEo8ormDvPFOFgTy0qHPJr686nHpzptu4z3vC6TnZGI3p+o0l2Aa/ntJm3cD
	iPhyFsdc3IYEbDITmwIZDQY581CVMnLd0dHw3b+rtcrg55JHJS8ZCf2wLlgp++Dc69o0V2v5svL4T
	L2vfKSj9vmE/dLvBpFjM3CUraWoA9mNF1SvuhFfQzKNsKOmfN1+rxgA18xFNf8/oDTuLgfSdFGIZk
	cHV253vi3lemEKGPbZinPYtwIavs/T4OtqLakYSv5fv2EWx/NLgQgofo8x3eDWfQR+5nWMT4VIblH
	4Yizni7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl2Ux-0000000FoLN-3HLP;
	Wed, 28 Jan 2026 10:10:07 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl2Uw-0000000FoLA-3Wvf;
	Wed, 28 Jan 2026 10:10:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id EB3416001A;
	Wed, 28 Jan 2026 10:10:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 96013C4CEF1;
	Wed, 28 Jan 2026 10:10:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769595005;
	bh=X4SuxCleKrrzGAtIw6zL8YaUitgC/KQKVkQAuw87xNw=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=KWI/646ZWVuGRf5tFzDPJ4w9K3A7JCMYnuNMLF0llsEkzOuxNXHldoxH+a9wmKyNu
	 Ndq+MUk86Qhm/AQUJn+zf0T/5u6EtDSfriLeVBPb1Ky2x5R7CszDRXOUuvsfHzEJwm
	 OVVcf3GSmrbeDaJsDO09niZnqPN8zEp9JZLrSlVOlNwgftzUOei7jQd+2w2ugJd2ss
	 ile1Yw4zptEv4pk7crN7rqCOWkHra54zWoKeIhkhuPXK7y5eGO8MPGk+J/NnGOrqKg
	 8/HhN/fvuuJ1TfzX17SYIyLf/Ww+Y8YdYra632FFPYV74f9ybAMj18pbc1o3HY2Nz8
	 Cbx1aJQKM1XGQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 835F6D35693;
	Wed, 28 Jan 2026 10:10:05 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Date: Wed, 28 Jan 2026 10:09:54 +0000
Subject: [PATCH] arm64: dts: amlogic: a4: fix pinctrl node
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260128-fix-a4-pinctl-node-v1-1-617a1f539902@amlogic.com>
X-B4-Tracking: v=1; b=H4sIAHHgeWkC/x2MWwqAIBAArxL73UJt0esq0YfpVguhohGBdPekz
 4GZSRA5CEeYigSBb4nibIa6LEAfyu6MYjIDVdRVNQ24yYOqRS9WXydaZxg702+jpnFtSEEOfeB
 s/dN5ed8PqDHy92QAAAA=
X-Change-ID: 20260128-fix-a4-pinctl-node-6d7f9c29b32a
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Xianwei Zhao <xianwei.zhao@amlogic.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769595003; l=1293;
 i=xianwei.zhao@amlogic.com; s=20251216; h=from:subject:message-id;
 bh=F6Np6Gg5OfDL8SOtdbBhRnTvyEqILZTAt6VZ6iphZjU=;
 b=klaiKJo6ZXYdkMttvJFCkjmYPGO+ViMwibRH3IvVKYi1pOexAtu5Fpu0DiJT/zW6MPW+LQJC5
 PWuoph2b+74A/QH2bae0AyNkycivBV6dCia29/RQ2iwwzlcxBF2gGuT
X-Developer-Key: i=xianwei.zhao@amlogic.com; a=ed25519;
 pk=dWwxtWCxC6FHRurOmxEtr34SuBYU+WJowV/ZmRJ7H+k=
X-Endpoint-Received: by B4 Relay for xianwei.zhao@amlogic.com/20251216 with
 auth_id=578
X-Original-From: Xianwei Zhao <xianwei.zhao@amlogic.com>
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
Reply-To: xianwei.zhao@amlogic.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Xianwei Zhao <xianwei.zhao@amlogic.com>

Fix incorrect pinctrl device reference when adding GPIO to pinctrl device.

Fixes: e9bb91734871 ("arm64: dts: amlogic: a4: add pinctrl node")
Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
---
Fix A4 pinctrl node.
---
 arch/arm64/boot/dts/amlogic/amlogic-a4.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/amlogic/amlogic-a4.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-a4.dtsi
index fce45933fa28..6587e3578f8d 100644
--- a/arch/arm64/boot/dts/amlogic/amlogic-a4.dtsi
+++ b/arch/arm64/boot/dts/amlogic/amlogic-a4.dtsi
@@ -218,7 +218,7 @@ gpioao: gpio@4 {
 			reg-names = "gpio", "mux";
 			gpio-controller;
 			#gpio-cells = <2>;
-			gpio-ranges = <&periphs_pinctrl 0 (AMLOGIC_GPIO_AO<<8) 7>;
+			gpio-ranges = <&ao_pinctrl 0 (AMLOGIC_GPIO_AO<<8) 7>;
 		};
 
 		test_n: gpio@44 {
@@ -226,7 +226,7 @@ test_n: gpio@44 {
 			reg-names = "gpio";
 			gpio-controller;
 			#gpio-cells = <2>;
-			gpio-ranges = <&periphs_pinctrl 0 (AMLOGIC_GPIO_TEST_N<<8) 1>;
+			gpio-ranges = <&ao_pinctrl 0 (AMLOGIC_GPIO_TEST_N<<8) 1>;
 		};
 	};
 

---
base-commit: e3194dfb772304a1b7ca3bcfccacefec3468b7bf
change-id: 20260128-fix-a4-pinctl-node-6d7f9c29b32a

Best regards,
-- 
Xianwei Zhao <xianwei.zhao@amlogic.com>



