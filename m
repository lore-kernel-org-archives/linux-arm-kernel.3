Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B35A8C282C6
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Feb 2025 20:37:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mNvAyhAv6GepxNEYkCskllQBVi38mrCeZ4SsbbR7WSY=; b=0eZt+KkfO8vMrwrfU2XYIFaHql
	qWuliYJ/8ftCs6i+zRUhBeSfF24Kp/dtRLrAhNg+ZkFxvCWG5EglIlZXlXFKhHyur3gDB9RXr17hO
	Re27BBXIrqJi6utPp24+tse6b1LrsafQRZpXNue3hgG+fXocW8RITcy3Rg0gdCS39NfZQKoSvk34E
	k67vFpGrsFf2X7xcONOH2eBxyzE+bO6arHIHN69j2gwFxrHODgLL03pMVmzqW6Zz1LlKzpzuqgDF0
	1LgqMpUY6bRv50noAg10i/ZvPYNm9nxRBgcj5biUn45+vY4n6mdlLFWhGtkCu3Wv5RQkxWdlvRCnz
	j4tR/5dA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1to76Q-0000000Ccy3-1xPs;
	Fri, 28 Feb 2025 20:36:58 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1to6mf-0000000CYNq-2IyC;
	Fri, 28 Feb 2025 20:16:34 +0000
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-abf45d8db04so88073466b.1;
        Fri, 28 Feb 2025 12:16:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740773792; x=1741378592; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mNvAyhAv6GepxNEYkCskllQBVi38mrCeZ4SsbbR7WSY=;
        b=l7/esM6j4YVKvNEI2qzDVb3ysoHQm2ayNlexu2GeF/y4XjX3FmLQgd34movBloCiwy
         6CjaVhfrg8yba9ntghIXYzqqTIH8KnWuu1ng3e3rXN3icv+sGKH7kySrwTSHyGG/o+oH
         9NscffLfB6SD0Dw7ovhaDqs2NxdB3b72EgwEbVzlkShW/nl5krxCR1vnmFqaxcffzvED
         1ktyB7hgOufuC8DEQN+wsQLKqkVZZ1WgC+6h4l8/vXAwf0jxroQ1Siu9BpFc5XIF+098
         ENAN3NNcHRRAPK0T5x31mPIqKoQOgUDRJ+69LH2kZRCxrUj+ot99AvTqauv2OXtHHppP
         QHnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740773792; x=1741378592;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mNvAyhAv6GepxNEYkCskllQBVi38mrCeZ4SsbbR7WSY=;
        b=qsMcANEENaGwo4qlbUzgxRvuBDoPLXcG4v2BZvgbwub6+1A6OaTm+54w6pEfurQJOa
         iBpLTBU4WRTggSQFG++2H84U/rmh419sr34slpk4qqzpXWpi444eOwhcH76EfQb7ZJlE
         N1UsljtbtJiCUkYMuszAUqlrOAZuxX/Mr8iKNS6q+Zf09ryWPNmoBClfhhzWSZiAq0Mf
         4BcYo2tvAyY32pi45lAadQZhri3EZpS/F0o+rMFjqXs7lVSv6fvizaCv8thqUZb4hfkS
         zkHPQJC7Su8UMbM2O8L96MY2kTlvNW0s3Dbra4lR5Hp6/4NeG9U48DT2YKKKF0CIHdDO
         pfYw==
X-Forwarded-Encrypted: i=1; AJvYcCV5YnTwf3NEwcjLpwbM5YPo+jFsg6jmbN+AqT1RXKaELsUR1ry/UolB6i+psHISauN0F6xSkC081/adpVXt6LN1@lists.infradead.org, AJvYcCWQMDmYr07DVK3ngdVJwO6z77RTZ/OGcwEPH9/NoFfAxG+oNWdJjrJj9EFXNcH8dqYclu/w9qtC2U2FfKPEtZ8=@lists.infradead.org
X-Gm-Message-State: AOJu0Yy7X7hMKPmj8E+lNFekOPwlsZSaiEaaYUW+Xq7Am+Yw+pafPW08
	awFOn7/idvJf2nPzQ9HcWtYNthK+Twh1+hgmBJHbnUDQ7yXj2fFW
X-Gm-Gg: ASbGncssGUKFr2oeaD9H6Dk6VgPh5XPSviCBTAx6MQxb7h5ERov21elBKGWegyihER7
	BNNSTyiYyvNjVgWxkyYEkIzDaDXWwOOe0qOm7e4RHc+Ti8iCez4hOPhDxYfy4j71yNyMD0N30yL
	5h8rflb7q3f8PnqXyVzwOkZrjmq9f+QC9GhlNzzW4p+2Jwq0yakbq4F1sMLiRiTw76WL813RLDf
	UGF/B2KzxCII4T9zjEkXkdym2sO4T/NuLTQYfwLpNRh0GJuG3AEgD+DXRzqEqKLPuabLi6tBQNV
	jjzTT/IRbryGo+3YeYAqy9nw/JmemxgYE8Qn3L9zhoEd6ReLq97VkGr6dFCy8cIatmD3WE+X4WY
	ay7sy7hM6yVRASv5R9Kcjm4D1pg0RIDxVjJlNGfzd0bQ=
X-Google-Smtp-Source: AGHT+IGNTRuqBcd8nLuNsVuXSGF1sIcXELw3HlP5Nzemzcrdv1EtIzMkCBIzwqYM1NbqtT6g+Vprpw==
X-Received: by 2002:a17:907:9484:b0:abb:b136:a402 with SMTP id a640c23a62f3a-abf26424829mr486626566b.18.1740773792060;
        Fri, 28 Feb 2025 12:16:32 -0800 (PST)
Received: from corebook.localdomain (2001-1c00-020d-1300-1b1c-4449-176a-89ea.cable.dynamic.v6.ziggo.nl. [2001:1c00:20d:1300:1b1c:4449:176a:89ea])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abf0c755c66sm340812666b.136.2025.02.28.12.16.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Feb 2025 12:16:31 -0800 (PST)
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
Subject: [PATCH v8 net-next 11/15] netfilter: nft_flow_offload: Add DEV_PATH_MTK_WDMA to nft_dev_path_info()
Date: Fri, 28 Feb 2025 21:15:29 +0100
Message-ID: <20250228201533.23836-12-ericwouds@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250228201533.23836-1-ericwouds@gmail.com>
References: <20250228201533.23836-1-ericwouds@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250228_121633_586425_6D7AA48D 
X-CRM114-Status: GOOD (  12.72  )
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

In case of using mediatek wireless, in nft_dev_fill_forward_path(), the
forward path is filled, ending with mediatek wlan1.

Because DEV_PATH_MTK_WDMA is unknown inside nft_dev_path_info() it returns
with info.indev = NULL. Then nft_dev_forward_path() returns without
setting the direct transmit parameters.

This results in a neighbor transmit, and direct transmit not possible.
But we want to use it for flow between bridged interfaces.

So this patch adds DEV_PATH_MTK_WDMA to nft_dev_path_info() and makes
direct transmission possible.

Signed-off-by: Eric Woudstra <ericwouds@gmail.com>
---
 net/netfilter/nft_flow_offload.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/net/netfilter/nft_flow_offload.c b/net/netfilter/nft_flow_offload.c
index 323c531c7046..b9e6d9e6df66 100644
--- a/net/netfilter/nft_flow_offload.c
+++ b/net/netfilter/nft_flow_offload.c
@@ -105,6 +105,7 @@ static void nft_dev_path_info(const struct net_device_path_stack *stack,
 		switch (path->type) {
 		case DEV_PATH_ETHERNET:
 		case DEV_PATH_DSA:
+		case DEV_PATH_MTK_WDMA:
 		case DEV_PATH_VLAN:
 		case DEV_PATH_PPPOE:
 			info->indev = path->dev;
@@ -117,6 +118,10 @@ static void nft_dev_path_info(const struct net_device_path_stack *stack,
 				i = stack->num_paths;
 				break;
 			}
+			if (path->type == DEV_PATH_MTK_WDMA) {
+				i = stack->num_paths;
+				break;
+			}
 
 			/* DEV_PATH_VLAN and DEV_PATH_PPPOE */
 			if (info->num_encaps >= NF_FLOW_TABLE_ENCAP_MAX) {
-- 
2.47.1


