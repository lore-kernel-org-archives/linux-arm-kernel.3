Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D36CFFF885C
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 25 Apr 2026 21:48:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-transfer-encoding:
	Content-type:MIME-version:References:In-reply-to:Message-id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t9CQ5m3wOhmUWV8If1GVflZNLT7+4pTChH+YanoajiM=; b=0KImTa7cG0dRoYainaxmW0XzPp
	/IyXN5iWpM5OOEXqIE6akhVNw5eYhAnLSlRQ1qHfOmExtSoqZXrEFcMp6d+JaSXoX8cwLls9Tn+/F
	XO4iLSL3mJ3zJoC3L871rIyMPNggpkLkQl16yubIUEXCuht1PUHrCDhkcmwq4nRYWv+Ep/b47bQNz
	WM1kjNB3sW5qX1GVowRmvZ5ffRia8UcuZZsCdnWWvm42N/k9D9wYhnGEHFw6VUv7DUEX3mgRHhD+C
	Vxy3nppgPFVFguiYkxHc64iSciyuK7g30jKfiukMbtHY1lJY8VNyVXhe27z5D2chwthu2szF79836
	74CKK/yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGkrj-0000000EqPq-1oBK;
	Sat, 25 Apr 2026 21:48:43 +0000
Received: from acj35aaf86.lhr1.oracleemaildelivery.com ([130.35.116.86])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGkrg-0000000EqPU-0z4I
	for linux-arm-kernel@lists.infradead.org;
	Sat, 25 Apr 2026 21:48:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; s=oracle-uk-012026;
 d=raczylo.com;
 h=Date:To:From:Subject:Message-Id:MIME-Version:Sender:List-Unsubscribe:List-Unsubscribe-Post;
 bh=t9CQ5m3wOhmUWV8If1GVflZNLT7+4pTChH+YanoajiM=;
 b=eajb6qWvJOxo4ptMEF4nzy2LdMZrq/YCKcKDN6CE42IWTPAQAUSLEZb5Lvw9BRl2NJmiUbqzSmMx
   WepRnDflYgRv/88Bh+I4bXvzwjYxXay9oRK2uJtf5r1z5S8mJevxuZ0ofO65LmUhsEb24y6mUN21
   irpwRHz1XCwMr4yebzLcSeVf3jteuu5TpLOgA1WE2iQFLygfLYMDkmQfNoAQ6gg10MV4QOwTI3D8
   lQknE+qBUck6i5SfKArhwAw2uNgBMwb0vfCs3mrMInzYVhsY9Sofa1kBKwhsqINelmm9/QTf6l4C
   7SzpkWxzlX/RnCIiTl9ruZEudC1jk93ReAxt1g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; s=prod-lhr-20191104;
 d=lhr1.rp.oracleemaildelivery.com;
 h=Date:To:From:Subject:Message-Id:MIME-Version:Sender:List-Unsubscribe:List-Unsubscribe-Post;
 bh=t9CQ5m3wOhmUWV8If1GVflZNLT7+4pTChH+YanoajiM=;
 b=PQzTldtAXKGkxqfiBWr85a4NDCuCKX/s4a1D3OSQFnOKQmq0t5pnf3R9J2Z2jL8/yR7C5Z5PVbG1
   tAL7CexqHz7cDP66kYNsJV4nq9KOYeYMLj9jHMMH899OSeGHLBvxvSwOMmKVcxKS3mz0y+Hx8Fw5
   WIAaXQfVEHAVzVMsrTyy2+DZAduAuDd+Al43PhAQV+z+FJQLSCmfgYpo7Sk5cSNYf3JF3LzPHO3h
   HMO+GzthfcDyGWb/z7OXi4ExKlDNgK1XFg5ah8cCa/UQHb3tOVoOQXC6v2wn9lF3zeFk9+Hr2BBL
   EWRubihw3CznTiK165zlgip60MVeODPp0Aebbg==
Received: by omta-ad3-fd2-402-uk-london-1.omtaad3.vcndplhr.oraclevcn.com
 (Oracle Communications Messaging Server 8.1.0.1.20260212 64bit (built Feb 12
 2026))
 with ESMTPS id <0TE200A1NKKZ3510@omta-ad3-fd2-402-uk-london-1.omtaad3.vcndplhr.oraclevcn.com> for
 linux-arm-kernel@lists.infradead.org; Sat, 25 Apr 2026 21:48:35 +0000 (GMT)
List-Unsubscribe-Post: List-Unsubscribe=One-Click
From: Lukasz Raczylo <lukasz@raczylo.com>
To: netdev@vger.kernel.org
Cc: Nicolas Ferre <nicolas.ferre@microchip.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Andrew Lunn <andrew+netdev@lunn.ch>,	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [RFC PATCH net-next 0/3] net: macb: candidate fixes for silent TX
 stall on BCM2712/RP1
Date: Sat, 25 Apr 2026 22:48:25 +0100
Message-id: <20260425214825.31390-1-lukasz@raczylo.com>
X-Mailer: git-send-email 2.54.0
In-reply-to: <cover.1777064117.git.lukasz@raczylo.com>
References: <cover.1777064117.git.lukasz@raczylo.com>
MIME-version: 1.0
Content-type: text/plain; charset=UTF-8
Content-transfer-encoding: 8bit
Reporting-Meta: AAGFHUMHCyhz/Y5E0y2VFlm0i9zvAyzdLN9Op57gLgDDSYmpEyUmc63P+pWevRkF
 S/s8SFa5KPNQyr+28RlXTqXqgFU1A33tbQOwx9caGUxqLqqpnDetbG4OrKAIQV+U
 EK315XQuGQlV9yBaDzzjw0ntTZQF0xj2gN8QLXSNihidePmOddaipN8FWpRZTtji
 FGHgLDoyhywx6p7mR4WHewkOxzz87KiGGL+tEs96mUE/3H5UnYYFWa7FXNVYxAcy
 KO0OZjyUoUOU9SPDcANUOlGWb0ohpb/NNIh/rsa+Jds0iYtgtaTgwmCkZy9d1Nde
 TuWvYLx028CgE4l3saDJlKjDMM2dz84MZSuH1Nh6YFR1x8b9iSWAgNp7VdEOG37w
 3csXD2XhVx/EscYT9b/x9UqkOdK9Q/8u5nw0sb/MZ1In/ccup4P/dEWAn+eZyI4k 9O9CKLhb
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260425_144841_602147_193489A4 
X-CRM114-Status: UNSURE (   6.44  )
X-CRM114-Notice: Please train this message.
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

A follow-up runtime data point on this series.

Fleet state at 2026-04-25 21:46 UTC:

  * Patched uptime (since staggered rollout 2026-04-24 18:10-19:20 UTC):
    - shortest: 26h 26m   (last master upgraded)
    - longest:  27h 34m   (canary)
    - cumulative across 24 nodes: ~651 node-hours

  * Macb-attributable event counts (out-of-band userspace watchdog;
    the [tx-stall] detector watches /sys/class/net/end0/statistics/
    tx_packets + qdisc backlog every 1 s and would have fired
    ip link down/up if any node's TX path froze):
    - RECOVER trigger=tx-stall (actual stalls caught):    0
    - partial [tx-stall] markers (transient 1 s freezes): 0

  * Separately: 40 RECOVER events with trigger=ping fired in this
    window across the fleet, attributable to a brief upstream-network
    outage (gateway / switch event); each node simultaneously lost ping
    to gateway, VIP, and NAS within seconds of each other, then
    recovered.  These are unrelated to the macb hang the patch series
    targets — distinguishing them from a real TX stall is exactly what
    the trigger= tag in the watchdog log is for.

At the pre-patch rate referenced in the cover letter (50 stalls in
95 node-hours observed in our 2026-04-24 14:00-18:10 UTC reference
window, ~0.5 per node-hour), the projected stall count in
651 node-hours is on the order of 342;
observed is 0.

Same observability runs forward; will reply again after a full week
of uptime unless something changes.

--
Lukasz Raczylo

