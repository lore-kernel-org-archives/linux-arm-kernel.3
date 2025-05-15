Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B3A7C3ABC9
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 May 2025 14:47:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iKNkZgRf+hByVNEHZK9PziDbY8ot36+w8lWIwCIVp60=; b=ZSqns9I4UOPq050fQwaT3j2ugs
	9dB76749CH8xYhllqMPyDP2g1EoqIOPmioSpC3rGrswZHunLZVW1Y1C4DDBl+dLkxOgsWEhplH1dy
	zvblKEmnFc9U8Eqpj08ka2kAwGkbpbhLJbgL9o7mb/6COonFgZOa09mM3z6aqBBHlz/bl7jKxdhZ5
	UpXGSLrJ2BX/BYTxlpHYSZh5OCaLS7bCGDLaLT3ggQz58l2CmdGmcH6jqO4fJsg7/WcjUMCkagxKf
	fKmCIt8b6pwMWPQTcHheIRQFJ/07zwtaIcHOfixQCo5iJFjFRVVcm+M9IyJhB052oClXP5yEr33DU
	8xuseVBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFZrw-00000000w0t-16aw;
	Thu, 15 May 2025 14:47:32 +0000
Received: from sendmail.purelymail.com ([34.202.193.197])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFZoB-00000000v8u-0lLZ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 May 2025 14:43:40 +0000
Authentication-Results: purelymail.com; auth=pass
DKIM-Signature: a=rsa-sha256; b=0OduLDqlvmEYjRfnrz9Jj1+yFnUaeyDE/SDc3GvkGtQofEuYUMXEFTmSIVI0rCxxDDMfq1+JDKPf5Qla9HHR12vBYJKmhvq5dEDSDWOw+4TGccW+WsFGdum1ki8rbMFxcZ9hnoHPAERaYpDoe8DriojXLRn3e5k8cmtW8Crz74ufF3TP8a2IiinkcPkpTJXEYwwu/pIfuIJUXRIe4mIQm6s0GM8aSBDBnC/jf4bE0VtauoIGFzxqlqh2TKQqQ2iWqSYIBfdIWgyHhaW56ZTnSP6TcpOTH0HE13R7Hp0oL067si/jBkC0rLew9Jux6LS/uWB+o1s47X3JA0bViaSXKQ==; s=purelymail1; d=purelymail.com; v=1; bh=2/cGZtwwaQu+YHcCE3TqjM1V5QCsE+O2q7sflQ8Skes=; h=Feedback-ID:Received:From:Date:Subject:To;
Feedback-ID: 68247:10037:null:purelymail
X-Pm-Original-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -1985443548;
          (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
          Thu, 15 May 2025 14:43:09 +0000 (UTC)
From: Igor Belwon <igor.belwon@mentallysanemainliners.org>
Date: Thu, 15 May 2025 16:43:01 +0200
Subject: [PATCH v3 1/2] dt-bindings: phy: samsung,usb3-drd-phy: Add
 exynos990 compatible
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250515-usb-resends-may-15-v3-1-ad33a85b6cee@mentallysanemainliners.org>
References: <20250515-usb-resends-may-15-v3-0-ad33a85b6cee@mentallysanemainliners.org>
In-Reply-To: <20250515-usb-resends-may-15-v3-0-ad33a85b6cee@mentallysanemainliners.org>
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 Igor Belwon <igor.belwon@mentallysanemainliners.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747320182; l=1286;
 i=igor.belwon@mentallysanemainliners.org; s=20241206;
 h=from:subject:message-id; bh=2/cGZtwwaQu+YHcCE3TqjM1V5QCsE+O2q7sflQ8Skes=;
 b=IFpvQcMNLGhVIGVMxkwkcOJEhsgCa6xS4YXYhcKbT7+BkFZWHG/d/F9tdP0Pt2GiW0xSLHMJ+
 3hkft3rI6B/AT/pLwaCvIKBaE7NtuYb7q9v7pvSEhHBe7mM3Ts2K0oq
X-Developer-Key: i=igor.belwon@mentallysanemainliners.org; a=ed25519;
 pk=qKAuSTWKTaGQM0vwBxV0p6hPKMN4vh0CwZ+bozrG5lY=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250515_074339_283950_83C09423 
X-CRM114-Status: UNSURE (   8.51  )
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

Add a compatible for the exynos990-usbdrd-phy. The PHY is compatible with
the older exynos5420 design (two clocks) when running in highspeed mode.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Igor Belwon <igor.belwon@mentallysanemainliners.org>
---
 Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml b/Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml
index cc60d2f6f70e32ea745d523c8a74022e4fb747d2..e906403208c02951ff2bf5ed8420d53ad70eb29c 100644
--- a/Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml
@@ -33,6 +33,7 @@ properties:
       - samsung,exynos7-usbdrd-phy
       - samsung,exynos7870-usbdrd-phy
       - samsung,exynos850-usbdrd-phy
+      - samsung,exynos990-usbdrd-phy
 
   clocks:
     minItems: 1
@@ -217,6 +218,7 @@ allOf:
               - samsung,exynos5420-usbdrd-phy
               - samsung,exynos7870-usbdrd-phy
               - samsung,exynos850-usbdrd-phy
+              - samsung,exynos990-usbdrd-phy
     then:
       properties:
         clocks:

-- 
2.47.2


