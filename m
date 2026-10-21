Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03C47606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Oct 2026 20:59:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=yYyHxBhW;
	dkim=pass (2048-bit key, unprotected) header.d=amazon.com header.i=@amazon.com header.a=rsa-sha256 header.s=amazoncorp2 header.b=spa+wLUT
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=MB1VWokoTNzjBoK6XypOYuBfmm/Gm+5i6Hamx66M7Xk=; b=yYyHxBhWcGjgWRden6H9jNXVfv
	5YXmkicPmDw7QB1E034YkAGPA5s/SIsMcPmsrLAtO1/9poPXcyCAPjSF5HyfAgi5jcpljQZ/spndZ
	3A4IYIoH6psVRcCMKciVzXJfb/tUFXY/RQgC+OxAVTog/Amtjd632Su7R3Ec75dy5nlO2VMGiddJs
	wZ8ys3X3ku7WoduXd/GqPHNi5NgR+m3wiLiZ85sbSEQ8zozvmo1sLXUAY+pLGGGmguYXpB85H54Wk
	A0cQ9JS2cCe6rmw9Bq9mnc2smddpUqtPgyMSEfr5iQ0qR6Zxbsb9W7+Nap8nBtfQw017JbkJ9xL0F
	8smsRb/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJdPV-0000000CsYH-1cQm;
	Wed, 21 Oct 2026 20:59:45 +0000
Received: from pdx-out-002.esa.us-west-2.outbound.mail-perimeter.amazon.com ([44.246.1.125])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJdPT-0000000CsXZ-0o2Q
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 Oct 2026 20:59:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1792616383; x=1824152383;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=MB1VWokoTNzjBoK6XypOYuBfmm/Gm+5i6Hamx66M7Xk=;
  b=spa+wLUT2o8WyPG+uam/YJ2voQlFLkVtSUHJawULNl4SWnX/M62lEpPD
   /A8Rb88zEdaUVfca/4MsT+pJUGWtTZDlHC36JzFlIUcG82Txr/TrkLG1E
   xiSsdaxViVffuwuRW9uUElzEI9W/CaAo/iQB19gkPM7F9Isc3dmYfYV2j
   bNz1j/q78v7COeVck6InT4JhdEIFaixZf56Ki43wSjncTIIND586Uiebt
   fAbF5Al+Cq4YDfCtNsHqWbua6eT9DFNRWsXl1LLBiiAxIgJ1YE6bARw7x
   JbRokVuFPfuVxIxgbQiKqy+eCDdq/DAKqIvDvR9doX6d3w/fGTgwM7uwp
   Q==;
X-CSE-ConnectionGUID: Rkmt/MsITkyPWq0IYQKaUQ==
X-CSE-MsgGUID: QqDTH57+TNeT69MrtTe1mQ==
X-IronPort-AV: E=Sophos;i="6.27,170,1787011200"; 
   d="scan'208";a="31914408"
Received: from ip-10-5-9-48.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.9.48])
  by internal-pdx-out-002.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2026 20:59:38 +0000
Received: from EX19MTAUWA002.ant.amazon.com [205.251.233.178:11671]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.40.190:2525] with esmtp (Farcaster)
 id 3c360efc-706c-4df0-9397-675341b7d311; Wed, 21 Oct 2026 20:59:38 +0000 (UTC)
X-Farcaster-Flow-ID: 3c360efc-706c-4df0-9397-675341b7d311
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWA002.ant.amazon.com (10.250.64.202) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.49;
 Wed, 21 Oct 2026 20:59:38 +0000
Received: from dev-dsk-patrzhan-2a-52a3f46b.us-west-2.amazon.com
 (172.22.91.11) by EX19D001UWA001.ant.amazon.com (10.13.138.214) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.53; Wed, 21 Oct 2026
 20:59:37 +0000
From: Patrick Zhang <patrzhan@amazon.com>
To: Marc Kleine-Budde <mkl@pengutronix.de>, Vincent Mailhol
	<mailhol@kernel.org>, <linux-can@vger.kernel.org>
CC: Pavel Pisa <pisa@cmp.felk.cvut.cz>, Ondrej Ille <ondrej.ille@gmail.com>,
	Harini T <harini.t@amd.com>, Michal Simek <michal.simek@amd.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH 0/3] can: enable NAPI before starting the controller in three drivers
Date: Wed, 21 Oct 2026 20:59:21 +0000
Message-ID: <20261021205924.2538511-1-patrzhan@amazon.com>
X-Mailer: git-send-email 2.50.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: EX19D031UWA002.ant.amazon.com (10.13.139.96) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261021_135943_287585_26600C8F 
X-CRM114-Status: GOOD (  17.20  )
X-Spam-Score: -11.9 (-----------)
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
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi,

Three CAN drivers open the device in the order "start the controller
and unmask its RX interrupt, then napi_enable()". Each of them has an
ISR that masks the RX interrupt before calling napi_schedule(), and a
poll that is the only place the RX interrupt is unmasked again. A frame
that arrives between the controller start and napi_enable() is handled
by the ISR, which masks RX and calls napi_schedule() on a NAPI instance
that is still disabled. napi_schedule_prep() sees NAPI_STATE_SCHED set
and drops the schedule. napi_enable() clears SCHED without scheduling.
Nothing ever polls, so RX stays masked and the interface receives
nothing until the next close. Transmit keeps working and no error
counter moves, so the failure is silent.

The affected drivers are ctucanfd, xilinx_can and ifi_canfd. The fix is
the same in each: call napi_enable() before the controller start, so
that an early RX interrupt can schedule the poll, and call
napi_disable() on the error path if the start can fail.

Patch 1 (ctucanfd) was tested on QEMU with the ctucan_pci device.
Patch 2 (xilinx_can) was tested on a Versal board. Patch 3 (ifi_canfd)
is from code inspection only. I do not have the hardware, so it is
compile tested only. The sequence is the same as in the other two
drivers, and I would appreciate a test from someone who has an IFI CAN
FD core.

The bug has been present since each driver was added, so each patch
has a Fixes: tag pointing at the commit that added the driver.
Patches 1 and 2 are marked for stable backport. Patch 3 is not,
because it is untested. The patches are independent and can be
applied separately.

I looked at the other NAPI users under drivers/net/can. at91_can had
the same persistent-mask pattern in 6.6 but no longer masks RX in its
ISR since the conversion to rx-offload, so I left it alone; ti_hecc and
virtio_can start the device before napi_enable() but do not leave RX
masked, so a dropped first schedule only delays the first frame. All
the others enable NAPI before the device can interrupt.

Patrick Zhang (3):
  can: ctucanfd: enable NAPI before starting the controller
  can: xilinx_can: enable NAPI before starting the controller
  can: ifi_canfd: enable NAPI before starting the controller

 drivers/net/can/ctucanfd/ctucanfd_base.c | 6 +++++-
 drivers/net/can/ifi_canfd/ifi_canfd.c    | 5 ++++-
 drivers/net/can/xilinx_can.c             | 6 +++++-
 3 files changed, 14 insertions(+), 3 deletions(-)


base-commit: a7bfaba4823e3c165bb2004c74eff7c096672bc7
-- 
2.50.1

