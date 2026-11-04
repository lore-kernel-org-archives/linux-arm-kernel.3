Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9584606A328
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Nov 2026 08:09:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=pyK0Czc6;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=AcA76mZi
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=GdBo/TxNnOVemrXh2EGPlKcpC1+btQOcLPV2gMWTVCM=; b=pyK0Czc6ul5WkmDoahLh4aIeQr
	0aMbIyBpeDIQiNjHOJq/zNAh2ZY7b6u99qFewbNk4xKIOb4JMTLOgkoPHlS+A1539hCToBH/JQs1u
	35ArMqfyG/ofmrequGswLOfKhCjIGxAtTEddh8Vv3czwXofEhPvgDvusaJmxlG+Y94teukAfwobjj
	HuJMhmK7U0dxho1wRKNTgIr7deXIil5iqLsjK+BJLyj6JB8nYx5GUh6CidBXHq5fSRAEiDXqmE6Vm
	Ft81s3BVTFJPRO5OxNFyXu5YZkBK4ZeJa7Od7gp/APw0XDp80wc4KrE3dVjwkQK9kQqTid2GMB1uG
	NNuPptmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOW3H-00000004eC2-3uk8;
	Wed, 04 Nov 2026 08:08:59 +0000
Received: from mgamail.intel.com ([192.198.163.15])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOW3F-00000004eBY-2BSk;
	Wed, 04 Nov 2026 08:08:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793779738; x=1825315738;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=AomuazU2zzGRzimCBaFv5taOozoMnYWT55en1Ds0W0o=;
  b=AcA76mZiv2W9NUYxGkdCiLOcWFP7Zz2nalYIklKk3AdB4oXLYMnvJdHY
   lT2sBjZiCzaVndDgAMo+ICpMo9MfP9sMi9jENRNv4SYcN1yUjnTOexVDH
   KhxNgFThj3/RxY83WGjwxzQ6FkShfSCFCTQvAH77+9DYmtC2nlb5Iml44
   AWwrM1wylZPgduQPJx+XfLULj2zsvcjOfO7/c/SgpsQ2uNjI/vVJuw/Zd
   r1AmVjGRpJDl02CCf3iAdWXrYNPY3/t5JbothwDFqzgkFbEytAZN8Ltx0
   S8XqmtcLBwUSI9WCXNnSEdKZbwVIN8OfyG/eWEcz7WLV3afW/KeTGaMo6
   A==;
X-CSE-ConnectionGUID: kdtoWhPrRV6UNn8Wzhy2Eg==
X-CSE-MsgGUID: 11CoY175Rma5eloM47Sb6A==
X-IronPort-AV: E=McAfee;i="6800,10657,11955"; a="2522924"
X-IronPort-AV: E=Sophos;i="6.27,194,1787036400"; 
   d="scan'208";a="2522924"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2026 00:08:57 -0800
X-CSE-ConnectionGUID: a58E8IiMRzm/5YsOkdjGXw==
X-CSE-MsgGUID: h1BM+L5RRQe53f1dB18fYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,194,1787036400"; 
   d="scan'208";a="6779258"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa005.fm.intel.com with ESMTP; 04 Nov 2026 00:08:54 -0800
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id A280F99; Wed, 04 Nov 2026 09:08:53 +0100 (CET)
Date: Wed, 4 Nov 2026 09:08:53 +0100
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
Message-ID: <20261104080853.GB176724@black.igk.intel.com>
References: <20261030082539.1208733-1-chunfeng.yun@mediatek.com>
 <20261030082539.1208733-5-chunfeng.yun@mediatek.com>
 <20261030085628.GS158991@black.igk.intel.com>
 <82f1a3227685b241938ccb500b97d1e73212bf36.camel@mediatek.com>
 <20261103124842.GA158991@black.igk.intel.com>
 <1dc9e15cdc03e4084eacc45d1c2c90f17e6c47e5.camel@mediatek.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1dc9e15cdc03e4084eacc45d1c2c90f17e6c47e5.camel@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261104_000857_625818_BD4B6F09 
X-CRM114-Status: GOOD (  28.34  )
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

On Wed, Nov 04, 2026 at 07:09:50AM +0000, Chunfeng Yun (云春峰) wrote:
> On Tue, 2026-11-03 at 13:48 +0100, mika.westerberg@linux.intel.com
> wrote:
> > Hi,
> > 
> > On Tue, Nov 03, 2026 at 08:33:51AM +0000, Chunfeng Yun (云春峰) wrote:
> > > On Fri, 2026-10-30 at 09:56 +0100, Mika Westerberg wrote:
> > > > On Fri, Oct 30, 2026 at 04:25:39PM +0800, Chunfeng Yun wrote:
> > > > > When usb4 enter sleep mode, echo 1 to authorized of sysfile,
> > > > > will wakeup usb4 driver, but fail to create pcie tunnel, cause
> > > > > the warning due to a race condition between switch disconnect
> > > > 
> > > > It's router
> > > will modify it.
> > > 
> > > > 
> > > > > during resume and user authorization
> > > [  278.831186] usb4_hi NVDA8100:00: 0:1: is unplugged (state: 7),
> > > retrying...
> > > [  278.943031] usb4_hi NVDA8100:00: 0:1: failed to reach state
> > > TB_PORT_UP. Ignoring port...
> > > [  278.951125] usb4_hi NVDA8100:00: 0:1: lost during suspend,
> > > disconnecting
> > > [  278.957819] usb4_hi NVDA8100:00: 0:4 <-> 1:16 (USB3):
> > > deactivating
> > > [  278.964794] usb4_hi NVDA8100:00: deactivating USB3 Down path
> > > from
> > > 0:4 to 1:16
> > > [  278.972737] usb4_hi NVDA8100:00: deactivating USB3 Up path from
> > > 1:16
> > > to 0:4
> > > [  278.980504] usb4_hi NVDA8100:00: 0: TMU: mode change off -> bi-
> > > directional, HiFi requested
> > > [  278.991265] usb4_hi NVDA8100:00: 0: TMU: mode set to: bi-
> > > directional, HiFi
> > > [  278.999511] usb4_hi NVDA8100:00: 0:1: total credits changed 66 -
> > > > 66
> > > [  279.006408] usb4_hi NVDA8100:00: 1: link width set to symmetric,
> > > dual lanes
> > > [  279.013763] usb4_hi NVDA8100:00: 0:7 <-> 1:9 (PCI): activating
> > > [  279.019587] usb4_hi NVDA8100:00: activating PCIe Down path from
> > > 0:7
> > > to 1:9
> > > [  279.026468] usb4_hi NVDA8100:00: 1:1: Writing hop 1
> > > [  279.031335] usb4_hi NVDA8100:00: 1:1:  In HopID: 8 => Out port:
> > > 9
> > > Out HopID: 8
> > > [  279.038546] usb4_hi NVDA8100:00: 1:1:   Weight: 1 Priority: 3
> > > Credits: 32 Drop: 0 PM: 0
> > > [  279.046536] usb4_hi NVDA8100:00: 1:1:    Counter enabled: 0
> > > Counter
> > > index: 2047
> > > [  279.053834] usb4_hi NVDA8100:00: 1:1:   Flow Control (In/Eg):
> > > 1/0
> > > Shared Buffer (In/Eg): 0/0
> > > [  279.062259] usb4_hi NVDA8100:00: 1:1:   Unknown1: 0x0 Unknown2:
> > > 0x0
> > > Unknown3: 0x0
> > > [  279.069730] ------------[ cut here ]------------
> > > [  279.074335] usb4_hi NVDA8100:00: PCIe Down path activation
> > > failed
> > > [  279.080426] WARNING: CPU: 5 PID: 2433 at
> > > drivers/thunderbolt/path.c:587 tb_path_activate+0x1a4/0x5b0
> > > ...
> > > [  279.220285] Call trace:
> > > [  279.222722]  tb_path_activate+0x1a4/0x5b0 (P)
> > > [  279.227068]  tb_tunnel_activate+0x140/0x498
> > > [  279.231241]  tb_tunnel_pci+0x180/0x490
> > > [  279.234980]  tb_domain_approve_switch+0x74/0xb0
> > > [  279.239500]  authorized_store+0x214/0x270
> > > [  279.243498]  dev_attr_store+0x20/0x70
> > > ...
> > > [  279.288888] ---[ end trace 0000000000000000 ]---
> > > [  279.293497] usb4_hi NVDA8100:00: 0:7 <-> 1:9 (PCI): activation
> > > failed
> > > 
> > > 
> > > root cause:
> > > 
> > > The warning were caused by a race condition between switch
> > > disconnect
> > > during resume and user authorization:
> > > 
> > >    1. While the system was in runtime suspend, userspace executed:
> > > 
> > >        echo 1 > /sys/bus/thunderbolt/devices/0-1/authorized
> > >    2. Writing to this sysfs attribute woke up the USB4 controller
> > > (nhi_runtime_resume).
> > >    3. During resume, the downstream port 0:1 failed to complete
> > > link
> > > training within the timeout and was declared lost:
> > 
> > Okay we get the warning but the bigger problem here is that why the
> > link
> > does not come up anymore? 
> Yes, it is one case
> > Unless you unplugged the router as well.
> it is another one.
> 
> if the driver already know the router is disconnected, whether still
> need to look up the pcie tunnel? it want to do it, I will abandon this
> patch.

I think it makes sense to fix it but I was more concerned about the link
issue you seem to have there. The link should be re-trained once we runtime
resume if the router is still connected. There could be many reasons for
this but I would check that the PD/retimer firmwares are up-to-date at
least as they may contribute to this.

