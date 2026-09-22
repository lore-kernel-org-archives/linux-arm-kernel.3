Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36354C98302
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 17:32:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4UHOpcSqjjWJpu1pvY9X0OQD7LAKUy71PpdLDexaDwQ=; b=cPoXK5PfHl2gw5PnfeU2gpjq9v
	9Ul+6ION9g0loU+glaWJY5ZLQN1SQzUGOYbm8zFW9Cq7QLmLdSzVwmCUDmk9aCvbjNz+tKQbL4m1M
	w/bAzeI5SdkeVxH56L2LjIcL0j7z3iVYJ/lmR4O79lVPHOhUUHcreFRuUi7xdBtxB/HJZ3GnaJHdk
	NTx1NuQ+QSBxUhKOpRW4OmrwiHbtLZpLaPR4ZJQ/RK99oJypvR+vad4i9p+ivuYX1a7/wPi0NF/Me
	kUCPOAnD9pra+LGZlvR0Iv+t072+mt7e+IBST1/E0EyiaK01CzhVpyYPdJIDF5Oslv+ALwpsvh4qQ
	Tu2Om8FQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x94Lr-00000006Cmg-2r44;
	Tue, 22 Sep 2026 17:32:19 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x94Lp-00000006Ckz-2E9C
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Sep 2026 17:32:18 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F2AA11576;
	Tue, 22 Sep 2026 10:32:09 -0700 (PDT)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2098E3F86C;
	Tue, 22 Sep 2026 10:32:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790098333; bh=i8rmnA+nlrHeWzx7kNMPhnc4iJcDtyjqy8ekHSFBfJY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hM/SET1P+KLwfCcF/EmK7kBGpnTtJ6hib/jI+FsscMVotyP6SnC2oSDprj3ksYReb
	 wWYK8dWDStfaOmXBNeCfNteQ1qqOXodtyrT6riUez3skCE13fAFlmdYDlib7zf8Bq4
	 PBWsxMfEsVHadBHn2P0w6yO1bCNyHnz6bpbKWWfo=
Date: Tue, 22 Sep 2026 18:32:00 +0100
From: Cristian Marussi <cristian.marussi@arm.com>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: Cristian Marussi <cristian.marussi@arm.com>,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org, linux-doc@vger.kernel.org,
	sudeep.holla@kernel.org, james.quinlan@broadcom.com,
	f.fainelli@gmail.com, vincent.guittot@linaro.org,
	etienne.carriere@st.com, peng.fan@oss.nxp.com, michal.simek@amd.com,
	d-gole@ti.com, jic23@kernel.org, elif.topuz@arm.com,
	lukasz.luba@arm.com, philip.radford@arm.com,
	souvik.chakravarty@arm.com, leitao@kernel.org, kas@kernel.org,
	puranjay@kernel.org, usama.arif@linux.dev, kernel-team@meta.com,
	Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
Subject: Re: [PATCH v12 01/25] firmware: arm_scmi: Add new SCMIv4.0 error
 codes definitions
Message-ID: <arK7kLlrg491EsMf@pluto>
References: <20260920091928.2014972-1-cristian.marussi@arm.com>
 <20260920091928.2014972-2-cristian.marussi@arm.com>
 <88138b8e-42cf-405f-a5ee-519271dbd4f4@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <88138b8e-42cf-405f-a5ee-519271dbd4f4@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260922_103217_643248_42766F87 
X-CRM114-Status: GOOD (  23.67  )
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

On Tue, Sep 22, 2026 at 02:20:20PM +0200, David Hildenbrand (Arm) wrote:
> On 9/20/26 11:19, Cristian Marussi wrote:
> > SCMIv4.0 introduces a couple of new possible protocol error codes: add
> > the needed definitions and mappings to Linux error values.

Hi David,

thanks for having a look...

> > 
> > Reviewed-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
> > Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
> > ---
> > v4 --> v5
> >  - map SCMI_ERR_IN_USE to EBUSY as natural
> > ---
> >  drivers/firmware/arm_scmi/common.h | 4 ++++
> >  1 file changed, 4 insertions(+)
> > 
> > diff --git a/drivers/firmware/arm_scmi/common.h b/drivers/firmware/arm_scmi/common.h
> > index fe8c22cfb9f7..6f89ba96493d 100644
> > --- a/drivers/firmware/arm_scmi/common.h
> > +++ b/drivers/firmware/arm_scmi/common.h
> > @@ -48,6 +48,8 @@ enum scmi_error_codes {
> >  	SCMI_ERR_GENERIC = -8,	/* Generic Error */
> >  	SCMI_ERR_HARDWARE = -9,	/* Hardware Error */
> >  	SCMI_ERR_PROTOCOL = -10,/* Protocol Error */
> > +	SCMI_ERR_IN_USE = -11,  /* In Use Error */
> > +	SCMI_ERR_PARTIAL = -12, /* Partial Error */
> >  };
> >  
> >  static const int scmi_linux_errmap[] = {
> > @@ -63,6 +65,8 @@ static const int scmi_linux_errmap[] = {
> >  	-EIO,			/* SCMI_ERR_GENERIC */
> >  	-EREMOTEIO,		/* SCMI_ERR_HARDWARE */
> >  	-EPROTO,		/* SCMI_ERR_PROTOCOL */
> > +	-EBUSY,			/* SCMI_ERR_IN_USE */
> > +	-EINVAL,		/* SCMI_ERR_PARTIAL */
> >  };
> >  
> >  static inline int scmi_to_linux_errno(int errno)
> 
> So far we had unique mappings. Now EBUSY and EINVAL could be due to two SCMI_ERR
> each.
> 
> I assume in the later usage there is no need to distinguish them for now? Might
> be worth stating that in the patch description.

Mmmm....indeed this was added to the spec last minute and while
ERR_IN_USE (probably) does NOT necessarily need special treatment (so it
can share -EBUSY), PARTIAL_ERROR must definitely be handled specially ...

Good catch...

I am indeed already handling properly the side-effects of PARTIAL-ERROR
but I will have to properly handle the status code itself in READING_COMPLETE
and in the NOTIFICATION....as a consequence it needs to be distinguishable...

Problem is...there are NOT so many not-already-used error-codes that could
signify such an ambiguos error condition, by the spec:

"The platform returns PARTIAL_ERROR to indicate that some of the telemetry
data could not be collected."

I will use -EBADMSG (but any other advice is welcome) and fix its usage where
needed for DRESP and NOTIF in v13.

Thanks,
Cristian


