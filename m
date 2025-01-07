Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81F5EE77197
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jan 2025 09:22:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ElntuwObyWWTXWyk0nhZUVrAyxwm6+3uBHbEuscDHA0=; b=B9Gh5V95dpCSTL7PhY6eaMVlzy
	ZQNRiJDQ2nSWpB1i78ab/dkwSp5fwXAGVMRYafZNh3Mng1JMa3dTh3BR1yCp6MW9qcGR7qVPG6ibG
	UbIGZVDGagytV+3d4D9I6P/BbXvJzUzG5p9VrQ4yM1tqvghqYPezlPAdMlop8O18AD9StkUwjGvi3
	9VEuwe/Ii9a4JVXRx5Cstp0XGe7Qy1L68OVDyx3ry2/z51hVP4TMCaHMGWFtGRia0zfrcHV0Z7VYZ
	gYWcLUIrlhgOJ/CevihKxj2LBPuqxjYrsHnu+TycfbZvPkgaU9xV9Go32SZu41p9OjOpBwDnjXWlj
	V/EsOGEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tV5mf-0000000463l-1nZr;
	Tue, 07 Jan 2025 09:21:57 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tV5XZ-000000042e4-0Rg4;
	Tue, 07 Jan 2025 09:06:22 +0000
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-5d3d479b1e6so21924418a12.2;
        Tue, 07 Jan 2025 01:06:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736240779; x=1736845579; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ElntuwObyWWTXWyk0nhZUVrAyxwm6+3uBHbEuscDHA0=;
        b=Nt1vlpsuovKcdYCve3xssPDRSS/dOTHdsoyAWhj6sgPgaRFIXGAjTaF7dZ8idTzT1i
         OenxAxSJnk1/ZAD2+B85JLcFl6dgrnzg1F0cyUxreJGf9JMrB15VwaDuJKtBUW7MQrNy
         KzLaLwusRtPKlHAmYe8/XAqazfoqCLQ0MdzC4QvxTkk5Ufeca20MLMyy7ztBNbjdRoA1
         BkmP4Evkf9V/MOjy5omnq/qcrQwoo5l9KhHR4IP8/A0szA23+rQRVAt0rWvSA1HErFfO
         5/gkIRYwFVbutun5lCtT9P0C22tuuGAzVU9708HCH2wodC8xIpX/vMpBiYBN72YOfzqj
         /DAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736240779; x=1736845579;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ElntuwObyWWTXWyk0nhZUVrAyxwm6+3uBHbEuscDHA0=;
        b=rdJM1And5DxxyAmWICrd/UNiXnOzm1J+pgZI/KDTgwv+Gz8rDl2daWWvfcQ8ZTigcH
         zMJlbZ7z/H0azZY5c+1OIUWJwIMZdG1ZEYsLJo4KKzmAUPRTO05d72tvVZLAxp3XQvQQ
         nd9Yo0hfDOrbfGPQlZBv6/JG54cq44WZTdgqMb4RKK+OKc6JJLAKC2xQ6fr3FT3ZCAQP
         hW1IS3C/OTTAMw/EYiammSqQo6NXHWYIQ+ifIjE+OF4/Iyh9Pu5EtKFelcxdBE90P99f
         zfloMAqUGlqVmDWqePT/0263GK/EpJqzIKLX4d0CD1MUXMSu/hknXOGvkBT8vcyb8KNU
         JQtw==
X-Forwarded-Encrypted: i=1; AJvYcCURXY1gH8TtUGn0ixpfYxr49fIkF37M6EcmvladuWvpw5L+/77lBKsxQzrSG2nBQgrn14+rj3jDrp+YICtXeLA=@lists.infradead.org, AJvYcCVyy57l2sPp9Tgz87UilyQZVCANo693s9rkCjDrDepwvOA4+Ni/80ETNILLCfwe3HO9EeLkyrf9V7z2hsR3WxDZ@lists.infradead.org
X-Gm-Message-State: AOJu0YwVv3Mj6iTFotcPjODk98hWQvhBnTrBJ+3tS9IYKgdI5nnrXXgf
	sIqZ3fMMFM55Ww1nVE2lg3CjcWDzyRrXSbKXqJsD74ShNzmwZKYP
X-Gm-Gg: ASbGncsXjjdOzkJcfSEnJwa5UBIdUymq5FRGUhPOdJguQv1YkwuR7en4QXOH+fOJiil
	WxJiepAfK2QD1MdEGd6ruxFhIHipGVIwdLKBX375XyKtXx934ZJ95rmza0n8TYDGhTx7SKu9J9E
	CW75e/GdqawFkbX0sGq4Ckk4uUzuaX7ekl2YzqO30fSCiR1RznKKtbc8khHK8DsRXOdoAmCHtWw
	+B/Oho3dud8ja5BwartTpQT3HWz4Ka4a0hMaB2e6s06Ye93SGzlbT6EZB9UmQuvsg5Pb9RCS6gD
	htoEJpSIrDX6MjXLjJ4sQkZ6uLx8zW8ozr7l84JbUShsfUvhZgD2SoBEpX/cNtUnV66NogdNfA=
	=
X-Google-Smtp-Source: AGHT+IGt7vXeWi8jtx2prBY+YfADkXQQ34zgfUpIHrQ42iesCfqHcrSyvvrAit9+d72yO+NjyUOXkA==
X-Received: by 2002:a05:6402:210f:b0:5d0:cfad:f71 with SMTP id 4fb4d7f45d1cf-5d81de1c921mr140645365a12.32.1736240779167;
        Tue, 07 Jan 2025 01:06:19 -0800 (PST)
Received: from corebook.localdomain (2001-1c00-020d-1300-1b1c-4449-176a-89ea.cable.dynamic.v6.ziggo.nl. [2001:1c00:20d:1300:1b1c:4449:176a:89ea])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d80676f3f9sm24005333a12.23.2025.01.07.01.06.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2025 01:06:18 -0800 (PST)
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
Subject: [PATCH v4 net-next 12/13] bridge: Introduce DEV_PATH_BR_VLAN_KEEP_HW for bridge-fastpath
Date: Tue,  7 Jan 2025 10:05:29 +0100
Message-ID: <20250107090530.5035-13-ericwouds@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250107090530.5035-1-ericwouds@gmail.com>
References: <20250107090530.5035-1-ericwouds@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250107_010621_144514_3506D146 
X-CRM114-Status: GOOD (  15.55  )
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
index 7d66a73b880c..cf754ebb19df 100644
--- a/include/linux/netdevice.h
+++ b/include/linux/netdevice.h
@@ -871,6 +871,7 @@ struct net_device_path {
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
index 3e50adaf8e1b..8ac1a7a22b2e 100644
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


