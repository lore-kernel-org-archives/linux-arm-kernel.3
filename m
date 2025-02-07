Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAA2DC0219D
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Feb 2025 22:05:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9p4ESdWoXjaib9fV4OUyBdDHqaUGl8KIiJHqtkdvtBw=; b=T93rs51R3/QUd7ps9Lo4SC9Ngp
	nRYxkbSxtoPA8gr2WJ5XPI6ErMg2tsNUCU/GhcgiiTdXM1OAbK+inChpI/TCMc0TI8Q1cGPEMV9jk
	MoUK6CKarrrPpaFFEiHuz4Ktc1QdhNOEIAgPW29fGh6yS4mTlyI2EWtu6d0n6W4SjdQeQVO/Os/Jh
	846U178S5WxsziIFHeKEzBn5QBLPSbFv7+kkjTtrS9Ze4kCerxg669UwP1C968wfbs65RPXl6zZsy
	iHQfmv7vaWfVwcUAKg9pWCPqUB2XoQEP7Yl6fYUiiqL6q8tVIBlwLTp9wNtLJ6EMKgeUrdpRamTi3
	DRKtEceg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgWTk-0000000BLEj-2jWk;
	Fri, 07 Feb 2025 22:05:40 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgWSM-0000000BL52-0dYv;
	Fri, 07 Feb 2025 22:04:15 +0000
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-ab79eaafca8so1172466b.1;
        Fri, 07 Feb 2025 14:04:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738965852; x=1739570652; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=9p4ESdWoXjaib9fV4OUyBdDHqaUGl8KIiJHqtkdvtBw=;
        b=ko+grKWtnHgKKV6HSv5Ynl/+kSSqHoOLfLmmjrW6nu3QBJKDmCDYb3g+Lt2YiNZhd4
         MRVsT7xdS2qnYexFlj8u2LwsHHYl5Mc3UOgGi/QHeSDjmsaiv7at7oiQpVtrAWd6QVcX
         ny7munBvMCWi3j6tntTNZcq+qU5nPvpcyp4Cg5llIUAtTOfvamWf5w2pioIW7iOkdVvE
         YDJADqOdbtjbDFIls+93xBVIqOvI1E2AdbCoLYjS2w9kuycoxEwtn4GOIWuo1EfXZJpu
         pbu+ZhGX7f8GgxvI1txEt7jl8SbsMi5PPPhu4u1gasE7mcMzqotkMDmX/gtdREopedim
         k9Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738965852; x=1739570652;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9p4ESdWoXjaib9fV4OUyBdDHqaUGl8KIiJHqtkdvtBw=;
        b=ea59TZc7DkMYmlnx/dOjMESqKXpTNhF8EHdXwGeJnGJn687VwTlOwp6hT6FvGw8rR6
         aMbpxfg/aXKTSa5hSydjuW52uYmmDi2jl2OQ6utpXDyo/fjvNlldYiWuFRU/0Nxdl73Y
         rJ8itP5CnWkX59x8qB37sCStttW3wvYHts0H9fCCaTWEiWdcNC4XQ4G4qdhe6sAfzgcT
         FmDKH9S9wP9b3dpL2M7ez7sZdp87d5tz75f1hGjnVezBbxuUNpEjc18XRt2VC+fBQ0h8
         37ebquPfHnRUZC38HPZjwv8DizBHh5oI2l/6Wf+KzmFvcfyPVhEXHAL2v6EazeiA/4Nq
         jwCQ==
X-Forwarded-Encrypted: i=1; AJvYcCV1bJhD9Mt1vO9iexHzk/QvbSp4R9NfvPu7RM57oXajK2JOSj58yalj8c1mdWBffJHypf3vb/GLgnKrgblDiGA=@lists.infradead.org, AJvYcCVHBtNoG80z2QNYD3YvxHDtybSd6J3T8fjJWRp8mfTPN0xtfMNe7nejPMDxovblPBfEO6eunAwnlXm9zBL1Kv+z@lists.infradead.org
X-Gm-Message-State: AOJu0Yx2QeGi3NhRyFznzT4Pxbb4mYhbNCbaeqZH007bCIt4Ts2Mx9D2
	9szyWCOKSzM8K08xYSXJJK8V8eW+FWRXo+b/0DyB/JhmnLAJKR4V
X-Gm-Gg: ASbGncu4FOBEAPLJF6DWyhvQnCcHAzYxJ62AtYZKCAYAIz03zYmsbm/8PEY0NY+B9Df
	vOV0Of/b56oHl4gpFoAgk7zLPhdefkvAhN6ndc37Xkp5VnJkYNlWB2HWvUoaxTDWrT7J80SS6W0
	4M6dpwhhj9pn4GmKUQFEu163u3qVxF/wFfcuGgG23CPDnK5VOXtIbiVt9jinCZtCV66f52Dy8tq
	/LhtZ7ye+O9vGMOLimSX1ltbdVnXRopwz+rJsdbcRT57S5+T0aHDxEHguOquiJbASVAjXJJE0Z+
	ol0=
X-Google-Smtp-Source: AGHT+IFsi3+NWjssSKSXZEmvjnEsxFYODgK8SKJ6cgvDO7NhfH/SlmKt0XPdmk4uFCMFK0SjvH4aEg==
X-Received: by 2002:a17:907:7fa8:b0:ab6:3b87:d32a with SMTP id a640c23a62f3a-ab789c2f3d7mr190605566b.11.1738965852001;
        Fri, 07 Feb 2025 14:04:12 -0800 (PST)
Received: from skbuf ([86.127.124.81])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab773337e98sm337699266b.151.2025.02.07.14.04.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Feb 2025 14:04:11 -0800 (PST)
Date: Sat, 8 Feb 2025 00:04:08 +0200
From: Vladimir Oltean <olteanv@gmail.com>
To: Eric Woudstra <ericwouds@gmail.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Pablo Neira Ayuso <pablo@netfilter.org>,
	Jozsef Kadlecsik <kadlec@netfilter.org>,
	Jiri Pirko <jiri@resnulli.us>, Ivan Vecera <ivecera@redhat.com>,
	Roopa Prabhu <roopa@nvidia.com>,
	Nikolay Aleksandrov <razor@blackwall.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Kuniyuki Iwashima <kuniyu@amazon.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Joe Damato <jdamato@fastly.com>,
	Alexander Lobakin <aleksander.lobakin@intel.com>,
	Frank Wunderlich <frank-w@public-files.de>,
	Daniel Golle <daniel@makrotopia.org>, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, netfilter-devel@vger.kernel.org,
	coreteam@netfilter.org, bridge@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v5 net-next 12/14] bridge: No DEV_PATH_BR_VLAN_UNTAG_HW
 for dsa foreign
Message-ID: <20250207220408.zipucrmm2yafj4wu@skbuf>
References: <20250204194921.46692-1-ericwouds@gmail.com>
 <20250204194921.46692-13-ericwouds@gmail.com>
 <20250207150340.sxhsva7qz7bb7qjd@skbuf>
 <78a30eab-cae6-4026-b701-7d7002fe3abb@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <78a30eab-cae6-4026-b701-7d7002fe3abb@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250207_140414_211359_D53BA341 
X-CRM114-Status: GOOD (  23.32  )
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

On Fri, Feb 07, 2025 at 09:04:28PM +0100, Eric Woudstra wrote:
> Or should mlxsw_sp_switchdev_blocking_event() use
> switchdev_handle_port_obj_add_foreign() to add the vxlan
> foreign port?
> 
> Then all foreign ports are added in a uniform manner and
> SWITCHDEV_F_NO_FOREIGN is respected.
> 
> I do not have the hardware to test any changes in that code.

Personally, in your place I wouldn't have the courage to refactor that
much in a driver as complex as spectrum, but if you CC the right people
from Nvidia who can test, I guess you could give that a try.

Actually, how I came to spectrum was that I was thinking about an
alternative mechanism of detecting "foreign or not", other than emitting
two switchdev notifiers. You emit just the usual, single one, but
whoever handles it for a foreign bridge port will set a new bool
port_obj_info->handled_by_foreign, very similar to the existing
bool port_obj_info->handled. I was looking around to see who else
open-codes the switchdev object handling rather than use the
switchdev_handle_*() helpers, and that's how I came across spectrum.
It would seem, at first glance, easier to set just this in spectrum:

diff --git a/drivers/net/ethernet/mellanox/mlxsw/spectrum_switchdev.c b/drivers/net/ethernet/mellanox/mlxsw/spectrum_switchdev.c
index 6397ff0dc951..6926aaae7278 100644
--- a/drivers/net/ethernet/mellanox/mlxsw/spectrum_switchdev.c
+++ b/drivers/net/ethernet/mellanox/mlxsw/spectrum_switchdev.c
@@ -3953,6 +3953,7 @@ mlxsw_sp_switchdev_vxlan_vlans_add(struct net_device *vxlan_dev,
 		return 0;
 
 	port_obj_info->handled = true;
+	port_obj_info->handled_by_foreign = true;
 
 	bridge_device = mlxsw_sp_bridge_device_find(mlxsw_sp->bridge, br_dev);
 	if (!bridge_device)

and this in the object replication helper:

diff --git a/net/switchdev/switchdev.c b/net/switchdev/switchdev.c
index c48f66643e99..be82e79b5feb 100644
--- a/net/switchdev/switchdev.c
+++ b/net/switchdev/switchdev.c
@@ -763,6 +763,8 @@ static int __switchdev_handle_port_obj_add(struct net_device *dev,
 	if (!foreign_dev_check_cb(switchdev, dev))
 		return err;
 
+	port_obj_info->handled_by_foreign = true;
+
 	return __switchdev_handle_port_obj_add(br, port_obj_info, check_cb,
 					       foreign_dev_check_cb, add_cb);
 }

Just some care needs to be taken to only consider "handled_by_foreign"
just when "handled" is true.

I haven't yet decided which variant I like better, just thought I'd
mention this as something which requires a single switchdev notification.

Anyway, in the future I'll have to do some more tweaks with these flags
in the context of LAG. These flags (BR_VLFLAG_ADDED_BY_SWITCHDEV, now
also BR_VLFLAG_TAGGING_BY_SWITCHDEV after this patch) can dynamically
change, and the existing code isn't great because it doesn't handle that.

For example:

ip link add br0 type bridge
ip link set swp0 master br0
ip link set bond0 master br0 # bond0 is a foreign interface to swp0 at this time
bridge vlan add dev bond0 vid 100 # this won't get BR_VLFLAG_TAGGING_BY_SWITCHDEV
ip link set swp1 master bond0 # bond0 is no longer a foreign interface to swp0, assuming the same phys_switch_id
# vid 100 should get BR_VLFLAG_TAGGING_BY_SWITCHDEV during br_switchdev_vlan_replay()

Considering that br_switchdev_vlan_replay() will need to re-evaluate the
BR_VLFLAG_TAGGING_BY_SWITCHDEV flag, I guess I do prefer the simpler
variant after all - it is one call less that will have to be made during
replay as well.

