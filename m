Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8619CCD3436
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 May 2026 10:51:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nu/5wT5jlnwzrwMmx9CCzWySzYFarqeUlZxvck6ibMA=; b=aTUMjRt+eX1D8HMBUshGAmScfk
	MMBIwSQP7qbcmCkeVzNsMRYzALl9RY5s/+Hf+x0KezbxyV9Qy3tC14Nb6j5IJJGHLN/DLKDGIVato
	N8n9VAeTD1wn/MnycxDzVMIOasU06fv01/RE55bgPKpLEz7drQHqmnNw9U5HWm6KExVCZvDyPQgDR
	DBwQr1NAciC6KiE1/l5BrfSagLaGtTctPNnGnZc0PCeywgnjzzcuJOA8JyVzpvw4wZGvBZaXtmEwg
	QP+RuXyNQW3DjIs31HXqmw8l2pYxJgWpWafLVDC8WCkJ2ucuN3PXxerKhPrQ1SyYxjOV8n3LtwSiy
	y5LUERRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKZqz-00000000Xpw-04R0;
	Wed, 06 May 2026 10:51:45 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKZqx-00000000XpY-4BwC
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 May 2026 10:51:44 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 867413319;
	Wed,  6 May 2026 03:51:37 -0700 (PDT)
Received: from donnerap.manchester.arm.com (donnerap.manchester.arm.com [10.33.8.81])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 49EA53F836;
	Wed,  6 May 2026 03:51:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1778064702; bh=iYNXb++hIJ9OfRQc9+FWnMLqhZrlCDWvv412uOnwE/g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CLbSYu+sRwtJr3t9K16SL9rXHW8Z+pbVRQ+RJhmov6xkSlmuLFbW/FfcaeqvTpJ+V
	 p9B3F82aA9Gq8jU87onEpr6LkVcoe/pE5Co5Z+plDH5fLGRiM2Kvox/A4beffwA4Rq
	 QCTUJyzR9QEdd3QKEfZIbyYQdzHUy8dROaLjdR3E=
Date: Wed, 6 May 2026 11:51:37 +0100
From: Philip Radford <philip.radford@arm.com>
To: Cristian Marussi <cristian.marussi@arm.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org, linux-pm@vger.kernel.org,
	sudeep.holla@arm.com, james.quinlan@broadcom.com,
	f.fainelli@gmail.com, vincent.guittot@linaro.org,
	etienne.carriere@st.com, peng.fan@oss.nxp.com, michal.simek@amd.com,
	quic_sibis@quicinc.com, dan.carpenter@linaro.org, d-gole@ti.com,
	souvik.chakravarty@arm.com
Subject: Re: [PATCH v5 12/12] powercap: arm_scmi: Synthetic zone
 enable/disable
Message-ID: <afsdOZ690p_vn9sq@donnerap.manchester.arm.com>
References: <20260428090922.346069-1-philip.radford@arm.com>
 <20260428090922.346069-13-philip.radford@arm.com>
 <afpu-Wf01J3l0gAu@pluto>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <afpu-Wf01J3l0gAu@pluto>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260506_035144_121264_47CDFA67 
X-CRM114-Status: GOOD (  34.81  )
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

On Tue, May 05, 2026 at 11:28:09PM +0100, Cristian Marussi wrote:
> On Tue, Apr 28, 2026 at 10:09:21AM +0100, Philip Radford wrote:
> > Add functionality to disable and enable the synthetic zone which
> > also affects the immediate children of the synthetic zone by applying
> > the same command to them.
> > 

Hi,

> > Signed-off-by: Philip Radford <philip.radford@arm.com>
> > ---
> >  drivers/powercap/arm_scmi_powercap.c | 81 ++++++++++++++++++++++++++++
> >  1 file changed, 81 insertions(+)
> > 
> > diff --git a/drivers/powercap/arm_scmi_powercap.c b/drivers/powercap/arm_scmi_powercap.c
> > index 81b5214acda4..1ed2949b06cb 100644
> > --- a/drivers/powercap/arm_scmi_powercap.c
> > +++ b/drivers/powercap/arm_scmi_powercap.c
> > @@ -270,6 +270,85 @@ static int instance_root_release(struct powercap_zone *pz)
> >  	return 0;
> >  }
> >  
> > +static int instance_root_set_enable_state(struct powercap_zone *pz, bool enable)
> > +{
> > +	struct scmi_powercap_zone *root;
> > +	struct scmi_powercap_root *pr;
> > +	struct scmi_powercap_zone *child;
> 
> ...child and root on the same line of declarations...
> 

Noted.

> > +	int ret, first_err = 0;
> > +
> > +	if (!pz)
> > +		return -EINVAL;
> > +
> > +	root = to_scmi_powercap_zone(pz);
> > +	pr = container_of(root, struct scmi_powercap_root, instance_root);
> 
> ...another user of you new macro !
> 

:)

> > +
> > +	list_for_each_entry(child, &pr->registered_zones[0], node) {
> > +		if (child == &pr->instance_root)
> > +			continue;
> > +
> > +		if (child->info->parent_id != SCMI_POWERCAP_ROOT_ZONE_ID)
> > +			continue;
> > +
> > +		if (!child->info->cpli[0].cap_config)
> > +			continue;
> > +
> > +		ret = powercap_ops->cap_enable_set(child->ph, child->info->id, enable);
> > +
> > +		if (ret && !first_err) {
> 
> ...mmm what is the logic here ? why not bailing out on any error ?
> 

Good point. I was initially trying to prevent one error stopping everything without
checking the other children, but even as I'm writing this out I can see the fault in
that logic.

> > +			first_err = ret;
> > +			dev_err(child->dev, "failed to %s zone %s: %d\n",
> > +				enable ? "enable" : "disable",
> > +				child->info->name, ret);
> > +		}
> > +	}
> > +
> > +	return first_err;
> 
> ...especially if you anyway fails globally on any error....
> ..I am not completely sure bit given that youare operating on a
> synthetic zone that you enable as a whole, while acting on its children
> in the backstage...I would say that if any enable/disable fails on a
> chidlren you should revert the enable status of the children thate were
> succesffull and report the error...I mean the state of top synthatic
> zones AND the states of the children MUST remain consistent...
> ...it CANNOT be that some chidlren fails, some succeeds and you report
> an error..it must be all or nothing...
> ...example..top syntethic zone is OFF if all children were successfully
> disabled...on a failure with one of the children you shoudl revert the
> already successfully set children and report the global error...
> 

Point taken, this needs reworking.

> > +}
> > +
> > +static int instance_root_set_enable(struct powercap_zone *pz, bool mode)
> > +{
> > +	return instance_root_set_enable_state(pz, mode);
> > +}
> > +
> > +static int instance_root_get_enable(struct powercap_zone *pz, bool *mode)
> > +{
> > +	struct scmi_powercap_zone *root;
> > +	struct scmi_powercap_root *pr;
> > +	struct scmi_powercap_zone *child;
> > +	bool enabled;
> > +	int ret;
> > +
> > +	if (!pz || !mode)
> > +		return -EINVAL;
> > +
> > +	root = to_scmi_powercap_zone(pz);
> > +	pr = container_of(root, struct scmi_powercap_root, instance_root);
> > +
> > +	*mode = true;
> > +
> > +	list_for_each_entry(child, &pr->registered_zones[0], node) {
> 
> mmm...what is the point here of scanning the children to GET the
> state...you should report the top syntethic zone state right ?
> You could have disable children directly...that wont be reflected in the
> Linux powercap hiearcrhy right ?
> I mean should you NOT simply return the stae of the top syntethic zone
> which is should have saved in the previous state_set operation above ?
> 
> I think that anyway if you disable a zone...any zone...ONLY that zone is
> marked as disable in Lnux powercap ... am I right ? 
> 
> Then probably our SCMI fw will do much more on all the children..
> 

Good point, I'll simplify it to report a saved state for the synthetic root.

Regards,
Phil

