Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D55ACCD3427
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 May 2026 22:10:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=55bVZsrPzezb0A8o66C22lV472PRvBfoDwL9nVOzQ44=; b=xTQTRD5WE2IIXc71NNwp0nr3Nt
	OWGmSwB0GHHbopDFnFbiW3NFXLxxLJCKyUyhZprsdApduWsMvLYeydKWmQ0BTJOmHitrrUpYa+oyc
	eSTbHysa2IIiZAtVK+r4s/SvNjye/bTo7C/nz32Mv8GGVWo0KiG5J+H78A3KHVPrBTA6tUxc+kLF1
	JCH+G5vOZDmvnl7EEhJTI+hBuWw8K802BlH0z6+/stFXWEtxvzOiDlIneKqyk6HOW2+VzNddqIonw
	L4UCn85ljqmTu+E1MDn5UG922fkr96kx/+Hj4vFqed+0NNrWgPR5fIh8H6M6JAEPf2dCxD1ax6gHb
	2JX2ZPzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKNxo-000000001Zy-2yS8;
	Tue, 05 May 2026 22:10:00 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKNxn-000000001ZL-0fsi
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 May 2026 22:10:00 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8BC3A1A9A;
	Tue,  5 May 2026 15:09:51 -0700 (PDT)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7FEFA3F763;
	Tue,  5 May 2026 15:09:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1778018996; bh=wngIzFQY61LFVz8abOPGp4EbGemyax42mCgJV6p6iPc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=We36GZ8MM/yfvHjkDwIuTLTWBu69Uu4K483k5nWZL7vMfmQ4YB3opU2gB0AvBR5d6
	 NN4zIXVRJbTrS6+tKe/DoqCZiPBAsO1U8hnECuaDXL8f/wf8hC1ig3gcbooPpCFnIe
	 n+DzMrjBVVl0hLAGiSJ9GiAfUunk0ZEi/NDbqseY=
Date: Tue, 5 May 2026 23:09:47 +0100
From: Cristian Marussi <cristian.marussi@arm.com>
To: Philip Radford <philip.radford@arm.com>
Cc: Cristian Marussi <cristian.marussi@arm.com>,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org, linux-pm@vger.kernel.org,
	sudeep.holla@arm.com, james.quinlan@broadcom.com,
	f.fainelli@gmail.com, vincent.guittot@linaro.org,
	etienne.carriere@st.com, peng.fan@oss.nxp.com, michal.simek@amd.com,
	quic_sibis@quicinc.com, dan.carpenter@linaro.org, d-gole@ti.com,
	souvik.chakravarty@arm.com
Subject: Re: [PATCH v5 09/12] firmware: arm_scmi: add Powercap MAI get/set
 support
Message-ID: <afpqqxId9IkyFIAm@pluto>
References: <20260428090922.346069-1-philip.radford@arm.com>
 <20260428090922.346069-10-philip.radford@arm.com>
 <afpUytkInNKLTB0k@pluto>
 <afpkpUcevUh_Z8kQ@donnerap.manchester.arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <afpkpUcevUh_Z8kQ@donnerap.manchester.arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260505_150959_268091_66CF527A 
X-CRM114-Status: GOOD (  15.32  )
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

On Tue, May 05, 2026 at 10:44:05PM +0100, Philip Radford wrote:
> On Tue, May 05, 2026 at 09:36:26PM +0100, Cristian Marussi wrote:
> > On Tue, Apr 28, 2026 at 10:09:18AM +0100, Philip Radford wrote:
> > > Add support for Power Measurement Averaging Interval (MAI)
> > 
> > Hi,
> > 
> 
> Hi,
> Thanks for the review.
>

Helo,
 
> > > get and set operations to the SCMI powercap protocol driver.
> > > Extends scmi_powercap_info to store MAI configuration and
> > > implement MAI get/set via xfer and optional fast-channel
> > > support.

[snip]

> > > +static int scmi_powercap_xfer_mai_get(const struct scmi_protocol_handle *ph, u32 domain_id,
> > > +				      u32 *mai)
> > 
> > ..bad alignment and till now we try still to stick tpo 80cols in the SCMI
> > stack if it does NOT really hamper readability...
> > 
> 
> I will address this, but I'm quite certain it wasn't flagged by checkpatch.

Oh yes..this is currently a convention we kept in the SCMI subsystem (the
original 80 cols) BUT kernel wise this line length req was relaxed to
100cols a few years ago..so checkoatch will never flag it (not sure if
it is configurable in such regards)...

... so you are excused :P

....anyway maybe Sudeep is fine to relax this...I dont have strong opinions
BUT since all the stack is 80cols at this point...

Thanks,
Cristian

