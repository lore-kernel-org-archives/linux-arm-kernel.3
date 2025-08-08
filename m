Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52A2DC87FDA
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Aug 2025 08:05:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tgvQLFtkKGmmjE3l2Crv/yMEwEOMbKI3kuWlY+rtSxg=; b=17a69otmcxiyRpcvllRBT7ovp8
	AhGoyA0rd36osHMmR66Ju3dTXOl2+3jrZhTOcPotKcuEW994eSzemUhY+h/Mv8YjmdZ6WeizPpQcf
	zATjpibujJh6dhw6ztb/2yyMoIbq1qL/huFXtJVuNR+sT0FPl18w4jNQu0Sytp0tBSJAOxy0eiJnX
	Tvrw5vkdMOGmpvKsq+uIM+LqVK89ObitsfLV6ZBUXflcIvX70pzNBJ51pcAUsrlAGMbrgAZSCkDgT
	ZgFweNU7l4uupz+Sbz05gFlDtFSQ6uOwc8Pl9Mf+mwviwgernAq/euO6Af+mdPzIh5ey1JfAxAXK9
	I9uApQlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukI6A-00000002HcD-0dkI;
	Fri, 08 Aug 2025 08:05:10 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukHuV-00000002GGI-4BSi
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 Aug 2025 07:53:09 +0000
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1754639585;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=tgvQLFtkKGmmjE3l2Crv/yMEwEOMbKI3kuWlY+rtSxg=;
	b=pA07gkxguS3KtmYy7DLtM3wOXtdxVrciLNp/FtkZahkbj6Kf7LF2NUuVKjMnnI+hqxPs7e
	LewPqsAecVNYzcK3HOixoJVeBSWrhwMA6GrAkyYOs+9XI6QwpNHGFehO/ZAVteWr3IsRBt
	zlfySEeLabBq8kgLjnRvwOKldUsyHI3lWAy+jaoadoYMXQJ4rYCyPFaKwBBdintNF8qMoG
	SDhZ1MygrIkyTk8UG7FOFVzsKWHOxTAHwjF7PJSTQRbpbF9GuXyRob1Y76tNy88yojNa2h
	8YmU4MH4jCJlQG8jUn5ZY7a8cmqCZhiaH+thf9ZRHHSeWBuXg+XUKxgSXTdsBA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1754639585;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=tgvQLFtkKGmmjE3l2Crv/yMEwEOMbKI3kuWlY+rtSxg=;
	b=VhlU5wGjtK/wzDzetlc9swBMxQ6cBYQO3ymCTc+Zh76HQkZDdEyYZS43X9ClrJyprKJicG
	E6TwEJT4BCySPVDg==
To: kernel test robot <oliver.sang@intel.com>, Gabriele Monaco
 <gmonaco@redhat.com>
Cc: oe-lkp@lists.linux.dev, lkp@intel.com, linux-kernel@vger.kernel.org,
 Steven Rostedt <rostedt@goodmis.org>, Ingo Molnar <mingo@redhat.com>,
 Peter
 Zijlstra <peterz@infradead.org>, Masami Hiramatsu <mhiramat@kernel.org>,
 Tomas Glozar <tglozar@redhat.com>, Juri
 Lelli <jlelli@redhat.com>, Clark Williams <williams@redhat.com>, John Kacur
 <jkacur@redhat.com>, linux-trace-kernel@vger.kernel.org,
 aubrey.li@linux.intel.com, yu.c.chen@intel.com, oliver.sang@intel.com,
 Steen Hegelund <Steen.Hegelund@microchip.com>, Daniel Machon
 <daniel.machon@microchip.com>, UNGLinuxDriver@microchip.com, Andrew Lunn
 <andrew+netdev@lunn.ch>, David S. Miller <davem@davemloft.net>, Eric
 Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo
 Abeni <pabeni@redhat.com>, linux-arm-kernel@lists.infradead.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [linus:master] [sched]  adcc3bfa88:
 kunit.VCAP_API_DebugFS_Testsuite.vcap_api_show_admin_raw_test.fail
In-Reply-To: <202508070739.4c6e0633-lkp@intel.com>
References: <202508070739.4c6e0633-lkp@intel.com>
Date: Fri, 08 Aug 2025 09:52:53 +0200
Message-ID: <87a54ap7vu.fsf@yellow.woof>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250808_005308_175230_D5804250 
X-CRM114-Status: GOOD (  13.40  )
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


Cc: netdev folks

I don't see any connection between the reported commit and the
problem. This looks like the driver's problem.

kernel test robot <oliver.sang@intel.com> writes:

> Hello,
>
> kernel test robot noticed "kunit.VCAP_API_DebugFS_Testsuite.vcap_api_show_admin_raw_test.fail" on:
>
> commit: adcc3bfa8806761ac21aa271f78454113ec6936e ("sched: Adapt sched tracepoints for RV task model")
> https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master
>
> [test failed on linus/master      6a68cec16b647791d448102376a7eec2820e874f]
> [test failed on linux-next/master 84b92a499e7eca54ba1df6f6c6e01766025943f1]
>
> in testcase: kunit
> version: 
> with following parameters:
>
> 	group: group-03
>
>
>
> config: x86_64-rhel-9.4-kunit
> compiler: gcc-12
> test machine: 8 threads 1 sockets Intel(R) Core(TM) i7-3770K CPU @ 3.50GHz (Ivy Bridge) with 16G memory
>
> (please refer to attached dmesg/kmsg for entire log/backtrace)
>
>
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <oliver.sang@intel.com>
> | Closes: https://lore.kernel.org/oe-lkp/202508070739.4c6e0633-lkp@intel.com
>
>
> [   80.925851]     # vcap_api_show_admin_raw_test: EXPECTATION FAILED at drivers/net/ethernet/microchip/vcap/vcap_api_debugfs_kunit.c:377
>                    Expected test_expected == test_pr_buffer[0], but
>                        test_expected == "  addr: 786, X6 rule, keysets: VCAP_KFS_MAC_ETYPE
>                "
>                        test_pr_buffer[0] == ""
> [   80.926182]     not ok 2 vcap_api_show_admin_raw_test
>
>
>
> The kernel config and materials to reproduce are available at:
> https://download.01.org/0day-ci/archive/20250807/202508070739.4c6e0633-lkp@intel.com
>
>
>
> -- 
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki

