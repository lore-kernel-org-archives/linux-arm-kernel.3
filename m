Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71F21CA5FC5
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Oct 2026 07:13:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+yKM8vh41MYQTQbF30aMNT3Ea5MdqA+kP6GJxYvP1fA=; b=QtwBbMg+RwCkT0R3CCvsemcwbg
	q/nxFFPhrIE+DFc0RHkRI8ohW+sEbLpRCT7FpjtHxXdRownoFwdgpplHPavN0F1LLkj7oLdICYuph
	MX8Wl0M7v2s626NtA1SQDpdFv6WAKcdToBlmjbqkQ79uQOv3wzwkHGy8rjzSORSlhsZYgGJ0pkisD
	EP8TRpq4cg+k+2pkGhoXO5tUzz16CCu1il1F2/e3dDP4ktT2zYnBh0qnM+5lgzm2Z1B0E9hnxhJER
	o1pxtBLqY/TOVAr0RzJgIJZTWHsfwvlLPK3AgKEAE5tl62n438t2lpscziUwS3HafA7Cktkp2LEAQ
	HRW4C5vg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCAyy-00000007yH3-1X6U;
	Thu, 01 Oct 2026 07:13:32 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCAyx-00000007yGv-05MH
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 01 Oct 2026 07:13:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=+yKM8vh41MYQTQbF30aMNT3Ea5MdqA+kP6GJxYvP1fA=; b=L6O6tUKCyf1zMV8Zogrc7wbeaR
	AYhxslf2RV8xootf5GNMcUb3rXypNUBPvwb5qP0yi7N0TOw4W/L7nqzOTQfCZzty+KCG4TcaYYzNK
	ZEFlTe4XLAR8K7hQWxv00SVPk9moxgteGBGWEHxdl8bAK/4+kfOY1wBPJctOhaCdAicZhiO5mmmIi
	6EbkY6nQg4BIBoDvx/qN7nwCK/QIGhWWdjVcyed0kGVz0MeIidCWPfZ03yjMcdERfQVkT+VhpHklN
	RCYH/JtT7jnFOiwoZBKgC1joeHYPf1kvmvS9hY4ItnEWf+Q6i5VsF6RbASzvAuMgKrLn8rGKpGRpy
	T0yoYq+Q==;
Received: from mgamail.intel.com ([192.198.163.14])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xCAyt-00000004fOP-1RQq
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Oct 2026 07:13:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790838807; x=1822374807;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=c9poQFe28/+6rOsU2BL302o2VdsLPOAG4h+Kc9pufzk=;
  b=MiDZHEI8q4kVOI79CYBMoYd3aeiTn1L4IIZD3JWXfSub8xHZmBlnxJLD
   Imxzf/FJw9JkiB2MVbGuTgJJzs+r6Hbt0QzNMc/xNjwC22MmeemDP6BIT
   DHgI8d/S3fnsk1z9F9FgTRxxeQD/cVe++DjN8vXTc1rTB0UE4LFjDYaHR
   z8+Ny8QiZ99rRc0ihJS8zTqbod+O0FwJ9tDwUUZs+N5k4yu0ghkx/jPQM
   AIDwZXSAlVdSw2pCMMhW4jHW5zOy9NyjopOGqpvKVXu67IA5ynUU3pxWN
   HMJIcPvQodF0hsD82wK1EZs9HorX4aGdigmBSHwFjdXDxgovb62GKYgKs
   Q==;
X-CSE-ConnectionGUID: DlCbnUaOTK2Rjy99/aReSw==
X-CSE-MsgGUID: 0gIz1pzvSKi46EJcZPLLsw==
X-IronPort-AV: E=McAfee;i="6800,10657,11921"; a="91605758"
X-IronPort-AV: E=Sophos;i="6.27,134,1787036400"; 
   d="scan'208";a="91605758"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2026 00:13:24 -0700
X-CSE-ConnectionGUID: vyp43Y8wTKGApRQnopyDig==
X-CSE-MsgGUID: S16I1rjoT8Ga/duDXizAzQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,134,1787036400"; 
   d="scan'208";a="305425762"
Received: from abityuts-desk1.ger.corp.intel.com (HELO localhost) ([10.245.244.27])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2026 00:13:20 -0700
Date: Thu, 1 Oct 2026 10:13:17 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Shih-Yuan Lee <fourdollars@debian.org>
Cc: Mark Brown <broonie@kernel.org>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Lukas Wunner <lukas@wunner.de>, Daniel Mack <daniel@zonque.org>,
	Haojian Zhuang <haojian.zhuang@gmail.com>,
	Robert Jarzmik <robert.jarzmik@free.fr>, linux-spi@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v17 2/6] spi: pxa2xx: introduce clock enable and disable
 helper functions
Message-ID: <ar4IDfYyki7H1k5q@ashevche-desk.local>
References: <20260930160629.1822-1-fourdollars@debian.org>
 <20260930160629.1822-3-fourdollars@debian.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260930160629.1822-3-fourdollars@debian.org>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261001_081328_052582_78913D63 
X-CRM114-Status: GOOD (  15.03  )
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

On Thu, Oct 01, 2026 at 12:06:25AM +0800, Shih-Yuan Lee wrote:
> The driver enables and disables the SOC clock during probe, teardown,

The correct spelling of this acronym is SoC (System on Chip).

> and power management callbacks. Directly calling clk_disable_unprepare()
> when the clock is already disabled—such as when removing a device that
> is runtime-suspended—causes an unbalanced clock disable warning from the
> Common Clock Framework.
> 
> Introduce pxa2xx_spi_clk_enable() and pxa2xx_spi_clk_disable() helper
> functions that track the clock state with a 'clk_enabled' boolean flag
> protected by a 'clk_lock' mutex in struct driver_data. These helpers
> make clock toggling idempotent: repeated enable or disable invocations
> are safe no-ops serialized by clk_lock.
> 
> Convert probe, remove, suspend, resume, and runtime PM callbacks to use
> these helpers instead of direct clk_prepare_enable() and
> clk_disable_unprepare() calls.
> 
> Pack 'clk_enabled' immediately after 'n_bytes' into the existing
> padding hole in struct driver_data, avoiding additional alignment
> padding.
> 
> Assisted-by: Antigravity:gemini-3.8-flash sparse

Assisted-by: LLM

...

Yeah, as Mark asked this change is quite doubtful. Is this a hallucination of
LLM?

-- 
With Best Regards,
Andy Shevchenko



