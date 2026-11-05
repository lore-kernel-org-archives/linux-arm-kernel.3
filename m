Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DCAF606A31B
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 20:21:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=VpnTiZOS;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=EVhbu+39;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ABs8s/qj
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=KxYRMKoqQ5TnAo9ahTf6HCh0udvu+2ZmgUNQu1zf6ms=; b=VpnTiZOSDbi/tuoErPhcTCyPB2
	gxFekgpDoFEyroDygW4/flSKABcbjYYFZwrc+6jqGhOABuezniOYFqH4b2DGedaFoH0wH+bNOpZ2j
	HoXdmLQKP5ONsp08/V21u3up/ayZm0nsrEIAj7fGiskhrB6bPZ4/6/u8QXXha4vQs4upaZ27jL/yC
	OxBXbNt0t2UtTNVT2lNa7+LprJc0JtRUa9pPSgYI9Aubbo2xoBx9wON5oVzitOri8c132xtxNe2gW
	LrycxXFipyu3S1ic6M9WG2omjzD0IFAlRBZc5K159zfetiaaBz/CyK59EkM6xvwoq/NuqXRVT/EBU
	w+zraH+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP3DB-0000000AMGL-314s;
	Thu, 05 Nov 2026 19:33:25 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP3Cz-0000000AM9W-1jJQ;
	Thu, 05 Nov 2026 19:33:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=KxYRMKoqQ5TnAo9ahTf6HCh0udvu+2ZmgUNQu1zf6ms=; b=EVhbu+39JxgtY/5calbEIy+avu
	ZGG53uJ88Z+rsa+MJL9Zq/UYmHYm+k/iPBpZBz7VJXRGA7RzBQJfRY5OkZAB9ujdbJybYYnjQe3Ig
	i9nCi0EXW4UlG4eG8H1DkWQSA7E5jvXmBcwcPbphJ6opqk982pDEvN8TVFi1o9N1LSKg04H4W+pBF
	0XRG4Ct8gDuGn4+kNCLRWmrfOjNKkCi4sfZiSdHjcN4X6ZSWJ7OEU61QzuUSIkIcAF+vUq/GF9xnr
	8gsYmECHqj2cA9T8VlblQvT2m5H0Ts8aCp1rgvYURkjGRbnUmsI/4aBigOE4DysFZQFC0EJ5vx+k7
	UTqXORUQ==;
Received: from mgamail.intel.com ([198.175.65.9])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP3Cu-00000003TPX-1EVJ;
	Thu, 05 Nov 2026 19:33:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793907189; x=1825443189;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=U2hJrtx423sVNdvYtSAVrbMHTJILFCRiIFLpGmwhIKM=;
  b=ABs8s/qjMOxNLDWFaBVANXENCxn1KFaQO+Fmai4AXeVqqAW1tGmyIMjo
   WC/6+Obpty2pPDU1h+eiSwtDQAFQxGMTB9jP4yGMsYrxgxKNzZSL0GehV
   023w4nuK7166yUOkvtqeEYT/CYghRNYxb7PFiRf8oZbkSwHxQVm9PZJHc
   B07lboQeWD2CAb14jKb246lxf+91ElQHc5yacOe9kWS5Aq9OZOgUZKxtl
   5mePoY6Zani1fdTHcdsjEXW8jzj/xziTyfycSrAHK9AFfyDYGTzvxPC9H
   XcZ1mnfIPWn/slDzf0sGExjNqJphc+hvXx08qV29ae4fBAL1p+OSd9ENc
   A==;
X-CSE-ConnectionGUID: 5eebm68VTtCKMef5kqMf0A==
X-CSE-MsgGUID: FYOLL7t4SniSFRVUs7r6sA==
X-IronPort-AV: E=McAfee;i="6800,10657,11957"; a="2612786"
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="2612786"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2026 11:33:01 -0800
X-CSE-ConnectionGUID: GZhcWmofSJua3QNT4LoHNg==
X-CSE-MsgGUID: ndfzCq+qR/y14KywqvrBUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="8854806"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa011.fm.intel.com with ESMTP; 05 Nov 2026 11:32:56 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xP3Ce-00000000ml8-3B51;
	Thu, 05 Nov 2026 19:32:52 +0000
Date: Fri, 6 Nov 2026 03:32:11 +0800
From: kernel test robot <lkp@intel.com>
To: Christian Marangi <ansuelsmth@gmail.com>, Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Qingfang Deng <dqfext@gmail.com>,
	SkyLake Huang <SkyLake.Huang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Joris Vaisvila <joey@tinyisr.com>,
	Ahmed Naseef <naseefkm@gmail.com>, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: oe-kbuild-all@lists.linux.dev, netdev@vger.kernel.org
Subject: Re: [PATCH net-next v5 3/6] net: phy: add additional helper for PHY
 package
Message-ID: <202611060219.OYeac0uG-lkp@intel.com>
References: <20261105105504.1024-4-ansuelsmth@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261105105504.1024-4-ansuelsmth@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_193308_501355_047336FB 
X-CRM114-Status: GOOD (  11.61  )
X-Spam-Score: -2.5 (--)
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
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Christian,

kernel test robot noticed the following build warnings:

[auto build test WARNING on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Christian-Marangi/net-phy-mediatek-export-__mtk_tr_write/20261105-115457
base:   net-next/main
patch link:    https://lore.kernel.org/r/20261105105504.1024-4-ansuelsmth%40gmail.com
patch subject: [PATCH net-next v5 3/6] net: phy: add additional helper for PHY package
config: sh-randconfig-1000-20261105 (https://download.01.org/0day-ci/archive/20261106/202611060219.OYeac0uG-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 12.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261106/202611060219.OYeac0uG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611060219.OYeac0uG-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/net/phy/phy_package.c:82 expecting prototype for phy_package_unlock(). Prototype was for phy_package_offset() instead

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

