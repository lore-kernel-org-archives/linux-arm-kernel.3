Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F8B4D0C614
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Oct 2024 14:01:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=njks7gt1uvNiJzzMBoG6Fh+NBi9QOWdJ8LdzlmLkWO0=; b=Vwioq/EfL9Tc8Tr4CPln7QKOj3
	GmtlGEu+bK4vYQE6WOan7hOmBRe5w5O/V2q2ne34bu3cNc5QTOr8aqlu++qlA7CwYUjM0Lfc3cwLQ
	xlpqZ3Q86JoCpL4H8DXNB0sLgRqmODasu8e2xInbmItHGdpQcITK4Z0YRt18toauOK/9qya8T0cX1
	PUsLvtqmt29VSKU2jHKFo8u3CJjwTosq0mkm8Ymqq8xyuHD3Kt9XQ6s3PhbN7L4/i8x+FdsooKovk
	1jZeC6Xkv5+hqTfnzlBNl5l2ZBTmD5rz23pZ/GL6vX2tL2vgQkT3KwBfPqrIuZbGutZBqJaf0zm91
	P75PCaiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4Ks8-00000003uqu-2cuQ;
	Fri, 25 Oct 2024 14:01:00 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4KgB-00000003sCf-3L6t
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Oct 2024 13:48:41 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E8BBD339;
	Fri, 25 Oct 2024 06:49:08 -0700 (PDT)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3E1D63F71E;
	Fri, 25 Oct 2024 06:48:37 -0700 (PDT)
Date: Fri, 25 Oct 2024 14:48:26 +0100
From: Cristian Marussi <cristian.marussi@arm.com>
To: Johan Hovold <johan@kernel.org>
Cc: Cristian Marussi <cristian.marussi@arm.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Sibi Sankar <quic_sibis@quicinc.com>, sudeep.holla@arm.com,
	ulf.hansson@linaro.org, jassisinghbrar@gmail.com,
	linux-kernel@vger.kernel.org, arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	konradybcio@kernel.org, linux-pm@vger.kernel.org,
	tstrudel@google.com, rafael@kernel.org
Subject: Re: [PATCH V3 0/4] firmware: arm_scmi: Misc Fixes
Message-ID: <ZxuhqkDoWF8IYQxL@pluto>
References: <20241007060642.1978049-1-quic_sibis@quicinc.com>
 <ZwfsmqInJlqkQD_3@hovoldconsulting.com>
 <ae5eaef9-301f-7d3f-c973-faa22ae780ee@quicinc.com>
 <ZxkjqEmkBAsC6UkL@hovoldconsulting.com>
 <c8e7420b-a7b4-89cd-1b6e-c1f6693c062d@quicinc.com>
 <ik4dyfbphm7lkeipm2dbr7cmdfxewxd4jtuz2jfnscfwcyo2r4@lrin5hnsqvyd>
 <83b635a7-fc69-7522-d985-810262500cb3@quicinc.com>
 <CAA8EJppx1OmYnfSsMDebRRTbNb3dfAE_MM55T1SpLccP=s_K1A@mail.gmail.com>
 <Zxty8VaMPrU3fJAN@pluto>
 <ZxueBWB9nJ9Mt7bW@hovoldconsulting.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZxueBWB9nJ9Mt7bW@hovoldconsulting.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241025_064839_895516_05146CC4 
X-CRM114-Status: GOOD (  13.67  )
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

On Fri, Oct 25, 2024 at 03:32:53PM +0200, Johan Hovold wrote:
> On Fri, Oct 25, 2024 at 11:29:05AM +0100, Cristian Marussi wrote:
> 
> > > > >>> [    8.098452] arm-scmi arm-scmi.0.auto: Failed to add opps_by_lvl at 3417600 for NCC - ret:-16
> > > > >>> [    8.109647] arm-scmi arm-scmi.0.auto: Failed to add opps_by_lvl at 3417600 for NCC - ret:-16
> > > > >>> [    8.128970] arm-scmi arm-scmi.0.auto: Failed to add opps_by_lvl at 3417600 for NCC - ret:-16
> > > > >>> [    8.142455] arm-scmi arm-scmi.0.auto: Failed to add opps_by_lvl at 3417600 for NCC - ret:-16
> 
> > I think dev_info could be an option from the SCMI perspective (as per my
> > other mail), the important thing in these regards is to NOT go
> > completely silent against fw anomalies...to avoid the the risk of being
> > silently ignored .... I'll see what Sudeep thinks about...
> 
> I agree.
> 
> But could the error handling be improved to look less scary for an end
> user by saying something about duplicate entries being ignored instead
> perhaps?
> 
> Printing something at info level and with a FW_BUG ("[Firmware Bug]: ")
> prefix as was done here:
> 
> 	https://lore.kernel.org/all/20230414084619.31524-1-johan+linaro@kernel.org/
> 
> should make it clear that this is not something for end users to worry
> (too much) about.

Sure...and thanks for the suggestion....I will cook something up around
this....

(I am probably too used to try to scary the FW guys that I forgot there
are also innocent bystanders like final users :P)

Thanks,
Cristian

