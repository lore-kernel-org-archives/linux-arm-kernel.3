Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43384C71155
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Jun 2025 15:26:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VfLRozBujaOByO5oe+/e5VFOdNzdj4Ycb5lWP+iT5j0=; b=Qh/En1KCq5AF+n/wzWpMVA1aNm
	Jzr8Wmlcmh5Kt8DGMPmr/7qSByl6sASpeObqjRqme08NMRSlPCsCfa30FWSZRWBcx21jsVtumVKKo
	/vzDKTo/xss13UxujTitVNROFq+HaVu//GWQpaGVllvHRC1TtDt4iIcQdpITj9Kir2Xrv0TebY8DE
	HNwvvd1Hh/dAaMBX/oNDnjtrKu8fEJq0OYLz9c49+DvEJminRQhfCApzoSqQLMXhUYZiS2zcI9bXD
	maihFpXvbbfwyipRO0KCj/auSCmMynWavoBlK5OEfv/DutM+IX3jjtMetP3eJaV2ISlB2bRZ4WYV6
	z0QLhfCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRBjM-00000004pxr-2Lnx;
	Mon, 16 Jun 2025 15:26:40 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uR9fG-00000004VIf-0jQt
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 16 Jun 2025 13:14:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=VfLRozBujaOByO5oe+/e5VFOdNzdj4Ycb5lWP+iT5j0=; b=MEOfbRMzz7aE6WSYgNJeR0EM9f
	TRfG2TV9iOO4zmODaR120xk/PSqMxiOeoeQI8X3quHAHPMCxMQS680VlFRhdPdFHzCNdahda/N90G
	jyLoPF9CKhQ28H3A848vCwJ19P8oCi1FsXKcXTIebJWiwzFGXRabkPikCkjgGsdLP63OFawaufCJy
	IPneMUOuCfrIPdzb/X6lxyindJ66ClW+qGHBFEsIqkoO6oeOKjsvLdvUeMgkagejQEiV8IGcxBif2
	i4nOjiIJvtW2/AxFtnN70hHshQGFVG6NYZyQrfQffLueHXT+TYW1XXuosyu++2Tzh/YAiqVKzR10R
	1HHT1sMQ==;
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uR9fB-00000003aQE-3F6p
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Jun 2025 13:14:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1750079639;
	bh=VfLRozBujaOByO5oe+/e5VFOdNzdj4Ycb5lWP+iT5j0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=dly/STbTbitCQFrQxGFjzubD7pvkiPc2fD2pHhn7kSDZAdj8+1n+1yprkUy834Z/1
	 Tz7SS9azbqbu0Si2ANOjfzI+YyJ+uHyg5mxScX+NeDPvpEj5Uk3bhJUjld0MfK7sUU
	 t7al5Qoa3yh7gZgujTXySn0CbppqmWigfN3inXlGAJI5bcvsOJ0pnafbHw2vU05GuN
	 p/8GWWio2yJUAJ5htskd6b262YLfXxYbIm5pmhNKFVwF5fqZYKWq5OcOHDNTwQZ6bT
	 XwWom+JX4Plp9LREtq7nHlsd/fTBO4DEpPQRtRoIDN9CtGiHa5SGZPM4RrfvuqU0ow
	 ++bvZla3Bae1A==
Received: from [127.0.1.1] (unknown [180.150.112.166])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 72A406883E;
	Mon, 16 Jun 2025 21:13:58 +0800 (AWST)
From: Andrew Jeffery <andrew@codeconstruct.com.au>
Date: Mon, 16 Jun 2025 22:43:39 +0930
Subject: [PATCH v2 02/10] soc: aspeed: lpc-snoop: Don't disable channels
 that aren't enabled
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250616-aspeed-lpc-snoop-fixes-v2-2-3cdd59c934d3@codeconstruct.com.au>
References: <20250616-aspeed-lpc-snoop-fixes-v2-0-3cdd59c934d3@codeconstruct.com.au>
In-Reply-To: <20250616-aspeed-lpc-snoop-fixes-v2-0-3cdd59c934d3@codeconstruct.com.au>
To: linux-aspeed@lists.ozlabs.org
Cc: Joel Stanley <joel@jms.id.au>, Henry Martin <bsdhenrymartin@gmail.com>, 
 Jean Delvare <jdelvare@suse.de>, 
 Patrick Rudolph <patrick.rudolph@9elements.com>, 
 Andrew Geissler <geissonator@yahoo.com>, 
 Ninad Palsule <ninad@linux.ibm.com>, Patrick Venture <venture@google.com>, 
 Robert Lippert <roblip@gmail.com>, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Andrew Jeffery <andrew@codeconstruct.com.au>, 
 stable@vger.kernel.org
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250616_141414_617753_31E9A493 
X-CRM114-Status: GOOD (  10.34  )
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

Mitigate e.g. the following:

    # echo 1e789080.lpc-snoop > /sys/bus/platform/drivers/aspeed-lpc-snoop/unbind
    ...
    [  120.363594] Unable to handle kernel NULL pointer dereference at virtual address 00000004 when write
    [  120.373866] [00000004] *pgd=00000000
    [  120.377910] Internal error: Oops: 805 [#1] SMP ARM
    [  120.383306] CPU: 1 UID: 0 PID: 315 Comm: sh Not tainted 6.15.0-rc1-00009-g926217bc7d7d-dirty #20 NONE
    ...
    [  120.679543] Call trace:
    [  120.679559]  misc_deregister from aspeed_lpc_snoop_remove+0x84/0xac
    [  120.692462]  aspeed_lpc_snoop_remove from platform_remove+0x28/0x38
    [  120.700996]  platform_remove from device_release_driver_internal+0x188/0x200
    ...

Fixes: 9f4f9ae81d0a ("drivers/misc: add Aspeed LPC snoop driver")
Cc: stable@vger.kernel.org
Cc: Jean Delvare <jdelvare@suse.de>
Acked-by: Jean Delvare <jdelvare@suse.de>
Signed-off-by: Andrew Jeffery <andrew@codeconstruct.com.au>
---
 drivers/soc/aspeed/aspeed-lpc-snoop.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/soc/aspeed/aspeed-lpc-snoop.c b/drivers/soc/aspeed/aspeed-lpc-snoop.c
index 59c18afa649cd672f54f947066f468f2a78c0d5d..fc3a2c41cc10739f5f70ded7ac02baab6468d652 100644
--- a/drivers/soc/aspeed/aspeed-lpc-snoop.c
+++ b/drivers/soc/aspeed/aspeed-lpc-snoop.c
@@ -58,6 +58,7 @@ struct aspeed_lpc_snoop_model_data {
 };
 
 struct aspeed_lpc_snoop_channel {
+	bool enabled;
 	struct kfifo		fifo;
 	wait_queue_head_t	wq;
 	struct miscdevice	miscdev;
@@ -190,6 +191,9 @@ static int aspeed_lpc_enable_snoop(struct aspeed_lpc_snoop *lpc_snoop,
 	const struct aspeed_lpc_snoop_model_data *model_data =
 		of_device_get_match_data(dev);
 
+	if (WARN_ON(lpc_snoop->chan[channel].enabled))
+		return -EBUSY;
+
 	init_waitqueue_head(&lpc_snoop->chan[channel].wq);
 	/* Create FIFO datastructure */
 	rc = kfifo_alloc(&lpc_snoop->chan[channel].fifo,
@@ -236,6 +240,8 @@ static int aspeed_lpc_enable_snoop(struct aspeed_lpc_snoop *lpc_snoop,
 		regmap_update_bits(lpc_snoop->regmap, HICRB,
 				hicrb_en, hicrb_en);
 
+	lpc_snoop->chan[channel].enabled = true;
+
 	return 0;
 
 err_misc_deregister:
@@ -248,6 +254,9 @@ static int aspeed_lpc_enable_snoop(struct aspeed_lpc_snoop *lpc_snoop,
 static void aspeed_lpc_disable_snoop(struct aspeed_lpc_snoop *lpc_snoop,
 				     int channel)
 {
+	if (!lpc_snoop->chan[channel].enabled)
+		return;
+
 	switch (channel) {
 	case 0:
 		regmap_update_bits(lpc_snoop->regmap, HICR5,
@@ -263,6 +272,8 @@ static void aspeed_lpc_disable_snoop(struct aspeed_lpc_snoop *lpc_snoop,
 		return;
 	}
 
+	lpc_snoop->chan[channel].enabled = false;
+	/* Consider improving safety wrt concurrent reader(s) */
 	misc_deregister(&lpc_snoop->chan[channel].miscdev);
 	kfifo_free(&lpc_snoop->chan[channel].fifo);
 }

-- 
2.39.5


