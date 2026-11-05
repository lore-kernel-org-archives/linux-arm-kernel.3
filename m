Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3988A606A31B
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 05:23:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=EUTIo9ke;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=H42SS2Tm
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=rQr7yvtDdjv+uqRleV0ogoSLK/6tS11R1tEZLnAV5R0=; b=EUTIo9ke6jZ9NFHdSxDUhTDcm6
	zmMncXSJB4lqEy1md2p9M4kKv8YnOYlMAwFi2uCMRckEyBTrZwU0qo5hgtoSU3nYAsHdo/9jm+J94
	2QFJTFtIeJnna64AmENi0DGj70TJ8mGS8aUeZxMkm96XosgXyUmcAc1sA69zq0GTkFwrXNXGefPq6
	W77RrBD4u+HRvrA7jfMb1QrF+vzBM/6u+EeHCVhlki8kOrVxqZkbFjV34OT7K2EEvNztsYpi1pfd9
	1hRCIab2USShmNhKOdoOX/wJM2UH/o3qdx/BuqtH/1mQafVYhW6FfiQEBEWRqHYtb1rl1rmr0aXgk
	bjDEfhAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOpwG-00000007stv-1CaC;
	Thu, 05 Nov 2026 05:23:04 +0000
Received: from mgamail.intel.com ([198.175.65.14])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOpwD-00000007stU-2xNa
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 05:23:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793856182; x=1825392182;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Q0/e6ShWRmdK7g8M5BxZX/k/BD9zq62vEtWX/MYfK5Q=;
  b=H42SS2TmsQ5w10aFrHFmhAQCUiG6Qc1biAk55nP2CARTlH7jgW1h+SLf
   BoKOYKNnih0ybtxf3sZlLXfKj0sEsv4fh1QvUYlKoePyATq7qlr4wuydY
   X4QcAAWWB7RT9LPXSc7WbxCKv/IcSHgn95/d8Gr0n3ESvYirljaQ+cTsD
   +S9jvSAIjntmaot5+ZB08W6/4rgqo+P+t2O3qbtGaCagFt72Il78JZKOU
   DnQ4pfHyfkoJBinGnfEJQvCOrblvLjoq9p2kj1X+HkBeK8Rd/M32KqXHp
   aqKD0vBCvXK311c8fRGpIDbfCsQhTwDo5Vmpi+9JbfQ8eOVGXwMQoC9h9
   g==;
X-CSE-ConnectionGUID: DebXvev/S3SYvIdcZHLCHw==
X-CSE-MsgGUID: +vs+TgSpQAWx+uqp0qMpOQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11956"; a="2519752"
X-IronPort-AV: E=Sophos;i="6.27,196,1787036400"; 
   d="scan'208";a="2519752"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2026 21:22:59 -0800
X-CSE-ConnectionGUID: WpFMwuZUQIiAaXokdmgZEw==
X-CSE-MsgGUID: 5dMSsW/sRGu3mh6f50Anhw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,196,1787036400"; 
   d="scan'208";a="7254379"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 04 Nov 2026 21:22:55 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xOpw4-00000000lih-2CSt;
	Thu, 05 Nov 2026 05:22:52 +0000
Date: Thu, 5 Nov 2026 13:22:43 +0800
From: kernel test robot <lkp@intel.com>
To: Andre Eikmeyer <dev@deq.rocks>, marcel@holtmann.org,
	luiz.dentz@gmail.com
Cc: oe-kbuild-all@lists.linux.dev, linux-bluetooth@vger.kernel.org,
	linux-kernel@vger.kernel.org, sven@kernel.org, j@jannau.net,
	neal@gompa.dev, asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, 66ton99@gmail.com,
	josemiguelo.ochoa@gmail.com, aditya.garg@linux.dev,
	Andre Eikmeyer <dev@deq.rocks>,
	Yossef Osman <Yossef.Osman@proton.me>
Subject: Re: [PATCH 1/4] Bluetooth: btbcm: raise ACL priority on Apple
 Broadcom controllers
Message-ID: <202611051559.brx1v0og-lkp@intel.com>
References: <20261104151601.70493-2-dev@deq.rocks>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261104151601.70493-2-dev@deq.rocks>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261104_212301_790407_CFC5DC64 
X-CRM114-Status: GOOD (  10.51  )
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
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Andre,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 3f425f95ba3923d605f6a8b382e8fcdc59d479db]

url:    https://github.com/intel-lab-lkp/linux/commits/Andre-Eikmeyer/Bluetooth-btbcm-raise-ACL-priority-on-Apple-Broadcom-controllers/20261104-161558
base:   3f425f95ba3923d605f6a8b382e8fcdc59d479db
patch link:    https://lore.kernel.org/r/20261104151601.70493-2-dev%40deq.rocks
patch subject: [PATCH 1/4] Bluetooth: btbcm: raise ACL priority on Apple Broadcom controllers
config: sh-allyesconfig (https://download.01.org/0day-ci/archive/20261105/202611051559.brx1v0og-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 16.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261105/202611051559.brx1v0og-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611051559.brx1v0og-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/bluetooth/hci_bcm.c:152 struct member 'acl_priority' not described in 'bcm_device'
>> Warning: drivers/bluetooth/hci_bcm.c:152 struct member 'acl_priority' not described in 'bcm_device'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

