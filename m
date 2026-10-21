Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1CC4606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Oct 2026 10:52:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=MMk+67HM;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=m7OsL8XV
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LPY8vdhVi6Xj88wwWO8EGGblZmNfcIUJaJL4gRNaJy8=; b=MMk+67HMLVx+Qt54isO5lXaRQy
	amqagEf8fQD6u4ZvgLvx0M70J6Kck/atHeiyfOYxOW76Y17L5vYZiNbihwsLW/N4s4ByCMaJnENRM
	fFgPtjlHNxlV6cs9JreQxdwGcKcvs1eQCjGnPVKzjFxxrkMaB/yP9ZsOU4kcTYiCUphaXOklJ++/w
	RuswYQ98CxwSj9FI8a81XvB9E4Z/ZnFRb1hG+UweJX970R822Y0ZqPhlZfpOnXnRio9QJeGqEDW6x
	pJmySCuhyddbA0GG16LVviEFeaEEx1IIQI070hrNeaUTT52mBh513V2hMGtvV1YscY/GPHyOOrMvB
	f3aQrAhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJTvG-0000000BejJ-0jdN;
	Wed, 21 Oct 2026 10:51:54 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJTvD-0000000Behn-3BdI
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 Oct 2026 10:51:52 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-4a171b677d2so3229085e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 21 Oct 2026 03:51:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792579910; x=1793184710; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LPY8vdhVi6Xj88wwWO8EGGblZmNfcIUJaJL4gRNaJy8=;
        b=m7OsL8XVRD4+5qV37y/uygsnLXueQTv3lKJqlB3ZQV0vOX6hJxG5FnFYNZ0qrhhlY/
         i5HepTkV5FoLLUTjtOVJov/sy/3kYFalL+a4QkAbkURId6iJ6RkYFgLqwDFTMF0dI1DE
         aIsUDE2B5TkLWNFKkZWosA3Tp6SmjMtPeHjc4K0q5fE5rYby17j2K/M3LbaEkarWJoVp
         7Wb4P3J0WYVLZ4n09Duh5qbY5wheqvuXD+MtBgStf7VBnERol+WMwXy9THrIqf0V1FWl
         OJb/B6wJRVy110AbRI+7exFwua3g32uQOX+yOdZZzl4zPQcUeS/UmfO5ytrh0UnlEtGI
         /goA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792579910; x=1793184710;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=LPY8vdhVi6Xj88wwWO8EGGblZmNfcIUJaJL4gRNaJy8=;
        b=R6Kxbrk6Gqiupd/5D81XVVGQptJYRTkJqhhIPPg05JsgEuCFQHHT8YXOw0iHJsSniv
         dh0zzxnN36ZBA0uODj8HAPBK/1dtt595x+JbPobjXtvczLiZ3LXon0H/Gl7Imt6YCLU3
         N07w9Y7L+8A82MbkuarbokAMmt3Ss6yErgYBOsPsGSQ52KpkEbqN3kSgtsRPKeqfyLcL
         eIutctFQG6bNnumiBzPzXt8a9DNrt/X8boPjsW2O61G80vu+bgSyD0lT/JkxxFMKG/qA
         lyoORg1Ev6wbvSFyNnKFuVYnZTK+h9z6kCSoDFMTcvyxdDaWdPE9MX3EQT9LQ7J3U/RO
         B2+g==
X-Forwarded-Encrypted: i=1; AKwUvBwyVczVWFjLnkY7QgIqyAPtuWtJWAu86adY02ZE27PA/oxU4VHeJYJqFaq4mnTW5YtbHME44aKgweXIs74tfUcf@lists.infradead.org
X-Gm-Message-State: AFq9FYJtZvdDtrnnTYGr1H6rkt888CBte28r2lL4WBm8aVxZJYzmyE+n
	2WwdAMqVvkVsqKh9BKDjIN7zb0C4MOO+9QvU/JEBWhnXHEfhq5yrRd27
X-Gm-Gg: AYBFou1jJqXK9oROfGBqYO4KRxzNdui1uKam51O1NJHrmxBvmHsVERV5jYbeh75CcrW
	pNJne0mLZa9xOSWrrC4+gfOAxbGj4ocmZ1hsSK/1VcXG/Yt3HCIbNJyPTJ+gA94h0vpEXrM5dSH
	7ScdlwgPd24ejijpFWZ2U2tGTS3QOhHkFFlt3NMOLSZvHA/XZhTsYQzAF7lbBUmAgaBbb02Xxar
	g42o3D+nirS5KDBoG0Dj7j5j+J6MxkShvwiiLjbsZweA/Kz7ltaSELthA+Jmv/Uosc3tt8TwC7e
	APsG74DuJEOnCPcB/3E+ekIIcjq4hN0XXTsGmvI5uNEO25hZ5+6/2m9vEDiYfpN/4bLUZhZUITc
	5L5c8tutAjDq5xJjRg/kM26p6zntefqjXI0jkAFMIspTXazhoOLWtECWFS3WZbDiz98+8vtdp4I
	TBFlfAnrzSrTZa1sIUH4dB1tIgIjDBwiftUttta6xX0V4xtSX/miHpBub5iSkuHLof3N3lDciA/
	ew94nRS2ZXCWAnpDngDsBgWI4PLIV1Iumb/erwl1Yb9qu9KpNk=
X-Received: by 2002:a05:600d:4447:10b0:4a1:d1f7:bea with SMTP id 5b1f17b1804b1-4a1fdd1e568mr25614785e9.17.1792579909764;
        Wed, 21 Oct 2026 03:51:49 -0700 (PDT)
Received: from luca-vm.lan ([154.61.61.58])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1f2d6e2dbsm153388305e9.13.2026.10.21.03.51.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 03:51:49 -0700 (PDT)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: Luca Leonardo Scorcia <l.scorcia@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
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
	Val Packett <val@packett.cool>,
	Fabien Parent <parent.f@gmail.com>,
	Akari Tsuyukusa <akkun11.open@gmail.com>,
	Chen Zhong <chen.zhong@mediatek.com>,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	mfd@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org
Subject: [PATCH v11 1/9] dt-bindings: mfd: mt6397: Add MT6392 PMIC
Date: Wed, 21 Oct 2026 12:47:19 +0200
Message-ID: <20261021105109.199886-2-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261021105109.199886-1-l.scorcia@gmail.com>
References: <20261021105109.199886-1-l.scorcia@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261021_035151_815243_50628F25 
X-CRM114-Status: GOOD (  10.45  )
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

Describe the MT6392 PMIC and its RTC and regulator devices. This device
is mostly based on MT6323 with some similarities to MT6397 and is usually
found on boards using the MT8516/MT8167 SoC.

Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml b/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml
index 3cbc0dc12c31..da534fa324a8 100644
--- a/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml
+++ b/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml
@@ -39,6 +39,7 @@ properties:
           - mediatek,mt6328
           - mediatek,mt6358
           - mediatek,mt6359
+          - mediatek,mt6392
           - mediatek,mt6397
       - items:
           - enum:
@@ -72,6 +73,10 @@ properties:
               - mediatek,mt6331-rtc
               - mediatek,mt6358-rtc
               - mediatek,mt6397-rtc
+          - items:
+              - enum:
+                  - mediatek,mt6392-rtc
+              - const: mediatek,mt6323-rtc
           - items:
               - enum:
                   - mediatek,mt6359-rtc
@@ -99,6 +104,7 @@ properties:
               - mediatek,mt6331-regulator
               - mediatek,mt6358-regulator
               - mediatek,mt6359-regulator
+              - mediatek,mt6392-regulator
               - mediatek,mt6397-regulator
           - items:
               - enum:
-- 
2.43.0


