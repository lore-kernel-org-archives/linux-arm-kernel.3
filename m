Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2DB1C4451C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jul 2026 06:54:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yZPli2S6cZzTtPxNu5kCcB+M+KQUeHMnkMABY4ADLcw=; b=ALO2PDyv0TJ9NvTWqJf8DrZXFg
	FN3i+eoRwjplUV3BSQ19+E2cAWCJE1IJikx18KSNWFVk7gCRjFGQm9MCWetyubN5e69mtw3SI8073
	sRiSReWPI6cMdUaHRZXM9bbtk/iDRUP7hNFjElVLlUWUY59bwX+A+8re2W+nrwM0NoUdZeeWPn//M
	uVRu2rxTUg+iDhFg4rFzU87fEF8vinvR0OUUF8BboiqQENvTlFYlaqcDBjhaLKEVmTZt/7FjvGuGH
	WSn3PeRw2gzru0RP5wfb46Jl+lOLXvv+zUJcfds8pZTUY2qncEgFh1iKbji0xxQxrwFaLjc2mJpbK
	ilPz51Lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm4NK-00000008Zxj-43tu;
	Tue, 21 Jul 2026 06:54:46 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm4NG-00000008Zus-1yQs
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Jul 2026 06:54:43 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-2cf50c6f235so29438545ad.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Jul 2026 23:54:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1784616881; x=1785221681; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yZPli2S6cZzTtPxNu5kCcB+M+KQUeHMnkMABY4ADLcw=;
        b=bATjwOCelUvlEtDH/uHfHCO8KEekFq5LoXRDyTbXjxa8PlVZ8Q31SFtGtTJsxXHajo
         1onD0UBSte6bgjzUY/9D7t3FV9xeJo5wFzc9D0/K5uo2Eqn41OWXzHKabLWHv/36+pbL
         dsIBpVQMm9T4Cf8qX+ECbiU6rReNodPCdUbY4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784616881; x=1785221681;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yZPli2S6cZzTtPxNu5kCcB+M+KQUeHMnkMABY4ADLcw=;
        b=PKI8yVoU1rR/+IMInWHA+nycXoYV0WMILuKCjg4ldap5PP+rzqSxbqGwjT9xdnY44H
         ptdax/XyGRfnw5sUsaLeaViKk+Eijo3bysn11AjsiRnuasHRebC0pBlWlj8qY+FD/9W7
         hUuw5CYg96BINbq7gdVueTba2g3jnwP/Pz0imT9cmt6vsCKJwyRko2+EaBnn0vZFxc7g
         98yHywUS+p4bA1SzaZGYkAskFJIObd0obGOLkWmDIXeN9Ur39GzmS9vsasEzvrTyKRX0
         2Vdr0R7MvGLWia8DtXrvisnXHMi3VVvap3VbALiTfr7VqmZi91duT3yViYup66YThwF2
         gS3g==
X-Forwarded-Encrypted: i=1; AHgh+Rr7nPa1dorKAmM4/hDGpVXD8DElfatk14P79x8+ya7PWTyRs1hzNZhkC0Ci6maFRlHkLiDxmGb3OQKAFwF09t+k@lists.infradead.org
X-Gm-Message-State: AOJu0Yw64n0dPNZlFTxum44ls9Xpfm7kZac1l3oXPorRYl8RZMwy9g0n
	2uM8zRlSMu9NqipUXtTnO7HY4u5x+JrDkil5y9Z8k1Hs5KCmNDGZUhpD5xDQfo0OCQ==
X-Gm-Gg: AR+sD12/JpZiNmYhOiz8lbtifzMkIHl3FnxQ6FIF/oUEZPdQWSr4ZxJn4fUbXaLQOEz
	XGPr3f3zTqRPJ7V114DxQddvwL9OczI2uOpYArlpigSyOYiBQXXZpUVbp4uHWzPv9fAZoQl/FN0
	2hcxDUjZji9vF7inXpXStWAEmf7VrIc7/7DCaszqLGPFOXv6NRvqQQMT1Uw7X6TOYc3X2D+/7N1
	WbBzo5YPjp7nAWd/qN/kqTyAEh+XhDYMJk0pfXsX5LcZQXbTDd+Tt4RRjApDfoYO63sB2EvQjm7
	8QiptyJgKR79aVwXNCYAEvJaWvgt2jBOdEvO/VXuK0t+VE1G2Fn9FWEqYExSyfv1cWkNy/URzPY
	NkAfW5yExIBHx8//U/Hcv+v4KdyI9UFLxB5TuaeKhAsFGM5Ob7QN3lvKO9HfvHn7Z+/D58vqJUo
	6OP6zcDlUA5pi92CJ1LhfJ/wflPy6357nLLn55N6icsA3AxE9PNiduHXh/HeE=
X-Received: by 2002:a17:902:ce8a:b0:2cc:61e8:5fba with SMTP id d9443c01a7336-2cf349a2153mr182756085ad.32.1784616881554;
        Mon, 20 Jul 2026 23:54:41 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:3916:f048:32c3:931f])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf3448ee77sm69716005ad.4.2026.07.20.23.54.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 23:54:41 -0700 (PDT)
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
Subject: [PATCH v6 01/16] device property: Add fwnode_graph_get_port_by_id()
Date: Tue, 21 Jul 2026 14:53:56 +0800
Message-ID: <20260721065413.2306137-2-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.229.g6434b31f56-goog
In-Reply-To: <20260721065413.2306137-1-wenst@chromium.org>
References: <20260721065413.2306137-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_235442_517527_D27B0645 
X-CRM114-Status: GOOD (  16.26  )
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

In some cases the driver needs a reference to the port firmware node.
Once such case is the upcoming USB power sequencing integration. The
USB hub port is tied to the corresponding port firmware node if it
exists.

Provide a helper for this.

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Changes since v5:
- Dropped left-over declaration in header (Sashiko)

Changes since v4:
- Added flags parameter so users can specify whether incomplete ports
  are returned or not (Sashiko)

Changes since v2:
- Moved "Return:" kernel-doc section to the end. (Andy)

Changes since v1:
- New patch
---
 drivers/base/property.c  | 29 +++++++++++++++++++++++++++++
 include/linux/property.h |  2 ++
 2 files changed, 31 insertions(+)

diff --git a/drivers/base/property.c b/drivers/base/property.c
index 9387bb83eb54..950defc0c55a 100644
--- a/drivers/base/property.c
+++ b/drivers/base/property.c
@@ -1346,6 +1346,35 @@ int fwnode_graph_parse_endpoint(const struct fwnode_handle *fwnode,
 }
 EXPORT_SYMBOL(fwnode_graph_parse_endpoint);
 
+/**
+ * fwnode_graph_get_port_by_id - get the port matching a given id
+ * @fwnode: parent fwnode_handle containing the graph
+ * @id: id of the port
+ * @flags: fwnode lookup flags
+ *
+ * The caller is responsible for calling fwnode_handle_put() on the returned
+ * fwnode pointer.
+ *
+ * Does not return ports that belong to disabled devices or endpoints that
+ * are unconnected, unless FWNODE_GRAPH_DEVICE_DISABLED is passed in @flags.
+ *
+ * Return: A 'port' firmware node pointer with refcount incremented.
+ */
+struct fwnode_handle *fwnode_graph_get_port_by_id(struct fwnode_handle *fwnode,
+						  u32 id,
+						  unsigned long flags)
+{
+	struct fwnode_handle *ep;
+
+	ep = fwnode_graph_get_endpoint_by_id(fwnode, id, 0,
+					     flags | FWNODE_GRAPH_ENDPOINT_NEXT);
+	if (!ep)
+		return NULL;
+
+	return fwnode_get_next_parent(ep);
+}
+EXPORT_SYMBOL_GPL(fwnode_graph_get_port_by_id);
+
 const void *device_get_match_data(const struct device *dev)
 {
 	return fwnode_call_ptr_op(dev_fwnode(dev), device_get_match_data, dev);
diff --git a/include/linux/property.h b/include/linux/property.h
index 14c304db4664..01ea010cb2f9 100644
--- a/include/linux/property.h
+++ b/include/linux/property.h
@@ -505,6 +505,8 @@ int fwnode_get_phy_mode(const struct fwnode_handle *fwnode);
 
 void __iomem *fwnode_iomap(struct fwnode_handle *fwnode, int index);
 
+struct fwnode_handle *fwnode_graph_get_port_by_id(struct fwnode_handle *fwnode, u32 id,
+						  unsigned long flags);
 struct fwnode_handle *fwnode_graph_get_next_endpoint(
 	const struct fwnode_handle *fwnode, struct fwnode_handle *prev);
 struct fwnode_handle *
-- 
2.55.0.229.g6434b31f56-goog


