Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A868CCCF9E3
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Nov 2025 07:02:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=EXbElhX+ptAAewmxv8geWDgvA/1j/SS0H7xKvmYJw3o=; b=pl1PQyaObbW/vmVMxhLJsdVeUL
	/hF3jVS2Z2q3dOj5d39CHPMCosIgU3+hJHtQ8scr+ds/4Zpa/PhtbYyu/zAmSLD9EMwroqbStAamm
	32qENtui/HiG7HHpRQMUm+ZubGO8BH1nbTAK8OrAVzyHdgnHYSnYxOWdTxTjQUZNxdl0NaQz8fJ8X
	Gghd+sIeBmMQGmLA3TuYkblDvU5C634vcbyEax522ReIVPj0qHAhxUruXIwmZL+0uDgd6LZd5hrUE
	cdBAh3fOApONSQvl6ZC2y1pqlgTsyn0nbU4Ifla2fp3Z6W0O3LRNuS2/iSpTKy7jvV71RdYfIw7Id
	Ej/nyskw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGB3a-0000000BI98-0TGc;
	Tue, 04 Nov 2025 07:02:18 +0000
Received: from [50.53.43.113] (helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGB3Z-0000000BI8t-0M5H;
	Tue, 04 Nov 2025 07:02:17 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-usb@vger.kernel.org
Cc: Randy Dunlap <rdunlap@infradead.org>,
	Chunfeng Yun <chunfeng.yun@mediatek.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH] usb: xhci-mtk: correct most kernel-doc problems in xhci-mtk.h
Date: Mon,  3 Nov 2025 23:02:16 -0800
Message-ID: <20251104070216.907540-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.51.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Correct the kernel-doc notation in xhck-mtk.h to avoid most kernel-doc
warnings. Summary of changes:

- don't use /** to begin comments that are not in kernel-doc format
- add missing "struct mu3h_sch_tt" kernel-doc line
- convert several "struct mu3h_...:" to using " - " to separate the
  struct name from its short description
- add a missing @speed: struct member description

Warning messages that are fixed:

xhci-mtk.h:25: warning: This comment starts with '/**', but isn't a
 kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
 * To simplify scheduler algorithm, set a upper limit for ESIT,
xhci-mtk.h:25: warning: missing initial short description on line:
 * To simplify scheduler algorithm, set a upper limit for ESIT,

Warning: drivers/usb/host/xhci-mtk.h:36 Cannot find identifier on line:
 * @fs_bus_bw_out: save bandwidth used by FS/LS OUT eps in each uframes
Warning: drivers/usb/host/xhci-mtk.h:37 Cannot find identifier on line:
 * @fs_bus_bw_in: save bandwidth used by FS/LS IN eps in each uframes
Warning: drivers/usb/host/xhci-mtk.h:38 Cannot find identifier on line:
 * @ls_bus_bw: save bandwidth used by LS eps in each uframes
Warning: drivers/usb/host/xhci-mtk.h:39 Cannot find identifier on line:
 * @fs_frame_bw: save bandwidth used by FS/LS eps in each FS frames
Warning: drivers/usb/host/xhci-mtk.h:40 Cannot find identifier on line:
 * @in_ss_cnt: the count of Start-Split for IN eps
Warning: drivers/usb/host/xhci-mtk.h:41 Cannot find identifier on line:
 * @ep_list: Endpoints using this TT
Warning: drivers/usb/host/xhci-mtk.h:42 Cannot find identifier on line:
 */
Warning: drivers/usb/host/xhci-mtk.h:43 Cannot find identifier on line:
struct mu3h_sch_tt {
Warning: drivers/usb/host/xhci-mtk.h:44 Cannot find identifier on line:
        u16 fs_bus_bw_out[XHCI_MTK_MAX_ESIT];
Warning: drivers/usb/host/xhci-mtk.h:45 Cannot find identifier on line:
        u16 fs_bus_bw_in[XHCI_MTK_MAX_ESIT];
Warning: drivers/usb/host/xhci-mtk.h:46 Cannot find identifier on line:
        u8 ls_bus_bw[XHCI_MTK_MAX_ESIT];
Warning: drivers/usb/host/xhci-mtk.h:47 Cannot find identifier on line:
        u16 fs_frame_bw[XHCI_MTK_FRAMES_CNT];
Warning: drivers/usb/host/xhci-mtk.h:48 Cannot find identifier on line:
        u8 in_ss_cnt[XHCI_MTK_MAX_ESIT];
Warning: drivers/usb/host/xhci-mtk.h:49 Cannot find identifier on line:
        struct list_head ep_list;
Warning: drivers/usb/host/xhci-mtk.h:50 Cannot find identifier on line:
};
Warning: drivers/usb/host/xhci-mtk.h:51 Cannot find identifier on line:

Warning: drivers/usb/host/xhci-mtk.h:52 Cannot find identifier on line:
/**
Warning: drivers/usb/host/xhci-mtk.h:121 struct member 'speed' not
 described in 'mu3h_sch_ep_info'

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
---

This leaves 12 warnings (below) due to not using valid kernel-doc.
I can fix these as well if you would like for me to do that.

Warning: drivers/usb/host/xhci-mtk.h:150 struct member 'ip_pw_ctr0' not described in 'mu3c_ippc_regs'
Warning: drivers/usb/host/xhci-mtk.h:150 struct member 'ip_pw_ctr1' not described in 'mu3c_ippc_regs'
Warning: drivers/usb/host/xhci-mtk.h:150 struct member 'ip_pw_ctr2' not described in 'mu3c_ippc_regs'
Warning: drivers/usb/host/xhci-mtk.h:150 struct member 'ip_pw_ctr3' not described in 'mu3c_ippc_regs'
Warning: drivers/usb/host/xhci-mtk.h:150 struct member 'ip_pw_sts1' not described in 'mu3c_ippc_regs'
Warning: drivers/usb/host/xhci-mtk.h:150 struct member 'ip_pw_sts2' not described in 'mu3c_ippc_regs'
Warning: drivers/usb/host/xhci-mtk.h:150 struct member 'reserved0' not described in 'mu3c_ippc_regs'
Warning: drivers/usb/host/xhci-mtk.h:150 struct member 'reserved1' not described in 'mu3c_ippc_regs'
Warning: drivers/usb/host/xhci-mtk.h:150 struct member 'u3_ctrl_p' not described in 'mu3c_ippc_regs'
Warning: drivers/usb/host/xhci-mtk.h:150 struct member 'u2_ctrl_p' not described in 'mu3c_ippc_regs'
Warning: drivers/usb/host/xhci-mtk.h:150 struct member 'reserved2' not described in 'mu3c_ippc_regs'
Warning: drivers/usb/host/xhci-mtk.h:150 struct member 'reserved3' not described in 'mu3c_ippc_regs'

---
Cc: Chunfeng Yun <chunfeng.yun@mediatek.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-mediatek@lists.infradead.org
---
 drivers/usb/host/xhci-mtk.h |   10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

--- linux-next-20251103.orig/drivers/usb/host/xhci-mtk.h
+++ linux-next-20251103/drivers/usb/host/xhci-mtk.h
@@ -21,7 +21,7 @@
 /* support at most 64 ep, use 32 size hash table */
 #define SCH_EP_HASH_BITS	5
 
-/**
+/*
  * To simplify scheduler algorithm, set a upper limit for ESIT,
  * if a synchromous ep's ESIT is larger than @XHCI_MTK_MAX_ESIT,
  * round down to the limit value, that means allocating more
@@ -34,6 +34,7 @@
 #define XHCI_MTK_FRAMES_CNT	(XHCI_MTK_MAX_ESIT / UFRAMES_PER_FRAME)
 
 /**
+ * struct mu3h_sch_tt - TT scheduling data
  * @fs_bus_bw_out: save bandwidth used by FS/LS OUT eps in each uframes
  * @fs_bus_bw_in: save bandwidth used by FS/LS IN eps in each uframes
  * @ls_bus_bw: save bandwidth used by LS eps in each uframes
@@ -51,7 +52,7 @@ struct mu3h_sch_tt {
 };
 
 /**
- * struct mu3h_sch_bw_info: schedule information for bandwidth domain
+ * struct mu3h_sch_bw_info - schedule information for bandwidth domain
  *
  * @bus_bw: array to keep track of bandwidth already used at each uframes
  *
@@ -63,7 +64,7 @@ struct mu3h_sch_bw_info {
 };
 
 /**
- * struct mu3h_sch_ep_info: schedule information for endpoint
+ * struct mu3h_sch_ep_info - schedule information for endpoint
  *
  * @esit: unit is 125us, equal to 2 << Interval field in ep-context
  * @num_esit: number of @esit in a period
@@ -77,6 +78,7 @@ struct mu3h_sch_bw_info {
  * @ep_type: endpoint type
  * @maxpkt: max packet size of endpoint
  * @ep: address of usb_host_endpoint struct
+ * @speed: usb device speed
  * @allocated: the bandwidth is aready allocated from bus_bw
  * @offset: which uframe of the interval that transfer should be
  *		scheduled first time within the interval
@@ -125,7 +127,7 @@ struct mu3h_sch_ep_info {
 #define MU3C_U2_PORT_MAX 5
 
 /**
- * struct mu3c_ippc_regs: MTK ssusb ip port control registers
+ * struct mu3c_ippc_regs - MTK ssusb ip port control registers
  * @ip_pw_ctr0~3: ip power and clock control registers
  * @ip_pw_sts1~2: ip power and clock status registers
  * @ip_xhci_cap: ip xHCI capability register

