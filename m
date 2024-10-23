Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C062CCDDE71
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Oct 2024 11:47:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q6UEkGwUFzGOcO+4bwVtY0YeicQY+PtdzCTn2x/2rOY=; b=v7JWhzizr4WfCkgbs+G7oQDFa9
	f4uM8jNL+zSZfX3cYkFgKO4xU+/Il3no/qmAIK8mGkasWn+ZwuugoMGMaz8WFjkLRdiwdrafFcQUn
	556ZTLZnB4NbON5E9dX8Oi70Svt4qxuAGuKEXKR2/3nltLzRxAUQMppaJf4UbbAsL2OT/q7OUbkxd
	L8vynU5bkHHM1FkCp77O/rySdJi21eBv35U3EvPvrDtru/4FVqwYVp9EV/x0mPV9ZN0t9ZF9DVsRZ
	Hra+IFfdw7kZA+J0hevarOLBTK+5fZ1TO2pKLQGkrrnoNJEuSlfdg6ErjSi5y4JKebxRy7jRieY+n
	kV0VclJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3ZpH-0000000EBxe-00sk;
	Wed, 23 Oct 2024 11:46:55 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3ZAZ-0000000E4wF-2Eoy;
	Wed, 23 Oct 2024 11:04:52 +0000
Received: from umang.jain (unknown [IPv6:2405:201:2015:f873:55d7:c02e:b2eb:ee3f])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8FC0C82A;
	Wed, 23 Oct 2024 13:03:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1729681383;
	bh=LkuPDmiNtkyAPKPo4egoogY7JtPMRLPdsJI6n3MyepI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=i930unMxxKJk61w5glqBMGlPx8fpx1QlG296saJ3vVnQXJTohHtxKqTTlMDs7R3+j
	 WEg2ysFoFU+xAZo0jLuvzu81R48FSoSb4mTUfjb0t5AyEGhmuRhYMjgHNMjG73qQCz
	 YVfNkD2EsP7Oi+leWbTKjtV2c7wxtuMDILyIoDqg=
From: Umang Jain <umang.jain@ideasonboard.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Stefan Wahren <wahrenst@gmx.net>,
	kernel-list@raspberrypi.com,
	Umang Jain <umang.jain@ideasonboard.com>
Subject: [PATCH 3/6] staging: vchiq_core: Rename struct vchiq_bulk 'userdata'
Date: Wed, 23 Oct 2024 16:34:03 +0530
Message-ID: <20241023110406.885199-4-umang.jain@ideasonboard.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241023110406.885199-1-umang.jain@ideasonboard.com>
References: <20241023110406.885199-1-umang.jain@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241023_040451_733539_4376F568 
X-CRM114-Status: GOOD (  10.98  )
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

Rename the struct vchiq_bulk 'userdata' member to 'cb_data' to clarify
its purpose. 'cb_data' is meant to be passed to service callback
function in VCHIQ_BULK_MODE_CALLBACK mode.

No functional changes in this patch.

Signed-off-by: Umang Jain <umang.jain@ideasonboard.com>
---
 .../vc04_services/interface/vchiq_arm/vchiq_arm.c    |  4 ++--
 .../vc04_services/interface/vchiq_arm/vchiq_core.c   | 12 ++++++------
 .../vc04_services/interface/vchiq_arm/vchiq_core.h   |  2 +-
 .../vc04_services/interface/vchiq_arm/vchiq_dev.c    |  2 +-
 4 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
index ff627b297bc4..c06a57ea9cf5 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
@@ -501,7 +501,7 @@ vchiq_bulk_transmit(struct vchiq_instance *instance, unsigned int handle, const
 		bulk_params.offset = (void *)data;
 		bulk_params.mode = mode;
 		bulk_params.size = size;
-		bulk_params.userdata = userdata;
+		bulk_params.cb_data = userdata;
 		bulk_params.dir = VCHIQ_BULK_TRANSMIT;
 
 		ret = vchiq_bulk_xfer_callback(instance, handle, &bulk_params);
@@ -536,7 +536,7 @@ int vchiq_bulk_receive(struct vchiq_instance *instance, unsigned int handle,
 		bulk_params.offset = (void *)data;
 		bulk_params.mode = mode;
 		bulk_params.size = size;
-		bulk_params.userdata = userdata;
+		bulk_params.cb_data = userdata;
 		bulk_params.dir = VCHIQ_BULK_RECEIVE;
 
 		ret = vchiq_bulk_xfer_callback(instance, handle, &bulk_params);
diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
index 5e52f8954be7..6095adaf0cf6 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
@@ -455,15 +455,15 @@ mark_service_closing(struct vchiq_service *service)
 
 static inline int
 make_service_callback(struct vchiq_service *service, enum vchiq_reason reason,
-		      struct vchiq_header *header, void *bulk_userdata)
+		      struct vchiq_header *header, void *cb_data)
 {
 	int status;
 
 	dev_dbg(service->state->dev, "core: %d: callback:%d (%s, %pK, %pK)\n",
 		service->state->id, service->localport, reason_names[reason],
-		header, bulk_userdata);
+		header, cb_data);
 	status = service->base.callback(service->instance, reason, header, service->handle,
-					bulk_userdata);
+					cb_data);
 	if (status && (status != -EAGAIN)) {
 		dev_warn(service->state->dev,
 			 "core: %d: ignoring ERROR from callback to service %x\n",
@@ -1340,7 +1340,7 @@ static int service_notify_bulk(struct vchiq_service *service,
 		enum vchiq_reason reason = get_bulk_reason(bulk);
 
 		return make_service_callback(service, reason, NULL,
-					     bulk->userdata);
+					     bulk->cb_data);
 	}
 
 	return 0;
@@ -3065,7 +3065,7 @@ vchiq_bulk_xfer_queue_msg_killable(struct vchiq_service *service,
 	bulk->mode = bulk_params->mode;
 	bulk->dir = bulk_params->dir;
 	bulk->waiter = bulk_params->waiter;
-	bulk->userdata = bulk_params->userdata;
+	bulk->cb_data = bulk_params->cb_data;
 	bulk->size = bulk_params->size;
 	bulk->offset = bulk_params->offset;
 	bulk->uoffset = bulk_params->uoffset;
@@ -3082,7 +3082,7 @@ vchiq_bulk_xfer_queue_msg_killable(struct vchiq_service *service,
 
 	dev_dbg(state->dev, "core: %d: bt (%d->%d) %cx %x@%pad %pK\n",
 		state->id, service->localport, service->remoteport,
-		dir_char, bulk->size, &bulk->dma_addr, bulk->userdata);
+		dir_char, bulk->size, &bulk->dma_addr, bulk->cb_data);
 
 	/*
 	 * The slot mutex must be held when the service is being closed, so
diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.h b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.h
index 88766c9180a9..f9a2268ad47e 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.h
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.h
@@ -114,7 +114,7 @@ enum vchiq_bulk_dir {
 struct vchiq_bulk {
 	short mode;
 	short dir;
-	void *userdata;
+	void *cb_data;
 	struct bulk_waiter *waiter;
 	dma_addr_t dma_addr;
 	int size;
diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c
index 3d2827446f53..c99cd36a2696 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c
@@ -338,7 +338,7 @@ static int vchiq_irq_queue_bulk_tx_rx(struct vchiq_instance *instance,
 		bulk_params.mode = args->mode;
 		bulk_params.size = args->size;
 		bulk_params.dir = dir;
-		bulk_params.userdata = args->userdata;
+		bulk_params.cb_data = args->userdata;
 
 		status = vchiq_bulk_xfer_callback(instance, args->handle,
 						  &bulk_params);
-- 
2.45.2


