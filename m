Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C233BC282EC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Mar 2025 10:30:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l0LMNoHQ1ULCxDNr82lQ073arWcTlCbFdmMkGfaFQZ8=; b=Cl9bX1wD4xPfJYL+hD7qSpHeju
	3PlEKCj1+qgPYE86CRtJHBFRs6tMe8JPJMngzbZSfgc7XMn1nGqk2WdefI7yKBuMFK8/VkDWJ0XzW
	fk/ZXC83Vuh+7iBsLePRoXiCAg84N4xtsTkU5P1kABHvvx3jgaC4Y/UIK59FXbgu6WgWThYVKLtL/
	B0YVyHWM0AU9FC3dKMo6A30ecn3EuxLgNbaSO5/ezLguJzTV8Ti9jY6Wh6xdHJiJLcwcMyFNddBSE
	5No7NFYWxoQfh8tpj6q9JocQeNlaHLN4JJSLxZ7pltCcQMMvYeJ3lURHrZtnP5e2IM1hwh/474so6
	xRMBWDeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trws1-00000005L4a-2h87;
	Tue, 11 Mar 2025 10:29:57 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trwkR-00000005Jp2-1UOP
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Mar 2025 10:22:08 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EA8D81762;
	Tue, 11 Mar 2025 03:22:15 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 633833F673;
	Tue, 11 Mar 2025 03:22:04 -0700 (PDT)
Date: Tue, 11 Mar 2025 10:22:00 +0000
From: Leo Yan <leo.yan@arm.com>
To: James Clark <james.clark@linaro.org>
Cc: coresight@lists.linaro.org, yeoreum.yun@arm.com,
	Mike Leach <mike.leach@linaro.org>,
	Jonathan Corbet <corbet@lwn.net>, Leo Yan <leo.yan@linux.dev>,
	Namhyung Kim <namhyung@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] coresight: docs: Remove target sink from examples
Message-ID: <20250311102200.GJ9682@e132581.arm.com>
References: <20241210144933.295798-1-james.clark@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241210144933.295798-1-james.clark@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250311_032207_481496_A7B9878B 
X-CRM114-Status: GOOD (  36.25  )
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

On Tue, Dec 10, 2024 at 02:49:28PM +0000, James Clark wrote:
> 
> Previously the sink had to be specified, but now it auto selects one by
> default. Including a sink in the examples causes issues when copy
> pasting the command because it might not work if that sink isn't
> present. Remove the sink from all the basic examples and create a new
> section specifically about overriding the default one.
> 
> Make the text a but more concise now that it's in the advanced section,
> and similarly for removing the old kernel advice.
> 
> Signed-off-by: James Clark <james.clark@linaro.org>
> ---
>  Documentation/trace/coresight/coresight.rst   | 41 ++++++++-----------
>  .../userspace-api/perf_ring_buffer.rst        |  4 +-
>  2 files changed, 18 insertions(+), 27 deletions(-)
> 
> diff --git a/Documentation/trace/coresight/coresight.rst b/Documentation/trace/coresight/coresight.rst
> index d4f93d6a2d63..806699871b80 100644
> --- a/Documentation/trace/coresight/coresight.rst
> +++ b/Documentation/trace/coresight/coresight.rst
> @@ -462,44 +462,35 @@ queried by the perf command line tool:
> 
>                 cs_etm//                                    [Kernel PMU event]
> 
> -       linaro@linaro-nano:~$
> -
>  Regardless of the number of tracers available in a system (usually equal to the
>  amount of processor cores), the "cs_etm" PMU will be listed only once.
> 
>  A Coresight PMU works the same way as any other PMU, i.e the name of the PMU is
> -listed along with configuration options within forward slashes '/'.  Since a
> -Coresight system will typically have more than one sink, the name of the sink to
> -work with needs to be specified as an event option.
> -On newer kernels the available sinks are listed in sysFS under
> +provided along with configuration options within forward slashes '/' (see
> +`Config option formats`_).
> +
> +Advanced Perf framework usage
> +-----------------------------
> +
> +Sink selection
> +~~~~~~~~~~~~~~
> +
> +An appropriate sink will be selected automatically for use with Perf, but since
> +there will typically be more than one sink, the name of the sink to use may be
> +specified as a special config option prefixed with '@'.
> +
> +The available sinks are listed in sysFS under
>  ($SYSFS)/bus/event_source/devices/cs_etm/sinks/::
> 
>         root@localhost:/sys/bus/event_source/devices/cs_etm/sinks# ls
>         tmc_etf0  tmc_etr0  tpiu0

Just a minor comment.  To reflect the latest hardware, it is good to
mention the TRBE case, users should not and cannot specify TRBE as the
sink name.  The driver will give priority for TRBE by default unless
users specify other sink types.

Otherwise, this is a good polish for me.

Thanks,
Leo

> -On older kernels, this may need to be found from the list of coresight devices,
> -available under ($SYSFS)/bus/coresight/devices/::
> -
> -       root:~# ls /sys/bus/coresight/devices/
> -        etm0     etm1     etm2         etm3  etm4      etm5      funnel0
> -        funnel1  funnel2  replicator0  stm0  tmc_etf0  tmc_etr0  tpiu0
>         root@linaro-nano:~# perf record -e cs_etm/@tmc_etr0/u --per-thread program
> 
> -As mentioned above in section "Device Naming scheme", the names of the devices could
> -look different from what is used in the example above. One must use the device names
> -as it appears under the sysFS.
> -
> -The syntax within the forward slashes '/' is important.  The '@' character
> -tells the parser that a sink is about to be specified and that this is the sink
> -to use for the trace session.
> -
>  More information on the above and other example on how to use Coresight with
>  the perf tools can be found in the "HOWTO.md" file of the openCSD gitHub
>  repository [#third]_.
> 
> -Advanced perf framework usage
> ------------------------------
> -
>  AutoFDO analysis using the perf tools
>  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> 
> @@ -508,7 +499,7 @@ perf can be used to record and analyze trace of programs.
>  Execution can be recorded using 'perf record' with the cs_etm event,
>  specifying the name of the sink to record to, e.g::
> 
> -    perf record -e cs_etm/@tmc_etr0/u --per-thread
> +    perf record -e cs_etm//u --per-thread
> 
>  The 'perf report' and 'perf script' commands can be used to analyze execution,
>  synthesizing instruction and branch events from the instruction trace.
> @@ -572,7 +563,7 @@ sort example is from the AutoFDO tutorial (https://eur03.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgcc.gnu.org%2Fwiki%2FAutoFDO%2FTuto&data=05%7C02%7Cleo.yan%40arm.com%7C0d4875673b894a332a5508dd192a1f35%7Cf34e597957d94aaaad4db122a662184d%7C0%7C0%7C638694390923618348%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=vX1RVi4hA2gEqrVk9lvMV8UFVDzvClvUN7yILwv0788%3D&reserved=0
>         Bubble sorting array of 30000 elements
>         5910 ms
> 
> -       $ perf record -e cs_etm/@tmc_etr0/u --per-thread taskset -c 2 ./sort
> +       $ perf record -e cs_etm//u --per-thread taskset -c 2 ./sort
>         Bubble sorting array of 30000 elements
>         12543 ms
>         [ perf record: Woken up 35 times to write data ]
> diff --git a/Documentation/userspace-api/perf_ring_buffer.rst b/Documentation/userspace-api/perf_ring_buffer.rst
> index bde9d8cbc106..dc71544532ce 100644
> --- a/Documentation/userspace-api/perf_ring_buffer.rst
> +++ b/Documentation/userspace-api/perf_ring_buffer.rst
> @@ -627,7 +627,7 @@ regular ring buffer.
>  AUX events and AUX trace data are two different things.  Let's see an
>  example::
> 
> -        perf record -a -e cycles -e cs_etm/@tmc_etr0/ -- sleep 2
> +        perf record -a -e cycles -e cs_etm// -- sleep 2
> 
>  The above command enables two events: one is the event *cycles* from PMU
>  and another is the AUX event *cs_etm* from Arm CoreSight, both are saved
> @@ -766,7 +766,7 @@ only record AUX trace data at a specific time point which users are
>  interested in.  E.g. below gives an example of how to take snapshots
>  with 1 second interval with Arm CoreSight::
> 
> -  perf record -e cs_etm/@tmc_etr0/u -S -a program &
> +  perf record -e cs_etm//u -S -a program &
>    PERFPID=$!
>    while true; do
>        kill -USR2 $PERFPID
> --
> 2.34.1
> 
> _______________________________________________
> CoreSight mailing list -- coresight@lists.linaro.org
> To unsubscribe send an email to coresight-leave@lists.linaro.org

