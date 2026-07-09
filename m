Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A391AC44501
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 09:58:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=F/uvU7sUOw7sHC5RCl/6W+zWHmjzyCxjd+jlaUCTE/Y=; b=2JaaQybx1l6QfFxdoAqZZQraCt
	hk8bQDyJaNzqvBhxre5YNSq+rkVea29lQ8tclPUUyCUWP1rW5sQWqOtG4B4LT/y7n6wLlAB0h4f/f
	Mg/FzPaZbfbVFh7XUt8czH9D4ziP7+J0DiivkmE8/Wu7D6OUTLGQCEbRIJyFO0aRTyHSMf0T38vdn
	16QqpXQ6eTLzFvl6XnVawM52LaRDxjWQn6964JvRIcN4jRRLKBtreEIWz1tZV+RRuHJBjpDtrECHl
	YmCi9wXE2MG7ttfYCkyrpm8koovy5BbwitbWaNBqDGdX/JQv2sXCHuocKN3MSMKGOWiGxHFcWwqeX
	UCwtRAng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whlWA-00000001p9A-1Y4S;
	Thu, 09 Jul 2026 09:58:06 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whlW7-00000001p5S-3rSM
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jul 2026 09:58:05 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-2cabc0a1ab6so22790525ad.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 09 Jul 2026 02:58:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1783591083; x=1784195883; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=F/uvU7sUOw7sHC5RCl/6W+zWHmjzyCxjd+jlaUCTE/Y=;
        b=LPi6RWHXkSLblTOY+5KDkfb5TAUo4o2DxQkUILcO2nCbGQbJcYJD2zM8us2hCoucgp
         kUp24m5HXBrxk/bY5q3w9u3lVI8iJuB4mgGdoiCyPypEguC0MZpHBUC71IBf4NRME8tZ
         tHN2UtGvj/DwxVhKqUW1QdbeM+nZTt8iZfBUI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783591083; x=1784195883;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=F/uvU7sUOw7sHC5RCl/6W+zWHmjzyCxjd+jlaUCTE/Y=;
        b=oUApiv9YnLhiCq/zlLgeidCA/xXkZ//FcVatOoV7vcXCzWwDDzMYWrfMbXsEW98WZL
         hQR6v7PTNTOWnVqb92Zjaxm5A9zS4v3US3NilvPZKQqbMwddhzK76nVFOKXCGh7Sz/XS
         X8hbINiUgtYyb7Jf0y3YsmeA66Bx7x8f5Ttw7uoVpavN/t3SwDxJl/MValC9PzzBtt4Z
         fsFfIaBrsTP3sQiCOfu4cEmHm9e0JernRlePXlZ3YbzvSU/jMMBIQcp0fHkesnJUKsRK
         Kf9MZ866X+OdcAUov7QAyXEkZIvA5N1CTXGiBfuJz2+XlPSfiKY4EUxZ0SoWA8So5GUW
         vuvA==
X-Forwarded-Encrypted: i=1; AHgh+RoHKf85GbLrnfbvkirZmz6FWNYYa5T/Zabm0dYw5GnTdZdR6YKd4XlzkC/bnzdvmAAN6Mh5M61dYvx2KgT+cKEV@lists.infradead.org
X-Gm-Message-State: AOJu0YxODqGuiCjnEpyELwt3KG/GTW8cF6UXuke2W7famT0ceitJnIoE
	Q9WbVbK3L5TKphspQtdxHQ4B953HDKdggHnJHgY0+IbHVnzyNE8gOsqLB7+/5psWew==
X-Gm-Gg: AfdE7ckwfORiA0nShXWf6rG6hp0J/PbINqwKV64QkbDkWKK4rZ2HV27xAwV2WtxEj+X
	Vmrt8lvqdTQMbnh93yIXDd3G6OGkiMgLGOPy06lKGhIZem5iSsmA9XTELyRI3owXbGBsbcJE5VK
	4t3T+pEpHFiotv/wNRQ42JuXTkOPpE8HTkXfxcXJUX+bBo5FgAcxfwkCf8eZg4uOAUD0hsxXz8z
	985HXJfRgxWox96rfTMKcdvNeSfiN4frh713SmWbBhU7/n8qc0p43zEN1i3QDmk0i8DaStIUjxx
	KN+oGVfKvvEZvjhzevIsY5om2KHBapu9MRaT8anwid3FkrOamcODbrZQz8hULthQVaAfWkeUy71
	vriAqVphf7OOv2HI6bhUh8NherFf9VExSo59GjX3+C0CI55axLn23UkS3Uk5qHwf/v4IIxCSb8G
	f4M48jxgCWtiiMKSuhmylkY547Hjr6hjsht635Ib0mS+p/kSp3ZHDr/HV9eB1QgUeeg9criQ==
X-Received: by 2002:a17:902:c402:b0:2cc:df15:91de with SMTP id d9443c01a7336-2ccea47c1eamr75805365ad.42.1783591082919;
        Thu, 09 Jul 2026 02:58:02 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:bd09:6ddb:180a:69c5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9d5bd2fsm41082155ad.78.2026.07.09.02.57.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 02:58:02 -0700 (PDT)
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
Subject: [PATCH v4 05/14] usb: hub: Associate port@ fwnode with USB port device
Date: Thu,  9 Jul 2026 17:57:10 +0800
Message-ID: <20260709095726.704448-6-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.795.g602f6c329a-goog
In-Reply-To: <20260709095726.704448-1-wenst@chromium.org>
References: <20260709095726.704448-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_025803_978664_92C6C774 
X-CRM114-Status: GOOD (  17.50  )
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
Changes since v3:
- Added missing fwnode_handle_put()

Changes since v2:
- Skip assignment if hub firmware node is ACPI node
---
 drivers/usb/core/port.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/usb/core/port.c b/drivers/usb/core/port.c
index b1364f0c384c..e8fb2acd77be 100644
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
@@ -780,6 +786,13 @@ int usb_hub_create_port_device(struct usb_hub *hub, int port1)
 	port_dev->dev.driver = &usb_port_driver;
 	dev_set_name(&port_dev->dev, "%s-port%d", dev_name(&hub->hdev->dev),
 			port1);
+	/*
+	 * ACPI FW nodes are associated later when device_register() happens.
+	 * Skip assigning one here to avoid potential conflicts.
+	 */
+	if (!is_acpi_node(dev_fwnode(&hdev->dev)))
+		device_set_node(&port_dev->dev,
+				fwnode_graph_get_port_by_id(dev_fwnode(&hdev->dev), port1));
 	mutex_init(&port_dev->status_lock);
 	retval = device_register(&port_dev->dev);
 	if (retval) {
@@ -852,6 +865,7 @@ int usb_hub_create_port_device(struct usb_hub *hub, int port1)
 
 void usb_hub_remove_port_device(struct usb_hub *hub, int port1)
 {
+	struct usb_device *hdev = hub->hdev;
 	struct usb_port *port_dev = hub->ports[port1 - 1];
 	struct usb_port *peer;
 
-- 
2.55.0.795.g602f6c329a-goog


