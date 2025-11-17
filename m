Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E37DDCEACEF
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Nov 2025 17:03:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BlkmGkeyiHzQAk88JzoXVqDDwoAwo7+9ndvZjH5BP+c=; b=3REH/rEJzAKI/bN9yk+UZFGhMx
	V+BA62U0jlTqN3zaXkU/t1vkekZu2OBtj7B0sV3e8NeNYNTlSgbwM/6h18+R8SuYPZYhWtU+0oMjG
	h1aUO7Jzm2hQgZdhgxC6aWlxafoL0ALn6ZAVSEXHcB07PCap86FHX0GxEtXgW/MGChKOdmbEBxkRk
	hK43oAE2JnbK/fF1HMCem/h1kQ5rT1mjMtzgXXXkCHXRwI4sicC9rIFemjy++VXKg/Wxn3cSd2ag4
	Q5w+RganvQ0GJ8SMbAXwbvMNwpu+8OJQ4TaEpyppn9x+IEfDKINwczPDoeIcjsZLAtXCVhmrE2XSy
	ISYwOYcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL2de-0000000GUnD-11zO;
	Mon, 17 Nov 2025 17:03:38 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL2da-0000000GUif-1DQL
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Nov 2025 17:03:35 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4337F168F;
	Mon, 17 Nov 2025 09:03:26 -0800 (PST)
Received: from e134344.cambridge.arm.com (e134344.arm.com [10.1.196.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 02CA83F66E;
	Mon, 17 Nov 2025 09:03:28 -0800 (PST)
From: Ben Horgan <ben.horgan@arm.com>
To: james.morse@arm.com
Cc: amitsinght@marvell.com,
	baisheng.gao@unisoc.com,
	baolin.wang@linux.alibaba.com,
	bobo.shaobowang@huawei.com,
	carl@os.amperecomputing.com,
	catalin.marinas@arm.com,
	dakr@kernel.org,
	dave.martin@arm.com,
	david@redhat.com,
	dfustini@baylibre.com,
	fenghuay@nvidia.com,
	gregkh@linuxfoundation.org,
	gshan@redhat.com,
	guohanjun@huawei.com,
	jeremy.linton@arm.com,
	jonathan.cameron@huawei.com,
	kobak@nvidia.com,
	lcherian@marvell.com,
	lenb@kernel.org,
	linux-acpi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	lpieralisi@kernel.org,
	peternewman@google.com,
	quic_jiles@quicinc.com,
	rafael@kernel.org,
	robh@kernel.org,
	rohit.mathew@arm.com,
	scott@os.amperecomputing.com,
	sdonthineni@nvidia.com,
	sudeep.holla@arm.com,
	tan.shaopeng@fujitsu.com,
	will@kernel.org,
	xhao@linux.alibaba.com,
	Ben Horgan <ben.horgan@arm.com>
Subject: [PATCH v5 34/34] MAINTAINERS: new entry for MPAM Driver
Date: Mon, 17 Nov 2025 17:00:13 +0000
Message-ID: <20251117170014.4113754-35-ben.horgan@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251117170014.4113754-1-ben.horgan@arm.com>
References: <20251117170014.4113754-1-ben.horgan@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251117_090334_381158_9F9D6479 
X-CRM114-Status: UNSURE (   9.02  )
X-CRM114-Notice: Please train this message.
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

Create a maintainer entry for the new MPAM Driver. Add myself and
James Morse as maintainers. James created the driver and I have
taken up the later versions of his series.

Cc: James Morse <james.morse@arm.com>
Signed-off-by: Ben Horgan <ben.horgan@arm.com>
---
 MAINTAINERS | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 46bd8e033042..ec9b2b255bef 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -17463,6 +17463,14 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/leds/backlight/mps,mp3309c.yaml
 F:	drivers/video/backlight/mp3309c.c
 
+MPAM DRIVER
+M:	James Morse <james.morse@arm.com>
+M:	Ben Horgan <ben.horgan@arm.com>
+S:	Maintained
+F:	drivers/resctrl/mpam_*
+F:	drivers/resctrl/test_mpam_*
+F:	include/linux/arm_mpam.h
+
 MPS MP2869 DRIVER
 M:	Wensheng Wang <wenswang@yeah.net>
 L:	linux-hwmon@vger.kernel.org
-- 
2.43.0


