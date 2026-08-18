Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 330E7C5DF74
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Aug 2026 13:25:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jDrSbf2E+5llMXOBfsjkGfb/1pV2O0FlhpkVsaAF2o0=; b=E45bbgX3ezLX9Si955M13watla
	6ABlc2HaXXw8100hpqSy125z1hAU+j/E1yEXRb9V6C9lUcbXBHwezdY8whZQru0lr56Swv6xJvqKI
	PW6p86NB6tdTYJfR/8Wdv127rKg1r7ebDBqmoXGNCy55WMmKSsKRhu8hxxwVISKXZon07wPk1CLgS
	LakCiBXQH6PPb0aNKHJj+ADP17xh+g+0eb3kj0zrdaBaRBjw91VldyrnjjZS7UW4teqZzi+YbXmEo
	TTFMNpjiS3FoYZXD1rkWwCYl7YicVb3hLE5nQiTLpKBSDh0vsy/0Xn44kcvbQAGT1oJu0BYSsNJIQ
	PpuZFdMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwJov-000000082d1-1jtF;
	Tue, 18 Aug 2026 13:25:37 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwJos-000000082bi-2b2f
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Aug 2026 13:25:36 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8F1D91516;
	Tue, 18 Aug 2026 06:25:26 -0700 (PDT)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B134A3F673;
	Tue, 18 Aug 2026 06:25:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1787059530; bh=OJp14S+iPt1BXD5wTtSCszOJNvf4u0MI/zwVRUKoPrQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BckAIkpTAjNcNf38AZcEvNZ++T3jG+At4QE+uMC7m/JRIClYis3jW2DSQTU8iq/qy
	 AXC98h6oCLGhELY2BDzcjM0+gleldOBKyaM1TEYkSLeV3HXd1FBdzrfkEW75l7ChsW
	 XRd56DO9Cx0LVQKr+JzQzTCdX7UfMmac2Nc0Mjvg=
Date: Tue, 18 Aug 2026 14:25:19 +0100
From: Cristian Marussi <cristian.marussi@arm.com>
To: Fayssal Benmlih <Fayssal.Benmlih@arm.com>
Cc: Cristian Marussi <Cristian.Marussi@arm.com>,
	"arm-scmi@vger.kernel.org" <arm-scmi@vger.kernel.org>,
	"d-gole@ti.com" <d-gole@ti.com>,
	"david@kernel.org" <david@kernel.org>,
	Elif Topuz <Elif.Topuz@arm.com>,
	"etienne.carriere@st.com" <etienne.carriere@st.com>,
	"f.fainelli@gmail.com" <f.fainelli@gmail.com>,
	"james.quinlan@broadcom.com" <james.quinlan@broadcom.com>,
	"jic23@kernel.org" <jic23@kernel.org>,
	"kas@kernel.org" <kas@kernel.org>,
	"kernel-team@meta.com" <kernel-team@meta.com>,
	"leitao@kernel.org" <leitao@kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Lukasz Luba <Lukasz.Luba@arm.com>,
	"michal.simek@amd.com" <michal.simek@amd.com>,
	"peng.fan@oss.nxp.com" <peng.fan@oss.nxp.com>,
	Philip Radford <Philip.Radford@arm.com>,
	"puranjay@kernel.org" <puranjay@kernel.org>,
	Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
	"sudeep.holla@kernel.org" <sudeep.holla@kernel.org>,
	"usama.arif@linux.dev" <usama.arif@linux.dev>,
	"vincent.guittot@linaro.org" <vincent.guittot@linaro.org>
Subject: Re: [PATCH v7 11/23] firmware: arm_scmi: Add Telemetry notification
 support
Message-ID: <aoRdP1u5lhUCclbU@pluto>
References: <20260802145618.1952804-12-cristian.marussi@arm.com>
 <53688831-E76D-48AB-99E7-4CE7C456620B@contoso.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <53688831-E76D-48AB-99E7-4CE7C456620B@contoso.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260818_062534_909842_2273BB7A 
X-CRM114-Status: GOOD (  16.88  )
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

On Mon, Aug 03, 2026 at 11:55:02PM +0100, Fayssal Benmlih wrote:
> Hi Cristian,
> 

Hi,

> A couple of notification payload sizing issues inline.
> 
> > 	/* At least sized as an empty notification */
> > 	if (payld_sz < sizeof(*p))
> > 		return NULL;
> >
> > 	r->timestamp = timestamp;
> > 	r->agent_id = le32_to_cpu(p->agent_id);
> > 	r->status = le32_to_cpu(p->status);
> > 	r->num_dwords = le32_to_cpu(p->num_dwords);
> >
> > 	if (r->num_dwords * sizeof(r->dwords[0]) > payld_sz)
> > 		return NULL;
> 
> payld_sz includes the fixed wire header containing agent_id, status and
> num_dwords. The array length is compared against that full size instead of
> the bytes remaining after sizeof(*p).
> 
> This can accept num_dwords values whose array extends beyond the received
> payload. The multiplication can also wrap before the comparison.
> 
> Please validate num_dwords using division after accounting for the fixed
> header, for example against:
> 
> 	(payld_sz - sizeof(*p)) / sizeof(p->array[0])
> 
> after first checking payld_sz >= sizeof(*p).
>

All of this has been revised in v10 accounting for the header and for
any possible 32bit wraparound...

> > static const struct scmi_event tlm_events[] = {
> > 	{
> > 		.id = SCMI_EVENT_TELEMETRY_UPDATE,
> > 		.max_payld_sz = 0,
> > 		.max_report_sz = 0,
> > 	},
> > };
> 
> With max_report_sz set to zero, the generic notification code allocates
> max_msg_sz bytes for the decoded report.
> 
> The decoded scmi_telemetry_update_report has a larger fixed header than
> the wire payload because it also includes ktime_t. Consequently, a
> maximum-sized valid wire payload requires more than max_msg_sz bytes after
> conversion and can overflow the report buffer.
> 
> Please provide or calculate enough space for the decoded report header
> plus the maximum dword array, or constrain the number of copied dwords to
> the actual report-buffer capacity.

Indeed, I will have to review this sizing...

Thanks,
Cristian

