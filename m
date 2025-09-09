Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28F37CAC587
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Sep 2025 06:55:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PuU6T+eoD1QuN+NeWoko591lM5GIskHpuTQRyHxrkMk=; b=nJDgYYx72pq6NYIh+5Flc43Bue
	CO4w9L29EVZ08osG1VI35yfhF5Opr5UdwfuRyWrmFv27SQwTQ9W5M57T4hCTWrBdhNd2TT6bP/O2W
	thPVFlbll5/eZ+GGms7Fj3S1qARuoJwd3u/dkvRZ/mGwquQJ2/6/RSt7Tc0h+CZFasjUYbPGjyahW
	7iGQ2r+DZqoL755Fdmy5R0amJJR+RU1OCPN5apARha3hDUNT1jyA0R1Ha6ZLAdkJELbIGBMBfdR5a
	4v74+9UVAhXroSTA0BmHMxf4lignY4WNgmo3BIYZy1GavrGjAAkmd9PwhP6SSvpoN3auz/xB7fKgU
	aeVA81iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvsFm-00000004uWH-47Fn;
	Tue, 09 Sep 2025 06:54:58 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvmT1-00000003I6Q-3xDv;
	Tue, 09 Sep 2025 00:44:17 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-3df15fdf0caso3838279f8f.0;
        Mon, 08 Sep 2025 17:44:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757378654; x=1757983454; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PuU6T+eoD1QuN+NeWoko591lM5GIskHpuTQRyHxrkMk=;
        b=nf8aJZMWZ+Mqw86OzrRldskVB2h40byJ/HeJ7gJtu4qdEHzwHBt1BX5j+3gsCbxGV+
         YABAC+BIUEbYDpKkLUOe0ouM2SFbmxdyRDnSFZd/A6FJ8Qt6KEOivmkJVYYu0EC3rfB5
         pWZCkkw+btwQjnLw0V7Lt/PsjQ0DYlgQ2TJnvmV06cohiGKIanFFWND1VkP0hyEp3kJh
         GpzNyrfoD0zdqzljHJYoTsyftsYjE+CRkkDLvPNLB6z9wa2tMXZ0r3HqMMIPM0MDhgTC
         9BdO6L5sh+PCzAi4AclBlhyizbYVyPLJNLwDK72xwDsCf5dTbXeEPqfYDQHYYiJbjMCJ
         3XCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757378654; x=1757983454;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PuU6T+eoD1QuN+NeWoko591lM5GIskHpuTQRyHxrkMk=;
        b=W58vrG8CCvQFlcKpQ4xH56A/WPRKUpLfM8dKVUvVS12aAGCHPxFYBPuf5WtCNf9/Vx
         SLmRzpxIiJmSFgsjfDozKzUeQ26HD2Cfp9ADRdrQqXcTrFVIfQbt1I6NEesA3bHiUh/4
         iTAEmIODCBdy2c26usXnVSCqhseoAoQiWx5FOJ4mwQO5IoOtQEkLVAUKwk4JTdiqG42l
         t/cZQ+G5WJmFQTLRlf54GAOnxo4GuqwVNy9SHPrd4B69Bdzf01Y6iM77YpK7uV2FkPQh
         uo6tIDmYnJmknML6zhPMtnF/AswyYmM05DWDgik+6rTmGPPz0dmMhRQjyCH+4fOUiCE7
         4SmQ==
X-Forwarded-Encrypted: i=1; AJvYcCVc8ak6zbz3R7vevxHSqzNzcfp5iRHT7p3RYfFjQ7qxMCNJplV4RpT/OlUVBjmynSQGmllAFeR/qZlpEeA99eE=@lists.infradead.org, AJvYcCVunrom0AKa3TuYMndmpmysAR5wDbuD6w/rxsLbo4NW32+aAYlqw49P4sqs2IkxELbqGtGR4MLxYJLsFtABLDBs@lists.infradead.org
X-Gm-Message-State: AOJu0YyeY6dYvGuwpVVsxCEeTFAGpUtjXcyOqDkTubl8tBu4jzCqvZmW
	M08hEe2ET6/L7tdlUJpyML7VrENQw/ksE5FpxDOsABDvGhVCA25bCnpn
X-Gm-Gg: ASbGnct+ipmZ0dRttXQihxu24JIGPQvbny+L4k3F8baDrMqCy/1eTzCJBvbPw0ZDsQW
	I6ooXzKXdpwBOEX11OeCAVVPopWf1wG2j/IbA9rT5rI+MRRrizS+CCqyk6rBkqQckS0FxGkG1ZW
	UarLlHJc+mClblYpTKS4tOjrY4AfmSKuNmQ5XgPp/bOoWxy2LjRaSJjtppGDW7yKcMSmAsHdTWz
	+FCkkqpzA5x9HOah3u2WUuYa4ZfxIZ0OhsUIfY0MvtTNWbZHDGQWfO3enZvoAHaHeh6ZBpEKjrW
	yHcNVCq9BhVzPIk6T9/6TlVSaeBj4pby8JkVd3m9dDOrTjRTcTtrvBTxBAbm9eWw5J3ik8bPhgy
	fnSm5p1OXmydOFNkj2zQdAjv9GqODgnWyhNcFFOALPbqizTI1fVxnHr7FDiYcWUwXZQSgjEc=
X-Google-Smtp-Source: AGHT+IEcjcQHjuQxUzlPqCSGlAyA3Eba4g3hsWQufa/B2NEkUpIYPSPr3POj1KKYPpGs4Pe3LVCzHA==
X-Received: by 2002:a05:6000:1a8d:b0:3e4:5717:3684 with SMTP id ffacd0b85a97d-3e6462581a2mr9317938f8f.40.1757378654321;
        Mon, 08 Sep 2025 17:44:14 -0700 (PDT)
Received: from Ansuel-XPS24 (host-95-249-236-54.retail.telecomitalia.it. [95.249.236.54])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-45decf8759esm13526385e9.23.2025.09.08.17.44.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Sep 2025 17:44:13 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Christian Marangi <ansuelsmth@gmail.com>,
	Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	Srinivas Kandagatla <srini@kernel.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"Chester A. Unal" <chester.a.unal@arinc9.com>,
	Daniel Golle <daniel@makrotopia.org>,
	DENG Qingfang <dqfext@gmail.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Simon Horman <horms@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [net-next PATCH v16 10/10] net: dsa: tag_mtk: add comments about Airoha usage of this TAG
Date: Tue,  9 Sep 2025 02:43:41 +0200
Message-ID: <20250909004343.18790-11-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250909004343.18790-1-ansuelsmth@gmail.com>
References: <20250909004343.18790-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250908_174415_979597_09236A4E 
X-CRM114-Status: GOOD (  12.72  )
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

Add comments about difference between Airoha AN8855 and Mediatek tag
bitmap.

Airoha AN88555 doesn't support controlling SA learning and Leaky VLAN
from tag. Although these bits are not used (and even not defined for
Leaky VLAN), it's worth to add comments for these difference to prevent
any kind of regression in the future if ever these bits will be used.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 net/dsa/tag_mtk.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/net/dsa/tag_mtk.c b/net/dsa/tag_mtk.c
index b670e3c53e91..ac3f956abe39 100644
--- a/net/dsa/tag_mtk.c
+++ b/net/dsa/tag_mtk.c
@@ -18,6 +18,9 @@
 #define MTK_HDR_XMIT_TAGGED_TPID_88A8	2
 #define MTK_HDR_RECV_SOURCE_PORT_MASK	GENMASK(2, 0)
 #define MTK_HDR_XMIT_DP_BIT_MASK	GENMASK(5, 0)
+/* AN8855 doesn't support SA_DIS and Leaky VLAN
+ * control in tag as these bits doesn't exist.
+ */
 #define MTK_HDR_XMIT_SA_DIS		BIT(6)
 
 static struct sk_buff *mtk_tag_xmit(struct sk_buff *skb,
-- 
2.51.0


