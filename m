Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F989D39013
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Jan 2026 21:07:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0WiElpcSF36dlxqZFgINycbBQTchor8BrznRcJ4NQy4=; b=XyvVSfRmR+lrz+MHEblhzjzXPr
	5zMxzM2aeTY8UdXwzjs4g9+uoeb5OE1076AJdroGKq/Bc4xSdWsGuvOYtSnVj6UTOPZ/kWIx80cQQ
	/JPIYffwl7gTrTkuOqguA2pnkhvZJfMspEI759T0Oog0B+DQZRHgqj6hI9C5K3lwC29r/Vjt8M8ZT
	H3wMA90OAScASOJRWDQSjm2u8vBakPqhTQHSSmYSjSr3fdw82joW0FKBsDfFtpldxXEVlcS5muPzU
	v6MFbiWvsG5xOLqyKW3/U7pX2F3xOk/1SYKvZNijmkg9/J+LmvkwgTqxPKL9lTjatU1Yhna1TymZo
	tNaAYFOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg85F-0000000AjDw-43K7;
	Wed, 14 Jan 2026 21:07:17 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg85D-0000000AjDG-2VYg
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Jan 2026 21:07:16 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D51DB1515;
	Wed, 14 Jan 2026 13:07:07 -0800 (PST)
Received: from bogus (unknown [10.57.49.158])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6E3B03F59E;
	Wed, 14 Jan 2026 13:07:12 -0800 (PST)
Date: Wed, 14 Jan 2026 21:07:09 +0000
From: Sudeep Holla <sudeep.holla@arm.com>
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: Satya Durga Srinivasu Prabhala <satya.prabhala@oss.qualcomm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, trilok.soni@oss.qualcomm.com
Subject: Re: [PATCH] firmware: smccc: default ARM_SMCCC_SOC_ID to disabled
Message-ID: <aWgFfUug5nVY5rQQ@bogus>
References: <20260112-disable_smccc_soc_id-v1-1-a5bee24befb4@oss.qualcomm.com>
 <20260113080405.jr7ky4ypnewojiij@hu-mojha-hyd.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260113080405.jr7ky4ypnewojiij@hu-mojha-hyd.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260114_130715_676167_5860AF3E 
X-CRM114-Status: GOOD (  13.14  )
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

On Tue, Jan 13, 2026 at 01:34:05PM +0530, Mukesh Ojha wrote:
> On Mon, Jan 12, 2026 at 10:24:06PM -0800, Satya Durga Srinivasu Prabhala wrote:
> > The ARM SMCCC SoC ID driver is currently enabled by default and publishes
> > SMCCC-provided SoC identification into /sys/bus/soc/devices/socX/*.
> > 
> > On platforms where a vendor SoC driver already exposes widely-consumed
> > attributes (e.g. Qualcomm socinfo [1]), enabling the SMCCC driver changes
> > the format of /sys/devices/soc0/soc_id (e.g. "jep106:XXYY:ZZZZ" instead
> > of a vendor logical ID like "519") and breaks existing userspace consumers.
> > 
> > Flip the default of CONFIG_ARM_SMCCC_SOC_ID from y to n. Platforms that
> > prefer SMCCC over a vendor driver can explicitly enable it.
> > 
> > This avoids unexpected format changes and keeps the generic SoC sysfs
> > stable on systems that rely on vendor-specific identification.
> > 
> > [1]
> > Link: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/soc/qcom/socinfo.c
> > 
> > Signed-off-by: Satya Durga Srinivasu Prabhala <satya.prabhala@oss.qualcomm.com>
> 
> Fixes tag ??
> 

Sorry which commit is broken ?

-- 
Regards,
Sudeep

