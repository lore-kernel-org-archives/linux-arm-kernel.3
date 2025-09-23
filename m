Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4EC1CAC5A5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Sep 2025 05:33:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=FJ4tZjiMhTGCrrpVFFyiu5yOXDKwDlnztNOTptC341I=; b=hSPpqEX9/o26i/jo8bFu10gOzH
	3MJNMPM5zxEUvXpXn/qT4o604zZYIG0Mv0qbWRrsO4J7G6SA2E3enfuSS9IfL2ACs9YJq6XjCcaYV
	ZeqaXosNcByS+3oa9zOp7/haHbUQWfMENdL8y7bcQQ7rDcnf++SxxxcDRSMRNMVqmVmezLhYeI+ug
	h1r9SWZ1u+fGzLiLYtaz4WL1WmhreTMYTe0kjoRvvQNPU9G999j3y6ZCKKwP4rxZEhQ2akvA9ffSf
	RzDSTTbM8DY5n+NClNBFPQ/dpM2LH05rfLYz/Fy8daYNfMVBDWGLZcq5ZIw1LgIxH1QWz6e2M8unC
	1NXjWmpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0veG-0000000CT3H-2WTe;
	Tue, 23 Sep 2025 05:33:08 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0veE-0000000CT1n-0cc5
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Sep 2025 05:33:07 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-46d40c338b8so12761815e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 22 Sep 2025 22:33:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1758605584; x=1759210384; darn=lists.infradead.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FJ4tZjiMhTGCrrpVFFyiu5yOXDKwDlnztNOTptC341I=;
        b=rB6Ey7kg1u64AVpVgW40jhTTcFRangK8592UOCMsJU3g1IWJOn/TMMMz4WCp912Wgs
         2TIYtcXjmXk4BDk5GEGoEDJ/tMTJDgplCkPW9iEg+Uc83VLvC4Kfpc4D+/3wjm/tVoMJ
         Yz49x6UXPuVXYHlwBQ+D/DZ/DdQ6I+obC8FGlc4DdIk/PhWACsD7cOnQX802P2OY+PVY
         TFhCT/Hj3ffoRZybX4d69i5v01nFNVMDLb7j7ROef1f+Deo6pH/6kE7hxbZm/fA0O7eB
         2hMszZegrCzAddzxExSRDm40NaODJEHtyDT6NvVKzgftDfU2iMamSzZ+/tATVl4UbJh7
         UWVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758605584; x=1759210384;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FJ4tZjiMhTGCrrpVFFyiu5yOXDKwDlnztNOTptC341I=;
        b=M39hoHHPJQFlxqY7TdX32Max3onBQsuElM/FqbZX4CQlN2crZeOGyGs8UIqYVi14pa
         Q1+xJGqm+43Y723MtXS8ylu+1n/dSfL+mEXN71viH/llXO+VciYMQhpu42mILgArNyix
         kmOqjNPqSaMACY+oTxrlIII1BSugZTInA6gvKvUk+wuyqpcB1YV9vROwdZoyYLsfPWaB
         5v7IyNqsMyohkk6dkbfyrZWwtsbrY0KHI8A1HDDdjRFL76APrDJtG41z0DHORDspxII+
         K+Msc7QAbOmUZ2YXujZngzGfYmdq6YHOOn2GmnUz77CahnKwu7fFOGhLhietM3IZwisf
         gT7Q==
X-Forwarded-Encrypted: i=1; AJvYcCX1F+lER3sM77JY7dyRFX+9BYKur4SEbXLk3Q9BcqvOLP5g6Jsvo/h3HSe/ly+ZVfKGZ3Vq2TXElJWX+dnjrZ/u@lists.infradead.org
X-Gm-Message-State: AOJu0YyORXj5nEW86hmHXsvwYtCBTXTAMrb60kNgSYMkLuDrM4e2Irny
	smqcFyniKOKmY8JEG/fGJwnDs7+6FAwFWYXHMaa2RRVxky2LQQYRU1B5T1MfmKQDL4A=
X-Gm-Gg: ASbGncttj4CoGCSGnZZGgvLTOeGqHObLcqv59shHWS2UTZOumi6cWGw9zwf3aSQaW1b
	VfroVGQIAcUC1mKIdqGrbFd9qLHiA/EPJtZthjLe4zHFsOUj2z4yONrD1FJD5gY3+tg4sxh+oTc
	hTlEVYLKCjz0pvud48QU3h5xRme4aE/HeNUovo0YxLkD8qF5K1qYeVrsJkTG7WPbapAU1jn8SZl
	5b4qJUIUrVd+FRo7ct/VyiPz60nUzP7stZCoaErYFZ/tBcC0rVZ97jh9uOSHHkjY4GNnPTiGAl9
	eZXTdAbUE9IPt2uvfUkXCK58VStN8zzpuBffEo874xSs6MFXcLFf1uco9SHE+zds5M1klJDoLsF
	dInEgXLzywZkcVyYLcBZ02WVXm2EV
X-Google-Smtp-Source: AGHT+IGaW/wTjlF3vX/5ngxVawIqkqRfb+lQmNOxNFOw9CCk7KAF4WbfcNbfXVLS3PoI4R9q3MCZWQ==
X-Received: by 2002:a05:600c:1c05:b0:45d:d505:a1c3 with SMTP id 5b1f17b1804b1-46e1dae0d4bmr9065765e9.37.1758605583740;
        Mon, 22 Sep 2025 22:33:03 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-461391232e7sm264631205e9.6.2025.09.22.22.33.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Sep 2025 22:33:03 -0700 (PDT)
Date: Tue, 23 Sep 2025 08:32:59 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev,
	Ilkka Koskinen <ilkka@os.amperecomputing.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, Will Deacon <will@kernel.org>
Subject: [arm64:for-next/perf 5/28] drivers/perf/dwc_pcie_pmu.c:418
 dwc_pcie_pmu_validate_group() error: uninitialized symbol 'time_event'.
Message-ID: <202509231223.gZsX6Eio-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250922_223306_212422_FAFD2803 
X-CRM114-Status: UNSURE (   9.16  )
X-CRM114-Notice: Please train this message.
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

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git for-next/perf
head:   6d2f913fda5683fbd4c3580262e10386c1263dfb
commit: 71396cfac97d0249fa7d8dcc8e649b6ba4c090e4 [5/28] perf/dwc_pcie: Support counting multiple lane events in parallel
config: sparc64-randconfig-r072-20250922 (https://download.01.org/0day-ci/archive/20250923/202509231223.gZsX6Eio-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 12.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202509231223.gZsX6Eio-lkp@intel.com/

smatch warnings:
drivers/perf/dwc_pcie_pmu.c:418 dwc_pcie_pmu_validate_group() error: uninitialized symbol 'time_event'.

vim +/time_event +418 drivers/perf/dwc_pcie_pmu.c

71396cfac97d02 Ilkka Koskinen 2025-08-28  401  static int dwc_pcie_pmu_validate_group(struct perf_event *event)
71396cfac97d02 Ilkka Koskinen 2025-08-28  402  {
71396cfac97d02 Ilkka Koskinen 2025-08-28  403  	struct perf_event *sibling, *leader = event->group_leader;
71396cfac97d02 Ilkka Koskinen 2025-08-28  404  	DECLARE_BITMAP(val_lane_events, 2 * DWC_PCIE_LANE_MAX_EVENTS_PER_GROUP);
71396cfac97d02 Ilkka Koskinen 2025-08-28  405  	bool time_event;
71396cfac97d02 Ilkka Koskinen 2025-08-28  406  	int type;
71396cfac97d02 Ilkka Koskinen 2025-08-28  407  
71396cfac97d02 Ilkka Koskinen 2025-08-28  408  	type = DWC_PCIE_EVENT_TYPE(leader);
71396cfac97d02 Ilkka Koskinen 2025-08-28  409  	if (type == DWC_PCIE_TIME_BASE_EVENT)
71396cfac97d02 Ilkka Koskinen 2025-08-28  410  		time_event = true;
71396cfac97d02 Ilkka Koskinen 2025-08-28  411  	else
71396cfac97d02 Ilkka Koskinen 2025-08-28  412  		if (dwc_pcie_pmu_validate_add_lane_event(leader, val_lane_events))
71396cfac97d02 Ilkka Koskinen 2025-08-28  413  			return -ENOSPC;
71396cfac97d02 Ilkka Koskinen 2025-08-28  414  
71396cfac97d02 Ilkka Koskinen 2025-08-28  415  	for_each_sibling_event(sibling, leader) {
71396cfac97d02 Ilkka Koskinen 2025-08-28  416  		type = DWC_PCIE_EVENT_TYPE(sibling);
71396cfac97d02 Ilkka Koskinen 2025-08-28  417  		if (type == DWC_PCIE_TIME_BASE_EVENT) {
71396cfac97d02 Ilkka Koskinen 2025-08-28 @418  			if (time_event)

time_event is never set to false.  I really encourage developers to
use CONFIG_INIT_STACK_ALL_PATTERN=y for testing.  (Use
CONFIG_INIT_STACK_ALL_ZERO for production obviously).

71396cfac97d02 Ilkka Koskinen 2025-08-28  419  				return -ENOSPC;
71396cfac97d02 Ilkka Koskinen 2025-08-28  420  
71396cfac97d02 Ilkka Koskinen 2025-08-28  421  			time_event = true;
71396cfac97d02 Ilkka Koskinen 2025-08-28  422  			continue;
71396cfac97d02 Ilkka Koskinen 2025-08-28  423  		}
71396cfac97d02 Ilkka Koskinen 2025-08-28  424  
71396cfac97d02 Ilkka Koskinen 2025-08-28  425  		if (dwc_pcie_pmu_validate_add_lane_event(sibling, val_lane_events))
71396cfac97d02 Ilkka Koskinen 2025-08-28  426  			return -ENOSPC;
71396cfac97d02 Ilkka Koskinen 2025-08-28  427  	}
71396cfac97d02 Ilkka Koskinen 2025-08-28  428  
71396cfac97d02 Ilkka Koskinen 2025-08-28  429  	return 0;
71396cfac97d02 Ilkka Koskinen 2025-08-28  430  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


