Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 423A3606A327
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 23:00:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=PfMMSUiI;
	dkim=pass (2048-bit key, unprotected) header.d=amazon.com header.i=@amazon.com header.a=rsa-sha256 header.s=amazoncorp2 header.b=mAiJVoCn
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Bx9dmLmwaYxQpG+BTwnnaQsOLchBU9zfmloHGphj4zQ=; b=PfMMSUiIluPS2XpbEj3LLHon9y
	sCXVr9xB2iYfXt7E0XMRcK/5QmTc77RBNQtHNpwYGt3EgdAPiQPlApZHoDsKOeSyeZpLE79MmBOTo
	gmE1USYRxc8czqv/zlnou8aZ+zbW8qAzrIBT78jax94aPH+Y5t/d2fFyMm6xbpl390VF/V3KygQEs
	XSYISNgF+rGX6hBnw0SyyOzD4JPq2se/O5XClE9zA8GfNZnKob+tmh1vg9hx/EHCy+R+rLuaThpSO
	7zZLsQ8DDchllx2bz12y+gpvBhLwX/uYfjoJfR1Bb7osdGewUaBT4M3i94iOBseyP0bTqYWGT/Csi
	e/dt3SUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xO10g-00000000b54-1SZX;
	Mon, 02 Nov 2026 23:00:14 +0000
Received: from pdx-out-003.esa.us-west-2.outbound.mail-perimeter.amazon.com ([44.246.68.102])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xO10d-00000000b4h-2BKM
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Nov 2026 23:00:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1793660411; x=1825196411;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Bx9dmLmwaYxQpG+BTwnnaQsOLchBU9zfmloHGphj4zQ=;
  b=mAiJVoCn4leiXv2z+oUc9fG0ev45CF/NVIWPveJTuqqli+/DkFXwWevj
   RlMahbmFbpJ/Nuf8ODdsOAf8A/SAWXjXcTyGT/iHEOWsxjwvEXM+r1G2R
   CY3L2aHUllXaIzfWyFuHm+r6l0Bk66aWmLq8TtwQWskI9vc2CVn+9S/8W
   iTPR29BscN6vrTcl+DJSJ+abS4wuHx1g6jSlfNavQOi5k/7JNi6QP49Fg
   LShpT7EUWLghQwk9ccJc7gIWjMfxmWKB9BphMcEBiu+fHCbw8KM5JirBj
   dlu2h7O8u1Z2dqa9QRnmG0Ub+qKOHEPi+GUQOwrfsfbE4bk8rNyxn194j
   A==;
X-CSE-ConnectionGUID: WvY3G8QwQGG/gSZwz0tpwA==
X-CSE-MsgGUID: t3Jm7TmkSGmQgejYS0juxg==
X-IronPort-AV: E=Sophos;i="6.27,192,1787011200"; 
   d="scan'208";a="32840507"
Received: from ip-10-5-12-219.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.12.219])
  by internal-pdx-out-003.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2026 23:00:08 +0000
Received: from EX19MTAUWB001.ant.amazon.com [205.251.233.104:10796]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.18.155:2525] with esmtp (Farcaster)
 id dc83c2e5-c588-43f6-9b27-c4d9065b0b4e; Mon, 2 Nov 2026 23:00:07 +0000 (UTC)
X-Farcaster-Flow-ID: dc83c2e5-c588-43f6-9b27-c4d9065b0b4e
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWB001.ant.amazon.com (10.250.64.248) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.56;
 Mon, 2 Nov 2026 23:00:07 +0000
Received: from dev-dsk-patrzhan-2a-52a3f46b.us-west-2.amazon.com
 (172.22.91.11) by EX19D001UWA001.ant.amazon.com (10.13.138.214) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.56; Mon, 2 Nov 2026
 23:00:07 +0000
From: Patrick Zhang <patrzhan@amazon.com>
To: <netdev-bot+sashiko@kernel.org>
CC: Marc Kleine-Budde <mkl@pengutronix.de>, Vincent Mailhol
	<mailhol@kernel.org>, <linux-can@vger.kernel.org>, Pavel Pisa
	<pisa@cmp.felk.cvut.cz>, Ondrej Ille <ondrej.ille@gmail.com>, Harini T
	<harini.t@amd.com>, Michal Simek <michal.simek@amd.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	"Jakub Kicinski" <kuba@kernel.org>
Subject: Re: [PATCH v2 3/3] can: ifi_canfd: enable NAPI before starting the controller
Date: Mon, 2 Nov 2026 22:59:45 +0000
Message-ID: <20261102225945.1257987-1-patrzhan@amazon.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <179353749137.3127.3654469722382202292@kernel.org>
References: <179353749137.3127.3654469722382202292@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: EX19D031UWC003.ant.amazon.com (10.13.139.252) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_150011_621738_BB75BDD1 
X-CRM114-Status: UNSURE (   9.65  )
X-CRM114-Notice: Please train this message.
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
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Sun, 01 Nov 2026 12:51, netdev-bot+sashiko wrote:
> With NAPI enabled here, can ifi_canfd_poll() now run at the same time as
> the rest of ifi_canfd_start()?

I think the analysis is right, and moving the CAN state and the error
counter writes into ifi_canfd_reset_config() and masking the interrupts
there makes sense. With those changes, the patch reorders the reset,
error counter and interrupt mask writes on both the open and the bus-off
restart paths. At that point the change is no longer obviously correct
by inspection, and I do not have IFI CAN FD hardware to test it, so I
am not confident continuing with it.

I will drop this patch and send v3 with only the ctucanfd and xilinx_can
patches. The race in ifi_canfd_open() remains, and this thread may be a
useful starting point for someone who can test a fix.

pw-bot: cr

