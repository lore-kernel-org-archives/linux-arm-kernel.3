Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BC24C0219E
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  9 Feb 2025 11:27:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x342s989e3SqEpDprSMMdkIM/WvPO0edPGoockwe0Ec=; b=rXadv1qHmGOqorYJn/v8AjqPBO
	/wdRTerTg5bcVpljryqFzGQOtVKXVIwmP8GM+gi+vNXaJ2YM8Qu+xuXNOZ35Qac/6Ngno/gKqgKLT
	NZSlzgrlXf5hBuZiLccfOIJiWr/X1RZPWUGH+1FGc0GMfXPZUInKQJbc6XeZYROnmF8Yw6phGpY5f
	GKUELukyGMtny4Vl0yeu3RFiOiuYZgEHoq1Fl39Livv9LBmgWISRRTiCL81rFaxkRLrNru1S9kSRu
	0IopIRWo2DMgAbM7Ny4FvtFmCTih9V1IOuGReq80yQyyqHjcRzv5QeMDjwqJWoqH9FPrUrWEpqp1a
	dAA/Ks+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1th5Sg-0000000EjcI-00mB;
	Sun, 09 Feb 2025 11:26:54 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1th5DL-0000000Egel-0RPf;
	Sun, 09 Feb 2025 11:11:04 +0000
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-ab7c14b880dso303466b.1;
        Sun, 09 Feb 2025 03:11:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739099462; x=1739704262; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x342s989e3SqEpDprSMMdkIM/WvPO0edPGoockwe0Ec=;
        b=BY41/XT6T/7eeXk4+S7VBiTpzWZJwgJZGEFtwrTSDvw/OezL+Sgus2/19kDqkeZ9bt
         sGtLp6pchkm7dZCTpjrlrsDzqfo2zRaxQIhWmpjs1pInkS5M0V591ELCG+7YT7Eq2BxH
         2wSk01fGwNgrwHeLosKYcyzNl+Vwg+9hkkch3WVZyjEyQMJlcZhldJ2BPqdZBln1eoTC
         E0N99Pr+u3xD5mYJ7BiKOgX36V+U+hLLfm++Z02gpMzLaIMJ8bUzh08rtbTRl0M3VrYs
         8RznXl8/8101DeMCaYdhCPKm3Ok4czpw33Jt1ppU25Xa+g/5mCjF8bumWhcvlsObTPvG
         5H8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739099462; x=1739704262;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x342s989e3SqEpDprSMMdkIM/WvPO0edPGoockwe0Ec=;
        b=ol33+BKs2TkJfigHDImDsbMLz9cZJhYEGg43nl2cTAHp1/Ia6J0dSdg2C4DMASwOx2
         9JJ7DGTRvGnta6qfJVqr9KnuHDu+ipNMbOBvqpvRshNtafaycbRkiJ3lrQG5+L2/1U8z
         Opvb6HtDW9C8VOHHkVY8p64goTjAST37GMXgLx6sZ2TPcblODQ6UZ5PNdxZfJKrguWUr
         r5ihQtvlFutsSAKsicQCBu6SxO7qCnldt25trp5xXBoK78ylx0ryIqxY64c2jzE+/81I
         srgUY7FVVza6u70ROOezGgUV0WWdxdcr4xeyBLxmQ6dVW67dNCAzwmsFUj98F4Gzn3HP
         OT1g==
X-Forwarded-Encrypted: i=1; AJvYcCVCNxr5uqidbRwo6H3ZJmR2yWUpucjer1oExFJKbtAHGn8JHG2D7g08p1SM2lJesOseZ4/15mhPlOqNQ011CTW6@lists.infradead.org, AJvYcCVg5LXfjmLczLA0gEX42+kztdkgG4FKBLo/6diYvRz5mK1hGGVkvAs2CU1TV2sX5hIUBlIMitQm4UTAkIVfuME=@lists.infradead.org
X-Gm-Message-State: AOJu0YzgDyuW/zAHp959AenE9efn3eSyDTb+3ti0Ru3oAaFQ4PfMc55Z
	zJVVv/oZmQ40KNVEsxBHbKxROgVOt7t634dWDTjLW9dJoZpqhVxc
X-Gm-Gg: ASbGncsy/LW9fWwelRWnYk0r5Y81C0/aw4y7QbgJy4JgWNp7v8FUMbUXNzVs4fM5aMi
	Bi0aGUlwxjG2GQ+b3vdTsCDXPRPCrnQX9SIfJyUdxOw9ShweTwikIWmC2N2tS4qSUdmePzUpSFW
	2Cl0oTbvVsapaJAqZdVEhoMBd8Ot4pcUyABGn71NKlazILr3i5m7QK0qArVASObqOnxn2x6SJjH
	v/f1gjoz73vvf78eAsTu0uITP5P9OeUL3qmAeqsZyPIrcOPbfvriCNiWrOL8ahwaRl8PTRY9QVb
	i73bjuM92X3eNJcF7+FVEsOvY3k2IU4RKCCNAONLHIUzFFVSlWCmjLmnBqMvBS1F1dO18mIXh44
	wq2h87dSBUB4seEWOZ6GV57G6wreZ+pZx
X-Google-Smtp-Source: AGHT+IGzFOqbzdxNGu8XFTKkecQMR7PLLsHBIzTQkjtLs9gLGZn/h4ghB6cukLwFR4KP5Q7Rs/NF3g==
X-Received: by 2002:a17:907:c283:b0:aa6:66eb:9c06 with SMTP id a640c23a62f3a-ab789a9be1fmr1119975466b.5.1739099461657;
        Sun, 09 Feb 2025 03:11:01 -0800 (PST)
Received: from corebook.localdomain (2001-1c00-020d-1300-1b1c-4449-176a-89ea.cable.dynamic.v6.ziggo.nl. [2001:1c00:20d:1300:1b1c:4449:176a:89ea])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab79afc7452sm357516366b.163.2025.02.09.03.10.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Feb 2025 03:11:00 -0800 (PST)
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
Subject: [PATCH v6 net-next 11/14] netfilter: nft_flow_offload: No ingress_vlan forward info for dsa user port
Date: Sun,  9 Feb 2025 12:10:31 +0100
Message-ID: <20250209111034.241571-12-ericwouds@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250209111034.241571-1-ericwouds@gmail.com>
References: <20250209111034.241571-1-ericwouds@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250209_031103_149882_8DE85E6A 
X-CRM114-Status: GOOD (  11.34  )
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

The bitfield info->ingress_vlans and correcponding vlan encap are used for
a switchdev user port. However, they should not be set for a dsa user port.

Reviewed-by: Nikolay Aleksandrov <razor@blackwall.org>
Signed-off-by: Eric Woudstra <ericwouds@gmail.com>
---
 net/netfilter/nft_flow_offload.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/net/netfilter/nft_flow_offload.c b/net/netfilter/nft_flow_offload.c
index b9e6d9e6df66..c95fad495460 100644
--- a/net/netfilter/nft_flow_offload.c
+++ b/net/netfilter/nft_flow_offload.c
@@ -116,6 +116,11 @@ static void nft_dev_path_info(const struct net_device_path_stack *stack,
 				break;
 			if (path->type == DEV_PATH_DSA) {
 				i = stack->num_paths;
+				if (!info->num_encaps ||
+				    !(info->ingress_vlans & BIT(info->num_encaps - 1)))
+					break;
+				info->num_encaps--;
+				info->ingress_vlans &= ~BIT(info->num_encaps - 1);
 				break;
 			}
 			if (path->type == DEV_PATH_MTK_WDMA) {
-- 
2.47.1


