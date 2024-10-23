Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41325CFA453
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Oct 2024 17:06:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=djumMf8ae9f0crsQukxp64jBfIF3UahDmzCmSZzVmWw=; b=tOFlWydMDCSsTsJ03lI9mET5Zh
	r0a2yxSDtJ/kB1BvWFHauzZjqYJ++mmpSqY03PcIlf776nsSzk8f7M8b+zKx4rT8fuCrMqT9L6lsk
	A6QRN2+mWVsGYc/ubE2eekopdXMOFEA5vZtyiyQO7lB646FQErGulcjyxvv2Ukp0jHJFeuGThAmew
	xpieYbs7QewHIHJYw3cbMsYgMfBy9FoR/7g7FigHcLkNl9omVRz5n0Zyw68T8sPagfb24RlDuwMYq
	xeCbyM7EqUeU3TOushNk6esxRFVX21PdUvMGyvonAxfwB1SAsvdvAtOcFaE4AHT24VN4EDgdULJZg
	66FfPRWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3eny-0000000FI5J-36I6;
	Wed, 23 Oct 2024 17:05:54 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3eBX-0000000F9fc-21fp
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 23 Oct 2024 16:26:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=djumMf8ae9f0crsQukxp64jBfIF3UahDmzCmSZzVmWw=; b=LDUWYUHRMt/ue4PZJBQhZ1OIf2
	sh1cVGSCa2jFCz9sLqqUt/kgK11VksNvX730gVwc8ZRkTFj3o1HoqLiwrDcjfrmYV6HDjHccrYSJB
	Y8nnU6vVziWPY3nZukf/n/2NMtDgbZsWM94PaeJdJdGeldIxX3s1g3x6BVtUtr4Y/9BGxqwi1qLul
	yoaaS/RZaSbX/Kllpbe+ws3F5qN43zA+fpM5iEgz2Jc26M9UCmFjGuMg5mHTlVKmInNQjWoe4gajD
	l3zH7IGdxlYkUHF4/+G/UpYVwLu83GIKrvw/Oa66+YtiRi2z175e3fqMAiHFRrbtTvAw/T1gsZTRl
	c8OUckbA==;
Received: from dfw.source.kernel.org ([139.178.84.217])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3eBT-00000008Ria-3qSZ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Oct 2024 16:26:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id DF71D5C5C3A;
	Wed, 23 Oct 2024 16:25:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6636C4CEC6;
	Wed, 23 Oct 2024 16:26:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729700763;
	bh=ZnAYm2TJOCxsEMUg1iKlsmwaRxpZn2CUIxr94dEYTEo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tkVjSHUYFWclSNvqyA9MWWrL9LSNsnCLeltO+unH9duOufiWkrRs4PiDsrAaXaykm
	 n6sFngrTGkv0VSIcWz9qJgUQeOaHczqi124qBatb0MnCB1w866W18RW4bjAdqBiDlw
	 ev6K7gnRgeTa98D9PFAWmxVOV8Own4ZKSs+DumtO1m1uuKzulus/X7B07rQAGjDQn+
	 ggIRAH7kNzXeDtPhEq+dycS9rLeuaZ3GFG0uaVkcuJNCC47vVE0yy5Yfq487Vix6oO
	 R1GRk3FVuSzKo4wc26oGSqhh2OocxfAVAJo5LbMz5XI1iL8bTEGcV6/i1/IKoPJD+v
	 dwXe2TIhSw2zA==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1t3eBc-000000006FX-37sy;
	Wed, 23 Oct 2024 18:26:16 +0200
Date: Wed, 23 Oct 2024 18:26:16 +0200
From: Johan Hovold <johan@kernel.org>
To: Sibi Sankar <quic_sibis@quicinc.com>
Cc: sudeep.holla@arm.com, cristian.marussi@arm.com, ulf.hansson@linaro.org,
	jassisinghbrar@gmail.com, linux-kernel@vger.kernel.org,
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org, konradybcio@kernel.org,
	linux-pm@vger.kernel.org, tstrudel@google.com, rafael@kernel.org
Subject: Re: [PATCH V3 0/4] firmware: arm_scmi: Misc Fixes
Message-ID: <ZxkjqEmkBAsC6UkL@hovoldconsulting.com>
References: <20241007060642.1978049-1-quic_sibis@quicinc.com>
 <ZwfsmqInJlqkQD_3@hovoldconsulting.com>
 <ae5eaef9-301f-7d3f-c973-faa22ae780ee@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ae5eaef9-301f-7d3f-c973-faa22ae780ee@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241023_172608_286323_7DC463E9 
X-CRM114-Status: GOOD (  17.67  )
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

On Wed, Oct 23, 2024 at 01:16:47PM +0530, Sibi Sankar wrote:
> On 10/10/24 20:32, Johan Hovold wrote:
> > On Mon, Oct 07, 2024 at 11:36:38AM +0530, Sibi Sankar wrote:
> >> The series addresses the kernel warnings reported by Johan at [1] and are
> >> are required to X1E cpufreq device tree changes [2] to land.
> >>
> >> [1] - https://lore.kernel.org/lkml/ZoQjAWse2YxwyRJv@hovoldconsulting.com/
> >> [2] - https://lore.kernel.org/lkml/20240612124056.39230-1-quic_sibis@quicinc.com/
> >>
> >> The following warnings remain unadressed:
> >> arm-scmi arm-scmi.0.auto: Failed to add opps_by_lvl at 3417600 for NCC - ret:-16
> >> arm-scmi arm-scmi.0.auto: Failed to add opps_by_lvl at 3417600 for NCC - ret:-16
> > 
> > Are there any plans for how to address these?

> Sorry missed replying to this. The error implies that duplicate
> opps are reported by the SCP firmware and appear once during probe.

I only see it at boot, but it shows up four times here with the CRD:

[    8.098452] arm-scmi arm-scmi.0.auto: Failed to add opps_by_lvl at 3417600 for NCC - ret:-16
[    8.109647] arm-scmi arm-scmi.0.auto: Failed to add opps_by_lvl at 3417600 for NCC - ret:-16
[    8.128970] arm-scmi arm-scmi.0.auto: Failed to add opps_by_lvl at 3417600 for NCC - ret:-16
[    8.142455] arm-scmi arm-scmi.0.auto: Failed to add opps_by_lvl at 3417600 for NCC - ret:-16

> This particular error can be fixed only by a firmware update and you
> should be able to test it out soon on the CRD first.

Can you explain why this can only be fixed by a firmware update? Why
can't we suppress these warnings as well, like we did for the other
warnings related to the duplicate entries?

IIUC the firmware is not really broken, but rather describes a feature
that Linux does not (yet) support, right?

Johan

