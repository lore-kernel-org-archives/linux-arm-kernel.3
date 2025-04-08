Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDF2EC3600C
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Apr 2025 09:58:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=/RvFtRdhQn1c/wIuCLc4aw42Ky969HB/mmJiHknyBzg=; b=WvyqvSLocP9cvmHR+wj0hcntBs
	1/8RGop31l6cysDKtj4739YQ50m+pndfV+w0S1wSV/ix0E/1otL5GMu6JG9J6rk2kMxIb98XtcKr1
	NWcXxKpikawfU/sCmhk+If1vjmsqbZvPvprnhYB8SKbPH2ae1KRL0rXxwz/4dBsWpwImqGZPJNF9e
	IWXkrWkZGX53T6b6lHwkuuOrmKF5YLAFUbguXAeEDVCLz08cqyQpj2/EQIlxe+4aP1lo2PHL9b0g5
	LZX7nZ6//BtU3hXbL9bswbC6C5btbZmLYHkm4z7mjpJZFzzDxZ2OSeWunoDeq8NhruNX2ZuPjhzEM
	qoQ4QQbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u25ix-00000003Xvj-2dFh;
	Tue, 08 Apr 2025 09:58:31 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u25cr-00000003W1p-1HOK;
	Tue, 08 Apr 2025 09:52:19 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-4394a0c65fcso49368185e9.1;
        Tue, 08 Apr 2025 02:52:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744105932; x=1744710732; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=/RvFtRdhQn1c/wIuCLc4aw42Ky969HB/mmJiHknyBzg=;
        b=PJqYZlSGmWxz7i3zjyxSuyBa/N8ReHWB/OYkagAUgLjahdLW4ROXVOOlyVJGkvr2It
         BUQmPsAfIUtrBC7tuzmkYfVdezfWBihTUHENChatI5q0BItSDJrldawHKNrJizlRve+s
         mW8rV1GzgAFtF9WbI53TCGf7hCjnHX+LI7kRS84BdQCUT/UcA3GyIX0lS0pKT+Rte0Kd
         3/QoYGIy6YbVklYVmNQHofDUNKNZqZMpQs/iWonsQCr30NB95mkKm++r4vmB3CpxVLMY
         92uuntYKaDwLIBUq7esd2/R/46nSYFDjy4kGKTdG6e6U+IA1/o2Ogv8oZkElmnqjTMmF
         XI0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744105932; x=1744710732;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/RvFtRdhQn1c/wIuCLc4aw42Ky969HB/mmJiHknyBzg=;
        b=YquFc92k7vIQwpHmuPWkKDBMj7IdJeaa9yM2wwhYcCEf2SVbXnWTU4UimA/ps0388+
         05wmz47RB8UA3h37AZmbson+1rbRAwXkK2GoEgy17lPZGiQzhcNn9IcLhiN+qRbnuzcu
         csKh3XMvKYT9y8nne8cpNhjtm3iRkNqJMsEq/XfHI09Uy3XlE1qt/Y9dX1VLoo+UUZbC
         54ggN7pk/HqowRXupxcSeiIYGQY1NAfaxg4+RV1RKEpYlqXlifqiAerXc9K3ktTcm2MJ
         lsrWZyHeumW6vNsArW0xJrmqOq6mRd8EhwUo8fPOVtpkwlf13ir0RqyfwMdY+GJAgJKg
         q0dw==
X-Forwarded-Encrypted: i=1; AJvYcCUA4KNiWTOOt5bC/bK31S0GjDN0uJqXPoZGDLD7e6HsW+Yx88VzhwUqxXHsEJB/BbbqWsL51CXk4vtcYSbZrIg=@lists.infradead.org, AJvYcCX3J1M1ZDECiCzzOkjSc4VQ/FxL12gMbOQlfHh0qoC2c/xsLy/CgUUjz5WzxDqmf7RW7B1BDACCPWCyl3KbwsD9@lists.infradead.org
X-Gm-Message-State: AOJu0YyoT9FTJ0qwWGwDW1O/77Wv40dzHrFBIFWHD3Gz3xIQum9LsYfZ
	r9F/cgykjBoW40TjP76RGzM/Sxt/l+T8F+bUxAZ8PCRtO8qpVrZs
X-Gm-Gg: ASbGncsoP26zSmk2TAuK5IFuVsTo37qaE9W0LyXTYbbGBK1PVB0dbjXftzk7S4yfj/4
	ZbOvIstrswoBWfX/5XOVzL9MlFYxtvG3rFCHQaNMbxMQU3d2QLgxN/dOhC6Cz9yCu3tNA2a8h5F
	ZWNGAQf0mFlKbZQSu/mC/q09WkBBVsnH8xyD6/+vknSpyKrUWzXuD9oxumRNhe74BuCkrJqqIZe
	hNShaCwLGnZtWFF9BNTL1ZDUS8U0t7vcjoiLAQ1Jr8TJqcyfboAriR4ROEp6gGBF6dd4802Guis
	MIEsF2nM2fzkdDQ7774aJTCRkce1R5XAvgskrNYrdQbMcTwqo2iftbhbrqIQ7ewf97okW553WWY
	rMmqOoNXVs+qRhQ==
X-Google-Smtp-Source: AGHT+IHT6/kTEnNM+JG7z8A4rqC31WlprMm+fNEKe07k8WF5J5vXWYAJ3u9scThIrF9hn/qzi02akA==
X-Received: by 2002:a5d:59a3:0:b0:39c:30cd:352c with SMTP id ffacd0b85a97d-39cb36b299cmr11974518f8f.8.1744105931236;
        Tue, 08 Apr 2025 02:52:11 -0700 (PDT)
Received: from localhost.localdomain (93-34-88-225.ip49.fastwebnet.it. [93.34.88.225])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-39c3020dacfsm14493310f8f.72.2025.04.08.02.52.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 02:52:10 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Christian Marangi <ansuelsmth@gmail.com>,
	Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	"Chester A. Unal" <chester.a.unal@arinc9.com>,
	Daniel Golle <daniel@makrotopia.org>,
	DENG Qingfang <dqfext@gmail.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Simon Horman <horms@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	upstream@airoha.com
Subject: [net-next PATCH v14 00/16] net: dsa: Add Airoha AN8855 support
Date: Tue,  8 Apr 2025 11:51:07 +0200
Message-ID: <20250408095139.51659-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250408_025213_348776_31948B77 
X-CRM114-Status: GOOD (  13.52  )
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

This small series add the initial support for the Airoha AN8855 Switch.
(sorry for 16 patch series, last 2 one are trivial one just MAINTAINERS
 and comment, nothing to review)

It's a 5 port Gigabit Switch with SGMII/HSGMII upstream port.

This is starting to get in the wild and there are already some router
having this switch chip.

It's conceptually similar to mediatek switch but register and bits
are different. And there is that massive Hell that is the PCS
configuration.
Saddly for that part we have absolutely NO documentation currently.

There is this special thing where PHY needs to be calibrated with values
from the switch efuse. (the thing have a whole cpu timer and MCU)

From v8 Driver is now evaluated with Kernel selftest scripts for DSA:

Additional info about the test bridge_vlan_aware.sh.

It was discovered that the Airoha Switch (and probably the Mediatek one
that produce the same test results) hardcode checking for 802.1ad when
the port is configured in VLAN-Aware mode (aka Security mode).

In such mode, both 802.1q and 802.1ad TPID are checked, hence the
bridge_vlan_aware.sh test fails as packets with 802.1ad TPID are rejected
(in the case where a wrong VLAN ID is forwarded)

This was confirmed by Airoha and multiple try were done to try to
workaround this problem. No solution were found to this as ACL mechanism
can't work on receiving packets and the Switch doesn't support turning off
this.

The current driver is in use from 4 month on OpenWrt with all kind of
scenario confirming working in VLAN bridge. By tweaking the
bridge_vlan_aware.sh test with setting the TPID to 0x9100, the test
correctly pass as packets gets classified as untagged and the default PVID
applied. It's also confirmed that switch correctly parse the 802.1ad tag
and make the packet pass only when allowed by VLAN table rules.

Output local_termination.sh
TEST: lan2: Unicast IPv4 to primary MAC address                     [ OK ]
TEST: lan2: Unicast IPv4 to macvlan MAC address                     [ OK ]
TEST: lan2: Unicast IPv4 to unknown MAC address                     [ OK ]
TEST: lan2: Unicast IPv4 to unknown MAC address, promisc            [ OK ]
TEST: lan2: Unicast IPv4 to unknown MAC address, allmulti           [ OK ]
TEST: lan2: Multicast IPv4 to joined group                          [ OK ]
TEST: lan2: Multicast IPv4 to unknown group                         [XFAIL]
        reception succeeded, but should have failed
TEST: lan2: Multicast IPv4 to unknown group, promisc                [ OK ]
TEST: lan2: Multicast IPv4 to unknown group, allmulti               [ OK ]
TEST: lan2: Multicast IPv6 to joined group                          [ OK ]
TEST: lan2: Multicast IPv6 to unknown group                         [XFAIL]
        reception succeeded, but should have failed
TEST: lan2: Multicast IPv6 to unknown group, promisc                [ OK ]
TEST: lan2: Multicast IPv6 to unknown group, allmulti               [ OK ]
TEST: lan2: 1588v2 over L2 transport, Sync                          [ OK ]
TEST: lan2: 1588v2 over L2 transport, Follow-Up                     [ OK ]
TEST: lan2: 1588v2 over L2 transport, Peer Delay Request            [ OK ]
TEST: lan2: 1588v2 over IPv4, Sync                                  [FAIL]
        reception failed
TEST: lan2: 1588v2 over IPv4, Follow-Up                             [FAIL]
        reception failed
TEST: lan2: 1588v2 over IPv4, Peer Delay Request                    [FAIL]
        reception failed
TEST: lan2: 1588v2 over IPv6, Sync                                  [FAIL]
        reception failed
TEST: lan2: 1588v2 over IPv6, Follow-Up                             [FAIL]
        reception failed
TEST: lan2: 1588v2 over IPv6, Peer Delay Request                    [FAIL]
        reception failed
TEST: vlan_filtering=0 bridge: Unicast IPv4 to primary MAC address   [ OK ]
TEST: vlan_filtering=0 bridge: Unicast IPv4 to macvlan MAC address   [ OK ]
TEST: vlan_filtering=0 bridge: Unicast IPv4 to unknown MAC address   [ OK ]
TEST: vlan_filtering=0 bridge: Unicast IPv4 to unknown MAC address, promisc   [ OK ]
TEST: vlan_filtering=0 bridge: Unicast IPv4 to unknown MAC address, allmulti   [ OK ]
TEST: vlan_filtering=0 bridge: Multicast IPv4 to joined group       [ OK ]
TEST: vlan_filtering=0 bridge: Multicast IPv4 to unknown group      [XFAIL]
        reception succeeded, but should have failed
TEST: vlan_filtering=0 bridge: Multicast IPv4 to unknown group, promisc   [ OK ]
TEST: vlan_filtering=0 bridge: Multicast IPv4 to unknown group, allmulti   [ OK ]
TEST: vlan_filtering=0 bridge: Multicast IPv6 to joined group       [ OK ]
TEST: vlan_filtering=0 bridge: Multicast IPv6 to unknown group      [XFAIL]
        reception succeeded, but should have failed
TEST: vlan_filtering=0 bridge: Multicast IPv6 to unknown group, promisc   [ OK ]
TEST: vlan_filtering=0 bridge: Multicast IPv6 to unknown group, allmulti   [ OK ]
TEST: vlan_filtering=1 bridge: Unicast IPv4 to primary MAC address   [ OK ]
TEST: vlan_filtering=1 bridge: Unicast IPv4 to macvlan MAC address   [ OK ]
TEST: vlan_filtering=1 bridge: Unicast IPv4 to unknown MAC address   [ OK ]
TEST: vlan_filtering=1 bridge: Unicast IPv4 to unknown MAC address, promisc   [ OK ]
TEST: vlan_filtering=1 bridge: Unicast IPv4 to unknown MAC address, allmulti   [ OK ]
TEST: vlan_filtering=1 bridge: Multicast IPv4 to joined group       [ OK ]
TEST: vlan_filtering=1 bridge: Multicast IPv4 to unknown group      [XFAIL]
        reception succeeded, but should have failed
TEST: vlan_filtering=1 bridge: Multicast IPv4 to unknown group, promisc   [ OK ]
TEST: vlan_filtering=1 bridge: Multicast IPv4 to unknown group, allmulti   [ OK ]
TEST: vlan_filtering=1 bridge: Multicast IPv6 to joined group       [ OK ]
TEST: vlan_filtering=1 bridge: Multicast IPv6 to unknown group      [XFAIL]
        reception succeeded, but should have failed
TEST: vlan_filtering=1 bridge: Multicast IPv6 to unknown group, promisc   [ OK ]
TEST: vlan_filtering=1 bridge: Multicast IPv6 to unknown group, allmulti   [ OK ]
TEST: VLAN upper: Unicast IPv4 to primary MAC address               [ OK ]
TEST: VLAN upper: Unicast IPv4 to macvlan MAC address               [ OK ]
TEST: VLAN upper: Unicast IPv4 to unknown MAC address               [ OK ]
TEST: VLAN upper: Unicast IPv4 to unknown MAC address, promisc      [ OK ]
TEST: VLAN upper: Unicast IPv4 to unknown MAC address, allmulti     [ OK ]
TEST: VLAN upper: Multicast IPv4 to joined group                    [ OK ]
TEST: VLAN upper: Multicast IPv4 to unknown group                   [XFAIL]
        reception succeeded, but should have failed
TEST: VLAN upper: Multicast IPv4 to unknown group, promisc          [ OK ]
TEST: VLAN upper: Multicast IPv4 to unknown group, allmulti         [ OK ]
TEST: VLAN upper: Multicast IPv6 to joined group                    [ OK ]
TEST: VLAN upper: Multicast IPv6 to unknown group                   [XFAIL]
        reception succeeded, but should have failed
TEST: VLAN upper: Multicast IPv6 to unknown group, promisc          [ OK ]
TEST: VLAN upper: Multicast IPv6 to unknown group, allmulti         [ OK ]
TEST: VLAN upper: 1588v2 over L2 transport, Sync                    [ OK ]
TEST: VLAN upper: 1588v2 over L2 transport, Follow-Up               [FAIL]
        reception failed
TEST: VLAN upper: 1588v2 over L2 transport, Peer Delay Request      [ OK ]
TEST: VLAN upper: 1588v2 over IPv4, Sync                            [FAIL]
        reception failed
;TEST: VLAN upper: 1588v2 over IPv4, Follow-Up                       [FAIL]
        reception failed
TEST: VLAN upper: 1588v2 over IPv4, Peer Delay Request              [FAIL]
        reception failed
TEST: VLAN upper: 1588v2 over IPv6, Sync                            [FAIL]
        reception failed
TEST: VLAN upper: 1588v2 over IPv6, Follow-Up                       [FAIL]
        reception failed
TEST: VLAN upper: 1588v2 over IPv6, Peer Delay Request              [FAIL]
        reception failed
TEST: VLAN over vlan_filtering=0 bridged port: Unicast IPv4 to primary MAC address   [ OK ]
TEST: VLAN over vlan_filtering=0 bridged port: Unicast IPv4 to macvlan MAC address   [ OK ]
TEST: VLAN over vlan_filtering=0 bridged port: Unicast IPv4 to unknown MAC address   [ OK ]
TEST: VLAN over vlan_filtering=0 bridged port: Unicast IPv4 to unknown MAC address, promisc   [ OK ]
TEST: VLAN over vlan_filtering=0 bridged port: Unicast IPv4 to unknown MAC address, allmulti   [ OK ]
TEST: VLAN over vlan_filtering=0 bridged port: Multicast IPv4 to joined group   [ OK ]
TEST: VLAN over vlan_filtering=0 bridged port: Multicast IPv4 to unknown group   [XFAIL]
        reception succeeded, but should have failed
TEST: VLAN over vlan_filtering=0 bridged port: Multicast IPv4 to unknown group, promisc   [ OK ]
TEST: VLAN over vlan_filtering=0 bridged port: Multicast IPv4 to unknown group, allmulti   [ OK ]
TEST: VLAN over vlan_filtering=0 bridged port: Multicast IPv6 to joined group   [ OK ]
TEST: VLAN over vlan_filtering=0 bridged port: Multicast IPv6 to unknown group   [XFAIL]
        reception succeeded, but should have failed
TEST: VLAN over vlan_filtering=0 bridged port: Multicast IPv6 to unknown group, promisc   [ OK ]
TEST: VLAN over vlan_filtering=0 bridged port: Multicast IPv6 to unknown group, allmulti   [ OK ]
TEST: VLAN over vlan_filtering=0 bridged port: 1588v2 over L2 transport, Sync   [ OK ]
TEST: VLAN over vlan_filtering=0 bridged port: 1588v2 over L2 transport, Follow-Up   [ OK ]
TEST: VLAN over vlan_filtering=0 bridged port: 1588v2 over L2 transport, Peer Delay Request   [ OK ]
TEST: VLAN over vlan_filtering=0 bridged port: 1588v2 over IPv4, Sync   [FAIL]
        reception failed
TEST: VLAN over vlan_filtering=0 bridged port: 1588v2 over IPv4, Follow-Up   [FAIL]
        reception failed
TEST: VLAN over vlan_filtering=0 bridged port: 1588v2 over IPv4, Peer Delay Request   [FAIL]
        reception failed
TEST: VLAN over vlan_filtering=0 bridged port: 1588v2 over IPv6, Sync   [FAIL]
        reception failed
TEST: VLAN over vlan_filtering=0 bridged port: 1588v2 over IPv6, Follow-Up   [FAIL]
        reception failed
TEST: VLAN over vlan_filtering=0 bridged port: 1588v2 over IPv6, Peer Delay Request   [FAIL]
        reception failed
TEST: VLAN over vlan_filtering=1 bridged port: Unicast IPv4 to primary MAC address   [ OK ]
TEST: VLAN over vlan_filtering=1 bridged port: Unicast IPv4 to macvlan MAC address   [ OK ]
TEST: VLAN over vlan_filtering=1 bridged port: Unicast IPv4 to unknown MAC address   [FAIL]
        reception succeeded, but should have failed
TEST: VLAN over vlan_filtering=1 bridged port: Unicast IPv4 to unknown MAC address, promisc   [ OK ]
TEST: VLAN over vlan_filtering=1 bridged port: Unicast IPv4 to unknown MAC address, allmulti   [FAIL]
        reception succeeded, but should have failed
TEST: VLAN over vlan_filtering=1 bridged port: Multicast IPv4 to joined group   [ OK ]
TEST: VLAN over vlan_filtering=1 bridged port: Multicast IPv4 to unknown group   [XFAIL]
        reception succeeded, but should have failed
TEST: VLAN over vlan_filtering=1 bridged port: Multicast IPv4 to unknown group, promisc   [ OK ]
TEST: VLAN over vlan_filtering=1 bridged port: Multicast IPv4 to unknown group, allmulti   [ OK ]
TEST: VLAN over vlan_filtering=1 bridged port: Multicast IPv6 to joined group   [ OK ]
TEST: VLAN over vlan_filtering=1 bridged port: Multicast IPv6 to unknown group   [XFAIL]
        reception succeeded, but should have failed
TEST: VLAN over vlan_filtering=1 bridged port: Multicast IPv6 to unknown group, promisc   [ OK ]
TEST: VLAN over vlan_filtering=1 bridged port: Multicast IPv6 to unknown group, allmulti   [ OK ]
TEST: VLAN over vlan_filtering=1 bridged port: 1588v2 over L2 transport, Sync   [ OK ]
TEST: VLAN over vlan_filtering=1 bridged port: 1588v2 over L2 transport, Follow-Up   [ OK ]
TEST: VLAN over vlan_filtering=1 bridged port: 1588v2 over L2 transport, Peer Delay Request   [ OK ]
TEST: VLAN over vlan_filtering=1 bridged port: 1588v2 over IPv4, Sync   [FAIL]
        reception failed
TEST: VLAN over vlan_filtering=1 bridged port: 1588v2 over IPv4, Follow-Up   [FAIL]
        reception failed
TEST: VLAN over vlan_filtering=1 bridged port: 1588v2 over IPv4, Peer Delay Request   [FAIL]
        reception failed
TEST: VLAN over vlan_filtering=1 bridged port: 1588v2 over IPv6, Sync   [FAIL]
        reception failed
TEST: VLAN over vlan_filtering=1 bridged port: 1588v2 over IPv6, Follow-Up   [FAIL]
        reception failed
TEST: VLAN over vlan_filtering=1 bridged port: 1588v2 over IPv6, Peer Delay Request   [FAIL]
        reception failed
TEST: VLAN over vlan_filtering=0 bridge: Unicast IPv4 to primary MAC address   [ OK ]
TEST: VLAN over vlan_filtering=0 bridge: Unicast IPv4 to macvlan MAC address   [ OK ]
TEST: VLAN over vlan_filtering=0 bridge: Unicast IPv4 to unknown MAC address   [ OK ]
TEST: VLAN over vlan_filtering=0 bridge: Unicast IPv4 to unknown MAC address, promisc   [ OK ]
TEST: VLAN over vlan_filtering=0 bridge: Unicast IPv4 to unknown MAC address, allmulti   [ OK ]
TEST: VLAN over vlan_filtering=0 bridge: Multicast IPv4 to joined group   [ OK ]
TEST: VLAN over vlan_filtering=0 bridge: Multicast IPv4 to unknown group   [XFAIL]
        reception succeeded, but should have failed
TEST: VLAN over vlan_filtering=0 bridge: Multicast IPv4 to unknown group, promisc   [ OK ]
TEST: VLAN over vlan_filtering=0 bridge: Multicast IPv4 to unknown group, allmulti   [ OK ]
TEST: VLAN over vlan_filtering=0 bridge: Multicast IPv6 to joined group   [ OK ]
TEST: VLAN over vlan_filtering=0 bridge: Multicast IPv6 to unknown group   [XFAIL]
        reception succeeded, but should have failed
TEST: VLAN over vlan_filtering=0 bridge: Multicast IPv6 to unknown group, promisc   [ OK ]
TEST: VLAN over vlan_filtering=0 bridge: Multicast IPv6 to unknown group, allmulti   [ OK ]
TEST: VLAN over vlan_filtering=1 bridge: Unicast IPv4 to primary MAC address   [ OK ]
TEST: VLAN over vlan_filtering=1 bridge: Unicast IPv4 to macvlan MAC address   [ OK ]
TEST: VLAN over vlan_filtering=1 bridge: Unicast IPv4 to unknown MAC address   [ OK ]
TEST: VLAN over vlan_filtering=1 bridge: Unicast IPv4 to unknown MAC address, promisc   [ OK ]
TEST: VLAN over vlan_filtering=1 bridge: Unicast IPv4 to unknown MAC address, allmulti   [ OK ]
TEST: VLAN over vlan_filtering=1 bridge: Multicast IPv4 to joined group   [ OK ]
TEST: VLAN over vlan_filtering=1 bridge: Multicast IPv4 to unknown group   [XFAIL]
        reception succeeded, but should have failed
TEST: VLAN over vlan_filtering=1 bridge: Multicast IPv4 to unknown group, promisc   [ OK ]
TEST: VLAN over vlan_filtering=1 bridge: Multicast IPv4 to unknown group, allmulti   [ OK ]
TEST: VLAN over vlan_filtering=1 bridge: Multicast IPv6 to joined group   [ OK ]
TEST: VLAN over vlan_filtering=1 bridge: Multicast IPv6 to unknown group   [XFAIL]
        reception succeeded, but should have failed
TEST: VLAN over vlan_filtering=1 bridge: Multicast IPv6 to unknown group, promisc   [ OK ]
TEST: VLAN over vlan_filtering=1 bridge: Multicast IPv6 to unknown group, allmulti   [ OK ]

Output bridge_vlan_unaware.sh
TEST: ping                                                          [ OK ]
TEST: ping6                                                         [ OK ]
TEST: FDB learning                                                  [ OK ]
TEST: Unknown unicast flood                                         [ OK ]
TEST: Unregistered multicast flood                                  [ OK ]

Output bridge_vlan_aware.sh
TEST: ping                                                          [ OK ]
TEST: ping6                                                         [ OK ]
TEST: FDB learning                                                  [ OK ]
TEST: Unknown unicast flood                                         [ OK ]
TEST: Unregistered multicast flood                                  [ OK ]
INFO: Add and delete a VLAN on bridge port lan2
TEST: ping                                                          [ OK ]
TEST: ping6                                                         [ OK ]
TEST: Externally learned FDB entry - ageing & roaming               [ OK ]
TEST: FDB entry in PVID for VLAN-tagged with other TPID             [FAIL]
        FDB entry was not learned when it should
TEST: Reception of VLAN with other TPID as untagged                 [FAIL]
        Packet was not forwarded when it should
TEST: Reception of VLAN with other TPID as untagged (no PVID)       [FAIL]
        Packet was forwarded when should not

[ For Vladimir, I still have to implement fdb_isolation but posting to
start the ball rolling for the multiple subsystem this patch affect
and for the dubious DT schema ]

Changes v14:
- Move MAITAINERS entry to dedicated commit (make it easier for cross
  subsystem merge)
- Pack variables in trap function
- Add additional patch for reported difference from MTK tag
Changes v13:
- Reimplement tx_lpi OPs
- Rework mdio-regmap to internally encode/decode address
- Fix error in Documentation
- Drop ext-surge property (assume calibration with declared nvmem cell)
- Fix comments from Lee on MFD driver
- Improve print error and drop extra space in DSA driver
Changes v12:
- Update on top of net-next
- Add additional info on conver-letter about slefttests and HW limitation
- Introduce mdio-regmap generalization for multiple address
- Drop dev flags and define PHY calibration in PHY node directly
Changes v11:
- Address reviews from Christophe (spell mistake + dev_err_probe)
- Fix kconfig dependency for MFD driver (depends on MDIO_DEVICE instead of MDIO)
  (indirectly fix link error for mdio APIs)
- Fix copy-paste error for MFD driver of_table
- Fix compilation error for PHY (move NVMEM to .config)
- Drop unneeded NVMEM node from MDIO example schema (from Andrew)
- Adapt MFD example schema to MDIO reg property restrictions
Changes v10:
- Entire rework to MFD + split to MDIO, EFUSE, SWITCH separate drivers
- Drop EEE OPs (while Russell finish RFC for EEE changes)
- Use new pcs_inpand OPs
- Drop AN restart function and move to pcs_config
- Enable assisted_learning and disable CPU learn (preparation for fdb_isolation)
- Move EFUSE read in Internal PHY driver to .config to handle EPROBE_DEFER
  (needed now that NVMEM driver is register externally instead of internally to switch
   node)
Changes v9:
- Error out on using 5G speed as currently not supported
- Add missing MAC_2500FD in phylink mac_capabilities
- Add comment and improve if condition for an8855_phylink_mac_config
Changes v8:
- Add port Fast Age support
- Add support for Port Isolation
- Use correct register for Learning Disable
- Add support for Ageing Time OP
- Set default PVID to 0 by default
- Add mdb OPs
- Add port change MTU
- Fix support for Upper VLAN
Changes v7:
- Fix devm_dsa_register_switch wrong export symbol
Changes v6:
- Drop standard MIB and handle with ethtool OPs (as requested by Jakub)
- Cosmetic: use bool instead of 0 or 1
Changes v5:
- Add devm_dsa_register_switch() patch
- Add Reviewed-by tag for DT patch
Changes v4:
- Set regmap readable_table static (mute compilation warning)
- Add support for port_bridge flags (LEARNING, FLOOD)
- Reset fdb struct in fdb_dump
- Drop support_asym_pause in port_enable
- Add define for get_phy_flags
- Fix bug for port not inititially part of a bridge
  (in an8855_setup the port matrix was always cleared but
   the CPU port was never initially added)
- Disable learning and flood for user port by default
- Set CPU port to flood and learning by default
- Correctly AND force duplex and flow control in an8855_phylink_mac_link_up
- Drop RGMII from pcs_config
- Check ret in "Disable AN if not in autoneg"
- Use devm_mutex_init
- Fix typo for AN8855_PORT_CHECK_MODE
- Better define AN8855_STP_LISTENING = AN8855_STP_BLOCKING
- Fix typo in AN8855_PHY_EN_DOWN_SHIFT
- Use paged helper for PHY
- Skip calibration in config_init if priv not defined
Changes v3:
- Out of RFC
- Switch PHY code to select_page API
- Better describe masks and bits in PHY driver for ADC register
- Drop raw values and use define for mii read/write
- Switch to absolute PHY address
- Replace raw values with mask and bits for pcs_config
- Fix typo for ext-surge property name
- Drop support for relocating Switch base PHY address on the bus
Changes v2:
- Drop mutex guard patch
- Drop guard usage in DSA driver
- Use __mdiobus_write/read
- Check return condition and return errors for mii read/write
- Fix wrong logic for EEE
- Fix link_down (don't force link down with autoneg)
- Fix forcing speed on sgmii autoneg
- Better document link speed for sgmii reg
- Use standard define for sgmii reg
- Imlement nvmem support to expose switch EFUSE
- Rework PHY calibration with the use of NVMEM producer/consumer
- Update DT with new NVMEM property
- Move aneg validation for 2500-basex in pcs_config
- Move r50Ohm table and function to PHY driver

Christian Marangi (16):
  dt-bindings: nvmem: Document support for Airoha AN8855 Switch EFUSE
  dt-bindings: net: Document support for Airoha AN8855 Switch Virtual
    MDIO
  dt-bindings: net: dsa: Document support for Airoha AN8855 DSA Switch
  dt-bindings: net: Document support for AN8855 Switch Internal PHY
  dt-bindings: mfd: Document support for Airoha AN8855 Switch SoC
  net: mdio: regmap: prepare support for multiple valid addr
  net: mdio: regmap: add support for C45 read/write
  net: mdio: regmap: add support for multiple valid addr
  net: mdio: regmap: add OF support
  mfd: an8855: Add support for Airoha AN8855 Switch MFD
  net: mdio: Add Airoha AN8855 Switch MDIO Passtrough
  nvmem: an8855: Add support for Airoha AN8855 Switch EFUSE
  net: dsa: Add Airoha AN8855 5-Port Gigabit DSA Switch driver
  net: phy: Add Airoha AN8855 Internal Switch Gigabit PHY
  MAINTAINERS: add myself as maintainer for AN8855
  net: dsa: tag_mtk: add comments about Airoha usage of this TAG

 .../bindings/mfd/airoha,an8855.yaml           |  175 ++
 .../bindings/net/airoha,an8855-mdio.yaml      |   56 +
 .../bindings/net/airoha,an8855-phy.yaml       |   83 +
 .../net/dsa/airoha,an8855-switch.yaml         |   86 +
 .../bindings/nvmem/airoha,an8855-efuse.yaml   |  123 +
 MAINTAINERS                                   |   18 +
 drivers/mfd/Kconfig                           |   12 +
 drivers/mfd/Makefile                          |    1 +
 drivers/mfd/airoha-an8855.c                   |  429 +++
 drivers/net/dsa/Kconfig                       |    9 +
 drivers/net/dsa/Makefile                      |    1 +
 drivers/net/dsa/an8855.c                      | 2376 +++++++++++++++++
 drivers/net/dsa/an8855.h                      |  773 ++++++
 drivers/net/mdio/Kconfig                      |   10 +
 drivers/net/mdio/Makefile                     |    1 +
 drivers/net/mdio/mdio-an8855.c                |   49 +
 drivers/net/mdio/mdio-regmap.c                |  188 +-
 drivers/net/phy/Kconfig                       |    5 +
 drivers/net/phy/Makefile                      |    1 +
 drivers/net/phy/air_an8855.c                  |  261 ++
 drivers/nvmem/Kconfig                         |   11 +
 drivers/nvmem/Makefile                        |    2 +
 drivers/nvmem/an8855-efuse.c                  |   63 +
 include/linux/mdio/mdio-regmap.h              |   16 +
 net/dsa/tag_mtk.c                             |    3 +
 25 files changed, 4738 insertions(+), 14 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/mfd/airoha,an8855.yaml
 create mode 100644 Documentation/devicetree/bindings/net/airoha,an8855-mdio.yaml
 create mode 100644 Documentation/devicetree/bindings/net/airoha,an8855-phy.yaml
 create mode 100644 Documentation/devicetree/bindings/net/dsa/airoha,an8855-switch.yaml
 create mode 100644 Documentation/devicetree/bindings/nvmem/airoha,an8855-efuse.yaml
 create mode 100644 drivers/mfd/airoha-an8855.c
 create mode 100644 drivers/net/dsa/an8855.c
 create mode 100644 drivers/net/dsa/an8855.h
 create mode 100644 drivers/net/mdio/mdio-an8855.c
 create mode 100644 drivers/net/phy/air_an8855.c
 create mode 100644 drivers/nvmem/an8855-efuse.c

-- 
2.48.1


