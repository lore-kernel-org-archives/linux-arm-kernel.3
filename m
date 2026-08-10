Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B4CCC5AD55
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Aug 2026 14:06:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UMnhUneTzwtjDzy1xxGKMdnmHrKherhHslA393sMHG4=; b=oUaeBTo0rH5IjOz973cnO6nloE
	U0iMdw87i9KFA32GFsXK7nIi8kWbgmQtdYRli+2DByAA1E3mhMaEa3pHoWCtfx+uFEiSLHpvXx4cO
	n4O+rayr4Za5vwWjmn9xK8MM88ZteXKUYlVpKpCoZxqyW+yD0Fngkv3//mkqaYGJQz0n8jyWXfX4U
	FNS7iyUqXjc271mc9Vc9Vg+nWbkU/IGhpOaAGHROmdAragzqtC/k4McNM4+GFP4RK62fCHDBSOEw8
	Zb9IwnQPu4AbtY7H8UZnNn9YT7S2TSIs5Xx8uMcH1pMSM8QP/HdgEY8TWPb6Au9+JNRbTTY253t5M
	x/teP3CQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtQeI-0000000BxFm-3aMh;
	Mon, 10 Aug 2026 14:06:42 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtQeG-0000000BxEi-1Tz0
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Aug 2026 14:06:41 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 50E6C14BF;
	Mon, 10 Aug 2026 07:06:34 -0700 (PDT)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9AFC63F86F;
	Mon, 10 Aug 2026 07:06:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1786370798; bh=g0uhoRWFHTdZ0ZzOAruGkjDRXU4y6osHC2aJvMRyUpw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=n70Zq9NLuvxW4PokNrRgSlYia+5IhNEe1yc2lTVe0vuUYymGQ24EIoRAHnqCfPXX3
	 W4Qahaev+O7/LzqQOA89QYuvpKfsmr+jCwPlqD/6VR3C3ht9MtdGKiW4nH99Vr7esI
	 tTTCYfyU2Rh1RyRYIN1JFQAo2Qh/uK957/FroeQQ=
Date: Mon, 10 Aug 2026 15:06:27 +0100
From: Cristian Marussi <cristian.marussi@arm.com>
To: Fayssal Benmlih <Fayssal.Benmlih@arm.com>
Cc: Cristian Marussi <Cristian.Marussi@arm.com>,
	"arm-scmi@vger.kernel.org" <arm-scmi@vger.kernel.org>,
	"d-gole@ti.com" <d-gole@ti.com>,
	"david@kernel.org" <david@kernel.org>,
	Elif Topuz <Elif.Topuz@arm.com>,
	"etienne.carriere@st.com" <etienne.carriere@st.com>,
	"f.fainelli@gmail.com" <f.fainelli@gmail.com>,
	"james.quinlan@broadcom.com" <james.quinlan@broadcom.com>,
	"jic23@kernel.org" <jic23@kernel.org>,
	"kas@kernel.org" <kas@kernel.org>,
	"kernel-team@meta.com" <kernel-team@meta.com>,
	"leitao@kernel.org" <leitao@kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Lukasz Luba <Lukasz.Luba@arm.com>,
	"michal.simek@amd.com" <michal.simek@amd.com>,
	"peng.fan@oss.nxp.com" <peng.fan@oss.nxp.com>,
	Philip Radford <Philip.Radford@arm.com>,
	"puranjay@kernel.org" <puranjay@kernel.org>,
	Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
	"sudeep.holla@kernel.org" <sudeep.holla@kernel.org>,
	"usama.arif@linux.dev" <usama.arif@linux.dev>,
	"vincent.guittot@linaro.org" <vincent.guittot@linaro.org>
Subject: Re: [PATCH v7 07/23] firmware: arm_scmi: Add support to parse SHMTIs
 areas
Message-ID: <anna43kYrUld7J-r@pluto>
References: <20260802145618.1952804-8-cristian.marussi@arm.com>
 <A88E25CA-4474-4937-9CCE-DAA62D481E92@contoso.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <A88E25CA-4474-4937-9CCE-DAA62D481E92@contoso.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260810_070640_479903_21C6771C 
X-CRM114-Status: GOOD (  22.43  )
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

On Mon, Aug 03, 2026 at 11:53:45PM +0100, Fayssal Benmlih wrote:
> Hi Cristian,
> 

Hi,

> I found two UUID database issues that appear to be blockers.
> 
> > 	if (ti->info.num_uuids + SCMI_UUID_DB_THRESH >= ti->uuids_len) {
> > 		uuid_t **uuids, **old_uuids;
> >
> > 		uuids = kcalloc(ti->uuids_len * 2, sizeof(*uuids),
> > 				GFP_KERNEL);
> > 		if (!uuids)
> > 			return -ENOMEM;
> >
> > 		/* Copy/move old allocated UUIDs */
> > 		for (int i = 0; i < ti->info.num_uuids; i++)
> > 			uuid_copy(uuids[i], ti->info.uuids[i]);
> 
> uuids is a newly allocated and zeroed array of uuid_t pointers, so
> uuids[i] is NULL here. uuid_copy() therefore copies into a NULL
> destination when the database grows with existing entries.
> 
> The database stores pointers to UUIDs owned by telemetry_uuid objects, so
> should this instead copy the pointers themselves, for example:
> 
> 	uuids[i] = ti->info.uuids[i];
>

Exactly...my bad .. fixed in V8.

> or use an appropriately sized memcpy() of the pointer array?
> 
> > 	ti->uuids_len = ti->num_shmti * 2;
> > 	ti->info.uuids = kcalloc(ti->uuids_len,
> > 				 sizeof(*ti->info.uuids),
> > 				 GFP_KERNEL);
> 
> A valid implementation can have zero SHMTIs while exposing fast-channel or
> notification-only DEs. In that case uuids_len is zero.
> 
> Primary UUID creation then enters the resize path, doubles zero to zero,
> and eventually writes the primary UUID pointer through a zero-size
> allocation.
> 
> Please give the UUID database a nonzero minimum initial capacity and use
> checked growth so that zero cannot remain zero.
> 

Done in V8, since Primary is always present AND also we'd like to avoid
to immediately resize the Array so initial len is set to at least
SCMI_UUID_DB_THRESH + 1

> > static void scmi_telemetry_line_put(struct telemetry_line *line,
> > 				    void *blob)
> > {
> > 	if (refcount_dec_and_test(&line->users)) {
> > 		xa_erase(line->xa_lines,
> > 			 (unsigned long)line->payld);
> > 		kfree(blob);
> > 	}
> > }
> 
> Lookups and refcount increments are serialized using lines_mtx, but this
> final decrement, XArray erase and free are not performed under the same
> lock.
> 
> A concurrent get-or-create operation can load the entry while another
> thread decrements the refcount to zero and frees it. Please serialize the
> final put with lookup/creation, or use a lifetime scheme such as
> refcount_inc_not_zero() with appropriate XArray/RCU protection.
> 

I have reviewed/reworked all of the lines internal and external mutexing
in V8 due to also a ton of Sashiko reports...

Thanks,
Cristian

