Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 979CE606A31B
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 13:57:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=WCGzEfav;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=B8QOpj9K;
	dkim=pass (2048-bit key, unprotected) header.d=microchip.com header.i=@microchip.com header.a=rsa-sha256 header.s=mchp header.b=Khh1TxW1
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=lpSsFBYMJOjp2UGoZuYwqoOaJecqtn3T+EOGB0fgaFo=; b=WCGzEfavr6Hes2
	xWdOJULDKshhgOsYYZaIKZyp/nYf+sExxNsj7ZqtlD5bD2+4TmNn0DvFCvD7lylDqsM6G0Pe0FSpW
	AqMqwFrCwZUHUP9crL4QuBGexdlkg987eOPrd/0efyzaC6NBBYj1bKyTy/33vA+z3a+iSAsxQjnsK
	ePlci/QuRZVvxSsEVZdZDU5prkGmZadYqm/qw09KaK5HEipNPYOtnr/QAffsscYKOnwJm3RacntTm
	T0xeyY1Z+G8N6C6DXnD/N9uewvPk1qemsEffxPQV0ujlnxCjYDNmKo8JdFeOy3qHluGWHY8ayx5RZ
	xcSzCUW5j9Fodl85AKSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOxyD-00000009C5i-0Tdd;
	Thu, 05 Nov 2026 13:57:37 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOxyB-00000009C3p-3dfH
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 05 Nov 2026 13:57:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=CC:To:In-Reply-To:References:
	Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=lpSsFBYMJOjp2UGoZuYwqoOaJecqtn3T+EOGB0fgaFo=; b=B8QOpj9KBuYjM3EIWjT5meMk6w
	S2b4OvIB1tQ0l22O6l85ZC2zFw1OKM/IZ+hqyqOHAUXl7v+mLAd6aCa9sxfZJcJTflNDbx5I9hExh
	3Xhak2zsn859qHNv2hrCtdZg4QM2Wu12koEB417p7/KmlERWkAt8yDxRKU8+iJyO4FWnuOQLNvvBx
	C/xhhMaPV2XrkXu4DZ0CezIObWrVFAIf9hOpNO9nkLgZINAT5W7Rq7ZxrBzLBIof4bH8//VTEXBfo
	my3DToDH9EANs0crzl9IrLQ1wHIZIMieBAgPeCPZVVPw55TZ2okYzuKAZKIvpL74dA9oKyzupeqEf
	VGEjBHzA==;
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOxy6-000000032uj-3XFz
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 13:57:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1793887050; x=1825423050;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=AS6YN7PNHmR1WJ7dk985HrdfIfCxE7SjW4P34crHnCQ=;
  b=Khh1TxW1hXLGmD+O9o8RRYZVXmIjB0xJo68sQPamjexmNiU5WKsiyP5H
   8krQs+5oHWhxvmpNNvGTDtefBw5BveKTrd9Yg6FtmXY0CujfPwY2QT71A
   orplqKAdCAUpu0/tH5YZcGKanu0NeEI77KuPfhw2ed40hbbTyeH1T8K0z
   iwfgRCPriEt/mSKUYPon4mCX1QVxIDpUBJhi1Qcohqna++ARJZ0R8Bpv/
   zFikiBScp4V4PlSo0P8NNWBSrTpy9P6udEpUt45s4NGY8gX8vf6t1eXZr
   EJMJSXQ6lgK3nOaxzL3pUmFE9HPBC9FliVP2SnRXPOkD++pGs9fBQHSdO
   w==;
X-CSE-ConnectionGUID: amQdPwc/QcGGi1gsnE7ZPQ==
X-CSE-MsgGUID: NHEDFOPLSp+8RCuKkxALqw==
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="65112466"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2026 06:57:23 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex4.mchp-main.com (10.10.87.33) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.56; Thu, 5 Nov 2026 06:57:23 -0700
Received: from DEN-DL-M70577.microsemi.net (10.10.85.11) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Thu, 5 Nov 2026 06:57:21 -0700
From: Daniel Machon <daniel.machon@microchip.com>
Date: Thu, 5 Nov 2026 14:56:44 +0100
Subject: [PATCH net-next 9/9] net: sparx5/lan969x: add support for changing
 the MTU
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20261105-sparx5-mtu-change-v1-9-f27bab580463@microchip.com>
References: <20261105-sparx5-mtu-change-v1-0-f27bab580463@microchip.com>
In-Reply-To: <20261105-sparx5-mtu-change-v1-0-f27bab580463@microchip.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
	<davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski
	<kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Steen Hegelund
	<Steen.Hegelund@microchip.com>, <UNGLinuxDriver@microchip.com>, "Richard
 Cochran" <richardcochran@gmail.com>, Russell King <linux@armlinux.org.uk>
CC: <netdev@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, Robert Marko <robert.marko@sartura.hr>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_135731_539000_8B5ECE4F 
X-CRM114-Status: GOOD (  26.67  )
X-Spam-Score: -2.5 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The MTU of a port is currently fixed to 1500, as the MAC maximum frame
length, the FDMA buffers, the queue watermarks and the TAS guard band
are all sized for a 1518 byte frame. The previous patches make the
buffers, watermarks and guard band follow the MTU, so changing the MTU
is a matter of programming the MAC and updating these.

Add an ndo_change_mtu callback that sets the MAC maximum frame length of
the port and resizes the FDMA buffers. The MAC must never accept frames
that are larger than the RX buffers, so when decreasing the MTU, the
maximum frame length is lowered before the buffers are shrunk, and when
increasing it, it is only raised once the buffers have been grown. The
new MTU is only published once the buffers fit it. If the buffers cannot
be grown, the MTU is not changed. If they cannot be shrunk, the current
buffers still fit all frames, so the new MTU is kept. Once the new MTU
is published, update the queue watermarks of the port and the TAS guard
band.

As the FDMA is shared by all ports, resizing its buffers briefly stops
CPU traffic on all ports. This only happens when the change affects the
buffer size needed for the largest MTU of the ports.

Register based extraction, which is used when the FDMA is not, sizes
its skbs from the MTU at the time a frame is read, so frames queued
before an MTU decrease would not fit. Therefore, only allow the MTU to be
changed when the FDMA is used.

The MACs of both Sparx5 and lan969x support frames of up to 14000 bytes,
so set the maximum MTU accordingly when the FDMA is used.

Signed-off-by: Daniel Machon <daniel.machon@microchip.com>
---
 .../net/ethernet/microchip/sparx5/sparx5_main.h    |  1 +
 .../net/ethernet/microchip/sparx5/sparx5_netdev.c  | 48 +++++++++++++++++++++-
 2 files changed, 48 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/microchip/sparx5/sparx5_main.h b/drivers/net/ethernet/microchip/sparx5/sparx5_main.h
index d150a76fc917e..181637b5f8f4a 100644
--- a/drivers/net/ethernet/microchip/sparx5/sparx5_main.h
+++ b/drivers/net/ethernet/microchip/sparx5/sparx5_main.h
@@ -110,6 +110,7 @@ enum sparx5_feature {
 #define SPX5_BUFFER_MEMORY     4194280 /* 22795 words * 184 bytes */
 #define SPX5_TAS_ENTRIES_PER_PORT 2 /* TAS lists per port */
 #define SPX5_HW_MTU(mtu)       ((mtu) + ETH_HLEN + ETH_FCS_LEN)
+#define SPX5_MAX_FRAME_LEN     14000 /* Max frame length supported by the MACs */
 
 #define XTR_QUEUE     0
 #define INJ_QUEUE     0
diff --git a/drivers/net/ethernet/microchip/sparx5/sparx5_netdev.c b/drivers/net/ethernet/microchip/sparx5/sparx5_netdev.c
index b3725cf2dd44c..095925752f5f6 100644
--- a/drivers/net/ethernet/microchip/sparx5/sparx5_netdev.c
+++ b/drivers/net/ethernet/microchip/sparx5/sparx5_netdev.c
@@ -250,6 +250,44 @@ static int sparx5_port_hwtstamp_set(struct net_device *dev,
 	return sparx5_ptp_hwtstamp_set(sparx5_port, cfg, extack);
 }
 
+static int sparx5_port_change_mtu(struct net_device *dev, int new_mtu)
+{
+	struct sparx5_port *port = netdev_priv(dev);
+	struct sparx5 *sparx5 = port->sparx5;
+	bool resize = new_mtu > dev->mtu;
+	int err;
+
+	/* Register based extraction sizes its skbs from the MTU at the time
+	 * a frame is read, so it cannot handle frames queued before an MTU
+	 * decrease.
+	 */
+	if (sparx5->fdma_irq <= 0)
+		return -EOPNOTSUPP;
+
+	/* Never let the MAC accept frames larger than the RX buffers */
+	if (!resize)
+		sparx5_port_max_len_set(sparx5, port, SPX5_HW_MTU(new_mtu));
+
+	err = sparx5->data->ops->fdma_resize(sparx5, port, new_mtu);
+	if (err) {
+		if (resize)
+			return err;
+
+		/* The current, larger, buffers still fit all frames */
+		netdev_warn(dev, "Failed to resize FDMA buffers: %d\n", err);
+	}
+
+	WRITE_ONCE(dev->mtu, new_mtu);
+
+	sparx5_port_wm_update(sparx5, port);
+	sparx5_tas_gb_update(sparx5);
+
+	if (resize)
+		sparx5_port_max_len_set(sparx5, port, SPX5_HW_MTU(new_mtu));
+
+	return 0;
+}
+
 static const struct net_device_ops sparx5_port_netdev_ops = {
 	.ndo_open               = sparx5_port_open,
 	.ndo_stop               = sparx5_port_stop,
@@ -257,6 +295,7 @@ static const struct net_device_ops sparx5_port_netdev_ops = {
 	.ndo_set_rx_mode_async  = sparx5_set_rx_mode,
 	.ndo_get_phys_port_name = sparx5_port_get_phys_port_name,
 	.ndo_set_mac_address    = sparx5_set_mac_address,
+	.ndo_change_mtu         = sparx5_port_change_mtu,
 	.ndo_validate_addr      = eth_validate_addr,
 	.ndo_get_stats64        = sparx5_get_stats64,
 	.ndo_get_port_parent_id = sparx5_get_port_parent_id,
@@ -306,7 +345,14 @@ int sparx5_register_netdevs(struct sparx5 *sparx5)
 
 	for (portno = 0; portno < sparx5->data->consts->n_ports; portno++)
 		if (sparx5->ports[portno]) {
-			err = register_netdev(sparx5->ports[portno]->ndev);
+			struct net_device *ndev = sparx5->ports[portno]->ndev;
+
+			/* The MTU can only be changed when FDMA is used */
+			if (sparx5->fdma_irq > 0)
+				ndev->max_mtu = SPX5_MAX_FRAME_LEN - ETH_HLEN -
+						ETH_FCS_LEN;
+
+			err = register_netdev(ndev);
 			if (err) {
 				dev_err(sparx5->dev,
 					"port: %02u: netdev registration failed\n",

-- 
2.34.1


