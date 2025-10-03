Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7357DCCA471
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Oct 2025 14:00:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QIvs9jD5/EL3q+VedBCTg6fyJOEdMcFedFll4VTeYvc=; b=W68d2sifAjx6mJOwtjkSdnTfJI
	aKj7Hl2o7C8BdSdTnxjqcTlkAkxarb3tUUQxex/gVSzjDwpv5vsMvzv7vhP2E92gDkFrBhsfX0H9j
	cqNzB0fKna9yhjO6ntubuHGdh0ZcrfEnI1zOPyyviwYMyJibgkR9VIYE91W1OgofTEhb2U5u+Ofpl
	wsOifmiiPdt08IP5Mn27+ZUAK/MQzgYIfbwXancqXGdfKrL+ilnqXh9FbbPNAfvUdr8ro8Z0XNa3F
	9SSoQTZ/Ecwzxgob7RncWeUHRMoHNlg91Qlx8v2Jup5aDnWuEpCEwTmtRwtLtgUGcj/GI3Y4Q2Zkn
	SLq4pisw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4gK9-0000000CVKR-2XDl;
	Fri, 03 Oct 2025 13:59:53 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4gK6-0000000CVK7-39sH
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Oct 2025 13:59:52 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EF8151655;
	Fri,  3 Oct 2025 06:59:40 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 960383F5A1;
	Fri,  3 Oct 2025 06:59:48 -0700 (PDT)
Date: Fri, 3 Oct 2025 14:59:46 +0100
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
Subject: Re: [PATCH v3 19/31] coresight: cti: Introduce CS_MODE_DEBUG mode
Message-ID: <20251003135946.GY7985@e132581.arm.com>
References: <20250915-arm_coresight_power_management_fix-v3-0-ea49e91124ec@arm.com>
 <20250915-arm_coresight_power_management_fix-v3-19-ea49e91124ec@arm.com>
 <CAJ9a7VgQoJMQyuGP6UP8ptg4xcoV2cbR4bwz6ooRy5O_SaiCVA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAJ9a7VgQoJMQyuGP6UP8ptg4xcoV2cbR4bwz6ooRy5O_SaiCVA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251003_065950_834911_1D4D4D07 
X-CRM114-Status: GOOD (  16.07  )
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

On Thu, Oct 02, 2025 at 11:31:52AM +0100, Mike Leach wrote:
> Hi,
> 
> On Mon, 15 Sept 2025 at 11:34, Leo Yan <leo.yan@arm.com> wrote:
> >
> > Introduce a new CS_MODE_DEBUG mode to indicate that a device is being
> > used for debugging purposes, e.g, if a system enables CTI for debugging
> > but not for hardware trace
> >
> 
> How can you know why the CTI is being enabled?

Depend on which CTI enablement path is invoked.

> System CTIs are attached to key HW trace infrastucture such as input
> triggers for ETR/ETB that have direct effect on trace.
> CoreCTIs, while they have some debug triggers, can also trigger ETM events.

Seems to me, it is no matter system CTIs or Core CTIs. Here, I am trying
to distinguish three methods for enabling CTI:

  (1) Enable CTI within a perf session.
  (2) Enable CTI within a sysfs session.
  (3) Enable CTI using the CTI driver's sysfs knob(s).

Currently, methods (2) and (3) are both using CS_MODE_SYSFS.

Method (2) enables a CTI device when we enable a source-to-sink path
via the sysfs interface; CTI acts as a helper in this case.

Since the CTI driver also provides its own sysfs knobs to enable the
CTI device by itself (defined in coresight-cti-sysfs.c), to
distinguish this from method (2), this patch introduces CS_MODE_DEBUG.

Thanks,
Leo

