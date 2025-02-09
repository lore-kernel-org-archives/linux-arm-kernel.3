Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39501C0219E
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  9 Feb 2025 11:25:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Gr1wMzwLJ3r114jkr+fSh/N13xzOYrfc9OnXbfM4Z7I=; b=KCjJkmHYU7w7VtMITVZJH5EKc2
	F0L5XBEjP6ntOtGLvVusthtryoSqxHCXLqSjot7i5ZkI1in8zJZ2nRJZhmSDkqusj0C6lgSjScQPs
	tycO0oGHEgtfLqb2WPIu0qKfswxZR09hmywEoxNhjuIEnDIwALVSt1b/rCNvcgsXdiEG1dZZwPalK
	T8mQ6xiFme3p8sE/etMCoj+1ARjin/mmwoSvKI+dHOZYPBQ3kq8Or6JOxqfzIutfAGZgPNglsqInB
	e88e1v8SgQH7U1VUasF94Y/osQlVqcZrDhmr06q0ibNODfgdpf/1Dgabqw7t4zQJSflnZ633Zy6sl
	jnuT8IZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1th5R6-0000000EjRz-1XGI;
	Sun, 09 Feb 2025 11:25:16 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1th5DH-0000000Egca-1clb;
	Sun, 09 Feb 2025 11:11:00 +0000
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-ab7c14b880dso297866b.1;
        Sun, 09 Feb 2025 03:10:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739099458; x=1739704258; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Gr1wMzwLJ3r114jkr+fSh/N13xzOYrfc9OnXbfM4Z7I=;
        b=VB7mpvtMwzmtqcj0G3tcmK7o4zh/OiOdXowZFh3sg0fsMDmDTjXbOCb41VLadAnfYV
         oWzsruI76gKYdmInjJ8wFOGuidOeGkxb6s1LDJEI5ALe+ZFgOStGgjF7eiIYBdy8nwaw
         8PcTRWgAJ/GF1FjovyBDn7vmS/O+7fsICx4mbYjpdz+0CjF3PrZO28ZpT+QAgGXg4KH5
         fTLZiiRAnxK0kjzqaPJ2NV+f8VMc2xmDtsiZrJjNjlgMHCUMYjBI6sOt0jgjZOx69ZR4
         H3Si9wZPBZcLNclTtki7r4L1oQw/oHIlHhLhH+zmxV/jlHFQctfNCT61ccsS+NGRG39c
         j0Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739099458; x=1739704258;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Gr1wMzwLJ3r114jkr+fSh/N13xzOYrfc9OnXbfM4Z7I=;
        b=ui+Tww0flvpMwWZ/v2rxkSVo93hi1U5Vry8U6wFRlMcFTLKVqnAySe+4xIJr2NU0L8
         dw9Ylv4ZF983fL5X7ohje3tPluXpfpQbH1OMxWbquKwud3UV9UzsMUDfZYyxYy6+m+wC
         Jc7zRuiAOS+7BUsqFNW4vS3hpCPJKq6S0JBFp/NI8r3B5/CYf4ReLoEnVzOVxAoXnmUx
         YaKz6v5ixZw1gHUtx/JFSH0rmSJhOmVjvDu0uq4sIFdhfFMJpm9/zJCNj5C5dyY5erlz
         UqoXbUQWNhHTCUhuCsloLkf12ylMiK3N7eLc4y7ktdjiqpjwRpaw/28iMYU4OKx5ydpO
         HehQ==
X-Forwarded-Encrypted: i=1; AJvYcCU5ipzu8VgAtlAI7Rq4VEYVdSiKsYAgGVNc9wneuohjx8utnjKuWzLtLcDhiF4v/4Jbio3QnvmisErTXd9mlyU=@lists.infradead.org, AJvYcCX8MmNAQf5g4GW82EA+cOJFIsArb17kZ5ppeC7s6MOW98ZsiEbEbdi0T6zdu3d49ELk1oXyQQSxhP4NaUI9yXjI@lists.infradead.org
X-Gm-Message-State: AOJu0Yy6zQsZ+y2X80h4OxdSXFcuRy/UYEqdmESrHoMb/v8n/a2FXhFA
	/FEEzUZaio4By6k3VDm8czearxBxpQr60kFJ41yhUDRZ2LsoY7TI
X-Gm-Gg: ASbGncucyWGKHZZcLDqx4hQBgDnWmQcUFJG5jHMepgAmCWD5Z1gc6pKHVWRAZbKFB15
	L/10petWaaGbbbIPdMbe5YCx+0s0IN93uA15G/3+LOkBCMO+3S9ytQ0y94qVmjiDEHTV1gm1soB
	Qd5zSnfMSfDEnnYYUCO9wz+pEG0jfY198sFmiaGwnUCtD/wFtmfs3DZNwxekJGArgtdn4rOno0J
	Ym32S9yKasbK197Tt1XQ5yRZXYHD4tT5jOpmSQbMJa8G3rfFXkvfXV4I4wcFRB2CEVRpp3hPRK0
	rjVH7OBraVmqjHEhTCrfGhMi01DTLGxOzX1oFGOeO/fKZREFzX2k8XzOliE/pOyqPmW1YNrR3zR
	OUw4t62uag320RgL+41F589hRl1OsM9IE
X-Google-Smtp-Source: AGHT+IFLIZqtdyB586XGL7BZF3ltsD3dhHx63zKrEdsvwLszqHVFUdLBJLGnB6J6lNIv2VbhyBQi/A==
X-Received: by 2002:a17:907:2d91:b0:ab2:b863:b7fa with SMTP id a640c23a62f3a-ab789c1ce64mr946683266b.44.1739099457511;
        Sun, 09 Feb 2025 03:10:57 -0800 (PST)
Received: from corebook.localdomain (2001-1c00-020d-1300-1b1c-4449-176a-89ea.cable.dynamic.v6.ziggo.nl. [2001:1c00:20d:1300:1b1c:4449:176a:89ea])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab79afc7452sm357516366b.163.2025.02.09.03.10.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Feb 2025 03:10:57 -0800 (PST)
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
Subject: [PATCH v6 net-next 09/14] netfilter: nft_flow_offload: Add NFPROTO_BRIDGE to validate
Date: Sun,  9 Feb 2025 12:10:29 +0100
Message-ID: <20250209111034.241571-10-ericwouds@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250209111034.241571-1-ericwouds@gmail.com>
References: <20250209111034.241571-1-ericwouds@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250209_031059_426623_127C1681 
X-CRM114-Status: GOOD (  11.26  )
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


