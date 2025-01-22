Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF1FBC02182
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jan 2025 11:45:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EaigDTFkUsGG9WvfbjVc7o48sQCAgofbGaOQ+5e6gZY=; b=yGJBuwxxDJYsTcNGgLKkM+GkFh
	8ae6JYGekjAsYyeOmHxU8lSHYXrshIcYfsJScTkX9lZdp8I+aVpSdMZVizvqttakgUHLTM9oVsWEM
	CH1EVNY/O6MRJ1DfSr+Fo7LKrMZfcGOc+7o4qoz4q7fCJwok2NBrWhcf7Hgjd1vSxtM3ER1Vg+e56
	9VrS4nX1d4mdXuwHnmZcR3ynXr2qZla9coG7i6qZfYX08grFRePZKRULCxR6QQ0aybZtPRMbVEz6E
	QDuLX8mFHndyVXXxVavPAtZdSwV/P6OAFaK4qNDA8UOPrE41Krw6aLNJjSznmhSri+ivtqQ33nO20
	ZIMx1LOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1taZB5-0000000A58d-2jNU;
	Wed, 22 Jan 2025 11:45:47 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1taZ9l-0000000A4wD-0ENa
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Jan 2025 11:44:26 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4FD551007;
	Wed, 22 Jan 2025 03:44:52 -0800 (PST)
Received: from bogus (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7EF153F66E;
	Wed, 22 Jan 2025 03:44:22 -0800 (PST)
Date: Wed, 22 Jan 2025 11:44:19 +0000
From: Sudeep Holla <sudeep.holla@arm.com>
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: Vincent Guittot <vincent.guittot@linaro.org>,
	Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Bill Mills <bill.mills@linaro.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] firmware: arm_ffa: Allow multiple UUIDs per partition
Message-ID: <Z5DaE6ktzjyZ4-s8@bogus>
References: <0bc7e1754db0547c6c041ed178cf24ca326af2d1.1737522729.git.viresh.kumar@linaro.org>
 <e7990bc3dc128e5056c3bad381e548a49ab67c81.1737522729.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e7990bc3dc128e5056c3bad381e548a49ab67c81.1737522729.git.viresh.kumar@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250122_034425_135456_9197E808 
X-CRM114-Status: UNSURE (   9.48  )
X-CRM114-Notice: Please train this message.
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

On Wed, Jan 22, 2025 at 10:53:43AM +0530, Viresh Kumar wrote:
> A partition can implement multiple UUIDs and adding the same partition
> twice will fail. Don't try to add a partition again, if it is already
> added earlier.
>

Bertrand shared similar patch and that raised question if we need to support
sched_callback from different drivers or not. I need to think if we can drop
the whole support of allowing FF-A drivers to register sched_callback or
do this properly. Let me think. But this can be a temporary fix though.

-- 
Regards,
Sudeep

