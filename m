Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A32EFC28B20
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Apr 2025 16:45:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dC2BktL2U1qJZpOkA3oSO/rhAVApRNRqpBDF3LmdFzk=; b=MZL4tc8DPy8EOGbTgGVaErkM+S
	XyK7nGZ28J2dUjUP66mTa+FimjrfBE8ALDUpzbM1oDxn5CpLPUJ4spz203jMKf8UGDPuCjBiIJk81
	ZIjG9ZvtAvJ5yoy6jSewBgU3pKLesihJxyEWqblYppd40GpWkCbObbNZmljbx1IIQCgrVSovGeDGd
	8wTS9WTG2vR350RSCjn+GAHLe0+UcZTnEvdw0QxC1F9oa/tsrFS233dwJ5aiYzqfeOz0ZP6P8XGkx
	C3yXV2XjspRfbuu4IvPb/fzWeqOME7u33ZE9++Ap3L8OB892ZwbMDQn1O80SPauyQYwFy3l2TLndo
	ilnaq8Xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u01Dj-00000006g3Y-2D6x;
	Wed, 02 Apr 2025 16:45:43 +0000
Received: from out-179.mta1.migadu.com ([2001:41d0:203:375::b3])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u01Bt-00000006fmQ-4109
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Apr 2025 16:43:51 +0000
Date: Wed, 2 Apr 2025 09:43:40 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1743612225;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=dC2BktL2U1qJZpOkA3oSO/rhAVApRNRqpBDF3LmdFzk=;
	b=QV4LwqRBXE/ZSwab145rZFh2Wh+9zagi8movC6n+xstcXwajIwpREX2Apbkb/XDWXiomdO
	Xvog9Upf8soPxXuBVSgRYIDNIqdyYyB0pF9fYyUy0nYrTBl8OAigLiFODBzCaoJApVPYv+
	Q+i1Ib8wS96p36xm0dkeJ7LBnEoUSM0=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Oliver Upton <oliver.upton@linux.dev>
To: Sudeep Holla <sudeep.holla@arm.com>
Cc: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>,
	kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	maz@kernel.org, mark.rutland@arm.com, lpieralisi@kernel.org,
	catalin.marinas@arm.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] smccc/kvm_guest: Remove the accidental semicolon
Message-ID: <Z-1pPLI8HRjg-bSx@linux.dev>
References: <20250402134401.146156-1-shameerali.kolothum.thodi@huawei.com>
 <20250402-independent-hyrax-of-honor-4515fb@sudeepholla>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250402-independent-hyrax-of-honor-4515fb@sudeepholla>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250402_094350_144980_EB239AAF 
X-CRM114-Status: GOOD (  11.50  )
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

Hi Sudeep,

On Wed, Apr 02, 2025 at 02:58:06PM +0100, Sudeep Holla wrote:
> On Wed, Apr 02, 2025 at 02:44:01PM +0100, Shameer Kolothum wrote:
> > Fixes cocci reported warning:Unneeded semicolon
> > 
> 
> There was similar patch on the list [1] few days ago.
> 
> > Fixes: 86edf6bdcf05 ("smccc/kvm_guest: Enable errata based on implementation CPUs")
> 
> ^^^ Is this really necessary as they get backported as well ?

The blamed commit was introduced this release cycle so no concern about
backports.

> Since, KVM maintainers are in cc-ed, let me know if you guys want to pick
> this ? Else I can send it as part of my firmware (ffa/scmi) fixes.

I can grab the fix here in a moment, I've already got one queued up [*]
for the KVM guest driver anyway.

[*]: https://git.kernel.org/kvmarm/kvmarm/c/acfcaf90db1f

Thanks,
Oliver

