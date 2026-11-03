Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1720606A326
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 12:49:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=t/NdyGu7;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=nxGW8aHx
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=DvLrEwFnnOMt3PTsnR8P7yQJiGzTT/5N3IGwtm50AhM=; b=t/NdyGu7geW4BTdZF/vCeLU+La
	t+4IKROEvV56s4xFbmMR4c0PQSHzR1mL856hdOVZklv9rKqdFhPpoQ+9wnGWQKJ9hO4/uR8OIjA46
	6e6ZTMS/tfL2zO++576LG2IGR62jnKsqEPJ4FZNz7cJ76tGMnZwrD//AAbAd+ye30WWcMd8N0T2ZK
	V2ZvOlZarpq/RzrIgW/gfxkO65tuIw9pDvwCpAcrehwBaoi/NJ+qDYZPCvKlEUO1B7DLm2opoSW9T
	yyWhJVuXdQUnoY3XHlKfjiwF/fpSPEMlj1vyP88jdZprnB+UVxY7zgk/elezJGQ2pXoJko66b5e3P
	uzfWufsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xODwY-00000002Pjk-1Oo6;
	Tue, 03 Nov 2026 12:48:50 +0000
Received: from mgamail.intel.com ([198.175.65.21])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xODwW-00000002PjF-1zCE;
	Tue, 03 Nov 2026 12:48:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793710128; x=1825246128;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=szLErHR8O0Xef4JCXJ3dLezPIj9VfgU7oaY9Ib/XukA=;
  b=nxGW8aHx6p4oMDKo3mXSMPH2jTnoai/AhnCsZ9Kj/a3EYxd/gufgD+qL
   KireKyiulbCReB5Z831+MkFv+tnYO+Uu49un/eMWsMicv6bYVb2AcEIha
   lnRccYZfzkvXSgNqU+9kkXJw7xaCVZ8mIwkO42JHRGvbKP8SVurJiDJXM
   2yUCmmZrNXLzBPlZxzrZEq5Gv9a3dbxED+Gv6x7S/eSdmGZW1Wtvr6Tea
   9GO9RqeK2MnmxD6DcmgfJTF5NLBqKp7vsW6U13OXbSy4aPt4uEWHtgg/u
   1v54wl3C8VdJIakXmaSHpxeorsjwdiQkg2FnoWcJM33UuY6ekvRwcD3kf
   w==;
X-CSE-ConnectionGUID: eyhbV29ASXyZjKHP5PqbIg==
X-CSE-MsgGUID: BrpytEcuRVqKY1icfrSkpw==
X-IronPort-AV: E=McAfee;i="6800,10657,11954"; a="2523719"
X-IronPort-AV: E=Sophos;i="6.27,193,1787036400"; 
   d="scan'208";a="2523719"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2026 04:48:45 -0800
X-CSE-ConnectionGUID: W54yryuwSc6+vAc5NpYeHw==
X-CSE-MsgGUID: Oha4hgXqS9Kbdg4gTOflHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,193,1787036400"; 
   d="scan'208";a="6953453"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa010.fm.intel.com with ESMTP; 03 Nov 2026 04:48:43 -0800
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id 21F9A99; Tue, 03 Nov 2026 13:48:42 +0100 (CET)
Date: Tue, 3 Nov 2026 13:48:42 +0100
From: "mika.westerberg@linux.intel.com" <mika.westerberg@linux.intel.com>
To: Chunfeng Yun =?utf-8?B?KOS6keaYpeWzsCk=?= <Chunfeng.Yun@mediatek.com>
Cc: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
	"westeri@kernel.org" <westeri@kernel.org>,
	"gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	"YehezkelShB@gmail.com" <YehezkelShB@gmail.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"andreas.noever@gmail.com" <andreas.noever@gmail.com>,
	"matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>
Subject: Re: [PATCH 4/4] thunderbolt: prevent pcie tunnel activation/teardown
 warnings
Message-ID: <20261103124842.GA158991@black.igk.intel.com>
References: <20261030082539.1208733-1-chunfeng.yun@mediatek.com>
 <20261030082539.1208733-5-chunfeng.yun@mediatek.com>
 <20261030085628.GS158991@black.igk.intel.com>
 <82f1a3227685b241938ccb500b97d1e73212bf36.camel@mediatek.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <82f1a3227685b241938ccb500b97d1e73212bf36.camel@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_044848_589850_2AE55819 
X-CRM114-Status: GOOD (  16.16  )
X-Spam-Score: -4.2 (----)
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
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi,

On Tue, Nov 03, 2026 at 08:33:51AM +0000, Chunfeng Yun (云春峰) wrote:
> On Fri, 2026-10-30 at 09:56 +0100, Mika Westerberg wrote:
> > On Fri, Oct 30, 2026 at 04:25:39PM +0800, Chunfeng Yun wrote:
> > > When usb4 enter sleep mode, echo 1 to authorized of sysfile,
> > > will wakeup usb4 driver, but fail to create pcie tunnel, cause
> > > the warning due to a race condition between switch disconnect
> > 
> > It's router
> will modify it.
> 
> > 
> > > during resume and user authorization
> [  278.831186] usb4_hi NVDA8100:00: 0:1: is unplugged (state: 7),
> retrying...
> [  278.943031] usb4_hi NVDA8100:00: 0:1: failed to reach state
> TB_PORT_UP. Ignoring port...
> [  278.951125] usb4_hi NVDA8100:00: 0:1: lost during suspend,
> disconnecting
> [  278.957819] usb4_hi NVDA8100:00: 0:4 <-> 1:16 (USB3): deactivating
> [  278.964794] usb4_hi NVDA8100:00: deactivating USB3 Down path from
> 0:4 to 1:16
> [  278.972737] usb4_hi NVDA8100:00: deactivating USB3 Up path from 1:16
> to 0:4
> [  278.980504] usb4_hi NVDA8100:00: 0: TMU: mode change off -> bi-
> directional, HiFi requested
> [  278.991265] usb4_hi NVDA8100:00: 0: TMU: mode set to: bi-
> directional, HiFi
> [  278.999511] usb4_hi NVDA8100:00: 0:1: total credits changed 66 -> 66
> [  279.006408] usb4_hi NVDA8100:00: 1: link width set to symmetric,
> dual lanes
> [  279.013763] usb4_hi NVDA8100:00: 0:7 <-> 1:9 (PCI): activating
> [  279.019587] usb4_hi NVDA8100:00: activating PCIe Down path from 0:7
> to 1:9
> [  279.026468] usb4_hi NVDA8100:00: 1:1: Writing hop 1
> [  279.031335] usb4_hi NVDA8100:00: 1:1:  In HopID: 8 => Out port: 9
> Out HopID: 8
> [  279.038546] usb4_hi NVDA8100:00: 1:1:   Weight: 1 Priority: 3
> Credits: 32 Drop: 0 PM: 0
> [  279.046536] usb4_hi NVDA8100:00: 1:1:    Counter enabled: 0 Counter
> index: 2047
> [  279.053834] usb4_hi NVDA8100:00: 1:1:   Flow Control (In/Eg): 1/0
> Shared Buffer (In/Eg): 0/0
> [  279.062259] usb4_hi NVDA8100:00: 1:1:   Unknown1: 0x0 Unknown2: 0x0
> Unknown3: 0x0
> [  279.069730] ------------[ cut here ]------------
> [  279.074335] usb4_hi NVDA8100:00: PCIe Down path activation failed
> [  279.080426] WARNING: CPU: 5 PID: 2433 at
> drivers/thunderbolt/path.c:587 tb_path_activate+0x1a4/0x5b0
> ...
> [  279.220285] Call trace:
> [  279.222722]  tb_path_activate+0x1a4/0x5b0 (P)
> [  279.227068]  tb_tunnel_activate+0x140/0x498
> [  279.231241]  tb_tunnel_pci+0x180/0x490
> [  279.234980]  tb_domain_approve_switch+0x74/0xb0
> [  279.239500]  authorized_store+0x214/0x270
> [  279.243498]  dev_attr_store+0x20/0x70
> ...
> [  279.288888] ---[ end trace 0000000000000000 ]---
> [  279.293497] usb4_hi NVDA8100:00: 0:7 <-> 1:9 (PCI): activation
> failed
> 
> 
> root cause:
> 
> The warning were caused by a race condition between switch disconnect
> during resume and user authorization:
> 
>    1. While the system was in runtime suspend, userspace executed:
> 
>        echo 1 > /sys/bus/thunderbolt/devices/0-1/authorized
>    2. Writing to this sysfs attribute woke up the USB4 controller
> (nhi_runtime_resume).
>    3. During resume, the downstream port 0:1 failed to complete link
> training within the timeout and was declared lost:

Okay we get the warning but the bigger problem here is that why the link
does not come up anymore? Unless you unplugged the router as well.

