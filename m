Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79BF5D597A5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Nov 2024 20:52:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5S600OQ5nFPGkJIjgZj3AtisZep3gO6DhgEu5beaHtE=; b=IxXx17tFdUoZFy+fUOK84B3fmi
	8ppCzvATSxeFxGsg0VUMoZTu2VhucFayonMthLcDHoglcHkZHrq0w0CMrPjxpMe7eoDertc07Wgxy
	BxldvIm5oFHh2Bv7KhyZayDzdc49Mwk1D/MS4gzEdpz4WegEEGejxsLM9JQGg9VccYFgDiG5g6AZu
	JJpjEAD6zzkDm8hZOCIvvYIAz7Cv5e7ogWf8iy55soSQX2yw0iRX/NGkQIia01U4L4zJ9GxxULqJt
	idYHNU+34z1IDi1PlCFdz5kWh6MIR83cRXMgsH09ufxyQcqSbOjUi59ICukoF9tE7RhLGCOFpe0L+
	bcx1QEYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAxrs-00000004vaO-1rtX;
	Tue, 12 Nov 2024 20:52:08 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAxoG-00000004us4-35iG;
	Tue, 12 Nov 2024 20:48:25 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-4314c4cb752so54019295e9.2;
        Tue, 12 Nov 2024 12:48:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731444502; x=1732049302; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5S600OQ5nFPGkJIjgZj3AtisZep3gO6DhgEu5beaHtE=;
        b=Y/j7XG6VNYOpqZ5NjhH2xDdMXSShh+D65Z2eqkVL4y2DmtUvSCetu9P1GhOHCEkr9j
         JPmwqnJfcby6jfwOhTbBjssBDCdFAto1Aroz1Pj1V+mOaEhoqtJ+AXjgXKT8rjW7UDD7
         RFnhY1NpQdWTF0V9EA19a4AAmJU8OrX2znrOaZ1i+4A6uaIDUfWdA83iq2+8LaLriGda
         PYSFbTdYRZ3B9e6mNxq1a7VfD+HZBimt7F5L3p4ASQkNkfDh4/2tItSpRwCGKVcXFpnL
         aQQOy8pBMlBp5V5ikWSyO3r7HiK6Lz16OwRb5fKaQ2zzEcb6NCYVls55f7bBIgfyfq8d
         M6Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731444502; x=1732049302;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5S600OQ5nFPGkJIjgZj3AtisZep3gO6DhgEu5beaHtE=;
        b=RUiYDBcpvDw/FlZoR01jGFctRZwArKxDuwO7F2F3jnMMK59jye1l9rH8fI4cjTMQHF
         epseBByr4oPUEcqwyl85P0fsEiLT5KpDyFWzBjHAZiWi3CMuZjkfOOtQUs+fpH8DB3Zr
         sfBVRk+amU/U+AovOkpKtBU1fuAs+uIBobIn8hM7s3cNR0UnG5TxR2Pcl+Rd40sd0cDR
         kuMxPZ2ial+H5bxBq5ZA+b2yqB4s+9UWAgHPRKKKBvWHjan/Z0DTzQM73ygrL+NlM/uA
         PpM7ael/hax78zhepkRHBcSd+73/QTHlH32W01e2Ak3J/Xe4rmLJ1L86Q91ple2oKiEh
         XpVg==
X-Forwarded-Encrypted: i=1; AJvYcCVyAzsDU5N0hwZ1NWwZ3y/0nAcdUYiuL4juioCgfpGHBKkTnb2ah7Sx6oZwcH8qf923dY7J55nqcuRsTEEMfAc=@lists.infradead.org, AJvYcCWXGfTs5HU1WKxYGoY7VXz7zID4m3zlbMEC5LMjKBOGPx7HKEDuOHJzDBJ9hf2Mn8WF4JqCsWM7q29+tfpW+vtQ@lists.infradead.org
X-Gm-Message-State: AOJu0YzsZd6z7PD5B5WX6dC1Ot44bwyzZo7yktCUbmI6yornstgZeUH9
	i9aQsnutD124I18Z7LY4COFp7yn8zKokpUmR7IO7tDsD8wKpOFhK
X-Google-Smtp-Source: AGHT+IHWD15rUbhDeGxX+d4Imrx+s08IlcvF/3k4i42ANzp0pz1zGptTDdhGT6/ns8k9Y02p2H1lyA==
X-Received: by 2002:a05:600c:3482:b0:42c:b74c:d8c3 with SMTP id 5b1f17b1804b1-432d4ad65femr3678595e9.32.1731444502448;
        Tue, 12 Nov 2024 12:48:22 -0800 (PST)
Received: from localhost.localdomain (93-34-91-161.ip49.fastwebnet.it. [93.34.91.161])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-432b05c26e3sm225426715e9.33.2024.11.12.12.48.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Nov 2024 12:48:21 -0800 (PST)
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
Subject: [net-next PATCH v5 1/4] net: dsa: add devm_dsa_register_switch()
Date: Tue, 12 Nov 2024 21:47:24 +0100
Message-ID: <20241112204743.6710-2-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241112204743.6710-1-ansuelsmth@gmail.com>
References: <20241112204743.6710-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241112_124824_797440_8D702F72 
X-CRM114-Status: GOOD (  13.05  )
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
index 5a7c0e565a89..5cf1bac367ca 100644
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
+EXPORT_SYMBOL_GPL(dsa_register_switch);
+
 static void dsa_switch_remove(struct dsa_switch *ds)
 {
 	struct dsa_switch_tree *dst = ds->dst;
-- 
2.45.2


