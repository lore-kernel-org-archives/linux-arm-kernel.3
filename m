Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7002C0219C
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Feb 2025 21:31:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mNvAyhAv6GepxNEYkCskllQBVi38mrCeZ4SsbbR7WSY=; b=CrHdNtIjFr7Aw4Iv6po1tGMULN
	uUZjTKzecQbU6tb3GKax6i4CuvwK9HEup4YyH0m//iO44/p57ln4pcOT1hy2cXldMiPLYAAhtlCEo
	xz+UH1K7fA2AhcfjtCKeL2fpLLYJM6Lyyz+8P/YZia5c3unt/jAgRqfL2LOCwhDd3TMct2wbbdjba
	WZrfd+jyARwSLeOvMNH3Clw80mB8Ct8ArHajWgI/TKHsSDnlHxEmofFtmM89CtNQNAeL2iIRu1JDF
	juZAKoGfI4UBqVpYLHdlbnyc7HF0buSM+3/WYmFM33HVdqiDxMpTfpSx10ijqeeYHgfa8uBEmq0K3
	Tx2l9Tbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfQVd-00000001bNx-43lA;
	Tue, 04 Feb 2025 21:31:05 +0000
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfOvt-00000001QMy-253U;
	Tue, 04 Feb 2025 19:50:06 +0000
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-ab7515df1faso176702666b.2;
        Tue, 04 Feb 2025 11:50:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738698604; x=1739303404; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mNvAyhAv6GepxNEYkCskllQBVi38mrCeZ4SsbbR7WSY=;
        b=E/SB9WV8o/Hbr1TcqVxrxS6vDXCtTkgT2aATfv6KYrxuxSODWaMSbiOZa4M4oNMjOl
         TnY42yQvrPU+kJBXetum6UFk9sULsa+FzgXziqJBxx675/NmNesTCJv7L7oy5QVHbXMM
         9UuAoJoXMFJEpkDUZj6d9JipBBxh84NqEWhBKvKiQasTYNn1LA4vPh+L1meO1rQnzu2E
         roHxzefR1j0g5eGrkfA6DW3NvpaM/BvijEkI/V4QpGvn0IGMkBNbGwW5kDKgKuQ4uf3c
         1/aT2p85JYHgEbsszkwis6LPDXiEBoosy2kG046Sy/qtCsuFkT24SOaGtj6hV+nJUFwL
         2Y2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738698604; x=1739303404;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mNvAyhAv6GepxNEYkCskllQBVi38mrCeZ4SsbbR7WSY=;
        b=pf5shwH8gYgxX/F9cfazf4/uxEOK7f1FNPAqweT0eqDobAhf/72gaqTc20UJeUu4VW
         75N8RPuddEnvpjT+206LDn2rE2HiyriLZXhwuUwwbU1yTMpyFy7pSWxdxVGpfNzk4rDQ
         1nevqjfraW+yULapf4mpOiKQtVDh5Z+ESC21kkDzsbzdRsHhW4DrJeWazeSBglr3/C/v
         hJkgWOBurEcF7Dj+qsFhz4qTAWNNpOrBZeYSufysYU7dHj7NIfxtpvURx6cejWlKhUuz
         Cf1rJAwbRlWeCTvjJ58OVz20yx5mG1/bnsK5cGpNKVp2gpAUvYbv8TXnirV8wrMEjxWi
         e0ag==
X-Forwarded-Encrypted: i=1; AJvYcCWXoiAOdH5xPpX2MAlk31JJ5zatLMioh0kRjyZRfpOwWHwzRvMxC6VBa6SQNXVhF1ZQZvJgRIsxqdGSWTD5mvIo@lists.infradead.org, AJvYcCXysEtYF8IP5jmel9A1EtGTEvTIgV4JKaI+/lMd3BIwJ0heml6tkudzAJ2JlkwfAEdZps0G2hp3hzxey3Qg1Qc=@lists.infradead.org
X-Gm-Message-State: AOJu0YzQrXkUHDkhILb4vNNAttjVeMLlfHeY0Wm0rOomgIuvVVxK4Zc2
	xP8dYhuDgM5Yg3wZ1350+1A4O0QPS15Q/OKZnlfwTO4ePailf5Vb
X-Gm-Gg: ASbGncs79kL6BX4yo71w7VGWtFlq85UkFcZ9QLzMnvU//J3FrsTY6XhOQAZX7nEcGvN
	74oh6Ark99YU5l5BC4PrVYP0jV5XJhlv2Pnda4vcwkOhYxJ8cB4+QKsHGrYC0u1kmKfH5FBpONX
	+zDe7Gu29GNISbKquugQ6ZznQqVundUj4l5ifDQnqx0gWOCICKmYjdk5a9+IQep9dugcDXLjUVA
	cR3jObN+v8lvMTwRmVzyegHzMC2C2CO7lkPE1mYN1qckZE1A2P5EtbqNY8tZaaw8FFH34QxUtrN
	65q0V2s8cBSsq1ET1QcVB8vS6w8+JoQEcqlFno2R00SnI9OpJ2XYTIbbCtEns6z9H+n8mq4FfxD
	iN3mJj7ABwZtKrXBa5LxTyE2mPGEjI9xp
X-Google-Smtp-Source: AGHT+IF3Pc3NKrXdQnXqPQwcc/aC4MWpA9WJONMBdLCJSxY43xKupXfl7aBElhm4x8MYzyDeLkdj+A==
X-Received: by 2002:a17:907:3f20:b0:ab6:dc00:e2e8 with SMTP id a640c23a62f3a-ab6dc010668mr2925881766b.3.1738698603538;
        Tue, 04 Feb 2025 11:50:03 -0800 (PST)
Received: from corebook.localdomain (2001-1c00-020d-1300-1b1c-4449-176a-89ea.cable.dynamic.v6.ziggo.nl. [2001:1c00:20d:1300:1b1c:4449:176a:89ea])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab6e4a5635bsm964684466b.164.2025.02.04.11.50.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Feb 2025 11:50:03 -0800 (PST)
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
Subject: [PATCH v5 net-next 10/14] netfilter: nft_flow_offload: Add DEV_PATH_MTK_WDMA to nft_dev_path_info()
Date: Tue,  4 Feb 2025 20:49:17 +0100
Message-ID: <20250204194921.46692-11-ericwouds@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250204194921.46692-1-ericwouds@gmail.com>
References: <20250204194921.46692-1-ericwouds@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250204_115005_540573_89815C0B 
X-CRM114-Status: GOOD (  13.00  )
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


