Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 339A9CD6E56
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 31 May 2026 21:02:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=50+cJRFuHA1aft8cI86TTpFwjqdQTvhVXGZWYMzzcBk=; b=ccNVt0abdGYUkNMzgbNkRNOiBX
	EP7rN/Oaw1LLEj+B0aN1uetJLtoW4RLDLfMezstaMfzoryLe7W796YR1tVWX4sZjuGu1qCrx4p9JH
	zBKk0tw/XQOKB6gG1BpPGavnSG4+RbMeaFiY/mShesuk/Xs3vFTcEjrrvGkDkPky9gEjVsq59hLLM
	0ccexyZVpC0hGer3Ug5qELm/PiPAYbo0yJbOKOubevY0MZfsokXGZQqx5TzRMAGpPQEfJUhylcJqw
	34IQsENPbDawLr1YgoQERAjduxVSNVIR7IVCVYPyCRCd+NLuThaVqxB1qHTRx5gMjJJWVFeNHXKfZ
	PbOhu6MA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTnIg-00000009u7H-14HH;
	Sun, 31 May 2026 21:02:26 +0000
Received: from mgamail.intel.com ([192.198.163.10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTnId-00000009u6t-022j;
	Sun, 31 May 2026 21:02:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780261343; x=1811797343;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=G0ABCbeo67AuQPOwqQhkxGqx8eQZbUDLmehA7oopzrY=;
  b=Dx9cW5KEzGJpoF/HV7fLuitH4/c85iEXRlxjdmROPBFaXBJlu8NoQ4Cw
   f6qlf5vm03JKRohUg61PQ3dY1Dc8ClU333bzALDZiLGmbqUD6iIWM/pir
   vzM5ScSEp8kPjKMlj2dItCcrk3bssMCDVTkpQt+oWZxsBGhyZOJHY6WcG
   0PxTKXO4cEEu8L+yHeXMgDECeRY+WENFKV9y7Xw0u9cdR6gDkxN0RPB5r
   hDPhGI7k1wGl4pti0EHxuak+7e56lfgqF++1r9vLqQ7lY2iLyLYuz7RrD
   NXDZYXAfmy0d3NiSZPHRYQ97/CJUOnXN50GD8yRkzz36NelmD5z/UO3rr
   g==;
X-CSE-ConnectionGUID: zh4bakJWR9OWXAGerpr28g==
X-CSE-MsgGUID: aUYe+7bGRBSFC42im21a7g==
X-IronPort-AV: E=McAfee;i="6800,10657,11803"; a="92408429"
X-IronPort-AV: E=Sophos;i="6.24,179,1774335600"; 
   d="scan'208";a="92408429"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 May 2026 14:02:20 -0700
X-CSE-ConnectionGUID: wd2j6lKLTxukaQOQzCxJ4A==
X-CSE-MsgGUID: yJYvhMyxTAKuVXCBUO69Uw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,179,1774335600"; 
   d="scan'208";a="240395281"
Received: from vpanait-mobl.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.52])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 May 2026 14:02:16 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 184141203C2;
	Mon, 01 Jun 2026 00:02:09 +0300 (EEST)
Date: Mon, 1 Jun 2026 00:02:09 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Eugen Hristev <ehristev@kernel.org>
Cc: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>,
	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Hans Verkuil <hverkuil@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Naushir Patuck <naush@raspberrypi.com>, linux-media@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] media: bcm2835-unicam: Fix log status runtime access
Message-ID: <ahyh0ZlwlZqr7VNa@kekkonen.localdomain>
References: <20260522-bcmpipm-v2-1-a3da66cbc9f0@kernel.org>
 <1ddf8baa-47db-4b9d-9df6-a6075bc94593@yoseli.org>
 <5b63761b-07dd-4786-bc98-d8a1c48a2ef4@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5b63761b-07dd-4786-bc98-d8a1c48a2ef4@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260531_140223_093300_BE5FE389 
X-CRM114-Status: GOOD (  32.84  )
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

Hi Eugen, others,

On Fri, May 29, 2026 at 06:06:42PM +0300, Eugen Hristev wrote:
> On 5/29/26 08:12, Jean-Michel Hautbois wrote:
> > Hi Eugen,
> > 
> > Le 22/05/2026 à 17:28, Eugen Hristev a écrit :
> >> When requesting log status, the block might be powered off, but registers
> >> are being read.
> >> Avoid reading the registers if the device is not resumed, thus also avoid
> >> powering up the device just for log status.
> >>
> >> Fixes: 392cd78d495f ("media: bcm2835-unicam: Add support for CCP2/CSI2 camera interface")
> >> Signed-off-by: Eugen Hristev <ehristev@kernel.org>
> >> ---
> >> Changes in v2:
> >> - changed to use pm_runtime_get_if_active()
> >> - add corresponding put()
> >> - Link to v1: https://patch.msgid.link/20260521-bcmpipm-v1-1-3eba88d88045@kernel.org
> >>
> >> To: Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>
> >> To: Mauro Carvalho Chehab <mchehab@kernel.org>
> >> To: Florian Fainelli <florian.fainelli@broadcom.com>
> >> To: Ray Jui <rjui@broadcom.com>
> >> To: Scott Branden <sbranden@broadcom.com>
> >> To: Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
> >> To: Sakari Ailus <sakari.ailus@linux.intel.com>
> >> To: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
> >> To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> >> To: Hans Verkuil <hverkuil@kernel.org>
> >> To: Naushir Patuck <naush@raspberrypi.com>
> >> Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>
> >> Cc: linux-media@vger.kernel.org
> >> Cc: linux-rpi-kernel@lists.infradead.org
> >> Cc: linux-arm-kernel@lists.infradead.org
> >> Cc: linux-kernel@vger.kernel.org
> >> ---
> >>   drivers/media/platform/broadcom/bcm2835-unicam.c | 9 +++++++++
> >>   1 file changed, 9 insertions(+)
> >>
> >> diff --git a/drivers/media/platform/broadcom/bcm2835-unicam.c b/drivers/media/platform/broadcom/bcm2835-unicam.c
> >> index 8d28ba0b59a3..93815b8ab930 100644
> >> --- a/drivers/media/platform/broadcom/bcm2835-unicam.c
> >> +++ b/drivers/media/platform/broadcom/bcm2835-unicam.c
> >> @@ -2052,6 +2052,13 @@ static int unicam_log_status(struct file *file, void *fh)
> >>   		 node->fmt.fmt.pix.width, node->fmt.fmt.pix.height);
> >>   	dev_info(unicam->dev, "V4L2 format:         %08x\n",
> >>   		 node->fmt.fmt.pix.pixelformat);
> >> +
> >> +	if (!pm_runtime_get_if_active(unicam->dev)) {
> > 
> > Well, if I am picky I would say that pm_runtime_get_if_active() can 
> > return -EINVAL if runtime PM is disabled for the device. It should then 
> > be tested against '<= 0' ?
> > 
> > I suppose this should not happen really often, as very few drivers 
> > actually test this case...
> 
> I saw that. Some do. This driver enables runtime pm in probe though. So
> I guess it cannot happen, unless runtime pm would not selected in kernel
> config, but the driver depends on PM.

Runtime PM can be disabled for a device via sysfs.

> 
> Ultimately I guess it's up to Sakari or Hans to decide whether it's
> worth checking for error code, but I picked the simpler path (and
> considering <depends on PM> in Kconfig) .

pm_runtime_put() musn't be called if there was an error as it decrements
usage_count unconditionally.

The vast majority of sensor drivers test for non-zero only and no-one has
complained. They should be fixed though...

> > 
> > With or without this small change:
> > Reviewed-by: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
> > 
> > Thanks,
> > JM
> > 
> >> +		dev_info(unicam->dev,
> >> +			 "Live data N/A due to device inactive\n");
> >> +		return 0;
> >> +	}
> >> +
> >>   	reg = unicam_reg_read(unicam, UNICAM_IPIPE);
> >>   	dev_info(unicam->dev, "Unpacking/packing:   %u / %u\n",
> >>   		 unicam_get_field(reg, UNICAM_PUM_MASK),
> >> @@ -2065,6 +2072,8 @@ static int unicam_log_status(struct file *file, void *fh)
> >>   	dev_info(unicam->dev, "Write pointer:       %08x\n",
> >>   		 unicam_reg_read(unicam, UNICAM_IBWP));
> >>   
> >> +	pm_runtime_put(unicam->dev);
> >> +
> >>   	return 0;
> >>   }
> >>   
> >>
> >> ---
> >> base-commit: e98d21c170b01ddef366f023bbfcf6b31509fa83
> >> change-id: 20260521-bcmpipm-6c578e73239c
> >>
> >> Best regards,

-- 
Regards,

Sakari Ailus

