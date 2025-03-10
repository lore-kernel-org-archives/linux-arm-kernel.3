Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 486D1C282DE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Mar 2025 16:21:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EMOQxSEFmHXdVNrsaGEIU2oM02xZa9rLXAPz5X9hq+Q=; b=RjjCbm3i3pM7rhFcWE2Bdtaaxu
	MBf7zvmteA/Spn+4T3JDRxJXBVNIVr6DBv8iKiiNkFXbzMGW6WIgKKe5ddQ0BFYNY+Apw5XJkIwvv
	Tv02Uj3RSE7JekEFMQ5djPuB4Yi3NJ8gqItlBzCixzxc7FnJZ8HWuGsYWsgAsX1Z6JCeuBt6qq7Hj
	bf91lYUHREUJry5D5l4e6urCufLk7ELndshcCxTeMTIJSHsh0DnQgnPYlld3fRMv4/LsvPgRKWLKE
	BsSC0dGTHTUS/OlGXdbcfdnX6nTgupAR3DwseiFcfALTW6oHaW3jNt/wCSmzzq5JepPh1b+z7l8TL
	tQapI6oQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trfs1-00000003L0o-3Yhg;
	Mon, 10 Mar 2025 16:20:49 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trfOX-00000003Ha4-07Wn
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Mar 2025 15:50:22 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6EF4E1692;
	Mon, 10 Mar 2025 08:50:31 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 96B003F5A1;
	Mon, 10 Mar 2025 08:50:19 -0700 (PDT)
Date: Mon, 10 Mar 2025 15:50:15 +0000
From: Leo Yan <leo.yan@arm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: Mike Leach <mike.leach@linaro.org>,
	James Clark <james.clark@linaro.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Arnaldo Carvalho de Melo <acme@redhat.com>,
	Namhyung Kim <namhyung@kernel.org>, coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 5/8] coresight: etm: Add an attribute for updating
 buffer
Message-ID: <20250310155015.GG9682@e132581.arm.com>
References: <20250310104919.58816-1-leo.yan@arm.com>
 <20250310104919.58816-6-leo.yan@arm.com>
 <d8b1cf1f-1996-4d9c-9f1a-fad556f91577@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d8b1cf1f-1996-4d9c-9f1a-fad556f91577@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250310_085021_118419_516E7348 
X-CRM114-Status: GOOD (  16.19  )
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

On Mon, Mar 10, 2025 at 01:29:26PM +0000, Suzuki Kuruppassery Poulose wrote:
> Hi Leo
> 
> On 10/03/2025 10:49, Leo Yan wrote:
> > Add an attribute for updating buffer when the AUX trace is paused.  And
> > populate the value to the 'update_buf_on_pause' flag during the AUX
> > setting up.
> 
> Do we need this attribute in the uAPI ?

This uAPI allows users to perform AUX pause and resume without the long
latency caused by copying hardware trace data.

E.g., a user can specify a large AUX buffer size using option "-m,128M".
If the buffer is considered large enough to accommodate hardware trace
data for a small program, the 'update_buf_on_pause' flag can be set to
false, the copying will be deferred until the end of the perf session.

I am bias to keep this uAPI.  If you prefer to remove it, I am also
fine with that.

> Could we do this by default for
> sinks without interrupt ? This definitely improves the quality of trace
> collected for such sinks and the driver can transparently do this.

How about we dynamically set the default flag in the Perf tool?

- If users set explictly the 'update_buf_on_pause' flag, then the
  setting will be respected.
- If users don't set the flag, perf tool detects it is TRBE sinks,
  then it can set 'update_buf_on_pause' flag as false.
- If users don't set the flag, perf tool detects it is ETF/ETB/ETR
  sinks, it sets the flag as true.

Thanks,
Leo

