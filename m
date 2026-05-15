Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C1D8CD343F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 May 2026 09:53:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-transfer-encoding:
	Content-type:MIME-version:References:In-reply-to:Message-id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KhYQsRh4VyQqcPigw9u1q21Z8nnaa7Jt0zu3uVsvbqU=; b=c0ybhgso7SoA1xv5athfuLjeUY
	rqVTfCXHI3ywu5UwEnPfusaWWx0p92mu+R60DdGGvCigTS3UDlrMxbLa0yuIeu8b45wGUFRLg1QOh
	sdeI6Bl7RWb5JarFdPAKGYpxGxGe0ga1YgTpIXUJGqpfRS6CJLpmKg8pgoPhA5VcIyaU041ZN95oj
	coPxqckbmJWtuxU+AvJpOLuJL2jnmUt0VbGJG8U1JTFIKUqdyO/zrpBg8OkKRMZuyEdNezi4gqBHh
	ANJAfZifUHvQdBxFtLJBWwOfnnO0tpQhMqIeVAxpfkVTaykOwc5mE2jQlcQTBP421lUVrVc06j02N
	MD9AeAPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNpEn-00000007xdj-1iNP;
	Fri, 15 May 2026 09:53:45 +0000
Received: from acj35aaf122.lhr1.oracleemaildelivery.com ([130.35.116.122])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNpEi-00000007xcQ-46pA
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 May 2026 09:53:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; s=oracle-uk-012026;
 d=raczylo.com;
 h=Date:To:From:Subject:Message-Id:MIME-Version:Sender:List-Unsubscribe:List-Unsubscribe-Post;
 bh=KhYQsRh4VyQqcPigw9u1q21Z8nnaa7Jt0zu3uVsvbqU=;
 b=BXaOS/4xxQt0EQLwE8prridr5hlJlks2vzBQDWAv1Aon95Dyf//NLXuXbMTy7N9ACVZeWgYzC1o5
   YBxXW61ncI3a6GFwFNa7pSQ3PI7HfmFS+qyPzKIXIvG120+MGrz4+uCYtTu0fvuvpXgFeDtw5JZH
   wNPcpcVKZ6q3AbsJ4Htj61ls+fQJ8xjKqfDaH2q6nS8n/IC6f2je3yVKW8Ekel43ckB6CsN1HKHh
   t5SvRVJFugPmkzydHZhCHkC+Wyw9lEpXmdw/IMDrf89e77ijyGrH/26sc/uEPogElTa4ui9xuG4G
   S1hQ7akGmiH6BaPzipatDrYnIRDuXVtQrSFZ/g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; s=prod-lhr-20191104;
 d=lhr1.rp.oracleemaildelivery.com;
 h=Date:To:From:Subject:Message-Id:MIME-Version:Sender:List-Unsubscribe:List-Unsubscribe-Post;
 bh=KhYQsRh4VyQqcPigw9u1q21Z8nnaa7Jt0zu3uVsvbqU=;
 b=uxt3RsM51CWGljFyQkVTGaCQP86pW22nCJzg8K9dGoSQmbHgW1nRRPRYJAkfkqZ6juFg6vysFoNp
   OMDgTdRvOJrxM8XiIrOYoyWUIfsOtivcjItiQRYtPMkvPARP8tyiWUbPmP5Y6w7RXZh0mRgYhLlg
   S9wKCQBT8BXP1I4JoIf1OBNbLsyte24Nx5jVoA7CJmwTSVl9eDZ3jsHBfpOc5+bJ4QdEOb9oOoNC
   YgKxYA92pmmoS0PtAsUHLNUvvHK+h4yO2ok+1c//I+lSIHoLvNxTsdgNCLzwIXF6hCqqFNT29LeA
   QdbgDvJduvDl7gBxZ6Nu9Scn/eQ9nNaou6iLvQ==
Received: by omta-ad2-fd1-1402-uk-london-1.omtaad2.vcndplhr.oraclevcn.com
 (Oracle Communications Messaging Server 8.1.0.1.20260212 64bit (built Feb 12
 2026))
 with ESMTPS id <0TF21UAHEOTC7W80@omta-ad2-fd1-1402-uk-london-1.omtaad2.vcndplhr.oraclevcn.com> for
 linux-arm-kernel@lists.infradead.org; Fri, 15 May 2026 09:53:36 +0000 (GMT)
List-Unsubscribe-Post: List-Unsubscribe=One-Click
From: Lukasz Raczylo <lukasz@raczylo.com>
To: netdev@vger.kernel.org
Cc: Theo Lebrun <theo.lebrun@bootlin.com>,
	Andrea della Porta <andrea.porta@suse.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Andrew Lunn <andrew+netdev@lunn.ch>,	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,	linux-rpi-kernel@lists.infradead.org
Subject: [PATCH net-next] net: macb: fix build of TX stall watchdog by
 replacing undefined netdev_warn_ratelimited
Date: Fri, 15 May 2026 10:53:36 +0100
Message-id: <20260515095336.92237-1-lukasz@raczylo.com>
X-Mailer: git-send-email 2.54.0
In-reply-to: <20260514215459.36109-4-lukasz@raczylo.com>
References: <cover.1777064117.git.lukasz@raczylo.com>
 <20260514215459.36109-1-lukasz@raczylo.com>
 <20260514215459.36109-4-lukasz@raczylo.com>
MIME-version: 1.0
Content-type: text/plain; charset=UTF-8
Content-transfer-encoding: 8bit
Reporting-Meta: AAGGMLVl544WMl84tN2V29poZax5nOlse0gFMRELc/TH6YxsiNZHF6OLG0TWO1Bd
 uRwGSxavSrmdgKx8Xt/y+S5+RT3Vo97Xt8gD1G9ztIwHKyGRhoDZUT7z8K1thxID
 vJByNGZaKr4By5jwNbao3q/WTDFslA0/JdsKGF0AkxCnxvysLxTbJG+oPpxJ4veT
 +aBl+oN5F6yo5j4erwAN1ry1MLm7pUgnZyjqSBIlXePXbuXLeOGnPF+rAc+npWw4
 s7gk9aa3nEiWrJi4OJAgky11r85GECIzGBCDVKbycS1EQTZlSgeSqP7H7i1v5k6/
 rK2ffzwJWhl2ExkPIyfbqAP7KN/c49uJPV8kDgaI56HN1ZKJuGO+8aass3ZRyK4C
 zmEM80JiFCENjXLCeoZLu9AXYpb6osX5hqWaxnSmuuIkz1OKuzonjTMd7IgoeaW3 EeTojGO7dA==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260515_025342_106355_98A20AC8 
X-CRM114-Status: UNSURE (   9.31  )
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

netdev_warn_ratelimited() does not exist in this kernel -- neither
mainline net-next nor raspberrypi/linux rpi-6.18.y define a
netdev_*_ratelimited() family.  I confused it with the existing
net_warn_ratelimited() / pr_warn_ratelimited() macros when
authoring v2 patch 3 of the macb silent TX stall series, and the
result fails to build with implicit-function-declaration.

Replace with the standard `if (printk_ratelimit()) netdev_warn(...)`
pattern.  Same semantics intended by v2 patch 3 (bounded log noise,
retains the netdev prefix in the message); works in every kernel
version.

Fixes the build of patch 3/3 of:

  https://lore.kernel.org/netdev/20260514215459.36109-1-lukasz@raczylo.com/T/

Caught by an independent build test on the Talos Linux Pi 5 build
(John Laur / johnlaur on GitHub), reported at:

  https://github.com/siderolabs/sbc-raspberrypi/issues/91#issuecomment-4456874307

Signed-off-by: Lukasz Raczylo <lukasz@raczylo.com>
---
 drivers/net/ethernet/cadence/macb_main.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/net/ethernet/cadence/macb_main.c b/drivers/net/ethernet/cadence/macb_main.c
--- a/drivers/net/ethernet/cadence/macb_main.c
+++ b/drivers/net/ethernet/cadence/macb_main.c
@@ -2057,10 +2057,11 @@ static void macb_tx_stall_watchdog(struct work_struct *work)
 	spin_unlock_irqrestore(&queue->tx_ptr_lock, flags);

 	if (stalled) {
-		netdev_warn_ratelimited(bp->dev,
-					"TX stall detected on queue %u (tail=%u head=%u); re-kicking TSTART\n",
-					(unsigned int)(queue - bp->queues),
-					cur_tail, cur_head);
+		if (printk_ratelimit())
+			netdev_warn(bp->dev,
+				    "TX stall detected on queue %u (tail=%u head=%u); re-kicking TSTART\n",
+				    (unsigned int)(queue - bp->queues),
+				    cur_tail, cur_head);
 		macb_tx_restart(queue);
 	}

--
2.54.0

