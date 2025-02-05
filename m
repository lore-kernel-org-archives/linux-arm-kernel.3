Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A1A6C02192
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Feb 2025 13:06:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fnyUK6beMeleaf/vnmqhL9TlcUqLD4J+xrVEoCblRp0=; b=081xhsEokf/pcGFX/JVgGzgzXM
	LjBhHrlsdb60lNR5MCGgo5RVoDLuENBmOvp/k1LiQJV8pNMaNEgp/H3dgsFVy1nT9frK3zkzCMKHd
	e6BzDSK3F+KNlrhR6oSJo062uslg67oJNiF8iHRm4T7rl0kEVvYqUsUD0eQj6ObtgmB3GHXG4tYW7
	nPIomzRnfvBDWGyApqTYMqNeo/79f8AzaCz3xPv8+CswgtaePnTrShHy8ZHbm29dMDGnh+TZhTLlD
	tvkdy2/J15L334DGgvSsWQ6HBgWUcYLw630PLhLqiATsy7VkpRV0C6TJlTzd1cMiqdZ+gBBibf4Af
	jXXClX1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tff75-00000003Kzk-3M9Z;
	Wed, 05 Feb 2025 13:06:43 +0000
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfetW-00000003Hst-183O;
	Wed, 05 Feb 2025 12:52:43 +0000
Received: by mail-ed1-x531.google.com with SMTP id 4fb4d7f45d1cf-5dce1d61b44so630121a12.2;
        Wed, 05 Feb 2025 04:52:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738759960; x=1739364760; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fnyUK6beMeleaf/vnmqhL9TlcUqLD4J+xrVEoCblRp0=;
        b=WC3x9wW5238wZABIHIXrXhsgb+wpDFZPqGuaKo6JC3EqtlPGfCQyyD33RD6Pqg0TgO
         ByHD3SL290/tmMimXyAzCq6cD1RPQzTX4C14eqKtgMRGbkEFp3xYvK0LC6uD0JlSNpox
         jyMyfzl+9sbkbR7uIFbYnAeX5EiB1XJJHktNDx5K2/TiWXJeBM1uBoXaeRivxcp/J+E5
         nfHtkI+E7oXQf0RON/QCb4OzV4SO59vzK1ptHawGf/FOihQYVU2h86cThYC26d154LnX
         RABIVRzgDlZPxkNlGxL/8bpVs9fLslOovXzQb12qv03LVB55WoyWmCbFjfM/7Co1UbYR
         Q/8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738759960; x=1739364760;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fnyUK6beMeleaf/vnmqhL9TlcUqLD4J+xrVEoCblRp0=;
        b=Vwrx41fj1uE3UYpXivjHndEo1+knuvxXTbcbnKUeMljWHu9gC2PxfzyFPAy2xR0jPN
         L2MLcIX4nyXLMxQfKZiMPfsWC/HU446ujZ4DvdD0CHQgG2MDvxYDrwPO1ADxYHZ3MJaN
         vWx5TXBEne6kUzTKtEHvDwswk7y4WsVifDoN3jI80loYjB4Wgj0JeManikChd/XA3wWV
         f16P+zRIT+b9Qsh1x/kx8BeKyO0CAiWB4CDqM1EvKM4UKAoEddXm8hGkfy85B5C9WX8m
         rUqCEaTBZpCd46Fqjcr1tamQ16NEWaKeOpTNVYy7WkPGUWNDJImyEkcwY3FhIfU/LX4k
         /HNA==
X-Forwarded-Encrypted: i=1; AJvYcCWtvBzMSc4dC6uWhRihDugwTFkgU5xgoA2FVG13fbMZ27PPjvd/srGtKYhWtWFatOlykPOp1PMI9A9g@lists.infradead.org, AJvYcCX3I4IJPgNIb2ZlmXruVaCmAD9H5XhMEk0L4iJT1qtLTNGPcrzdH2kIufooZ6GJCzMqJpJIpp/KVKnh/MknL0R0@lists.infradead.org, AJvYcCXcWLSubHcnivpHGA4OIOcjm+Rx+tA6SRihuX8Jd47I7DkcUeIgqyuWxjwBXkdrIvTTpRsCdo+tk94DExI=@lists.infradead.org
X-Gm-Message-State: AOJu0Yz0vQVRi6zUqP+BhhuxfOncgh4A9U2SkMoqOBJ8iqjfWmHJ7Ed5
	/uqu/iGoNsF6e7DzI/yakBguCup7iiAjRZnyP2QZCCQwbT+xsy6e
X-Gm-Gg: ASbGncsFwsaERB1EgF2MtOCKGp2YN2/aOZe1Lf2h5WfDm1hO3dF1E+OmJtCDsvWJsgY
	MAg2SS2Xcaej/27URgVPeLIRuIL1jEyLXSDkc1cqTNe3JBD+XDQeggPMZ8ogIyDKr/nWyIsezNC
	pqGZdQbVXsVPXFyKlgbzFtGxfR2+z75wmrNcdXaTd2dnnjvb1bmVOZqwNHSAeDpz51N2if8JIgu
	M8+C5lka1oE4MuHYYEmzwNWl6qZjGTG3Rf5DFHVwxQD+Itak0DElg1X930vpA2fXUqhYuBP1aC3
	s/jl17aennxXa8FXiWe9Gv/NkT4/ugyJKoFfgpj4WzNVOw==
X-Google-Smtp-Source: AGHT+IE0wywWb/Z15BOQfyDS/LKQnpnhSIPGUcQiGwnAhhs+76luZoRksyVgrmGjUEmSc4D72uhXsQ==
X-Received: by 2002:a05:6402:388c:b0:5d9:8877:895a with SMTP id 4fb4d7f45d1cf-5dcdb732cd0mr3410442a12.17.1738759960294;
        Wed, 05 Feb 2025 04:52:40 -0800 (PST)
Received: from localhost.localdomain (185.174.17.62.zt.hu. [185.174.17.62])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5dc724055e5sm11559997a12.45.2025.02.05.04.52.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Feb 2025 04:52:39 -0800 (PST)
From: Andras Szemzo <szemzo.andras@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Maxime Ripard <mripard@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v2 07/10] dt-bindings: phy: allwinner: add v853 usb phy
Date: Wed,  5 Feb 2025 13:52:22 +0100
Message-Id: <20250205125225.1152849-8-szemzo.andras@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250205125225.1152849-1-szemzo.andras@gmail.com>
References: <20250205125225.1152849-1-szemzo.andras@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250205_045242_307012_BF4FDA51 
X-CRM114-Status: UNSURE (   9.48  )
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

Document Allwinner v853 USB phy.

Signed-off-by: Andras Szemzo <szemzo.andras@gmail.com>
---
 .../devicetree/bindings/phy/allwinner,sun50i-a64-usb-phy.yaml   | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/allwinner,sun50i-a64-usb-phy.yaml b/Documentation/devicetree/bindings/phy/allwinner,sun50i-a64-usb-phy.yaml
index 21209126ed00..815742c4f5fb 100644
--- a/Documentation/devicetree/bindings/phy/allwinner,sun50i-a64-usb-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/allwinner,sun50i-a64-usb-phy.yaml
@@ -19,9 +19,11 @@ properties:
       - enum:
           - allwinner,sun20i-d1-usb-phy
           - allwinner,sun50i-a64-usb-phy
+          - allwinner,sun8i-v853-usb-phy
       - items:
           - const: allwinner,sun50i-a100-usb-phy
           - const: allwinner,sun20i-d1-usb-phy
+          - const: allwinner,sun8i-v853-usb-phy
 
   reg:
     items:
-- 
2.39.5


