Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 972C2CA1012
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Sep 2025 02:42:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=tvTHeL3N4z2H3Io0uFg4blgZHaqSdL11QeevOKUOCRM=; b=jA///xuIe8JCfNJDgQ4bMdB3Gx
	SK3U2D9Gg9nR9iDVKAHLZG50LXd+4jJr57vdWby7cWIJH8rZXv2RPGTr3p23Pm3b5Kus34hHQRJlk
	GedGD2zioP2mpJPpav+Wo3BY+gMpK+R9CG3st38zV27xeWgeHuFKCj33xpKPeD4ELc0kROPLMPj0H
	NFluLT/ZD0fc/AxC46332SdVhxirn8dHXpQx5505QV+6nhxr3Kw+vE5g2f9HNL5hKKEqgaihXpjmW
	gWPQCtw4Jvb+1MLWpkjTIanVj7cubPk8zssMT1smbHFdUPr9ghZM42YEYylySTF8MVyHBQtxX8yDr
	UAnLBC2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuMPK-0000000GDRq-1ele;
	Fri, 05 Sep 2025 02:42:34 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuMMb-0000000GCiS-1dq7;
	Fri, 05 Sep 2025 02:39:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A59F3436CA;
	Fri,  5 Sep 2025 02:39:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7BE59C4CEF1;
	Fri,  5 Sep 2025 02:39:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757039984;
	bh=vgB5QZkxWhbewoikjI6YlorQ3Jl1QsSR04mb3VV44V8=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=eMTvEqGXGoR6YQrwZt+tkOQ0eQYZa9PoBZUU94Ay+9FkCcID/1LLUMe1d0msrC28T
	 57RImBnbcWSHfZIJvuejCfGHoFzQ0WusuYqQ5nZMbmL3c7Lekb1KOVn60Mgy48UJ4e
	 l5i72wzJ2PRooAx5kaiDhwTDDKoqi26Lg/txfRaqJQimmJUpNAGz0dCV5+Rc4WnPij
	 5SmTtE6IUPBcIALXOdoQ4P6T5p+CgQsRCszAHu6CCxNlCX7FJ9QBWrtoiWyMWB+oIo
	 EcznNPUehdmlfovq/CswdwOuwy3CzeX1MRp5OpWZTQuquL/GWyZnOQXhZhw/u0w9Li
	 kRlXNz0iBJF1A==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64D47CA1013;
	Fri,  5 Sep 2025 02:39:44 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Date: Fri, 05 Sep 2025 10:39:40 +0800
Subject: [PATCH] dt-bindings: power: keep alphabetical order
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250905-pm-fix-order-v1-1-3596e03d66e6@amlogic.com>
X-B4-Tracking: v=1; b=H4sIAGtNumgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDSwNT3YJc3bTMCt38opTUIl3TRDPLpDQTM0MjE3MloJaColSgJNi46Nj
 aWgA2dWuCXgAAAA==
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Jianxin Pan <jianxin.pan@amlogic.com>, Ulf Hansson <ulf.hansson@linaro.org>, 
 "hongyu.chen1" <hongyu.chen1@amlogic.com>
Cc: Conor Dooley <conor.dooley@microchip.com>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Xianwei Zhao <xianwei.zhao@amlogic.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757039980; l=1166;
 i=xianwei.zhao@amlogic.com; s=20231208; h=from:subject:message-id;
 bh=v+dUEzn1Vq7pqlYwSYypI3RmFlt816zF2fbTkSK6CaI=;
 b=0NIo6ncVhxzcSBYsUPwwNstjwwmTebpSb7P86Z3fS5sMjjo8uiUE2k4Q2oiWF1Ym+XQVj4maz
 rorfr+gR0aNBFnqYjT9M3EUghIpXGKaFqKI+kHsytLqcqv892pudIQQ
X-Developer-Key: i=xianwei.zhao@amlogic.com; a=ed25519;
 pk=o4fDH8ZXL6xQg5h17eNzRljf6pwZHWWjqcOSsj3dW24=
X-Endpoint-Received: by B4 Relay for xianwei.zhao@amlogic.com/20231208 with
 auth_id=107
X-Original-From: Xianwei Zhao <xianwei.zhao@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250904_193945_457870_5C60D815 
X-CRM114-Status: UNSURE (   8.73  )
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
Reply-To: xianwei.zhao@amlogic.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Xianwei Zhao <xianwei.zhao@amlogic.com>

Keep the order of compatible property for amlogic sec power.

Fixes: 9428fff44f0c ("dt-bindings: power: add Amlogic S6 S7 S7D power domains")
Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
---
Keep alphabetical order.
---
 Documentation/devicetree/bindings/power/amlogic,meson-sec-pwrc.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/power/amlogic,meson-sec-pwrc.yaml b/Documentation/devicetree/bindings/power/amlogic,meson-sec-pwrc.yaml
index 12b71688dd34..7b843e9f51c7 100644
--- a/Documentation/devicetree/bindings/power/amlogic,meson-sec-pwrc.yaml
+++ b/Documentation/devicetree/bindings/power/amlogic,meson-sec-pwrc.yaml
@@ -23,10 +23,10 @@ properties:
       - amlogic,a4-pwrc
       - amlogic,a5-pwrc
       - amlogic,c3-pwrc
-      - amlogic,t7-pwrc
       - amlogic,s6-pwrc
       - amlogic,s7-pwrc
       - amlogic,s7d-pwrc
+      - amlogic,t7-pwrc
 
   "#power-domain-cells":
     const: 1

---
base-commit: b283b70967c0553b66e924f40e1c35b68fa8a1f7
change-id: 20250905-pm-fix-order-5a69bf461247

Best regards,
-- 
Xianwei Zhao <xianwei.zhao@amlogic.com>



