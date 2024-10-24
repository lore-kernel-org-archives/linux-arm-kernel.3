Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25D02CE8E6B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Oct 2024 12:36:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dc61aO9JOx77l48SuqoG28OU9kN8AnSJmOv53cSDKDM=; b=Um81jEAxDUaW6mgvaxBbg90C9S
	21n/mopt1sRNWd0oybGoBHRaQKf7p9HikEXBOCcUSdzeC57b6z4tMBHIjjUZB1jGsYP5Jg8N3+l4S
	DdobI3isQANKCGD3sHtRrFO+o6EnvjjzEUdnVtx4ex1NuSRLMxUiCl356Scc1N0p6H17KoAUOMyjg
	Js9nUq9/L2nRWVpOHgvkOSZ0WI155+HH3imKH05htTX5Pgrh1U88m9ReOSk9xcBLH4phF3wy0h1a7
	XxNXmZjm9nxKtjYB7ZsRZZbzk03/Sgn2O8is+7Z1B9NQnr9jsJ71/aHtzl9ga6DA1dVC3MJi/RWtM
	QZdI6N7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3x4h-00000000MXq-3KSY;
	Thu, 24 Oct 2024 12:36:23 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3x0m-00000000LZY-39sf
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Oct 2024 12:32:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id AB7DAA452BC;
	Thu, 24 Oct 2024 12:32:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38110C4CEC7;
	Thu, 24 Oct 2024 12:32:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729773139;
	bh=Wd/KflD3TuIrYexF+RqDPBbsLv7X8c2ZJeNEkLJ+9Iw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nMC9mC5GVQvL557SJMJTQl6N8GXLEXz8m/cOr8+XNEm26Aa1tYfStcj38lAHJuYkr
	 /3l0KyJlhzwSfNa/F09PzatmeMxLtXUKlUgrSfb+mzpLdFN7KwrdNNyITuNTT9ql+7
	 aYn2n9KcaC0fnll0zYtSIg16XuS9kVKXLgXB+FBbfD9l5jkJCDuNxGkNY0uuS46oy6
	 q7B7FAgOpZ3G93HYyjWFAUU4S0DpFsCujlZFW8Kar+zBHh2Z/0DaYztQ+IFbnKCCiV
	 oVHUce9uUUHxwR/S55Up9+4uIvEI1n3BZqhZ6qQo+lKvVwRiBWOjk2iGUG02xiqWAI
	 axnVtltC7Gjmw==
Date: Thu, 24 Oct 2024 13:32:14 +0100
From: Will Deacon <will@kernel.org>
To: Gowthami Thiagarajan <gthiagarajan@marvell.com>
Cc: mark.rutland@arm.com, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, gcherian@marvell.com,
	sgoutham@marvell.com, lcherian@marvell.com
Subject: Re: [PATCH v9] perf/marvell: Marvell PEM performance monitor support
Message-ID: <20241024123214.GB30704@willie-the-truck>
References: <20241016131457.3821256-1-gthiagarajan@marvell.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241016131457.3821256-1-gthiagarajan@marvell.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241024_053220_886232_22869FA2 
X-CRM114-Status: GOOD (  12.50  )
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

On Wed, Oct 16, 2024 at 06:44:57PM +0530, Gowthami Thiagarajan wrote:
> PCI Express Interface PMU includes various performance counters
> to monitor the data that is transmitted over the PCIe link. The
> counters track various inbound and outbound transactions which
> includes separate counters for posted/non-posted/completion TLPs.
> Also, inbound and outbound memory read requests along with their
> latencies can also be monitored. Address Translation Services(ATS)events
> such as ATS Translation, ATS Page Request, ATS Invalidation along with
> their corresponding latencies are also supported.
> 
> The performance counters are 64 bits wide.
> 
> For instance,
> perf stat -e ib_tlp_pr <workload>
> tracks the inbound posted TLPs for the workload.
> 
> Signed-off-by: Gowthami Thiagarajan <gthiagarajan@marvell.com>
> Signed-off-by: Linu Cherian <lcherian@marvell.com>

I think this Signed-off-by: line from Linu is new in v9. What happened?
I notice that Linu is listed as the driver author:

> +MODULE_DESCRIPTION("Marvell PEM Perf driver");
> +MODULE_AUTHOR("Linu Cherian <lcherian@marvell.com>");

but the patch author is you, so git blame will be inconsistent.

Please can you make sure that MODULE_AUTHOR and the patch author are
consistent, and then use Co-developed-by as well as the additional SoB
for the second author?

Will

