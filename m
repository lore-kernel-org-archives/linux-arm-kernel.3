Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80D87C44503
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 07:32:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oNVUQ92jBwwxywegXzI0TWPMEPlj68rviJkG3eLuETg=; b=KYMh70DeVm2vIzso3n6uTLGK/2
	REKsk6VT1aOHLA/KHERiYjMMCNfmXrRvmK3RaQDnFLjKfQZBRbtTJFX9S2X1sMkHQVbrNjAp1s9yo
	YHHSnDiLWedmVA7fbCC7EA+1btSDnHrzoVPQ3sUk6QFof7Ta9NT+hqZYbpigQUq2plgJ0RZ3koSKC
	bBS7Uoue4cee0vmpEut1q5dwC9QMaJCeGD7SVG4v4Ss29r2lCGxiCh1QEaElzPOzssmbGyF7fEJda
	R1gwZ7iNkgBopBtSF8BXO16B4Wg70JILHiWlbRb0kIIaqNbYAcBwGrZWMBrxqiBZ7OEwyQPN9LTZP
	+pl1cegw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whjEh-00000001I1g-2PmS;
	Thu, 09 Jul 2026 07:31:55 +0000
Received: from mgamail.intel.com ([198.175.65.18])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whjEO-00000001Hp0-38QV;
	Thu, 09 Jul 2026 07:31:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783582297; x=1815118297;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=cjMXLnfC6g6dIxN+DHVrz3kfjIpPNwD3v2Vrk7OqkFQ=;
  b=g5lqCq7Ljeir41gx6VQzpxMMbY1ezF0HO3Ui/mz6T7oZicTtEzAdT/iB
   MyG9YXIg8mMeN1YqIntg+W7RUbBKkqpznHYSqB+uPkrkDFQ8qhr1q7ZPx
   nRQkpOlrkskWo4Lbp4M/SXvZ90XV4dC/i9hJqdFTUEzqVMr3IMdrAxVqq
   6XV6kKr8d5EQOHAGRAqtWbyZwtpDFEhzbVaiNlROU6E7tjSdOFRp3BilI
   eM01jT+TVo8JrPqXr2160r8fjahnF+E03A4QH9VVchlictvSXfGYxyL5z
   ejnsmbPNt8AhKeWoSvE8lF2frPQD7x+PurQ59TH2dLXRZYPJI8MlmPh+S
   Q==;
X-CSE-ConnectionGUID: 75E3ZfYbStCP1Br88j5Wgw==
X-CSE-MsgGUID: bjgr0IllRWae6glTLd1sAQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="84356462"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="84356462"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jul 2026 00:31:18 -0700
X-CSE-ConnectionGUID: l77jRguWS0KUZDhOEz0AwA==
X-CSE-MsgGUID: c8A8Itj8SOiqwX6JveJBLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="277729305"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.245.235])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jul 2026 00:31:10 -0700
Date: Thu, 9 Jul 2026 10:31:08 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Praveen Talari <praveen.talari@oss.qualcomm.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Richard Genoud <richard.genoud@bootlin.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Orson Zhai <orsonzhai@gmail.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Chunyan Zhang <zhang.lyra@gmail.com>,
	Patrice Chotard <patrice.chotard@foss.st.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Peter Korsgaard <jacmet@sunsite.dk>,
	Michal Simek <michal.simek@amd.com>,
	Aaro Koskinen <aaro.koskinen@iki.fi>,
	Janusz Krzysztofik <jmkrzyszt@gmail.com>,
	Tony Lindgren <tony@atomide.com>,
	Russell King <linux@armlinux.org.uk>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	bjorn.andersson@oss.qualcomm.com,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-omap@vger.kernel.org, linux-mips@vger.kernel.org,
	Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
	aniket.randive@oss.qualcomm.com,
	chandana.chiluveru@oss.qualcomm.com
Subject: Re: [PATCH 0/6] tty: serial: propagate errors from uart_ops.pm
 callback
Message-ID: <ak9OPNcVAhkfxHvZ@ashevche-desk.local>
References: <20260709-add_return_check_for_uart_change_pm-v1-0-e85c6ffa8ec4@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260709-add_return_check_for_uart_change_pm-v1-0-e85c6ffa8ec4@oss.qualcomm.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_003136_888911_15CE3BB9 
X-CRM114-Status: GOOD (  24.65  )
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

On Thu, Jul 09, 2026 at 11:55:12AM +0530, Praveen Talari wrote:
> The uart_ops.pm callback has been declared void since its introduction,
> which means any error from a driver's power management implementation is
> silently discarded by uart_change_pm(). Beyond losing the error
> information, uart_change_pm() unconditionally updates state->pm_state
> even when the underlying hardware transition failed. This causes the
> serial core to track a power state that does not reflect reality:
> subsequent calls to uart_change_pm() see the stale cached state as
> matching the requested state and skip the callback entirely, leaving the
> hardware permanently stuck with no further recovery attempt.
> 
> On modern platforms where the .pm callback performs real work —
> enabling clock trees, interacting with runtime PM, asserting voltage
> regulators — this is a correctness gap. Failures are invisible to the
> PM framework, the port proceeds to call ops->startup() on potentially
> unpowered hardware, and suspend/resume errors are hidden from the core
> that needs to handle them.
> 
> This series fixes the problem in four steps:
> 
>   Patch 1 changes the uart_ops.pm callback signature from void to int,
>   updates uart_change_pm() to propagate errors and only commit
>   state->pm_state on success, and handles the return value at every
>   call site in serial_core.c with appropriate policy per context
>   (propagate, log, or skip-on-failure).
> 
>   Patch 2 updates the 8250 driver family: serial8250_do_pm() and
>   serial8250_pm() are updated to return int (with the exported symbol
>   declaration updated in serial_8250.h), and the 8250 sub-driver
>   pm callbacks are updated to return 0.
> 
>   Patch 3 updates the remaining non-8250 serial drivers. All .pm
>   implementations are updated to return 0. The sh-sci forward
>   declaration shared with rsci is also updated.
> 
>   Patch 4 updates arch-level implementations: SA1100 (assabet, h3xxx),
>   OMAP1/ams-delta (modem_pm, now propagates regulator errors), and
>   MIPS/Alchemy (alchemy_8250_pm).
> 
> All existing .pm implementations return 0, so there is no functional
> change for any current driver. The series purely adds the infrastructure
> for drivers to report errors going forward, with the serial core ready
> to handle them correctly.

Just no, please just properly implement runtime PM. The .pm() must die completely.
I used to have the PoC for that long time ago [1], but due to lack of time and
other priorities it went abandoned. Also Atlassian made a brain damages move to
limit repository to 1Gb, so I haven't able to update it for a few years.

Note, that Tony (you have him in the Cc list) did a lot for some corner cases
with that and we still have them IIRC. Tony, do you know what is the state of
affairs with runtime PM for UART?

[1]: https://bitbucket.org/andy-shev/linux/branch/topic/uart/rpm-plus

-- 
With Best Regards,
Andy Shevchenko



