Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 297AAD3901B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Jan 2026 21:03:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b82UcOFN79FZUneX+gMiwUHXFuH629dcsyC/gV6M6Dw=; b=EZ8+DQWCFuAQZW5Lb813DXrvrV
	EKfsHk+apV1CHIYZT3Wqf1NuIznmcvG0lgbeS75R968pfqsUT2L8U+9R/4ZXlKaT/uaWUfZk3OTm7
	8YNJHOSvKd/w+doU0/JAsafB73u4If9/o0EMreIFsnK8TLaEPTiYcg4eGBO0f4NBOQtdcVRaLBH7S
	GkVT3hSaqhXHKlqX35m9/7CTPBkkZb0/q5Z5r4oVz/gO3v3mcQa33jpAqWIivoWVXuEQMdX0adVKk
	eJlsKqGDLw00QPydF2W6g1cAl31/eechcAwF9QXvyXCw9q8wh3sZrztF1q4V7gGLR4/kcBYK7HO00
	xD853MFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg81i-0000000AigC-08br;
	Wed, 14 Jan 2026 21:03:38 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg81f-0000000AifV-2kyT
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Jan 2026 21:03:36 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4375B1515;
	Wed, 14 Jan 2026 13:03:26 -0800 (PST)
Received: from bogus (unknown [10.57.49.158])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D0B893F59E;
	Wed, 14 Jan 2026 13:03:30 -0800 (PST)
Date: Wed, 14 Jan 2026 21:03:27 +0000
From: Sudeep Holla <sudeep.holla@arm.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Satya Durga Srinivasu Prabhala <satya.prabhala@oss.qualcomm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, trilok.soni@oss.qualcomm.com
Subject: Re: [PATCH] firmware: smccc: default ARM_SMCCC_SOC_ID to disabled
Message-ID: <aWgEn4GmKwUOjNPe@bogus>
References: <20260112-disable_smccc_soc_id-v1-1-a5bee24befb4@oss.qualcomm.com>
 <7ruiccdm7q5fg2pixmszr3fqvclvymdlkv4x4xbavkaeczrxgc@5l6usxqfi5fe>
 <619f20eb-77e4-4250-ba5e-78db741ebbef@oss.qualcomm.com>
 <7jhqea42453esyx4sv3okowy7jrdcrd4sxjpm4t2snsyi3nfl4@ieja4c4q3jj5>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7jhqea42453esyx4sv3okowy7jrdcrd4sxjpm4t2snsyi3nfl4@ieja4c4q3jj5>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260114_130335_736946_5E7FDC91 
X-CRM114-Status: GOOD (  27.08  )
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

On Wed, Jan 14, 2026 at 09:37:24PM +0200, Dmitry Baryshkov wrote:
> On Wed, Jan 14, 2026 at 10:04:21AM -0800, Satya Durga Srinivasu Prabhala wrote:
> > Hello Dmitry,
> > 
> > On 1/13/2026 3:25 AM, Dmitry Baryshkov wrote:
> > > On Mon, Jan 12, 2026 at 10:24:06PM -0800, Satya Durga Srinivasu Prabhala wrote:
> > > > The ARM SMCCC SoC ID driver is currently enabled by default and publishes
> > > > SMCCC-provided SoC identification into /sys/bus/soc/devices/socX/*.
> > > > 
> > > > On platforms where a vendor SoC driver already exposes widely-consumed
> > > > attributes (e.g. Qualcomm socinfo [1]), enabling the SMCCC driver changes
> > > > the format of /sys/devices/soc0/soc_id (e.g. "jep106:XXYY:ZZZZ" instead
> > > > of a vendor logical ID like "519") and breaks existing userspace consumers.
> > > > 
> > > > Flip the default of CONFIG_ARM_SMCCC_SOC_ID from y to n. Platforms that
> > > > prefer SMCCC over a vendor driver can explicitly enable it.
> > > NAK, the userspace should not depend on the exact kernel configuration.
> > > Consider working with distribution kernels, which would enable this
> > > driver anyway.
> > As I mentioned in the other replies, vendor interface exists before the
> > standard
> > interface and user space heavily relies on soc0 already. If not disabling
> > the
> > SMCCC SOC ID by default. I believe, we should  at-least have a way to make
> > sure vendors can disable SMCCC SOC ID by some means or have vendor
> > interface takes precedence.
> 
> Please correct me if I'm wrong, what do you observe? SMCCC device on
> soc0 and qcom_socinfo at soc1?
> 
> In such a case the ABI file, Documentation/ABI/testing/sysfs-devices-soc clearly
> defines that there might be several different SoC devices (identified by
> different drivers, etc). If the userspace depends on qcom_socinfo device
> being soc0, then the userspace is broken.
> 
> Last, but not least, the soc_id format is documented in the ABI
> document. It is clearly allowed to have jep106 format in the soc_id. So,
> I think, you have two options: disable SMCCC 1.2+ in the firmware or
> adapt the userspace. You can't control e.g. the kernel that will be
> running on your platform (it very well can be a standard distro kernel
> from Debian, Ubuntu or Fedora, which obviously will have that driver
> enabled).
> 

Completely agree to all the points made here.

-- 
Regards,
Sudeep

