Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3FA6C7EE2A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Jun 2025 18:29:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jdS+EnJeggtArXri7isJi965X1XUF9jQFxFsNkbSX6Q=; b=MIscV87wbCUdWdk2tqdW6wcaU5
	pMW7/h7HNZPGnX/vmBLVZsAdbFIhVqpI09vTTQ22nX1r0UB32pkvZhLQ3M7WBYWaKFvcCUpXMItjV
	6K5T4fJ/aQZktdAq7MP3vDoQjaeKoMTg5l0Ur6gILmJDEjtGBzLOWxoQaMwJdk4qqT/f0pLl+Yn9j
	/YUohgzmwEdj9DeP5+lM7EwtihysdHXtTDS5j9D/VrTudcxy+4aArxZhaF5L9ZZOrmSnXcP+4MB6J
	EiAoudBNB1VURuZ9567KbbaCTIJWDh/+1mqGBf4x+/TeyfMtYsMEjKaPPckt/vBStn5Pj7Xkh9mB9
	aixz/o5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUUrf-00000009ZGE-26vi;
	Wed, 25 Jun 2025 18:28:55 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUQtp-00000008vH8-3ygu
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Jun 2025 14:14:55 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4972A1007;
	Wed, 25 Jun 2025 07:14:35 -0700 (PDT)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B047F3F66E;
	Wed, 25 Jun 2025 07:14:50 -0700 (PDT)
Date: Wed, 25 Jun 2025 15:14:47 +0100
From: Cristian Marussi <cristian.marussi@arm.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Cristian Marussi <cristian.marussi@arm.com>,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org, sudeep.holla@arm.com,
	james.quinlan@broadcom.com, f.fainelli@gmail.com,
	vincent.guittot@linaro.org, etienne.carriere@st.com,
	peng.fan@oss.nxp.com, michal.simek@amd.com, quic_sibis@quicinc.com,
	d-gole@ti.com, souvik.chakravarty@arm.com
Subject: Re: [RFC PATCH 5/7] firmware: arm_scmi: Add System Telemetry
 chardev/ioctls API
Message-ID: <aFwEV6zK8KU_FP19@pluto>
References: <20250620192813.2463367-1-cristian.marussi@arm.com>
 <20250620192813.2463367-6-cristian.marussi@arm.com>
 <6fa26a61-1f61-4ab0-8b7d-caeae7eb801e@suswa.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6fa26a61-1f61-4ab0-8b7d-caeae7eb801e@suswa.mountain>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250625_071454_022344_3058A4F0 
X-CRM114-Status: GOOD (  11.05  )
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

On Sat, Jun 21, 2025 at 12:51:12AM +0300, Dan Carpenter wrote:
> On Fri, Jun 20, 2025 at 08:28:11PM +0100, Cristian Marussi wrote:
> > +static long scmi_tlm_des_read_ioctl(struct scmi_tlm_instance *ti,
> > +				    unsigned long arg, bool single)
> > +{
> > +	void * __user uptr = (void * __user)arg;
> > +	struct scmi_tlm_setup *tsp = ti->tsp;
> > +	struct scmi_tlm_bulk_read bulk, *bulk_ptr;
> > +	int ret;
> > +
> > +	if (copy_from_user(&bulk, uptr, sizeof(bulk)))
> > +		return -EFAULT;
> > +
> > +	bulk_ptr = kzalloc(sizeof(*bulk_ptr) +
> > +			     bulk.num_samples * sizeof(bulk_ptr->samples[0]),
> 
> This should be struct_size(bulk_ptr, samples, bulk.num_samples) to
> avoid an integer overflow on 32bit systems.
> 
I will fix.

Thanks,
Cristian

