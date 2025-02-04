Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7636EC02193
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Feb 2025 20:20:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8xE+ROyc/mcQ2fBT7crVscR/jU0rSEqZAJgDthtdCdc=; b=NRV6BJMYR2j3ebEC89mpYzwiNm
	ysArk6UikW2tXkWAwbbasTWTqXNabeaOz+ZqXq0BS8puHbiEEKvai3+gGGVOA3eA+8dikO7+GsgJG
	+QUrZLJ1kwHVb+JcFeK2y6VQKduJw44eOp9MuXGe/yj7ysfwSg6a2lkUq997GpyVYxDyTYDuuhMYq
	zHWjwb7v8xsnmbSvhMGN8PMfNqmeG49BG7Vfa4Zo6IE44wginYN6eidNZbqO33t7/rco/bUwOI/3M
	SsO7kr5Y7nKkjzcIq6n5HaF5bCg96yUr2Y2L60D96Tz6MvfmXAO+oP4oMqKHImL3Hed50SdrOQ920
	sQEOcXxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfPOv-00000001Vmc-3sgg;
	Tue, 04 Feb 2025 20:20:05 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfOvp-00000001QLo-3wb0;
	Tue, 04 Feb 2025 19:50:03 +0000
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-ab6f636d821so921312066b.1;
        Tue, 04 Feb 2025 11:50:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738698600; x=1739303400; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8xE+ROyc/mcQ2fBT7crVscR/jU0rSEqZAJgDthtdCdc=;
        b=O/ykA7q99kgX2Gp6lboBhTiJ7xExn8RVc0hG3jcCrFhRk4qPxfEsOEdvzzPvOVpV+2
         SIr9v3ofGxgdeDP+giRu+QDXc8M5c0xZhlIwDzHEGZFtQ2wFZnMrcrGERS1hZrhcjsZN
         OZDUA524ZpWkhTz1onJgyCl4Iyq4gQY8rCDF/YgLOTCUl/3eL65ilSq3o66j603A6JVo
         u1SD4kkIco8cd77REAHt9hTDfmzNVlQ0bMRP8CqCVKEjfHFE48/7rX6MNKHILpFJjii1
         0SQXBQnBiC43snuihZg18VLeuhoqHv+ouaFWFU0s1rsVCOHBSRWXtMspJHuDtdXJE0tn
         3OcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738698600; x=1739303400;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8xE+ROyc/mcQ2fBT7crVscR/jU0rSEqZAJgDthtdCdc=;
        b=IGiDUnnZ0Y8iP9fJC2RU35A9uBWkbH0HUXMDhuYXXdZKNA3fUwKZae2o6Mgm39oKO+
         OoJqCIFsuLxPgVNN6bzskDXEsfEpxiA6B81fmfhq5XfuDOLOBjL/ZDpZTR3iXsUC/b1/
         IV4mHzO0oocZoldRC0LKxXo8zm+B8cH1q04z10N+PgVAXoDETza0GxenyfcMm0vhVcG4
         c5vC2TPQ2OrdzLPLhKk2Bgkg/4hlKFVe+rGU6ILj/Pd9ki84tF5NZOhBEZIVLZ9Ur40k
         XM+z/xbI0qHtJL6faBufiap80L7uhitcBFhRPzj7sRNAK4dwdWLk2gpq+3ISZ8a5dTo3
         kveA==
X-Forwarded-Encrypted: i=1; AJvYcCUdSVSuOFjWluFD6NT5vYwrGRfKvzrBHMbQGtuJDGBuuOvY54uWE5zjTvkUiZSdLv89jcU5Olz0wsAi4fY7NSM6@lists.infradead.org, AJvYcCV0zxAgdFyya14KDSlD87RJVSqdgkjqfnVZxofAsP2Q1+VDs+vHe2gY0EYQqAYtS6cpNqUXQK4u2Gn8rDeiJvs=@lists.infradead.org
X-Gm-Message-State: AOJu0YwvF0AECWaQuzg1zHuKggoWHboFX1+3WRAYyMyqI+rGPFG64oQd
	FWxNlIzhRuiLX7ixBpyUTXj3X5+hWsWvtiD3V/l9XvMR0yWZGOk3
X-Gm-Gg: ASbGnctiZ67GgTrkzyMX7RDRnaBQqlt3rNnh5TMoqGw/T7loyT7D0o53cJ3BCBXltLk
	Xj8eeb4tOefIuRpJSBrwhf/2gnDRg8eDejgpprCJk2xNjh29k4Xu67Yw9rcVK0BdKHWSSDo9dwV
	U/v/pmIp3HB3ZKdE+KEIY5Um6P/1CsMjkGWTGcTU/nItSM3D6StJJZbrinKnY7NA9FrgpNvXPZk
	rv/LeESgULpmREok/hC5XQL7FaHDJdtE9wfoFfAD8oeANqQo7YDGL41YxFcJcG89f/s4GhSCCPK
	9l4QPehP2dawKbE7Qc8UJgILQLzakNncCVvcqCFahYKzQ74GOEiGpsuR0LCqfBQ57E9kj3I4hyy
	JvyQ3O6/My/qtMajHqaKOauMiSr0McoRE
X-Google-Smtp-Source: AGHT+IGHC1MVQan6DyAcHVPJFsYpMQ/lz7RSHxdEh7BdqhTUwrDVwvLIusKNv2NoZZcDS32oCD5V0A==
X-Received: by 2002:a17:907:3d8d:b0:aa6:9503:aa73 with SMTP id a640c23a62f3a-ab6cfdc5f5cmr3418392666b.51.1738698599948;
        Tue, 04 Feb 2025 11:49:59 -0800 (PST)
Received: from corebook.localdomain (2001-1c00-020d-1300-1b1c-4449-176a-89ea.cable.dynamic.v6.ziggo.nl. [2001:1c00:20d:1300:1b1c:4449:176a:89ea])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab6e4a5635bsm964684466b.164.2025.02.04.11.49.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Feb 2025 11:49:59 -0800 (PST)
From: Eric Woudstra <ericwouds@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Pablo Neira Ayuso <pablo@netfilter.org>,
	Jozsef Kadlecsik <kadlec@netfilter.org>,
	Jiri Pirko <jiri@resnulli.us>,
	Ivan Vecera <ivecera@redhat.com>,
	Roopa Prabhu <roopa@nvidia.com>,
	Nikolay Aleksandrov <razor@blackwall.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Kuniyuki Iwashima <kuniyu@amazon.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Joe Damato <jdamato@fastly.com>,
	Alexander Lobakin <aleksander.lobakin@intel.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	"Frank Wunderlich" <frank-w@public-files.de>,
	Daniel Golle <daniel@makrotopia.org>
Cc: netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	netfilter-devel@vger.kernel.org,
	coreteam@netfilter.org,
	bridge@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Eric Woudstra <ericwouds@gmail.com>
Subject: [PATCH v5 net-next 07/14] netfilter :nf_flow_table_offload: Add nf_flow_rule_bridge()
Date: Tue,  4 Feb 2025 20:49:14 +0100
Message-ID: <20250204194921.46692-8-ericwouds@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250204194921.46692-1-ericwouds@gmail.com>
References: <20250204194921.46692-1-ericwouds@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250204_115001_980589_A1410619 
X-CRM114-Status: GOOD (  10.98  )
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

Add nf_flow_rule_bridge().

It only calls the common rule and adds the redirect.

Signed-off-by: Eric Woudstra <ericwouds@gmail.com>
---
 include/net/netfilter/nf_flow_table.h |  3 +++
 net/netfilter/nf_flow_table_offload.c | 13 +++++++++++++
 2 files changed, 16 insertions(+)

diff --git a/include/net/netfilter/nf_flow_table.h b/include/net/netfilter/nf_flow_table.h
index 4ab32fb61865..a7f5d6166088 100644
--- a/include/net/netfilter/nf_flow_table.h
+++ b/include/net/netfilter/nf_flow_table.h
@@ -340,6 +340,9 @@ void nf_flow_table_offload_flush_cleanup(struct nf_flowtable *flowtable);
 int nf_flow_table_offload_setup(struct nf_flowtable *flowtable,
 				struct net_device *dev,
 				enum flow_block_command cmd);
+int nf_flow_rule_bridge(struct net *net, struct flow_offload *flow,
+			enum flow_offload_tuple_dir dir,
+			struct nf_flow_rule *flow_rule);
 int nf_flow_rule_route_ipv4(struct net *net, struct flow_offload *flow,
 			    enum flow_offload_tuple_dir dir,
 			    struct nf_flow_rule *flow_rule);
diff --git a/net/netfilter/nf_flow_table_offload.c b/net/netfilter/nf_flow_table_offload.c
index d8f7bfd60ac6..3cc30ebfa6ff 100644
--- a/net/netfilter/nf_flow_table_offload.c
+++ b/net/netfilter/nf_flow_table_offload.c
@@ -679,6 +679,19 @@ nf_flow_rule_route_common(struct net *net, const struct flow_offload *flow,
 	return 0;
 }
 
+int nf_flow_rule_bridge(struct net *net, struct flow_offload *flow,
+			enum flow_offload_tuple_dir dir,
+			struct nf_flow_rule *flow_rule)
+{
+	if (nf_flow_rule_route_common(net, flow, dir, flow_rule) < 0)
+		return -1;
+
+	flow_offload_redirect(net, flow, dir, flow_rule);
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(nf_flow_rule_bridge);
+
 int nf_flow_rule_route_ipv4(struct net *net, struct flow_offload *flow,
 			    enum flow_offload_tuple_dir dir,
 			    struct nf_flow_rule *flow_rule)
-- 
2.47.1


