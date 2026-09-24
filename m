Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 377FDC9831F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Sep 2026 13:51:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t9iLsnAODx2rF847XvroFh/ns6W9jfoyO6c4E8bJMN4=; b=ZeYTKIzS7+85rbzjPMCa1NQwsz
	WSOwtf4EM/HMYUtkMJPJiPRp9aV+AVPQZNuDu6BQCX1dTuTAzTGmUXEvzaBHC8Q+D9ZxIbj8RPtoP
	sGxeF++XKIyUvqjUSb4UHn564mbFMddZccRV2fUx0R3Gx8Hlg+eLN4M22mrrXfDP5s8fYTGu8J6+H
	TVn4DIFl+VQwQQddt8wmQMKNs3rHQYHku7H1th5488PH31ZyKfAx8SGMUECqlfvvL7HifmgRJV6Tq
	GeTokeSeryUGFJTnHM7v7AdxAtq1g+YyfvGjkubcN8K0ioyicz6Bw4/GcV0q6mSKdiv1ZDQa3F7DU
	Sw9kDxOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9jrK-0000000B8UF-10VY;
	Thu, 24 Sep 2026 13:51:34 +0000
Received: from mail-wr2-x0f.google.com ([2a00:1450:4864:30::f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9jrC-0000000B8Pu-3RG3
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Sep 2026 13:51:27 +0000
Received: by mail-wr2-x0f.google.com with SMTP id ffacd0b85a97d-4885a1480a2so1226485f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Sep 2026 06:51:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790257885; x=1790862685; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=t9iLsnAODx2rF847XvroFh/ns6W9jfoyO6c4E8bJMN4=;
        b=DOFw0wYcu6IslhSUi3UjzJv3LxMjtkw+XZEc3aqQxNyQYDabP2LqYN23DIzW60NCwO
         1llqCeuf+nQcEFJNpfQctDFvyRblphO6LjW0HUlepZhspQFdmZt56YfMYA5+9dajobxe
         A/lUyJT6r9qetLe3wyvYC/0uEkM4XWa+rKl6sqLhilJJDHqByM/uV3GZND47vfVd5dLj
         r9ksxGFgcV8Hi+4nz3dEfyqsue61QdXjY8NEi/cDjgyoqNux25Moa3O5Uw2gGPe7TyUN
         QMCbpTyeTo94lzyCUkATJGwkzI7p8ki3Hp5qH6w343IUdO4N7Ols+qk0YljqecjSqIhD
         zxDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790257885; x=1790862685;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=t9iLsnAODx2rF847XvroFh/ns6W9jfoyO6c4E8bJMN4=;
        b=e4bty1p1mbV79N9B+i7aWelk2nB7KinJxt8RBT+hg75KpkXbwfrtj8Ts5BU3lOMm8Q
         LsQBbbkiUsmKaQZQQmYgAa2aco0rwyJrl0Kwg8cM5UgSRifXOIIQWVsV4fo65CGu4Ngz
         Oem32WsCDd/cTRJMyFPDL5OfVtYz46KCajYgsmC3by4PqOoo5jyj51kWIG3ustnzPVEY
         3FC73LFr/A/nlU8ub4u9olSN/MWtuZlv2zsMRFiAAkjk/PX/XIkOQEUPPW7GbsYc6O42
         3zU9wym7Ovz/uVGsYcF8x24i1VNXiqgpDI98/Esyy1dPYo6GTOJaJMCRy8+NNMN0Euzf
         x+yw==
X-Forwarded-Encrypted: i=1; AKwUvBxkcLS/dBsIC1puyTR045Krw62OoRnsUZw8+rki4QVk9lc9mOIJBkMYlP25vefxkCDIZbxkQQX3tvNXSyCELRGl@lists.infradead.org
X-Gm-Message-State: AFuF++lsKJxdyVzAPRPRySeUrMdOjigF9zkOoMRDs5f6dvA1UXlONxgv
	RY2tKwOOIxz2oZF7LfXE894kMsRXzLMrBQS398ov+NlrpheuxJEHBSL6
X-Gm-Gg: AYBFou3ZNLNoKRHo4mzV5lsS+7bxxkKWNappxdGX4Q+gVk4ZI8FqtVMw96k4pepDFJ5
	nGhGPFandCcEPBfjbIQZQlauyFBajMZxfydw4fjMR6iMNMvR/wBx4cuKXDssnFcDsk4Bhfc1jnN
	0iUyXZqcoKPcw7dGiV/xy9WgvJWrPdrDXzi8SCXE+4tJaeLQkPYDlpEXDcSg7AJ3voNiMgcjk53
	ueICC2X2mEgKcJag0g9EVw0q52O3xfKKJc32IiHk3AbMk39qLdrSbtFP//lYC00TWeB4a1XtLK9
	DAwzS9pAd8SwFcvI2RALVl3JIjCaEY6VNiP2Vru/TaXRMaFtwZhjhgOzSrvScsBj7yKKUVbKdxn
	YwLFP58Fbn2N6x3O/arBOWxmBSG+s/H/pfxT3afEm9BwnH2B3hbAy9GQBxtXmwao2Wd/tDHZYvN
	wdKPR5YPFyPckX2KAVthUQlIAaZGGtdZWObbVeXZ48FahukgqaXLnrw66r7UvzytUA7NysMRX1a
	GX9xuCueS6PPLSbXqnfSIHUXQbE304TwE7swDEl
X-Received: by 2002:a5d:5d87:0:b0:482:fb60:2f0 with SMTP id ffacd0b85a97d-488716b2841mr5288900f8f.8.1790257884978;
        Thu, 24 Sep 2026 06:51:24 -0700 (PDT)
Received: from fedora-tap.advaoptical.com ([82.166.23.19])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48868889376sm12060660f8f.33.2026.09.24.06.51.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 06:51:24 -0700 (PDT)
From: Sagi Maimon <maimon.sagi@gmail.com>
To: netdev@vger.kernel.org
Cc: radhey.shyam.pandey@amd.com,
	michal.simek@amd.com,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	linux@armlinux.org.uk,
	daniel@iogearbox.net,
	andybnac@gmail.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Sagi Maimon <maimon.sagi@gmail.com>
Subject: [PATCH net v2 2/4] net: axienet: quiesce the TX path before axienet_stop() tears it down
Date: Thu, 24 Sep 2026 16:51:14 +0300
Message-ID: <20260924135116.185161-3-maimon.sagi@gmail.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20260924135116.185161-1-maimon.sagi@gmail.com>
References: <20260924135116.185161-1-maimon.sagi@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260924_065126_895268_9129937E 
X-CRM114-Status: GOOD (  15.70  )
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

On the legacy DMA path axienet_stop() stops the DMA engine and frees the
TX descriptor ring with axienet_dma_bd_release(), but never stops the
transmit queue or waits for a transmit already in progress.

On the dev_close() path this is covered by the core:
dev_deactivate_many() has already quiesced the qdisc and waited for
in-flight transmits with synchronize_net().  axienet_suspend() instead
calls axienet_stop() directly.  Its netif_device_detach() only sets
__QUEUE_STATE_DRV_XOFF, without taking the transmit lock, so an
axienet_start_xmit() that was already running can still be writing a
descriptor into lp->tx_bd_v, or kicking XAXIDMA_TX_TDESC, while the
engine is reset and the ring is freed underneath it.

Call netif_tx_disable() once TX NAPI is disabled and the error work has
been flushed.  It takes each queue's transmit lock, so it waits for any
transmit in progress, and nothing can wake the queue afterwards: the
error work returns early once lp->stopping is set, and axienet_tx_poll()
can no longer run.

The dmaengine path is left as it is.  There the completion callback can
wake the queue until the channel has been terminated, so it would need a
different ordering.

Tested on an AXI Ethernet MAC behind a PCIe endpoint: traffic passes,
and after each of ten down/up cycles and five module reloads, all made
with traffic running and each running this path, traffic resumes and
nothing is logged.  Suspend was not exercised.

Fixes: a3de357b087e ("net: axiemac: add PM callbacks to support suspend/resume")
Assisted-by: LLM sparse
Signed-off-by: Sagi Maimon <maimon.sagi@gmail.com>
---
 drivers/net/ethernet/xilinx/xilinx_axienet_main.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/net/ethernet/xilinx/xilinx_axienet_main.c b/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
index fb26d2e39fac..6d448d0b523d 100644
--- a/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
+++ b/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
@@ -1739,6 +1739,14 @@ static int axienet_stop(struct net_device *ndev)
 
 		napi_disable(&lp->napi_tx);
 		napi_disable(&lp->napi_rx);
+
+		/* Nothing can wake the queue now: the error work returns early
+		 * once lp->stopping is set, and TX NAPI is disabled.  Stop it and
+		 * wait out any transmit in progress before the ring goes away.
+		 * dev_close() has already done this, but axienet_suspend() calls
+		 * us directly.
+		 */
+		netif_tx_disable(ndev);
 	}
 
 	cancel_work_sync(&lp->rx_dim.work);
-- 
2.47.0


