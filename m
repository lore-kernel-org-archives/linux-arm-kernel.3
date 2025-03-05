Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28B41C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Mar 2025 12:18:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pWKZKslFax2kV4u5PDGKsv4N0lJQ1f1k8yO/foh+po0=; b=4pBzzrI9leI1/X9C9P/mPwvo+G
	C/DA1dxZXeQroVwDKqlo5htTzE2r/h4M9mF0vX+JE7rpkE8mU+balT7l++duLoa02Jm4kBh00A+k0
	7v8n9qbCAC9FlgaAEyvALI7ba1UpMBe2yqaS6r/TemQtgy4ovC7/qNwH/pPJDop2czdbdoixj+2yr
	Vi2f//60R2zC1Ah0QmWe0pD5OsY/d8hPfORw3JbMTBx/UYeuhCxZGlCMXJlcbS84YlUOb8kSKya1U
	y2KhVQ9EbO1HSuQiVoNyAA6vyznWBDr1UxIsBF9Q2CtgI7pQLA1ZKoM3il7pl7koP1PvS7Rr1spk4
	fyvbvk4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpnhw-00000007zQl-1ZFu;
	Wed, 05 Mar 2025 12:18:40 +0000
Received: from mail-ej1-f43.google.com ([209.85.218.43])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpm0w-00000007gRA-2ioV;
	Wed, 05 Mar 2025 10:30:12 +0000
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-abf538f7be0so689972466b.3;
        Wed, 05 Mar 2025 02:30:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741170608; x=1741775408; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pWKZKslFax2kV4u5PDGKsv4N0lJQ1f1k8yO/foh+po0=;
        b=DcBzk9JV5udoRe/2CafleVMcKfF/JiwT3ivn6pvH2oJmwaSQePw+CkrbVxC9xz5OkN
         GmxwedNUFK5aPCUyCynnBdKI27UutRL77W/RLEXDEWsb2pfAHHAzQoHTRQz8NXJO1qb0
         ZOT/xs+2jkxB32mSQ1yAzl0nyGH4BzN3UkdmvwD7rOYgyoFCGeTOccuW/+WmzbE6GszK
         XOvFXubpsNEgbxFnIwLNyDx4CUJx5TITZ9r6WpmBYi21OoJAU+S7tbUd7LxIRo5Wh0xs
         Gv7mxi5VWUOSWkTZp4mBoK/7RPiMdx9nZnLFzusdm2R96ZCU5JffAXpTLigRK2J1H1OS
         +d2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741170608; x=1741775408;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pWKZKslFax2kV4u5PDGKsv4N0lJQ1f1k8yO/foh+po0=;
        b=FFLecyAUOX18V52IxRJEbQk57pXjW1lcvExF/pn65GAVGaafQE+Qj8irhfPjvd7k9t
         B6OL15fLhMg+qK8pbzu95CybFmI/Hu9t6JbgaOH4Wa86fHRov3BFV/kBj57w49i2rzXF
         nc4GHCsbu6Z+143NBEmCxiuOY72V/Ud+4mr6xxE8sKS8ulZJHoik+1DVGRqwwNsvo+Qo
         0aL4lTjMDoctR+QM8anU35ECAkBLfLwwypZ8LrODnlOmLAiy8dv68w8Cg5GxsNhs41s+
         8s9/MMGx4XgOmamEvE6dZbkg9jDdN8ZweDxExBBI6OdjXuujd7gUhfrURDg4YTbygcwz
         Wmaw==
X-Forwarded-Encrypted: i=1; AJvYcCVqMBtUJF7frL/UnGJUuAsYMuTHnMOCDqpzDLOmwYInbJP+yi5NY0uJsKnLwk4W7gdkWidhbLj4hopKVJBk6Ig=@lists.infradead.org, AJvYcCWMvat5+29+NLFEz8Vv2Yi9awk7H8Zc+y1KJz1Te8jCLTGWT8L4TPJUVxiXAvQYcUV0ilEp2WJnoPuuoPq5K4Qe@lists.infradead.org
X-Gm-Message-State: AOJu0Yy1PkhoHT5OXHcA/9C1wQWI4ApavCRC4SJ4XxVuXt6GUueCkKrm
	SAnIuVBB0cJNAXXqDBSpdGdat7oNZc6n2vXlt1L23q8qCMPkUVI2
X-Gm-Gg: ASbGnctIwgh3oA6hqcBOPS9jOgj4sRl5j4IBsFierm8pE3PSNIkSqUQT3f84hinapwE
	Q90wuDokT8MTflVmJC9CYz52uGQ0QQq6a9KacwCw9Xy9RokqAITjhobxHOuJy3XW+6F92OX6eF2
	h0DcOQ4e+q66e7zdSXzyUcVrE5Wj54JyATHwbDkQWXdMrlxuytRmAwrvmQUX7dIr1dR6o8o2xjJ
	jAjIMoxoooAEu9EFDV8W2xrkGN1yg/LxWOJ+mYRPw320o0kq2Jkfkmis3abbbgVTyaZsaU+FcEE
	FMLpLhGCGcdCgtDZbxYvIf2lTfCbTyYkgNSC2+B4iQ5zTeqcqH14okyuuCAZ08cA7UYxalID3JX
	zvEgqUuGDXZvLyIPCSfE9tmW+9lW/g2R/F6W1dXTBWH/n8HrM9PuEe1yQCE8/Bw==
X-Google-Smtp-Source: AGHT+IFexB2RNevlxHvMPAf8/WCLTLQ9IXmSXZbmZFMdhkY06Emnzf/hwS2/XrsP0oxSe3vo0bLssw==
X-Received: by 2002:a17:907:3f15:b0:ac1:509:79b1 with SMTP id a640c23a62f3a-ac20d8bc9a1mr236165766b.20.1741170608493;
        Wed, 05 Mar 2025 02:30:08 -0800 (PST)
Received: from corebook.localdomain (2001-1c00-020d-1300-1b1c-4449-176a-89ea.cable.dynamic.v6.ziggo.nl. [2001:1c00:20d:1300:1b1c:4449:176a:89ea])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac1f7161a4esm247154266b.161.2025.03.05.02.30.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Mar 2025 02:30:07 -0800 (PST)
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
Subject: [PATCH v9 nf 04/15] netfilter: bridge: Add conntrack double vlan and pppoe
Date: Wed,  5 Mar 2025 11:29:38 +0100
Message-ID: <20250305102949.16370-5-ericwouds@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250305102949.16370-1-ericwouds@gmail.com>
References: <20250305102949.16370-1-ericwouds@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250305_023010_690581_2A85012B 
X-CRM114-Status: GOOD (  14.25  )
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

This adds the capability to conntrack 802.1ad, QinQ, PPPoE and PPPoE-in-Q
packets that are passing a bridge.

Reviewed-by: Nikolay Aleksandrov <razor@blackwall.org>
Signed-off-by: Eric Woudstra <ericwouds@gmail.com>
---
 net/bridge/netfilter/nf_conntrack_bridge.c | 83 ++++++++++++++++++----
 1 file changed, 71 insertions(+), 12 deletions(-)

diff --git a/net/bridge/netfilter/nf_conntrack_bridge.c b/net/bridge/netfilter/nf_conntrack_bridge.c
index 816bb0fde718..4b4e3751fb13 100644
--- a/net/bridge/netfilter/nf_conntrack_bridge.c
+++ b/net/bridge/netfilter/nf_conntrack_bridge.c
@@ -242,53 +242,112 @@ static unsigned int nf_ct_bridge_pre(void *priv, struct sk_buff *skb,
 {
 	struct nf_hook_state bridge_state = *state;
 	enum ip_conntrack_info ctinfo;
+	int ret, offset = 0;
 	struct nf_conn *ct;
-	u32 len;
-	int ret;
+	__be16 outer_proto;
+	u32 len, data_len;
 
 	ct = nf_ct_get(skb, &ctinfo);
 	if ((ct && !nf_ct_is_template(ct)) ||
 	    ctinfo == IP_CT_UNTRACKED)
 		return NF_ACCEPT;
 
+	switch (skb->protocol) {
+	case htons(ETH_P_PPP_SES): {
+		struct ppp_hdr {
+			struct pppoe_hdr hdr;
+			__be16 proto;
+		} *ph;
+
+		offset = PPPOE_SES_HLEN;
+		if (!pskb_may_pull(skb, offset))
+			return NF_ACCEPT;
+		outer_proto = skb->protocol;
+		ph = (struct ppp_hdr *)(skb->data);
+		switch (ph->proto) {
+		case htons(PPP_IP):
+			skb->protocol = htons(ETH_P_IP);
+			break;
+		case htons(PPP_IPV6):
+			skb->protocol = htons(ETH_P_IPV6);
+			break;
+		default:
+			nf_ct_set(skb, NULL, IP_CT_UNTRACKED);
+			return NF_ACCEPT;
+		}
+		data_len = ntohs(ph->hdr.length) - 2;
+		skb_pull_rcsum(skb, offset);
+		skb_reset_network_header(skb);
+		break;
+	}
+	case htons(ETH_P_8021Q): {
+		struct vlan_hdr *vhdr;
+
+		offset = VLAN_HLEN;
+		if (!pskb_may_pull(skb, offset))
+			return NF_ACCEPT;
+		outer_proto = skb->protocol;
+		vhdr = (struct vlan_hdr *)(skb->data);
+		skb->protocol = vhdr->h_vlan_encapsulated_proto;
+		data_len = U32_MAX;
+		skb_pull_rcsum(skb, offset);
+		skb_reset_network_header(skb);
+		break;
+	}
+	default:
+		data_len = U32_MAX;
+		break;
+	}
+
+	ret = NF_ACCEPT;
 	switch (skb->protocol) {
 	case htons(ETH_P_IP):
 		if (!pskb_may_pull(skb, sizeof(struct iphdr)))
-			return NF_ACCEPT;
+			goto do_not_track;
 
 		len = skb_ip_totlen(skb);
+		if (data_len < len)
+			len = data_len;
 		if (pskb_trim_rcsum(skb, len))
-			return NF_ACCEPT;
+			goto do_not_track;
 
 		if (nf_ct_br_ip_check(skb))
-			return NF_ACCEPT;
+			goto do_not_track;
 
 		bridge_state.pf = NFPROTO_IPV4;
 		ret = nf_ct_br_defrag4(skb, &bridge_state);
 		break;
 	case htons(ETH_P_IPV6):
 		if (!pskb_may_pull(skb, sizeof(struct ipv6hdr)))
-			return NF_ACCEPT;
+			goto do_not_track;
 
 		len = sizeof(struct ipv6hdr) + ntohs(ipv6_hdr(skb)->payload_len);
+		if (data_len < len)
+			len = data_len;
 		if (pskb_trim_rcsum(skb, len))
-			return NF_ACCEPT;
+			goto do_not_track;
 
 		if (nf_ct_br_ipv6_check(skb))
-			return NF_ACCEPT;
+			goto do_not_track;
 
 		bridge_state.pf = NFPROTO_IPV6;
 		ret = nf_ct_br_defrag6(skb, &bridge_state);
 		break;
 	default:
 		nf_ct_set(skb, NULL, IP_CT_UNTRACKED);
-		return NF_ACCEPT;
+		goto do_not_track;
 	}
 
-	if (ret != NF_ACCEPT)
-		return ret;
+	if (ret == NF_ACCEPT)
+		ret = nf_conntrack_in(skb, &bridge_state);
 
-	return nf_conntrack_in(skb, &bridge_state);
+do_not_track:
+	if (offset) {
+		skb_push_rcsum(skb, offset);
+		skb_reset_network_header(skb);
+		skb->protocol = outer_proto;
+	}
+	return ret;
 }
 
 static unsigned int nf_ct_bridge_in(void *priv, struct sk_buff *skb,
-- 
2.47.1


