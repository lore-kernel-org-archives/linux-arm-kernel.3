Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14F63C02198
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Feb 2025 19:10:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gYBSZwe7Pr8Ql8wMoYQezUr26s3AG/N2/4yTtR1gYJk=; b=Jq++8fudPYK41X31cD3CSf2sFg
	tFi3NHjNn3rInAfTNOrXevqBZIepl3CePGQmJQmcTJE6EELPGpurCgSaEnYtvV5+MuZBgg8RlmpFj
	krIZEymz3Y5Ilq4+m1yo5VNSBn+06aUrEp+CYeq6UBT3qzNQmpc87Zzx9LBshblNOD5CCrVIazqPb
	k4oi7IL4zYiBMJyGB2hdbtbhVcyz6kekV1IQL7DTL4tE8Mvkd3JRjWkpQVcLTb6WsVXLlMuaEfLzY
	m1K8gQ9pZGzBdTR5BTplIbE0yQOWXZcX9Lr9KW8Zw2R1DIdOX0uKFYQpfBG4udqqPK6/PBncCOiNy
	j299i3HQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tj15D-0000000FzHF-3kYX;
	Fri, 14 Feb 2025 19:10:39 +0000
Received: from mgamail.intel.com ([192.198.163.8])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tj0ep-0000000FvRx-2lqm
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Feb 2025 18:43:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739558604; x=1771094604;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=YMbKzKvxqrzppSXk0xeQrHPuFGT1OocEkiDJIUdm2bc=;
  b=QXDd4Uar1UfC0B6H3lWlvfSt6NNgBzYYFiCmwSw1dnQYInKUcsHagtxG
   svarFVkmIspPHQNMaCteHAI0Rj7u4ZXJ/GPeh6Hxh/R2+qc4O96EYAGtM
   B2U+JuuLrT3CVydlA5v/S8Rabe0bAPEdk2fvlLbFcf/Pd9DwO+s44r4OH
   nC3O0ibPTPxmRut//Cwgl8UvBVFKCC2y5PfBqxZxix7iLQAfoexUbgWzo
   ToMY4ASI1LjmX00gY0mH0Dd+WNP5zso/KMbK/vp2pO+D0IthvOZfJJVJJ
   XTH1HqrGS6zJjZpzY2HMqwQSyVk3tVx82c8daVp6HXLXdWDs7dxOlijh1
   g==;
X-CSE-ConnectionGUID: bCPKNbIYSYWdp1P5mlYUpw==
X-CSE-MsgGUID: 4RLkaCT5S2SQXEliGQyBbA==
X-IronPort-AV: E=McAfee;i="6700,10204,11345"; a="57847915"
X-IronPort-AV: E=Sophos;i="6.13,286,1732608000"; 
   d="scan'208";a="57847915"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Feb 2025 10:43:23 -0800
X-CSE-ConnectionGUID: poLhPUHISBKaCDjQMMoD3A==
X-CSE-MsgGUID: spc3cpV3TTSz0vmgbJzDCA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="118731444"
Received: from smile.fi.intel.com ([10.237.72.58])
  by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Feb 2025 10:43:21 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1tj0ek-0000000BZgM-49en;
	Fri, 14 Feb 2025 20:43:18 +0200
Date: Fri, 14 Feb 2025 20:43:18 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>
Cc: linux-pwm@vger.kernel.org, Russell King <linux@armlinux.org.uk>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] pwm: clps711x: Drop of_match_ptr() usage for
 .of_match_table
Message-ID: <Z6-OxrGAl44HrzVg@smile.fi.intel.com>
References: <20250214163442.192006-2-u.kleine-koenig@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250214163442.192006-2-u.kleine-koenig@baylibre.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250214_104323_739020_1AA8C5B3 
X-CRM114-Status: GOOD (  10.77  )
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

On Fri, Feb 14, 2025 at 05:34:42PM +0100, Uwe Kleine-König wrote:
> The pwm-clps711x driver depends on ARCH_CLPS711X || COMPILE_TEST. With
> the former being an ARCH_MULTI_V4T platform, there is always OF=y when
> ARCH_CLPS711X=y, so in practise clps711x_pwm_dt_ids[] is always used.
> (And in the case COMPILE_TEST=y + OF=n this only increases the driver
> size a bit but still compiles.)
> 
> So drop the usage of of_match_ptr().

FWIW,
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Note, that those macros, of_match_ptr() and ACPI_PTR(), more harmful
then helpful. If you look at the history of the project, you may find
many patches that were fixing compilation warnings of unused variables
or so due to (mis)uses of those macros.

-- 
With Best Regards,
Andy Shevchenko



