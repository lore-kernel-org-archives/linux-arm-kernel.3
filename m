Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6DBF606A31F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Oct 2026 08:50:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=QQKu/KWC;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=d6ccIxbQ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=E5x7B7nXoL/tCjGbGvP/ubF3LppEPd/RfZ8GtFIZbHY=; b=QQKu/KWCuId5QkWJQhjQsrD+zj
	ZX/+CLYAmQq49NtH8nQQ0u6GSd6MqVTAPQhKISgSFj3Rr0iO7eWTy4Ak8fH2BGijztH1HQfnuetVI
	tb+M2iCH2HNvxu6G087ZPZOSXBQ16xYIFefy61OhEn19SokJEt4+bgNL+igMnVDGLl88uRt5q3dWq
	G2onqErZIy1vLlBIUeMHNmxGiTQzrb5C0yfrxdMFub/t1my7QTSubKHqaY4D/mK7sITFwiuR9Tap+
	SKEIirO+rv0zdm0N1Cx0Y6I6AzuJiGvd5+9EU9vgRFcpNymu7rswjlXjcxcyzmDxAfceLHa9juXEi
	tkw+cNkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMiK5-0000000BAET-17Wo;
	Fri, 30 Oct 2026 08:50:53 +0000
Received: from mgamail.intel.com ([198.175.65.13])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMiK2-0000000BADy-0iij;
	Fri, 30 Oct 2026 08:50:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793350250; x=1824886250;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=CmxciEAo57BZeqnclCgFetzlmtsZaVUtk/MM1fxegNU=;
  b=d6ccIxbQCR7mCjpRrb1P8jQPnYIr1kOaL4DYKvvE0/qOti+1MScxleju
   NLlOZp0/hRUJ/Z6SLCNHOjr5NY7+xoGFXN+gFYBpc5LHDhWFdNEcn7zdU
   8wS+wZ6Lh87UqHvDjKK2DOWttjXHjVlC9GH8gFxvfYCPfAczAtoTn2I9s
   eesyQPEdW4HDCcLfDCsuY9kLnrIyTTh8FyP6l81elZ3NVUfWe+cjkW2kf
   WH2m58YhCMuNekIs4UZIBRJIfggHF31qEuhFt3BuijbN7f2GD6tJJ2NWG
   SMrFp7pU6MFnDYh3/5sAqDhM5saAp/h4ZxjbyOSQGxMLthq3+43CKtfDy
   A==;
X-CSE-ConnectionGUID: 0oD3jDMTTN2gCY5EA9CxyQ==
X-CSE-MsgGUID: w2BvIV4TTHGVvhyq3S2lCA==
X-IronPort-AV: E=McAfee;i="6800,10657,11950"; a="1986458"
X-IronPort-AV: E=Sophos;i="6.27,186,1787036400"; 
   d="scan'208";a="1986458"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2026 01:50:48 -0700
X-CSE-ConnectionGUID: +Yp8x0cyRcalWLvDsJ5a9g==
X-CSE-MsgGUID: YbAuTS6IQoaj06HuKLRvSQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,186,1787036400"; 
   d="scan'208";a="5265042"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa007.jf.intel.com with ESMTP; 30 Oct 2026 01:50:46 -0700
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id 57E9C99; Fri, 30 Oct 2026 09:50:45 +0100 (CET)
Date: Fri, 30 Oct 2026 09:50:45 +0100
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Chunfeng Yun <chunfeng.yun@mediatek.com>
Cc: Mika Westerberg <westeri@kernel.org>,
	Andreas Noever <andreas.noever@gmail.com>,
	Yehezkel Bernat <YehezkelShB@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 3/4] thunderbolt: improve usb3 adapter link up timeout
 value
Message-ID: <20261030085045.GR158991@black.igk.intel.com>
References: <20261030082539.1208733-1-chunfeng.yun@mediatek.com>
 <20261030082539.1208733-4-chunfeng.yun@mediatek.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261030082539.1208733-4-chunfeng.yun@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261030_015050_260519_E49B6876 
X-CRM114-Status: GOOD (  19.13  )
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
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, Oct 30, 2026 at 04:25:38PM +0800, Chunfeng Yun wrote:
> when plug into a usb3 device into usb4 hub's DFP to trigger usb4

USB 3 device into USB4 hub's downstream facing port to ...

> driver wakeup, encounter usb3 link up timeout issue, then cause
> usb3 hub disconnect:
> 
> usb4_hi NVDA8100:00: 0:1: failed to reach state TB_PORT_UP. Ignoring port...
> usb4_hi NVDA8100:00: 0:1: lost during suspend, disconnecting
> usb4_hi NVDA8100:00: 0:4 <-> 1:20 (USB3): deactivating
> usb4_hi NVDA8100:00: deactivating USB3 Down path from 0:4 to 1:20
> usb4_hi NVDA8100:00: deactivating USB3 Up path from 1:20 to 0:4
> ...
> thunderbolt 0-1: device disconnected
> usb 2-1: USB disconnect, device number 10
> 
> Completes link training at ~1.48s and transitions to TB_PORT_UP after
> change the timeout to 2.5s:
> 
> In the USB4 spec, Phase 5 (Link Equalization) alone is allowed up to
> 1000 ms. When add tPhase3 (100 ms), tPhase4 (100 ms), and retimer
> transaction delays (tCmdResponse = 50 ms), the physical link is
> allowed by spec to take 1200 ms to 1500 ms+ to complete initialization.
> 
> here are two retimers in the link, if more retimers add it, need more
> time
> 
> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> ---
>  drivers/thunderbolt/switch.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/thunderbolt/switch.c b/drivers/thunderbolt/switch.c
> index d22d8db8f890..e7ee9639c54c 100644
> --- a/drivers/thunderbolt/switch.c
> +++ b/drivers/thunderbolt/switch.c
> @@ -500,8 +500,9 @@ int tb_port_state(struct tb_port *port)
>   */
>  int tb_wait_for_port(struct tb_port *port, bool wait_if_unplugged)
>  {
> -	int retries = 10;
> +	int retries = 25;
>  	int state;
> +

This is unrelated change.

>  	if (!port->cap_phy) {
>  		tb_port_WARN(port, "does not have PHY\n");
>  		return -EINVAL;
> -- 
> 2.43.0

