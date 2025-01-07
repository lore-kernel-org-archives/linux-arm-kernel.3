Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BA20E77197
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jan 2025 09:07:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Yf647nI7SHqGI80BBUzHOC/gY+pRTRu3FTTF5e5PvXw=; b=qWFiu7CsSBVwHfZLCL8wZPVKgs
	yegRhpKJrWdTZvrxUVw6xFsjHplyL3venrQ9vf2eOI62PPIyzG4rKt9wp5BlWVs2VY2eTjBXu2m53
	3FMKB9KYnkJVt6e1UuYLHt2VHGI+aVN4Zj2472sL63zch6wmp38Hn/GKTisSnzOlbqabXOu3vSVnl
	UOp7KXFO3LW1tFZfFs8XAX3gcb4NxCLHnOd06/yR3R/CSmDNaFZnJ0hbeSVgojBDZ2Bx9pd0ZG1qG
	5hMiuxaX7Hwsii8fd0X7xjKgbuDvsllZ00U072hdk52d4HRyZAPL0u2lU2QFOi9QG8ovY60g99kWc
	s4Q8h8rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tV5YW-000000042wV-1KB3;
	Tue, 07 Jan 2025 09:07:20 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tV5XI-000000042Ud-1OCD;
	Tue, 07 Jan 2025 09:06:06 +0000
Received: by mail-ed1-x52c.google.com with SMTP id 4fb4d7f45d1cf-5d3e9f60bf4so27398810a12.3;
        Tue, 07 Jan 2025 01:06:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736240762; x=1736845562; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Yf647nI7SHqGI80BBUzHOC/gY+pRTRu3FTTF5e5PvXw=;
        b=a/kLi4yv6nZ8IDEfjbE1+4le2YSiFajf8lBtL4aezEU2U/sgyP6P2oKjh+XCJT8GRb
         AEf9qz04/95n3j8mpI5y+Kzx/SKB1oLCf/Eox5f6xDF8fJuFw1ayYNB/phsy89fYSWjq
         1JUVqVPvwLpjMKZfK5GtBdrt5uI9n97O9q2KM4YODZjXRkP4BDhS/mgeEoYxr+8A6ClC
         40D8a15WY4JLluj/sOQQfZOd8pHHCr2pkukSfyPOLBGHLzGkdZAbtJ6L8XxuNJnF+shu
         Lg7CX928t496sPONtJ1kykPN0FNIUkuZByrambfCpsUbs4Vn7apuiQzSMMf/792k+62h
         T91w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736240762; x=1736845562;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Yf647nI7SHqGI80BBUzHOC/gY+pRTRu3FTTF5e5PvXw=;
        b=sz+G++Q6S9IRlxIH2XP/CZPIupq0t7MT3kXiLnyf0aGcmLAEKCMa1RtURrGjMEZ8ow
         2Z1Nf6zT5gKuFSBtjb+VphKlIImkOVNkcBBeKkb8/0mfbZRYpmtf8bFa6cPr2krZpvXb
         Z4AgQu9GbAf0Un5chqacrbIcSM5vDHz9nRxq1p0FpFFWuU8Mkudtmn85UIxOgx1L0oz3
         yo9TgPzKRbf0RqwqWvX8Z584Hu1imeFxB4bXeq4ajR7Jfwhge4+owAXL0F6qw+rXpVOc
         uADrev5smjB6j7lxNhJlls2JFnidtPuORMokUAIwgWSS209IprpFvHAFWlWHI8h+p3aW
         eI0g==
X-Forwarded-Encrypted: i=1; AJvYcCVFp229ioHLENr30zZoxrKn+JAlBnpq/QCFFxJwibJPJejNqC2JRz4nv/uvfvb4WVLYjDewl3zeSwsH7iKGXD0=@lists.infradead.org, AJvYcCWuWmWevf+ffUDTVQk6CJW4mnFVRBgFwIU30t18gXotpHsvEe5CrOQAcEERAYi3yL2ZGA1jOfm7UrTrseGNnhmB@lists.infradead.org
X-Gm-Message-State: AOJu0YyJ9FuYZDVi/4WYICBeKk6jv/0BG3RzuLhZoXnv6Zzbpvu4vIK9
	fdYfLhFrnvJpZvSoWHD4W5LlFPnCWEMUNp4ITwZRd+7kd1O5bFsz
X-Gm-Gg: ASbGncvtiiHogsqh/46EdNtJilHIwTHHQBXYYLRC8SP5uUxXIY/LM6glQyI0rt2Z6p7
	6zV8igS93cCW1BCfQqVoLw0aQZfL0LnFwZW6DI6WMucf880i5hJA1CbJW5G2THwc7v0yMNs0JSI
	WML426yzlU3Cn8zdmARb5Ku1YDpo4BYtJv9IXd10ArVlhkNRtN8eos32jaBb2LJa0KOi2j2FRny
	JWeTJiMZmpTIlh4iccsn+sR0I62NAGduHB1099RSdEb+AwHjiPRsvBFRLvVSRU7DysVjXNeggTw
	L0s4N2WjAa9NmeGfmCDzNQRBmhArCyVnDQVqtlPDLj8AZNte3gXmeM9GqI0zaFQhAtJzgp/Seg=
	=
X-Google-Smtp-Source: AGHT+IEqfnropOKSjHTeyHfKo1G2T5LbmT8gMHhBLT4HLZ1WLqNyAGZrwKDXof/oJBx8TuvP4LVrkw==
X-Received: by 2002:a05:6402:430c:b0:5d8:253:b7df with SMTP id 4fb4d7f45d1cf-5d81de22d07mr53758061a12.27.1736240761340;
        Tue, 07 Jan 2025 01:06:01 -0800 (PST)
Received: from corebook.localdomain (2001-1c00-020d-1300-1b1c-4449-176a-89ea.cable.dynamic.v6.ziggo.nl. [2001:1c00:20d:1300:1b1c:4449:176a:89ea])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d80676f3f9sm24005333a12.23.2025.01.07.01.06.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2025 01:06:00 -0800 (PST)
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
Subject: [PATCH v4 net-next 00/13] bridge-fastpath and related improvements
Date: Tue,  7 Jan 2025 10:05:17 +0100
Message-ID: <20250107090530.5035-1-ericwouds@gmail.com>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250107_010604_375646_B1368C19 
X-CRM114-Status: GOOD (  23.53  )
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

This patchset makes it possible to set up a software fastpath between
bridged interfaces. One patch adds the flow rule for the hardware
fastpath. This creates the possibility to have a hardware offloaded
fastpath between bridged interfaces. More patches are added to solve
issues found with the existing code.

To set up the fastpath with offloading, add this extra flowtable:

table bridge filter {
        flowtable fb {
                hook ingress priority filter
                devices = { lan0, lan1, lan2, lan3, lan4, wlan0, wlan1 }
                flags offload
        }
        chain forward {
                type filter hook forward priority filter; policy accept;
		ct state established flow add @fb
        }
}

Creating a separate fastpath for bridges.

         forward fastpath bypass
 .----------------------------------------.
/                                          \
|                        IP - forwarding    |
|                       /                \  v
|                      /                  wan ...
|                     /
|                     |
|                     |
|                   brlan.1
|                     |
|    +-------------------------------+
|    |           vlan 1              |
|    |                               |
|    |     brlan (vlan-filtering)    |
|    +---------------+               |
|    |  DSA-SWITCH   |               |
|    |               |    vlan 1     |
|    |               |      to       |
|    |   vlan 1      |   untagged    |
|    +---------------+---------------+
.         /                   \
 ------>lan0                 wlan1
        .  ^                 ^
        .  |                 |
        .  \_________________/
        .  bridge fastpath bypass
        .
        ^
     vlan 1 tagged packets

While testing direct transmit in the software forward-fastpath, it is
useful to enslave the wan interface to another bridge, brwan. This will
make sure both directions of the software forward-fastpath use direct
transmit.

To have the ability to handle xmit direct with outgoing encaps in the
bridge fastpass bypass, we need to be able to handle them without going
through vlan/pppoe devices. So I've applied, amended and squashed wenxu's
patchset. This patch also makes it possible to egress from vlan-filtering
brlan to lan0 with vlan tagged packets, if the bridge master port is doing
the vlan tagging, instead of the vlan-device. Without this patch, this is
not possible in the bridge-fastpath and also not in the forward-fastpath,
as seen in the figure above.

There are also some more fixes for filling in the forward path. These
fixes also apply to for the forward-fastpath. They include handling
DEV_PATH_MTK_WDMA in nft_dev_path_info(). There are now 2 patches for
avoiding ingress_vlans bit set for bridged dsa user ports and foreign
(dsa) ports.

Another patch introduces DEV_PATH_BR_VLAN_KEEP_HW, needed for the
bridge-fastpath only.

Conntrack bridge only tracks untagged and 802.1q. To make the bridge
fastpath experience more similar to the forward fastpath experience,
I've added double vlan, pppoe and pppoe-in-q tagged packets to bridge
conntrack and to bridge filter chain.

Note: While testing direct transmit in the software forward-fastpath,
without the capability of setting the offload flag, it is sometimes useful
to enslave the wan interface to another bridge, brwan. This will make
sure both directions of the software forward-fastpath use direct transmit,
which also happens when the offload flag is set.

I have send RFC v2 as I previously only owned a dsa device. I now have
obtained a switchdev supporting SWITCHDEV_OBJ_ID_PORT_VLAN, and found
there was more to do to handle the ingress_vlans bit and corresponding
vlan encap.

I am now sending v4 as non-RFC as the previous 2 RFC's did not get any
comment.

Changes in V4:
- Added !CONFIG_NET_SWITCHDEV version of
   br_switchdev_port_vlan_no_foreign_add().

Changes in v3:
- Squashed the two 'port to port' patches to avoid build errors when only
   one of the two commits is applied.

Changes in v2:
- Introduce DEV_PATH_BR_VLAN_KEEP_HW for use in the bridge-fastpath only.
   It is needed for switchdevs supporting SWITCHDEV_OBJ_ID_PORT_VLAN.
- Different approach for handling BR_VLFLAG_ADDED_BY_SWITCHDEV in
   br_vlan_fill_forward_path_mode() for foreign devices. Introduce
   SWITCHDEV_F_NO_FOREIGN, BR_VLFLAG_TAGGING_BY_SWITCHDEV and
   br_switchdev_port_vlan_no_foreign_add(). The latter function can be
   used to make sure the vlan was added to a switchdev native device.
   When that fails, adding the vlan with br_switchdev_port_vlan_add()
   means it was added to a switchdev foreign device.
- Clear ingress_vlans bit and corresponding encap for dsa user ports.
- Add check for ingress_vlans bit to nft_dev_fill_bridge_path().
- Adapted cover letter description to make clear the patches apply
   to software fastpath, making hardware-offloaded fastpath possible.
- Fixed clang error for vlan_hdr * and struct ppp_hdr * by adding block.
- Updated !CONFIG_BRIDGE_VLAN_FILTERING version of
   br_vlan_fill_forward_path_pvid().
- Removed erroneous check netif_is_bridge_master(ctx->dev) from
   dev_fill_bridge_path().
- Cosmetic changes.

Eric Woudstra (13):
  netfilter: nf_flow_table_offload: Add nf_flow_encap_push() for xmit
    direct
  netfilter: bridge: Add conntrack double vlan and pppoe
  netfilter: nft_chain_filter: Add bridge double vlan and pppoe
  bridge: Add filling forward path from port to port
  net: core: dev: Add dev_fill_bridge_path()
  netfilter :nf_flow_table_offload: Add nf_flow_rule_bridge()
  netfilter: nf_flow_table_inet: Add nf_flowtable_type flowtable_bridge
  netfilter: nft_flow_offload: Add NFPROTO_BRIDGE to validate
  netfilter: nft_flow_offload: Add DEV_PATH_MTK_WDMA to
    nft_dev_path_info()
  netfilter: nft_flow_offload: No ingress_vlan forward info for dsa user
    port
  bridge: No DEV_PATH_BR_VLAN_UNTAG_HW for dsa foreign
  bridge: Introduce DEV_PATH_BR_VLAN_KEEP_HW for bridge-fastpath
  netfilter: nft_flow_offload: Add bridgeflow to nft_flow_offload_eval()

 include/linux/netdevice.h                  |   3 +
 include/net/netfilter/nf_flow_table.h      |   3 +
 include/net/switchdev.h                    |   1 +
 net/bridge/br_device.c                     |  23 ++-
 net/bridge/br_private.h                    |  12 ++
 net/bridge/br_switchdev.c                  |  15 ++
 net/bridge/br_vlan.c                       |  29 +++-
 net/bridge/netfilter/nf_conntrack_bridge.c |  88 +++++++++--
 net/core/dev.c                             |  66 ++++++--
 net/netfilter/nf_flow_table_inet.c         |  13 ++
 net/netfilter/nf_flow_table_ip.c           |  96 +++++++++++-
 net/netfilter/nf_flow_table_offload.c      |  13 ++
 net/netfilter/nft_chain_filter.c           |  20 ++-
 net/netfilter/nft_flow_offload.c           | 166 +++++++++++++++++++--
 net/switchdev/switchdev.c                  |   2 +-
 15 files changed, 497 insertions(+), 53 deletions(-)

-- 
2.47.1


