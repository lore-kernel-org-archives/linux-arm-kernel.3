Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 521ADC44506
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 09:57:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tHa+N6e2rl6wq1SgVHpliLB/r9n0zCkbXlX81Kt00W0=; b=j9/d7psLt/EejORz9HlAPPbqL2
	Km7IYI+XbgETRE4I8wfY3jr46fZySOwSm2gv+SRWNQJcGBFQwuvN3HflKgpHk4FDh6JXRFJ9OG4KF
	CjFGqXp48Vi9GOTCkbX4fbj+IkLj9tlqh2x5Hxccf1l7fgx4qeG2YvZmYh02p5uvYONPusUAV10Bf
	NNwVL3SiyDhZjFXpCVwJ9V3yIHrRa8rSU8oFwCoeokL6UWW+JXSLEYKVRY2rPAACNKYmak+Yhb22z
	nf98KvZHq3D0vs1ZIa+YnlGvSiDnJ225ZLCPYUnLaJIYdFtGe+NcTgG0eJ/s9pHj30Dx81p3Ms35k
	gMd4QHxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whlVu-00000001oq0-212R;
	Thu, 09 Jul 2026 09:57:50 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whlVs-00000001onu-3IGh
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jul 2026 09:57:49 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-2cc891373e0so15986465ad.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 09 Jul 2026 02:57:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1783591068; x=1784195868; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tHa+N6e2rl6wq1SgVHpliLB/r9n0zCkbXlX81Kt00W0=;
        b=G+qMTF9M9bk7Chc16x7g5mOLlfD6aOS15iOCY7cfB1E4RJgAUrT/xTwjE/Tjl0Q1NN
         2whaM+3l1PGoUhzB2YKRCfZL/tyP4YcJPRMIjoXjUNX+kTA12lfURf6y9kHhj8m7t1fN
         SEnchdjtDoVFlFv3JdyQmL3Vj5Jg3IvH9AHL0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783591068; x=1784195868;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tHa+N6e2rl6wq1SgVHpliLB/r9n0zCkbXlX81Kt00W0=;
        b=cesDwutUESiNqMgUlkK8vUxS0tHiufVMY0rkT4TExBbycvc9rb5eAh9QFoBvsQhAIO
         Vol9RDdeTwDKeqIBNJVfk8QRFeq6ReqdxgDQF/KJ/3yQLpxNHiobZj1hPY5/B8hXeW4N
         iWgH+AVc/vBQ+8hbR18hakcm3i5toN1PlWmZM2VQqRzg/lF2UjKpnu2UCHa3IsvAtANO
         PL7+PORxJCh0jf/rsxGMO8xpDCC5pqgyiNKJU5cVGGY+Tl8ea4GjXuq8xJcTw2UFdSP6
         vyETcH15xmWLehIWAoWMYYPp9CriD2ADxuLsS+b2xsBIjanwsrrpfJ/oJPFYVmfLVORo
         TV7g==
X-Forwarded-Encrypted: i=1; AHgh+Rqj6bnvMh8BeRZBtly4ibW08HsVgf9NswVsiiTj7xCUMHf89PkAbhj/iX1ayG+m+ZKmkQSGPvJ+gnyLLmDwFH+V@lists.infradead.org
X-Gm-Message-State: AOJu0YwkboQHhdhDMlbEXVWmj990BCkVMtz2xrkoaozCleHfvrbcDRUM
	C/MAWDi4KvA8JgfcGkBKd5ErvGhfTqyVdA4SIwkXJPRLOS3jsuEwVnPiATu4saF3PQ==
X-Gm-Gg: AfdE7ck1UU5v9TGF+2lKUQFCN62hAOUk2Yqb2o3iBz/K0AaSp5cOm5pMsM8WqD+w0VT
	B/IYzsCJe8QpGISOy/lcsmZ+g1nMJZz5GC1dg+wnKgO4PYNFNzftwMvJawSWUIXT3M5W7sLVQ2L
	MIgoPwSQBEQEqJVevVu+95J0MBSlq/TqijqJINeX/Z35ZH9IwPd0v7hZ5rEnbPan6cxLan58KcO
	2+XrTjH7cYxX7aLhn7lwX5Yc7dYfgk2dIySFtOFmy8vXm8NtJtXPBqaZ+OfUg6RJ2vSxweQeKmk
	9ESQAzw5xWzCDyf00B5bMBTqWwgyndMVjGWjjQh5Yyz+17OE2Rqw0IQBlEo1yavhgM4Xu8hLFpV
	8ZMRNQfKPcXnKBMFlNy4L4AP1aYdtHKxv9i7J6rPTgIzVGhwh4E643CP81b++ff2Mo3oc5pE+aJ
	siaqAhnNuJpU3hgHTK/pK+atNBuQwsdDWP02HLXS2uTfVx2bJ6JsEAC7OYWHn7aFjYKLx9onjT4
	zVKBoB1
X-Received: by 2002:a17:903:46cc:b0:2c9:e261:95c4 with SMTP id d9443c01a7336-2ccea464f02mr67670245ad.30.1783591068202;
        Thu, 09 Jul 2026 02:57:48 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:bd09:6ddb:180a:69c5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9d5bd2fsm41082155ad.78.2026.07.09.02.57.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 02:57:47 -0700 (PDT)
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
Subject: [PATCH v4 02/14] device property: Add fwnode_graph_get_next_port_endpoint()
Date: Thu,  9 Jul 2026 17:57:07 +0800
Message-ID: <20260709095726.704448-3-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.795.g602f6c329a-goog
In-Reply-To: <20260709095726.704448-1-wenst@chromium.org>
References: <20260709095726.704448-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_025748_824159_57779952 
X-CRM114-Status: GOOD (  17.78  )
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

Due to design constraints of the power sequencing API, the consumer
must first be sure that the other side is actually a provider, or it
will continually get -EPROBE_DEFER when requesting the power
sequencing descriptor.

In the upcoming USB power sequencing integration, the USB hub driver
first needs to check whether a graph connection exists, and whether
the other side of the connection is a supported connector type. The
USB port is tied to a "port" firmware node, and this new helper will
be used to get the endpoint under the known "port" firmware node.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Changes since v2:
- Dropped unused |ep| variable
- Rewrote as do {} while()
- Dropped WARN() use
---
 drivers/base/property.c  | 25 +++++++++++++++++++++++++
 include/linux/property.h |  2 ++
 2 files changed, 27 insertions(+)

diff --git a/drivers/base/property.c b/drivers/base/property.c
index 3e3e19ef66a9..7e7ad3635806 100644
--- a/drivers/base/property.c
+++ b/drivers/base/property.c
@@ -1099,6 +1099,31 @@ int fwnode_irq_get_byname(const struct fwnode_handle *fwnode, const char *name)
 }
 EXPORT_SYMBOL(fwnode_irq_get_byname);
 
+/**
+ * fwnode_graph_get_next_port_endpoint - Get next endpoint firmware node in port
+ * @port: Pointer to the target port firmware node
+ * @prev: Previous endpoint node or %NULL to get the first
+ *
+ * The caller is responsible for calling fwnode_handle_put() on the returned
+ * fwnode pointer. Note that this function also puts a reference to @prev
+ * unconditionally.
+ *
+ * Return: an endpoint firmware node pointer or %NULL if no more endpoints
+ * are available.
+ */
+struct fwnode_handle *fwnode_graph_get_next_port_endpoint(const struct fwnode_handle *port,
+							  struct fwnode_handle *prev)
+{
+	do {
+		prev = fwnode_get_next_child_node(port, prev);
+		if (fwnode_name_eq(prev, "endpoint"))
+			break;
+	} while (prev);
+
+	return prev;
+}
+EXPORT_SYMBOL_GPL(fwnode_graph_get_next_port_endpoint);
+
 /**
  * fwnode_graph_get_next_endpoint - Get next endpoint firmware node
  * @fwnode: Pointer to the parent firmware node
diff --git a/include/linux/property.h b/include/linux/property.h
index e04901c0bd8f..931e703393cb 100644
--- a/include/linux/property.h
+++ b/include/linux/property.h
@@ -506,6 +506,8 @@ int fwnode_get_phy_mode(const struct fwnode_handle *fwnode);
 void __iomem *fwnode_iomap(struct fwnode_handle *fwnode, int index);
 
 struct fwnode_handle *fwnode_graph_get_port_by_id(struct fwnode_handle *fwnode, u32 id);
+struct fwnode_handle *fwnode_graph_get_next_port_endpoint(
+	const struct fwnode_handle *port, struct fwnode_handle *prev);
 struct fwnode_handle *fwnode_graph_get_next_endpoint(
 	const struct fwnode_handle *fwnode, struct fwnode_handle *prev);
 struct fwnode_handle *
-- 
2.55.0.795.g602f6c329a-goog


