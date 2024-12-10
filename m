Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D728E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Dec 2024 10:00:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CFsTTuW6zvJV2/j0dvEGRR2IPJ0CE10zFwh/NOpRTtg=; b=PbtZOHfxxjZoJSQ1waHlMxsF8w
	70zeKkeYwNjRQ/u6/CyJSlhpOhgCnrUuWo99yY7xaHphmJE97kJVzHN3CwidCyN3qeE5JNBhygciC
	16WocW+KX3vy34fPzY5HaYcPwQHX9jWnhdFgpemk0FXhS/QVFpRG5gEgRPAnzNvFEWM+CjYDstZb6
	nlveWPBNXXxoWsapi9SBN7U4K6gX7m0LBEEeD1Pbi1hlSnFcTpEmxaEwT23bfm3AuYI1aEG0bM/1h
	0391Cxi5eux8owxq/but2knlosdXfbD0JgpWYHBCcWuyJUHdcf1goBKuApuvKV1vMvEjArUgcvyLq
	KpzOZIdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKx2F-0000000B371-1ix8;
	Tue, 10 Dec 2024 10:00:07 +0000
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKwp7-0000000AzJT-2xes;
	Tue, 10 Dec 2024 09:46:34 +0000
Received: by mail-ed1-x52a.google.com with SMTP id 4fb4d7f45d1cf-5d3e8f64d5dso4369475a12.3;
        Tue, 10 Dec 2024 01:46:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733823992; x=1734428792; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CFsTTuW6zvJV2/j0dvEGRR2IPJ0CE10zFwh/NOpRTtg=;
        b=mgcw86mCaIqm1DAaeazp3haLrAdqi8iNpb5/o8K0LgihPe0ApFrPDrayOzL7+QCgEU
         fQE8/qjaP7U0aMA96nk87TT5JnJU7adtacThnuOrlmKZRXXBU3MgYPl+aOvWyDqxe9A+
         CG/gsfZx5W59LxQy0xBCxSUPxVcB/3DeNZOBp3jggGtLnOsT4g7cBvl7aC1+pP6kAnAT
         dR8IKC+7Kpz1mr9hMpGjtvhmHMzjGh3oQZXIEl4oWl/bSbs3v0n8Eam32urgKgS00E+c
         0sICs9Cb9imma8KyE5b83rovS4nqflyXK6z/yWJ8pIyVfbxaBLNFm2PfXWLtnELd0vfK
         zFUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733823992; x=1734428792;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CFsTTuW6zvJV2/j0dvEGRR2IPJ0CE10zFwh/NOpRTtg=;
        b=pufpAAXFclOMs58WvkyIJRYXN2/2XtceerPoupV2ke8ZQIx7mOPbFVMxe+N0ANZTOL
         GkCzuvvGWdPud5lgjccURDqtqC47vOIbV6SOS//VBVfndnA29tbaPVliNIUEN5fXLqts
         ydlJCaAa1L1BESengu+BUHCa4hPycL91WZou+d85JMTapc9E6mwxFTzkfj1CqpcIE7ah
         Aouay0RBsM9iNm7qJET7dkSoAYr0vUueyyxO7dnu70AiIWnBF6uMtz0Tt+9mnkA9Vx1u
         Hf/beC8ZJXrl/ZzFuO3PuBo+EQ2pcXsZpeBRcivv3O8BW+xofzKaH6fGxLJd1ljxas4T
         OMlw==
X-Forwarded-Encrypted: i=1; AJvYcCVHJKWdXtCS+WJpYmuLcr6R6j/a2cOXEQG99qyNwYsfHcrelA3ByBkGCxUTGAoBJVMVjVHmT9ahEZrqGtny5Jdo@lists.infradead.org, AJvYcCWnDrMdAnxdQhna2z839s451c9zGBRWTsQ1GRnECvrZZmp1FoYW9mAgCbiHO0rpcF7QUHiXuuk1V9H8F64chrY=@lists.infradead.org
X-Gm-Message-State: AOJu0YyBy+wvteSLKC2Nqy+UD+ouvmsLJOKL7HUtww5bKSGS17YiGUWT
	h5bTRAiICrn3fSiGgmciw6Pa+xmQgpuAHEdjY9Qjo9eeen3AFQp5
X-Gm-Gg: ASbGncs2IWk0MpqqVKdCX4/B8f7Z6nHaUpfEvZhj3WloenWTlu5Z9uW4Pxxev1FNOzT
	8sgVQazKwj2EtjTChDkg9JiQAiokI43ktGiU+ORaAUFhitgbiUS0GCloX+JvmImKQoEOjc0qIcQ
	0C+rmD5QaC4jRuroRIFWJ1ygoz5Zl/+tyt/LbHB842bvmPNkEWNuSN4UspO9Tq2oWNkGOfwR+bB
	lplDfUsjJ5kTDKm8PBK9NMvp26iD7SMJzcjbCuDdk46ir9Grdu1EuMklOdNrJRAudbo35TlJVpF
	eaaG2AsccXpFa5khSrmBM/5glU0rXSCmD+lQD2owGpNoJR7nJxUhIM4zYY4ioYGr4DGjELM=
X-Google-Smtp-Source: AGHT+IGoxFgsuKE4ejuRzVCEJrbEw9zjzZMSxooOe80MGRVJD8eFS/tnxR2FJpuGaoBio2IEBDhCgA==
X-Received: by 2002:a50:9fae:0:b0:5d3:cff5:634f with SMTP id 4fb4d7f45d1cf-5d3cff563a7mr12659584a12.24.1733823991675;
        Tue, 10 Dec 2024 01:46:31 -0800 (PST)
Received: from corebook.localdomain (2001-1c00-020d-1300-1b1c-4449-176a-89ea.cable.dynamic.v6.ziggo.nl. [2001:1c00:20d:1300:1b1c:4449:176a:89ea])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d14b609e56sm7313936a12.40.2024.12.10.01.46.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2024 01:46:31 -0800 (PST)
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
Subject: [PATCH RFC v3 net-next 12/13] bridge: Introduce DEV_PATH_BR_VLAN_KEEP_HW for bridge-fastpath
Date: Tue, 10 Dec 2024 10:45:00 +0100
Message-ID: <20241210094501.3069-13-ericwouds@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241210094501.3069-1-ericwouds@gmail.com>
References: <20241210094501.3069-1-ericwouds@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241210_014633_773228_4D9D444A 
X-CRM114-Status: GOOD (  15.16  )
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

This patch introduces DEV_PATH_BR_VLAN_KEEP_HW. It is needed in the
bridge fastpath for switchdevs supporting SWITCHDEV_OBJ_ID_PORT_VLAN.

It is similar to DEV_PATH_BR_VLAN_TAG, with the correcponding bit in
ingress_vlans set.

In the forward fastpath it is not needed.

Signed-off-by: Eric Woudstra <ericwouds@gmail.com>
---
 include/linux/netdevice.h        |  1 +
 net/bridge/br_device.c           |  4 ++++
 net/bridge/br_vlan.c             | 18 +++++++++++-------
 net/netfilter/nft_flow_offload.c |  3 +++
 4 files changed, 19 insertions(+), 7 deletions(-)

diff --git a/include/linux/netdevice.h b/include/linux/netdevice.h
index 6dbc442f9706..8be40145c1d9 100644
--- a/include/linux/netdevice.h
+++ b/include/linux/netdevice.h
@@ -870,6 +870,7 @@ struct net_device_path {
 				DEV_PATH_BR_VLAN_TAG,
 				DEV_PATH_BR_VLAN_UNTAG,
 				DEV_PATH_BR_VLAN_UNTAG_HW,
+				DEV_PATH_BR_VLAN_KEEP_HW,
 			}		vlan_mode;
 			u16		vlan_id;
 			__be16		vlan_proto;
diff --git a/net/bridge/br_device.c b/net/bridge/br_device.c
index c7646afc8b96..112fd8556217 100644
--- a/net/bridge/br_device.c
+++ b/net/bridge/br_device.c
@@ -430,6 +430,10 @@ static int br_fill_forward_path(struct net_device_path_ctx *ctx,
 	case DEV_PATH_BR_VLAN_UNTAG:
 		ctx->num_vlans--;
 		break;
+	case DEV_PATH_BR_VLAN_KEEP_HW:
+		if (!src)
+			path->bridge.vlan_mode = DEV_PATH_BR_VLAN_KEEP;
+		break;
 	case DEV_PATH_BR_VLAN_KEEP:
 		break;
 	}
diff --git a/net/bridge/br_vlan.c b/net/bridge/br_vlan.c
index 0decce5d586a..6a2ca7a5854d 100644
--- a/net/bridge/br_vlan.c
+++ b/net/bridge/br_vlan.c
@@ -1494,13 +1494,17 @@ int br_vlan_fill_forward_path_mode(struct net_bridge *br,
 	if (!(v->flags & BRIDGE_VLAN_INFO_UNTAGGED))
 		return 0;
 
-	if (path->bridge.vlan_mode == DEV_PATH_BR_VLAN_TAG)
-		path->bridge.vlan_mode = DEV_PATH_BR_VLAN_KEEP;
-	else if (v->priv_flags & BR_VLFLAG_TAGGING_BY_SWITCHDEV)
-		path->bridge.vlan_mode = DEV_PATH_BR_VLAN_UNTAG_HW;
-	else
-		path->bridge.vlan_mode = DEV_PATH_BR_VLAN_UNTAG;
-
+	if (path->bridge.vlan_mode == DEV_PATH_BR_VLAN_TAG) {
+		if (v->priv_flags & BR_VLFLAG_TAGGING_BY_SWITCHDEV)
+			path->bridge.vlan_mode = DEV_PATH_BR_VLAN_KEEP_HW;
+		else
+			path->bridge.vlan_mode = DEV_PATH_BR_VLAN_KEEP;
+	} else {
+		if (v->priv_flags & BR_VLFLAG_TAGGING_BY_SWITCHDEV)
+			path->bridge.vlan_mode = DEV_PATH_BR_VLAN_UNTAG_HW;
+		else
+			path->bridge.vlan_mode = DEV_PATH_BR_VLAN_UNTAG;
+	}
 	return 0;
 }
 
diff --git a/net/netfilter/nft_flow_offload.c b/net/netfilter/nft_flow_offload.c
index 387e5574c31f..ed0e9b499971 100644
--- a/net/netfilter/nft_flow_offload.c
+++ b/net/netfilter/nft_flow_offload.c
@@ -149,6 +149,9 @@ static void nft_dev_path_info(const struct net_device_path_stack *stack,
 			case DEV_PATH_BR_VLAN_UNTAG_HW:
 				info->ingress_vlans |= BIT(info->num_encaps - 1);
 				break;
+			case DEV_PATH_BR_VLAN_KEEP_HW:
+				info->ingress_vlans |= BIT(info->num_encaps);
+				fallthrough;
 			case DEV_PATH_BR_VLAN_TAG:
 				info->encap[info->num_encaps].id = path->bridge.vlan_id;
 				info->encap[info->num_encaps].proto = path->bridge.vlan_proto;
-- 
2.47.1


