Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EF9FC83F03
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Jul 2025 22:06:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q/iOuHj5KX9GuXeKQABZ2gCw3mHlOv+e0egMHCqcqhc=; b=SffDA/SycSe8WnRzDCZea5hLCG
	ZupNRsSfY/bE62jt+7m5c8zZdjZGU3TKxQdwzngrSLYYCfp3S2gcWWugUSk//qb/nOrIrK3SVciz7
	uQSLFEWR9h9B36rkUwHMFBfvxMTel7cebEgXmNZr6uhDmoNCOTJV7TklV4DO+8Pcop3TQEFhFhBz0
	8gmeEsFp4VWlovmMwWS4XlL45MzfW0uQ0E51Uh4bsi4abPGrITWnfDGZM7+TPB0grsvBu2rKpaN1q
	7UdfH9ygThygD6tvaTUGxxhsGPIY5Hmx0Y69q7DfoZPRoNT4K/ynDsM8i8UvKIlxcOtwsqL2O4tUA
	Nknv4NjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXS4Z-0000000Cg6g-1Nwu;
	Thu, 03 Jul 2025 22:06:27 +0000
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXNaA-0000000C6q2-0D04;
	Thu, 03 Jul 2025 17:18:47 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id DD0E6442C9;
	Thu,  3 Jul 2025 17:18:41 +0000 (UTC)
From: Bastien Nocera <hadess@hadess.net>
To: trivial@kernel.org,
	Marcel Holtmann <marcel@holtmann.org>,
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Sven Peter <sven@kernel.org>,
	Janne Grunau <j@jannau.net>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Neal Gompa <neal@gompa.dev>,
	Johan Hedberg <johan.hedberg@gmail.com>,
	Ingo Molnar <mingo@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Bastien Nocera <hadess@hadess.net>,
	Al Viro <viro@zeniv.linux.org.uk>,
	Kees Cook <kees@kernel.org>,
	Erick Archer <erick.archer@outlook.com>,
	Chris Lu <chris.lu@mediatek.com>,
	linux-bluetooth@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	asahi@lists.linux.dev
Subject: [PATCH v2 7/7] Bluetooth: Fix typos in comments
Date: Thu,  3 Jul 2025 19:17:01 +0200
Message-ID: <20250703171815.1011001-8-hadess@hadess.net>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250703171815.1011001-1-hadess@hadess.net>
References: <20250703171815.1011001-1-hadess@hadess.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddvtdekiecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeeurghsthhivghnucfpohgtvghrrgcuoehhrgguvghssheshhgruggvshhsrdhnvghtqeenucggtffrrghtthgvrhhnpeekteetgeettdehieduiedttdetffelleehtdejkeeluedvgfffvdevteetudfhkeenucfkphepvdgrtddumegvfeegmegvtgejfeemtghfvddtmeejudgurgemfegsugemvddtrgelmedufeefnecuvehluhhsthgvrhfuihiivgepieenucfrrghrrghmpehinhgvthepvdgrtddumegvfeegmegvtgejfeemtghfvddtmeejudgurgemfegsugemvddtrgelmedufeefpdhhvghlohepohhlihhmphhitgdpmhgrihhlfhhrohhmpehhrgguvghssheshhgruggvshhsrdhnvghtpdhnsggprhgtphhtthhopedvfedprhgtphhtthhopehtrhhivhhirghlsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehmrghrtggvlheshhholhhtmhgrnhhnrdhorhhgpdhrtghpthhtoheplhhuihiirdguvghnthiisehgmhgrihhlrdgtohhmpdhrtghpthhtohepshgvrghnrdifrghnghesmhgvughirghtvghkrdgtohhmpdhrtghpthhtohepmhgrthhth
 hhirghsrdgsghhgsehgmhgrihhlrdgtohhmpdhrtghpthhtoheprghnghgvlhhoghhiohgrtggthhhinhhordguvghlrhgvghhnohestgholhhlrggsohhrrgdrtghomhdprhgtphhtthhopehsvhgvnheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepjhesjhgrnhhnrghurdhnvght
X-GND-Sasl: hadess@hadess.net
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250703_101846_217259_9A2FDAC8 
X-CRM114-Status: GOOD (  18.02  )
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

Found by codespell.

Signed-off-by: Bastien Nocera <hadess@hadess.net>
---
 net/bluetooth/hci_conn.c  | 2 +-
 net/bluetooth/hci_event.c | 4 ++--
 net/bluetooth/hci_sync.c  | 2 +-
 net/bluetooth/lib.c       | 2 +-
 net/bluetooth/smp.c       | 2 +-
 5 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/net/bluetooth/hci_conn.c b/net/bluetooth/hci_conn.c
index 4f379184df5b..cb360adbb6ec 100644
--- a/net/bluetooth/hci_conn.c
+++ b/net/bluetooth/hci_conn.c
@@ -814,7 +814,7 @@ static int hci_le_big_terminate(struct hci_dev *hdev, u8 big, struct hci_conn *c
  *
  * Detects if there any BIS left connected in a BIG
  * broadcaster: Remove advertising instance and terminate BIG.
- * broadcaster receiver: Teminate BIG sync and terminate PA sync.
+ * broadcaster receiver: Terminate BIG sync and terminate PA sync.
  */
 static void bis_cleanup(struct hci_conn *conn)
 {
diff --git a/net/bluetooth/hci_event.c b/net/bluetooth/hci_event.c
index 66052d6aaa1d..a546cb058e8e 100644
--- a/net/bluetooth/hci_event.c
+++ b/net/bluetooth/hci_event.c
@@ -5754,7 +5754,7 @@ static void le_conn_complete_evt(struct hci_dev *hdev, u8 status,
 	conn->state = BT_CONFIG;
 
 	/* Store current advertising instance as connection advertising instance
-	 * when sotfware rotation is in use so it can be re-enabled when
+	 * when software rotation is in use so it can be re-enabled when
 	 * disconnected.
 	 */
 	if (!ext_adv_capable(hdev))
@@ -7077,7 +7077,7 @@ static void hci_le_big_info_adv_report_evt(struct hci_dev *hdev, void *data,
 /* Entries in this table shall have their position according to the subevent
  * opcode they handle so the use of the macros above is recommend since it does
  * attempt to initialize at its proper index using Designated Initializers that
- * way events without a callback function can be ommited.
+ * way events without a callback function can be omitted.
  */
 static const struct hci_le_ev {
 	void (*func)(struct hci_dev *hdev, void *data, struct sk_buff *skb);
diff --git a/net/bluetooth/hci_sync.c b/net/bluetooth/hci_sync.c
index 6687f2a4d1eb..febad7922008 100644
--- a/net/bluetooth/hci_sync.c
+++ b/net/bluetooth/hci_sync.c
@@ -5633,7 +5633,7 @@ int hci_abort_conn_sync(struct hci_dev *hdev, struct hci_conn *conn, u8 reason)
 	}
 
 	/* Cleanup hci_conn object if it cannot be cancelled as it
-	 * likelly means the controller and host stack are out of sync
+	 * likely means the controller and host stack are out of sync
 	 * or in case of LE it was still scanning so it can be cleanup
 	 * safely.
 	 */
diff --git a/net/bluetooth/lib.c b/net/bluetooth/lib.c
index 43aa01fd07b9..305044a84478 100644
--- a/net/bluetooth/lib.c
+++ b/net/bluetooth/lib.c
@@ -54,7 +54,7 @@ EXPORT_SYMBOL(baswap);
  * bt_to_errno() - Bluetooth error codes to standard errno
  * @code: Bluetooth error code to be converted
  *
- * This function takes a Bluetooth error code as input and convets
+ * This function takes a Bluetooth error code as input and converts
  * it to an equivalent Unix/standard errno value.
  *
  * Return:
diff --git a/net/bluetooth/smp.c b/net/bluetooth/smp.c
index 47f359f24d1f..5b4ade03bdcc 100644
--- a/net/bluetooth/smp.c
+++ b/net/bluetooth/smp.c
@@ -3172,7 +3172,7 @@ static void smp_ready_cb(struct l2cap_chan *chan)
 	/* No need to call l2cap_chan_hold() here since we already own
 	 * the reference taken in smp_new_conn_cb(). This is just the
 	 * first time that we tie it to a specific pointer. The code in
-	 * l2cap_core.c ensures that there's no risk this function wont
+	 * l2cap_core.c ensures that there's no risk this function won't
 	 * get called if smp_new_conn_cb was previously called.
 	 */
 	conn->smp = chan;
-- 
2.50.0


