Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDD37C3ABAC
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 May 2025 19:02:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7ApIzObDd4nyzZE76GeFoWuehixdxnhUAd8DIc0B6Jw=; b=1AxeTDV/vgj3SQha9lQ0MetWfP
	f0GRf4sNMulgkl6HwDXFT2te7/je+nAWTlus51VtUKTAUqY+I4f6Lb9uOYuNDbtPYEvarmAoYoNVH
	X9IS9OTmfqha7XoSgxendweT1Aw/x5Le9OU+plXLSCvLBYMFSZu8KDFao/QajYDNXxNTjgNkexaow
	8oSn7TQMMg+bvRB+ct7iAXpKM8ReTrMw3eMWehICGxtika4wXY2rTA5PKTB5hYHTy3auZDZ2t9hOD
	Ohh63yFqZz8rUyPbiDS2adLwVRef6+ERu2rFVG0v1ug3/lw1rfuAS4FKJ1BADGpXdRlaUKWdKEJjv
	ntVCoqGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAver-00000002pSp-00CK;
	Fri, 02 May 2025 19:02:49 +0000
Received: from out-181.mta0.migadu.com ([2001:41d0:1004:224b::b5])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAvZ9-00000002o7t-1BeK
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 May 2025 18:56:56 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=postmarketos.org;
	s=key1; t=1746212203;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7ApIzObDd4nyzZE76GeFoWuehixdxnhUAd8DIc0B6Jw=;
	b=n32iTJD5oBpZCgPWtz3amPLjMHCeET/z4qWCwqpNar9RWnPtd1NRXePBIMSjj2XxSIFZMj
	fjS/QUVJE75HsiyvrYcTGZYrIfR8hXdbL15sBepwvAWDFXorHTP8eyFWoEbDLsGGzfgAQb
	VdCPVxK/r/sNk0i/s/mfOiOZRhQ1+bE92TQ8JG86+16+3e1eW4++iY1VguChF2ZMJ2/Xx5
	68mWEzFP+L6XfFlydIplJ85idCdmSxJuW+pZnuV+wcF5agdBxzaQGeSawjZyUF2ly91UuV
	b0ADllQssfAguC3K/gJPDlX1metdJPgunwh3kZPYuipGYC+7WFUJpHB0+ty/1g==
From: Ferass El Hafidi <funderscore@postmarketos.org>
Date: Fri, 02 May 2025 18:56:05 +0000
Subject: [PATCH v6 1/2] dt-bindings: arm: amlogic: add S805Y and Mi TV
 Stick
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250502-aquaman-v6-1-f1af347d9709@postmarketos.org>
References: <20250502-aquaman-v6-0-f1af347d9709@postmarketos.org>
In-Reply-To: <20250502-aquaman-v6-0-f1af347d9709@postmarketos.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 ~postmarketos/upstreaming@lists.sr.ht, 
 Ferass El Hafidi <funderscore@postmarketos.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Developer-Signature: v=1; a=openpgp-sha256; l=1247;
 i=funderscore@postmarketos.org; h=from:subject:message-id;
 bh=JwOXtPS7BSEnD2nL1tGht0Ft29x7XdscNbGf2At+3tI=;
 b=owEBbQKS/ZANAwAIAYSvy9DXiZoDAcsmYgBoFRVRivrcQ5h28FcP2PqARQ6nd480JCseyXuYI
 bGZng2qFTqJAjMEAAEIAB0WIQQDAbw3+1VcrP15i+6Er8vQ14maAwUCaBUVUQAKCRCEr8vQ14ma
 A/LHD/95OO9OVFAXb6dFZJxD1L0+y3U86mLY/RhOWX1Nha4y12J+k10AEPzw5OKCLGnRCbb/xi7
 f84hJFm3sxgnWVhptJHlAzX3DVWe09WT2MDamnWA4TMUE9KKV4IW8VZjJ1EaI2hwbuy8ie+p93q
 ruAKT7QZQJOlCfVrOiWC3YiB8/8nJ/oLFqqNdnXmi9Ywrke1EGG52gFuRZoFyGIGELE9n/ZwdVY
 zywwkH8HOLSWDESBfXayzKwdE89bypV4rtoerfHgTnl3Uekdv8Q7gFg6QuWwK+yI6IDpddE+fBv
 OTXr8WLGDEUCQrfEisith/+USeihlVTs4zLMPnAYVpXgcz5Kr1Voi8kJvQaXcVmZnt9wXQNhZXe
 SC595o0d1jmqy8O/yG2nMh9FJRjuIYNM4rYIqAqeuiSUMzqI/gOiAGFRFF6lOe7qiHCWk0Bn/MF
 j6FgMJPnDHLwFIm7mcNBJ78c53uFVje2K4ZTXREoT1ZJoDN8CbUZXzeTnViPoLbAumaYISRomtP
 UYL4405L/TMjImsb2ld1pzF8Y24wQeImPjxLQHcPsbTM2GF9d+bYX3q3BG/ja05fOydcd8eg4VO
 t9QEWLavgnYW78365i5dj1DE/4Nk94QKvjCyfItzyb7amjcYzk+dDDuR6aZDyNkKDZClxsi8x8M
 zaGWT8GY/kwfHkw==
X-Developer-Key: i=funderscore@postmarketos.org; a=openpgp;
 fpr=0301BC37FB555CACFD798BEE84AFCBD0D7899A03
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250502_115655_457980_2BC182E4 
X-CRM114-Status: UNSURE (   7.50  )
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

Add support for the Amlogic S805Y SoC and the Xiaomi Mi TV Stick (aka.
xiaomi-aquaman).  The S805Y is very similar to the S805X, with just a
few minor differences.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Signed-off-by: Ferass El Hafidi <funderscore@postmarketos.org>
---
 Documentation/devicetree/bindings/arm/amlogic.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/amlogic.yaml b/Documentation/devicetree/bindings/arm/amlogic.yaml
index 0c84c56855bad5b924e6da1da374fdb611c2087d..befc51765f9cc28e11bc12ea958bd2981d638cab 100644
--- a/Documentation/devicetree/bindings/arm/amlogic.yaml
+++ b/Documentation/devicetree/bindings/arm/amlogic.yaml
@@ -73,6 +73,13 @@ properties:
           - const: amlogic,s805x
           - const: amlogic,meson-gxl
 
+      - description: Boards with the Amlogic Meson GXL S805Y SoC
+        items:
+          - enum:
+              - xiaomi,aquaman
+          - const: amlogic,s805y
+          - const: amlogic,meson-gxl
+
       - description: Boards with the Amlogic Meson GXL S905W SoC
         items:
           - enum:

-- 
2.49.0


