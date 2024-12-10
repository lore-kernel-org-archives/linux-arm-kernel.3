Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB4D4E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Dec 2024 09:53:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0IPV+/btLneRoSo5HiyXyxa4AsB3fEttv56AKWcCbic=; b=VxvGp/6TvVL/C67PEB3frQ0U9F
	x/rNfBAzFRZcIrhYNlo1VM1fqahS4QctT3a4FqIT1vnuzHM0ONoqHZrDv9HomRFQxkmBv3ccB0Md5
	JdRehS/R2Um9a8KrPbSDIAB647QFtYpyvbxeB6io5iAbPITQ1gvZyjJU/iDG39VuNQqffiqX317bw
	8CM1weQoGFuJ7sp0Y6utg48QiwdKTSdfVuV2COfpDo3P2cz+qRTm+p2tU4HlZ5YQxGHvDkKQofSmY
	0ECn38K6/CoZYUA1hPLdBPkcwHdLOAPv2m4+D5pTP2wj433mgViaCMO+HTHjuiCotTqWzNT7mBpyR
	B9TR+ViQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKww2-0000000B1Fw-3hUD;
	Tue, 10 Dec 2024 09:53:42 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKwov-0000000AzGH-43ij;
	Tue, 10 Dec 2024 09:46:23 +0000
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-5d2726c0d45so8124270a12.2;
        Tue, 10 Dec 2024 01:46:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733823981; x=1734428781; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0IPV+/btLneRoSo5HiyXyxa4AsB3fEttv56AKWcCbic=;
        b=F3K4FZbXwnY5Q1eGb39OECNc4Gb7VPNjHK6YwSXXR8T2MKO4KaoiodHw2cgiK+dTf6
         ptPUAnZAZKmGLVUqiS77p7u9eUzP84avBbqgJkYHn7iASb9h1YLh3DqWuJA/zuPdcOzc
         PRQCGkX8vNLJFNOzj4llQzSlk3IZj4lmkOMKFvYNS/WVjz8QCL3mVLdLWsOgioihBfwr
         Dj16OP9vE1yZCNo+GVU0SkYvPx2KaZpv4ONqnqnE2kqy69XRdtLz1jmN4lsFrxA8dZOb
         IM0c/TcYP7NArqI9zv/bNZqOmQYQgxUqlKp/ZR/jEAlee7qJi1EFwg69iKGhedBxSum7
         YKjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733823981; x=1734428781;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0IPV+/btLneRoSo5HiyXyxa4AsB3fEttv56AKWcCbic=;
        b=HegLfSt57heFtrKuOZsfA28lr5AUU+CrLZ/ekRxbgUna4SbD10DACmoYU2E+rm/PN0
         nF8wvS890mXGuJ+fswizTP5YNbVy3NgV9F8d0SmK3aI0a7JJmefWHpD5mvuREyWYOJCH
         TI+NatxGK/SQ2AM5vK2y8g6TQ+bqdK/cB1yTCJYX47t21+dV7qpkLNvUtguxAKdVW14H
         8dGT/HByDLhOU8opmCeSE3MtEy0z24d1uyq4kw8WaSoufRalcFoIzTVLIz8Jmz3h0tdE
         wibQhBajuMxRw/gNOwRL1GpWCQvNM7ODE5ZgwoJFD7JkvCmsIUX2ENiyDzvEw22y4mk6
         UDKg==
X-Forwarded-Encrypted: i=1; AJvYcCVMaCLhoooydFkjCJOVTZ1F/cyw4D9q5Od97gGOFqGs0vu225wgWPNUOi77UnDivk1vNqTRkMOAJSAdM1y+otc=@lists.infradead.org, AJvYcCWXJwVzupx99NlfYEmiU0KPNDhOwJFxFXmtO6/jcV5e9JfnGNarCvbCGh//34T1NTUZv5TV8DBP2PRB9Rkd4hfM@lists.infradead.org
X-Gm-Message-State: AOJu0YwsqsM0RNU3MuaHHCudJHNEBWoeTkNG+5u8Q7FsbpcWSxZHmnua
	3ZnVxf9QZaECyzzuNZ/nfLQ0HSrheyDCCYPADpNNZL7XhAAvn8Un
X-Gm-Gg: ASbGncvcpt2tvBOp0gGp8aaDCJSD7PfI+BTY5u2oMhh09YLZSxqn8Jee6ohppIyPcm+
	+LCYS4iQqaAyf3M8dIXfkimEXPUTLwuNdpTE9C7l6krw++rzTLE53zKIfCc/FxZS/tZ7/2+PGT3
	mauc8yjd6obooPnWNki6nUVBsCdNhtzeA/aKUt9eJusfCIsYhnNa8o3ymAGGGAwA7+eqi3WzDPE
	HuQSDm6/meur2lB5GPwXRTweOmuNPzEJeAmzjvsXrB/kjYouuvIHZxz2NdS6jNs9kRTi6HppRbd
	WbagOrrva3sz+bE00cFKR+Tk35EW6ko06nd0fD7bJ55PuqoN8RrpYa4F8IpO6/T3TglQm0U=
X-Google-Smtp-Source: AGHT+IFjT0LuXJIh1LnKJhzqy9wN2HFcOfLo9WVivfUzaooRucqnpDZPHXE4LF68gVbRTOO3lAb8JA==
X-Received: by 2002:a05:6402:42ca:b0:5cf:c97c:8206 with SMTP id 4fb4d7f45d1cf-5d4185f8686mr4106270a12.25.1733823980513;
        Tue, 10 Dec 2024 01:46:20 -0800 (PST)
Received: from corebook.localdomain (2001-1c00-020d-1300-1b1c-4449-176a-89ea.cable.dynamic.v6.ziggo.nl. [2001:1c00:20d:1300:1b1c:4449:176a:89ea])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d14b609e56sm7313936a12.40.2024.12.10.01.46.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2024 01:46:20 -0800 (PST)
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
Subject: [PATCH RFC v3 net-next 06/13] netfilter :nf_flow_table_offload: Add nf_flow_rule_bridge()
Date: Tue, 10 Dec 2024 10:44:54 +0100
Message-ID: <20241210094501.3069-7-ericwouds@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241210094501.3069-1-ericwouds@gmail.com>
References: <20241210094501.3069-1-ericwouds@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241210_014622_009431_0E81D8AF 
X-CRM114-Status: GOOD (  10.37  )
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


