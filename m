Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C4F7C02199
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  9 Feb 2025 11:32:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mNvAyhAv6GepxNEYkCskllQBVi38mrCeZ4SsbbR7WSY=; b=EKpSxENBvy62t0gEcC6Eq1b3iO
	87sZ9XmfZCKwQrT5YYhs3gQtLs4QvOAZ1hhK5wmqmMRbY3G1nVq3iaqv8QpEQDhJarQ5+i/l0twIz
	FMuDZ+wnljitoUwQFnNDxrb/UdeEl77QY0Gl+UdDrAlRsiohwwxkkE+EU6Bip4d3Nwz5xL3JwB/EE
	Cnao4ZLwIT1ZAFjJ7wF+sRGjyaPvEZ0P2eQdHqhlJYB4cM5EMPniuw3oeA2nGJ6TQC3dhJDgq1rmz
	18PsWqe6Ts5Bvsx6t0He+bPqd4gewQKhTRfVQ/c9RZ4sKsuAqEoE+Rb1ZiNxXJAFPsgBDDE23pxWf
	UoaIXY9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1th5Y7-0000000EkKp-2YVp;
	Sun, 09 Feb 2025 11:32:31 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1th5DI-0000000EgdH-33ou;
	Sun, 09 Feb 2025 11:11:01 +0000
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-ab771575040so665152266b.1;
        Sun, 09 Feb 2025 03:11:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739099459; x=1739704259; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mNvAyhAv6GepxNEYkCskllQBVi38mrCeZ4SsbbR7WSY=;
        b=CzRR7tljg5u++HuONKShmvWlHsHPokQywrg0eZVSvCO/weJkI3h89hYUdsUbzXq/7D
         X2ziV1MmQLzA0iOzCrwOHAhq0JBucFylKxFQkYYia8UD3rmSD+d0kvvOIXoHRwvgzQzj
         biwKiQHkwtVb8ze1FWZntISPay8syrouW0KwwGu9/dftkIaZDfXMoC3LrNNLbzUU6iKx
         ztfMRqnRnpZQhuGNE9rS90Z8xByvzRQsMb+8k/l5XUSqhyIF3nR6C5N5Y14zhV+6VSXJ
         B8gSOfa02iLiLY328ikanaYw0Try6+bqgk5huQrnWQ4iHGnopztwllDxu1dxEPGtn4+d
         AhUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739099459; x=1739704259;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mNvAyhAv6GepxNEYkCskllQBVi38mrCeZ4SsbbR7WSY=;
        b=BjjgeFXICyVBeon5ExmCzg6jOaULIDn6hCGf79OaMXR9sGlDDtjE92YJxV8SkGeLrf
         losu0ZDnr4NKCS3MFJHonG30DsojtswSkGBkTL5p6Vy4nBXPb96Rf8nm6+4mLCssh3na
         vVFfCKaHrTc+URDTDGcpKtV62ZHVKiiNKrtTKNmY9HOO61r0PYmVyYadH1a6n5HO5xdR
         oRU0DEmKush1rz3bVBQHW/JCoINCben+lbDGuCoz+SO025GySOp5O3dlDIps7DI8Ai9E
         mqIQlGq2yDC2RgrghWn6K7pORXoo48yzN2vroPxdzTju7K3XmOSdwu6bbTHHshoWsQFM
         Y8QQ==
X-Forwarded-Encrypted: i=1; AJvYcCUB5S/dqeYWZvSb3HKFAF+/mcB+BolN7XeXNW4euwrN0WOh7FPNd1K0UUEBZMKX4fw2sDFvUjEXhmgtMhYyCX4x@lists.infradead.org, AJvYcCW55oP7o+jNpI8N23zVTOVnKFBPlFuoOgSzTbXhFXxi2kKaUBcnPu1XZ90C2wkiilyJ4Y0pvoCAP4uAy9JOMmQ=@lists.infradead.org
X-Gm-Message-State: AOJu0YydDUQBoi7WVCClfAmVaoQFpAp+t1SZLkF9BmK6QQvIe1tgeF1O
	ArCJcp4RrxbO8scSZH9xLKJGEX8fxSXnGbVOx7zoQrdsuP2XtCiM
X-Gm-Gg: ASbGncv6A0oukPtiGHbfkbVy1P5JtLd9Vgas6vQDZ6A+5TlYBOOc4AG93AMtKJfXffT
	nWX46sKSN2zIbIclvAOKbaPYdUP8PjsNHMxpmo19qhDuGST5DRboaPsVvckqxz1EumQeI9Lhy4U
	todbykfov/zBa8fldB1EEtuMfKiNbd2p2gAuYxM+o5UZw4n8+T8xGMi2HbwHztK5xaVGdw9omht
	t7XYF6b8DHrVFFj/ZIW4xm9sJ+gx3GIRSMgpCcuDnyycoNMAyg3/TachNCp6+koMDtWqEGHMErh
	jhSomlW0o+R/PjeLIPYp6nGea9DseCprMS3FuI9kSMIQLmgeSKhVBY1uQbzIo0oc+Q+WTrTMHCn
	XuGNqsGLgTIxnd40v2+uQ/d1EaW/7VZsZ
X-Google-Smtp-Source: AGHT+IFJaFbx7ete5KJozyvNC8/oWulX5RI94rWh7h2VsoTHF0Lp2lI///kU0TTT1M4WqEm7capUsA==
X-Received: by 2002:a17:907:9719:b0:ab2:f255:59f5 with SMTP id a640c23a62f3a-ab789b4a40dmr1114278166b.16.1739099459229;
        Sun, 09 Feb 2025 03:10:59 -0800 (PST)
Received: from corebook.localdomain (2001-1c00-020d-1300-1b1c-4449-176a-89ea.cable.dynamic.v6.ziggo.nl. [2001:1c00:20d:1300:1b1c:4449:176a:89ea])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab79afc7452sm357516366b.163.2025.02.09.03.10.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Feb 2025 03:10:58 -0800 (PST)
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
Subject: [PATCH v6 net-next 10/14] netfilter: nft_flow_offload: Add DEV_PATH_MTK_WDMA to nft_dev_path_info()
Date: Sun,  9 Feb 2025 12:10:30 +0100
Message-ID: <20250209111034.241571-11-ericwouds@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250209111034.241571-1-ericwouds@gmail.com>
References: <20250209111034.241571-1-ericwouds@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250209_031100_781972_60B321F4 
X-CRM114-Status: GOOD (  12.74  )
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


