Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BC4BC0219E
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  9 Feb 2025 11:22:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MAJ1+kbz8lZ4YwPg+OV3VOfAm0Jd01XhEIX1QeYwh3U=; b=whGKnM+SwtHQX+8kvLQhSvO5Uu
	RG+AVeQBIZpOFeZZKapiqMlSF9aCvYg0nmDVlGvOgcs0uoL17s2FL4xUGmzO0ccAtiuWkCVXMXKTj
	TDb/QAE4UbWaWz3PbmXTrWGvZeUsnBMb65C/hCUWlcC/CpHxpAMkdr+B8QqaZtt94MhCgVnnTfhIl
	z1kGGZujQgXCFMDIhrOrQNQQ27Dz+wXFopM0DQIJ/n12StAd7AJdewpAOHOAH6cnLKU7vh1sWkETt
	m14LWaAeuK5IYiIFaRyH+k+z8f0ZXg2mUgK+iyq9zkkqn8V5BCN7lkBuFkl2y8IM8hy7yLtC0ofHP
	0YXWV6mQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1th5ON-0000000Ej7r-1bAv;
	Sun, 09 Feb 2025 11:22:27 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1th5DE-0000000Egaw-26tI;
	Sun, 09 Feb 2025 11:10:57 +0000
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-ab744d5e567so668364066b.1;
        Sun, 09 Feb 2025 03:10:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739099455; x=1739704255; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MAJ1+kbz8lZ4YwPg+OV3VOfAm0Jd01XhEIX1QeYwh3U=;
        b=mSCvlQ1v1fArBLzbX7fASjmEbPS81YJB+T46ehBzLJJ9evpjR4BLVwjE5hwpoTbhKJ
         k70FEX23o/pcQamr31XNcLAQF5QaTiteu/FfofA5aIS25LMXJceKZtRdX5sbbCJvPj+K
         jmYYsEkDXXY2Odt+H815PDLVPVMuzvdfArQi84RYCTU6XhICY6pByf24nwpMREsDUQkC
         sNEH/hYiJbLQia2JlIS3thmDmPt8uhGvB5DqIW2Hyul34L8sTk6vVnRaehFyU6HPXLCi
         Dacu+zBvqY1ubWJu6kI+m/uWkv2vz7l/k/sBk4nDP3WO2widtD9cVZeg10rDU8PyMmpB
         +JVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739099455; x=1739704255;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MAJ1+kbz8lZ4YwPg+OV3VOfAm0Jd01XhEIX1QeYwh3U=;
        b=iv1K/rCoYX3jmKPCntz5EMbrdD5Y6LYowd7wwUm99u7Ht7EonTAonGz71ML+COG0YM
         s5vJbioIdrGGb9UgtjEaoMDqISmX5qw4Q3V3Dzp6THoGIo6EeU7JL5ulzXgw+eZRY3Oj
         cnl++c4Dem/88JfgkOjYREdnIA3pGJoDGzJwSuf0rPAz6t4w1aSoVoURALTNwUQURkPX
         ieP4x3SWRo+gnHZx+7g39FYeUSWzyMetPErbaaH/BVwT2OQDAF2kVS5zJAfEnUPRgh2H
         7VUDRXVM9dpH+ftHJPbFDqwEtGFroGlwsa5RSjfxD4yC9YFl6/p/UBZ6pTTg54tuAyaL
         L8ag==
X-Forwarded-Encrypted: i=1; AJvYcCUv6u/lb2/oCLziw69g2pxhmgm2hmUHNMqoapKD9V1t9t2NsfHeMk75iFU09p0EsN4y0x98tkf7J8J/atDxOyQF@lists.infradead.org, AJvYcCVx3TDffm9UNjm88iSh9UlgKcUbTYICMLMlZGYx29igEa8aprcbWfmCOAuCpKPlUFfyQeyReEqwSljQYZl7DeU=@lists.infradead.org
X-Gm-Message-State: AOJu0YzDdHa+oRw7dS182UmP6IqA8cU1txJIytJfrYJ7jBxtUEfS9M2o
	+XXH77mQZG8oDsuGu36V3CZoYgWlBH8GENalXwQW9+jzHH2+eCfM
X-Gm-Gg: ASbGncuyae2w9v9vF73FUy2ICzULj3jUhuOe2MyX3Jjl8KUrNAjMm0Fzluak3HBArEO
	Jsdscs9sZQDVL8AImaPB54vAvSqjxzn1MXnJ8hiyDA0KcX5dCcdUg5A02F/Wy4AffhS6VMXwFPI
	J/txqxcFDCfehuQOoyLSOzLd6JOcnXvv8d4p8Kt5+dmeVNCPBeCPd+kqpY2ud3kkf3NcgQebJb9
	3fYGpHxPcjVMZ0prW0yrPcxdIRTNYyhhiCDhMa2oJhnNMmVhX2CwCLuX4gtdH617oFSYZEPsWcH
	P2Ndj7kxS5ni06KV7VosmD2JySiO/uNTd/SAoHIC8VfRos80SnspWyRHkBbNiXfBfesPYqiULuV
	Nlmnn253asasLHrdgJVOWdylJVy12Dg4Z
X-Google-Smtp-Source: AGHT+IETHQR7T52RBo2+4AcJP5+zLkS5jFUxhqgYRmiNsDGC4K0ZODmmfPCzwNhYWr95O8KmQOhA2A==
X-Received: by 2002:a17:907:ca0a:b0:ab7:a318:611e with SMTP id a640c23a62f3a-ab7a3186356mr452158166b.18.1739099454708;
        Sun, 09 Feb 2025 03:10:54 -0800 (PST)
Received: from corebook.localdomain (2001-1c00-020d-1300-1b1c-4449-176a-89ea.cable.dynamic.v6.ziggo.nl. [2001:1c00:20d:1300:1b1c:4449:176a:89ea])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab79afc7452sm357516366b.163.2025.02.09.03.10.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Feb 2025 03:10:53 -0800 (PST)
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
Subject: [PATCH v6 net-next 07/14] netfilter :nf_flow_table_offload: Add nf_flow_rule_bridge()
Date: Sun,  9 Feb 2025 12:10:27 +0100
Message-ID: <20250209111034.241571-8-ericwouds@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250209111034.241571-1-ericwouds@gmail.com>
References: <20250209111034.241571-1-ericwouds@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250209_031056_551800_F6BC6ED2 
X-CRM114-Status: GOOD (  10.65  )
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

Reviewed-by: Nikolay Aleksandrov <razor@blackwall.org>
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


