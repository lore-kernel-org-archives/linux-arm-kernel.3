Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4077E77197
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jan 2025 09:18:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XtgyJTf0nGEQy8dIgfNuKn9dKl89pMTFI5gYmniF26o=; b=S9nPS692HimSXv3ynshaJadxi7
	p1kIJZglblE/nSmwzSxfz2n32qTlB/Qrn4uF7yBZ3aIAdFKqjeQp9ku+Y4bRkOw0xU9JEXXnnBgJP
	jwEfrhUumG0Gld4xQ2upFtfDlEHupZ4DxeXEjCu8fdrEOgrlE6/QgDZnHK2n2I5xiUeE7vh7U2wV+
	0efyP9Wqainp78abcxy+VbkSPPPMPo2JPb8ksTz7gS9fT+jE43OQupzjHammHIgtCDOT/wfCaDAYq
	j/lOYuqMW6bIM6rW+joj+dq2TFe4BIpgNQyJfK7B2mId3+WqMqiHfVUOl2mIpl6C43O3amZvmynOz
	q2IxNX7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tV5iz-000000045It-19et;
	Tue, 07 Jan 2025 09:18:09 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tV5XU-000000042b3-06xT;
	Tue, 07 Jan 2025 09:06:17 +0000
Received: by mail-ed1-x52c.google.com with SMTP id 4fb4d7f45d1cf-5d3d2a30afcso28327393a12.3;
        Tue, 07 Jan 2025 01:06:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736240775; x=1736845575; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XtgyJTf0nGEQy8dIgfNuKn9dKl89pMTFI5gYmniF26o=;
        b=PP9GzGa1TNZIHLOHgdPlLrUYE73wNx7578Jm3utribv2D7lhCqLzx2Ymk4+/tVkFGJ
         /yMX9P4QLjFAtIAJpmqZ7jVQrvayB0waY+OT4cvGQ0dYQkIozKq0MpdxODWhXTlyEoug
         2gVbi9xhozQbQfA+nxmVz5LqPFtsaftDnB8jv6Rgq4zG0+lyZNlKnaOapeBPMCaPt3W3
         cbM96Cran8Zn/eqXRAACW2fU0SmxsqcLRspZQdKslSoBDsghptr0y4zkOL82pGoebE5h
         QDy56IBkfrD730Z4iehHMi4gs87Cp+RQlLdk950mrw1nslTeWNrvxCcT6rkLHiqwxU3m
         5Wfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736240775; x=1736845575;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XtgyJTf0nGEQy8dIgfNuKn9dKl89pMTFI5gYmniF26o=;
        b=VUXYZh/vIttxfLOeMK69MglCCtwk8N/8RomJgPg8SGKYF5gUQZ5GliXmoZ/2aZvPre
         0cdfe72GFR8W3uLjOrbKA90LgU2dtKKeVxGyffOKVN95UhiSlO/+7BO5mgZMhIc/DRc8
         1yLH2YkMpygjTC2eQV0saX7DM4WaSJabqT96Jt4v5UQZ9jyp0WIDK7DV/l3hXzr3lkHn
         9coomntwZAXe7dc2/KOof+hd7qIA1czMOsh3V2VI2j1PphyCamW4lNh5kuRbVSZJORxQ
         uwUopU373fZikdvpgs3brXtrFlvUDPH0SJdwTOeS4vJ0B3qLWSINJIwn6WAKp/SSPraJ
         XH8Q==
X-Forwarded-Encrypted: i=1; AJvYcCU3SBJQFdPwwWH3zF6qNiTfx+onskbGeEZ/oA47FTIVyxbPiYaCpVu2+eqVDDBbw+AyvsynkoSnE6AowtAN/Vg=@lists.infradead.org, AJvYcCV49jrMsHBNmvW2SVKetmgm3XzSF3D2DULKVxNrJJc7hjuIjiRfJu4Msa1LhCZh0I6fmlGQ0cBJTqrKFkPUhuXp@lists.infradead.org
X-Gm-Message-State: AOJu0YxX3bI4dxJfO0l7upIyMGj0X4bcQR0aANyUaZf21A4KwLUKZCzD
	gjh2nMWJNtNVt5Ta4Sd5DllsDSTuc8nPs0EF6by+gPVvXblcL78e2Z+cdXKp
X-Gm-Gg: ASbGnctIynj+gAu/CjKYo3VJ6QrYjvIF0ZYfvTF74ymWVvqPqvUT7zQEC6J6PwlRIEo
	VIzee7YMJ3jLIcrBbZtVSMJIzL9QTzLk7W80yCt663Qpu5QOEWffcC7lRj+gZO2zxYCGtgaLovp
	ceaS76OZzQUgbe9oUkENdXcKlEHHXXr2wc5x+Gq9ipIEIwQGtPwOC8/owyzwiN2bydcb7ZpUY02
	aFsU7vfMaohNg7FGOYtaY1qSLfoCbFeewSWjbALTFZMMocWozC2SFVsxBBJG2/lhdo9bCyZXnZL
	yiHO3fk8TRYNj+SNAP9gyExzFR4NFzWktyoEDI0iXiLxpEPmkHOf65I22CUFwqQZ7OmcfnPrlQ=
	=
X-Google-Smtp-Source: AGHT+IHPxz9+uiCIXoSR9CoE/bJwFf3R4legPNbuUxKWFljvSeICAglSfIzYagTrY05Gf+jTQUtRFg==
X-Received: by 2002:a50:cb8c:0:b0:5d9:a61:e7c9 with SMTP id 4fb4d7f45d1cf-5d90a61e843mr14049402a12.20.1736240774460;
        Tue, 07 Jan 2025 01:06:14 -0800 (PST)
Received: from corebook.localdomain (2001-1c00-020d-1300-1b1c-4449-176a-89ea.cable.dynamic.v6.ziggo.nl. [2001:1c00:20d:1300:1b1c:4449:176a:89ea])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d80676f3f9sm24005333a12.23.2025.01.07.01.06.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2025 01:06:14 -0800 (PST)
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
Subject: [PATCH v4 net-next 09/13] netfilter: nft_flow_offload: Add DEV_PATH_MTK_WDMA to nft_dev_path_info()
Date: Tue,  7 Jan 2025 10:05:26 +0100
Message-ID: <20250107090530.5035-10-ericwouds@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250107090530.5035-1-ericwouds@gmail.com>
References: <20250107090530.5035-1-ericwouds@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250107_010616_065307_A78D1A21 
X-CRM114-Status: GOOD (  12.93  )
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


