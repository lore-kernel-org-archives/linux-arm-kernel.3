Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA611E77197
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jan 2025 09:17:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dC3jhTj5HQrnKJfxc0SY/ZIZuFArZD9eLZZ+JbLbIJI=; b=JoASphrBX71biEWldGHX1gSxj+
	Hf/660lVv5sRQEc0AKJpsQxOrSA6k33twsS/u39xP4eiK9jzGi/PXQIFz5PwYIWD7o1s7RXiX7Alt
	hdD0fb+IAXtydiJj1rqyGUA8IkWCREl1AyG6QVN5HL3OuG2bfqzVvKZKs1c4ir6IrVPJ0B9ty9Ybb
	75TAEV2RUZ21I7dGSy9C7htKAONTFkpwOJ6Y/0VdZpjpBKVPdREZ7t2s4+6IRFuEpjqPOvVJXqAot
	JAhDtn1wecEEEi07QvbHuSD+AHojRhs3nYqyw+YVrOhOIdb6zpmIiWKPGmut1QKKRR6AI94AF+EVW
	XeaRymNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tV5hp-0000000456j-1Urj;
	Tue, 07 Jan 2025 09:16:57 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tV5XS-000000042a6-37jS;
	Tue, 07 Jan 2025 09:06:15 +0000
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-5d3e829ff44so30453430a12.0;
        Tue, 07 Jan 2025 01:06:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736240773; x=1736845573; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dC3jhTj5HQrnKJfxc0SY/ZIZuFArZD9eLZZ+JbLbIJI=;
        b=m8ytBSBil77Ch/tY2p3SO13HJtdC5XpELsL5pIh6Bc+TCyNAQRX8+8kBJsJVn583zs
         Zs4mBB3iZX8OqtClzTdavQ8GDzPWfjXrsyDCQNHo++rnXkMnFtbteYEoFRd3okmq+AKE
         SJAIkGenQXlguQkl3Jg40X5XXQb8eG/MMiWYl7kIlgOUbx9T/6XrSxuAT1paKU6gtzll
         GnjPDuG8tG1sxsoC6DyZNWuPDLrOFaZptEIn0rgRZD9uQcyTmgIVK6kuk73diMGQ6Aqj
         p/oG1C8YLsh0MJO3PWj0AD9sxI1t/Sy11hQpjRO7mXD4abMVCSWuC48N64SvGWCa3edC
         2/Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736240773; x=1736845573;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dC3jhTj5HQrnKJfxc0SY/ZIZuFArZD9eLZZ+JbLbIJI=;
        b=piWT57CC5QSw3fAUC8sVujma/ot3BY8xd3AlbHDjuWX1CxjtuBQVu8sB9x/B6IYrGF
         i6M/jeVdef+CPdMB6PjXr2DqZXFnwoNbmLdxOb5O91twGlLKsUEXwT8Zd530OUweSDwy
         BMFDRIefZ8IKK0UHJSkZV4tEuFUTuWIB4nPelfEbPMpDo/AhrcFdf8e7z2YNbWJ0/e4D
         jafUdmc7Vrc6B7qQE22garbjx3B2QruKxxprGD85ZAk1yeG4syOcdnfDuVwHi2F/p3IR
         kltjHI0o2PhDhbIkhdgbBdxrZBsPGfU9sHVN8/cQaGfHgTb8R21u6yZka/ayK254Wqqc
         +C+Q==
X-Forwarded-Encrypted: i=1; AJvYcCUIX/Nif1YNMy0qcLbQbfjMtATtDQyrIfVPtNMJh/i35penbBfPrOOJePTtULR9PVbww+7+pwO8/SBD7ljEQVI=@lists.infradead.org, AJvYcCVdWgpK1Ss2hKJVdHDnRE2Iztpd426WjRFG0lVtVHBpKg/sLn8aVZoGFZCsv0FoRTsKYeUAIIM0I9IuVUp/xGvT@lists.infradead.org
X-Gm-Message-State: AOJu0Yw5o49KAsKnKLWpedlNQioH4oOuP5JpjngKtHC8s4Dck63mTIU4
	TyaKNDX6atwWS/Ac78UX6xp8GHgcPokiwHh5bcP6YEQQv1xJyiuY
X-Gm-Gg: ASbGncsZH6P+1C7nDgYRm3sxSckhFCjoJINLzT0aOohiBxJUSkNwoqzMXDGJxspFmPw
	oW8BoWR3NdsFyEj3e39AFFW5bmdcae+kgIlIt3uwFOqboOeozs+X4ezsz1Laosmz7JIPI94sM33
	75Eb9Abo3edU/6fGA3KZ5/3lQuCs4X/2egX7dmKtmYvleIXeOwUEoRrqdDjMVS1OH/sf2JwxQS8
	EuHIhRiMeZ5MVWDUTe5amX7YzQ3NBEGGiwqBGbFGG0GrPnUu2ruVBjfcednVIhRG316+SpUPY+t
	gysGGf1vlBTmCSfG3NpZba8+0F3aqr3T5bLINlmc3V+pac6VnFbXw9W+vyWB5r/AWt9koMS06g=
	=
X-Google-Smtp-Source: AGHT+IGPm33fBqlSag/h/JxGM9QbnBBO/F6XspmD/3+zFhonYQ/Vf8Fd540DJY6vH70es8P0d2HC8A==
X-Received: by 2002:a05:6402:1f4f:b0:5d8:8292:5674 with SMTP id 4fb4d7f45d1cf-5d95e8d541dmr2197749a12.7.1736240773221;
        Tue, 07 Jan 2025 01:06:13 -0800 (PST)
Received: from corebook.localdomain (2001-1c00-020d-1300-1b1c-4449-176a-89ea.cable.dynamic.v6.ziggo.nl. [2001:1c00:20d:1300:1b1c:4449:176a:89ea])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d80676f3f9sm24005333a12.23.2025.01.07.01.06.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2025 01:06:12 -0800 (PST)
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
Subject: [PATCH v4 net-next 08/13] netfilter: nft_flow_offload: Add NFPROTO_BRIDGE to validate
Date: Tue,  7 Jan 2025 10:05:25 +0100
Message-ID: <20250107090530.5035-9-ericwouds@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250107090530.5035-1-ericwouds@gmail.com>
References: <20250107090530.5035-1-ericwouds@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250107_010614_787273_8985D16E 
X-CRM114-Status: GOOD (  11.65  )
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


