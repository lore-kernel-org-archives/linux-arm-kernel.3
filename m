Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86D9BC369D9
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Apr 2025 10:50:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EX47OwHxCz9nXy/2mzeZSGiyHCgMTnirvmQ4m0T3Coc=; b=PpC2/iesHbHDrBuP8KRLwe9Ibk
	73EJ9tEwm9zEqK0NC8G28/SjoTT4Yv7TNpyCAjUsYQkZOuMqm5BfxDx5dqJxCsN6DLW8XRwIEaBpu
	5KcddbfUU/CsY0ptf6bRNPUi+vKdpM1LpFyr4VBpZStfaZOfRsSxPWtDrtbMjf8rLUviOaQh+Kc5x
	JWmBH8+BLHJXA/2SbqucFCmvFzzY9NPhUqiz0ZdRRGskmToVYBhkREMou/hN3eiKZRsqERIa7GxTO
	qiOE89mP8zRZ3NxLrvUmuYz13Xduuqd98TZMJODiAoN95IR2KmY4bP3Ug5+vyw2H/nwIqdcK+mUM/
	NHnV7cZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9M4L-00000005qXl-0pDL;
	Mon, 28 Apr 2025 10:50:37 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9LyS-00000005pUq-1JGH;
	Mon, 28 Apr 2025 10:44:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3FDF04A10E;
	Mon, 28 Apr 2025 10:44:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E7B5AC4CEEE;
	Mon, 28 Apr 2025 10:44:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745837071;
	bh=Xlkrt6G0FEKg1HboAv2n4Daxz723vqa07I6qDNDIf/k=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=cv78DjI2Q1y/ahBCts7re/2kae0KY1063OgbwMx6h8YMI9gPwa9KlTKUjgY4Stj59
	 QQCKNDbJeiOVkgXwKLNjyo+kNBEHFsmKYvh/iS5e/57BOl6YIlktymdrbfc3bRarqw
	 1EWvOH52QKJ9PDdmYWylVxMxCx2EKBVZlhj0ACu5/dJTxwsazA9W4fb72spllqUcGz
	 LKpxbAqlVg65mntpYRUSHIck762IN6rs/GleTxnRsBAT/z/Wl68XRFrXNt2OU/c7q6
	 hiE4XDTLDlndi0GXlSVmeocmanah0F9sYMYmI251C1gDbituIWjt1UX+pzM4aW2M18
	 pEgk2VUi5gL6Q==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8375C3ABA1;
	Mon, 28 Apr 2025 10:44:30 +0000 (UTC)
From: =?utf-8?q?J=2E_Neusch=C3=A4fer_via_B4_Relay?= <devnull+j.ne.posteo.net@kernel.org>
Date: Mon, 28 Apr 2025 12:44:29 +0200
Subject: [PATCH v2 2/4] dt-bindings: arm: amlogic: Add TCU Fernsehfee 3.0
 board
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250428-fernsehfee-v2-2-293b98a43a91@posteo.net>
References: <20250428-fernsehfee-v2-0-293b98a43a91@posteo.net>
In-Reply-To: <20250428-fernsehfee-v2-0-293b98a43a91@posteo.net>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1745837069; l=1095;
 i=j.ne@posteo.net; s=20240329; h=from:subject:message-id;
 bh=MIe7PtmNs9I3jGf86k4FxS5W7n++ITrjeAkSDcGo2i4=;
 b=JQIGJmDcQaIKoCGqKGZeFqJOtEbcqdf1GapeFkjcfu3MQktin5wLvLjwWR6M3BJUvWsxUfYrp
 COTqXuWSsBPC51m1X21MQ2ud+DY74IGJKMBCehtdkHP3H9myv+fAtNY
X-Developer-Key: i=j.ne@posteo.net; a=ed25519;
 pk=NIe0bK42wNaX/C4bi6ezm7NJK0IQE+8MKBm7igFMIS4=
X-Endpoint-Received: by B4 Relay for j.ne@posteo.net/20240329 with
 auth_id=156
X-Original-From: =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250428_034432_375785_99600D6D 
X-CRM114-Status: UNSURE (   6.63  )
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
Reply-To: j.ne@posteo.net
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: "J. Neuschäfer" <j.ne@posteo.net>

Fernsehfee ("TV fairy") 3.0 is a set-top box with HDMI input and output
ports. It originally ran Android 4.4 and a Linux 3.10 kernel.

  https://fernsehfee.de/  (German)
  https://telefairy.com/  (English)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Signed-off-by: J. Neuschäfer <j.ne@posteo.net>
---
 Documentation/devicetree/bindings/arm/amlogic.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/amlogic.yaml b/Documentation/devicetree/bindings/arm/amlogic.yaml
index 0647851ae1f55a27bfb148252532bcf15ca905bf..f6f045528da32cf4625b30da59262ca21da860e6 100644
--- a/Documentation/devicetree/bindings/arm/amlogic.yaml
+++ b/Documentation/devicetree/bindings/arm/amlogic.yaml
@@ -27,6 +27,7 @@ properties:
         items:
           - enum:
               - minix,neo-x8
+              - tcu,fernsehfee3
           - const: amlogic,meson8
 
       - description: Boards with the Amlogic Meson8m2 SoC

-- 
2.48.0.rc1.219.gb6b6757d772



