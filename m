Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39B30CDDE75
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Oct 2024 11:47:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6e7liKCwThuDZVEsub5H6RinZjvLHiVXV2bMMw2uL2Q=; b=N3rk8CLJ4ps5+dfiI20Gqk5ST0
	aqwmV6/tqNSXNGEVIXAhRpvjw78fF8/QhkXrH0PUHSbTpECi0WfKrTjnpV4kOqa7xwmmh8shSCmGh
	ZPvbizf6UQHLDjRhbgS/cczZioHNgZa+oiayhg8PHPBflEmbAOWvqW2a7VkZ9hnqj71aTKZ+XCBiS
	Q+BLNYUEVyxM4LFexq/C++pcDWXSwQmHltWAqn3Au2NtZiEBW3wzj1++gGUQuzGK8ov2oNEj5J7vU
	e+Kqh48oX+YSmd09+DbyDcUpnCxk2GEZXpYAwEcQG2hYXPMh2Dp9bPh5D8QzsdMsVtiTf6XaSKtJb
	blyrNr6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3ZpE-0000000EBvV-1pvY;
	Wed, 23 Oct 2024 11:46:52 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3ZAV-0000000E4v0-1LtI;
	Wed, 23 Oct 2024 11:04:48 +0000
Received: from umang.jain (unknown [IPv6:2405:201:2015:f873:55d7:c02e:b2eb:ee3f])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2533B8A9;
	Wed, 23 Oct 2024 13:02:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1729681379;
	bh=2LKSIF262z/emv06K71fxiLrd5T72VZ1UM2x5FZ8PVM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=OuRe4WnmVkamiuzriOZgOd7R6iiohfea88k3o3pLCUXILfP9oZyLvYM4H3RFMtzD8
	 NB691linWt1Nk7YtH7hMTkwLj0kK3BaEKbamSytFcDBbT302RKsr4RZXOzd5eHNfKh
	 m1OWc4dXO5v1ruJ1zmjLJqCzGz6ELUFomU2vM3vk=
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
Subject: [PATCH 1/6] staging: vchiq_arm: Rename a struct vchiq_bulk member
Date: Wed, 23 Oct 2024 16:34:01 +0530
Message-ID: <20241023110406.885199-2-umang.jain@ideasonboard.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241023110406.885199-1-umang.jain@ideasonboard.com>
References: <20241023110406.885199-1-umang.jain@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241023_040447_589326_CBB32766 
X-CRM114-Status: GOOD (  13.73  )
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

Rename the struct vchiq_bulk's 'data' member to 'dma_addr' for
better readability. No functional changes intended in this patch.

Signed-off-by: Umang Jain <umang.jain@ideasonboard.com>
---
 .../vc04_services/interface/vchiq_arm/vchiq_arm.c    |  2 +-
 .../vc04_services/interface/vchiq_arm/vchiq_core.c   | 12 ++++++------
 .../vc04_services/interface/vchiq_arm/vchiq_core.h   |  2 +-
 3 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
index c2e7c2bd5071..f23d98a1b960 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
@@ -587,7 +587,7 @@ vchiq_blocking_bulk_transfer(struct vchiq_instance *instance, unsigned int handl
 		if (bulk) {
 			/* This thread has an outstanding bulk transfer. */
 			/* FIXME: why compare a dma address to a pointer? */
-			if ((bulk->data != (dma_addr_t)(uintptr_t)bulk_params->data) ||
+			if ((bulk->dma_addr != (dma_addr_t)(uintptr_t)bulk_params->dma_addr) ||
 			    (bulk->size != bulk_params->size)) {
 				/*
 				 * This is not a retry of the previous one.
diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
index 9e56e34ca4d9..90ab780b7e94 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
@@ -1369,7 +1369,7 @@ notify_bulks(struct vchiq_service *service, struct vchiq_bulk_queue *queue,
 		 * Only generate callbacks for non-dummy bulk
 		 * requests, and non-terminated services
 		 */
-		if (bulk->data && service->instance) {
+		if (bulk->dma_addr && service->instance) {
 			status = service_notify_bulk(service, bulk);
 			if (status == -EAGAIN)
 				break;
@@ -1751,7 +1751,7 @@ vchiq_prepare_bulk_data(struct vchiq_instance *instance, struct vchiq_bulk *bulk
 	if (!pagelistinfo)
 		return -ENOMEM;
 
-	bulk->data = pagelistinfo->dma_addr;
+	bulk->dma_addr = pagelistinfo->dma_addr;
 
 	/*
 	 * Store the pagelistinfo address in remote_data,
@@ -1807,7 +1807,7 @@ abort_outstanding_bulks(struct vchiq_service *service,
 				service->remoteport, bulk->size, bulk->remote_size);
 		} else {
 			/* fabricate a matching dummy bulk */
-			bulk->data = 0;
+			bulk->dma_addr = 0;
 			bulk->size = 0;
 			bulk->actual = VCHIQ_BULK_ACTUAL_ABORTED;
 			bulk->dir = is_tx ? VCHIQ_BULK_TRANSMIT :
@@ -2112,7 +2112,7 @@ parse_message(struct vchiq_state *state, struct vchiq_header *header)
 
 			dev_dbg(state->dev, "core: %d: prs %s@%pK (%d->%d) %x@%pad\n",
 				state->id, msg_type_str(type), header, remoteport,
-				localport, bulk->actual, &bulk->data);
+				localport, bulk->actual, &bulk->dma_addr);
 
 			dev_dbg(state->dev, "core: %d: prs:%d %cx li=%x ri=%x p=%x\n",
 				state->id, localport,
@@ -3081,7 +3081,7 @@ vchiq_bulk_xfer_queue_msg_killable(struct vchiq_service *service,
 
 	dev_dbg(state->dev, "core: %d: bt (%d->%d) %cx %x@%pad %pK\n",
 		state->id, service->localport, service->remoteport,
-		dir_char, bulk->size, &bulk->data, bulk->userdata);
+		dir_char, bulk->size, &bulk->dma_addr, bulk->userdata);
 
 	/*
 	 * The slot mutex must be held when the service is being closed, so
@@ -3095,7 +3095,7 @@ vchiq_bulk_xfer_queue_msg_killable(struct vchiq_service *service,
 	if (service->srvstate != VCHIQ_SRVSTATE_OPEN)
 		goto unlock_both_error_exit;
 
-	payload[0] = lower_32_bits(bulk->data);
+	payload[0] = lower_32_bits(bulk->dma_addr);
 	payload[1] = bulk->size;
 	status = queue_message(state,
 			       NULL,
diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.h b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.h
index 186b1395d3a2..9ba4a2295dc3 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.h
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.h
@@ -115,7 +115,7 @@ struct vchiq_bulk {
 	short mode;
 	short dir;
 	void *userdata;
-	dma_addr_t data;
+	dma_addr_t dma_addr;
 	int size;
 	void *remote_data;
 	int remote_size;
-- 
2.45.2


