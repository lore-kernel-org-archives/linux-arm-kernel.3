Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F4CDC44500
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jul 2026 11:03:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b3mY17pOHR7Cz6c2b8dxl7oG2Wt8NUoj3LgplMYXljY=; b=BVMyXqjLnAhBsvHfDiXhkC5wjt
	EHUigjkrynYoUV+gY8Z6D8ZykRfpiAHboBjHDwBKBNnmvrPx1FAevYzftrUHnwwlTIzUixoG2gtJD
	9oDzmPCed3wnAZ4pR7mo3WOBlR/yMdcXi4QxFX2NnNgcnDi43+hWnCVnJocBZDel0Hqau/w8qgq6K
	SokhrSh94goW6YF+UWpNn2iNYY//z0hse31/VG/lUH7MkGD6+I8dNbjGvUcwh1MUJvO/vBnfqlHU+
	XxhPqCRo8YZN48dFg9xz4LpOupn3GRm9bkuSrdDXRKWiZAEHgta59vDzIxbm0QQmOBd61VIC3Y2VK
	pY1JLbUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfbgU-00000006l2p-39DJ;
	Fri, 03 Jul 2026 11:03:50 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfbgR-00000006kyj-08xl
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Jul 2026 11:03:49 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-2caced6038eso5205165ad.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 03 Jul 2026 04:03:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1783076626; x=1783681426; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b3mY17pOHR7Cz6c2b8dxl7oG2Wt8NUoj3LgplMYXljY=;
        b=Lyf+8x+gJPizIABtbGorCvy7DObFZLwEZtL2TyqiR/4o2JrZZ6ncn4rYFuAiVmzHhj
         YGtDZ4W6GKV1uYuf/vK+KQKi4xYtfsnX3Hleiok257siqq52NGpBKX0ojKQdATh3+Kqh
         5mAvv5/kQUzfBGnt2d4It0zTC2EHAfWsWtuac=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783076626; x=1783681426;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=b3mY17pOHR7Cz6c2b8dxl7oG2Wt8NUoj3LgplMYXljY=;
        b=EFUAnwS+cMEQyl1Bssxk7cBHUZiw+gV4m1aVV+umRJfO28KigG8BStjaWDsgzqFa8s
         OMpZV41vwseAmrGKoiIulTFylZsTvjXJhqM4OsZNEWoYxTjyC7I71d1MY1xs2eAg3Va0
         gMkr0lXbEXzkMHFyRItyurFy9B7PfKqijwC7nTFqS/360OwISfVoCtJvz/PUcQM5zSH/
         6W+YhhiXo1wOS1/k28GfBd6iwvOr9zRhay648TUFvvPaIQ6nep0V+5Z8va26HHnff41z
         wS9CXClIN5rL3hA2ZSUYzoX/f+koCwL4MKKeNFccQvmY56O86NtzI2i4EHxeW1gAiI85
         wOvw==
X-Forwarded-Encrypted: i=1; AHgh+Rp6qWig8Pn1YXqZRNrn0bvlY7I/DceaOXyWKJG48MqOP0LFT9BikQ6CAMCnWW9vCtOeGb4SL4WkQ+i3BOu3NXw+@lists.infradead.org
X-Gm-Message-State: AOJu0YzlV5qBCp8uwhlYgQpXgIetnpQ3/maTq/v6QUHtpwoWiXUDd7hz
	k7cPoWGkRGv6XIYu8WddG11nee4pkyMoNrjDSOWzJfMmtt4Z/xlcD/WcehluMBhMpJ1YifKSdf4
	VvUU=
X-Gm-Gg: AfdE7cnKnN+w5c5fWQzX1gkvjLTa+ugp/cmM96s3fTCz6IGogcJSKlkzXein9Uky61Q
	FufcvHEeOtOXGCtL1o8FxFpZydYu8CmF2meDTGmUv3hz6zypCzrNw60o+WEZ/tjTemtGq+Zfwy7
	QfidTzGSs/dXOwIu3OlSzfwDx1zqDBcvoVdSpM2olkkldEmGJiIRoKNC5ITzZZAuEt2nWRN0JP3
	mNNVl3wpG5kxHF6gctHYs7DRWmjCnz/3AyGm6A+p/bjqGHncXhZWkVQSg/0H1QErG0ujUkDw5/Q
	KDk7m92Uv9eXvcECpJYjLS+04qtC5CaUK5RMGLKoGCjKkAzvRwdK2zcC8M04bK2R8jF4z3Fu/f2
	Ft9SywD90hTIgBL+DYmerKweBIU8AQUKCEWYCATHPnRdqEcwa0YHY6PRldBJ4x+KzGNQ21WiugY
	ksk7fo+nPJJAiNUFPTKSCl2MMKl6cSiAaauXq37knHoi9RMYkVAI+aOVHBhqPa/X8oIxc3WQ==
X-Received: by 2002:a17:902:c947:b0:2c9:fc4c:8142 with SMTP id d9443c01a7336-2cacabb1b50mr37971215ad.2.1783076626047;
        Fri, 03 Jul 2026 04:03:46 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:7bc5:6c83:76cd:cbd6])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cad6f25e15sm7785315ad.13.2026.07.03.04.03.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 04:03:45 -0700 (PDT)
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
	Alan Stern <stern@rowland.harvard.edu>
Subject: [PATCH v3 02/13] device property: Add fwnode_graph_get_next_port_endpoint()
Date: Fri,  3 Jul 2026 19:03:03 +0800
Message-ID: <20260703110317.1283411-3-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.rc0.799.gd6f94ed593-goog
In-Reply-To: <20260703110317.1283411-1-wenst@chromium.org>
References: <20260703110317.1283411-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260703_040347_431591_FDBCDF1F 
X-CRM114-Status: GOOD (  17.66  )
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
2.55.0.rc0.799.gd6f94ed593-goog


