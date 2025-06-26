Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3D26C7EE32
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Jun 2025 09:19:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bDOBxl+ckqq3+9b4ik7fuhprkXjFpjrej35sbgctykY=; b=sDYP6z8WjcfLrdPI+H5fV0csYY
	v7MlF9psKMyOG3GPGn5TVAW5qTyNneGxwi1kJe6Qsy8Cyo8zwLbf2myg9k11pPMYUERIIdDkRlAN9
	Mor0Ix66I1ZMVMVt0E41PSVM5p8CP8MblYuLs5qxuPdVY4T2OX910gVBbWEoN+rznos07SoqfRz1s
	AA7g+Zvqu2J61T+XKI60dWqq+MUgoeiIK8UFhEGqz5WOla1t4shsBBZdhSe8tF2wj+/HISVvLzXO8
	8j2/PPVXNGY3DZX6ICMQzmjsCiakztVu/PZF2tAgKOz1fLbgOxzDyLLwIxK3vn0hfBi7e31+/tOVg
	Xefw93mQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUilg-0000000B7OI-0jk5;
	Thu, 26 Jun 2025 09:19:40 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUiMo-0000000B39x-30kT;
	Thu, 26 Jun 2025 08:53:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 24765617F1;
	Thu, 26 Jun 2025 08:53:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C23D7C4CEEF;
	Thu, 26 Jun 2025 08:53:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750928037;
	bh=po6gf5kjyV61lVb3y37IqmcQLE0mzdCfVR7P77/L3+8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=R4ffXAv3IHmTvK0P3NGOlI5Fpr8p2z7K3aBvpnFCj5fXsikRR5A9ZTWKhw4Fs48JS
	 FVg3A7V1NOaU+lCEmbh3fouLbpofrD19fUvOWHJRKXgMDAYizDb0MatrpURDSuAZCD
	 2I+2qQWBmkpPg/vjuQPqscbGBMlaLLPf7VLR1yUPCfFedxWpybw1jUFleqMvw072Zh
	 Y7HP9cskPBe54EHwPsI8JD8exhwq/MhZB9z6sHWytfTEB9HzPSkDcHUdLwGPTuo76C
	 hLF31I2jJUw5e6scHbSSo9EGLL5heLavuEhk8xldDDyiSLlpfFo1Qw81SCe9FBTZGl
	 q6VsFjgNbEIeQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ADDC5C77B7F;
	Thu, 26 Jun 2025 08:53:57 +0000 (UTC)
From: Max Shevchenko via B4 Relay <devnull+wctrl.proton.me@kernel.org>
Date: Thu, 26 Jun 2025 11:53:54 +0300
Subject: [PATCH v2 01/11] dt-bindings: serial: mediatek,uart: add MT6572
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250626-mt6572-v2-1-f7f842196986@proton.me>
References: <20250626-mt6572-v2-0-f7f842196986@proton.me>
In-Reply-To: <20250626-mt6572-v2-0-f7f842196986@proton.me>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Thomas Gleixner <tglx@linutronix.de>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Guenter Roeck <linux@roeck-us.net>, Sean Wang <sean.wang@mediatek.com>, 
 Russell King <linux@armlinux.org.uk>
Cc: linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-watchdog@vger.kernel.org, 
 Max Shevchenko <wctrl@proton.me>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750928035; l=945;
 i=wctrl@proton.me; s=20250603; h=from:subject:message-id;
 bh=bXsi5V4HlQoXzvgDyvOxJjmemw7ad9ICPPuvV97fHUk=;
 b=kQJmMQjdTJC0sIEny0OI0bVxUP2oAfpEp83ogXq9Xq/NhSxIhwwEWA9DAbDUA6YpDhr+AFLrn
 ZK6mOK7FfM0ChTMOSkmGC9/M0W4rkF4slGePOGJcTOt6HLa1wQBaD8d
X-Developer-Key: i=wctrl@proton.me; a=ed25519;
 pk=JXUx3mL/OrnRvbK57HXgugBjEBKq4QgDKJqp7BALm74=
X-Endpoint-Received: by B4 Relay for wctrl@proton.me/20250603 with
 auth_id=421
X-Original-From: Max Shevchenko <wctrl@proton.me>
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
Reply-To: wctrl@proton.me
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Max Shevchenko <wctrl@proton.me>

Add a compatible string for serial on the MT6572 SoC.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Max Shevchenko <wctrl@proton.me>
---
 Documentation/devicetree/bindings/serial/mediatek,uart.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/serial/mediatek,uart.yaml b/Documentation/devicetree/bindings/serial/mediatek,uart.yaml
index 1b02f0b197ff46e3530372d1d9303210cca9c2d5..fe283494188dea64bdfdd34a781bf54c8cbc1f05 100644
--- a/Documentation/devicetree/bindings/serial/mediatek,uart.yaml
+++ b/Documentation/devicetree/bindings/serial/mediatek,uart.yaml
@@ -25,6 +25,7 @@ properties:
           - enum:
               - mediatek,mt2701-uart
               - mediatek,mt2712-uart
+              - mediatek,mt6572-uart
               - mediatek,mt6580-uart
               - mediatek,mt6582-uart
               - mediatek,mt6589-uart

-- 
2.50.0



