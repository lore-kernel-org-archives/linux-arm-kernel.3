Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E728BE7717F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Dec 2024 09:56:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dC3jhTj5HQrnKJfxc0SY/ZIZuFArZD9eLZZ+JbLbIJI=; b=1jUESVLTy9acro3+xMG2qo1ryu
	ZhrdpimzbCRnBCROIqY5bmfsVyARN4g1O3mc11p1CnLg8qfMLewTX/m4EQjw4CylnFI7MEnsC0WXv
	iQcVDIzy7W3USDYwDo865TxHwf54cCJwU1RgR1HJvOFtZ8ygVRYbkzSKBGF+SBrQwyb7TdhbHtnUB
	UCY4s+YTcuNjaJbWtDvN6d/YHGafZY5IAikZXUd4VpboEoqKO4JpGByyvnZ9x+3M79rYFHy1YWIGU
	FRx0FCPrKBIfLy4qFkiGDa1INjayE9ESD6XGOVO7nonJNoWkmOXz9MaefCtpdWVxPWI7sBNDxCn9n
	oYsGCMUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKwy7-0000000B1rQ-122o;
	Tue, 10 Dec 2024 09:55:51 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKwp2-0000000AzHn-1sHk;
	Tue, 10 Dec 2024 09:46:29 +0000
Received: by mail-ed1-x534.google.com with SMTP id 4fb4d7f45d1cf-5d3e829ff44so4752959a12.0;
        Tue, 10 Dec 2024 01:46:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733823986; x=1734428786; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dC3jhTj5HQrnKJfxc0SY/ZIZuFArZD9eLZZ+JbLbIJI=;
        b=kBH85LVqlLqrR06X1v2vnq4sCaKtQ30XW6hNUxmEsGSREJjztacgFH8+JdG9GH7+DH
         A42wZt8xyDCpr/nfcjGyuS6zWfSgyBGjV/uO+umIl7H1KslC5Cm2D8UMpHFkCb9Rdix9
         5euVSN3hH7BSLDupwiYSwCc2xowLm/4qMatDZiA4EcMt+K6afCa9VamCFD4L/fha3R+H
         +rcY3ANfXrGG2y7ZHh5dv8G074vZtv8MCO9mJYAKgtkOzbsTmsON+uAtlUreOB9K6pqs
         WhwuI214C/PrF2qsJthfnQSgTJ3aHLD12oM7gMunc3mDwJ2QLoz3btGivlw4+ezceSsM
         4UCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733823986; x=1734428786;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dC3jhTj5HQrnKJfxc0SY/ZIZuFArZD9eLZZ+JbLbIJI=;
        b=ZF3opKHBM4cy8dx9kSuRtIcLb9WbprP96wLh7bLWlwvk1gwC7k8wHYHj0a9Ett/VCu
         N6PtjjHxtFZKLcsgARoOXYPuNcG+EBCWx1youJ5yTdC6zeiZep+sB9iXW4ogrByxQO72
         eGFRZygND6brJnWhSUTS+WR1DAID7cb6tWH4gGBtT5xA+LOpMS/8kB7alSAZ/qDRTZUK
         UafXu1JcKmRLVrhnY3xBAN+dQJTutqThpfY6Sq6a7X2eZ0RmpJOZQ4Wif/hTzWvbckOp
         rhhtd3EosWT7n0b6qGPbhrhPlnbgtSQJ8VjMq2ERw3JgRwkjg2zeWZGNTtsoM+ZXD7mF
         q/6Q==
X-Forwarded-Encrypted: i=1; AJvYcCWo91zrPQWlQPU/1xGaJYUI4lJbkSZkgxMYvKRPXvaOETTz4HA0a4oHFxesj2SvTiTEOwnmNTIrCenIE6Hrjr2W@lists.infradead.org, AJvYcCWzL9mD79bhye9qmgyDuJIrU5/0rbTbJahZ8DRaD+FSUFnnLg3nMQ0T6JKji51hS9BLHy+OvuJlxVRXP2SUqYs=@lists.infradead.org
X-Gm-Message-State: AOJu0YwAzjxhv0MxCW/0tbrBhd5MEh8iu0h0esf02OAKCM9HGsIEOdge
	SSkFIUJCxIDo8fv3MsX4oRubVOKB91toXXVt/d7lqwckNEQmGWfW
X-Gm-Gg: ASbGncutafRt1nJ/0HU6H4oPZzNG+vYB+5RSZC3I8EgqTjZBUQ0v4ulPwJPTHxGJVcP
	IHRG7+gb0EuzAyveYwtcLZQCRuQSHTf2qmUYpZ4ezraAbFZ1KSDU7WhAbXpZkHtHVe60KWT2+aP
	rQFTK4UoYeDNd9hjduLCaXSz9hArkclDIdRkHvMjtz4ovb+cZrDQa6GcICQPnxfbpdy5esFqnav
	k1vbQrNbu1kD4Ba8UFWBwNZwUx5BikESZnKAbcUBpOdbSABpkfWGW88IL4miPQvcFcT+fgTA6o8
	AxWC9nh96XsxM0ztqHkfEq93krvmu7DyyFaOlkiGyy3Zz29ed2MxIC7ZE+0imCZ8mVNJaPM=
X-Google-Smtp-Source: AGHT+IHlX9+SooPSE590CjcBy1PCTK3BSd2T3uvELFXCE//zwA+1O6qm8MPbAI3EXqA1jn0vY/Q71w==
X-Received: by 2002:a05:6402:1f8c:b0:5d4:1c66:d783 with SMTP id 4fb4d7f45d1cf-5d41d3dd1c0mr2691977a12.0.1733823986474;
        Tue, 10 Dec 2024 01:46:26 -0800 (PST)
Received: from corebook.localdomain (2001-1c00-020d-1300-1b1c-4449-176a-89ea.cable.dynamic.v6.ziggo.nl. [2001:1c00:20d:1300:1b1c:4449:176a:89ea])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d14b609e56sm7313936a12.40.2024.12.10.01.46.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2024 01:46:25 -0800 (PST)
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
Subject: [PATCH RFC v3 net-next 08/13] netfilter: nft_flow_offload: Add NFPROTO_BRIDGE to validate
Date: Tue, 10 Dec 2024 10:44:56 +0100
Message-ID: <20241210094501.3069-9-ericwouds@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241210094501.3069-1-ericwouds@gmail.com>
References: <20241210094501.3069-1-ericwouds@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241210_014628_483110_F2613A3E 
X-CRM114-Status: GOOD (  11.28  )
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

Signed-off-by: Eric Woudstra <ericwouds@gmail.com>
---
 net/netfilter/nft_flow_offload.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/net/netfilter/nft_flow_offload.c b/net/netfilter/nft_flow_offload.c
index cdf1771906b8..cce4c5980ed5 100644
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


