Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15A0BFC97F9
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 29 Mar 2026 22:04:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=dUdOr+EVEBlpgTcz0k0y+EyAFhkceT4EL0v0ts4IUYs=; b=bxLlJwygmfm4eWtdmft1GGMa1A
	rdmQ7wfiroV7kFHsfc2eodap/qpqI+SmgIwL8dFvvljE1pwAuz44TvBh1yf4QAKYboiVlICxgEKNy
	L1bzKKhNCNKnA/nY53nzIp8e6tHtemp9N2LL3pLB6dK2uYHQLhZfKqIKPXRpww8QKZZkPmX24idb4
	M/NvHujKYqsT5nU6cz8Mgf10NVDxfuz1XlUwbm9WlLypFPNmxw28h7BWx3O2Cas48vNviJ0oQ+uRH
	c7GSrS4/ltpsEE0qzc5n4FoPdEwdoQIswiEZD0G4ioJme5clZ+IiMhKOdtWpDIM6Pu6r66jwTT42J
	f6ktZZJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6yEj-0000000AMlU-3mHq;
	Sun, 29 Mar 2026 22:04:01 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6yEh-0000000AMl5-1zzw;
	Sun, 29 Mar 2026 22:04:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id AC21D44438;
	Sun, 29 Mar 2026 22:03:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39119C116C6;
	Sun, 29 Mar 2026 22:03:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774821838;
	bh=6yn7EwahshMP7t8gqyl8uwicrBe/9zbJ4Uog9xwOHv0=;
	h=From:Date:Subject:To:Cc:From;
	b=ZAfRSMz0wkc+I1P/TrrvJfqM2Aq9vVJMq62NhtG6qrQkyvL4HCmwEhUVoKFd4lI5h
	 4GpnaiCeG0k8vEEUsxIwlbGcG5hyylgYGnt25APxWcuNFL+eqn+sOTIrXsqXaoZQPQ
	 ftrR0nITFRxSUx6C3YjIinCn2R0klplk16HU37jieJnotbKuOh3VeDyKUEO3S6tU14
	 CNtN4q7iKFjYiPNd6Iy/qjkBtnc85evSC6Xjhxud7m8wRlQsz5x16bVfi6bQoYe+jd
	 6Nbb8I/SnUEaw9ZXXb6NJQnZFWyqgUdWlPsWTkds/2aw+FYhjxU6suBjY5DVqgJBEX
	 qgp0PteYCkiMQ==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Mon, 30 Mar 2026 00:03:49 +0200
Subject: [PATCH net-next] net: airoha: Fix typo in airoha_set_gdm2_loopback
 routine name
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260330-airoha_set_gdm2_loopback-fix-typo-v1-1-a1320ff6b6cc@kernel.org>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x2NQQrDIBAAvxL23AU1NdB+pRSxZpMsbV1RKSkhf
 4/kOAzMbFAoMxW4dxtk+nFhiQ30pYOw+DgT8tgYjDKD6s0NPWdZvCtU3Tx+jfuIpJcPb5x4xfp
 PgoGs7rWy18kO0DopU3Pn4wGRKkZaKzz3/QCPiBUufQAAAA==
X-Change-ID: 20260329-airoha_set_gdm2_loopback-fix-typo-ce5131054f56
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, netdev@vger.kernel.org, 
 Lorenzo Bianconi <lorenzo@kernel.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260329_150359_546446_5F1E4EBD 
X-CRM114-Status: GOOD (  10.17  )
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

Rename airhoha_set_gdm2_loopback() in airoha_set_gdm2_loopback()

Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/ethernet/airoha/airoha_eth.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/airoha/airoha_eth.c b/drivers/net/ethernet/airoha/airoha_eth.c
index 82e53c60f561f6314fbf201ba8bc8711e40edc68..2beba017e791d20f142e754edafcd402d8cc496f 100644
--- a/drivers/net/ethernet/airoha/airoha_eth.c
+++ b/drivers/net/ethernet/airoha/airoha_eth.c
@@ -1709,7 +1709,7 @@ static int airoha_dev_set_macaddr(struct net_device *dev, void *p)
 	return 0;
 }
 
-static int airhoha_set_gdm2_loopback(struct airoha_gdm_port *port)
+static int airoha_set_gdm2_loopback(struct airoha_gdm_port *port)
 {
 	struct airoha_eth *eth = port->qdma->eth;
 	u32 val, pse_port, chan, nbq;
@@ -1785,7 +1785,7 @@ static int airoha_dev_init(struct net_device *dev)
 		if (!eth->ports[1]) {
 			int err;
 
-			err = airhoha_set_gdm2_loopback(port);
+			err = airoha_set_gdm2_loopback(port);
 			if (err)
 				return err;
 		}

---
base-commit: cf0d9080c6f795bc6be08babbffa29b62c06e9b0
change-id: 20260329-airoha_set_gdm2_loopback-fix-typo-ce5131054f56

Best regards,
-- 
Lorenzo Bianconi <lorenzo@kernel.org>


