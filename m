Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22DF6606A319
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Oct 2026 10:52:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=cxS9hx8f;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=AEJUkrRp
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bt6uMG9PgUYc/XVv1n4ledEppWz4qm8tk4GY6vs/fFQ=; b=cxS9hx8fcW8zCfhLV8mf67zVJW
	q0M0E6NPlAsipquft1UyoQtL4bMDacbnmGiq7gc+gARhm1+Gz4hdySsYrFkW9UtBUsQXbnVCX6Kor
	W7M/ddAlwA3bFFRDnsC3w9PKmeDH8HhQQOZVzgJURqkfogvNtX7DrgoTlVTbzInNaG0lKRYlo9sNa
	ihcNJbfQj7VhjWajGOT9CRQDy4n2z1PXNao+N3a1Nx4OOxc/6D0b2LwxeYn+Akg4uzF+s1tuJzqCu
	r9QWIkg1JPJ6F+GaeFY3Xq2MD9qZWjks7z+BidM+PueOTG5NnLDfuNNsgm+YJLQdtfwTG9zUHzsAY
	wbkPPzSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJTvd-0000000Bevj-2fJx;
	Wed, 21 Oct 2026 10:52:17 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJTvb-0000000BetW-0aaf
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 Oct 2026 10:52:16 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-4a1f403aca0so3871245e9.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 21 Oct 2026 03:52:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792579933; x=1793184733; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bt6uMG9PgUYc/XVv1n4ledEppWz4qm8tk4GY6vs/fFQ=;
        b=AEJUkrRp5zJvwz20iSIMv3Sl8PjeWxvVxSfSzsr0yksKatDXamdmaIKlZoo6jPI1JG
         vJcEFHnOP25gT7lhLi8TCb0cULieKwrMiyN68cXgxOYhVVtgNIfjF/8FvrErVIe24L26
         A5rT25tw8BbhChOmTQoe8i8Yh1Z1QV9qzlGFvG40b3vc7ax9FiOkduhjzZN14zkJTZHm
         /mBRnTn6M3wIiRFr4/+DuSO4r5hWx7wirFNMjjr81r+cq56792Vsm9RsFdmqf/VvssTs
         d5ghXcjyjQ0tX0aP+xCiEYBfNMH2ONnSeI7VCaB+0b00+wPpQQUZiEegnRDQxGFvoseN
         65CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792579933; x=1793184733;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bt6uMG9PgUYc/XVv1n4ledEppWz4qm8tk4GY6vs/fFQ=;
        b=IVQuC9o1GT8bu6sZRjDH9d0jfcrGGZ2evslBTt7lgfNJcHRbucbz18ll93TvcWP+m9
         RvbpTUPPLHEwPrWAL1fW6H8rxSv730s2feQuE54iK2bNNmce+IhFcYDbKZ8HiXm4vP1V
         fpeOYre1yZaNFihMIGGO5hXIkS56UeI/UFM2+neys2QhNdMgWaw3f7WdWnaQgJM4vL65
         MH6yppDWfVNQIUBR8XJDLlTqG1BbeKW0gOyeOeSAAcQxtASguCnJE10DJi1a53VioUbA
         f75tFrWkGVep9AcfaeCDluYev+j+6s93Aq05Qyp5M+Vz5hkhwAXpaTTlmwrZJHcCPuuY
         j6zA==
X-Forwarded-Encrypted: i=1; AKwUvBzfR5CT0F6lZGRYcLzn0bUtyJTATUkV/VnXgQSxg4swknOBhM9/T9bbsGORoexkfG/FEqaLrQtyIX78AEFnko9r@lists.infradead.org
X-Gm-Message-State: AFq9FYLWX1F+f47Ivraz8BCsN/mI+nW8a418e8ue2UWrNJDiXleUhhS4
	CRZSJK6DO+RpwlB9Va7RKM8LUQal68ELCRABsiTOERX1IhJr+6ws2s/9
X-Gm-Gg: AYBFou0M4Rdoy2NVqk5DVa0foPg705MezZyQ/4pSnkDBr2lm9jXfZtsbfv+P4bpMhNH
	2+WDCH9dbq+m0UbTg7MRF12z3LFruKIUa+Lm85oJc+HM2u3nrk3JutwroxQQx7billp19BlDS+0
	Po2+KO/jI+FFmiedtXeWIWsVnyZz5WmE+MFTQix5At68xCTzoC9nYHTlHxE/cS9/LfdlEXmu2BF
	n7weMYsJS1+/U8DprlU/Mw9FyZfeVOjgo7+7LZDBI5oCfCHAJKsL4Krhv5YN5+va0MT3X++xD8w
	hORy6lWQyiuKTDO5aaXpnI3lq8gIzop+BTFRWoIVb9zp0b/RpgATtIwrs6LgVFKk6m5UmbXYZHw
	Csq+cfXHLCD1Mj6Dc8hyL/oOrCs6EUg8QAIPqV/8mSy8aZ1oOdlF4Ujn7YfzLegFBTgPMPvOBTk
	jntEYkTCIwUi3qDegZ2JQHxQirRAK5dQWxU8Sog3aqTDAesRWklQo6GjAoq0nPmu5qakfAo6v//
	fd+06w9nvbttruM4KdyL9hlxo5qXMCqBgQosOkGo58Io5+kvcfF
X-Received: by 2002:a05:600c:8b0a:b0:4a1:7ed5:99e8 with SMTP id 5b1f17b1804b1-4a1fdd23003mr30749575e9.22.1792579933214;
        Wed, 21 Oct 2026 03:52:13 -0700 (PDT)
Received: from luca-vm.lan ([154.61.61.58])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1f2d6e2dbsm153388305e9.13.2026.10.21.03.52.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 03:52:12 -0700 (PDT)
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
Subject: [PATCH v11 2/9] dt-bindings: input: mtk-pmic-keys: Add MT6392 PMIC keys
Date: Wed, 21 Oct 2026 12:47:20 +0200
Message-ID: <20261021105109.199886-3-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261021105109.199886-1-l.scorcia@gmail.com>
References: <20261021105109.199886-1-l.scorcia@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261021_035215_194133_34365FE8 
X-CRM114-Status: GOOD (  10.55  )
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


