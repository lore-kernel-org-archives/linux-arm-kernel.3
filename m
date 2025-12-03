Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C486FD12D75
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Dec 2025 15:21:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jWygY73nSQOiA+moxM13U6HWtAECUem8Io4KBvrEaL0=; b=Q/9xK4pEDYFa8tVLsYpeTn7tJM
	+GeK1dMGm29s0IIGyrKSe7QDBcUDj6IEbUEahpjWnkLnbUqHkm9PsNu9+RD8fucwxuXa+7iYQvLCZ
	QtSXRCO99TCrMxHQAFsiIljwkNscpMbtAKevXrxfLpc6PIZuwitQSlMNKsfVGDiFSiWSQC8MdsIys
	BfT7YoBFEkjCKfFPFkR/aXIkPkwjjveEFnUCL1KwK6tA1Z5ZCyHTNXEcofjQ1R7qTf/dfW3j9s3QY
	a2x84KkLDhRe1Z+Df+FgyYy7lPr55RVq9SJBvgY0U6nw79Mw96E9stD2ZIg4d3C9cg5+c316XECkL
	YUqex1QA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQofk-00000006hHt-0aPG;
	Wed, 03 Dec 2025 15:21:40 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQofi-00000006hHK-0BCt
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Dec 2025 15:21:39 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EB733339;
	Wed,  3 Dec 2025 07:21:27 -0800 (PST)
Received: from bogus (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 519FC3F59E;
	Wed,  3 Dec 2025 07:21:34 -0800 (PST)
Date: Wed, 3 Dec 2025 15:21:31 +0000
From: Sudeep Holla <sudeep.holla@arm.com>
To: Punit Agrawal <punit.agrawal@oss.qualcomm.com>
Cc: Cristian Marussi <cristian.marussi@arm.com>, arm-scmi@vger.kernel.org,
	Sudeep Holla <sudeep.holla@arm.com>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 0/8] firmware: arm_scmi: Refactoring and enablement of
 ACPI PCC transport
Message-ID: <20251203-super-kagu-of-amplitude-fef078@sudeepholla>
References: <20251017-acpi_scmi_pcc-v1-0-0adbab7709d9@arm.com>
 <87wm44aect.fsf@stealth>
 <20251126-camouflaged-delightful-cuckoo-ddeac8@sudeepholla>
 <877bv3n7x2.fsf@stealth>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <877bv3n7x2.fsf@stealth>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251203_072138_120361_85E1D19A 
X-CRM114-Status: GOOD (  13.43  )
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

On Wed, Dec 03, 2025 at 11:04:09AM +0000, Punit Agrawal wrote:
> Hi Sudeep,
> 
> Sudeep Holla <sudeep.holla@arm.com> writes:
> 
> > I can create one but that is not strictly necessary. As mentioned in the
> > cover letter, the only dependency is on value of SCMI_PROTOCOL_TELEMETRY
> > ins `scmi_std_protocol` enumeration. Just add one and you must be able to
> > compile the series independent of Cristian series.
> 
> Thanks, I managed to get the patches building. Looking forward to the
> series progressing. If possible, do keep me in the loop for future
> updates.

Sure - I’ll try to remember to copy you on the next updates. I don’t have any
immediate plans, though, unless the spec moves into beta, changes come up, or
someone specifically requests important updates that would help them make
progress.

Do you have immediate plans to use this on a platform ? Or you are reviewing
just out of interest/curiosity 😉 ?

-- 
Regards,
Sudeep

