Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 396BAE77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Dec 2024 11:41:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rbD9MDSfwH2QSRLOsRxhlY+2MRwY+0j6TrtDMpkD2gg=; b=gbA9zM9zmlNt6SDZUorRodRmJD
	L1t/fWuKJUmtpER8LqpD5o7mJOQ2sL5pmLcQ6M1dAD2/VHHpRnI8EplYEKS1XoNJVvYn7mDUnQwCm
	Xp25pYbYkQkR0e0nfR0HJzUMaZij8WP3Xap91moGjDVVnowr/WAOUaxFGqQFnxG2MHOkR3L3Wc+Oj
	eaUc8LjdE7XQnTrs2fazhrytKpNuU9KBcogfrGjCKfvpif54WXD2yMtKZtSVj8gtWlOdtw9b9fQI7
	djDmAa7HEsUbRsvd2xvNDvlPw2YUlvd/Y9B+UNUsBWk6ZUzP9R0K5Fycy6XIG1vTOz7EE6BzA1Zc0
	s7kt2C2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tObNs-00000004noO-2XRa;
	Fri, 20 Dec 2024 11:41:32 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tObMF-00000004na7-16v1
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Dec 2024 11:39:52 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C670F1480;
	Fri, 20 Dec 2024 03:40:18 -0800 (PST)
Received: from bogus (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id AEE4F3F58B;
	Fri, 20 Dec 2024 03:39:48 -0800 (PST)
Date: Fri, 20 Dec 2024 11:39:46 +0000
From: Sudeep Holla <sudeep.holla@arm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Elliot Berman <quic_eberman@quicinc.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Subject: Re: [PATCH 0/3] Allow specifying an S2RAM sleep on
 pre-SYSTEM_SUSPEND PSCI impls
Message-ID: <Z2VXgkJ4x5TJTKJ_@bogus>
References: <20241028-topic-cpu_suspend_s2ram-v1-0-9fdd9a04b75c@oss.qualcomm.com>
 <20241113165329590-0800.eberman@hu-eberman-lv.qualcomm.com>
 <e4509104-c809-4d45-bdbb-a2d754a816db@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e4509104-c809-4d45-bdbb-a2d754a816db@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241220_033951_349599_C3A2E544 
X-CRM114-Status: GOOD (  18.05  )
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

On Thu, Dec 19, 2024 at 08:26:51PM +0100, Konrad Dybcio wrote:
> On 14.11.2024 2:10 AM, Elliot Berman wrote:
>
> > I'm not sure why you'd like to support s2ram. Is it *only* that you'd
> > like to be able to set pm_set_supend/resume_via_firmware()? I hope this
> > doesn't sound silly: what if you register a platform_s2idle_ops for the
> > relevant SoCs which calls pm_set_suspend/resume_via_firwmare()?
>
> S2RAM is what you get after entering a certain state, but currently
> it's presented as just another (s2idle) idle state.
>

Just to be clear, I assume you mean CPU_SUSPEND idle state. There is
no special or different s2idle idle states IIUC.

> That means some hardware that may need to be reinitialized, isn't as
> Linux has no clue it might have lost power.
>

Interesting, so this means firmware doesn't automatically save and restore
states yet exposes it as CPU_SUSPEND idle state.

> One of such cases is the PCIe block, with storage drivers specifically
> looking for pm_suspend_via_firmware, but that's unfortunately not the
> whole list.
>

Well I can now imagine and I understand what's wrong here. An idle state
is exposed to OS with an expectation that OS saves and restores certain
state. Unless you tie it some other power domains that theses devices
share, it is hard for OS to know the state is being lost and it needs
to save and restore them. It is simple wrong to assume that OS needs
to take care of them even though the power domain hierarchy doesn't
represent this dependency to enter such a state. cpuidle-psci-domain.c
takes care of this IIUC. Ulf can provide details if you are interested.

--
Regards,
Sudeep

