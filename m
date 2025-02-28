Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A399C282C5
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Feb 2025 20:32:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MAJ1+kbz8lZ4YwPg+OV3VOfAm0Jd01XhEIX1QeYwh3U=; b=3ehXRVysptb33Ke3DeCsOevx10
	UbKtPD0YqLyIWKvSYAu7cAhbOFZb3kAJSxv8AAIsJe83R6gUpx38j370IH8OplDEB0jqtyWwZw2cs
	x7ud6wxznWRwvmLFtHonum3Js6xWUYGQsibe5zwe6LHkYnEwKhE5XIjQlKDFXlgfgp8EPRyhw5dib
	PqmyjfKFPhNzqLNwtu2BVBfxwCxG5fuxlZ+sd7CD2hnxLVeyHxlqykbh7RvK6CmY1s71uDSuJUhsU
	ZZX3uvDTFGooIPNne5G2BX3EBA1Hql1MQSDZZKgr55/2qlM8cvu0Bd40WGjx3kMirpqhi8nTFi2T1
	xd/E+oqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1to71s-0000000CcOM-3zNQ;
	Fri, 28 Feb 2025 20:32:16 +0000
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1to6mb-0000000CYLC-3UsX;
	Fri, 28 Feb 2025 20:16:30 +0000
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-5dedd4782c6so4657184a12.3;
        Fri, 28 Feb 2025 12:16:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740773788; x=1741378588; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MAJ1+kbz8lZ4YwPg+OV3VOfAm0Jd01XhEIX1QeYwh3U=;
        b=eqlwf95DA90ou4KJDYI7sYD7H/lAgjXSomVos3ERk5eaGUZCwZcfmEflIR5OY+k+BN
         84f4JF32IBSFkLWSdSx0V6O7vjTa9zyhZcaW2tIkqqhMa/PI8DlWRtiNFI5eFL4WbwqY
         9nZzn90UwSSH8BtGlkaT4D36NbrbH2DSc8unc1fb8A31OEm3Db7PIAjASyFVkz7DTUWx
         bPCL614/6UJZjiW21a8PlOSSpH14q+IGAyVsn9GroWIniLSGKNAdSacL0ulCe5niTJ/s
         VFPeClptAzDscsqznCwyli24YTpWNrm5k1w++bgRyswlr+gzEhDlY6mrHpVR3Wj6Dhab
         DRoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740773788; x=1741378588;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MAJ1+kbz8lZ4YwPg+OV3VOfAm0Jd01XhEIX1QeYwh3U=;
        b=QRvfTA/4xb9FeayxARWEKuuJosF5THNndI+pNodUMBijVupR12TU/x24OXET1LBn7j
         GbI9d/AnKYG3TV55nBvpcyLWof4Z+gQTbQBpKluLLwion7smh2f+1wCxqcbnTDdHY5kX
         lNtlu9F8rKYz68+SjELETFT5cp2Yvgcipttl0q1KU66ycMpnEsMkWaSzu3OtajaEXx5N
         fWD7Zgy6A/4jHJKqcl+LlQRzExTyG7pozIPALRRs6OyvhmsyID1sxx8r8Lo36pHugnSo
         0KXLzfJY0edcKsAn8wULAAso72MkdakUXECSEJUVWNbuYX2DmlbmtU/0Aq+Pg6iBVdNf
         kEZg==
X-Forwarded-Encrypted: i=1; AJvYcCVULPbGRsKAkURSzfAf4mmfA46+zJtOIgtu8d8oE52gYhXyRvRHDm4D7c+xd1YtkA9x1mMC2PHtBroynVu3ZqA=@lists.infradead.org, AJvYcCWyt/l1QLgLF6ex7YUWj4SoP3b4l7dTzgqAgxWs1bdVFQgnTYnbHTtMf5eA8Q5bUCJyp3xd6SqKxGG1AebcOLL/@lists.infradead.org
X-Gm-Message-State: AOJu0YxHKsmTcaSzTmnYP2PvbLXXL9zv7dhAKzeUJwDaUhU9HEKHqerU
	ykVaSwFMVVFR/wC/3HE3rGmTnBpoO5Sx3GsPgZUTI4H22SzU3DWZ
X-Gm-Gg: ASbGncte7I6okoInpwOjGq9V6SIfelhBoO7G3qFmx807PX3xqL1xHb9w/qBMlC6znF5
	dJ1kbyzRy8dFicJCjsWHnQf+TiYV9p+Pgj5qLl+ToCtOhxYmIC1o7rQ3+IkIj7BUiDMf6GH7HoM
	Jx+6NXY+ix2vBH6p7VmAqiPZjpiTyWmQENROQa2/ganV2x5XTngBCYZRpuGLxQkuCIUkxsYIo5p
	aIMvhYi6k07g6tO72T8Xk/xjff1JJxAmBYt9jLnLhuPXN7/npb3c+uvznR1xuyEvZ3V4rFiR9if
	N22OCfXCiXhiUkLxxWgQ3bKneW4zgn0Xyt1U0K0SMc6SZgdxffRuRzhMrQHARJaCTFqUy8/lQ3e
	PoF3Al6T9KiBL970xjRF3mQfJZCFClzDliZZuDwm5cTU=
X-Google-Smtp-Source: AGHT+IF4o1r+k6+nG0zNGywKeKcizMy8Myj40MpWCdBkkMqspA1rSJwU0RPTkMPYXpO+ucJWx86obg==
X-Received: by 2002:a17:907:3e0e:b0:abb:b12b:e103 with SMTP id a640c23a62f3a-abf26218d27mr558296766b.34.1740773787937;
        Fri, 28 Feb 2025 12:16:27 -0800 (PST)
Received: from corebook.localdomain (2001-1c00-020d-1300-1b1c-4449-176a-89ea.cable.dynamic.v6.ziggo.nl. [2001:1c00:20d:1300:1b1c:4449:176a:89ea])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abf0c755c66sm340812666b.136.2025.02.28.12.16.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Feb 2025 12:16:27 -0800 (PST)
From: Eric Woudstra <ericwouds@gmail.com>
To: Michal Ostrowski <mostrows@earthlink.net>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
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
	Ahmed Zaki <ahmed.zaki@intel.com>,
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
	linux-hardening@vger.kernel.org,
	Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Eric Woudstra <ericwouds@gmail.com>
Subject: [PATCH v8 net-next 08/15] netfilter :nf_flow_table_offload: Add nf_flow_rule_bridge()
Date: Fri, 28 Feb 2025 21:15:26 +0100
Message-ID: <20250228201533.23836-9-ericwouds@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250228201533.23836-1-ericwouds@gmail.com>
References: <20250228201533.23836-1-ericwouds@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250228_121629_869957_88441C8F 
X-CRM114-Status: GOOD (  10.45  )
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


