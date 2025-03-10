Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50907C35FF3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Mar 2025 18:05:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yeXejWd0sNA8dlRAS4PeSZftgNVIbz4Wk1iG2Hn85C8=; b=BJ8F1D1Xqx4UwPoUX3nGU0hqp3
	Do7MYoepuNa+6syb37SGYmpVQBf0n9yI7zgIhcHdghVH/HxLpebiUXIz884HL9VkoXxCMY3ev3+8z
	4hWU/vWYtsbAYBeB/0qpIcEIXQa4ZPT41HUBBlWoYSyQiEdUPVwD79vi9zx+ix0abvv/6eBlvYRkV
	jc+jJSg/RDm/ZwWK+vGpE8nyWejC4YYU5LkQCUwldF+078Oxvb282Yc25jshKbbcPiyyX413RABvm
	fR2zjX3SxGSyyg9hfBmcMtu73Yd7WKuMlCl1yy0IIbe52fcP1W8DnnIJs3kb4W/ybh1Oc8FgKoo+T
	rFZ12WQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trhVO-00000003Yun-1Ki0;
	Mon, 10 Mar 2025 18:05:34 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trg8S-00000003Mcw-0TXA
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Mar 2025 16:37:49 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A2CCB1692;
	Mon, 10 Mar 2025 09:37:58 -0700 (PDT)
Received: from [10.57.39.43] (unknown [10.57.39.43])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 99ADE3F5A1;
	Mon, 10 Mar 2025 09:37:45 -0700 (PDT)
Message-ID: <3f4354e7-e74b-4ce9-b0c7-4be103cbc94d@arm.com>
Date: Mon, 10 Mar 2025 16:37:44 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/8] coresight: etm: Add an attribute for updating
 buffer
Content-Language: en-GB
To: Leo Yan <leo.yan@arm.com>
Cc: Mike Leach <mike.leach@linaro.org>, James Clark <james.clark@linaro.org>,
 Jonathan Corbet <corbet@lwn.net>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Arnaldo Carvalho de Melo <acme@redhat.com>,
 Namhyung Kim <namhyung@kernel.org>, coresight@lists.linaro.org,
 linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250310104919.58816-1-leo.yan@arm.com>
 <20250310104919.58816-6-leo.yan@arm.com>
 <d8b1cf1f-1996-4d9c-9f1a-fad556f91577@arm.com>
 <20250310155015.GG9682@e132581.arm.com>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20250310155015.GG9682@e132581.arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250310_093748_200273_82DAF746 
X-CRM114-Status: GOOD (  21.70  )
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

On 10/03/2025 15:50, Leo Yan wrote:
> On Mon, Mar 10, 2025 at 01:29:26PM +0000, Suzuki Kuruppassery Poulose wrote:
>> Hi Leo
>>
>> On 10/03/2025 10:49, Leo Yan wrote:
>>> Add an attribute for updating buffer when the AUX trace is paused.  And
>>> populate the value to the 'update_buf_on_pause' flag during the AUX
>>> setting up.
>>
>> Do we need this attribute in the uAPI ?
> 
> This uAPI allows users to perform AUX pause and resume without the long
> latency caused by copying hardware trace data.
> 
> E.g., a user can specify a large AUX buffer size using option "-m,128M".
> If the buffer is considered large enough to accommodate hardware trace
> data for a small program, the 'update_buf_on_pause' flag can be set to
> false, the copying will be deferred until the end of the perf session.
> 
> I am bias to keep this uAPI.  If you prefer to remove it, I am also
> fine with that.
> 
>> Could we do this by default for
>> sinks without interrupt ? This definitely improves the quality of trace
>> collected for such sinks and the driver can transparently do this.
> 
> How about we dynamically set the default flag in the Perf tool?
> 
> - If users set explictly the 'update_buf_on_pause' flag, then the
>    setting will be respected.
> - If users don't set the flag, perf tool detects it is TRBE sinks,
>    then it can set 'update_buf_on_pause' flag as false.

Not really possible. There could be systems with mixed sinks. e.g.  TRBE
for some CPU and ETR for others (say due to a non-functioning TRBE).

> - If users don't set the flag, perf tool detects it is ETF/ETB/ETR
>    sinks, it sets the flag as true.

And in the cases above, perf event cannot run on all the CPUs, because
some sinks don't support it.

Why do we need a flag, when the effect is not user (read, perf decoder)
  visible and at the same time improves some scenarios (read non-TRBE 
cases) ?

I would say, let the driver always update on pause, depending on the
sink.

Suzuki


> 
> Thanks,
> Leo


