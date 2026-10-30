Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AE5F606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Oct 2026 08:56:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=gYnm0YP4;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=YOCR9uDd
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=XSZrLjIOCIaJWI2dP/MU2eJsRzU/MSEVDusl8tm3SOI=; b=gYnm0YP4BxyuuA9ZEhNP5+It0q
	TZVBmoZrv/8exEo1EaExqOfzkRxqiHoi8onmhSkFBnoo4zRdtQpplx/WqK4Xtl1oiYJSxkXybkzko
	CObXsFPBIi1otqD82O2wNV0mG1JZ8P8w41jaNe7k+t9HmdFDnT3g+McEuRRPKJ18hzgaiCYAdEzDp
	fKbY0Lbv1Le0JGlRU084/V6SPM15nt6S+Km3CujCLUkn+Mrd93OhVJvJYpzGR4xcjx9AslsCDwVPr
	pPeKbEudguTiD/RzXpQ6LROapB74fdempy8b9pI34c/LJevSpaOqZJ25Sm2Tnz2vVPXTO6ibbyq5M
	2SDNiWXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMiPb-0000000BB21-39uV;
	Fri, 30 Oct 2026 08:56:35 +0000
Received: from mgamail.intel.com ([192.198.163.14])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMiPY-0000000BB1W-4Bcl;
	Fri, 30 Oct 2026 08:56:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793350593; x=1824886593;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=FP6/5SIFaxNK34j+ZZ9Fi/I2y95wM15zKgP2cMbaunk=;
  b=YOCR9uDdW9LOyfRyfjrL0h38I1CPnU1mKt6HtkZmMxmtuoE9JDhAXr5J
   R+sEqPyWBUjAF/LsoluOeWPPYf0GY800CSR4IwOqh+xbX2L1QPoc8WZEA
   +yDqNV+zDHqx/VOFFkWyRrG1FI2Yux8kAGlMnBKe16qzv61RjSBGqay2A
   hO0Dd1/0rLpO8PNlF8ZOlJrC/0FAADZFVbWelvo7IoMxaOsfdkMwHM0Bo
   kjN5aqDRS6t2w7cIm3zPouTixHJcC59mIdjYmpTr763Z/6NJgtcoo+fGn
   GWpq57PBYHhfPsq+nLMJmyYKZ4jzaJK1q0a9wVwEYyENJTzVo+cU0amju
   A==;
X-CSE-ConnectionGUID: DCXPEApnQ564sueXloYBRA==
X-CSE-MsgGUID: 4kibZv7zSYS3yEuGFh/04w==
X-IronPort-AV: E=McAfee;i="6800,10657,11950"; a="2140739"
X-IronPort-AV: E=Sophos;i="6.27,186,1787036400"; 
   d="scan'208";a="2140739"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2026 01:56:32 -0700
X-CSE-ConnectionGUID: XjaLmNqORemTGdjJXTr0pw==
X-CSE-MsgGUID: 3/s1TLRJTL6Ok8OGjXuIIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,186,1787036400"; 
   d="scan'208";a="5918307"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa010.fm.intel.com with ESMTP; 30 Oct 2026 01:56:30 -0700
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id 6A95F99; Fri, 30 Oct 2026 09:56:28 +0100 (CET)
Date: Fri, 30 Oct 2026 09:56:28 +0100
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
Subject: Re: [PATCH 4/4] thunderbolt: prevent pcie tunnel activation/teardown
 warnings
Message-ID: <20261030085628.GS158991@black.igk.intel.com>
References: <20261030082539.1208733-1-chunfeng.yun@mediatek.com>
 <20261030082539.1208733-5-chunfeng.yun@mediatek.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261030082539.1208733-5-chunfeng.yun@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261030_015633_048144_FE0F3CC0 
X-CRM114-Status: GOOD (  23.32  )
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

On Fri, Oct 30, 2026 at 04:25:39PM +0800, Chunfeng Yun wrote:
> When usb4 enter sleep mode, echo 1 to authorized of sysfile,
> will wakeup usb4 driver, but fail to create pcie tunnel, cause
> the warning due to a race condition between switch disconnect

It's router

> during resume and user authorization

> 
> When usb4 enter sleep mode, echo 0 to authorized of sysfile,
> will wakeup usb4 driver, but fail to disconnect pcie due to
> the PCIe tunnel had already been torn down and freed if the port
> is fail to resume:

So this is runtime resume when there is no PCIe tunnel yet, the device is
unplugged and the userspace is at the same time writing to the "authorized"
attribute? 

Then the PCIe tunnel creation fails as expected.

What warning you are trying to silence?

> 
> The check prevents a redundant lookup and eliminates the warning
> 
> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> ---
>  drivers/thunderbolt/switch.c | 5 +++++
>  drivers/thunderbolt/tb.c     | 7 +++++++
>  2 files changed, 12 insertions(+)
> 
> diff --git a/drivers/thunderbolt/switch.c b/drivers/thunderbolt/switch.c
> index e7ee9639c54c..7902172f4e99 100644
> --- a/drivers/thunderbolt/switch.c
> +++ b/drivers/thunderbolt/switch.c
> @@ -1849,6 +1849,11 @@ static int tb_switch_set_authorized(struct tb_switch *sw, unsigned int val)
>  	if (!!sw->authorized == !!val)
>  		goto unlock;
>  
> +	if (sw->is_unplugged) {
> +		ret = -ENODEV;
> +		goto unlock;
> +	}
> +
>  	switch (val) {
>  	/* Disapprove switch */
>  	case 0:
> diff --git a/drivers/thunderbolt/tb.c b/drivers/thunderbolt/tb.c
> index 57c11ba13459..69310622d786 100644
> --- a/drivers/thunderbolt/tb.c
> +++ b/drivers/thunderbolt/tb.c
> @@ -2266,6 +2266,10 @@ static int tb_disconnect_pci(struct tb *tb, struct tb_switch *sw)
>  	struct tb_tunnel *tunnel;
>  	struct tb_port *up;
>  
> +	/* If the switch has already been unplugged, tunnels are already freed */
> +	if (sw->is_unplugged)
> +		return 0;
> +
>  	up = tb_switch_find_port(sw, TB_TYPE_PCIE_UP);
>  	if (WARN_ON(!up))
>  		return -ENODEV;
> @@ -2288,6 +2292,9 @@ static int tb_tunnel_pci(struct tb *tb, struct tb_switch *sw)
>  	struct tb_cm *tcm = tb_priv(tb);
>  	struct tb_tunnel *tunnel;
>  
> +	if (sw->is_unplugged)
> +		return -ENODEV;
> +
>  	up = tb_switch_find_port(sw, TB_TYPE_PCIE_UP);
>  	if (!up)
>  		return 0;
> -- 
> 2.43.0

