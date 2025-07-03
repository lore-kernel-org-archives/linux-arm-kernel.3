Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1905C83F05
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Jul 2025 21:00:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Gl3AfvrAqWM75eSRBustfWrGC3vEIj9xFdcjghwF26s=; b=WefdbgQWT150dLJPKgP+DBJ3Di
	vFDjJs8Z5IHyPnyOAf1RLtHka6OqQTnUv1j/xjxCdJUZQjBl8msVmf0LBibnUK0vHmm/J71VrJJFJ
	LH+xAASBQmuKojLzCPtPQgAtcUZtOKSysRijFItnwnM4QnJIFzNMhf5OXTBbe0+RkJRdBerbWnsQc
	briyLTtQzPNf+3ZsXSsVEucz1Awd7OnbHtOFrXSW/ZkFmNk75fDr1ulH9yAsWHtRZGrlLBdvOFre/
	4stKAz9vHoy2Xu404iitR/AQ+EQyNlzZY+B9znd9R7NQbdJFFOthEbtEUpUqg2zVWWKhucNf1rzkM
	oi8jZwLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXR2X-0000000CXqt-1NgU;
	Thu, 03 Jul 2025 21:00:17 +0000
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXNZv-0000000C6lY-0Bj0;
	Thu, 03 Jul 2025 17:18:32 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 590FC41C7D;
	Thu,  3 Jul 2025 17:18:24 +0000 (UTC)
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
Subject: [PATCH v2 0/7] Bluetooth: Fix typos
Date: Thu,  3 Jul 2025 19:16:54 +0200
Message-ID: <20250703171815.1011001-1-hadess@hadess.net>
X-Mailer: git-send-email 2.50.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddvtdekiecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvufffkffoggfgsedtkeertdertddtnecuhfhrohhmpeeurghsthhivghnucfpohgtvghrrgcuoehhrgguvghssheshhgruggvshhsrdhnvghtqeenucggtffrrghtthgvrhhnpeffleeuffejvdeufeffvdejjedvheekgfeltdejhfeitdettefgjedvuedvhfejueenucfkphepvdgrtddumegvfeegmegvtgejfeemtghfvddtmeejudgurgemfegsugemvddtrgelmedufeefnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegvfeegmegvtgejfeemtghfvddtmeejudgurgemfegsugemvddtrgelmedufeefpdhhvghlohepohhlihhmphhitgdpmhgrihhlfhhrohhmpehhrgguvghssheshhgruggvshhsrdhnvghtpdhnsggprhgtphhtthhopedvfedprhgtphhtthhopehtrhhivhhirghlsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehmrghrtggvlheshhholhhtmhgrnhhnrdhorhhgpdhrtghpthhtoheplhhuihiirdguvghnthiisehgmhgrihhlrdgtohhmpdhrtghpthhtohepshgvrghnrdifrghnghesmhgvughirghtvghkrdgtohhmpdhrtghpthhtohepmhgrthhthhhir
 ghsrdgsghhgsehgmhgrihhlrdgtohhmpdhrtghpthhtoheprghnghgvlhhoghhiohgrtggthhhinhhordguvghlrhgvghhnohestgholhhlrggsohhrrgdrtghomhdprhgtphhtthhopehsvhgvnheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepjhesjhgrnhhnrghurdhnvght
X-GND-Sasl: hadess@hadess.net
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250703_101831_210400_E5D291E1 
X-CRM114-Status: UNSURE (   6.55  )
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

Found using codespell.

Probably best taken in through the Bluetooth tree.

Changes since v1:
- Added whether typos were in comments or log strings
- Fix typo in typo fix ("btrtl: Fix typo")

Bastien Nocera (7):
  Bluetooth: btintel: Fix typo in comment
  Bluetooth: btmtk: Fix typo in log string
  Bluetooth: btrtl: Fix typo in comment
  Bluetooth: hci_bcm4377: Fix typo in comment
  Bluetooth: aosp: Fix typo in comment
  Bluetooth: RFCOMM: Fix typos in comments
  Bluetooth: Fix typos in comments

 drivers/bluetooth/btintel.c     | 2 +-
 drivers/bluetooth/btmtkuart.c   | 2 +-
 drivers/bluetooth/btrtl.c       | 2 +-
 drivers/bluetooth/hci_bcm4377.c | 2 +-
 net/bluetooth/aosp.c            | 2 +-
 net/bluetooth/hci_conn.c        | 2 +-
 net/bluetooth/hci_event.c       | 4 ++--
 net/bluetooth/hci_sync.c        | 2 +-
 net/bluetooth/lib.c             | 2 +-
 net/bluetooth/rfcomm/core.c     | 3 ++-
 net/bluetooth/rfcomm/tty.c      | 2 +-
 net/bluetooth/smp.c             | 2 +-
 12 files changed, 14 insertions(+), 13 deletions(-)

-- 
2.50.0


