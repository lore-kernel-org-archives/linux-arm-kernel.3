Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC6E0C02198
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Feb 2025 21:16:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kADY7+7zs3VYeS9qt3VMln59cnXFpf9BaZ+2EYseZ2I=; b=0ViEukeR6WGHlTs2JXIe1yrtt5
	pSiOKY01JV4GCKE4xAZ4tN7mJTRhC1mRJgKpC8DbDMuyIpIpB4MTk5xriTML/oIWPEUBw2adwU1yf
	Mc5MVIEiVfKrnVBOpTT8uf215ETOfm8v/QxPfJQ1LCRKHtS34iRAKdgJ9OJjEFWbrNIjIMUFTaekY
	y+woDkixAXZpnmBy+W3a6XHpeAbzMJxY7959e94g+k5/pepPm0wyyojij8uTlS+kg/qnWJZ8bKx4I
	HSc8JFwHo1g9tCyL/s7zrP5pjjZW5i/DVsGDwDzUNbPOMlJlpz8r3/0e29r/qzRH0WYp7wWkB9cf0
	k8/l+Pcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfQHC-00000001ZN8-2LDi;
	Tue, 04 Feb 2025 21:16:10 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfOvu-00000001QNa-1fw4;
	Tue, 04 Feb 2025 19:50:07 +0000
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-ab737e5674bso384030166b.1;
        Tue, 04 Feb 2025 11:50:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738698605; x=1739303405; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kADY7+7zs3VYeS9qt3VMln59cnXFpf9BaZ+2EYseZ2I=;
        b=Cw/VbGNw7n0Wh4VxUvn/Wd3nMTY3Smd85cTnlfLkJBo+ZwGORyYT8Kj0klWUu9AoL7
         gcoHQnAy8oAtaRcDAIv2OU84k8gdyY2thCU10BCbUPUo5mtsaLoXXyGgoriayEO4sOmn
         OgFoQVAokIOfV5jfssUCjUyUH3mofy8LPya5Ag97Mgs20wlL803JcwOqyQd6yr9xwL/p
         Xnk3KyUcCFVt4h3ySrAHSJuJxP7DHDPS9QkqOzWS/q8F24pQ0iJFhrDch+o1FjPuDrBr
         6IlaArdYNI4kd3Agm7An+8h/amkOZcfAkGA+j1qT8mSGghHs0Z4zakUoMx1uLVOTggkO
         WHig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738698605; x=1739303405;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kADY7+7zs3VYeS9qt3VMln59cnXFpf9BaZ+2EYseZ2I=;
        b=ApnTP29zKmkll/k6TPTwGwQA7l/RwJGaeZ0vjoVMfYixaGW5RSNFX9mdt++ZlL/pSY
         lyDDtrr3vncmnNI/PRxGX7iY2a1TsTG+I3OUBmB6xclfXtuoTyldO6Q/f8Ed+J40uzT7
         Mit/Apzlp4pu1ETT0xxFEG+7VyAnyiTZMBT95ZVx/KsKtacXQepKZaYHSuB4n7JyTNPs
         Arlx5Yh6FQbjMnLhntTzmayI9BXrvfw9wPXz9CB+9PFp+/OzDlqQ2d07wZrXSoLFKhjG
         H0bnZOMvJLha16cyvPNXRfSzhEFtfRzCyMLugR1rp2PMaMcT4xinT3hSLI77zLE4NGLl
         5zoA==
X-Forwarded-Encrypted: i=1; AJvYcCVN4Ww8U+m9uiigmzyssIcavoC73niW1f6juQJtOoYgdCfau4RV0H6+RJIij3aL5VvqW5aMM67yQAjoRwb8Mys=@lists.infradead.org, AJvYcCWD09DPK4+XeKRgSr1nEoAKDLBtHLKrDhYgMSIHHTcfP0kCEKmZyTI+o5+cxzeJZg0A5mprtTUIaDoMvtjr1ixB@lists.infradead.org
X-Gm-Message-State: AOJu0YzF88dhEo5iKf+Me7zo2+iqHzbIn+IprYhq2JFG/piaxpI/y7kr
	Vjd/pWJP0fdCZqMdsog3IjZvd2HHhLG0138P8MVguEgJHl320+bY
X-Gm-Gg: ASbGncsfI/KqKLXcK8S0KmPhL7GPzwqdmZmaZy1Y+vO3dvE7aSqdF2R9Innvjd7tj8r
	XIdALsAQZKVLta3XWy2hCR8vjb2M1TcKVTJyGwVw23ThDLxDU66Gn78p1vz3hKYd/zcRI+u6oF7
	8sy86/KFI6bSDu4dOXSus43CGcaHB6QBZEY5oF96U6MK2HG6EMX7RKUQC6enG7GC0+WDmgpsVhl
	72DK1COZ57PZoXBllrYWFqsMEK4N5bxw4oDsV78w+k2gmARYOthz8SYY5fUUO3mDqZpQZAcPKOR
	YlRl4BgS00kje9GWZ9ZQHneWp/ZfQrGg0CQ4sCuAUJOizWjt1+Kk7y47+sdL5kZepaKdpmeImdN
	scpywbnjAZKvUTbFMByvJ4WmR2FyR9ikF
X-Google-Smtp-Source: AGHT+IH3HgcqoQXvsnACIc49AeekhK/1g6HjbR0l0xWDGPW12A6kFCC7xX3W36OSBC5BU9r+MqXOrg==
X-Received: by 2002:a17:907:2d8b:b0:ab6:621a:f87e with SMTP id a640c23a62f3a-ab6cfda41e1mr3469521966b.41.1738698604888;
        Tue, 04 Feb 2025 11:50:04 -0800 (PST)
Received: from corebook.localdomain (2001-1c00-020d-1300-1b1c-4449-176a-89ea.cable.dynamic.v6.ziggo.nl. [2001:1c00:20d:1300:1b1c:4449:176a:89ea])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab6e4a5635bsm964684466b.164.2025.02.04.11.50.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Feb 2025 11:50:04 -0800 (PST)
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
Subject: [PATCH v5 net-next 11/14] netfilter: nft_flow_offload: No ingress_vlan forward info for dsa user port
Date: Tue,  4 Feb 2025 20:49:18 +0100
Message-ID: <20250204194921.46692-12-ericwouds@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250204194921.46692-1-ericwouds@gmail.com>
References: <20250204194921.46692-1-ericwouds@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250204_115006_445039_606531B1 
X-CRM114-Status: GOOD (  11.40  )
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


