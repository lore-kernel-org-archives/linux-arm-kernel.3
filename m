Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02020606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Oct 2026 08:27:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=0AeLFFAl;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SzckIjwg
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=gfPizs4g3ul+tUe6lyiJ2ER/McCo/d24uO1muqq6200=; b=0AeLFFAluCUttT
	Z89URDwAvbolN+KOFex8oWXTnYWgUs74R9+1br3hdGF3kgrhZqZCzqOT/Gwp19ND3ObLhHRxOxdPg
	VJCt9HLTLp0QDiCw2jqZIiZtPO1wBbLEcX5V9zPMUqtuJ4j8sjLk9YfqAFMo8Ack0+PM21dO00FSU
	tGi52PygrzWOgdQftHYRCTfSwfWQX48TAazKvwduVH0MBC6tB5dj7fVMepr5Dndgzy1zWywlM+ZGc
	SzokFM/6FDV0JGbKAkAlKtpX/hB0rq5tuvXszNs7d4lKC9g6b37A+7bBMLZEoha4MCC+UYT3mDzdq
	+OwhiCPsAj5O5VDWWexA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMLTI-00000008ink-411t;
	Thu, 29 Oct 2026 08:26:53 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMLSZ-00000008ieB-1QlO
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Oct 2026 08:26:52 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-2e8c028eefeso4531355ad.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 29 Oct 2026 01:26:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793262367; x=1793867167; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gfPizs4g3ul+tUe6lyiJ2ER/McCo/d24uO1muqq6200=;
        b=SzckIjwg3i+HlUjCRNVSxmAhSS0/QejERQrPQycWgLrNZqNVsEUCxiGm/31bBjaqtJ
         6RyMGrWrC2hyyGoZbJMjA6beDQB2HFWW9H6rHIzLn9cG67yIPRgxqD2Rkd5hsYPbMbsO
         5IGEgtzQ9ea3dZQbkWAF1vwleN/OFcEpm+sGRE5HdX8OdfwX7qY6hV3h1K6bO+Ctz8Zo
         Vs0rTElTf35GmB28TPck+OPRHpi+EiGmx/aQNRf2HoEUlrZ5zNDaAHUbk83bQxt+D3+V
         RDrySwn9llKgbK9APd6QKEb7oMkzY4KI0cJ3KqRo/3x+6qjAn8t4oz6e5Uf5AeD798a5
         vANA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793262367; x=1793867167;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=gfPizs4g3ul+tUe6lyiJ2ER/McCo/d24uO1muqq6200=;
        b=jQb0bZRkBlxaapGPJC26bLBPtE1sSqO2AhbEkzQRsOmU03VY/KUyzVXWVcspPUbxhz
         IXah5Jgz+GL04RpPFatMZ7GEQCISIVa/Wa9G5aTaLQUR3XOlFehySp3McAhAeEsfn2ov
         OYMoNlLgriBnXEgqbmXeDIhAXfNmE+nwykB8FreDY9ujIK4FcfehN5w613nDcVn7iZGD
         4HzM8q63Ajbr8KRhaRHyck5Kv/JU2KSs81o+X0sAztRrmLk6/I8LdBJlK7ZCVdPqk/Z5
         xteVxtMypXrrDk7O6Wp+Jyj65+cxPiV4C87MeBQDqmqsOp4dhvZptr9nTQCscV7DP5fE
         EqaA==
X-Forwarded-Encrypted: i=1; AKwUvBzFe+m0gH8qChazDRC4bNeriyr8nTsflrBmysCZA5OlrAgy/1Xt324wuz3cH7z2Ms4NbRk5xStkVXrcOz2PEI6i@lists.infradead.org
X-Gm-Message-State: AFq9FYJSv9RTbdpT8PwSnrKdeypW+Q2TUEVQ2dsXF8T0z4JJPowL3r+H
	rG46HN/QJe2irkeqy9P2e52Q0di+ynOj6UimdwVvw9V5bdP5mrNPIxfZ
X-Gm-Gg: AYBFou2bprKI9sQWYTWWPJdp3XyqfSA2LSZ2dbjoODujtTb+twT7VL6xu4wsxoUBLIO
	mK8AlzEjk/kanmCBZuarE3SSnpnJdV89kGGUhif6VzgT14loa2CoFZZvaEbSHX3k4fE7rNkCuib
	IoGTxwC40qbfHRiP27p5jGA6PqOGeUHerdErV1f+d3rdyCjLo6wjSqPnuEQ2xRPTl0d6poirj5z
	hAvM267D72OdlagaO/yjIpfsnoKQJiMlap5Q4cOIBEp8Bj2+cRX77ylRQ63EhzZEsem+8jlBI6N
	Dn17yOCOeo03C/jK297N9Eh911R7mCpo3rajsIrvaWKbkohgSBc5M99JnrRIkx2jjEAoPBqeegD
	EQZD2BzLNXJL1WoA8yxgOhmuIdwYzjfOslNoJQ7F8yqAGjme51OujxZocVEznU3NZRYZI15kC7A
	dCwTpxbLyCDYpWNCf5xuqDpOEUzHQxLEZ041ip0imvICjTagBE4Cnr37hKdtcqjXU2nwKwiSL5V
	qeALrHytXiOMEGkXmBlHIx516uMBi7f0ZzVvYOTnrRYYGvh/LV5VJnPGWw4JmZ7J4PPtzCYqdms
	d+2mBfHf4a7egvauEe2WyNQ50aMyhhcd
X-Received: by 2002:a17:902:fc87:b0:2e9:6468:1ff1 with SMTP id d9443c01a7336-2eb0052ce41mr73031425ad.2.1793262366708;
        Thu, 29 Oct 2026 01:26:06 -0700 (PDT)
Received: from localhost.localdomain ([240e:36d:b08:2bc0::a60])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eae6b7a216sm30031585ad.16.2026.10.29.01.26.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 01:26:06 -0700 (PDT)
From: Jianfeng Liu <liujianfeng1994@gmail.com>
To: linux-rockchip@lists.infradead.org
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	Quentin Schulz <quentin.schulz@cherry.de>,
	Jianfeng Liu <liujianfeng1994@gmail.com>,
	Chris Morgan <macromorgan@hotmail.com>,
	Chukun Pan <amadeus@jmu.edu.cn>,
	Coia Prant <coiaprant@gmail.com>,
	Conor Dooley <conor+dt@kernel.org>,
	FUKAUMI Naoki <naoki@radxa.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Hrushiraj Gandhi <hrushirajg23@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Michael Opdenacker <michael.opdenacker@rootcommit.com>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?=E5=AE=89=E5=AE=B9?= <HystericalDragons@proton.me>
Subject: [PATCH v2 1/2] dt-bindings: arm: rockchip: Add ArmSoM Sige7s
Date: Thu, 29 Oct 2026 16:25:20 +0800
Message-ID: <20261029082541.469999-2-liujianfeng1994@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261029082541.469999-1-liujianfeng1994@gmail.com>
References: <20261029082541.469999-1-liujianfeng1994@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261029_012607_377729_BA205125 
X-CRM114-Status: GOOD (  10.82  )
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

ArmSoM purchased the CoolPi 4B hardware design from CoolPi and confirmed
that the Sige7s uses it without hardware modifications.

Document armsom,sige7s with coolpi,pi-4b as a fallback to reflect this
hardware compatibility. Keep a distinct board compatible so that the
rebranded product can be identified as an ArmSoM Sige7s.

Signed-off-by: Jianfeng Liu <liujianfeng1994@gmail.com>

---

Changes in v2:
- Clarify that ArmSoM acquired the design without hardware modifications.
- Explain why a distinct board compatible is retained.

 Documentation/devicetree/bindings/arm/rockchip.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/rockchip.yaml b/Documentation/devicetree/bindings/arm/rockchip.yaml
index a24949b163cff..1b905a7af8009 100644
--- a/Documentation/devicetree/bindings/arm/rockchip.yaml
+++ b/Documentation/devicetree/bindings/arm/rockchip.yaml
@@ -99,6 +99,12 @@ properties:
           - const: armsom,sige7
           - const: rockchip,rk3588
 
+      - description: ArmSoM Sige7s board
+        items:
+          - const: armsom,sige7s
+          - const: coolpi,pi-4b
+          - const: rockchip,rk3588s
+
       - description: ArmSoM LM7 SoM
         items:
           - enum:
-- 
2.47.3


