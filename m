Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC348E77197
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jan 2025 09:14:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0IPV+/btLneRoSo5HiyXyxa4AsB3fEttv56AKWcCbic=; b=otM+68YGgndjDR63xbN6ZN5Z/C
	zu+Weea9py0JUgIgXWh4zOV8Ap2tb9kvVvYeF94zuUJ2+n98srvF1uKGAe09JQCKSuspvDmU4+RZ2
	i3yu/FFiuhr9Ylu0S06T3LFaVFG/Gn0Be1d+3tIcRHBFX39tn2xlXk+ljD9BTgnDTRZnC/NbITV5K
	7cGcAxjQ8JVlFDWkBWziPch12acEgV4ia4r1PVro/IjEZjcuQ3Ui8YPJ8M2WKGSj1hdQMJxYCIoNA
	TC6aunszGwLojRXkN3vfs2R6wBP8ZPqhFO3Psxdjq7lB/tGBdfI9+x9evc69fJnwlnDXV06UBCPEG
	UV/Z/pTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tV5fV-000000044cR-1VlC;
	Tue, 07 Jan 2025 09:14:33 +0000
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tV5XQ-000000042YX-0BXQ;
	Tue, 07 Jan 2025 09:06:15 +0000
Received: by mail-ed1-x529.google.com with SMTP id 4fb4d7f45d1cf-5d3f57582a2so28917119a12.1;
        Tue, 07 Jan 2025 01:06:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736240770; x=1736845570; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0IPV+/btLneRoSo5HiyXyxa4AsB3fEttv56AKWcCbic=;
        b=LUHFLIdWrQkEozWcCKCC15mP4zn7XR00xXfSrySrKp+PwxPGz37RWSi3hnRYXu79cg
         M4QbL2Q6hCH8yJRJf/vhh4WPikJtrjo0k8qxRCicgY9th/I3YCIZ1ZW02MpsAn36N6kS
         YEZStTAcrDUm74U5icsi04K7YrddqckQv7m0iT4IfClaWJN80IKzoAYhi/STkMRWrXRh
         EjYJqc5+Spr81nwZ81WPOaYmSSljYGwnQlifGLk8aoaYc6rt6YfuDwgM8JhxqiNcGdnG
         iTBOUbxnhUXoQVM4KF0rEV/KFimWiPz6S9M4+9L8fDb5CogEAz1RZJarcocoYf35e21i
         ZnZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736240770; x=1736845570;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0IPV+/btLneRoSo5HiyXyxa4AsB3fEttv56AKWcCbic=;
        b=pKvIeIZ4tPwCe1gZuyO6EJtanBGZtcXvoMOnddeq9HkbrQWJrUTHy028o2RlDD0guu
         ecSWUZ9ZTRo7mDTJK78yT14/fR/XqE/YQEArrRvY7e3HSW/Ppkv+tdsiL3VzqT7pRf9y
         4uKT5DtZwYpTulM+LN7EDbHjf06d6yt9A85BsFLjZcjjw4fAgxa+GGiBHluR29bEJwAx
         YI3SJBU0U6oWYIX7Mtuxp3IgnHTuUdzAW7cZ3A+wg2ItFwgcvXVYoJgOUDt9wQ8TGhOb
         fsiofGaZOOJbVZcgwpeYD280M9L/zZzjHzXiH7zucdFb/qDX3KWFmbA93iWMaWAQxpx9
         2cjQ==
X-Forwarded-Encrypted: i=1; AJvYcCUTf0/HMkp1xQdvnSG2FjIEzXv+D45mY0wFiQSraLPYGvpPRiSmwaiInxteRVwCTKGqYWc3dGs+LG1ApcVh/zQ=@lists.infradead.org, AJvYcCXx4KzEbVCw3VCHR6XpAAUMG5zEx5rmStlQRQusQlDqYm/H/t/mB1Eb2B4MdeYD1YbOak8pE9n68wDF8ENc6UgK@lists.infradead.org
X-Gm-Message-State: AOJu0YwX9emHyh7xBnPl9N2Uh0YovFfqk+J2PDrVDCT6fHyM5HR5PmjQ
	u/t9orLNLeqJnMpQbzwVM9VExPNbc3QKc0VVw6MGtDiYjRZmkERu
X-Gm-Gg: ASbGnct7jMu9fvAWq2fW9tPIZtgm+0i3yxPVOX66PO4FVOnxmi/QcG/NyWMVfx7r4LB
	EajkACu2uZvkZysVS8JNpuSmBYfEiv5pvunA6W5IRPLIVu4GZ03rouamXO0SWloKP3rbs8k0Psc
	ccACxmgicMUYp2z43BgsOvTNxd5GthS6dP3iOC/jM8uw4sNNaGFiL8ZaPBM9e1jMNlG/9VhIhJG
	mv7r8P4sWT737H8O8OP4J3k2zR788mxGZw8Zi4PA5bw9wueHT3zPxD0cAhTLq/APF06ygOwKlMq
	Tm9upU1gVzyuzwnlbOXkIgsUlFqwgdAKPqPY0XrwAdv/UpxUER8OMgIXx5mR66FCw5OGN98+jA=
	=
X-Google-Smtp-Source: AGHT+IGuwqZCeoYTDAlGotcMA4hMjnDwkRNwCsaQvYcPeOTdVvTuTBvdK5LwWWAVBu+HrkBFOHXWUg==
X-Received: by 2002:a05:6402:26d1:b0:5d3:e9fd:9a16 with SMTP id 4fb4d7f45d1cf-5d95e916b32mr1930324a12.12.1736240769741;
        Tue, 07 Jan 2025 01:06:09 -0800 (PST)
Received: from corebook.localdomain (2001-1c00-020d-1300-1b1c-4449-176a-89ea.cable.dynamic.v6.ziggo.nl. [2001:1c00:20d:1300:1b1c:4449:176a:89ea])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d80676f3f9sm24005333a12.23.2025.01.07.01.06.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2025 01:06:09 -0800 (PST)
From: Eric Woudstra <ericwouds@gmail.com>
To: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Pablo Neira Ayuso <pablo@netfilter.org>,
	Jozsef Kadlecsik <kadlec@netfilter.org>,
	Jiri Pirko <jiri@resnulli.us>,
	Ivan Vecera <ivecera@redhat.com>,
	Roopa Prabhu <roopa@nvidia.com>,
	Nikolay Aleksandrov <razor@blackwall.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	David Ahern <dsahern@kernel.org>,
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
Subject: [PATCH v4 net-next 06/13] netfilter :nf_flow_table_offload: Add nf_flow_rule_bridge()
Date: Tue,  7 Jan 2025 10:05:23 +0100
Message-ID: <20250107090530.5035-7-ericwouds@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250107090530.5035-1-ericwouds@gmail.com>
References: <20250107090530.5035-1-ericwouds@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250107_010612_081604_FAACA328 
X-CRM114-Status: GOOD (  10.84  )
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
index b63d53bb9dd6..568019a3898a 100644
--- a/include/net/netfilter/nf_flow_table.h
+++ b/include/net/netfilter/nf_flow_table.h
@@ -341,6 +341,9 @@ void nf_flow_table_offload_flush_cleanup(struct nf_flowtable *flowtable);
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
index e06bc36f49fe..5543ce03a196 100644
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


