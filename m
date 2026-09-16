Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E157C88E5C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Sep 2026 07:59:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FWq5hvO3hBRGVn3uOxsC9S/weGAcU55UsXVnM8MhFFA=; b=rjvXwh6SV4D9SkgSWg3r8Q8YH0
	YpktKYogaDqLvweDU+lmxmU4xiQKWxmOAhsrOt+mKIcB3rGui+kFs+56lohbE69tcKVzLJbQA4X1E
	cJR/jCxEqswwWLTGCbcr0NkzurYighq/JI04TZ/okv7FzpyxGcX+Uw+IBhqTSsp5R6gFmkTDwqFbz
	jbibsY4WPvOteQDTwMFLwC4aw9FaN130S77eDZQc1K25hn/Sa99hOS66kBeQuAC3mOPU3CHdIhGsT
	iEuOzNVZHC4J+kf+WHVbv/mX+5EoO7sYq0oo3RKzNQq7KOGexf0denrVd9l7ssXHThSmVNEcS/mql
	OAxK4Xew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6kYB-00000008eCR-2L5g;
	Wed, 16 Sep 2026 07:59:27 +0000
Received: from mail-pj2-x11.google.com ([2607:f8b0:4864:39::11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6kXf-00000008dxX-0BUE
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Sep 2026 07:59:02 +0000
Received: by mail-pj2-x11.google.com with SMTP id 98e67ed59e1d1-39b910bdf2eso403215a91.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 16 Sep 2026 00:58:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1789545534; x=1790150334; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FWq5hvO3hBRGVn3uOxsC9S/weGAcU55UsXVnM8MhFFA=;
        b=jeol9FzlkZGGnLENhvLTMhDam5N5czbwxMSeDMnb7RHGHePshkq1b/Bp2pXobZuftf
         7SbnIShP/1QziuOJJ6Kv4CzDC7m2yaxAX5YkCCZU5Sntx99xXmhQiRda/khprGswvSlV
         //cXcxbK3sUZojlof21HEqecI/qV1baFC6R6A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789545534; x=1790150334;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FWq5hvO3hBRGVn3uOxsC9S/weGAcU55UsXVnM8MhFFA=;
        b=WxtJNT8oxpAUoxeuXVBRn8lPpfsXe8sOM54bLkCHueUYiuXZSAWDAOAmvvRz/YDJqI
         uw8w6GPgE66CCBWq8cZcYotFwe5moX1OZ5hpzSWMX6PMvX9FUXp9DfcRZ+RlsdjQmCWG
         2j3JPRYMUDu4djkbkEylgb2KHhsExAHG5yyURzo89ttoCHGnS2WIfOwS5cG7pGWDRyA3
         hpkTbxZTLbOuz90zUldWtR9z1/tRB9ig5M0C7iaBNeUhHn7jLwfrBzjeFQF2fi3vru3Q
         vpHEPEKwY+kM9D6GhY/IESgncmQCvWeiEPYS7+FgpbTj8zM+Uj6I0lrIRebOdQdpAcId
         z+kA==
X-Forwarded-Encrypted: i=1; AKwUvBwj9MEcHaPZBW5cPS5lvU7XrJvNPd4aRLyPxl2a+pOX2GJWpLVzR4pqjqOvV59OYBKGqk4ceEb/NGkbLM0QMyo7@lists.infradead.org
X-Gm-Message-State: AFuF++kiPNOGwiZpcGvdy+4o/vLl3aJhZpJG9dR6+pTLt4l0iQyNuWGq
	uSi3BSWukxtfPcc+AUJtQwbuYH1bAFL2qUSw19Suu/vovk55bV/pvWEHVT73B7UymQ==
X-Gm-Gg: AYBFou0jO09yxp91AQ5mlmZnFnSs3nak1AeErnYoo98egwhFe+7f8NOCPfFMDDGBEPh
	no22YimTngbpevYP3tOH77KnJJPIkLyrtkE4uBIWu30XOT8mnVLcLq2wOTHZTdf/JaELzjEK9Kc
	opwnir68x15u8+4nvUZOkJ8CpR6clpBSZC7HdFKXv2dn/ac4NufQFQlRAVEl1Mxyk2wtwLp7NDh
	+SVEhKyDzAlboD+sJDoSeX+ddaXeEyLvct8oqzVd6y+7lKX9j264WyyNMSHhD6SMseRkCAwwClb
	Q9mnb/jGvtwVb/5+DX3L0JJ5Oqu/eoMFgpr86Yya8sHKZWodxZ7knyQMlFMkF79gilL2aXNKRyD
	e+MLk0lqa4mOhNlRKQhZWBtE+s7fUZgeiypYFS1JZN6RGVE2SfEdm3VJQFTVhr0HEhnSC22KY2Y
	gcRtkZYgtZsEvY/VWyGjfBeDokno6o6cLtf6s9coSY+Y0PFY6J/pWiEOhEFD7IXehx8IYRRTh8f
	snW0jqwEBrdetPcNVMQUV5RORfSqRaYppVU5xtLaNlLHueVdsk583sQOwdkqIT/VfaZ
X-Received: by 2002:a17:90b:2d4f:b0:39e:1b0c:4773 with SMTP id 98e67ed59e1d1-39e1df86c10mr4199444a91.0.1789545534152;
        Wed, 16 Sep 2026 00:58:54 -0700 (PDT)
Received: from wenst-7875.tpe.corp.google.com ([2a00:79e0:203d:7:1f62:7622:5d61:2578])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e1b7acba2sm4348197a91.16.2026.09.16.00.58.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 00:58:53 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Bartosz Golaszewski <brgl@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Daniel Scally <djrscally@gmail.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-acpi@vger.kernel.org,
	driver-core@lists.linux.dev,
	linux-pm@vger.kernel.org,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Manivannan Sadhasivam <mani@kernel.org>,
	Alan Stern <stern@rowland.harvard.edu>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH v9 06/15] usb: hub: Associate port@ fwnode with USB port device
Date: Wed, 16 Sep 2026 15:57:32 +0800
Message-ID: <20260916075745.3549953-7-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.1032.g73a4cd73de-goog
In-Reply-To: <20260916075745.3549953-1-wenst@chromium.org>
References: <20260916075745.3549953-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260916_005858_921742_0DC0980E 
X-CRM114-Status: GOOD (  19.57  )
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

When a USB hub port is connected to a connector in a firmware node
graph, the port itself has a node in the graph.

Associate the port's firmware node with the USB port's device,
usb_port::dev. This is used in later changes for the M.2 slot power
sequencing provider to match against the requesting port.

To avoid potential conflicts with ACPI firmware nodes and then causing
power management issues, only assign the firmware node if the hub's
firmware node is not an ACPI firmware node.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Changes since v5:
- Added extra |struct fwnode_handle *| local variables to shorten lines
  (Andy)
- Added comment about passing fwnode_graph_get_port_by_id() return value
  directly to device_set_node() (Andy)

Changes since v4:
- Dropped unused |hdev| variable
- Added flags for fwnode_graph_get_port_by_id() with
  FWNODE_GRAPH_DEVICE_DISABLED so that even incomplete
  ports can be connected

Changes since v3:
- Added missing fwnode_handle_put()

Changes since v2:
- Skip assignment if hub firmware node is ACPI node
---
 drivers/usb/core/port.c | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/drivers/usb/core/port.c b/drivers/usb/core/port.c
index b4452b665f59..c0a51d9b06a6 100644
--- a/drivers/usb/core/port.c
+++ b/drivers/usb/core/port.c
@@ -7,6 +7,7 @@
  * Author: Lan Tianyu <tianyu.lan@intel.com>
  */
 
+#include <linux/acpi.h>
 #include <linux/kstrtox.h>
 #include <linux/slab.h>
 #include <linux/string_choices.h>
@@ -358,6 +359,11 @@ static void usb_port_device_release(struct device *dev)
 {
 	struct usb_port *port_dev = to_usb_port(dev);
 
+	/*
+	 * At this point ACPI nodes and swnodes have been removed by
+	 * device_platform_notify_remove() in device_del().
+	 */
+	fwnode_handle_put(dev_fwnode(dev));
 	kfree(port_dev->req);
 	kfree(port_dev);
 }
@@ -754,6 +760,7 @@ int usb_hub_create_port_device(struct usb_hub *hub, int port1)
 {
 	struct usb_port *port_dev;
 	struct usb_device *hdev = hub->hdev;
+	struct fwnode_handle *fwnode = dev_fwnode(&hdev->dev);
 	int retval;
 
 	port_dev = kzalloc_obj(*port_dev);
@@ -782,6 +789,24 @@ int usb_hub_create_port_device(struct usb_hub *hub, int port1)
 	port_dev->dev.driver = &usb_port_driver;
 	dev_set_name(&port_dev->dev, "%s-port%d", dev_name(&hub->hdev->dev),
 			port1);
+
+	/*
+	 * ACPI FW nodes are associated later when device_register() happens.
+	 * Skip assigning one here to avoid potential conflicts.
+	 */
+	if (!is_acpi_node(fwnode)) {
+		struct fwnode_handle *port;
+
+		/*
+		 * fwnode_graph_get_port_by_id() returns either a valid fwnode handle
+		 * or NULL. Passing NULL to device_set_node() clears any associated
+		 * fwnode. It is effectively a no-op here, since no fwnode has been
+		 * assigned to the newly created device yet.
+		 */
+		port = fwnode_graph_get_port_by_id(fwnode, port1, FWNODE_GRAPH_DEVICE_DISABLED);
+		device_set_node(&port_dev->dev, port);
+	}
+
 	mutex_init(&port_dev->status_lock);
 	retval = device_register(&port_dev->dev);
 	if (retval) {
-- 
2.55.0.1032.g73a4cd73de-goog


