Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D327CCF9E9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Oct 2025 10:31:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TmhVDg3cw+fHRKu04aUo45FY8a5xgjtKvw8s/18gU8o=; b=lG9yTD3Dn00KqC0XlP59h0f3MQ
	R/UWVttIHT/+SpYKGURnN14/VwhLozSAEHWXQECCDSo5SIm1y9EYh8CSOAnU6JT3Ri7QeWRanSlzf
	AT6fys2tXq7vteOoA6akeCosVeda295cnekZQ+sB8sxc2QGfMMYNbBCDGn1mkmh08MrV0poWTNZdT
	I46XArWsWh/TLEDeOOuCNrYgZoTmDXdTh3hv/jdJezRyRbP5BD5rrne4ZRiWwpmcKimhFM7zEmms7
	DhH2cfKKAMkCS8mVd2uSNGTS57/7msB2n2Vd6WuRt9LSatVluoDPGqNoeUdRnwvbOg31S1a+HlS0e
	jvMWzq2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE3Sd-00000000lti-2iVT;
	Wed, 29 Oct 2025 10:31:23 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE3Sa-00000000lqt-2AOU;
	Wed, 29 Oct 2025 10:31:21 +0000
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c69:314e:ee86:ae6e:30:9d13])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8E35D15D2;
	Wed, 29 Oct 2025 11:29:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1761733770;
	bh=0gVeRqqRzXKQdJ1gsiU/rUZajwGA0NVsMblpw8PvU/0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Ho5MabUP9lAt5kW41zHkQV1Wutp011spvmSuhDKErP+37ohizUGtKgEJx7Q1gq/RC
	 hTEccLM5jNTUJyourRK/jrJzteWF2tEgQ9FoAWvY8rLxwTDtMLfREvt9actIrr4Dvb
	 THuB+DbZPLTne+Z5Pd1i9mmJzbPxFK8SsHIcwRD4=
From: Jai Luthra <jai.luthra@ideasonboard.com>
Date: Wed, 29 Oct 2025 16:00:07 +0530
Subject: [PATCH v3 3/7] staging: vchiq_arm: Improve inline documentation
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251029-vchiq-destage-v3-3-da8d6c83c2c5@ideasonboard.com>
References: <20251029-vchiq-destage-v3-0-da8d6c83c2c5@ideasonboard.com>
In-Reply-To: <20251029-vchiq-destage-v3-0-da8d6c83c2c5@ideasonboard.com>
To: Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>
Cc: linux-rpi-kernel@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-staging@lists.linux.dev, 
 linux-kernel@vger.kernel.org, kernel-list@raspberrypi.com, 
 Stefan Wahren <wahrenst@gmx.net>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Kieran Bingham <kieran.bingham@ideasonboard.com>, 
 Phil Elwell <phil@raspberrypi.com>, Umang Jain <uajain@igalia.com>, 
 Jai Luthra <jai.luthra@ideasonboard.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5247;
 i=jai.luthra@ideasonboard.com; h=from:subject:message-id;
 bh=PQnNeOrg3zMD0DqVmV/xpkZRvHTGOOMEStKwc7h1LoU=;
 b=owEBbQKS/ZANAwAKAUPekfkkmnFFAcsmYgBpAezbjnCMBf9IDIO1xwkYkpA56pUeXQev/KysU
 CcfHGvgpG6JAjMEAAEKAB0WIQRN4NgY5dV16NRar8VD3pH5JJpxRQUCaQHs2wAKCRBD3pH5JJpx
 RZw/EACEkiG/ZTEo4Zjo+8KX95uB3fT6T550vZecesJ+KYz9+TQxa0jDNEGSjll7KNCq74co8qV
 ZgufvVdpR2KEG5FbS3Wa5pCjLddMDh+SJUGm0E10EfHeXd1MMTiuMHubpO9BLamiJ8LQc4bixj/
 ZW5tjKO3Lkiu8HwfH0sJJ1RH80V7WcZY3XoUtYvyqe9xY58RXDtqA01ule/v7Za6rybrYGik+KO
 3bRFsUh6NMttPIBAYAjXu5q3i22qBIgSo9KToNUqAMPSQUMml+vvzmw9nQwJLQ0kBY0W5V9z97F
 DzgC5BpbSj+ANPF6+D9w2S4TgDcQcXieL+Nri8UM8T2Rzi4p6LkWX8KBj6dkjfc1hUAdyNCjX9u
 UVW/+rFhjC/ddc6BGLtZ8K+qw2BQf2KWT3PX0JXnrPSWMX/LTBQ9yy92IDfY80IvQ6+/fYTYfL2
 2STwc50mYYBM4C6qly5ca8LxI8EnMdUzyw7hmjH+A0UyMryBEn++rExXRIaNYv2wYX0VOoXUdMd
 lTG5PX8n+9+BY70dntuqN+bOb9UvzS1V0n7/JV0Q8/0acEA1FS4GjiAD9naQ2bckejL0OityJze
 5nrY1HisU4kYDrp2H0sKwyr3dC8+egAvSV9V+2H/MMTxhI+awlLALv1q3hjsvvZ6yikJVmXTeDV
 +23ptz3aXuMKfBQ==
X-Developer-Key: i=jai.luthra@ideasonboard.com; a=openpgp;
 fpr=4DE0D818E5D575E8D45AAFC543DE91F9249A7145
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251029_033120_716519_F5DA5A57 
X-CRM114-Status: GOOD (  20.69  )
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

From: Phil Elwell <phil@raspberrypi.com>

Add more comments to the VCHIQ driver, which provides some
high-level descriptions how things work.

Link: https://github.com/raspberrypi/linux/pull/6801
Signed-off-by: Phil Elwell <phil@raspberrypi.com>
[wahrenst@gmx.net: Rewrite commit log]
Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
---
 drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c  |  8 +++++++-
 drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.h | 56 +++++++++++++++++++++++++++++++++++++++++++++++++++++---
 2 files changed, 60 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
index c84304dfcdc96742f0f0ef655642a7de69552c3c..a2074069e79e80456a382523b68a6f62116f796c 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
@@ -72,7 +72,13 @@ static const struct vchiq_platform_info bcm2836_info = {
 };
 
 struct vchiq_arm_state {
-	/* Keepalive-related data */
+	/*
+	 * Keepalive-related data
+	 *
+	 * The keepalive mechanism was retro-fitted to VCHIQ to allow active
+	 * services to prevent the system from suspending.
+	 * This feature is not used on Raspberry Pi devices.
+	 */
 	struct task_struct *ka_thread;
 	struct completion ka_evt;
 	atomic_t ka_use_count;
diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.h b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.h
index 9b4e766990a493d6e9d4e0604f2c84f4e7b77804..e3ed50d26c37eb767df43c6cea6b5f0826fada61 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.h
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.h
@@ -171,6 +171,21 @@ struct vchiq_slot_info {
 	short release_count;
 };
 
+/*
+ * VCHIQ is a reliable connection-oriented datagram protocol.
+ *
+ * A VCHIQ service is equivalent to a TCP connection, except:
+ * + FOURCCs are used for the rendezvous, and port numbers are assigned at the
+ *   time the connection is established.
+ * + There is less of a distinction between server and client sockets, the only
+ *   difference being which end makes the first move.
+ * + For a multi-client server, the server creates new "listening" services as
+ *   the existing one becomes connected - there is no need to specify the
+ *   maximum number of clients up front.
+ * + Data transfer is reliable but packetized (messages have defined ends).
+ * + Messages can be either short (capable of fitting in a slot) and in-band,
+ *   or copied between external buffers (bulk transfers).
+ */
 struct vchiq_service {
 	struct vchiq_service_base base;
 	unsigned int handle;
@@ -286,6 +301,23 @@ struct vchiq_shared_state {
 	int debug[DEBUG_MAX];
 };
 
+/*
+ * vchiq_slot_zero describes the memory shared between the ARM host and the
+ * VideoCore VPU. The "master" and "slave" states are owned by the respective
+ * sides but visible to the other; the slots are shared, and the remaining
+ * fields are read-only.
+ *
+ * In the configuration used by this implementation, the memory is allocated
+ * by the host, the VPU is the master (the side which controls the DMA for bulk
+ * transfers), and the host is the slave.
+ *
+ * The ownership of slots changes with use:
+ * + When empty they are owned by the sender.
+ * + When partially filled they are shared with the receiver.
+ * + When completely full they are owned by the receiver.
+ * + When the receiver has finished processing the contents, they are recycled
+ *   back to the sender.
+ */
 struct vchiq_slot_zero {
 	int magic;
 	short version;
@@ -300,6 +332,10 @@ struct vchiq_slot_zero {
 	struct vchiq_slot_info slots[VCHIQ_MAX_SLOTS];
 };
 
+/*
+ * This is the private runtime state used by each side. The same structure was
+ * originally used by both sides, but implementations have since diverged.
+ */
 struct vchiq_state {
 	struct device *dev;
 	int id;
@@ -321,13 +357,27 @@ struct vchiq_state {
 	struct mutex mutex;
 	struct vchiq_instance **instance;
 
-	/* Processes incoming messages */
+	/* Processes all incoming messages which aren't synchronous */
 	struct task_struct *slot_handler_thread;
 
-	/* Processes recycled slots */
+	/*
+	 * Slots which have been fully processed and released by the (peer)
+	 * receiver are added to the receiver queue, which is asynchronously
+	 * processed by the recycle thread.
+	 */
 	struct task_struct *recycle_thread;
 
-	/* Processes synchronous messages */
+	/*
+	 * Processes incoming synchronous messages
+	 *
+	 * The synchronous message channel is shared between all synchronous
+	 * services, and provides a way for urgent messages to bypass
+	 * potentially long queues of asynchronous messages in the normal slots.
+	 *
+	 * There can be only one outstanding synchronous message in
+	 * each direction, and as a precious shared resource synchronous
+	 * services should be used sparingly.
+	 */
 	struct task_struct *sync_thread;
 
 	/* Local implementation of the trigger remote event */

-- 
2.51.0


