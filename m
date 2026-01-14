Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58755D3901B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Jan 2026 21:13:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4LsoFmz+aZmX1T3XaT99HOYStWp7eRbqS93II9I84WE=; b=KuWbKvfBhosLfIRIlEnQOq2dNs
	ro4RDDG9UMpj2lEWOIJGTtAVPB5qrNCzN1Ext2fJAZdEuED0eHG8uYyJxeQflucaOdiR5Qb3Q9+VG
	dGuLfIuT2ersiaM9RSjA0CjUgfG4vCwxUO7bXDeQBy+H+fvG5+pA2KuV5mFbA+8nSs4KPOOQxEScN
	MVptF3p3gJa8tps7KwE3DMmNvW7S3XmzzB3k9mipOZlheQk8HpSb8apD1R+3nCerAeOFnRQM5WX2t
	Pa0b05FcC2TSmYngD/7SGTW+b/ErbKfDx4OfLnXx8S12e2bVs7fjlKM8a77JILJVj01+3nUZPdd1v
	fWWevYOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg8BG-0000000AkDv-1SXn;
	Wed, 14 Jan 2026 21:13:30 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg8BE-0000000AkD4-19nw
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Jan 2026 21:13:29 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 798151515;
	Wed, 14 Jan 2026 13:13:19 -0800 (PST)
Received: from bogus (unknown [10.57.49.158])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EC7353F59E;
	Wed, 14 Jan 2026 13:13:23 -0800 (PST)
Date: Wed, 14 Jan 2026 21:13:20 +0000
From: Sudeep Holla <sudeep.holla@arm.com>
To: Satya Durga Srinivasu Prabhala <satya.prabhala@oss.qualcomm.com>
Cc: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Sudeep Holla <sudeep.holla@arm.com>, linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	trilok.soni@oss.qualcomm.com
Subject: Re: [PATCH] firmware: smccc: default ARM_SMCCC_SOC_ID to disabled
Message-ID: <aWgG8EbNgn_wXPjh@bogus>
References: <20260112-disable_smccc_soc_id-v1-1-a5bee24befb4@oss.qualcomm.com>
 <aWYk_qGvA9Kn0xGe@willie-the-truck>
 <6e674553-d0e5-449a-a49f-84f5d32cec94@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6e674553-d0e5-449a-a49f-84f5d32cec94@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260114_131328_361753_7C4DAF74 
X-CRM114-Status: GOOD (  16.98  )
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

On Wed, Jan 14, 2026 at 08:58:01AM -0800, Satya Durga Srinivasu Prabhala wrote:
> Hello Will,
> 
> On 1/13/2026 2:57 AM, Will Deacon wrote:
> > On Mon, Jan 12, 2026 at 10:24:06PM -0800, Satya Durga Srinivasu Prabhala wrote:
> > > The ARM SMCCC SoC ID driver is currently enabled by default and publishes
> > > SMCCC-provided SoC identification into /sys/bus/soc/devices/socX/*.
> > > 
> > > On platforms where a vendor SoC driver already exposes widely-consumed
> > > attributes (e.g. Qualcomm socinfo [1]), enabling the SMCCC driver changes
> > > the format of /sys/devices/soc0/soc_id (e.g. "jep106:XXYY:ZZZZ" instead
> > > of a vendor logical ID like "519") and breaks existing userspace consumers.
> > Isn't the fundamental issue here that you have multiple callers of
> > soc_device_register() and your userspace is only looking at soc0?
> Yes, that is right. The issue is we have several products which already
> uses the soc0 interface as vendor interface [1] existed even before the
> SMCCC SCM ID [2]. Also, per SMCCC specification, SOC ID is an optional
> feature.

Yes it is optional and that means kernel won't complain if it is not
implemented in the firmware.

> So, vendor specific implementation can take precedence over
> standard implementation or a way to disable SMCCC SOC ID could help.
> 

Yet this vendor specific implementation chose to implement the optional
feature when it needed the vendor specific implementation can take precedence
over this. It had the choice and when it implemented it, it choose and
it can't expect the generic OS to ignore firmware standard interface
just because it has vendor specific implementation else where.

And one of the reasons some of the vendors needed this SOC_ID in the
SMCCC is o avoid or have precedence over any other interface(like DT/ACPI)
that can override or provide other information.

-- 
Regards,
Sudeep

