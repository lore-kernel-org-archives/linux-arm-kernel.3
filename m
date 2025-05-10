Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB327C3ABCB
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 10 May 2025 10:41:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kkLGswoAoqo/118QvnKQBtIy92ngW50tFunPEBOrZ/k=; b=ahV/PiynHBHJTCdxwugU3VRcvZ
	2vS+Qw2ukbQbuaJNA3RXmnlrDraVxqsCwBwwGth0PEsRTiV6Jl1TDvp6KE0DtPRsbrMSgp4WIQ9QH
	k9zNc2gWrS8yXvaQcbwdYLWlIn+WuDZqxFP/bOv4VytmLYaobK6GcMg2qPvpY65o1ahNCqwvsZ8Nt
	cXSe/Z7YSSOV80pv2SpUDBQdhIPXf79ADS03KAunQD4JckjgkBWha4QrTYoxKc+dK0fprNKhwqKL4
	zAWF5XqJSA+1wtyMOAefEeNU1Rgw7tOwo+qn1wcj9W4vtVixiTAk9H8xV0Sl9Ssjvbw0BK75ATwc0
	wBxKMSaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDhdy-00000005pL4-0JAl;
	Sat, 10 May 2025 10:41:22 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDhNk-00000005nip-1L8M;
	Sat, 10 May 2025 10:24:37 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-43cfe574976so20100215e9.1;
        Sat, 10 May 2025 03:24:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746872675; x=1747477475; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kkLGswoAoqo/118QvnKQBtIy92ngW50tFunPEBOrZ/k=;
        b=QQdpZHVOzCZ6AVYun9qr61uIF+7lW8wm3VkzQZYsbAkn5k14YuEIgY43a6dRymIQxO
         E4aZ7OwwwJtugv4RIaxpu+mA+lDr2UMO5Zm5A7WAybMiXcZN62qLylsIpg0u1y182Ego
         bWKPQh0wAUSztyIvlszRnHnwlQ/0e3+N4zZBjvAdlVgzARQ+mdqlXzjVPx6B477Vq+6T
         6uhuMcZhMMafnSUys6ErRSwoJQcWpVJCx37ztxr7/JEviZRNsGXGw47L3otYXNmefSBT
         oQtWfd3sYU9yKj9UfG9fQigUV0GmOR5f+Tu89FP9UXG/FT4P0jttNlkTCGTV0YlljRzJ
         dQuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746872675; x=1747477475;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kkLGswoAoqo/118QvnKQBtIy92ngW50tFunPEBOrZ/k=;
        b=IAj3Qx3fffbaEghyY7k8cHFNp36JLM73kwFo2wr6BVBt8Mab7IYIp3hCFyxnHj73E5
         TfbJpt02rFRGNwDnYFe76DW/KAOUMdl+u+Qg2HQORQGR1Ey0vNA+Y5bcyvThpCGvyoHd
         mt9X8nxcJKhG14qevWjVRTbDF+d19k9ns5Eu6u7SHrgOM8RlRretikwuui5TS2fIR8cS
         KU4GAdhHqviKpALtsBjevM3vqOFrda9JpDNj40XWFIPxq51AtiW7m2JMLbXWRNm4dUoz
         UIvpnpDysI8mQRPlNQF0mbBNv4uek5GEnqj68qXUhz4JRLNFPiWv2uPrMFpBe+ME2shx
         1FEA==
X-Forwarded-Encrypted: i=1; AJvYcCVh2IYEvfjvfO0JtnfcD7dLezmJsxt/b0NX0MJlD26xYAiJ3mgbeaZw4jyS133WQF5c8P9+vKZ5+l7zyGl4wIA=@lists.infradead.org, AJvYcCX3y0pYlr1W2g03n+aU0RiCeQYujBv5oJ0pmJ9UVeTdnTfAFIUtVMsHx16y7fK0+7tukf4AmOzlRyv2cx70MQ3w@lists.infradead.org
X-Gm-Message-State: AOJu0YySPlva284A5f9iMV4sWtYBZEWcl7Qs3P67KeA/PcMwxtleK0+x
	EDm6cHRw37iWHDx6fgaxkWx9xGt6piQciS2AvjHiOhHVtL+cLbvT
X-Gm-Gg: ASbGncsTjh9twSxQsg/njKqgVND13r5liGxJw1O8ZmN0JMMS84GEXv+7xGIbfflTNWg
	pzPkkCMPNZmOFDY7zWLXsziA+x+a8j3rwO91VvJgvbLEs1uWOlIE1K8kTbkTeezI+3ZeHW9+B/7
	o8mJM4EppAhgmgggCVjeJvFMYNFmS3SuI7EdmXQMLILJvprR1S4OUPAcfWhFQluw0GwiyR6ssT0
	dlibaMPKRQP61KlEEZeD87YjSqEJW9COOP9a2M9p4doctEOmrzDK2XEDmis3RzxWSdAR3f6dp6n
	5Wn8S6Jf5uG9RTQ1kUrJTYGVYEvP/a5J7D+UzT/5FdAqUIAAIHcTFxskUsYmWRcV8Um5pFgdXSe
	XP3eCfjj/zgG3lgAdNoUuIEeI+FxGopA=
X-Google-Smtp-Source: AGHT+IF+JafMQQHPYahURsqe3MBC8A7z4wtt0SPihBLmK4C7mZNRKXhccsPRtICBBzpKTSQeCySnfg==
X-Received: by 2002:a05:600c:450a:b0:441:d437:ed19 with SMTP id 5b1f17b1804b1-442d6d448afmr45525425e9.11.1746872674462;
        Sat, 10 May 2025 03:24:34 -0700 (PDT)
Received: from localhost.localdomain (93-34-88-225.ip49.fastwebnet.it. [93.34.88.225])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-442d67df639sm57981265e9.13.2025.05.10.03.24.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 May 2025 03:24:34 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Daniel Golle <daniel@makrotopia.org>,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [net-next PATCH v3 07/11] dt-bindings: net: ethernet-controller: permit to define multiple PCS
Date: Sat, 10 May 2025 12:23:27 +0200
Message-ID: <20250510102348.14134-8-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250510102348.14134-1-ansuelsmth@gmail.com>
References: <20250510102348.14134-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250510_032436_356551_FCC4261A 
X-CRM114-Status: GOOD (  10.93  )
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

Drop the limitation of a single PCS in pcs-handle property. Multiple PCS
can be defined for an ethrnet-controller node to support various PHY
interface mode type.

It's very common for SoCs to have a 2 or more dedicated PCS for Base-X
(for example SGMII, 1000base-x, 2500base-x, ...) and Base-R (for example
USXGMII,10base-r, ...) with the MAC selecting one of the other based on
the attached PHY.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 Documentation/devicetree/bindings/net/ethernet-controller.yaml | 2 --
 1 file changed, 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/ethernet-controller.yaml b/Documentation/devicetree/bindings/net/ethernet-controller.yaml
index 7cbf11bbe99c..60605b34d242 100644
--- a/Documentation/devicetree/bindings/net/ethernet-controller.yaml
+++ b/Documentation/devicetree/bindings/net/ethernet-controller.yaml
@@ -84,8 +84,6 @@ properties:
 
   pcs-handle:
     $ref: /schemas/types.yaml#/definitions/phandle-array
-    items:
-      maxItems: 1
     description:
       Specifies a reference to a node representing a PCS PHY device on a MDIO
       bus to link with an external PHY (phy-handle) if exists.
-- 
2.48.1


