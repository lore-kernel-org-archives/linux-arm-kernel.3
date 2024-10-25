Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8AAFD0C5FB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Oct 2024 10:31:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bSTCCZ+rMLeLw+nLcyg7NsR8CjKk6ulV/j/ifqvJ6pI=; b=KLBQMI47bKz7KN5uSyfUDikgEt
	7DYYS18N1ZUOi382SupyWULg6xaMTK1vGJH+OZqa/MYDlKsl7XHmjrlYLBpYk0vdVVzhmX2HBGknb
	yTsHL1hEajNaACDJOWJaDBOPgw51wXsMd+09HlKzgpLpqZQYYp+ivwaZMjOHHAjuF4I0EgKOlZCiI
	1WJ2JvYLUSpTGLoGfKEsEt7sWbbzBbHHPAy5XtYC9BaBjbPlic+ODRScfPx+DwB0XPuDIb82b3Gjz
	mYvmz2L9Lu6tnIhP7wBdRekHa8RtmzfoIHZWnCoJ3Vi3EpOLI4jbCL/6NT0pESrkeZbF4BLYS7Mdf
	fcPIe/UA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4Haj-00000003MnI-3d0b;
	Fri, 25 Oct 2024 10:30:49 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4HZ8-00000003MYe-3Klf
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Oct 2024 10:29:12 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AC4B4339;
	Fri, 25 Oct 2024 03:29:39 -0700 (PDT)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0DF593F73B;
	Fri, 25 Oct 2024 03:29:07 -0700 (PDT)
Date: Fri, 25 Oct 2024 11:29:05 +0100
From: Cristian Marussi <cristian.marussi@arm.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Sibi Sankar <quic_sibis@quicinc.com>, Johan Hovold <johan@kernel.org>,
	sudeep.holla@arm.com, cristian.marussi@arm.com,
	ulf.hansson@linaro.org, jassisinghbrar@gmail.com,
	linux-kernel@vger.kernel.org, arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	konradybcio@kernel.org, linux-pm@vger.kernel.org,
	tstrudel@google.com, rafael@kernel.org
Subject: Re: [PATCH V3 0/4] firmware: arm_scmi: Misc Fixes
Message-ID: <Zxty8VaMPrU3fJAN@pluto>
References: <20241007060642.1978049-1-quic_sibis@quicinc.com>
 <ZwfsmqInJlqkQD_3@hovoldconsulting.com>
 <ae5eaef9-301f-7d3f-c973-faa22ae780ee@quicinc.com>
 <ZxkjqEmkBAsC6UkL@hovoldconsulting.com>
 <c8e7420b-a7b4-89cd-1b6e-c1f6693c062d@quicinc.com>
 <ik4dyfbphm7lkeipm2dbr7cmdfxewxd4jtuz2jfnscfwcyo2r4@lrin5hnsqvyd>
 <83b635a7-fc69-7522-d985-810262500cb3@quicinc.com>
 <CAA8EJppx1OmYnfSsMDebRRTbNb3dfAE_MM55T1SpLccP=s_K1A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAA8EJppx1OmYnfSsMDebRRTbNb3dfAE_MM55T1SpLccP=s_K1A@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241025_032910_952187_A4E8DACB 
X-CRM114-Status: GOOD (  43.22  )
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

On Fri, Oct 25, 2024 at 01:11:37PM +0300, Dmitry Baryshkov wrote:
> On Fri, 25 Oct 2024 at 09:46, Sibi Sankar <quic_sibis@quicinc.com> wrote:
> >
> >
> >
> > On 10/25/24 11:44, Dmitry Baryshkov wrote:
> > > On Fri, Oct 25, 2024 at 11:38:36AM +0530, Sibi Sankar wrote:
> > >>
> > >>
> > >> On 10/23/24 21:56, Johan Hovold wrote:
> > >>> On Wed, Oct 23, 2024 at 01:16:47PM +0530, Sibi Sankar wrote:
> > >>>> On 10/10/24 20:32, Johan Hovold wrote:
> > >>>>> On Mon, Oct 07, 2024 at 11:36:38AM +0530, Sibi Sankar wrote:
> > >>>>>> The series addresses the kernel warnings reported by Johan at [1] and are
> > >>>>>> are required to X1E cpufreq device tree changes [2] to land.
> > >>>>>>
> > >>>>>> [1] - https://lore.kernel.org/lkml/ZoQjAWse2YxwyRJv@hovoldconsulting.com/
> > >>>>>> [2] - https://lore.kernel.org/lkml/20240612124056.39230-1-quic_sibis@quicinc.com/
> > >>>>>>
> > >>>>>> The following warnings remain unadressed:
> > >>>>>> arm-scmi arm-scmi.0.auto: Failed to add opps_by_lvl at 3417600 for NCC - ret:-16
> > >>>>>> arm-scmi arm-scmi.0.auto: Failed to add opps_by_lvl at 3417600 for NCC - ret:-16
> > >>>>>
> > >>>>> Are there any plans for how to address these?
> > >>>
> > >>>> Sorry missed replying to this. The error implies that duplicate
> > >>>> opps are reported by the SCP firmware and appear once during probe.
> > >>>
> > >>> I only see it at boot, but it shows up four times here with the CRD:
> > >>
> > >> https://lore.kernel.org/lkml/d54f6851-d479-a136-f747-4c0180904a5e@quicinc.com/
> > >>
> > >> As explained ^^, we see duplicates for max sustainable performance twice
> > >> for each domain.
> > >
> > > If existing products were shipped with the firmware that lists single
> > > freq twice, please filter the frequencies like qcom-cpufreq-hw does.
> >
> > That was a qualcomm specific driver and hence we could do such
> > kind of filtering. This however is the generic scmi perf protocol
> > and it's not something we should ever consider introducing :/
> 
> This depends on the maintainer's discretion.
> 
> >
> > >
> > >>
> > >>>
> > >>> [    8.098452] arm-scmi arm-scmi.0.auto: Failed to add opps_by_lvl at 3417600 for NCC - ret:-16
> > >>> [    8.109647] arm-scmi arm-scmi.0.auto: Failed to add opps_by_lvl at 3417600 for NCC - ret:-16
> > >>> [    8.128970] arm-scmi arm-scmi.0.auto: Failed to add opps_by_lvl at 3417600 for NCC - ret:-16
> > >>> [    8.142455] arm-scmi arm-scmi.0.auto: Failed to add opps_by_lvl at 3417600 for NCC - ret:-16
> > >>>
> > >>>> This particular error can be fixed only by a firmware update and you
> > >>>> should be able to test it out soon on the CRD first.
> > >>>
> > >>> Can you explain why this can only be fixed by a firmware update? Why
> > >>> can't we suppress these warnings as well, like we did for the other
> > >>> warnings related to the duplicate entries?
> > >>>
> > >>> IIUC the firmware is not really broken, but rather describes a feature
> > >>> that Linux does not (yet) support, right?
> > >>
> > >> We keep saying it's a buggy firmware because the SCP firmware reports
> > >> identical perf and power levels for the additional two opps and the
> > >> kernel has no way of treating it otherwise and we shouldn't suppress
> > >> them. Out of the two duplicate opps reported one is a artifact from how
> > >> Qualcomm usually show a transition to boost frequencies. The second opp
> > >> which you say is a feature should be treated as a boost opp i.e. one
> > >> core can run at max at a lower power when other cores are at idle but
> > >> we can start marking them as such once they start advertising their
> > >> correct power requirements. So I maintain that this is the best we
> > >> can do and need a firmware update for us to address anything more.
> > >
> > > Will existing shipping products get these firmware updates?
> >
> > They are sure to trickle out but I guess it's upto the oem
> > to decide if they do want to pick these up like some of the
> > other firmware updates being tested only on CRD. Not sure why
> > warnings duplicates should block cpufreq from landing for x1e
> > but if that's what the community wants I can drop reposting
> > this series!
> 
> No, the community definitely wants to have cpufreq for X1E.
> But at the same time some reviewers prefer to have a warning-free boot
> if those warnings can't be really fixed. I don't have such a strict
> position, but I'd prefer to see those messages at dev_info or dev_dbg
> level.

I think dev_info could be an option from the SCMI perspective (as per my
other mail), the important thing in these regards is to NOT go
completely silent against fw anomalies...to avoid the the risk of being
silently ignored .... I'll see what Sudeep thinks about...

Thanks,
Cristian

