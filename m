Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7183BCD6E45
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 May 2026 10:22:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IbqOPMbtYb94kHOSMp1J8BCdnb9kFfqkyI5Y5M0LML8=; b=rtjc4r+J9O8hoxYzGSZAIT4UE8
	rg2Bh/UW39XOB+/72WKLSG4rvKrq7MQGOVJ+Fs+IVQWehwizka6rjCheAAVDzcmDEqKpGK0ork3ZA
	k2YDjodytlenHC0tdXh6i4+FDjf7kJvh05cElJFDVszLfTst0S2Obyo3wJ3nu1dReAx470ikAprwM
	wofrm11WF0yUJTOqY5O2YcM1sT7cKYkFxsk53ciUJfP3qTwaqFgA8Ip1LobtEcrNFtceW7t45Ih0X
	MvJ1F0HLGDV7RmeBv8KPh8WOnwMSpyu3JoeTnxxrFdrB1UZgHxifyCneOft5T2F5KThjSbNdQ0iNW
	kKDeSBcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSBOb-00000003orz-0kJO;
	Wed, 27 May 2026 10:21:53 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSBOW-00000003ol3-3pqG;
	Wed, 27 May 2026 10:21:48 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 611D760121;
	Wed, 27 May 2026 10:21:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C4EB1F00A3A;
	Wed, 27 May 2026 10:21:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779877308;
	bh=IbqOPMbtYb94kHOSMp1J8BCdnb9kFfqkyI5Y5M0LML8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=FZ/+lMS6asIz/SMdcu/X0ed7POeHoFsFPuqzdKr1HlakeRKv7iOJu7GDEMg+2eG1l
	 TiBpRRzjZuUyU62By12RlMsrDLO57rra/GiGzRao+PO5fRUEx5MmSU4VAGuX5VtEZR
	 kp6+SrbOd6YjRt0iekynGOvmmvkUkmm4l31Rr99Ju16pMARGLmNt1jWSB41czto2lF
	 r4RxY4lndp0qdS2L1X8ciZv8RP+LOPFfaNIlJdgwEWAnIL9enVCwbxzD5eJdEtDE4U
	 BtKAEjZHT3iLmYaVw0qnq0RaN0p5iN9DXZnQLwkTFkI0lQ0r69IlwIJeunQGnvk+nq
	 bqLj5P0BknsbQ==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Wed, 27 May 2026 12:21:20 +0200
Subject: [PATCH net-next 6/6] net: airoha: Rename airoha_set_gdm2_loopback
 in airoha_enable_gdm2_loopback
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260527-airoha-eth-multi-serdes-preliminary-v1-6-ec6ed73ef7fc@kernel.org>
References: <20260527-airoha-eth-multi-serdes-preliminary-v1-0-ec6ed73ef7fc@kernel.org>
In-Reply-To: <20260527-airoha-eth-multi-serdes-preliminary-v1-0-ec6ed73ef7fc@kernel.org>
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: Simon Horman <horms@kernel.org>, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, netdev@vger.kernel.org, 
 Lorenzo Bianconi <lorenzo@kernel.org>
X-Mailer: b4 0.14.3
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

This is a preliminary patch in order to allow the user to select if the
configured device will be used as hw lan or wan.
Please not this patch does not introduce any logical changes, just
cosmetic ones.

Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/ethernet/airoha/airoha_eth.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/airoha/airoha_eth.c b/drivers/net/ethernet/airoha/airoha_eth.c
index 72c6f554508c..6574901ebd19 100644
--- a/drivers/net/ethernet/airoha/airoha_eth.c
+++ b/drivers/net/ethernet/airoha/airoha_eth.c
@@ -1796,7 +1796,7 @@ static int airoha_dev_set_macaddr(struct net_device *netdev, void *p)
 	return 0;
 }
 
-static int airoha_set_gdm2_loopback(struct airoha_gdm_dev *dev)
+static int airoha_enable_gdm2_loopback(struct airoha_gdm_dev *dev)
 {
 	struct airoha_gdm_port *port = dev->port;
 	struct airoha_eth *eth = dev->eth;
@@ -1877,7 +1877,7 @@ static int airoha_dev_init(struct net_device *netdev)
 		if (!eth->ports[1]) {
 			int err;
 
-			err = airoha_set_gdm2_loopback(dev);
+			err = airoha_enable_gdm2_loopback(dev);
 			if (err)
 				return err;
 		}

-- 
2.54.0


