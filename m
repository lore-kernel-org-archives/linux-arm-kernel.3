Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A12C606A329
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 19:00:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=IKFnWQNm;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yZrk3nCD
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=KWxxvC68veJE9vLqTWwy/EexVQuI9OEnPBoyBsJoQls=; b=IKFnWQNmEb0h3w
	/Zslk8fNcRFAEe1xxV5fSJlJq7X7YljmgRiHCx4CVzPZCvvJmQ8VT0wi+4NADNrD/3aPwtu6G0ooE
	bumvKx3HAr72XmXvaLN+JVaNJEHjN15961xxuWnTt4UiuV90WOstIDcOzS6jJrUnsqD9PvASQr7s1
	E9WNRcDqytTr28YakEqViySWDALenE4x02VmRxbI8cnHDzzu5YbsQPVlpp5vxgkFLYDFqycI1y4YX
	pRM0qxVZRLYQXk3vh0kInN4axZO+6xnnH3OlRjR0gbgm/CR5cOHL21TIEFUB8vlFnAuvTAdmrrFHs
	23uZnf0OyLCoiR2dVz1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP2hR-0000000AGQW-2G5j;
	Thu, 05 Nov 2026 19:00:37 +0000
Received: from mail-oo1-xc34.google.com ([2607:f8b0:4864:20::c34])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP2d7-0000000ADcP-1bnJ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 18:56:13 +0000
Received: by mail-oo1-xc34.google.com with SMTP id 006d021491bc7-6fbf1ba31fbso921377eaf.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Nov 2026 10:56:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793904968; x=1794509768; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KWxxvC68veJE9vLqTWwy/EexVQuI9OEnPBoyBsJoQls=;
        b=yZrk3nCDPTF9P3GgfRY7zlhGvs+arS22SZi6ixzk/zr1t4A6I6ZbxTKT6BhrqEvGf7
         8k7K7UL8pafnKJ5Txwm685SOl9ixEDYmsnB7eaW+DHLz6iGoPRZjhE7MPdTdIzHXNPxo
         4vbzqWiNxv/iA0WKG/MZRxnAYhemR/WiBAfAGsky0x65er66xDTOE9B/tkB220kFgYd4
         FgY14KP6q2FHB9sEXrydvRjUwMiOVgok1kDUvNTb6ZFaUmFe8wDMIhkfVUO3rP2X6Y8A
         +gnxUUilawSFYulibtbhusnG7WHe4KdNtQj5sL6dbSuXDukFHCrJaJTB7c60ohQ+mF+0
         pPtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793904968; x=1794509768;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KWxxvC68veJE9vLqTWwy/EexVQuI9OEnPBoyBsJoQls=;
        b=0gSXgiW1v76qWsjXS2fEdAguotP87Yk+ZCwmLyYdJW0Y62rg+xDRTI3Z/r+nglPkCj
         N8oG4n/eWMGHhUHOTWIYJ0ubKMyUXRxsJbZF/jCgN4szA1spyF7QyPqk5sSsKx7dEGjh
         kMDXiV3lRUX9F7Jn2mUE7tUHE95pezSWeejUB3NfKfSxmulPdnXWQKwGWusEYBmXLehQ
         JXuRoiG6hKNI40lxB8yvpjZ5/f7x5VpQeUw6OCBQPh0SV/JWgj3Fylai6bnrnJPAE16p
         miV8+nihRP2C0tuUF352Ybq4nYwTNIGtS+L/RbUp2H7OT79VbRFcl04Q7GnQp88FyXSs
         5lWA==
X-Forwarded-Encrypted: i=1; AKwUvByGQnyR/LJrbGm0iebGViX6optMs40rgTmI9oLwBLeOgvSFDt4c670JRkGZUD21e5M9aRbTQmHQcjHtosJUYYb+@lists.infradead.org
X-Gm-Message-State: APuU4Z9UFiCGXLvDuKRSSJRPXZmIdXuXQVAacC5TRR5QMwnJkapjCU9Z
	3lFohXFrJErwZTve4dr7slVbtcvWfNU/EbkBHMBZ7qDq849qttTpZZFV
X-Gm-Gg: AYBFou3XALsloPSKfymhhW9r67WDiMk5kfSJi62mPfd4jMZOtbyVvDno6ONDPrGbQOC
	0Xj/711MgV5u7PXFP1X4ftmcJfKhqtqSctpe7tqqQRQDsemkyaFd22KVGCMLiYCD5tZKfWHGz23
	IjauUB3t+t9dCCbmZiORCgY3h0R0tyEPxuG7ab5zZJY/2nxayiRxAeH99ItTriWiEvmtJ7AX9gN
	I5+V0/sZU5dICa/3qSlbxvp04y6yZFWqo6dDsma8BloCErACfH7KYp/C38sQPfFtJIUeN/JAymU
	11oxj5ZMSHg4jFlF8MihRu7ysyh5B5FdmDYEcDhXXBiRJ4lOUoDW4Vw3DI7ppuqdvwwFpZ7J1+a
	JVRNmDGH4UvUCy1pLNfMOGUrnO8XYpwiNmOIB2o/GLmmv+5QqsGk7pz6jlX3TRTjFu41NdPJVi2
	dBulOUhnUlFuPUbZH/X1xodw3sg6STt4xz/bkdOrwCQ4JTabftgvozE6pPIcOaoJFAr2LozFndx
	MZOvvokA36urWcgy4H4f6ko/GSngzYVNmO7EM7js0t99olW/6PiZATO7tssZMAWcwTPl+ZkLifc
	7VCDxtt7mtb0/6zZkYBTk2YXsJjX85WZvW1BX5xbRUOBrsKGXFDPp6Ir5n5yqBqT0AYLtGAG/7t
	fm/tKgXW1wJGozEkNWmVJZAuZEw5z4PwXhGoGL4g08LY5rOeqWV6dXjR7nLbeGf5DQUQBu6VXtR
	P14HSO9d45tcjJ5P2QqHvqkctyQJ1tvyVuF9wnTCRvT1xjpXs+uhOd
X-Received: by 2002:a05:6820:16a9:b0:6f6:3762:5f9c with SMTP id 006d021491bc7-716e73de6d9mr410801eaf.11.1793904968458;
        Thu, 05 Nov 2026 10:56:08 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-716e99465dbsm115897eaf.0.2026.11.05.10.56.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 10:56:08 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 05 Nov 2026 11:55:41 -0700
Subject: [PATCH v10 25/26] dt-bindings: mtd: sunxi: Add randomized OOB flag
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261105-submit-sunxi-nand-vendor-oob-layout-v1-v10-25-dca1f6ed29a8@gmail.com>
References: <20261105-submit-sunxi-nand-vendor-oob-layout-v1-v10-0-dca1f6ed29a8@gmail.com>
In-Reply-To: <20261105-submit-sunxi-nand-vendor-oob-layout-v1-v10-0-dca1f6ed29a8@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
 Clark Williams <clrkwllms@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 James Hilliard <james.hilliard1@gmail.com>
Cc: Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>, 
 Richard Genoud <richard.genoud@bootlin.com>, 
 Boris Brezillon <bbrezillon@kernel.org>, 
 Masahiro Yamada <yamada.masahiro@socionext.com>, 
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-rt-devel@lists.linux.dev, 
 devicetree@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_105610_407701_609108C4 
X-CRM114-Status: GOOD (  13.60  )
X-Spam-Score: -1.9 (-)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Allwinner NAND firmware writes the bad-block marker as part of the
controller's randomizer stream. The mainline driver compensates those
two bytes so that the physical marker instead remains plain, even when
the rest of the page is scrambled. On H6/H616, the firmware also places
a fixed amount of ECC-protected user data before the first parity
region, whereas mainline distributes available OOB space among the ECC
steps.

Add an opt-in property selecting that firmware page format for the
configured controller hardware-ECC geometry. It identifies how existing
flash contents must be interpreted, rather than changing the format of
all NAND attached to a controller compatible. Without it, retain the
mainline marker representation and protected-OOB placement.

The property applies to normal ECC transfers. Raw operations still
bypass ECC and randomization and expose physical main and OOB bytes,
including the physical randomized marker.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 .../devicetree/bindings/mtd/allwinner,sun4i-a10-nand.yaml      | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/devicetree/bindings/mtd/allwinner,sun4i-a10-nand.yaml b/Documentation/devicetree/bindings/mtd/allwinner,sun4i-a10-nand.yaml
index ccf616fabc91..4ed99054a8ab 100644
--- a/Documentation/devicetree/bindings/mtd/allwinner,sun4i-a10-nand.yaml
+++ b/Documentation/devicetree/bindings/mtd/allwinner,sun4i-a10-nand.yaml
@@ -79,6 +79,16 @@ patternProperties:
           minimum: 0
           maximum: 1
 
+      allwinner,randomized-oob:
+        type: boolean
+        description:
+          Select the normal-page format used by Allwinner NAND firmware for
+          the configured controller hardware-ECC geometry. Normal page
+          transfers use the controller randomizer, the bad block marker remains
+          in its data stream instead of being compensated to stay plain on
+          flash, and protected user data uses the controller-specific placement
+          expected by the firmware.
+
     unevaluatedProperties: false
 
 required:

-- 
2.53.0


