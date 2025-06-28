Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7C3AC7EE39
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 28 Jun 2025 14:38:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X/02Lsj/T/97jLP9Ha8ukw36R8/b/6z88Oefrj46EVM=; b=G/kLmKylLHAwFYOelaBg6JJBFF
	5SEQDv7rFi3ybNk0E2oTsQn8awtE1JmULOwHobJXLoUqTM7MnajfNKzJ6h+TPlJFbMc8LL9oUSLS0
	a9CZns8QlfnvlnksSB4VToOolcBaQYTidO2z6v+pGf/dyZ8Pv6LECQFv2uhVoBXlw/4cNJhhOyZ4u
	hxef0wYSlPnR/53ykAQLHI4YmltjUl/V4k7Uz7yOaufIPq4n9b0IaFRwx2cbAMtr7oTKnh9bQLL9d
	ty3MFkyT+V5PU0DhL4df7Tz0Z9fHAANURLcQ3yyaegVz1qXnqyNNgHL7h1DeVsxzdek3LQsfxJHLX
	4SRmtc+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVWhI-0000000GsnH-0rkQ;
	Sat, 28 Jun 2025 14:38:28 +0000
Received: from mail-yb1-xb30.google.com ([2607:f8b0:4864:20::b30])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVWbu-0000000GsJw-0UrB;
	Sat, 28 Jun 2025 14:32:55 +0000
Received: by mail-yb1-xb30.google.com with SMTP id 3f1490d57ef6-e81a7d90835so533178276.1;
        Sat, 28 Jun 2025 07:32:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751121173; x=1751725973; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X/02Lsj/T/97jLP9Ha8ukw36R8/b/6z88Oefrj46EVM=;
        b=WP6S44Sa6+7WgHpzbaJxs0n5F24OVkX8CufKYTDuFbG5JxQLlYeuE1z6ET2SVBaZOO
         8pFf9wMktySkt5Op4PIwPAQRxRMOFL8igYDtCLCglRoF+EYU7DRA/1Es53CPyROJhiy9
         b1K/7/7OTRJSsiVJjg8Md3MwsS1QymAtvuN+S152My+sonMeKVxjUPUK8tw2pYNJvWkM
         Fk08gaMb1OdpFNb5R5xpF4q3w6D42JKOKfAuZQBKgVnITHuU2CQQ3NNG3roF/i0KjKCA
         qX8Az6cAI1K295g5C+wGqdnAcmyVIHOcL+/+r2hzBrCuuYqX/PwcwmxdSqwWt/gvPStH
         6HGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751121173; x=1751725973;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=X/02Lsj/T/97jLP9Ha8ukw36R8/b/6z88Oefrj46EVM=;
        b=gX6/hyCQmQWd5E1BPc61CeTLil5MzA/AAwY6e2jz/+UIwHGfXuLvfVceyYlONbaMKB
         XFX+Y3KfBUqvX52XR13FIfxN9yrSqlMnH3FjYQUx0P0NYfJmpDxKbtAyzbCO3ML2jeFm
         ZOMxsBbPUHWH+NaC6nX+pRS+5sAMdhN9BxpROR1y/drLW/rzXlqyF+u9DGyRGownE8iG
         PJadYBrRN5EVakPoI1IabVGKO53nD7b4xL2z3mXYXsjlHG9eIKdh7ZIer5GlQp7BXLcO
         7ll+Zglu88LpMoZ+0p+9ZQXFXrwLvcvrhylXZzndxXnDyglo2PdqBf3claljUrubuyu+
         CZ/w==
X-Forwarded-Encrypted: i=1; AJvYcCVyClelSWh0zA8a1kUnER/aO07uwDH4+KZ3sfstp8k2Vv069DWTRejflYb6DH+E9HsX+qinVMa/kFZeVykeVoI=@lists.infradead.org, AJvYcCXN81uBexTg+L+xtfcQ0WALNM5dCkuHR2uAJk6CLa5D/4CUodVuaV3dsyITSnAX7ZRn+m4UkPTCW1lHh8k5eQ2P@lists.infradead.org
X-Gm-Message-State: AOJu0YwQWZtqBGsuC0LVm6neUHnAK4tfkYcQ31pQJ8+z50i9uwOY1qmu
	vkKOzQxVovA7wBqjlZLWLIiiLL+qpZg7YS9s6yY3KPYMOrKVaoIq7JSK
X-Gm-Gg: ASbGncu+0NxpkSLPJS/4ubqXxJUBGWXvhu1UF6OMzzf1xdcCCzwHPUMhPVYymtfE4zK
	szEj17LVFwxMNEeefaMc5XXr/TzBGoGzoi4fBrBOLUXUzo82WYXT5G6c4svP9J5PqXQad/EoWL3
	/rRDELhgDaZUuLlZW3AFByum8qA1HJBV2YwoqCtj8qf88spTNROzEAzuiqvdfP/gRq0BCqWdFYJ
	bw+YWfug69Hitthc8gMOwf1rrRBAIagJpHQtrHT43rkXTkvp6geXNLmQvuKOJXQQesq5x9Y9CgD
	R8GS3w36WcOe/jlwSuPAmrwqq7cRnPdUxmnEVYT/exDE1PtTiYWHXbTcChCVyBJ4g1i5XEQ=
X-Google-Smtp-Source: AGHT+IGWGkuH751nkoncx6f/tnMkzFFAkH3Xsoy1345CUebdsXKdkIGHBQnf4vWQpcS7mthSyWmNkw==
X-Received: by 2002:a05:690c:9418:10b0:707:dba5:2e44 with SMTP id 00721157ae682-715171b48camr78145837b3.30.1751121173125;
        Sat, 28 Jun 2025 07:32:53 -0700 (PDT)
Received: from localhost.localdomain ([192.34.165.40])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-71515bee257sm8393477b3.23.2025.06.28.07.32.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Jun 2025 07:32:52 -0700 (PDT)
From: John Clark <inindev@gmail.com>
To: heiko@sntech.de
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	John Clark <inindev@gmail.com>
Subject: [PATCH v5 1/2] dt-bindings: arm: rockchip: add FriendlyElec NanoPi M5 board
Date: Sat, 28 Jun 2025 10:32:28 -0400
Message-Id: <20250628143229.74460-2-inindev@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250628143229.74460-1-inindev@gmail.com>
References: <20250628143229.74460-1-inindev@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250628_073254_156730_36B84146 
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
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Add device tree documentation for rk3576-nanopi-m5

Signed-off-by: John Clark <inindev@gmail.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
---
 Documentation/devicetree/bindings/arm/rockchip.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/rockchip.yaml b/Documentation/devicetree/bindings/arm/rockchip.yaml
index 58b9312c6c73..28db6bd6aa5b 100644
--- a/Documentation/devicetree/bindings/arm/rockchip.yaml
+++ b/Documentation/devicetree/bindings/arm/rockchip.yaml
@@ -300,6 +300,12 @@ properties:
               - friendlyarm,nanopi-r4s-enterprise
           - const: rockchip,rk3399
 
+      - description: FriendlyElec NanoPi M5 series boards
+        items:
+          - enum:
+              - friendlyarm,nanopi-m5
+          - const: rockchip,rk3576
+
       - description: FriendlyElec NanoPi R5 series boards
         items:
           - enum:
-- 
2.39.5


