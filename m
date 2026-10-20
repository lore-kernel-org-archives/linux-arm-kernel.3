Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91C1A60A3807
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Oct 2026 17:37:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=YWxOfq5e;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=q0FbKEIF
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bt6uMG9PgUYc/XVv1n4ledEppWz4qm8tk4GY6vs/fFQ=; b=YWxOfq5eBk7hk1UQR07Opx7SJO
	FKGXwN1QpCOccWgEdxOSrEVzv3N1hprthh9ciiiruM6CHrx199a/p9ddyBSjVu5fmSQWiwDwUrPDQ
	1F4Bw7AyL21opKLZoTX0ZESE8W3TuW5rFVUfJwUFnvuAR3WaxyTNfkmjoTtXVCHCRJ12/FHlsEXty
	yD/z33kLSbkOdw+BMdBfEESItj0ru3CvQP1Vy3YmPUxmoTNxOtNidxniAsadqZdeD/HtbHZwmNYY0
	Qh+P9dkgyCHxJb1eoVJxvcGS/L9hli5hNi/Rv85K2Cs2nK8iTXLbT6zZIfsUkeY5B73zCkXfpIWi3
	IYz1wMNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJDlr-0000000AM5e-2DFW;
	Tue, 20 Oct 2026 17:37:07 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJDlm-0000000AM0r-1off
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 Oct 2026 17:37:03 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-4a16af2a232so24342225e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 20 Oct 2026 10:37:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792517820; x=1793122620; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bt6uMG9PgUYc/XVv1n4ledEppWz4qm8tk4GY6vs/fFQ=;
        b=q0FbKEIFRygHTjfCXh2EgbfUfsUau++/8ekdVKPTWGpmVwsa2fYD1RRMHr5GKg58Jm
         +NmIBE+HZVmBx/lq50rThWKaIiL/Bp0qUTXFGoEUYhV5UVG/LSftV0fcix3C1b2jOEtq
         Uqq087381pPuk2iziEMMf72aJB0YRpXBMTGr8WUqnor2ZTqodWk+fWoIvw/6w+WttnvP
         w/n7HzSTtYSOts9HAatHkPPg1cfo1zOMu/291v4Paz0P+D6t5s0Hkt72pWvjUpuPd4sK
         7Ga5ciHia8sUtByX4MjHBaocM7Iu5VLxx8JDf2yMCTZH9Z0b+l78W1psodubYnPB7Y0T
         BMew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792517820; x=1793122620;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bt6uMG9PgUYc/XVv1n4ledEppWz4qm8tk4GY6vs/fFQ=;
        b=0a0OHqPPJ8jcqx0pffNQ17IWEmTg4dGn6G5ZeIsFUuXLoh9xKs7XK2PGkIsPLJmEm/
         eXOlmLq5WrpsHwd1aH3X2RA+PGXMNr2UtNz5AFveCLMy5D1Z5VPnK/Cp3WI2m4+kcamb
         fS6yupWxpCxHVDn9ShyQ+U0/cve4J/atTdRkMnAJNK0cQF0+/bByK+X8bnEwvbd0zECY
         FIEd9vM05kHYu/XCS9LqKbqSrGcdiPnQ8E0G67sTA2gy+Gt1q+q1tDktuVFQttnnhuUE
         XOsmf9zVJmoyZDWcH5Gu3wQLpI5+in7MlLxPkKjwPlTmSDlNU/f8/eSLv2rN5TI/B0HD
         Qdpg==
X-Forwarded-Encrypted: i=1; AKwUvBzyGrjlNgl6hGePHqWpkqW7Hdkcayqjy33m1MSqC9QWVho3nm4khlNjEJaOWCDgCCHJCf2ATwEUs34QBEeaRSNs@lists.infradead.org
X-Gm-Message-State: AFq9FYIVNKYV71sqMexEwN8HNRanN5D5XK1E1Nluz3YTzKkZ4vR9UKMr
	dozzwYpbDzKIjRKIrIm4uavoVXhkZbVtC7Uk5BLMCsACQDpoVPZdwdpI
X-Gm-Gg: AYBFou12r306cye3LpQ4eQ4zikAApf5s7VnK+G/D+gBmkTMAnEnuc6YxJlUO8zWDevO
	4lkUIUr0uot/oz+u8HKmXHfwbxkUUKpEBv0d8jc+TZ9cxQB2hu6+mIKN34bPhqwO3M0W9oB5rGV
	ewDusDD3qlZuNXjx+zzPlvBaxF6SfiByIP/Lp9A/3V4NUXHhMT7hDQUnobs7SXu+/utGP1Movgi
	sSyzucgO20fCOrLmEWp/Zhug+1z1ulveMXgsF03aL4K8C+aTFoce+7n0whoEMoT1nCvjh8JZE97
	VTlblcGe8uBbfqIk0iXuwsaMIjEVjOA72tciTbkbcKjl9eU5ls4DEZOJZmBq/2XERCJssSAS212
	Jjssq0OLktNz3ZMFAwl+r2FgSsd+gIn/86ZEmE8MwQHHjJ0aY+GwuR7BhUced0yQL+hxhug3zTb
	DdHUYdy9FSvIu+tlLgfI8PKfygqY/vMk3U2B2KsufIdnAnQGu3wiI7kO4LFeWTxZE1vas=
X-Received: by 2002:a05:600c:c87:b0:4a1:fae2:a8ab with SMTP id 5b1f17b1804b1-4a1fae2a902mr22956085e9.3.1792517820215;
        Tue, 20 Oct 2026 10:37:00 -0700 (PDT)
Received: from luca-vm.lan ([154.61.61.58])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1f8016c93sm52505235e9.5.2026.10.20.10.36.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 10:36:59 -0700 (PDT)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: Fabien Parent <parent.f@gmail.com>,
	Val Packett <val@packett.cool>,
	Luca Leonardo Scorcia <l.scorcia@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sen Chu <sen.chu@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Macpaul Lin <macpaul.lin@mediatek.com>,
	Lee Jones <lee@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Akari Tsuyukusa <akkun11.open@gmail.com>,
	Chen Zhong <chen.zhong@mediatek.com>,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	mfd@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org
Subject: [PATCH RESEND v10 2/9] dt-bindings: input: mtk-pmic-keys: Add MT6392 PMIC keys
Date: Tue, 20 Oct 2026 19:33:23 +0200
Message-ID: <20261020173556.632798-3-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261020173556.632798-1-l.scorcia@gmail.com>
References: <20261020173556.632798-1-l.scorcia@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261020_103702_482363_BDC0FD3A 
X-CRM114-Status: GOOD (  10.58  )
X-Spam-Score: -2.1 (--)
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
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Fabien Parent <parent.f@gmail.com>

Add the binding documentation of mtk-pmic-keys for the MT6392 PMIC.

Signed-off-by: Fabien Parent <parent.f@gmail.com>
Signed-off-by: Val Packett <val@packett.cool>
Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Acked-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
---
 Documentation/devicetree/bindings/input/mediatek,pmic-keys.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/input/mediatek,pmic-keys.yaml b/Documentation/devicetree/bindings/input/mediatek,pmic-keys.yaml
index 140a862ecfbe..ff720588128b 100644
--- a/Documentation/devicetree/bindings/input/mediatek,pmic-keys.yaml
+++ b/Documentation/devicetree/bindings/input/mediatek,pmic-keys.yaml
@@ -31,6 +31,7 @@ properties:
           - mediatek,mt6357-keys
           - mediatek,mt6358-keys
           - mediatek,mt6359-keys
+          - mediatek,mt6392-keys
           - mediatek,mt6397-keys
       - items:
           - enum:
-- 
2.43.0


