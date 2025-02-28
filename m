Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54E12C282C5
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Feb 2025 21:04:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fA9Vmw88RokN6ZVcNFAMZ81OI6e/RLQJpo3MGu4wt9I=; b=jlyaWkaO5KlthtrQ2s/QHQYXNx
	eYzWy5QR7WOILdCE8Tcilu+80d1Az0YdGdiQ0fexQSYh2dOGNvlrIYzfQr7oKU0OhyQrjE/AYI65z
	w7/zJGZF4+QzHdNKIcG33oLRL9PMNUBx6liwK6vjhN+KRq61xQPmyAcrWkvGica3BQPzJEIkqiLSb
	cF+bk9ZHzbTbR/+1jXhu7JAsPPtn9UhbSSM6W445i2GCu8ogLGPj9SUaiSW7yMdQb/cKq44x9ppmE
	vs5O8idOSWPmSEDXfdesqjkmO3pENdlsaQkBJ0GB25Cui9sQkS7IXAOg7weY44zs/bX6WCAdqRAMw
	z/BDwzwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1to7WT-0000000Cfv4-381s;
	Fri, 28 Feb 2025 21:03:53 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1to6mR-0000000CYGG-3775;
	Fri, 28 Feb 2025 20:16:20 +0000
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-ab78e6edb99so341972466b.2;
        Fri, 28 Feb 2025 12:16:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740773778; x=1741378578; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fA9Vmw88RokN6ZVcNFAMZ81OI6e/RLQJpo3MGu4wt9I=;
        b=C1l/6Ala0om43XPz4RON2It3MM9JpIf6Fe4qO8HVciS2vKF+BReXeY8kkUvDhRRlrk
         svreS5cniqHfr0+lZyfgzADJ4FK7mIYI7DSx4TiGVXVQAewHo0FH/OyeKJjEzxycsjsJ
         x6vQnth91H9lW04K3yauxBdrRC7ijFWxz+1emPI6h1GC8/jolMGKB2b0/aVGj7XDlmsa
         xUWJwaeZrDPryk98wDPJCATP01pIW5Hv7AjxNH9GrYEpdbhONg9t1H7fH7Es+XkV0b6r
         en2shkf9ISNnYKBFaq0F1WOs2FJLX3rnEsvINELXsLo7UXeLGzwGCuBgEEgomRr5y/2x
         E65Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740773778; x=1741378578;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fA9Vmw88RokN6ZVcNFAMZ81OI6e/RLQJpo3MGu4wt9I=;
        b=KBo0/vQfyJIYbX2aOvqHpRTOdyVZNWj2foIldBy6dI2sDJRVXP33LuNnMgYdlRxJgQ
         hsi0OyVrBB0LNlSRKrizLCSGkeRJJdLKFxKZ/J+u8Fsphh5wsML6/ni3jlurWWk7EbXN
         9zC7WpqRGQ8a55CQJ4WM1HY3CGFWSELenD9M1SxY6iB1fTtEGfVQPog0E4PdlgYWvnn+
         //8ePU+OhmXNz4I6qdhRqp/pmo+gV2MDjoFBpoR3W0TaulVh7xOV/JnSLRiTlw/Lbgoy
         P1LcFmo79iCBRGVaJwC9qVt6kyWUQtcjY30mCmG+RLTBPusQh4XcrcqvoTJndtFnj3tj
         EXEA==
X-Forwarded-Encrypted: i=1; AJvYcCXFGgQebpLew/4oh3WQhLaEUtI25hZux8V1+qtOZbUstXizPzyinOKObVU4gzkC0Cn3T8JM2r7/3K1UuOCi8eUI@lists.infradead.org, AJvYcCXtGBrsyPjwLZ/Ui3PMRHjcGO95B0Z2kBSd4wm6gdJUdPD1hs416naAbPB2948rUxFXtl69QDFe1HQ+CVeMwps=@lists.infradead.org
X-Gm-Message-State: AOJu0YyLU+dEaTeJWI0f2rRDid45Wp5Ct5TmyBRx+DFfTBNpmtqy2Kgl
	G5Rg1y+Mtj2kiLMS9MMYAQro3lWAMM0RJJyqkTljv2EOU3aBYp6N
X-Gm-Gg: ASbGnctK8WEKbi/0blz6Qeq4t3x9VOha1FWDeFkRuxmZZzFy17bouTOR1Ji1GcPE4YQ
	DUxAfDKZlL3Kwb1y7wYzkvYsSFy94IiyUJ56tQQJ4AKCeJFGFHPzLgF9y7i2Paw/6umYBNgraWl
	p1rAOQyLp6lcRbqm+FGcAEexEgCQD2p9aychzICLoNRxkCTa29IVJHqli2aN1StnM6g9LgjRbec
	jXL1LpnbluQm+TasMrLdhTIL1R5rIQfOFmUhnoKzQJtDRs2yIZNb4nNpC4xHQm8gRI4DRsJJwEL
	RnByEc+rcOJzScvNor4k7loC/kFUQRTp1rzeldRSma5qCWcalvHTv6aH7HMVbOyNZqYijs4kqmI
	BLOvYYMVdhn1LHlfSVR8T87OL5XoVzDjySJAzu4AEhHk=
X-Google-Smtp-Source: AGHT+IG9CXfC9QShMuEkr891X2vbkzQ2uh+igw8zIKBPddpTAHKgNLtJZSPLkYYg96Gm41ClW4AX7A==
X-Received: by 2002:a17:907:3206:b0:abe:e981:f152 with SMTP id a640c23a62f3a-abf265a2a06mr522572366b.37.1740773777757;
        Fri, 28 Feb 2025 12:16:17 -0800 (PST)
Received: from corebook.localdomain (2001-1c00-020d-1300-1b1c-4449-176a-89ea.cable.dynamic.v6.ziggo.nl. [2001:1c00:20d:1300:1b1c:4449:176a:89ea])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abf0c755c66sm340812666b.136.2025.02.28.12.16.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Feb 2025 12:16:17 -0800 (PST)
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
Subject: [PATCH v8 net-next 01/15] net: pppoe: avoid zero-length arrays in struct pppoe_hdr
Date: Fri, 28 Feb 2025 21:15:19 +0100
Message-ID: <20250228201533.23836-2-ericwouds@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250228201533.23836-1-ericwouds@gmail.com>
References: <20250228201533.23836-1-ericwouds@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250228_121619_779334_48B5F610 
X-CRM114-Status: GOOD (  13.99  )
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

Jakub Kicinski suggested following patch:

W=1 C=1 GCC build gives us:

net/bridge/netfilter/nf_conntrack_bridge.c: note: in included file (through
../include/linux/if_pppox.h, ../include/uapi/linux/netfilter_bridge.h,
../include/linux/netfilter_bridge.h): include/uapi/linux/if_pppox.h:
153:29: warning: array of flexible structures

It doesn't like that hdr has a zero-length array which overlaps proto.
The kernel code doesn't currently need those arrays.

PPPoE connection is functional after applying this patch.

Signed-off-by: Eric Woudstra <ericwouds@gmail.com>
---
 drivers/net/ppp/pppoe.c       | 2 +-
 include/uapi/linux/if_pppox.h | 4 ++++
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ppp/pppoe.c b/drivers/net/ppp/pppoe.c
index 2ea4f4890d23..cb86b78de429 100644
--- a/drivers/net/ppp/pppoe.c
+++ b/drivers/net/ppp/pppoe.c
@@ -881,7 +881,7 @@ static int pppoe_sendmsg(struct socket *sock, struct msghdr *m,
 	skb->protocol = cpu_to_be16(ETH_P_PPP_SES);
 
 	ph = skb_put(skb, total_len + sizeof(struct pppoe_hdr));
-	start = (char *)&ph->tag[0];
+	start = (char *)ph + sizeof(*ph);
 
 	error = memcpy_from_msg(start, m, total_len);
 	if (error < 0) {
diff --git a/include/uapi/linux/if_pppox.h b/include/uapi/linux/if_pppox.h
index 9abd80dcc46f..29b804aa7474 100644
--- a/include/uapi/linux/if_pppox.h
+++ b/include/uapi/linux/if_pppox.h
@@ -122,7 +122,9 @@ struct sockaddr_pppol2tpv3in6 {
 struct pppoe_tag {
 	__be16 tag_type;
 	__be16 tag_len;
+#ifndef __KERNEL__
 	char tag_data[];
+#endif
 } __attribute__ ((packed));
 
 /* Tag identifiers */
@@ -150,7 +152,9 @@ struct pppoe_hdr {
 	__u8 code;
 	__be16 sid;
 	__be16 length;
+#ifndef __KERNEL__
 	struct pppoe_tag tag[];
+#endif
 } __packed;
 
 /* Length of entire PPPoE + PPP header */
-- 
2.47.1


