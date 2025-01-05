Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E291EE77197
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  5 Jan 2025 10:04:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CcUs5V3NaAvho7+pyHks8hnj2f07Xk/qrLoafEl76mI=; b=kAARIYelszbto2nbgQBE1UPMmu
	E/wkpx2SIMGRQ0j5GE6Vf1GtHrwjGUscoKQGHGJNVP8pN4JcPGsF8YlrqWVXZLY3J2ZaFRZNbZLQ8
	7QmYK7QZEDbfDMKsRlQ+x6yxD0G6GbPzc6WAedM8aUF7tK1HX6z5JI//btUf3L3UvZM0UU595tUm5
	D2vRqk9EdpUnunsew8anU9RSh+MlsxY0/pm4xJh/WflQC2B5J18gRspYDUWtayuomP4bhDngoB1bY
	0Gu+e8G3Kxl6Kf0XC3d3w6g/d2OYcNdk6U+9ooxzBlqv08vq9k9m0O2QpfPZniG+dTcZwk+Vcf7gj
	qwZTaR4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tUNUH-0000000GeZw-0A9N;
	Sun, 05 Jan 2025 10:04:01 +0000
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tUNRx-0000000GeHT-2f9k;
	Sun, 05 Jan 2025 10:01:38 +0000
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-53e389d8dc7so14370383e87.0;
        Sun, 05 Jan 2025 02:01:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736071295; x=1736676095; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CcUs5V3NaAvho7+pyHks8hnj2f07Xk/qrLoafEl76mI=;
        b=CU4xm2D+kBI4Djv1ZdXQWzZi1OU5fYrZqiJnManO/9WkNNf+BKOUTzFirtrjL0TAob
         q1agdZWbmuZTw+dGGw2Upg0TIihwkOqVXUAaPDO7dZ12Hts+8369VkCFmS05pgbXU9Jl
         a6/PKbmk0yqoErGG8Ha2mDoiJA4L26LUVZTI2BG/iOOMhjvyZN0rI/Me/o7NxT9qbCa6
         3NUYsAscFKOybcaBdqheg5mTOxoHmTwUPwOGae/LdLPmakv/acquLxHycHNEnQeWyKzZ
         2IdiMVgwzr09sDtGTX0DHXLiL0yGjw3DDsyzXFZSzjHSa7Vnal7CHs1QCjZZzRrX/D4Q
         4JJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736071295; x=1736676095;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CcUs5V3NaAvho7+pyHks8hnj2f07Xk/qrLoafEl76mI=;
        b=IT+MZkPd+woBwkG6ZiyUj067NsJTYarqSpzcGrux/4yinnoPo2Ltf3McMonUQ9zonv
         z4GHa/Bg/b2R1x4//OlfUcKI/Ng8DTVxAwnlotdm8JyzWad1R7aQnKunYW4b7qfEiGRC
         Scd5ZqLeFLiqNYyzRAKAOO+MW4mwYj9SUSPbFw6F7HMCO8gW/8ZV46xvYaNT3TrKE3Ye
         JBV1zy7rQk6KyQB/D1om8pKrRNDGdoGGsuD3GxAMdticoKL8m3NeuyfzQafngnpiUg4j
         7h66kvWfBUWRZnfomr2NIM5Lt44A+wbWukTt5EjRkQwFLh2TCjBfA860rHvsKAycgQzP
         xKvA==
X-Forwarded-Encrypted: i=1; AJvYcCV50FKdnv5rfBPsf6mjCFZE/dDC9xDi/UzhIhld+JOlHPbMAqQomiDyGwOqFkC+kYxmNxHKLhGpLp2d724zZz5w@lists.infradead.org, AJvYcCX0uNUrfnzvmq5BDDzxXkwoNyCB6a3lVq0fXfs4CxuacgVRZ2Bqw6D2cOTasO0xy9NDVaM9fz5h5uA6p5hdS6s=@lists.infradead.org
X-Gm-Message-State: AOJu0Yw3WyhWyGFEaxJ+q5kAVAvgKJzCXC6I4kQL567DzclrcPzpE902
	7l0XDOZQdF/FUy351CGbpv+/VwVPvmkfIVl4euHswPnMKLpL50AWaY/xHmQrpw==
X-Gm-Gg: ASbGncs7WtiwxeJ74xQQXILy0eWcIrmKB5KL1Rbh1J7GnAnjfNs35+AWMTnM1Dk57ta
	f5MPonsi/kIiLRbHP9h0cNSZhvUP9jjSv3m2GCC1BSACdD60hptryyNPxuV5LkqW/zW3LeratmJ
	izS+Jua3EDDRmqzuVEPE+M1rmlSeOVwWNR12C/qp0oRBtKvYvF3HMwiKEeoG3Bnxw+Di4feh59c
	ysTfp/5WpyJg7trlXSuC/3tMspp/AiaIIiGgySbfxHxgfVIBPbUgWwPz/4=
X-Google-Smtp-Source: AGHT+IFcnNvf44eZ0+9ujLatEO7qgcKAmJzYq4XwToWXna9MMrgtLSQTxpEmZMuy9qZ2buHQgJmctQ==
X-Received: by 2002:a05:6512:b22:b0:53d:e3a6:ae8b with SMTP id 2adb3069b0e04-5422953fdf0mr14556118e87.26.1736071294373;
        Sun, 05 Jan 2025 02:01:34 -0800 (PST)
Received: from JetTurbine.homenetwork ([2a0e:e6c0:20d3:2100::1d])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54223813806sm4580828e87.114.2025.01.05.02.01.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jan 2025 02:01:34 -0800 (PST)
From: Ivan Sergeev <ivan8215145640@gmail.com>
Date: Sun, 05 Jan 2025 13:01:28 +0300
Subject: [PATCH v5 1/2] dt-bindings: arm: rockchip: Add BigTreeTech CB2 and
 Pi2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250105-bigtreetech-cb2-v5-1-923f911b10c0@gmail.com>
References: <20250105-bigtreetech-cb2-v5-0-923f911b10c0@gmail.com>
In-Reply-To: <20250105-bigtreetech-cb2-v5-0-923f911b10c0@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Ivan Sergeev <ivan8215145640@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1174;
 i=ivan8215145640@gmail.com; h=from:subject:message-id;
 bh=p5DkTJDu5QlNVWl35gjaVUthknkZBv6iZeP84hntyqE=;
 b=owEBbQKS/ZANAwAIAbzfXRlQM5b9AcsmYgBnelh8wbKwjV0jSnORnKj5gri6tWjV1nKWx9W3i
 G5KSaDFdBiJAjMEAAEIAB0WIQROCZtApKFz1fvvsOS8310ZUDOW/QUCZ3pYfAAKCRC8310ZUDOW
 /VAFEADFqODzeMLOEs3mBaz1dwUu5ZF5X1/KDWLNtr77NscD0wHI0qzttXH04B59w11+Iz0vDHT
 9QOB2jXHT6we52Vwlic38wD6K8e7vRYjuyY/XVjMAwG/vBVhAE//TNRlngowg2Qv1F7s9KFlIBI
 BMTLSugnG+t0MDgxOBbmMqLoBU64p8kVCFeav+7KSgilDEJGmjoo4e5DY7lypHbJIK3/5DY89A1
 Dy60cV0GQT9lvj89AcXi6Pg4qUaWJPQscREDN5qzA8RmSUXy06y0SItzB7g4sSq6nBS+JJGIJ2E
 OCEvKGSchJenHCT73iEWKSQQ3N7sS3woilffxgHkb3JeUg5q+un4Ci2IL36KypjDo/TIrR2MYmp
 q50GR+NM4aMOIgOIX9IEAfhVqHD9pNHK1W5m09Gt1rDlO+oEN7+wBR4fdKTVJYnedZQNhsEyNYR
 5H8A4YHGrprOQLWsTTs6XAWVuQNFg5W8lJ/tAV4Mr3xOS3zhfiNOB0oIGmTbk1tM06JYNwfaC7H
 SbVdssc7BJftFz5hgqHxc7wvtDEgDVA6FuWnSKJLZXeLFe15KhFAjp5WOebWFjBm1Voyd744YAn
 NDTk1KBnvEUp5QHrHgxwKIef5I+UmBAc3KvavlzhCm1Dtx7hWqBji8zANxDqk+As192n18zhD6H
 IMDVC2E08q6+W+w==
X-Developer-Key: i=ivan8215145640@gmail.com; a=openpgp;
 fpr=4E099B40A4A173D5FBEFB0E4BCDF5D19503396FD
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250105_020137_670504_DDEFE011 
X-CRM114-Status: UNSURE (   7.74  )
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

BigTreeTech CB2 and Pi2 are Rockchip RK3566 based boards

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Ivan Sergeev <ivan8215145640@gmail.com>
---
 Documentation/devicetree/bindings/arm/rockchip.yaml | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/rockchip.yaml b/Documentation/devicetree/bindings/arm/rockchip.yaml
index 753199a12923fadaa48c407a8e55e7854db7203e..349453b1676bfac45abf5cd49d6bd9f847281213 100644
--- a/Documentation/devicetree/bindings/arm/rockchip.yaml
+++ b/Documentation/devicetree/bindings/arm/rockchip.yaml
@@ -81,6 +81,17 @@ properties:
           - const: azw,beelink-a1
           - const: rockchip,rk3328
 
+      - description: BigTreeTech CB2 Manta M4/8P
+        items:
+          - const: bigtreetech,cb2-manta
+          - const: bigtreetech,cb2
+          - const: rockchip,rk3566
+
+      - description: BigTreeTech Pi 2
+        items:
+          - const: bigtreetech,pi2
+          - const: rockchip,rk3566
+
       - description: bq Curie 2 tablet
         items:
           - const: mundoreader,bq-curie2

-- 
2.45.2


