Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D028E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Dec 2024 17:10:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=27eSDF5ZQPbmljHUPcteK+t67TAUxV8BwmK5/uK+HAY=; b=yPXl9il7TYWxjivLeTbdNYarI+
	ekaAjsJMQcnjGEVC4ltijFxAdlEIS6VTLF7vZlrUP3ieYDkxd2qWvFpd9N1C0hYEYz+Bq+KBAMvfM
	HMdkg/I1MH7hvRGiG+Y/ZWP6RVWWCCE2poJJu3929O1C5Vx5aIkg7ax34L1B4kybXZWy/LZrAQkzJ
	MlXCS4vCtutj8ZnHZ1jKUHUwFnt1XAFJJujAJz9yrFTKhmjbJXrVXEeMsHV/J9RISm2EZY4Y5q/Yi
	HC12LI5CqdqZqzEX0mBl1R0lknrY8/XmdEMUjejVdpPrRprrDp8c2iDauuDzpeWSKCBBbxD9lgrJ3
	C89PofsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNEbP-0000000AirT-0DjY;
	Mon, 16 Dec 2024 17:09:51 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNDe3-0000000AW8I-3MBW
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Dec 2024 16:08:33 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8367E1063;
	Mon, 16 Dec 2024 08:08:58 -0800 (PST)
Received: from bogus (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 64C623F58B;
	Mon, 16 Dec 2024 08:08:29 -0800 (PST)
Date: Mon, 16 Dec 2024 16:08:27 +0000
From: Sudeep Holla <sudeep.holla@arm.com>
To: gchen chen <gchen.guomin@gmail.com>
Cc: Cristian Marussi <cristian.marussi@arm.com>, guomin_chen@sina.com,
	Sudeep Holla <sudeep.holla@arm.com>,
	Xinqi Zhang <quic_xinqzhan@quicinc.com>, arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, dan.carpenter@linaro.org
Subject: Re: [PATCH v2] firmware: arm_scmi: Delete the meaningless
 scmi_bus_id.
Message-ID: <Z2BQe3-zl2IN_Cjj@bogus>
References: <20241216073745.2973317-1-guomin_chen@sina.com>
 <Z1_p0nU93PHJ4Sg_@pluto>
 <Z1_2rxJ7TOEIOMp7@pluto>
 <CAEEwsfRhe4-YAwe027huSXwFfkV-O-8w1GDNf=URa9efRsXiKA@mail.gmail.com>
 <Z2AEzHc5f6TjxErs@bogus>
 <CAEEwsfRKVBVR+DxhkYA5atxU7+6nsaL9X8-Yoa_DqB0YKEV1zg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAEEwsfRKVBVR+DxhkYA5atxU7+6nsaL9X8-Yoa_DqB0YKEV1zg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241216_080831_927166_B53094B6 
X-CRM114-Status: GOOD (  33.05  )
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

On Mon, Dec 16, 2024 at 10:10:40PM +0800, gchen chen wrote:
> Sudeep Holla <sudeep.holla@arm.com> 于2024年12月16日周一 18:45写道：

[...]

> >
> > I would like to understand the motivation behind this change. What is the
> > goal ? Do you prefer to fetch the name and protocol id from the device
> > name itself ? Is that your requirement.
> >
> hi Sudeep
>     Okay, the reason I want to change names like 'scmi_dev.3' to
> 'scmi_dev.firmware:scmi.perf.19' is because when I was migrating the
> SOC's kernel from v6.1 to v6.6, I found that the context for creating
> SCMI devices had changed (commit d3cd7c525fd2: firmware: arm_scmi:
> Refactor protocol device creation).

Correct. That's the beauty of Linux we can adjust the internals to enhance
the features without breaking the user-space.

> This change meant that device creation shifted from being directly
> created through scmi_protocol_device_request during SCMI driver
> registration to being created via scmi_device_request_notifier.
> This shift results in changes to the order in which devices are created,
> causing the ID in scmi_dev.id to drift.
>

What issue does this drift cause exactly ? I mean the order in which
the devices are created should not impact on anything if the dependency
on the order was not created. What was that dependency ?

> Additionally, I encountered some cpufreq errors here—because both
> scmi_cpufreq_drv and scmi_perf_domain_driver use the same
> SCMI_PROTOCOL_PERF, this results in two SCMI devices corresponding to
> the same device node. However, device_node.fwnode.dev only points to
> the first registered scmi_device, causing other consumer devices to
> find the wrong scmi device as the supplier. So I would find a
> multitude of other consumer devices waiting for meaningless device
> names like "scmi_dev.4" instead of meaningful names such as
> "scmi_dev.firmware:scmi.perf.19" or
> "scmi_dev.firmware:scmi.cpufreq.19".
>

Yes this was reported. I think most of the std protocol may not use that
node and need not be assigned. But I think vendor extensions are adding
info to the DT that may need this.

> Although I could further determine which specific driver it was by
> looking at the driver links under the scmi_protocol bus directory, I
> thought that if the logs directly displayed device names like
> 'scmi_dev.firmware:scmi.perf.19' instead of meaningless progressive
> IDs, it would be more convenient and logical, and thus more
> meaningful.
>

If the issue you encountered render your platform into boot issues ?
If so I would like to know what exactly happened. If not, I can think of
alternate solution if possible.

> > From the commit log, I get a sense that you looked at the code and thought
> > of possible improvement but when we mentioned the limitation you just
> > improvised by adding parent name. Do you expect any userspace to parse
> > the name as that will end up being ABI and we can't break it. I need
> > real motive to be explained here in detail.
> >
> I did not use userspace tools to parse this SCMI device name; I simply
> wanted the name to reflect the possible logic of the device.
> I did not remove scmi_dev.id (This scmi_device structure has not
> changed.）; I just no longer assign values to it using scmi_bus_id, so
> it should not affect the kernel ABI (kABI).

I understand the change, just not the possible impact w.r.t user-space.

-- 
Regards,
Sudeep

