Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5066CCD98D5
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Jun 2026 23:12:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Date:From:
	Message-ID:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=32LA4oVKRlobt0c3JKXFPxQfDW1KytgL05KrQQdvsrs=; b=Hh6/Wk8ADxeVBl+vYbjtF2PJm3
	oNAW5C3xD3+9YtpFdbJ2QVeA6DewJxt8JOplX9aODPha9fednGpUY75lCh+y72AJ/uZTiEKYhJ1Si
	+hHuxSmgtDR8nIdrrE0rOgsjhj8Y3sfbXMiuSINqY1SFHxQwI44H5c2CIi5/QbfxfEENzvdbDpHuN
	K5HC/QCkJ3Uv45EMPpvu/3M6azA8aw4YGrbWOyfqn8bNq1jHm/LEhx8KKoWOSAF0BNVuERJQ12cwp
	WGsWb//mTAR/5o9usg3PEJ6SwYL75jHi6LXxDwarTro3QgWG6aoueosvdbMSZ0+EuW6Np2ocnVfVy
	ET9kSJ2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXoZn-0000000AA6e-1yIX;
	Thu, 11 Jun 2026 23:12:43 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXoZk-0000000AA4y-3eYV
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Jun 2026 23:12:41 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-842307472d4so198001b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 11 Jun 2026 16:12:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781219560; x=1781824360; darn=lists.infradead.org;
        h=cc:to:subject:date:from:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=32LA4oVKRlobt0c3JKXFPxQfDW1KytgL05KrQQdvsrs=;
        b=opV4sKUBbmoGI9Lzk4LhJTEdVpMSGPPZe9yO9Iq858M+m+x+FsUE6Qj703AAjwAm2O
         zEynsl4YzTKw/vBH9/EbqY+czim9WOggYzOHHmzwbfnbBQpmTKWrhztHc65jxilDtue0
         NuJ7nJBHH2tIfL4/bIzza8wTUBLb2fFs7rGukaSPjcAwvft48R6/emNZX7J40MNIUblg
         A+ef7q4H2nUlnL/ZtK/hKlpAXuZ8oYAo/pPuXFoPavgSBTA1ngXhSfROTUuPh2QRcT0s
         rxrLw9N+ZPjlXO6qPzZUVGUjgWzDEImGtD2SGFIQQTBiyIRDFiRftGh/JnjD82oerszG
         oqog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781219560; x=1781824360;
        h=cc:to:subject:date:from:message-id:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=32LA4oVKRlobt0c3JKXFPxQfDW1KytgL05KrQQdvsrs=;
        b=OecyQsoJktsS27mQBdEl7lhkMN+Bwwt2LkxIGAH8bWGhZ4y2n/1wXS7g/Tkxht+ltT
         j9bgVvwYxXog0QlCcFcf6pu4ScEN+RC+zLfxD/7uW4j6f6ibXJmPmM1Dv1q5a/3XVa1i
         azYC1jQr4ke1TX1wZy/0/YFTIFnCzdALF0ye48NlQPS6mJHC5PR0zUDt+pWdm2KiVr2J
         cufCxZi6nPX2BZRFLS/BdhO7zmAPg5KJnWKgxxjz78edj5KUWVC7c/9F6ig78mrUvtaY
         q97HXJUW8VAX+Rc9FOXp42DeqkltvAURe+tQcuCkMk15aGS+74awupXBP+AFP7KMWd1z
         If7g==
X-Forwarded-Encrypted: i=1; AFNElJ+sNFqAPLOfYHcMtMaH90rbB6GyaSJSEo6aHkexahy+UDrUtbEeuGa01jHD4vIWqnQyicJryFWt5DNOUGABfJBU@lists.infradead.org
X-Gm-Message-State: AOJu0Yz6bhC9bUBdoixmTbrJI9Vn3uceEd9w4+W88A+gb1HCjgX0cZEf
	4NIqU2PkFIMzF1NSkrt+IYq3cNvAbpW3mVu5Gxekd0e2m5vhEf3MqtWX
X-Gm-Gg: Acq92OF0s464fX/ewOdTp0MvgxrsKOnKjJNl6NGMcew66QF1t+5qyCRp6cpGw98SrKS
	ykIrqx+7ME2O9fJRXXJKC0TZ7hyFhEw+ZRjI3kGh9Duj36fRsHimoQ8/mCNM/2X2UBU1SAfWPsB
	HG6XlDh5TSlBDHKmxEQOmqInPpb9R6KNF4QZ1X7O/bW1oYMIfjrKTZjBZuKacbSrYER9qfd6dsz
	1xGneXugx1fGZYnSnKwKu6NOXSKvnwbXca6ndorDmscZig/qaQsi6gniqK9BvQUAsIHaKQ7cCuU
	TL+82YYWWTxRcbJwwegJKOJxz/kySzhm9kY+5V/tm2ZtvN2hcDuR+n3jefj5xU6yDJRH+Jq4Uvs
	eHLoMEwjrpCDC8lD6/iMUzLHOc9SBIthRPLwnwAe03CN0eqz2urJXDWkeJHVIUbZraXfaiE8VS6
	j+UhLsTMokNbhNj7OU
X-Received: by 2002:a05:6a00:4f8e:b0:842:6a97:52f7 with SMTP id d2e1a72fcca58-8434ceddc63mr106827b3a.19.1781219559923;
        Thu, 11 Jun 2026 16:12:39 -0700 (PDT)
Received: from [127.0.1.1] ([47.253.114.73])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8434afd100esm199571b3a.34.2026.06.11.16.12.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 16:12:39 -0700 (PDT)
Message-ID: <6a2b40e7.4dd82583.3a5c46.e566@mx.google.com>
From: "Wayen.Yan" <win847@gmail.com>
Date: Fri, 12 Jun 2026 07:09:13 +0800
Subject: [PATCH] net: airoha: Fix register index for Tx-fwd counter
 configuration
To: netdev@vger.kernel.org
Cc: lorenzo@kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260611_161240_902092_B421BE88 
X-CRM114-Status: GOOD (  10.67  )
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

In airoha_qdma_init_qos_stats(), the Tx-fwd counter configuration
register uses the same index (i << 1) as the Tx-cpu counter, which
overwrites the Tx-cpu configuration. The Tx-fwd counter value register
correctly uses (i << 1) + 1, so the configuration register should use
the same index.

Fix the REG_CNTR_CFG index from (i << 1) to ((i << 1) + 1) so that
the Tx-fwd counter is properly configured instead of clobbering the
Tx-cpu counter config.

Fixes: 20bf7d07c956 ("net: airoha: Add sched ETS offload support")
Signed-off-by: Wayen.Yan <win847@gmail.com>
---
 drivers/net/ethernet/airoha/airoha_eth.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/airoha/airoha_eth.c b/drivers/net/ethernet/airoha/airoha_eth.c
index 31cdb11..329988a 100644
--- a/drivers/net/ethernet/airoha/airoha_eth.c
+++ b/drivers/net/ethernet/airoha/airoha_eth.c
@@ -1256,7 +1256,7 @@ static void airoha_qdma_init_qos_stats(struct airoha_qdma *qdma)
 			       FIELD_PREP(CNTR_CHAN_MASK, i));
 		/* Tx-fwd transferred count */
 		airoha_qdma_wr(qdma, REG_CNTR_VAL((i << 1) + 1), 0);
-		airoha_qdma_wr(qdma, REG_CNTR_CFG(i << 1),
+		airoha_qdma_wr(qdma, REG_CNTR_CFG((i << 1) + 1),
 			       CNTR_EN_MASK | CNTR_ALL_QUEUE_EN_MASK |
 			       CNTR_ALL_DSCP_RING_EN_MASK |
 			       FIELD_PREP(CNTR_SRC_MASK, 1) |
-- 
2.51.0



