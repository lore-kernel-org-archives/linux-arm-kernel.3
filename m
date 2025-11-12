Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26147CCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Nov 2025 13:56:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UphEniuoQ+eEfHR8l0mm95old4Tt9k5Cld2cvcHPXB4=; b=o+s/xYefOcz/hXUKWoFleBaxiO
	M/erH8QcEUwqw5ldboH9OvnlL2Uax6RlqVdxx68Fv4+dzpVVqibBCHndMHx27Xeozp6158e72S/cA
	S1eA5OA//42cllnGBSIvkPYqYWRFPvj5FTUf50Wb3dMA1bAFTngsPzeUBRQGS2Hn5xkfSQc+W1WR/
	QV6itM6ZY1p7M8lbACi+fJdqmmMAEuiG8koIkmT2aLalwk13a847vGbxGcFA0l+UlzHQ23vXXDHdy
	2UjAGIat8FJlyjyZtzBZRdxtjjnftc4eRc0YfPtMPkuuJlGnegEIQxTgpl8xJoJe+uLJxWNo6sR/K
	/1JI4whA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJBKd-00000008swB-0g6k;
	Wed, 12 Nov 2025 13:56:19 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJBKb-00000008suG-3o0R
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 12 Nov 2025 13:56:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=UphEniuoQ+eEfHR8l0mm95old4Tt9k5Cld2cvcHPXB4=; b=cNqqq5sHEyIFNA42NrRy9iYklW
	9WAmJUQBo2H5+YPjSe6bROCk9m8nf6UGcM5hjlhhl7TvQxXIFkQvibS7NnkdN+FMwSdYiF2QcX3S2
	nJpEtYc7GNDw07T10T9MMYoEWUoRMhrqrvXa19nJTQS/FioSt44Q5HrdTKrca/8qnktxRgreos3z0
	5qhlgcp8o036Ny6vsAYFJVEE8849Gfu2UN5lKMNuvRsUb07hZWwayeR9g7OBzB9Xi/nKKPJNASTEJ
	DJVTlwiTfIsxxiBVShOsT9Lcleip5VX70xs98ju2XpWoxygj/T7EC/rPRBNIbdos7XYAkGh9TFOyl
	bf8YYmxw==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJASt-0000000FXfK-0BwN
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Nov 2025 13:00:49 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 475341515;
	Wed, 12 Nov 2025 05:56:04 -0800 (PST)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8A5463F5A1;
	Wed, 12 Nov 2025 05:56:11 -0800 (PST)
Date: Wed, 12 Nov 2025 13:56:09 +0000
From: Leo Yan <leo.yan@arm.com>
To: Mike Leach <mike.leach@linaro.org>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	James Clark <james.clark@linaro.org>,
	Yeoreum Yun <yeoreum.yun@arm.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Yabin Cui <yabinc@google.com>, Keita Morisaki <keyz@google.com>,
	Yuanfang Zhang <quic_yuanfang@quicinc.com>,
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v6 11/11] coresight: etm4x: Reuse normal enable and
 disable logic in CPU idle
Message-ID: <20251112135609.GH281971@e132581.arm.com>
References: <20251111-arm_coresight_power_management_fix-v6-0-f55553b6c8b3@arm.com>
 <20251111-arm_coresight_power_management_fix-v6-11-f55553b6c8b3@arm.com>
 <CAJ9a7VjpmWdethzwpKuo8mvGxU69HjZieGh+6iqTN6aSEow5gA@mail.gmail.com>
 <20251112111923.GG281971@e132581.arm.com>
 <CAJ9a7Vjj_KXA0aSvDPatg3eN-PJ3Q878n2RF53aKJK1r53d8SA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAJ9a7Vjj_KXA0aSvDPatg3eN-PJ3Q878n2RF53aKJK1r53d8SA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251112_130047_515718_0083BFF7 
X-CRM114-Status: GOOD (  26.75  )
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

Hi Mike,

On Wed, Nov 12, 2025 at 11:58:26AM +0000, Mike Leach wrote:

[...]

> > I prefer we can use a separate patch series to address this issue (I
> > should review Levi's patch series so can make things proceed). At the
> > meantime, I would say this patch is still valid.
> >
> > As a side topic, actually we have found issues for the config is
> > reset when start a session so the user's config does not take affect at
> > all (see etm4_set_default_config()).
> 
> This code is used by the perf session - not the sysfs session. This is
> deliberate to start from a stable state and add any configuration from
> the perf command line.

My feeling is now the discussion mixes up two things:

- Should we apply user's parameters (via sysfs knobs) on a perf session?

- Can a perf session overwrite user's parameters?

For me, there is no reason to prevent a perf session from using the
user's configs.  We might disagree on this, but regarding the second
question, a perf session definitely should not overwrite the user's
parameters — it can ignore the user's configuration, but it must not
erase these parameters.

> The perf session deliberately ignores parameters set by sysfs - in
> fact the first act in parsing the perf event structure in
> etm4_parse_event_config(), is to completely zero out the entire config
> structure. Then the default config is set - which guarantees trace is
> captured, then any perf command line options are set in the registers
> (e.g. timestamps, address filtering etc). After this if we have s
> cscfg configuration active, this too is added in.

Seems to me, a correct sequence is:

 1) Clean up hw_config;
 2) Apply user's config on hw_config;
 3) Apply cscfg on hw_config.
 4) Apply perf's format/config on hw_config;

In this sequence, the last applying config has highest priority (as
the perf format is the latest setting from user).

Here I am not quite sure for step 2) and 3).  Should we apply both
user's config and cscfg, or we apply only one and ignore another (e.g.,
if cscfg has been set, then ignore user's config, vice versa).

> This ensures that the configuration run on all the ETMs used during
> the perf session is identical - which cannot be guaranteed if we used
> sysfs set parameters as part of the perf session, as each ETM might
> have different parameters set by sysfs.This gives us predictable,
> stable and repeatable perf configurations.

Why can't we leave this to users?

For sanity, drivers should reject invalid parameters when a user is
setting it, once the parameters are accepted, afterwards drivers should
simply follow the user's settings in a runtime session.

Thanks,
Leo

