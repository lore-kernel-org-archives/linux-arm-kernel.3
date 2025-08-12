Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F6E1CA0ED1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Aug 2025 01:59:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:Cc:To:MIME-Version:Message-Id:Date:Subject:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=4oBQmst1n3VEnFu+osicTK+MtNnZ0TgeYRbV1ZyKo8k=; b=jF36eXl8Ee4YK81aaWqJmGU2jx
	1AjbcIfJ3NpbrjUe/Cbh7MdbTAWNiZoEnEqxpnirpcb+x2Ybob6lRXuBV2vWky3NfGBi4rDD4oNT+
	z5rCHoKkJPpHLjDgD2ZU5BDQpMf3rI3AwOAWlS9Ltun+V9NFE+OAic4SKwF+IGSYLthzTjWsKSzZU
	tq2xPqOUilflJ5ttIq382UQODUWGVjJMLb21NQ+RVKrbum3H7KXn0bnJS0SvcalLk8gzTMT9q3TiD
	zAKUaqilRCe7jmq/dHYocSYFZKcvMvMhno8eKf+eFocXC/pmMa1FVhEwFLuLc6wJ58dW/Tjbo8FDA
	t5TUIzeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uleHv-00000009YvR-1ohl;
	Tue, 12 Aug 2025 01:58:55 +0000
Received: from s.wrqvwxzv.outbound-mail.sendgrid.net ([149.72.154.232])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uleFH-00000009YiG-3R6Y
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 Aug 2025 01:56:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sendgrid.net;
	h=from:subject:date:mime-version:to:cc:content-transfer-encoding:
	content-type:cc:content-type:date:from:subject:to;
	s=smtpapi; bh=4oBQmst1n3VEnFu+osicTK+MtNnZ0TgeYRbV1ZyKo8k=;
	b=CiTZlOr2Nh5F2GHR1UqaiXw2+2NEQ2Stf1KDTGxNbT3Eh0hEsM+FMJydUD784M8grzj6
	twHWpmQf5N+7ytc6HEm2t0NLa23SNjiLmtc4/kcOcOlWCiVUoK5IYvrkMym+ucYW4Es+b5
	dHT3Ewmsis1DXNd2vZdpHYCb/2YRQJzT0=
Received: by recvd-7fd96f4944-h2fdt with SMTP id recvd-7fd96f4944-h2fdt-1-689A9F36-5
	2025-08-12 01:56:06.369029894 +0000 UTC m=+5908321.600103385
Received: from localhost (unknown)
	by geopod-ismtpd-11 (SG) with ESMTP
	id 7-ojFJCcRE2MTrXuxMtA4Q
	Tue, 12 Aug 2025 01:56:06.008 +0000 (UTC)
From: Yuri Martins <yurimartins2004@hotmail.com>
Subject: [PATCH] staging: vc04_services/vchiq-mmal: fix typos in comments
Date: Tue, 12 Aug 2025 01:56:06 +0000 (UTC)
Message-Id: <20250812015524.64413-1-yurimartins2004@hotmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-SG-EID: =?us-ascii?Q?u001=2E6ieiQIm7OvTDXtE=2Fxfw5eonpObpZ49ICwJQVMpAHgswW=2FbfUf0YOgwEO=2F?=
 =?us-ascii?Q?RoROFENTv55eS57JVaktoLd4pMnwF=2FfvlJPO429?=
 =?us-ascii?Q?MKyDQhniRHdRbs0K4etPP1ZwPhd+Fm4eWTNktbl?=
 =?us-ascii?Q?uKR0ruEtHd+uaDTa60N6ZnjS4cfZpez561L1pcQ?=
 =?us-ascii?Q?aNSJy8srWbg9tUYyyic98GHD80GqzX79pMWdj5C?=
 =?us-ascii?Q?QpoeAb8UEizz+5rcvWmko8TQ=2FPR4gn3T61L8rVE?=
 =?us-ascii?Q?ys2Y6Dqbtl8ODoXpoFIxuZ5Xcg=3D=3D?=
To: florian.fainelli@broadcom.com, gregkh@linuxfoundation.org
Cc: bcm-kernel-feedback-list@broadcom.com, umang.jain@ideasonboard.com,
	linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, Yuri Martins
	<yurimartins2004@hotmail.com>
X-Entity-ID: u001./v1UP53i8YyoizAUvofPCQ==
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset=us-ascii
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250811_185611_975496_538F758E 
X-CRM114-Status: GOOD (  14.09  )
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

Fix three spelling mistakes found in comments across the
vchiq-mmal driver component:

- recived -> received
- servie  -> service
- enque   -> enqueues

Signed-off-by: Yuri Martins <yurimartins2004@hotmail.com>
---
 drivers/staging/vc04_services/vchiq-mmal/mmal-msg.h   | 2 +-
 drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c | 2 +-
 drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.h | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/vc04_services/vchiq-mmal/mmal-msg.h b/drivers/staging/vc04_services/vchiq-mmal/mmal-msg.h
index 471413248a14..1889494425eb 100644
--- a/drivers/staging/vc04_services/vchiq-mmal/mmal-msg.h
+++ b/drivers/staging/vc04_services/vchiq-mmal/mmal-msg.h
@@ -13,7 +13,7 @@
 
 /*
  * all the data structures which serialise the MMAL protocol. note
- * these are directly mapped onto the recived message data.
+ * these are directly mapped onto the received message data.
  *
  * BEWARE: They seem to *assume* pointers are u32 and that there is no
  * structure padding!
diff --git a/drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c b/drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c
index 3fe482bd2793..c2b5a37915f2 100644
--- a/drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c
+++ b/drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c
@@ -326,7 +326,7 @@ static int bulk_receive(struct vchiq_mmal_instance *instance,
 		 * committed a buffer_to_host operation to the mmal
 		 * port without the buffer to back it up (underflow
 		 * handling) and there is no obvious way to deal with
-		 * this - how is the mmal servie going to react when
+		 * this - how is the mmal service going to react when
 		 * we fail to do the xfer and reschedule a buffer when
 		 * it arrives? perhaps a starved flag to indicate a
 		 * waiting bulk receive?
diff --git a/drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.h b/drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.h
index 97abe4bdcfc5..8c3959f6f97f 100644
--- a/drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.h
+++ b/drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.h
@@ -115,7 +115,7 @@ int vchiq_mmal_component_disable(struct vchiq_mmal_instance *instance,
 
 /* enable a mmal port
  *
- * enables a port and if a buffer callback provided enque buffer
+ * enables a port and, if a buffer callback provided, enqueues buffer
  * headers as appropriate for the port.
  */
 int vchiq_mmal_port_enable(struct vchiq_mmal_instance *instance,
-- 
2.34.1


