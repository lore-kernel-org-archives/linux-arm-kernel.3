Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F1ECE7716D
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Dec 2024 07:27:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lM0mNCtHjT+hsg9qAEDa4xZpSra1ZeG4WjgSFO0QQkI=; b=dxukcIBAJARSeSG86vC4ty3fvi
	ZlPWxgLLGnyy85B1ncPlEbtXm0KoXXeJvxB2kbc1BThdzslWoXAXbXYCVPUO/xaeFzQzUqJ76ZCyn
	n6GXu6K0mm5xDBbE4+lEVXeVR7z5nY9nA+ArvKOHG6COYFAgFQIqLFWY/GzkQU6yzXexsEmQ1Ig85
	QwE+3QA6LQn1TPWkaojNI1NJDwJgsimpgXHNl4tuCC1JmBSkSOKfRnbiD+7qfawkZsfwph0//JhDP
	vGHHeAuZxenD43RUYDZgUlC7GGfhqkeJMhZ3pnSPe923zaIiV9t3OAvx3q1klkiidpEtfJJSbfPFI
	k3vy27Ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIjn7-0000000BiIu-3fpD;
	Wed, 04 Dec 2024 07:27:21 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIjl8-0000000BhqU-43Nb;
	Wed, 04 Dec 2024 07:25:20 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-434a766b475so58844865e9.1;
        Tue, 03 Dec 2024 23:25:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733297117; x=1733901917; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lM0mNCtHjT+hsg9qAEDa4xZpSra1ZeG4WjgSFO0QQkI=;
        b=UOFl743tlqFN+JeXSVjhVF5MNJEwfzewoAp/z3AJQPZMtceIhmYdfxnfW3fnM/UB5N
         k++E41LOvgMfs5b/F92mHehehgSnHTIzj64gavELOpuOSBjuHREWDVxYshZc/13xfwkM
         yjX1mTxzpO2EQXXTTCTpo+ATY70iPrgrOwv2S40g1w16vwwChzd0QN5OvEdrsUcN3GNo
         ED1WL7VBevi+XGFHFcQlOBxFrWBcEkKcmMHsdqt+eN1O+GYiSpv1jUnZbms/7pyITzP6
         5jtomxxWgZC4n0AmzAqkZ//aqMG+/hhaAzGMB7uJT1x+HzBNgSqcMv3wjuXFXU+3u4fP
         Lc/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733297117; x=1733901917;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lM0mNCtHjT+hsg9qAEDa4xZpSra1ZeG4WjgSFO0QQkI=;
        b=uJKAZpdzeHLufjSA4lH02nwCt7g1npu6K+qUBwwOo/1dOxLDEL3P+Itnzw5d+xyeFu
         l2rgA9OVAdsaC6LAA5JPKN8tkg82s7wEmdv0kQppyN1zUByO/8eHvRiYoeq3OcE5SRvx
         dblCYH2GPxwRe2FBvd0Dh3duI3t3iCc7K2YbvLvVKf+owr7BR5QRqxZdUrcVLVh7T7iT
         YpC3PrpRCEEZuC+KI1adhCAew0yS8Ue+erqeIwebXrLgP/PwQ+tIAxAJwEHnARnwywTC
         9xRs9y3LBNaeucLLnJSvAWIaSjrzvhWQzcLrnwOMp2Mpc1Axm6PIf9XolphE+Hc5irdS
         s1vQ==
X-Forwarded-Encrypted: i=1; AJvYcCVZlQYmMd4swmmidO/wCkrNoxZiMmWulDdqCatGvGepp+mI0d/PDJ+7+xRJhWDjC9B6Fq/JZ8qFNQQQQmB5f5Po@lists.infradead.org, AJvYcCWlTI6LWo074v6sKw0ceQxaVb/AJrY3MK9L0JgN3zystBp5oHHDUmnZOZ0gWH6WaX4va1oEImehhSpHDFfR/hk=@lists.infradead.org
X-Gm-Message-State: AOJu0Yx0S3ZDBvqavEaGZ836nlfSwhRDTTZwVZowwsoErI+5tRyQX67z
	7fDmO8l2NEYGUWQg/jkW8onKSRuLYjyQekpfUaf7+18PRInjpfut
X-Gm-Gg: ASbGncuFSarqJto2oFE2ruj6TYcegh1nKoDb1orMeuHZsjooTE9BP/KhN6VwQO7qcmf
	R8G/0sIr+aNgt2BWi9Z0wN5FGNodpEnrVFLF6JnQZCOXdh3ksVz9rr4fFL5uaCUNZqfnnRCVrN6
	dIPL/G3VPBpw59pWh7j5FbY0WGyPDzs+rJ4h9Sfz89jYPFpFotkp+89+q0ff6HyA7+ADlwKC1YF
	Prc6J4V8Iy9d7UPrAKzFkReGy7erx9d+QDB46Ara+zCo0RuUg6Fw7XarPn57TZEJX6urlhBlsVW
	OjHLYR7EybntTWzH304=
X-Google-Smtp-Source: AGHT+IEhtL7LsG4DAXwbNqLf3tFfGzBkkKQkzEXZrrUsxaZJeipMuj9IjLDyKTikR4xXJlJjRYRVNg==
X-Received: by 2002:a5d:5849:0:b0:385:fbb4:7d51 with SMTP id ffacd0b85a97d-385fd42d261mr4633208f8f.56.1733297117038;
        Tue, 03 Dec 2024 23:25:17 -0800 (PST)
Received: from localhost.localdomain (93-34-91-161.ip49.fastwebnet.it. [93.34.91.161])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-434d527257dsm14396655e9.1.2024.12.03.23.25.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Dec 2024 23:25:16 -0800 (PST)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Christian Marangi <ansuelsmth@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	upstream@airoha.com
Subject: [net-next PATCH v8 1/4] net: dsa: add devm_dsa_register_switch()
Date: Wed,  4 Dec 2024 08:24:08 +0100
Message-ID: <20241204072427.17778-2-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241204072427.17778-1-ansuelsmth@gmail.com>
References: <20241204072427.17778-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241203_232519_002828_330B55F8 
X-CRM114-Status: GOOD (  13.03  )
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

Some DSA driver can be simplified if devres takes care of unregistering
the DSA switch. This permits to effectively drop the remove OP from
driver that just execute the dsa_unregister_switch() and nothing else.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 include/net/dsa.h |  1 +
 net/dsa/dsa.c     | 19 +++++++++++++++++++
 2 files changed, 20 insertions(+)

diff --git a/include/net/dsa.h b/include/net/dsa.h
index 72ae65e7246a..c703d5dc3fb0 100644
--- a/include/net/dsa.h
+++ b/include/net/dsa.h
@@ -1355,6 +1355,7 @@ static inline void dsa_tag_generic_flow_dissect(const struct sk_buff *skb,
 
 void dsa_unregister_switch(struct dsa_switch *ds);
 int dsa_register_switch(struct dsa_switch *ds);
+int devm_dsa_register_switch(struct device *dev, struct dsa_switch *ds);
 void dsa_switch_shutdown(struct dsa_switch *ds);
 struct dsa_switch *dsa_switch_find(int tree_index, int sw_index);
 void dsa_flush_workqueue(void);
diff --git a/net/dsa/dsa.c b/net/dsa/dsa.c
index 5a7c0e565a89..aca6aee68248 100644
--- a/net/dsa/dsa.c
+++ b/net/dsa/dsa.c
@@ -1544,6 +1544,25 @@ int dsa_register_switch(struct dsa_switch *ds)
 }
 EXPORT_SYMBOL_GPL(dsa_register_switch);
 
+static void devm_dsa_unregister_switch(void *data)
+{
+	struct dsa_switch *ds = data;
+
+	dsa_unregister_switch(ds);
+}
+
+int devm_dsa_register_switch(struct device *dev, struct dsa_switch *ds)
+{
+	int err;
+
+	err = dsa_register_switch(ds);
+	if (err)
+		return err;
+
+	return devm_add_action_or_reset(dev, devm_dsa_unregister_switch, ds);
+}
+EXPORT_SYMBOL_GPL(devm_dsa_register_switch);
+
 static void dsa_switch_remove(struct dsa_switch *ds)
 {
 	struct dsa_switch_tree *dst = ds->dst;
-- 
2.45.2


