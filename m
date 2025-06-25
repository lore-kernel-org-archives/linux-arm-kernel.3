Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58032C7EE3A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Jun 2025 18:29:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZnBAu8jYfIh7mzx45795/R+Wht7pA4IEUQRmMp0A5Y8=; b=Lo3vmq68FXziXvedXa1qgLtVcc
	1z14cNj+hznmD18zodKxr0mHpzFOz5D7dR09u4Y27U4VPvlP+oYHvOUwJRS0YVxdTjuqVcydpabAX
	D+l+detJr+vnVG8SsiWKPlyOvqEu0GT9zcpo7T/sJP5o2J8TjMT1u++llql5pTjTGrE+iXPtg9kHb
	+viPx8LXuvzA+8gw4YT+Hw/UibZHEgoPoKOK1zKlq5ueHn05yvaLX67S12V97oJQ0iBxdRCce9YGQ
	aXeHaR1nZ5tlBieraXak7Z34i0tBc0JUIfzshbsIeDszlW3DGx8FnAZZF8Od1HLlQKx8xoMBtEkW4
	xI2IFPkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUUre-00000009ZG4-1yHW;
	Wed, 25 Jun 2025 18:28:54 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUQqy-00000008uwR-3ptp
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Jun 2025 14:11:58 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C47A1106F;
	Wed, 25 Jun 2025 07:11:37 -0700 (PDT)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 358D23F66E;
	Wed, 25 Jun 2025 07:11:53 -0700 (PDT)
Date: Wed, 25 Jun 2025 15:11:50 +0100
From: Cristian Marussi <cristian.marussi@arm.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Cristian Marussi <cristian.marussi@arm.com>,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org, sudeep.holla@arm.com,
	james.quinlan@broadcom.com, f.fainelli@gmail.com,
	vincent.guittot@linaro.org, etienne.carriere@st.com,
	peng.fan@oss.nxp.com, michal.simek@amd.com, quic_sibis@quicinc.com,
	d-gole@ti.com, souvik.chakravarty@arm.com
Subject: Re: [RFC PATCH 4/7] firmware: arm_scmi: Add System Telemetry driver
Message-ID: <aFwDprdWI0mtglwe@pluto>
References: <20250620192813.2463367-1-cristian.marussi@arm.com>
 <20250620192813.2463367-5-cristian.marussi@arm.com>
 <f2c0a0d9-6a1b-42c7-a180-e04e357dbbb5@suswa.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f2c0a0d9-6a1b-42c7-a180-e04e357dbbb5@suswa.mountain>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250625_071157_113208_A074CA55 
X-CRM114-Status: GOOD (  16.43  )
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

On Sat, Jun 21, 2025 at 12:27:03AM +0300, Dan Carpenter wrote:
> On Fri, Jun 20, 2025 at 08:28:10PM +0100, Cristian Marussi wrote:
> > +//TODO Review available interval show
> > +#define BUF_SZ	1024
> > +static inline ssize_t
> > +__available_update_show(char *buf,
> > +			const struct scmi_telemetry_update_interval *intervals)
> > +{
> > +	int len = 0, num_intervals = intervals->num;
> > +	char available[BUF_SZ];
> > +
> > +	for (int i = 0; i < num_intervals; i++) {
> > +		len += scnprintf(available + len, BUF_SZ - len, "%u ",
> > +				 intervals->update_intervals[i]);
> > +	}
> > +
> > +	available[len - 1] = '\0';
> 
> No need.  scnprintf() will already have put a NUL terminator there.
> Unless num_intervals <= 0 in which case this will corrupt memory.
> 

Yes, all of this routine has to be really reworked to avoid on the stack
allocation too...

> > +
> > +	return sysfs_emit(buf, "%s\n", available);
> > +}
> 
> [ snip ]
> 
> > +static int scmi_telemetry_groups_initialize(struct device *dev,
> > +					    struct scmi_tlm_instance *ti)
> > +{
> > +	int ret;
> > +
> > +	if (ti->info->num_groups == 0)
> > +		return 0;
> > +
> > +	ret = scmi_telemetry_dev_register(&ti->groups_dev, &ti->dev, "groups");
> > +	if (ret)
> > +		return ret;
> > +
> > +	for (int i = 0; i < ti->info->num_groups; i++) {
> > +		const struct scmi_telemetry_group *grp = &ti->info->des_groups[i];
> > +		struct scmi_tlm_grp_dev *gdev;
> > +		char name[16];
> > +
> > +		gdev = devm_kzalloc(dev, sizeof(*gdev), GFP_KERNEL);
> > +		if (!gdev) {
> > +			ret = -ENOMEM;
> > +			goto err;
> > +		}
> > +
> > +		gdev->tsp = ti->tsp;
> > +		gdev->grp = grp;
> > +		gdev->dev.groups = scmi_grp_groups;
> > +
> > +		snprintf(name, 8, "%d", grp->id);
> 
> s/8/sizeof(name)/?

indeed...

> 
> > +		ret = scmi_telemetry_dev_register(&gdev->dev,
> > +						  &ti->groups_dev, name);
> > +		if (ret)
> > +			goto err;
> > +
> > +		if (ti->info->per_group_config_support) {
> > +			sysfs_add_file_to_group(&gdev->dev.kobj,
> > +						&dev_attr_grp_current_update.attr,
> > +						NULL);
> > +			sysfs_add_file_to_group(&gdev->dev.kobj,
> > +						&dev_attr_grp_intervals_discrete.attr,
> > +						NULL);
> > +			sysfs_add_file_to_group(&gdev->dev.kobj,
> > +						&dev_attr_grp_available_intervals.attr,
> > +						NULL);
> > +		}
> > +	}
> > +
> > +	dev_info(dev, "Found %d Telemetry GROUPS resources.\n",
> > +		 ti->info->num_groups);
> > +
> > +	return 0;
> > +
> > +err:
> > +	scmi_telemetry_dev_unregister(&ti->groups_dev);
> > +
> > +	return ret;
> > +}
> > +
> > +static int scmi_telemetry_des_initialize(struct device *dev,
> > +					 struct scmi_tlm_instance *ti)
> > +{
> > +	int ret;
> > +
> > +	ret = scmi_telemetry_dev_register(&ti->des_dev, &ti->dev, "des");
> > +	if (ret)
> > +		return ret;
> > +
> > +	for (int i = 0; i < ti->info->num_de; i++) {
> > +		const struct scmi_telemetry_de *de = ti->info->des[i];
> > +		struct scmi_tlm_de_dev *tdev;
> > +		char name[16];
> > +
> > +		tdev = devm_kzalloc(dev, sizeof(*tdev), GFP_KERNEL);
> > +		if (!tdev) {
> > +			ret = -ENOMEM;
> > +			goto err;
> > +		}
> > +
> > +		tdev->tsp = ti->tsp;
> > +		tdev->de = de;
> > +		tdev->dev.groups = scmi_des_groups;
> > +
> > +		/*XXX What about of ID/name digits-length used ? */
> > +		snprintf(name, 8, "0x%04X", de->id);
> 
> s/8/sizeof(name)/?
> 

yes.

> regards,
> dan carpenter
>

Thanks,
Cristian

