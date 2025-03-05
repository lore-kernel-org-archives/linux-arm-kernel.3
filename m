Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CBB3C282E3
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Mar 2025 12:12:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Gr1wMzwLJ3r114jkr+fSh/N13xzOYrfc9OnXbfM4Z7I=; b=NdH2xnsf96mlol4Hph9APWDlCp
	RRQy+VSTE+dHxBm4mnyTf37kPr3Nzh4g26WMWZetNcCV9/MHoFwcAnwW0pCmT7tCOc+qsZR4LHHnN
	Vs7/9wHVyfC1o3TYcNfdSeewtgBJ+0l9KuBBjMqrDgJI9wEHBM6js6uGhDleRzpR8SPB2XHySqNd1
	pQ5/euTtjtI2xMA4Zvn2vxoehRyX5mOGpcbHFZfptH3QerVcDsdJ7weaM54xNJEO4fN+aEE2lotVR
	7W4fio6f6eMJPmwMR2399RnGf+lrwmy2E/COQEeX6wockSgliBclTRFUTwJUX9gUAAtdMV61EqqFN
	txgUVBbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpnbu-00000007xt0-2Dkd;
	Wed, 05 Mar 2025 12:12:26 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpm13-00000007gTs-21ZV;
	Wed, 05 Mar 2025 10:30:18 +0000
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-abfe7b5fbe8so439079766b.0;
        Wed, 05 Mar 2025 02:30:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741170616; x=1741775416; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Gr1wMzwLJ3r114jkr+fSh/N13xzOYrfc9OnXbfM4Z7I=;
        b=kGDxTEB4tZhlrLiVjcOqRDPyj8DlxroW7b5wp/otCP1s31n/ZH5wZeJ9L+B443KKPF
         6HQbJzyXzWg7LdumC42as99IzMql4LhlqoBeBSarHFK3iicrYEDjD3FmJLlKkwiEq4X+
         mTcA4rVgrp4OCkwbfYanZuVnuZqq48cvVsCDFl/4pxR0wfi8z309qLiEoB/dAqT0bnw8
         qOOD+QLlJwyxr2Nv6FXVBx3huno+votJ1y9TTrMoxg6baWfFBC4BgbI/XY94y8oRDPu7
         vozNdJhhKFOz1yMJ9j8RQSkYng2T7l6qwL++n0zCENO9gOZhRGIg58RIZ+xtNE7hTT4T
         cPZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741170616; x=1741775416;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Gr1wMzwLJ3r114jkr+fSh/N13xzOYrfc9OnXbfM4Z7I=;
        b=aZ7+3TBlSBDNGTy77IkjywzJMMYzLvN5fkZvTpvtWzp2FZmwLUTBIWpvAcV6RPqIJ2
         1uy4S41br33cXiLAMgHzFg8tiCXuhIPD3SOZe5wGCBur5JauKdb6DBErNtr/36Zf9aAL
         D+9P1MOtLnDuS9mqJS+2R21fIUas8+RbK4prBSBE6HxXDcDfvqSJ26P9pH1QRWexO83T
         62c5t8tmPKke8ylglt/VL1M6YVqQS8wKeRkHKuMd56nCrPHY38MEpHRsl5cMKc1Wp+Qb
         1a1uSdkdWX5J7gduwBTmMiYx1OaOeG4k7Ti+FSPmj4xsiwH6zFSBudGGVQFG485SUH+y
         y1VQ==
X-Forwarded-Encrypted: i=1; AJvYcCVl/Ygu3dbVa0qbkHj0HprEkXbLW11A8K3fe+PCfTB3IIeHCMk3J5gL0RZL2L50FGSFY8luWYoGriRNr/qIA1w=@lists.infradead.org, AJvYcCXjzc41C/qO9x90fpDuGJSSShYjjl2FcywEcHXYHkYeCmFC6pa/hI5m0lBZ494L32+KqsREpvH1gTGcwtVLoMOX@lists.infradead.org
X-Gm-Message-State: AOJu0YweI9DClxP/ajfpJvwv/pCNCn5VZGoEDfPNXdCKGyOaguURbese
	zbyE2t/SP/hTQP3Rndm4H45VMfXfLzGM6qrg5lrPMp7lzkI0DI3T
X-Gm-Gg: ASbGnct58uCArtjUwGK8DjszL4qE7jK76k7jM+/dU4dTPy20UXM/FJwk3MgdWMtcQfd
	xUbbYo5jFVRpvQdbB+5M4Bb2J4FJE5whxSVQgZiuvhqNEHTh5wE2u7/yRD4W7A+Kd20ojGGucy+
	WRwPhGJJljJS2LkkWlttKyXjS53JXqVQSBsiDI1IzjfsSXoJxf44fBdmyLhWkxprY/GfawvQCJx
	uLxayfK3p4Q4WZQhuXOfQrn8/UgqPKcbLoHsQiQFFyf7QuTDw7CwZn7IhRPyqu9l8jSjjPMFON1
	UtWzidF91aNfyXlKQMlL2RdpzT/rh69BGMel2JWl6OnJp5+6i7DelvA9nBlQJUdingDdV9BRhYI
	DZ/j6rNl6S/IHy9VGPnXx6DhDqR3X1FuLSzLpOH+0TDbXjCDywqWv6ONFlX+Ddg==
X-Google-Smtp-Source: AGHT+IEs4xR9pD9LIK2nl03zhbpQIh0Gipd81ijJP6mFjuSVofHY5Sl1xp/UlJ1W/hq6f/T3nlJWzg==
X-Received: by 2002:a05:6402:2688:b0:5e4:9348:72e3 with SMTP id 4fb4d7f45d1cf-5e59f47f008mr5076173a12.21.1741170615734;
        Wed, 05 Mar 2025 02:30:15 -0800 (PST)
Received: from corebook.localdomain (2001-1c00-020d-1300-1b1c-4449-176a-89ea.cable.dynamic.v6.ziggo.nl. [2001:1c00:20d:1300:1b1c:4449:176a:89ea])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac1f7161a4esm247154266b.161.2025.03.05.02.30.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Mar 2025 02:30:15 -0800 (PST)
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
Subject: [PATCH v9 nf 10/15] netfilter: nft_flow_offload: Add NFPROTO_BRIDGE to validate
Date: Wed,  5 Mar 2025 11:29:44 +0100
Message-ID: <20250305102949.16370-11-ericwouds@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250305102949.16370-1-ericwouds@gmail.com>
References: <20250305102949.16370-1-ericwouds@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250305_023017_541336_20658E3F 
X-CRM114-Status: GOOD (  11.48  )
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

Need to add NFPROTO_BRIDGE to nft_flow_offload_validate() to support
the bridge-fastpath.

Reviewed-by: Nikolay Aleksandrov <razor@blackwall.org>
Signed-off-by: Eric Woudstra <ericwouds@gmail.com>
---
 net/netfilter/nft_flow_offload.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/net/netfilter/nft_flow_offload.c b/net/netfilter/nft_flow_offload.c
index 5ef2f4ba7ab8..323c531c7046 100644
--- a/net/netfilter/nft_flow_offload.c
+++ b/net/netfilter/nft_flow_offload.c
@@ -421,7 +421,8 @@ static int nft_flow_offload_validate(const struct nft_ctx *ctx,
 
 	if (ctx->family != NFPROTO_IPV4 &&
 	    ctx->family != NFPROTO_IPV6 &&
-	    ctx->family != NFPROTO_INET)
+	    ctx->family != NFPROTO_INET &&
+	    ctx->family != NFPROTO_BRIDGE)
 		return -EOPNOTSUPP;
 
 	return nft_chain_validate_hooks(ctx->chain, hook_mask);
-- 
2.47.1


