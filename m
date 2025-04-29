Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F016C369DC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Apr 2025 10:54:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HZvDKzRV9PpUUmKkO7YhWOZ6Irngop10TOezwCA/1o0=; b=yOJnGY8cAD13ABD01p2aGlhASK
	cMxevAdUG7wvFr/UvXAtcspgxulcORgACyrMIX1DlfgoD0LtV9tO0UCh9w+/FnyEQFoRKE51T4g6s
	t1o1e5KuUGKUktTQfSTcQIpe/LNtFD7Tfr3nRErYYWmBrg1X61AmU6E+o5aUixTi6x2wFijcbU6C/
	vXMJ5OG2fuzxywlOj79zwebT4ZrA0+AU9Qc2aGeckUS/V7+NigKhO+6M78R2ccEYJptljKCT6eLqL
	dUW/CNBgvpoVLys9/ASotQzirGZrnkSzaN6j22qETok7PkkPU+RL7GjTJ9gVnf/zLRHo6MDZqwumB
	WLklX9mA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9ibC-00000009MyB-0219;
	Tue, 29 Apr 2025 10:54:02 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9iWw-00000009MRL-2TPJ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Apr 2025 10:49:40 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 37F261515;
	Tue, 29 Apr 2025 03:49:28 -0700 (PDT)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BBAB33F66E;
	Tue, 29 Apr 2025 03:49:32 -0700 (PDT)
Date: Tue, 29 Apr 2025 11:49:29 +0100
From: Cristian Marussi <cristian.marussi@arm.com>
To: Johan Hovold <johan@kernel.org>
Cc: Cristian Marussi <cristian.marussi@arm.com>,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org, sudeep.holla@arm.com,
	james.quinlan@broadcom.com, f.fainelli@gmail.com,
	vincent.guittot@linaro.org, peng.fan@oss.nxp.com,
	michal.simek@amd.com, quic_sibis@quicinc.com,
	dan.carpenter@linaro.org, maz@kernel.org
Subject: Re: [PATCH v2 4/4] [NOT FOR UPSTREAM] firmware: arm_scmi: quirk:
 Ignore FC bit in attributes
Message-ID: <aBCuuUC01i7zflnA@pluto>
References: <20250425125250.1847711-1-cristian.marussi@arm.com>
 <20250425125250.1847711-5-cristian.marussi@arm.com>
 <aA5DVxP7n5GDFxoO@hovoldconsulting.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aA5DVxP7n5GDFxoO@hovoldconsulting.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250429_034938_742571_16F1BE56 
X-CRM114-Status: GOOD (  18.44  )
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

On Sun, Apr 27, 2025 at 04:46:47PM +0200, Johan Hovold wrote:
> On Fri, Apr 25, 2025 at 01:52:50PM +0100, Cristian Marussi wrote:
> > Some platform misreported the support of FastChannel when queried: ignore
> > that bit on selected platforms.
> > 
> > Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
> > ---
> > Match features has to be set-up properly before upstreaming this.
> > Ideally the out-of-spec firmware should be matched with a quirk matching
> > pattern based on Vendor/SubVendor/ImplVersion....but it is NOT clear if the
> > platform at hand will ship with future fixed firmwares where the ImplVersion
> > field is properly handled.
> > If we cannot be sure about that, we should fallback to a compatible match.
> > 
> > v1 -> v2
> > - use multiple compats quirks syntax
> > 
> > RFC->V1
> > - fix QUIRKS conditions
> 
> >  /* Global Quirks Definitions */
> >  DEFINE_SCMI_QUIRK(clock_rates_triplet_out_of_spec, NULL, NULL, NULL);
> > +DEFINE_SCMI_QUIRK(perf_level_get_fc_force,
> > +		  "bad-vend", NULL, "0x20000-", "bad-compat", "bad-compat-2");
> 
> Still works when matching on vendor and version (and/or machine or SoC
> compatible):
> 
> Reviewed-by: Johan Hovold <johan+linaro@kernel.org>
> Tested-by: Johan Hovold <johan+linaro@kernel.org>
> 
> I think we can go ahead and merge this based on vendor and version
> "0x20000-".
> 
> Depending on what Sibi finds out, or if it turns out to be needed, we
> can always add an upper version bound later.

Sure...sounds good.
Please post your final tested patch on top on my V3 as said elsewhere.

Thanks,
Cristian

