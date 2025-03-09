Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 006BEC28B2F
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  9 Mar 2025 13:42:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZbSAM91ADrJHfalqGDD88Hb16SIvmOajhEqLWyeYm6g=; b=N0Fine2BeLwk6+Pc7IyCv4B3ib
	kJeexvg1Fsij8P7MMdF4BrCc2pSxNqS/J4TXQhMRlFgWVd7BiXuCVgjDjOmq1OEtrI9ddk1VX9m3w
	WbIKZgrSTnJHBRREXxDhTDSovxjaklHx+cOLi0oZSJ3p8WgOu9xt5XNWIeiUYzE+HZNVOrqo1y9yD
	YB80r1QfnnJrMZrJg4CBpio1F3ZL9SsUAf9nZDNS9cndyfJCnQvUtc8k7GUziEnE56NT5Z8WmV6f0
	Yoahu3VdcL8eorJ+uAqzG9SNx4LsHDSOLvvukHvbnn3jPWVdzooaI7dNQQRYgq4xCuUkpq/VUrgTz
	nVMKNeJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trGv6-00000000c5h-3jwM;
	Sun, 09 Mar 2025 13:42:20 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trGjw-00000000aTH-3x7b;
	Sun, 09 Mar 2025 13:30:50 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-390effd3e85so2961155f8f.0;
        Sun, 09 Mar 2025 06:30:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741527048; x=1742131848; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZbSAM91ADrJHfalqGDD88Hb16SIvmOajhEqLWyeYm6g=;
        b=ffVHkT0CMoCXThTI9rc/STOumGKvqd9qTf6RPttZuSctn8a/USItCYMnhuUE7thGX5
         m8MV7sYdKyNJ53+knMzH+lqixkhhAvrul4LpyUR+B4OVMAWp2/25IcAiOexNKtjv4v9G
         xW6XOYzlUxG88Ahlm7URKfqeXDx9VuMmQnCiaUWJIjgokVVFiKTSkINhblEUhKWsS+aG
         ErJN5eFJj4Y0ekS7D9GD3gqm8KOyGZRir46tHA7j5Ty+SJ9qDS31+JcqOIYIr+UQpWVM
         TnEnYHeD26RJXyZvcispes7r7HpHmMR3Hwvlw+bEKxJuPreaWVGU1VI3Sxfpv4kU8Aj7
         C6/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741527048; x=1742131848;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZbSAM91ADrJHfalqGDD88Hb16SIvmOajhEqLWyeYm6g=;
        b=MfdiyujcvfefMiKo0AgajPvYNr4LBbTwNN6hwaqrM3apXXKrI9V+GRL1r//5va1kOY
         j5QKsm2CHUH3goFXaGEKMpNU1W45Hv/CHJK1fQwnm0UQys50B7grz/Fx+LLtRPApVOa1
         DXggoG9dws+wSsPNNegzIOB/b2Oautqw192On8BEGz+fHZKoND9lr2L2g/9v9/uJRZ0V
         WvWsGGoueB8iZKbDTJJhOnE31sKl1+k2mb3HCbzfEln/OnocwBqs1+EMcN+/Z8pOlZzD
         SbFmgE5QdZCa4bpQpOlxMlkYbfywmKtjkSTunBwedeSLXRpopUtWLQJOb4Fi0b37dulz
         jyIQ==
X-Forwarded-Encrypted: i=1; AJvYcCUBekgaPP8EK/KSiQvMdT8WyLxrgIEtuA/nvXJ42+AsbfrH4R3GHmEzu+X+wbG4rX3oX2/XMt3tE4seCf9HYpI=@lists.infradead.org, AJvYcCWi7tzyE4/1lFdTM96j0ZmIWdn2hbiw864EOJZNduEfW/4T+si+xwhiEPciO9cE4Y4ELbVFeHv3dgzKPFnZ+6CM@lists.infradead.org, AJvYcCXbCNdmcZhHR3X2g1RdPhJk2OM4IW9KE+T4xWjIRSiP4sxVEJV+MlQM/oO63+Pes81NkkBJTHItc5Hu@lists.infradead.org
X-Gm-Message-State: AOJu0Yy5MGZAchT1jYwSqRV0HTXRe7JYI8Vw4yF5oROGs2ngYOirkMZ/
	gntjgTim3jltMBGYmhWX08UMHJV5lOYM5J4tsbHZtwVUs9xE7XUe
X-Gm-Gg: ASbGncvi6+bexD1PHzFag2U5+fi1ahfmF6Ui3THYxxZHCCBsVhZr3KzKXzsJXn6nhzG
	4IVU9a8YDkWXinFLqOm7iP10+j7TEGsrC6+m7lRjUqqeYtqkLXkMI8At09lFlz36C9gh9AhAxbk
	zeoHBDprMDW4VBLuxNkNSQqg6xKLL+c7BdZO6x44g2RSXVIS/MUXINTl/JAh7q4XyHbCLQM5eqK
	gKMA9/B0t9nZWE8RpvVBkU4RZdHWlMPhUx+yH/dKrcMH1KKCtV5LHfneV7leCGW/RcsZLp/PKyT
	OSqhpLFz5CQ4NxvjbsRtPo4C2fxlc08Ep2mbFzYHfLO6dgSALH7nznMpNMP4bzZYIbR/dxg7YBi
	E1OiAvluK2JOo/w==
X-Google-Smtp-Source: AGHT+IFjxljLxw+g6msj/2zStIgexQhH3tclnIAh4+AmOpan6twS1irZOwFGMlz3N6mJw4r5TT41Og==
X-Received: by 2002:a5d:59af:0:b0:390:f745:bbfb with SMTP id ffacd0b85a97d-39132d7d4e1mr6797683f8f.26.1741527047554;
        Sun, 09 Mar 2025 06:30:47 -0700 (PDT)
Received: from localhost.localdomain (93-34-90-129.ip49.fastwebnet.it. [93.34.90.129])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3912bee262esm11867536f8f.0.2025.03.09.06.30.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Mar 2025 06:30:47 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lee Jones <lee@kernel.org>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Daniel Danzberger <dd@embedd.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Linus Walleij <linus.walleij@linaro.org>,
	Nikita Shubin <nikita.shubin@maquefel.me>,
	Guo Ren <guoren@kernel.org>,
	Yangyu Chen <cyy@cyyself.name>,
	Ben Hutchings <ben@decadent.org.uk>,
	Felix Fietkau <nbd@nbd.name>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-phy@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-usb@vger.kernel.org,
	upstream@airoha.com
Subject: [PATCH 06/13] dt-bindings: clock: airoha: make reg optional for Airoha EN7581
Date: Sun,  9 Mar 2025 14:29:37 +0100
Message-ID: <20250309132959.19045-7-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250309132959.19045-1-ansuelsmth@gmail.com>
References: <20250309132959.19045-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250309_063048_980947_AAEB8992 
X-CRM114-Status: GOOD (  13.19  )
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

The Airoha EN7581 clock-controller registers are placed in the SCU
(System Controller Unit). Now that additional pheriperals are supported
for the SCU, a dedicated SCU node is created and the clock-controller is
moved as a child of such node hence the register property is taken from
the parent node.

To support this, make the reg property optional and provide an
additional example for this case.

Driver supports both old and new implementation by checking the presence
of the reg property and parsing the register accordingly.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 .../bindings/clock/airoha,en7523-scu.yaml           | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/clock/airoha,en7523-scu.yaml b/Documentation/devicetree/bindings/clock/airoha,en7523-scu.yaml
index fe2c5c1baf43..84e6c3d43868 100644
--- a/Documentation/devicetree/bindings/clock/airoha,en7523-scu.yaml
+++ b/Documentation/devicetree/bindings/clock/airoha,en7523-scu.yaml
@@ -51,7 +51,6 @@ properties:
 
 required:
   - compatible
-  - reg
   - '#clock-cells'
 
 allOf:
@@ -66,6 +65,9 @@ allOf:
 
         '#reset-cells': false
 
+      required:
+        - reg
+
   - if:
       properties:
         compatible:
@@ -99,3 +101,12 @@ examples:
               #reset-cells = <1>;
       };
     };
+
+  # Example with clock-controller in SCU MFD
+  - |
+    clock-controller {
+      compatible = "airoha,en7581-scu";
+
+      #clock-cells = <1>;
+      #reset-cells = <1>;
+    };
-- 
2.48.1


