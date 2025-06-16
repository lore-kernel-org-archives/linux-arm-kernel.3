Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9AF0C71155
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Jun 2025 15:26:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UQxngRC61Uvyaf7heid0CYRZb+2b06NqoHQ2sVEb88E=; b=eb4Ap/shMPRPtFX+okhIQIftf1
	hXjjvNuQOre70s6dRObxKqB5EvSeCe1HrbjVyJtj3UPvMcAtbsNc6+Jbesiz1hB9Md+dfUEmPh4+S
	B5WZpcjrotuu3ot60neYbLOgkA3mqjNYFhZFHrDM+73CagYatkt0MK0ktzSytfAvEtjkoRc/nKBZM
	r4m95MtFgq5IZqiVv+ccqeNUZVgbpO0zyIbE7GGz627hpWO0qknbU31Q12AvJLfukZhkq5+/rwSui
	uj+0+1041ruClEoYuesiXUjK2Cqhws23RbTfZDihDeJUs7k7Qq5TNJ5p+RCGQ7HX0UqtHpY9ekObM
	8XVq660g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRBjR-00000004q6Y-49Kj;
	Mon, 16 Jun 2025 15:26:45 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uR9fJ-00000004VJH-0U5n
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 16 Jun 2025 13:14:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=UQxngRC61Uvyaf7heid0CYRZb+2b06NqoHQ2sVEb88E=; b=TYYKq1udnXRpLlOBGKt8I4mT7G
	LhnmUgUJ1J2f/SvQqNZZR4NJGUdaCqLUdvOC+tbPTM9EsUYnKkmiqJaIJTBCIQ868cCWrOVTrcs4Q
	MZgDK6dH1AOjOvz9Kxf9jYmTwPDM96FnZaL96a0r9udOFEnsQBxYZCV39603G7f1K5zZP23QsS+FP
	aBrKEgUaUE0L+TTNLxKoSOoxVRaYuj8qmOldTwZe1TmaBK/4K3PTlEn/V9FsaUbwfZKeo9nXZdBex
	4cWNlG2ln5Kja9M/a9aidTU34/6scWu6mM7hL8sxtWx3gt6OZ+3LbxUYrJ/qxPuhcc1PQ7cEU8OUz
	oruqAlQg==;
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uR9fG-00000003aRw-2WNi
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Jun 2025 13:14:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1750079642;
	bh=UQxngRC61Uvyaf7heid0CYRZb+2b06NqoHQ2sVEb88E=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=f8NMQNQrnjxle8pqFs7cP3pruGNT7ANeAxYczqs/3t27gTO+phkNSIU2OC8MHECcx
	 o+Ibp4+Ga8sOvgeilUYQwizQ9godtzcqUGLNaj6TVH9KtiBdQlamPMe/vYtZXhVnwI
	 niy0z1l+6N7/e9C91p4b6Frcp1LclqmnQ3GdWvNmtkQAoDiho0sK1gbC89enfwFcqx
	 BZDonHrSyhchGOebClhm2/Z4dLxjSPjppmfNrj7xlpdEd5UfJma/3vrKkMyv3hOuVF
	 +wtD5JGX5/uzmkxbTFVHfAKE92vqqH4da+Js03Ptp4cvqklgKDKQvux1PipWBT6AUk
	 9EdaMrNh+i36A==
Received: from [127.0.1.1] (unknown [180.150.112.166])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id B6BB3686FF;
	Mon, 16 Jun 2025 21:14:01 +0800 (AWST)
From: Andrew Jeffery <andrew@codeconstruct.com.au>
Date: Mon, 16 Jun 2025 22:43:43 +0930
Subject: [PATCH v2 06/10] soc: aspeed: lpc-snoop: Rearrange channel paths
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250616-aspeed-lpc-snoop-fixes-v2-6-3cdd59c934d3@codeconstruct.com.au>
References: <20250616-aspeed-lpc-snoop-fixes-v2-0-3cdd59c934d3@codeconstruct.com.au>
In-Reply-To: <20250616-aspeed-lpc-snoop-fixes-v2-0-3cdd59c934d3@codeconstruct.com.au>
To: linux-aspeed@lists.ozlabs.org
Cc: Joel Stanley <joel@jms.id.au>, Henry Martin <bsdhenrymartin@gmail.com>, 
 Jean Delvare <jdelvare@suse.de>, 
 Patrick Rudolph <patrick.rudolph@9elements.com>, 
 Andrew Geissler <geissonator@yahoo.com>, 
 Ninad Palsule <ninad@linux.ibm.com>, Patrick Venture <venture@google.com>, 
 Robert Lippert <roblip@gmail.com>, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Andrew Jeffery <andrew@codeconstruct.com.au>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250616_141419_030191_2E6FDDD9 
X-CRM114-Status: GOOD (  12.23  )
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

Order assignments such that tests for conditions not involving resource
acquisition are ordered before those testing acquired resources, and
order managed resource acquisition before unmanaged where possible. This
way we minimise the amount of manual cleanup required.

In the process, improve readability of the code by introducing a channel
pointer that takes the place of the repeated object lookups.

Acked-by: Jean Delvare <jdelvare@suse.de>
Signed-off-by: Andrew Jeffery <andrew@codeconstruct.com.au>
---
 drivers/soc/aspeed/aspeed-lpc-snoop.c | 51 ++++++++++++++++++++---------------
 1 file changed, 29 insertions(+), 22 deletions(-)

diff --git a/drivers/soc/aspeed/aspeed-lpc-snoop.c b/drivers/soc/aspeed/aspeed-lpc-snoop.c
index e9d17239163a8ae5145bd3652fcec572b70bd11c..9992212c789d4224edcc0ee1a3bb9c73f9fc661b 100644
--- a/drivers/soc/aspeed/aspeed-lpc-snoop.c
+++ b/drivers/soc/aspeed/aspeed-lpc-snoop.c
@@ -194,28 +194,30 @@ static int aspeed_lpc_enable_snoop(struct aspeed_lpc_snoop *lpc_snoop,
 {
 	const struct aspeed_lpc_snoop_model_data *model_data;
 	u32 hicr5_en, snpwadr_mask, snpwadr_shift, hicrb_en;
+	struct aspeed_lpc_snoop_channel *channel;
 	int rc = 0;
 
-	if (WARN_ON(lpc_snoop->chan[index].enabled))
+	channel = &lpc_snoop->chan[index];
+
+	if (WARN_ON(channel->enabled))
 		return -EBUSY;
 
-	init_waitqueue_head(&lpc_snoop->chan[index].wq);
-	/* Create FIFO datastructure */
-	rc = kfifo_alloc(&lpc_snoop->chan[index].fifo,
-			 SNOOP_FIFO_SIZE, GFP_KERNEL);
+	init_waitqueue_head(&channel->wq);
+
+	channel->miscdev.minor = MISC_DYNAMIC_MINOR;
+	channel->miscdev.fops = &snoop_fops;
+	channel->miscdev.parent = dev;
+
+	channel->miscdev.name =
+		devm_kasprintf(dev, GFP_KERNEL, "%s%d", DEVICE_NAME, index);
+	if (!channel->miscdev.name)
+		return -ENOMEM;
+
+	rc = kfifo_alloc(&channel->fifo, SNOOP_FIFO_SIZE, GFP_KERNEL);
 	if (rc)
 		return rc;
 
-	lpc_snoop->chan[index].miscdev.minor = MISC_DYNAMIC_MINOR;
-	lpc_snoop->chan[index].miscdev.name =
-		devm_kasprintf(dev, GFP_KERNEL, "%s%d", DEVICE_NAME, index);
-	if (!lpc_snoop->chan[index].miscdev.name) {
-		rc = -ENOMEM;
-		goto err_free_fifo;
-	}
-	lpc_snoop->chan[index].miscdev.fops = &snoop_fops;
-	lpc_snoop->chan[index].miscdev.parent = dev;
-	rc = misc_register(&lpc_snoop->chan[index].miscdev);
+	rc = misc_register(&channel->miscdev);
 	if (rc)
 		goto err_free_fifo;
 
@@ -238,6 +240,7 @@ static int aspeed_lpc_enable_snoop(struct aspeed_lpc_snoop *lpc_snoop,
 		goto err_misc_deregister;
 	}
 
+	/* Enable LPC snoop channel at requested port */
 	regmap_update_bits(lpc_snoop->regmap, HICR5, hicr5_en, hicr5_en);
 	regmap_update_bits(lpc_snoop->regmap, SNPWADR, snpwadr_mask,
 			   lpc_port << snpwadr_shift);
@@ -246,14 +249,14 @@ static int aspeed_lpc_enable_snoop(struct aspeed_lpc_snoop *lpc_snoop,
 	if (model_data && model_data->has_hicrb_ensnp)
 		regmap_update_bits(lpc_snoop->regmap, HICRB, hicrb_en, hicrb_en);
 
-	lpc_snoop->chan[index].enabled = true;
+	channel->enabled = true;
 
 	return 0;
 
 err_misc_deregister:
-	misc_deregister(&lpc_snoop->chan[index].miscdev);
+	misc_deregister(&channel->miscdev);
 err_free_fifo:
-	kfifo_free(&lpc_snoop->chan[index].fifo);
+	kfifo_free(&channel->fifo);
 	return rc;
 }
 
@@ -261,7 +264,11 @@ __attribute__((nonnull))
 static void aspeed_lpc_disable_snoop(struct aspeed_lpc_snoop *lpc_snoop,
 				     enum aspeed_lpc_snoop_index index)
 {
-	if (!lpc_snoop->chan[index].enabled)
+	struct aspeed_lpc_snoop_channel *channel;
+
+	channel = &lpc_snoop->chan[index];
+
+	if (!channel->enabled)
 		return;
 
 	/* Disable interrupts along with the device */
@@ -280,10 +287,10 @@ static void aspeed_lpc_disable_snoop(struct aspeed_lpc_snoop *lpc_snoop,
 		return;
 	}
 
-	lpc_snoop->chan[index].enabled = false;
+	channel->enabled = false;
 	/* Consider improving safety wrt concurrent reader(s) */
-	misc_deregister(&lpc_snoop->chan[index].miscdev);
-	kfifo_free(&lpc_snoop->chan[index].fifo);
+	misc_deregister(&channel->miscdev);
+	kfifo_free(&channel->fifo);
 }
 
 static int aspeed_lpc_snoop_probe(struct platform_device *pdev)

-- 
2.39.5


