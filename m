Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97627E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Dec 2024 09:57:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XtgyJTf0nGEQy8dIgfNuKn9dKl89pMTFI5gYmniF26o=; b=Xe6K2mOOKWLqZWQzrkrrRY0mv+
	yS6pzd1aAyW0iQ7d/I/7BRNSpuZN42Xr3LgtkHbXPMglUzFRnL0rgEKTmO8vhCgvB1j8AL7r2/nZk
	bu+8/l9qBZ9yMZNKJ/jiyliYrCeGphT1mOkJVLRQ8r6hLj+g9skK6VZwxRSluB83ZcKju8oifTFUu
	37X4W6jczsmRsQItZluporuBbhVTnsit2zkXa7ugu0Jkr1AiCy1QcTYudxowYC8x9Ul1ewj+9eCG9
	bjQPoFHX2H7i45hDLsFks0zA17xRxgoEYvmYpryUz2zyI0OMwbqPj1SVYs2lcjBtvJmDY5dgskzCn
	FeNrSVCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKwz9-0000000B2CB-0nq2;
	Tue, 10 Dec 2024 09:56:55 +0000
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKwp3-0000000AzI6-19yX;
	Tue, 10 Dec 2024 09:46:30 +0000
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-5cf6f804233so6690606a12.2;
        Tue, 10 Dec 2024 01:46:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733823988; x=1734428788; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XtgyJTf0nGEQy8dIgfNuKn9dKl89pMTFI5gYmniF26o=;
        b=k4o5f7wTwur0e7K3OlKJ5PhBo6sng02FofoX7dgvsyiauvmNpkDcW+tFUPDvmiSkyn
         jyMTsLoUDq1pRnmM1ibo8FE8PQoiXaStInDO+wVCd5XDd3lL0uCZSeYyXbb5dl5FTSmr
         gfWxoOAPXX9ENX1ec/ME30QXs5YolpsUkqCY+IvLR5TYB7+LrzckvDcSxbQUfoiBhZIB
         GTVRCafjhvuuwbuPfMyKUr5DFp08wGddWYKr483QXnEKO2fxXerGUtzBUJ9sz+mjpoIV
         Ne8bBETCUr7b5bGx/UE7kOKJtCwYEEU/0XMstDKFWVzKeilF17B3Y6bXY7S0YFTlW38m
         +4ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733823988; x=1734428788;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XtgyJTf0nGEQy8dIgfNuKn9dKl89pMTFI5gYmniF26o=;
        b=hFDV70t2mf/VEyTtAJqNqP+2YJRjKgl//6z6g1uSApMgutyS5KPsR4at9Nar8y5Y85
         mROx+PIyDKuz2Q9qihbm6Tet3DtU0gUXHG6gJ1y2VrdLMNowXEQdGL2yVVdIjxDOzSua
         a0B0gxg+ks9pSuh4VqUVmGB/zrrlHi4BTZyfmTKpekajrxoPgd2mPAVQtrtyHDP4atV8
         tkO+HYbPz0P7dc82UklSHKihtDjl8SyPRazmE4siY+4BZPnnIrrMFAC2otaIkKdISn4K
         DBWEhYegKR/mY7Ud5q3RN3z554tCRuS/MVjIhHliFUxuA0fcWpwmaVNag5WJOSeSlVVW
         ahLA==
X-Forwarded-Encrypted: i=1; AJvYcCVwUEH4HhPS8grQEJqbw3OsI2L2pHRGoDN6uKIJ7HUdCNZd5FX0CxvqoMMYPXciKHH+PVXiKL3WR/PylxcLrN5n@lists.infradead.org, AJvYcCWy5o9NK4eaFzR51LJb5uZaGjYnIyeE4jBPgoHRl1JKMIo9to+0c1o28fixVNjSH8wuV8jBHKseGc/3Buj5fKQ=@lists.infradead.org
X-Gm-Message-State: AOJu0YzPnLFtJcDY7nFYeGV59tFDg92AQi9HpT32yUYQykBYKqkVX2bJ
	AmvCHKWHg2H3FNbJMr36WpR8ZAVqQOfgG3wFsuR9hnurC7tH0FJ/
X-Gm-Gg: ASbGncuISq6Wu7g5x+5T6TK6jUpTx4wwMoZ7QSf355TKNvWPmcEASmS44gk09gu/P+u
	jESCBDYXRiOkObHytC2f1Dd3wYh3wU+NaYny1VzPZnN8jbPsJwwe7ccmpZ/ExS4nnvWVVUJp/nj
	lWLDYsUZA5pDDrkbaHVkvUy7v/kmRLhj0pQCZDNDT4rj4DO/ZTklt0+aRI5GD4cDfdqjOoouuZ8
	o1MWc+qTTKn7r+Ctge1mjPQYT6/j0DiSAWirbYH0pEEMrmr5KyrKjCsrz2MDVElVk1HFx1pezLs
	8u4z9LqlyNYLTq/i141qvdStLv5PZbgQXdXXbTK9tzDhvbPpIyfKB1eNZTyLd5WDLC42ACI=
X-Google-Smtp-Source: AGHT+IHMIuAkwd6n+zMlbqGssJrA/sOKUAdIFcZ0GUQzc6T7cPFdzuPhW1u/ZoZsTEDW+OJzrhPxJg==
X-Received: by 2002:a05:6402:4403:b0:5d2:7270:6135 with SMTP id 4fb4d7f45d1cf-5d41863c5c4mr4611870a12.33.1733823987762;
        Tue, 10 Dec 2024 01:46:27 -0800 (PST)
Received: from corebook.localdomain (2001-1c00-020d-1300-1b1c-4449-176a-89ea.cable.dynamic.v6.ziggo.nl. [2001:1c00:20d:1300:1b1c:4449:176a:89ea])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d14b609e56sm7313936a12.40.2024.12.10.01.46.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2024 01:46:27 -0800 (PST)
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
Subject: [PATCH RFC v3 net-next 09/13] netfilter: nft_flow_offload: Add DEV_PATH_MTK_WDMA to nft_dev_path_info()
Date: Tue, 10 Dec 2024 10:44:57 +0100
Message-ID: <20241210094501.3069-10-ericwouds@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241210094501.3069-1-ericwouds@gmail.com>
References: <20241210094501.3069-1-ericwouds@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241210_014629_319413_09B6DB06 
X-CRM114-Status: GOOD (  12.95  )
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
index cce4c5980ed5..f7c2692ff3f2 100644
--- a/net/netfilter/nft_flow_offload.c
+++ b/net/netfilter/nft_flow_offload.c
@@ -106,6 +106,7 @@ static void nft_dev_path_info(const struct net_device_path_stack *stack,
 		switch (path->type) {
 		case DEV_PATH_ETHERNET:
 		case DEV_PATH_DSA:
+		case DEV_PATH_MTK_WDMA:
 		case DEV_PATH_VLAN:
 		case DEV_PATH_PPPOE:
 			info->indev = path->dev;
@@ -118,6 +119,10 @@ static void nft_dev_path_info(const struct net_device_path_stack *stack,
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


