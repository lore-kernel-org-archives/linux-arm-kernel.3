Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E6BEC282EC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Mar 2025 19:00:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7g+xe8Fc3+vfeUJVNKqRxi0ScAvXg4py07p3iJiGIRY=; b=rYYuIYGUd4HUi0pvnB2vyfIdWu
	yFgiiJmCSzZQh5CMu1C0NAKkflxvEyPGSNeL9kFXMpac68kR0ZJvC9MCrxctKojZC+E0NHkjLquQ2
	SIzsvrcJnwnpQ5Bhq5ojmaj+fQIdR7eOEn30o0RWzUqarw/rmez70uN7/djgD3tszbKVHKG4PkBeK
	abh/8G/sxnpZzrzwlhXmcF1qmBA4UP14UhXeOoMQpJiUT1LpIFprFAdWJLONYR1gVJ0PvOqKRqmhT
	DUceD1nshkBJjQT2IZgZuloWmQBrRcAjY1qmoTbmdpKz9okTvjtuDwov++jVd7EHakZC2T+oPRpuP
	Uwr1niTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ts4q8-00000006hfh-0p1V;
	Tue, 11 Mar 2025 19:00:32 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ts4nk-00000006hH6-1KKH
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Mar 2025 18:58:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 588F3A4618D;
	Tue, 11 Mar 2025 18:52:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28BB7C4CEE9;
	Tue, 11 Mar 2025 18:58:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741719483;
	bh=H0YUnZgn3kS4q5aJPaCCPyYjqRuXp8gJMQR2aHdY/es=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jSIpiGJkXaaT1eLewPodBpgE2myV2gEwryf8sM0z2NCOPmK4ybjEWcSaDurh8eXCq
	 BVlp7eJ2pU7YvrR981J/CW/c47J3RaqWLGL6gnKRpmpf4l1/sfPoVk8perJZMRKeOB
	 6wken0eVXJkeAShl07IPP1/WFlr1bwURwRC5GaDG62LvdgMlxicExbouMvQ4xc6rTW
	 4nA5iDzt3MFYyR8ysNuNlSLVj8KwkItxudg5jw+8P5WKRa285/q2hiAFbBzkYMWih4
	 TUHKibEfBKwIqbH3vBPkSk2COFw21jsMhBPVPbTk3FhEivtGw9VW1qmJKWwyLcGCmn
	 JX+aHhgXnXiZA==
Date: Tue, 11 Mar 2025 20:57:58 +0200
From: Dmitry Baryshkov <lumag@kernel.org>
To: Christopher Obbard <christopher.obbard@linaro.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH] arm64: defconfig: Enable Qualcomm interconnects as
 built-in
Message-ID: <uljqxwfgl26txrfqvkvzzpj6qurgmwcbuot7gu2u6rwjaqgncb@jeuyi4mexjff>
References: <20250311-wip-obbardc-qcom-defconfig-interconnects-builtin-v1-1-675b6bc57176@linaro.org>
 <CACr-zFC=mPNeeHMp9XnSby+cMQaPWt_3s8iUiCN+EnVPeGad8Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACr-zFC=mPNeeHMp9XnSby+cMQaPWt_3s8iUiCN+EnVPeGad8Q@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250311_115804_488823_AEB6C56C 
X-CRM114-Status: GOOD (  25.90  )
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

On Tue, Mar 11, 2025 at 07:10:06PM +0100, Christopher Obbard wrote:
> I sent this patch to start the discussion, some things I found:
> 
> 1) Some interconnects are missing from arm defconfig. Should they be =y too ?

No, unless those are required for the UART console.

> $ grep CONFIG_INTERCONNECT_QCOM arch/arm/configs/qcom_defconfig
> CONFIG_INTERCONNECT_QCOM=y
> CONFIG_INTERCONNECT_QCOM_MSM8974=m
> CONFIG_INTERCONNECT_QCOM_SDX55=m
> 
> 2) Some interconnects are missing from arm64 defconfig (which should
> probably be in there) (I have included just two examples):

I think `git log -S CONFIG_INTERCONNECT_QCOM
arch/arm64/configs/defconfig` will answer this question. The drivers are
enabled on the premises of being required for a particular device, not
because they exist in the Linux kernel.

> $ grep CONFIG_INTERCONNECT drivers/interconnect/qcom/Makefile
> obj-$(CONFIG_INTERCONNECT_QCOM_QCS615) += qnoc-qcs615.o
> obj-$(CONFIG_INTERCONNECT_QCOM_SM7150) += qnoc-sm7150.o
> 
> I can handle these in follow-up or v2 of the patchset as follow-up
> commits, please let me know what you'd prefer.
> 
> On Tue, 11 Mar 2025 at 19:03, Christopher Obbard
> <christopher.obbard@linaro.org> wrote:
> >
> > Currently some Qualcomm interconnect drivers are enabled
> > as modules which isn't overly useful since the interconnects
> > are required to be loaded during early boot.
> >
> > Loading the interconnects late (e.g. in initrd or as module)
> > can cause boot issues, such as slowdown or even not booting
> > at all (since the interconnect would be required for storage
> > devices).
> >
> > Be consistent and enable all of the Qualcomm interconnect
> > drivers as built-in to the kernel image.
> >
> > Signed-off-by: Christopher Obbard <christopher.obbard@linaro.org>
> > ---
> >  arch/arm64/configs/defconfig | 6 +++---
> >  1 file changed, 3 insertions(+), 3 deletions(-)
> >
> > diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
> > index 219ef05ee5a757c43a37ec9f8571ce9976354830..6582baee2ab02ecb2ff442c6e73aa6a23fee8d7f 100644
> > --- a/arch/arm64/configs/defconfig
> > +++ b/arch/arm64/configs/defconfig
> > @@ -1656,11 +1656,11 @@ CONFIG_INTERCONNECT_IMX8MN=m
> >  CONFIG_INTERCONNECT_IMX8MQ=m
> >  CONFIG_INTERCONNECT_IMX8MP=y
> >  CONFIG_INTERCONNECT_QCOM=y
> > -CONFIG_INTERCONNECT_QCOM_MSM8916=m
> > +CONFIG_INTERCONNECT_QCOM_MSM8916=y
> >  CONFIG_INTERCONNECT_QCOM_MSM8996=y
> > -CONFIG_INTERCONNECT_QCOM_OSM_L3=m
> > +CONFIG_INTERCONNECT_QCOM_OSM_L3=y
> >  CONFIG_INTERCONNECT_QCOM_QCM2290=y
> > -CONFIG_INTERCONNECT_QCOM_QCS404=m
> > +CONFIG_INTERCONNECT_QCOM_QCS404=y
> >  CONFIG_INTERCONNECT_QCOM_QCS615=y
> >  CONFIG_INTERCONNECT_QCOM_QCS8300=y
> >  CONFIG_INTERCONNECT_QCOM_QDU1000=y
> >
> > ---
> > base-commit: b098bcd8278b89cb3eb73fdb6e06dc49af75ad37
> > change-id: 20250311-wip-obbardc-qcom-defconfig-interconnects-builtin-258fcc961b11
> >
> > Best regards,
> > --
> > Christopher Obbard <christopher.obbard@linaro.org>
> >

-- 
With best wishes
Dmitry

