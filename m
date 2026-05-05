Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5800CCD3427
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 May 2026 18:27:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zsjeeVtAkvtmQCzhPvbG7FaRQP12aRU2hZI/S64sceQ=; b=nX9MZMzjK0++MOfaNcHN3xB+d1
	tHeypPufwpxWTKuRN58PBeQozp1AWHcGAZIbgQXF0vuTbcJ+KHigrSUgyZM/MAgOhv4hwXb3wSAMF
	GryT3uiqxKGzTVfvj8ZWOLBLAy7h/Dz4buUfu9sYDjdLCFCPt8mPJkql+SN4b8Bd4GkrzTQOvKAJ8
	0mOU7ZFqqxLQa4i3FQTKi7/J2YyxuZqMKfVgt2hHXxyd+lItk0waiswrzE1b6FhBK9vOr9RVzjy9R
	mTnj+uD81yEiZkHvuDAWWRrOIi8pLtbowTROPmBxkXX9LTiKDk7WtqmKkpIjSbyCNeGv5fNhfTTHb
	DEialQ9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKKUf-0000000HAU8-2XKD;
	Tue, 05 May 2026 18:27:41 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKKUc-0000000HAPC-3EZq
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 May 2026 18:27:39 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-48374014a77so66099615e9.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 05 May 2026 11:27:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778005657; x=1778610457; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zsjeeVtAkvtmQCzhPvbG7FaRQP12aRU2hZI/S64sceQ=;
        b=OhpPrn/DOM9TuCivqfv5bLG2HxEC4iM3nMv+62IImR6amuFSJbpO8tb/RwbQkM1687
         02Trp6UtJWXNBZjx+5mTmJvpZXCwv6KLDev5hBNTtVnIjTeYb0rGtj3m8Rp8ds0LPLMz
         hDq+KIOjDgXr3oNACNbD6leZZWAHW44Qwlfdw6J7MqoFQH4FrVLE7/3HZgOiCLvpHzaT
         89nq+WLBxEexDFE4of0CCXdJ0VqwWX8ZEaAInPwcHgdz+KubdIDLbJ5c8gBQmPumfJIZ
         ZGI4OyDUoX+z6gMiD7Y07M5lspEDFuItXSc0g9unOHOIbYO3gZ4QHIyi4p0Ep+w00P6o
         DPeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778005657; x=1778610457;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=zsjeeVtAkvtmQCzhPvbG7FaRQP12aRU2hZI/S64sceQ=;
        b=m0VvlulRrePED7i74nBxHCzMouX6KAxhJwa1iCgharQPGlYsEgZJWEYBN6UMQWyUrf
         xLkPgrAQRl0bRAwQCoiHCs1uanuD2Z5aQ6AZOjwiWHJ2HqO8bHSB4YsmmnPd+KUOXspr
         uGGk55lOgPakZen1ypOihB/vRaRXtKg0uTBGGrC9Jii4fS/TJocm0AuXqg5T9hYcsXSI
         +GfJrMFI/cr+SJyU2IuBVCV/6t4ixOSpZdcR6JkPXMHpVRLtV3hX3SKyFwWsUj2AzE8A
         Lvn1FaMytE9AHApIz7cvnPS2I5J5V0B6RNsgHGpa4Eg5PEi30NcJhEnvo9IvnAWrNWgk
         HjtQ==
X-Forwarded-Encrypted: i=1; AFNElJ9DCmdIIBikaLj4R7m22WJI6Q+hXn4J3XTK+Vu3yREd8IGNvXtAVoDOy6zfNxiip5ScK0ZEJ8DDz5JGEnYujx7h@lists.infradead.org
X-Gm-Message-State: AOJu0YzhiwwhYJ3fiIrI6TPndjdQon3NZjgYOH4a4V6lXtAGS1VqYtnS
	qhZalqtgLJOpICmKolN72melMgITzU33NeMUOR7rOr+ca/91JPMPcmTa
X-Gm-Gg: AeBDietrazGeqW0u53Gb7qlTeAASY7MyQ+QrBz62AKKyBjedx1pryBaR3A7DD2nfXVO
	Kw2/luMbkc33WpMzYKt2obf3D9WkmzS1x6AZ7SEVLSpj0CLydQDdBsEbqN0PpYJ9s6tPChhQN6X
	qvgVfSVtCxHLS62Cf7QMB/+QB/F+CNGulslkRnHz8KNlctzLEnRI1evMehoRanvQ0BDFFnxkQv3
	WhGqwVTBBE/DOSQJH7d1jpvzboRS+MVWa6DzCpnBCt9nUiUkhrmBaMZpr/yxdHqnzQY15ij+vXD
	AzcDvwBlj41BSuHB/IItRkhOuXHvtCEf424EbsTo141RVkMEe5s4hoopWJwtmddk24chD1xM+oz
	1lclxYdOoDzmttFRNIoEKVHX6I5uvLA7m198LN4zI5xck75cnEuP4JRVwMdhUNpN06+naP7k1Ia
	ahmLMPZI50xfvDyLivyGZuqwFDgSSQLfTz0OLo6lQO6OGR+V0hC8JkKtNqt/LnpebpRkxBvn4xu
	SufSVM=
X-Received: by 2002:a05:600c:17d0:b0:48e:526e:101a with SMTP id 5b1f17b1804b1-48e526e115bmr262175e9.12.1778005657086;
        Tue, 05 May 2026 11:27:37 -0700 (PDT)
Received: from Ansuel-XPS24 (host-82-59-227-65.retail.telecomitalia.it. [82.59.227.65])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-48a820c865esm408208245e9.5.2026.05.05.11.27.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 11:27:36 -0700 (PDT)
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
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Daniel Golle <daniel@makrotopia.org>,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	llvm@lists.linux.dev
Subject: [net-next RFC PATCH v5 06/10] dt-bindings: net: ethernet-controller: permit to define multiple PCS
Date: Tue,  5 May 2026 20:27:07 +0200
Message-ID: <20260505182713.27644-7-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260505182713.27644-1-ansuelsmth@gmail.com>
References: <20260505182713.27644-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260505_112738_828889_544C738B 
X-CRM114-Status: GOOD (  11.30  )
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
index 1bafd687dcb1..51a8a418955d 100644
--- a/Documentation/devicetree/bindings/net/ethernet-controller.yaml
+++ b/Documentation/devicetree/bindings/net/ethernet-controller.yaml
@@ -85,8 +85,6 @@ properties:
 
   pcs-handle:
     $ref: /schemas/types.yaml#/definitions/phandle-array
-    items:
-      maxItems: 1
     description:
       Specifies a reference to a node representing a PCS PHY device on a MDIO
       bus to link with an external PHY (phy-handle) if exists.
-- 
2.53.0


