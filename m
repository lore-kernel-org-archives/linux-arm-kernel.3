Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C6D4D29FEF
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Jan 2026 11:57:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GXkNecrxbuyAnuKyU3aq/LVQMWeL6gu37OXrgGd4uo8=; b=md+Nhwr17SnnJVDKT4d/AQxR9I
	BpasCGx1Nl6BZr8J7uNFrpwdIul/hyFDMgVsRolDhm/hwgb9SmwBuZRMmGz2J0utVyNCSqH2MEUjJ
	gUwawtzMpkg6jHy5S8RicTfH3PBhroiqForrTkDyI6x/23fS6lLtQwkH+fAWK7/HTCGbewHZRLBHm
	4DvPurI5amASAotkkLKk9uJTapdiqpeeFXeLzRsixOg9JnMvdM1ZDhuuWtPBalMOayLvCRXb4B1XZ
	43gmzf8A6wUpnqTC+rgw0FS6rTLaJGSIj84rhRtGBrTmzQAPu2NxfSceTRV0wOkdLoFG1YkaKlaCr
	ReRng3Wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfzUv-000000093eN-0cp2;
	Wed, 14 Jan 2026 11:57:13 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfzUo-000000093cB-3GV9
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Jan 2026 11:57:12 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3FF8D497;
	Wed, 14 Jan 2026 03:56:59 -0800 (PST)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4BC5C3F632;
	Wed, 14 Jan 2026 03:57:04 -0800 (PST)
Date: Wed, 14 Jan 2026 11:56:52 +0000
From: Cristian Marussi <cristian.marussi@arm.com>
To: Sergey Shtylyov <s.shtylyov@auroraos.dev>
Cc: Sudeep Holla <sudeep.holla@arm.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>, arm-scmi@vger.kernel.org,
	linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] cpufreq: scmi: correct SCMI explanation
Message-ID: <aWeEdFdAuIiN6QJ5@pluto>
References: <e6c2e7af-ad87-4d38-9dbb-f9d6ae81fe83@auroraos.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e6c2e7af-ad87-4d38-9dbb-f9d6ae81fe83@auroraos.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260114_035711_056900_F0A752A7 
X-CRM114-Status: UNSURE (   8.60  )
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

On Tue, Jan 13, 2026 at 10:33:30PM +0300, Sergey Shtylyov wrote:
> SCMI stands for System Control and Management Interface, not System Control
> and Power Interface -- apparently, Sudeep Holla copied this line from his
> SCPI driver and then just forgot to update the acronym explanation... :-)
> 

Hi,

> Fixes: 99d6bdf33877 ("cpufreq: add support for CPU DVFS based on SCMI message protocol")
> Signed-off-by: Sergey Shtylyov <s.shtylyov@auroraos.dev>
> ---

Good catch..was up there all the time and never noticed :P 

... but I would certainly drop the Fixes tag.

Thanks,
Cristian

