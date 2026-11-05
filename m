Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D369606D81A
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 13:57:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=O2F/UfGU;
	dkim=pass (2048-bit key, unprotected) header.d=microchip.com header.i=@microchip.com header.a=rsa-sha256 header.s=mchp header.b=rByIASE+
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=e7wT2yGob85ifRxCsV6U3m9YBG9zt8WRGoWe1BQWqIw=; b=O2F/UfGUC3Y2G+bJ4lQ/Y/AwxM
	L8wyUznW1XGmgrwX8PXV7YDZlsi3DxReVwP8HLJZW2uO98JoGP/VIBOagQokVDjwRUhE7STNi1Jv+
	+wjT8/MujJ4aYtt3MkD9QH1P2J65c+1jPE6wDw89qVCfl4IMc1rk+0MXeiMcqXu/66+S0NkzI8uxQ
	vH5K3qPu135Zq3Pr6+LX2ValQ4dcwf4VJGx3FcaNxFv+qTEnar3RybSCxH1kp9UdE+30bhZeLglM1
	/qvYLTy5YSYOXNGL4sKLw9HJQOZNXQCRqhaLu/d0aWzAuAQSNF3L1Eq+sYoPM5bADt084bcipr03W
	ZjXw+xVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOxxg-00000009BXT-14tN;
	Thu, 05 Nov 2026 13:57:04 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOxxd-00000009BWP-3CXu
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 13:57:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1793887028; x=1825423028;
  h=from:subject:date:message-id:mime-version:
   content-transfer-encoding:to:cc;
  bh=LT9YvVTwX5ClQDSkgjnIYk9iP1LIi8iIDcZW9w1Sw6M=;
  b=rByIASE+tC+MP17kdR/6ZGU+ivn+knDrjhxXt3AI8UR4XVL8HuU+Ya4v
   //6ZtqqhVWDd1ujfszvjAwTpiXI7GyHLymUI4ozzS7+o4vybA/rJoyr2D
   Wc3vMl5wo2cCrXkCS7w0+QRUU3VnZqNW6fQXQMG3Az/bJY1nGoLtLpcBn
   VLn0GlhySs3OO/UiAzJI3agOmbQ0Eg8Wn0fX/nAkUlYzqoYvK10mL5k5T
   pFAF1I4WCU7YMUX3Un+iqOiV1AOEZEXeE16PrlQZ1P9jEHbx8Dq3/+uBP
   UFTNpcHSWPqxkESyC2kbybJTfF19vRjnHcs9IFEJo4cgh2Su8VYi4Kzgx
   Q==;
X-CSE-ConnectionGUID: rMkeJ72aTpKem9ht+vZWLQ==
X-CSE-MsgGUID: yrn6G6ADTYuFE7RJo+BM+w==
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="66320525"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 05 Nov 2026 06:57:07 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Thu, 5 Nov 2026 06:57:00 -0700
Received: from DEN-DL-M70577.microsemi.net (10.10.85.11) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Thu, 5 Nov 2026 06:56:58 -0700
From: Daniel Machon <daniel.machon@microchip.com>
Subject: [PATCH net-next 0/9] net: sparx5/lan969x: add support for changing
 the MTU
Date: Thu, 5 Nov 2026 14:56:35 +0100
Message-ID: <20261105-sparx5-mtu-change-v1-0-f27bab580463@microchip.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABOL7GoC/y2MQQ5AMBAAvyJ7tkkRGr4iDoste1DSljQRf9eI4
 yQzc4NnJ+yhy25wfImX3SYo8gymlezCKHNiKFXZqLZS6A9yscYtnPgLs+ZxLEibiQhSdzg2Er9
 nD5YDWo4Bhud5AX4CYgBtAAAA
X-Change-ID: 20260930-sparx5-mtu-change-d7ebb1a7fcaa
To: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
	<davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski
	<kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Steen Hegelund
	<Steen.Hegelund@microchip.com>, <UNGLinuxDriver@microchip.com>, "Richard
 Cochran" <richardcochran@gmail.com>, Russell King <linux@armlinux.org.uk>
CC: <netdev@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, Robert Marko <robert.marko@sartura.hr>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_055702_077649_D4416B64 
X-CRM114-Status: GOOD (  13.47  )
X-Spam-Score: -4.4 (----)
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
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This series adds support for changing the MTU on Sparx5 and lan969x.

Currently, there is no ndo_change_mtu callback, and the MAC maximum
frame length, the FDMA buffers, the queue watermarks and the TAS guard
band are all fixed for a 1518 byte frame. This series makes them follow
the MTU, and sets the maximum MTU from the 14000 byte frame limit of the
MACs. As the FDMA is shared by all ports, new buffers are allocated
while the FDMA keeps running, and the FDMA is only stopped briefly to
replace them. Details are in the commits.

Patches 1-2 are fixes: patch 1 makes the FDMA stop sequence actually
stop the channels, and patch 2 frees the FDMA buffers on init errors
and deinit. They are routed to net-next rather than net, as they
fix issues that are not regressions, and the stop sequence is only used
on deinit until this series uses it to resize the buffers.

Patches 3-4 prepare for the MTU change, by adding a helper for setting
the MAC maximum frame length, and by making the FDMA init and alloc
functions operate on the rings passed to them.

Patches 5-6 size the FDMA buffers from the port MTUs, and add support
for resizing them.

Patches 7-8 scale the queue watermarks and the TAS guard band with the
MTU.

Patch 9 adds the ndo_change_mtu callback and sets the maximum MTU.

Tested on Sparx5 (PCB135) and lan969x (EV23X71A), by forwarding frames
up to the MTU and checking that frames one byte over the MTU are
dropped, by sending jumbo frames to and from the CPU while stepping the
MTU up and down between 1500 and 9216, and by changing the MTU
repeatedly while flooding the CPU with frames in both directions.

Signed-off-by: Daniel Machon <daniel.machon@microchip.com>
---
Daniel Machon (9):
      net: sparx5/lan969x: stop the FDMA channels properly
      net: sparx5/lan969x: free the FDMA buffers on init errors and deinit
      net: sparx5/lan969x: add a helper for setting the MAC max frame length
      net: sparx5/lan969x: pass the FDMA rings to the init and alloc functions
      net: sparx5/lan969x: size the FDMA buffers from the port MTUs
      net: sparx5/lan969x: add support for resizing the FDMA buffers
      net: sparx5/lan969x: scale the queue watermarks with the MTU
      net: sparx5/lan969x: scale the TAS guard band with the MTU
      net: sparx5/lan969x: add support for changing the MTU

 .../ethernet/microchip/sparx5/lan969x/lan969x.c    |  10 +
 .../ethernet/microchip/sparx5/lan969x/lan969x.h    |   2 +
 .../microchip/sparx5/lan969x/lan969x_fdma.c        | 178 ++++++++++--
 .../net/ethernet/microchip/sparx5/sparx5_fdma.c    | 321 ++++++++++++++++++---
 .../net/ethernet/microchip/sparx5/sparx5_main.c    |   2 +
 .../net/ethernet/microchip/sparx5/sparx5_main.h    |  13 +
 .../ethernet/microchip/sparx5/sparx5_main_regs.h   |  34 +++
 .../net/ethernet/microchip/sparx5/sparx5_netdev.c  |  48 ++-
 .../net/ethernet/microchip/sparx5/sparx5_port.c    | 123 +++++---
 .../net/ethernet/microchip/sparx5/sparx5_port.h    |   5 +
 drivers/net/ethernet/microchip/sparx5/sparx5_tas.c |  43 ++-
 11 files changed, 679 insertions(+), 100 deletions(-)
---
base-commit: 4bca33ba24db72e2870a3352442af1c312272146
change-id: 20260930-sparx5-mtu-change-d7ebb1a7fcaa

Best regards,
-- 
Daniel Machon <daniel.machon@microchip.com>


