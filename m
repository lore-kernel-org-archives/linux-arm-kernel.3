Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB93BC36002
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  6 Apr 2025 22:18:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fbjlynKWg/4l7XREwNXFX/8RA/bU/RRJTqy0Jin3hBE=; b=VrSZs05ZslN4FyqQJTjFm1hb0j
	lTaKP+dO9l2W5R7m6CvYC0il/lMXqnTPRxIZ2YWOT2CIRgcQzLN5W8XHxSMugZ3+G7oMonFISy+7V
	3SUlN8yTqLkaQ88F9UQEq49S5WAQPnUsA0f2DWL18sg5P+qcMLlFDuPloj2zNr8xR+PFLiUO27URP
	sP8k21Z946rl29T7GKXuybnSCuQkoeygjpFxhq6Qv8oMeknKRBYNoeGNXAik4vX9QD2O+Klsu48MT
	5IjA70snFPo/sl50FvdVKTbTH/hV1ZxtCPLi9duiaoNHADMfk8ZLqrItl0awDL+22uCgfHUKb6Ttj
	sLhJkKOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1YKD-0000000Ftgk-21IN;
	Sun, 06 Apr 2025 22:18:45 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1YGc-0000000Fsu3-1ZiI;
	Sun, 06 Apr 2025 22:15:03 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-43d0359b1fcso23385825e9.0;
        Sun, 06 Apr 2025 15:15:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743977701; x=1744582501; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fbjlynKWg/4l7XREwNXFX/8RA/bU/RRJTqy0Jin3hBE=;
        b=fBl0sECHdTdBaN31W/ZBltEcNW09E/oCFZ8igHaghfD1sXXIPvhJRL0CI4cew+l2tq
         rgptbJpQxHPHVxRiY3FFOXnHqAh2emmc0iDsEgSyddKbQAHLPO92zMWk5B5Tys2AlGsE
         4SaCIPfy5ulqHTUMDHCZrmCD9Vb68qcprzUgG2Pjb9T8t+NDLm0JdE3ATr4Haoc73Kuf
         hS6sWz398lywi27eS3oJ10KKZyc1OhMDm1rtCqDIZoSWso4GmGljDhAYwpUwWtvFrvnU
         1rHPqxJtoLZGrO8pVs2H23AHCvDoX01ktndqUTxnzLgPKqVe0x8BkOIiZvcZKBFC/Avh
         hrlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743977701; x=1744582501;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fbjlynKWg/4l7XREwNXFX/8RA/bU/RRJTqy0Jin3hBE=;
        b=DxnbCK9WTuM/6YhPJKaF3DiX3aXCLXGr1tTBqNqfkGqiXrgFwHtS/2PFJifOZAtvmz
         7uF06BEvOJv4LjwculXlDsIfG/QPcBRxZzcwpOUtj1aGpborrsItx+YEPVnJizXEhQAO
         rHyS/FY08Rc9125otIuT68nzZw8vYyykSwrC8qwwgAcjoTxOWJYRAvTZIlWw7632PgkQ
         HkkXveDtSVIM18SFWXyCgXWsGFtOOZkyWuV2avw6Ok9d/CyTn7anP8xL2/v9xmXXC2ji
         LbkqhxYns/2ZvslGKTTK4ETzpOTa7ig6ynZnNJnTZsZS6Mr6eSdi31nqLemBbPJJs6cd
         EsNA==
X-Forwarded-Encrypted: i=1; AJvYcCUrtzBlSr/CEpCsz+VKA2Qpw9mCSXusqn54pJaAZlkre1Ncgb+gH6TZNH9TwR//0VpFz/FDicRas8IhkOxQl9Y=@lists.infradead.org, AJvYcCWn/qj6Saq6Dxx32fewgCAJWm58chGqZs1fwSu/PWZvurWhIylornefXc/jjOfzfYsgOdYxjotHRdtL1JEq3FMr@lists.infradead.org
X-Gm-Message-State: AOJu0Yy54dkm6lW7Tc2uQDc4lbw34yIh+3rdfSQ2tI1cUqfhI5o4On4a
	hF5T1QJAEofvGzqe5Fh34NppVUlGcqY4eXVy5grqOBJVsWQjUPjG
X-Gm-Gg: ASbGncvstTWxkAwIQRu8e6erYGJ/CoVR8vO4adtRwgu1vWCSZ0hPVYNvFoCejPdATN3
	/38NEG3zZohCEK8jszWO+2O3omQA2DqJi2xdlMi2kG5+dTMO9BoBleXmHhDuA776ElCoPzYgibS
	aHtMiDvry8o0Y3TpzXI3NbrGMpgVEauq5m4jiN9952/HY19UK/aJMRShqKJvmvYbgw/26lQTr1e
	hYPdvbHrYyMyIDCxinXq2UoTGgclh/+B+cOl6g1BF0wDLMY2lBxZgUKuxwcgRw3vCH+a9iQNmEV
	DurFb6jQQsRadi/sWjQZyo2mEaWx5MMoogFspvw1w5ymSxMMjOhWwsMzasXtMHqIRbl2y/dZpl4
	S+CwqNXAFGXVJkg==
X-Google-Smtp-Source: AGHT+IEdcsmazJ3h4gV5FB1N2QFgWw4lBR8V7yh2Q970uDPmQsNJz+c+C9tAeyVOD9FOQdxcIx726Q==
X-Received: by 2002:a05:600c:190b:b0:43d:fa5f:7d04 with SMTP id 5b1f17b1804b1-43ebf017220mr153587975e9.16.1743977700662;
        Sun, 06 Apr 2025 15:15:00 -0700 (PDT)
Received: from localhost.localdomain (93-34-88-225.ip49.fastwebnet.it. [93.34.88.225])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-43ec366aa29sm111517055e9.39.2025.04.06.15.14.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Apr 2025 15:15:00 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Daniel Golle <daniel@makrotopia.org>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	"Lei Wei (QUIC)" <quic_leiwei@quicinc.com>
Cc: stable@vger.kernel.org
Subject: [RFC PATCH net-next v2 01/11] net: phylink: fix possible circular locking dep with config in-band
Date: Mon,  7 Apr 2025 00:13:54 +0200
Message-ID: <20250406221423.9723-2-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250406221423.9723-1-ansuelsmth@gmail.com>
References: <20250406221423.9723-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250406_151502_418578_3BE0AD74 
X-CRM114-Status: GOOD (  15.47  )
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

Debug lock detection revealed a possible circular locking dependency between
phylink_major_config() and phylink_bringup_phy().

This was introduced by the addition of phy_config_inband(), which acquires
the phydev lock. This made the locking order in phylink_bringup_phy()
inconsistent, as it acquires the phydev lock before phylink's state_mutex.

A deadlock can occur when phylink_major_config() is called from
phylink_resolve(), where the state_mutex is taken first and then the phydev
lock. This is the reverse of the order used in phylink_bringup_phy().

To avoid this circular dependency, change the locking order in
phylink_bringup_phy() to match the pattern used in phylink_resolve(): take
state_mutex first, then the phydev lock.

A sample lockdep warning is included below for reference:

[  147.749178]
[  147.750682] ======================================================
[  147.756850] WARNING: possible circular locking dependency detected
[  147.763019] 6.14.0-next-20250404+ #0 Tainted: G           O
[  147.769189] ------------------------------------------------------
[  147.775356] kworker/u16:0/12 is trying to acquire lock:
[  147.780571] ffffff80ce9bcf08 (&dev->lock#2){+.+.}-{4:4}, at: phy_config_inband+0x44/0x90
[  147.788672]
[  147.788672] but task is already holding lock:
[  147.794492] ffffff80c0dfbda0 (&pl->state_mutex){+.+.}-{4:4}, at: phylink_resolve+0x2c/0x6a8
[  147.802840]
[  147.802840] which lock already depends on the new lock.
[  147.802840]
[  147.811002]
[  147.811002] the existing dependency chain (in reverse order) is:
[  147.818472]
[  147.818472] -> #1 (&pl->state_mutex){+.+.}-{4:4}:
[  147.824647]        __mutex_lock+0x90/0x924
[  147.828738]        mutex_lock_nested+0x20/0x28
[  147.833173]        phylink_bringup_phy+0x210/0x700
[  147.837954]        phylink_fwnode_phy_connect+0xe0/0x124
[  147.843256]        phylink_of_phy_connect+0x18/0x20
[  147.848124]        dsa_user_create+0x210/0x414
[  147.852561]        dsa_port_setup+0xd4/0x14c
[  147.856823]        dsa_register_switch+0xbb0/0xe40
[  147.861605]        mt7988_probe+0xf8/0x140
[  147.865694]        platform_probe+0x64/0xbc
[  147.869869]        really_probe+0xbc/0x388
[  147.873955]        __driver_probe_device+0x78/0x154
[  147.878823]        driver_probe_device+0x3c/0xd4
[  147.883430]        __device_attach_driver+0xb0/0x144
[  147.888383]        bus_for_each_drv+0x6c/0xb0
[  147.892732]        __device_attach+0x9c/0x19c
[  147.897078]        device_initial_probe+0x10/0x18
[  147.901771]        bus_probe_device+0xa8/0xac
[  147.906118]        deferred_probe_work_func+0xb8/0x118
[  147.911245]        process_one_work+0x224/0x610
[  147.915769]        worker_thread+0x1b8/0x35c
[  147.920029]        kthread+0x11c/0x1e8
[  147.923769]        ret_from_fork+0x10/0x20
[  147.927857]
[  147.927857] -> #0 (&dev->lock#2){+.+.}-{4:4}:
[  147.933686]        __lock_acquire+0x12b8/0x1ff0
[  147.938209]        lock_acquire+0xf4/0x2d8
[  147.942295]        __mutex_lock+0x90/0x924
[  147.946383]        mutex_lock_nested+0x20/0x28
[  147.950817]        phy_config_inband+0x44/0x90
[  147.955252]        phylink_major_config+0x684/0xa64
[  147.960120]        phylink_resolve+0x24c/0x6a8
[  147.964554]        process_one_work+0x224/0x610
[  147.969075]        worker_thread+0x1b8/0x35c
[  147.973335]        kthread+0x11c/0x1e8
[  147.977075]        ret_from_fork+0x10/0x20
[  147.981162]
[  147.981162] other info that might help us debug this:
[  147.981162]
[  147.989150]  Possible unsafe locking scenario:
[  147.989150]
[  147.995056]        CPU0                    CPU1
[  147.999575]        ----                    ----
[  148.004094]   lock(&pl->state_mutex);
[  148.007748]                                lock(&dev->lock#2);
[  148.013572]                                lock(&pl->state_mutex);
[  148.019742]   lock(&dev->lock#2);
[  148.023051]
[  148.023051]  *** DEADLOCK ***
[  148.023051]
[  148.028958] 3 locks held by kworker/u16:0/12:
[  148.033304]  #0: ffffff80c0011d48 ((wq_completion)events_power_efficient){+.+.}-{0:0}, at: process_one_work+0x1a8/0x610
[  148.044082]  #1: ffffffc081ca3dd8 ((work_completion)(&pl->resolve)){+.+.}-{0:0}, at: process_one_work+0x1d0/0x610
[  148.054338]  #2: ffffff80c0dfbda0 (&pl->state_mutex){+.+.}-{4:4}, at: phylink_resolve+0x2c/0x6a8
[  148.063119]
[  148.063119] stack backtrace:
[  148.067465] CPU: 3 UID: 0 PID: 12 Comm: kworker/u16:0 Tainted: G           O        6.14.0-next-20250404+ #0 NONE
[  148.067472] Tainted: [O]=OOT_MODULE
[  148.067474] Hardware name: Bananapi BPI-R4 2.5GE PoE (DT)
[  148.067476] Workqueue: events_power_efficient phylink_resolve
[  148.067482] Call trace:
[  148.067484]  show_stack+0x14/0x1c (C)
[  148.067492]  dump_stack_lvl+0x84/0xc0
[  148.067497]  dump_stack+0x14/0x1c
[  148.067500]  print_circular_bug+0x330/0x43c
[  148.067505]  check_noncircular+0x124/0x134
[  148.067508]  __lock_acquire+0x12b8/0x1ff0
[  148.067512]  lock_acquire+0xf4/0x2d8
[  148.067516]  __mutex_lock+0x90/0x924
[  148.067521]  mutex_lock_nested+0x20/0x28
[  148.067527]  phy_config_inband+0x44/0x90
[  148.067531]  phylink_major_config+0x684/0xa64
[  148.067535]  phylink_resolve+0x24c/0x6a8
[  148.067539]  process_one_work+0x224/0x610
[  148.067544]  worker_thread+0x1b8/0x35c
[  148.067548]  kthread+0x11c/0x1e8
[  148.067552]  ret_from_fork+0x10/0x20

Cc: stable@vger.kernel.org
Fixes: 5fd0f1a02e75 ("net: phylink: add negotiation of in-band capabilities")
Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/net/phy/phylink.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
index 69ca765485db..4a1edf19dfad 100644
--- a/drivers/net/phy/phylink.c
+++ b/drivers/net/phy/phylink.c
@@ -2072,8 +2072,8 @@ static int phylink_bringup_phy(struct phylink *pl, struct phy_device *phy,
 		     dev_name(&phy->mdio.dev), phy->drv->name, irq_str);
 	kfree(irq_str);
 
-	mutex_lock(&phy->lock);
 	mutex_lock(&pl->state_mutex);
+	mutex_lock(&phy->lock);
 	pl->phydev = phy;
 	pl->phy_state.interface = interface;
 	pl->phy_state.pause = MLO_PAUSE_NONE;
@@ -2115,8 +2115,8 @@ static int phylink_bringup_phy(struct phylink *pl, struct phy_device *phy,
 		phy_disable_eee(phy);
 	}
 
-	mutex_unlock(&pl->state_mutex);
 	mutex_unlock(&phy->lock);
+	mutex_unlock(&pl->state_mutex);
 
 	phylink_dbg(pl,
 		    "phy: %s setting supported %*pb advertising %*pb\n",
-- 
2.48.1


