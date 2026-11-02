Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3BE8606A33C
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 09:25:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Lh8OikEm;
	dkim=pass (1024-bit key, unprotected) header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=Ih3rFhL9
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=IsopkYbASgaNsvWK1EU2JdJ6JNwJnxcBHh6aeYgiZ/0=; b=Lh8OikEmfqgq8NtXLBIG74EtTU
	7uGg+ZXjL/vxiRGhIlB/p2nm0SgSSJp8/Os7a4fXGz6I6OUwu9qI28idbSn33lx7ElWyEJUez6sqv
	D4F/F6LF5ZTDIwwhIMlEwfntoaAwGef2We30nLyjedSSb78I8JcatdP+1LLS0uw4tOn5qObcxTgzD
	GAQYZKsqW0kPXMJ8Oa/Hd2zr/yHoCZUgoTiawYKYvRbX1ZK7Rf5Ip3ZWgtA2+NNqG6OiQokgAW1kZ
	g3xl1uTIVezND6BboENGpA64nwXpIdbNEnmJA99sxnD2CD0DsrmZV8JKl4udMJTlEUE0R+ZROzAgk
	pK+o1kOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNoIG-0000000FzbM-14YQ;
	Mon, 02 Nov 2026 09:25:32 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNoIC-0000000FzUE-3zIU;
	Mon, 02 Nov 2026 09:25:30 +0000
X-UUID: 5589ed4cd69f11f1afed4741b24580c9-20261102
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=IsopkYbASgaNsvWK1EU2JdJ6JNwJnxcBHh6aeYgiZ/0=;
	b=Ih3rFhL9tbvv6T/AbGdCZZ/HbDETusxr8olbYd2qabPumZRxQfn+FmvG/PyJhy9ps9cRS0LOKaqwYM6aIHbwp/n7yrekt7htdHvjMjeIVxWDbKBYWXXY1RF3NmCX6I/b5bZfSQ2HS2+ZAR6G2PKVgdSuUXDiCBJ6qK7FiTyNtvQ=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.21,REQID:3f2757b1-a6e5-43b8-a688-18cdea77528c,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:b0318ac,CLOUDID:04f2a340-45ea-40f0-99fe-3ce442058644,B
	ulkID:nil,BulkQuantity:0,SF:81|82|102|136|836|865|888|898,TC:-5,Content:0|
	15|50|99,EDM:-3|-100,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL
	:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 5589ed4cd69f11f1afed4741b24580c9-20261102
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by mailgw01.mediatek.com
	(envelope-from <santino.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1192813715; Mon, 02 Nov 2026 02:25:24 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 2 Nov 2026 17:25:22 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Mon, 2 Nov 2026 17:25:22 +0800
From: santino.wang <santino.wang@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: <linux-mediatek@lists.infradead.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<light.chen@mediatek.com>, <Fred-WY.Chen@mediatek.com>,
	<arnab.layek@mediatek.com>, Santino Wang <santino.wang@mediatek.com>
Subject: [RFC PATCH 11/11] Documentation: ABI: add the sysfs attributes of the MediaTek DRAM ECC driver
Date: Mon, 2 Nov 2026 17:23:33 +0800
Message-ID: <20261102092334.138759-12-santino.wang@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20261102092334.138759-1-santino.wang@mediatek.com>
References: <20261102092334.138759-1-santino.wang@mediatek.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_012529_081204_9A8C19E1 
X-CRM114-Status: GOOD (  21.89  )
X-Spam-Note: SpamAssassin invocation failed
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Santino Wang <santino.wang@mediatek.com>

Document the error counters, the retired page counters, the recorded
error addresses and the policy attributes that the driver adds under
its class device.

Signed-off-by: Santino Wang <santino.wang@mediatek.com>
---
 .../ABI/testing/sysfs-class-mtk-dram-ecc      | 182 ++++++++++++++++++
 MAINTAINERS                                   |   1 +
 2 files changed, 183 insertions(+)
 create mode 100644 Documentation/ABI/testing/sysfs-class-mtk-dram-ecc

diff --git a/Documentation/ABI/testing/sysfs-class-mtk-dram-ecc b/Documentation/ABI/testing/sysfs-class-mtk-dram-ecc
new file mode 100644
index 000000000000..7b31bd663c53
--- /dev/null
+++ b/Documentation/ABI/testing/sysfs-class-mtk-dram-ecc
@@ -0,0 +1,182 @@
+What:		/sys/class/mtk-dram-ecc/mtk-dram-ecc0/counters/volatile_ce
+		/sys/class/mtk-dram-ecc/mtk-dram-ecc0/counters/volatile_uce_inline
+		/sys/class/mtk-dram-ecc/mtk-dram-ecc0/counters/volatile_uce_ondie
+		/sys/class/mtk-dram-ecc/mtk-dram-ecc0/counters/volatile_uce
+Date:		November 2026
+KernelVersion:	7.4
+Contact:	Santino Wang <santino.wang@mediatek.com>
+Description:
+		Number of corrected (CE) and uncorrectable (UCE) DRAM ECC errors
+		reported since the system booted, as a decimal number.
+
+		Inline ECC detects every UCE, including one that originates in the
+		DRAM die, so volatile_uce_inline is the total number of UCEs and
+		volatile_uce is equal to it. volatile_uce_ondie counts the subset
+		that on-die ECC also flagged.
+
+		Access: Read
+
+What:		/sys/class/mtk-dram-ecc/mtk-dram-ecc0/counters/agg_ce
+		/sys/class/mtk-dram-ecc/mtk-dram-ecc0/counters/agg_uce_inline
+		/sys/class/mtk-dram-ecc/mtk-dram-ecc0/counters/agg_uce_ondie
+		/sys/class/mtk-dram-ecc/mtk-dram-ecc0/counters/agg_uce
+Date:		November 2026
+KernelVersion:	7.4
+Contact:	Santino Wang <santino.wang@mediatek.com>
+Description:
+		Number of corrected (CE) and uncorrectable (UCE) DRAM ECC errors
+		accumulated across boots, as a decimal number. The counters are kept
+		in EFI variables that the system firmware creates.
+
+		As for the volatile counters, agg_uce_inline is the total number of
+		UCEs, agg_uce is equal to it and agg_uce_ondie counts the subset that
+		on-die ECC also flagged.
+
+		Access: Read
+
+What:		/sys/class/mtk-dram-ecc/mtk-dram-ecc0/retired/by_ce
+		/sys/class/mtk-dram-ecc/mtk-dram-ecc0/retired/by_uce
+Date:		November 2026
+KernelVersion:	7.4
+Contact:	Santino Wang <santino.wang@mediatek.com>
+Description:
+		Number of pages retired since the system booted because of
+		corrected errors (by_ce) or uncorrectable errors (by_uce), as a
+		decimal number. Each page is counted once.
+
+		Access: Read
+
+What:		/sys/class/mtk-dram-ecc/mtk-dram-ecc0/addresses/current_boot_ce
+		/sys/class/mtk-dram-ecc/mtk-dram-ecc0/addresses/current_boot_uce
+Date:		November 2026
+KernelVersion:	7.4
+Contact:	Santino Wang <santino.wang@mediatek.com>
+Description:
+		System physical addresses of the corrected (current_boot_ce) and
+		uncorrectable (current_boot_uce) errors reported since the system
+		booted, one hexadecimal address per line. At most 256 addresses are
+		kept for each kind.
+
+		Access: Read
+
+What:		/sys/class/mtk-dram-ecc/mtk-dram-ecc0/policy/containment/enabled
+Date:		November 2026
+KernelVersion:	7.4
+Contact:	Santino Wang <santino.wang@mediatek.com>
+Description:
+		Whether the secure firmware handles and reports DRAM ECC errors.
+		While it is disabled, the secure firmware only clears the error
+		source and publishes no record. Writing the value sends it to
+		the secure firmware.
+
+		Access: Read, Write
+		Valid values: Represented as boolean
+
+What:		/sys/class/mtk-dram-ecc/mtk-dram-ecc0/policy/containment/default_severity
+Date:		November 2026
+KernelVersion:	7.4
+Contact:	Santino Wang <santino.wang@mediatek.com>
+Description:
+		Severity the secure firmware reports for a contained uncorrectable
+		error that is not covered by an entry of policy/address_range.
+		Writing the value sends it to the secure firmware.
+
+		Access: Read, Write
+		Valid values: "fatal" or "recoverable"
+
+What:		/sys/class/mtk-dram-ecc/mtk-dram-ecc0/policy/storm_protection/threshold
+Date:		November 2026
+KernelVersion:	7.4
+Contact:	Santino Wang <santino.wang@mediatek.com>
+Description:
+		Number of error interrupts within policy/storm_protection/time_window
+		at which the secure firmware stops reporting DRAM ECC interrupts, to
+		protect the system from an interrupt storm. Writing the value sends it
+		to the secure firmware.
+
+		Access: Read, Write
+		Valid values: Represented as unsigned integer
+
+What:		/sys/class/mtk-dram-ecc/mtk-dram-ecc0/policy/storm_protection/time_window
+Date:		November 2026
+KernelVersion:	7.4
+Contact:	Santino Wang <santino.wang@mediatek.com>
+Description:
+		Length of the window, in milliseconds, in which the secure firmware
+		counts error interrupts for policy/storm_protection/threshold.
+		Writing the value sends it to the secure firmware.
+
+		Access: Read, Write
+		Valid values: Represented as unsigned integer
+
+What:		/sys/class/mtk-dram-ecc/mtk-dram-ecc0/policy/storm_protection/cooldown
+Date:		November 2026
+KernelVersion:	7.4
+Contact:	Santino Wang <santino.wang@mediatek.com>
+Description:
+		Time, in milliseconds, after which the secure firmware reports DRAM
+		ECC interrupts again once storm protection has stopped them. Writing
+		the value sends it to the secure firmware.
+
+		Access: Read, Write
+		Valid values: Represented as unsigned integer
+
+What:		/sys/class/mtk-dram-ecc/mtk-dram-ecc0/policy/leaky_bucket/threshold
+Date:		November 2026
+KernelVersion:	7.4
+Contact:	Santino Wang <santino.wang@mediatek.com>
+Description:
+		Number of corrected errors on a page at which the page is retired.
+		Writing 0 restores the default of 100.
+
+		Access: Read, Write
+		Valid values: 0 to 10000
+
+What:		/sys/class/mtk-dram-ecc/mtk-dram-ecc0/policy/leaky_bucket/decay_interval_sec
+Date:		November 2026
+KernelVersion:	7.4
+Contact:	Santino Wang <santino.wang@mediatek.com>
+Description:
+		Interval, in seconds, at which the corrected error count of every
+		tracked page is decreased by one. Writing 0 restores the default of
+		3600.
+
+		Access: Read, Write
+		Valid values: 0 to 86400
+
+What:		/sys/class/mtk-dram-ecc/mtk-dram-ecc0/policy/leaky_bucket/max_tracked
+Date:		November 2026
+KernelVersion:	7.4
+Contact:	Santino Wang <santino.wang@mediatek.com>
+Description:
+		Maximum number of pages whose corrected error count is tracked at
+		the same time. Writing 0 restores the default of 16.
+
+		Access: Read, Write
+		Valid values: 0 to 16
+
+What:		/sys/class/mtk-dram-ecc/mtk-dram-ecc0/policy/address_range/entries
+Date:		November 2026
+KernelVersion:	7.4
+Contact:	Santino Wang <santino.wang@mediatek.com>
+Description:
+		Address ranges for which the secure firmware overrides the default
+		severity of an uncorrectable error. Reading lists the table held by
+		the secure firmware, one range per line, as
+		"<start> <end> <severity>" with hexadecimal addresses, where the end
+		address is exclusive.
+
+		Writing "<start> <end> <severity>" adds or updates one range. The
+		severity is "fatal" or "recoverable".
+
+		Access: Read, Write
+
+What:		/sys/class/mtk-dram-ecc/mtk-dram-ecc0/policy/address_range/clear
+Date:		November 2026
+KernelVersion:	7.4
+Contact:	Santino Wang <santino.wang@mediatek.com>
+Description:
+		Writing anything to this attribute removes every range from the
+		table of policy/address_range/entries.
+
+		Access: Write
diff --git a/MAINTAINERS b/MAINTAINERS
index e7d25be97f24..d1ab5806ad9c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -17032,6 +17032,7 @@ L:	linux-kernel@vger.kernel.org
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 L:	linux-mediatek@lists.infradead.org (moderated for non-subscribers)
 S:	Maintained
+F:	Documentation/ABI/testing/sysfs-class-mtk-dram-ecc
 F:	drivers/soc/mediatek/dram-ecc/
 F:	include/uapi/linux/mtk_dram_ecc_netlink.h
 
-- 
2.45.2


