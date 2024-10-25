Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9581D0C60F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Oct 2024 13:46:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R61aSUTzE+Qy2XnBAzNIig8tXUffFZcbRx9lM7tLsRQ=; b=pGNbHKho7XU+XWAezUCN6sxBrF
	RwCV9jz1W8C3lorRfcUeu6QLdnyBcw9m5ejxs+VlNIGz3Qb7lXzkzaOeAGTVflRvOHGk7vEb58a8d
	uWU5OmmdQcQIKWBPg+60o2hLsz6agGiY9oIHzFF4zMBIW/oR7CU3229cIJ4EmKq9lfZRliGWKfHU/
	ZS3OSCmO1W+PEof2MY2fvqPuReyJnEYGqSDLxPMKT6PqG1J7cmXZ9LKWryjnBNmNYm0xCWx3gwoSY
	U8gHp99uzYsu44RvE8SiFA/WOvF7wKBwI+OL1Dms4bE4wH0eUulZg1qSwAcGO/Y+mabTKWXbJUgyW
	sWHywLjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4Ke1-00000003rbJ-2AYT;
	Fri, 25 Oct 2024 13:46:25 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4KHe-00000003o4o-0ML0
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Oct 2024 13:23:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 888CF5C544D;
	Fri, 25 Oct 2024 13:22:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58A7FC4CEC3;
	Fri, 25 Oct 2024 13:23:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729862596;
	bh=YY9UvlcOqBf5DRsarl1HoVwp1U7xCRDNZBJwjTC1Psg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qigbiZLFnX+GIepxzR9wLDhzmOecNscZEECPyjzV+3nM36PY8WGNDPsC4fKXXNXsf
	 3LF8Pz3nVPqYCNCVoPbtZOQyJz+bdQIdCNefPKmWOm94etYHW3g7KkwONtUsX4w6a8
	 9FMIfFuh8m4hU0+jrMdOPH5xxAN6BH2IGYIFv48Jmky7YZjW7pa12i7xi+KCmZ30vM
	 j3xd+C+G4utBRKx/whm+9uturi9kbBrBIGrjKV6HCO5L5WJfECzY3MaVnPK5D3nSVE
	 /KKYYuKZHiWhPwmVi6RA2OOLHSIH0t989wi66XRA1vgHkEc4p7T6u78g7c5CJnr1NB
	 nUiHCAnuhdCMg==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1t4KHu-0000000035n-0L7h;
	Fri, 25 Oct 2024 15:23:34 +0200
Date: Fri, 25 Oct 2024 15:23:34 +0200
From: Johan Hovold <johan@kernel.org>
To: Sibi Sankar <quic_sibis@quicinc.com>
Cc: sudeep.holla@arm.com, cristian.marussi@arm.com, ulf.hansson@linaro.org,
	jassisinghbrar@gmail.com, linux-kernel@vger.kernel.org,
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org, konradybcio@kernel.org,
	linux-pm@vger.kernel.org, tstrudel@google.com, rafael@kernel.org
Subject: Re: [PATCH V3 0/4] firmware: arm_scmi: Misc Fixes
Message-ID: <Zxub1sn5usXTayPV@hovoldconsulting.com>
References: <20241007060642.1978049-1-quic_sibis@quicinc.com>
 <ZwfsmqInJlqkQD_3@hovoldconsulting.com>
 <ae5eaef9-301f-7d3f-c973-faa22ae780ee@quicinc.com>
 <ZxkjqEmkBAsC6UkL@hovoldconsulting.com>
 <c8e7420b-a7b4-89cd-1b6e-c1f6693c062d@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c8e7420b-a7b4-89cd-1b6e-c1f6693c062d@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241025_062318_241650_EA018C16 
X-CRM114-Status: GOOD (  25.24  )
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

On Fri, Oct 25, 2024 at 11:38:36AM +0530, Sibi Sankar wrote:
> On 10/23/24 21:56, Johan Hovold wrote:
> > On Wed, Oct 23, 2024 at 01:16:47PM +0530, Sibi Sankar wrote:
> >> On 10/10/24 20:32, Johan Hovold wrote:
> >>> On Mon, Oct 07, 2024 at 11:36:38AM +0530, Sibi Sankar wrote:
> >>>> The series addresses the kernel warnings reported by Johan at [1] and are
> >>>> are required to X1E cpufreq device tree changes [2] to land.
> >>>>
> >>>> [1] - https://lore.kernel.org/lkml/ZoQjAWse2YxwyRJv@hovoldconsulting.com/
> >>>> [2] - https://lore.kernel.org/lkml/20240612124056.39230-1-quic_sibis@quicinc.com/
> >>>>
> >>>> The following warnings remain unadressed:
> >>>> arm-scmi arm-scmi.0.auto: Failed to add opps_by_lvl at 3417600 for NCC - ret:-16
> >>>> arm-scmi arm-scmi.0.auto: Failed to add opps_by_lvl at 3417600 for NCC - ret:-16
> >>>
> >>> Are there any plans for how to address these?

> >> This particular error can be fixed only by a firmware update and you
> >> should be able to test it out soon on the CRD first.
> > 
> > Can you explain why this can only be fixed by a firmware update? Why
> > can't we suppress these warnings as well, like we did for the other
> > warnings related to the duplicate entries?
> > 
> > IIUC the firmware is not really broken, but rather describes a feature
> > that Linux does not (yet) support, right?
> 
> We keep saying it's a buggy firmware because the SCP firmware reports
> identical perf and power levels for the additional two opps and the
> kernel has no way of treating it otherwise and we shouldn't suppress
> them. Out of the two duplicate opps reported one is a artifact from how
> Qualcomm usually show a transition to boost frequencies. The second opp
> which you say is a feature should be treated as a boost opp i.e. one
> core can run at max at a lower power when other cores are at idle but
> we can start marking them as such once they start advertising their
> correct power requirements. So I maintain that this is the best we
> can do and need a firmware update for us to address anything more.

Fair enough, but if you end up respinning the series, please say
something about this in the cover letter so that we know why those
warnings are (rightly) left in place.

Johan

