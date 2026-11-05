Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F3EF606A32C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 09:11:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=JgikI4mK;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=OOkERDIk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=oUTkOjhpSta2G99V+EvRj5jWYOqvSjQ/adQtpHhKIwA=; b=JgikI4mKMKWH/D34s8eDqx6Pz1
	mnohCdkCi1k6uSnZqrFP3ydYXKJ6m7W5dEawwA6Mx/QAARfCltJN4x63fB87Wkuo+BV4anI19XCp3
	PjNgSawvDL8fvIVznw8Hs6r3Pn9SW6/ujLaJCJPg8S8RrVxv8GolzijDryy0uAbscHzNTsamMwD4C
	t5494H47Fy2m2/8bAnzw5AUpVtSYgtCcwWZBQuENAZIqnJAb6RLJ4mc7e/4O4RsBdJOxrLr8KpDUT
	XYpBeoDvPCuPCKg39uMpcYvMP35NIo2mCQrr/3q950aRoamPOyRztxGO60lJHRPK2Z2e7rr6h1d4T
	zEd0r65A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOtVH-00000008G1y-2Ril;
	Thu, 05 Nov 2026 09:11:27 +0000
Received: from mgamail.intel.com ([198.175.65.15])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOtVA-00000008G05-2qHl
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 09:11:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793869881; x=1825405881;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=RlhKt0yBUlimxXsYRHNpAnCiVlMNcaFnOQtcMg7QbUY=;
  b=OOkERDIkUoRQ+Un8CLHvkU2ND/FrFZ1TdaYIU4aqsx/6VmipbhQ9je1Q
   tenwDvD04gLrfcGcnfXqOBdul7jzfCQutKidsEEPFDCS8ZeRT0jzNRMgz
   ozBDEaVOM+ldOdD54MSJVBJy/G5t4OpwgNx/zE2Rh3+2xCaoL1x/CjppI
   VxP2x4JYISTHZ5RrTG6J1FjBLKeWev86kgqyoFBbfpqeZQsI+5yahLQnq
   vpA5042LHvyNcJKKHyQ08g6MuqZeHRept/LMq2m6frJcLSn7QQuTy8vYM
   bAyEud3i8479kpFRNwITa4wzwVC8d708843whY1ir0JJ856+BbYgOi8dT
   A==;
X-CSE-ConnectionGUID: 4SQJA47wQaCJTfkUgsnAag==
X-CSE-MsgGUID: wTfDHtNOQJCLXkgjJPAPKg==
X-IronPort-AV: E=McAfee;i="6800,10657,11956"; a="2655237"
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="2655237"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2026 01:11:20 -0800
X-CSE-ConnectionGUID: C1Le9xQ2Sh6VQxIkMkQ3Nw==
X-CSE-MsgGUID: wFUwFvH9SZmi8pDGQQmKCg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="8819549"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa013.fm.intel.com with ESMTP; 05 Nov 2026 01:11:16 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xOtV3-00000000lzL-1HII;
	Thu, 05 Nov 2026 09:11:13 +0000
Date: Thu, 5 Nov 2026 17:10:48 +0800
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
Subject: Re: [PATCH 2/4] Bluetooth: btbcm: clear vendor bits in LE
 advertising report types
Message-ID: <202611051954.fni86ioX-lkp@intel.com>
References: <20261104151601.70493-3-dev@deq.rocks>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261104151601.70493-3-dev@deq.rocks>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_011123_768927_C8FFCD0B 
X-CRM114-Status: UNSURE (   9.61  )
X-CRM114-Notice: Please train this message.
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
patch link:    https://lore.kernel.org/r/20261104151601.70493-3-dev%40deq.rocks
patch subject: [PATCH 2/4] Bluetooth: btbcm: clear vendor bits in LE advertising report types
config: sh-allyesconfig (https://download.01.org/0day-ci/archive/20261105/202611051954.fni86ioX-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 16.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261105/202611051954.fni86ioX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611051954.fni86ioX-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: drivers/bluetooth/hci_bcm.c:153 struct member 'acl_priority' not described in 'bcm_device'
>> Warning: drivers/bluetooth/hci_bcm.c:153 struct member 'adv_type_fixup' not described in 'bcm_device'
   Warning: drivers/bluetooth/hci_bcm.c:153 struct member 'acl_priority' not described in 'bcm_device'
>> Warning: drivers/bluetooth/hci_bcm.c:153 struct member 'adv_type_fixup' not described in 'bcm_device'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

