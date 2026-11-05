Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68F80606A333
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 21:07:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=NZCJEOok;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aa3bXK+z
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=GLyW+wsd3C3ATj3CVMuJf8KfUTB7e6UqhqMzErsAQ1g=; b=NZCJEOoky2ZL3z
	RKGgpyLaMw5BWsO6asvmu8TcpWa8FN7DUarCgSIrzhsYZAULkthlhHWr7dV68uWfUN7Cy7Y8tNyKl
	CaG5K75Ma9q0yDTF5PFijI5C3FhuyTuzShc6lhFaRNZThGbdwyYZA86Fk0/pvModuDpHEYMzxgXWm
	67jAfTNpyHTvaOfHuL7dFsldCWkQOBYB3rAS6mH0HHFwq4wGmcEdy+lsjjrW++pfrLi7jhoGUJHt3
	2qTnrVlen1bV7mnQxRYVaQ4EsgFcQqZpjbPDXMXmR5ldAdZZuXCeagD53R6w4cC3qQohn041VpSaY
	4yJPUngGdBa3TUHUTjOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP4gQ-0000000AgE5-3mpp;
	Thu, 05 Nov 2026 21:07:42 +0000
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP4gL-0000000AgAe-0itC
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 21:07:39 +0000
Received: by mail-ed1-x52f.google.com with SMTP id 4fb4d7f45d1cf-6b167ffd132so186658a12.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Nov 2026 13:07:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793912855; x=1794517655; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GLyW+wsd3C3ATj3CVMuJf8KfUTB7e6UqhqMzErsAQ1g=;
        b=aa3bXK+zUDu/55pEUdJvEOw1zC2383WfyNnjtRycQlGp1UsVSkGvWZQWLDYxiNRGOg
         KKe6sI2Z6LZVFj9PWASMLM7JFSot6UhMUShPqPuPwsu+BiIVFbGWx1bpd6Obxy5tagUK
         gh3nCV6OxYDkV0lSFj5tJ+DAElkptqw9y1741WS/sxYb80QQ6RL6bSCJMc1er2vVq70p
         vIGyYSsoyqQ7lIRdbWiqVR5LRSYcx+33qeFLRw5iuRFX6GjLPiSKcLObx/1ChH3yHp4z
         FcoJkCDoGPYM6Le6sw3bBUZVbqR3PaPrJHnIYgAOQkQAs5DIkxhbz5e1+cUpRcksY0BI
         BYTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793912855; x=1794517655;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GLyW+wsd3C3ATj3CVMuJf8KfUTB7e6UqhqMzErsAQ1g=;
        b=ds861b2E3IftSF24f5iMEy+xegLQWWB2e0sLuBajsZqnCLMPGGmOI7ziOz8MUITC+o
         w4ZuqLWslVm6fGqaywFCm45O0cw/lmF2AD11iwC0LaWuarTqAoHSFS5LNo2f43eT81b1
         P4bUQhh+tRCPJ7JrWtWn/LA+ktsBEveL9BfBu4HilsW6qe29K5ks9J/kWm+7zy1Fdw0g
         xw/WQL7qutCxtBFkM+Q+vD0hw0Gdzl41rsjigYOJS3GaLO9yOogQqbF1BXIoPko3/CN/
         TxzOtgw+wfRNika3zY95uNAEhiiWnfRvy7bJwG3bTolmrXPVOb3Wn0ALHS0JN8nfwonM
         eWYw==
X-Gm-Message-State: APuU4Z9AooPi2wv3DDN0UCtVnAs/yA9roGF8s86erg9973X1ThRsTx0o
	aM01jTdYCmhJ/wQKLiSME49PBnRubxz6VZ7Y4Iq6bdwt/GUmkMJX8x/i
X-Gm-Gg: AYBFou27iOxcQt4noHqIo0Hcxh1CAnCBSZn+pTDfJszkqo+JfuOfora2BHMjDqPbQ1y
	Lj6Y5sGfJG8MTj4Nhqu45vMA11s6JQ8W83cCzFrOIYW4XoFjMw4ktjy/ECM1/K+YS+E7NWz1Pkd
	EWAY/qEejTguRKxUvHQwJloFSZMn7EGkUO5Mm5ooJldMYOS5CgSSZL0htmF7yb4CKeiBBzLkzJp
	SPrkskAXgjl+mwDWE5TUQQjN6afeSpUg7TShn7ncq5vsqT5JUeZGdVyfBBw8JUkIMZXiG1qzrmV
	iU4yvRnj3AKnLuwj/tmPdY3s6MiJTtaEUJ8QLBmEv7Jutc2Kky26SWdqzGk5YZUlZWt1Kkk3Nbt
	n3hIrY8XAP77EPB1lAs2SUkEgOoCxmfIHRPJaWXRI/ucKhf+ieetzmhWpgqFJryreAdr7oqApG2
	LvhOJEe7+k4y4iJA/zydYrZwzi3vEE7TTZ8vghiZprhKQy6dQ+ZfbzRvHGWz0qJIaeq7NjQYtCi
	rCBmbdcTy+v7RX9faIRc2XvZTV5iw7fk09qjJT6DQtsW0ZL/HVPJaYyjTlagwqKlTP4186DVrM1
	jF9w4GtP5WZqrB4FpBoWu5HXatt3IkO0Ilq49ho7Zs3+Kqf4cIkLKKrP8Iqtn4U72Iizl3M=
X-Received: by 2002:a05:6402:234b:b0:6b4:bd6d:2eef with SMTP id 4fb4d7f45d1cf-6b597475582mr314181a12.0.1793912855525;
        Thu, 05 Nov 2026 13:07:35 -0800 (PST)
Received: from letov ([62.41.24.155])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b55ac6d032sm1966949a12.25.2026.11.05.13.07.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 13:07:35 -0800 (PST)
From: Alexander Letuchiy <asalde.le1@gmail.com>
To: devicetree@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org,
	Alexander Letuchiy <asalde.le1@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Zakariya Hadrami <zkh@mailbox.org>,
	Manuel Ebner <manuelebnerli@mailbox.org>,
	Gary Bisson <bisson.gary@gmail.com>,
	Sean Wang <sean.wang@mediatek.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/5] dt-bindings: arm: mediatek: Add MT6895 and Xiaomi Poco X4 GT
Date: Fri,  6 Nov 2026 00:05:59 +0300
Message-ID: <20261105210622.523747-2-asalde.le1@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261105210622.523747-1-asalde.le1@gmail.com>
References: <20261105210622.523747-1-asalde.le1@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_130737_261229_D2336AFB 
X-CRM114-Status: GOOD (  10.28  )
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
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add the compatible for the MediaTek MT6895 (Dimensity 8100) SoC, along
with the Xiaomi xaga board based on it, which is sold as Xiaomi Poco
X4 GT, Redmi Note 11T Pro/Pro+ and Redmi K50i.

Signed-off-by: Alexander Letuchiy <asalde.le1@gmail.com>
---
 Documentation/devicetree/bindings/arm/mediatek.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/mediatek.yaml b/Documentation/devicetree/bindings/arm/mediatek.yaml
index 180e6e4948e7..28180ed0e815 100644
--- a/Documentation/devicetree/bindings/arm/mediatek.yaml
+++ b/Documentation/devicetree/bindings/arm/mediatek.yaml
@@ -72,6 +72,10 @@ properties:
               - archermind,mt6797-x20-dev
               - mediatek,mt6797-evb
           - const: mediatek,mt6797
+      - items:
+          - enum:
+              - xiaomi,xaga
+          - const: mediatek,mt6895
       - items:
           - enum:
               - bananapi,bpi-r64
-- 
2.56.0


