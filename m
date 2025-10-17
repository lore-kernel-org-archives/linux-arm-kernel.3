Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 792C7CCD199
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Oct 2025 21:45:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=deMYrW1BM6i4qXR8M3YZRqz7KEvJJYcTHdMKzMmhdMU=; b=bEmxoXiVXkJ2tWo5kpRlrQhIau
	IUn8b4Ufgi1LqLQA55fJaN8N+PNcMxAvhLpKerEV3qFYiAW1XICtmDkMAwZ2etfn8Nnm9zj1gSslS
	PZi+W3KDtGvumLqWS5N5ozfEerFgoF1O6YCQcC50Qsqjp8Ts+n/T8oatvmdkbktvMlCOc/m9u0GeU
	r3MjHg+WH19Ye8JcGNd9DZuNwOOcbWuMyqD9UALXAgwUZRbdX+4yWS0Qrvwv1ySsa1K6QSRTZNkAf
	hPqt+s5PVBnqo9MojZRvO2ydXCz0TRucg5Z8pXXCJN6s+le9Yc9DTknmlxFstJR9SQ7ZFiMrufq6P
	uh4okyog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9sGX-000000094rz-29Pi;
	Fri, 17 Oct 2025 21:45:37 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9sGV-000000094rf-09Ju
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Oct 2025 21:45:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 100F741964;
	Fri, 17 Oct 2025 21:45:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46BE1C4CEE7;
	Fri, 17 Oct 2025 21:45:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760737533;
	bh=uv2XPBC/cnKDym2sM5IK4ykoNBOphBVup4qIH3RplsA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qMHmEEe8bXw2bvDmuxOq743Nhu0fgJe5Ndh5jwpqyGLV9AjbKFpm2zh/zZzXcruzP
	 zg+F9ZybINmwTqCR5iskrHcuFWmd8ow+hl9n4PWULTJsm0oO+LSpcIoEFn+nhLl8mT
	 Tby+mnmEh4FqrM+p9XQe38Oe1urPb5WrwaN650PMETdvewf2zQKhLm+3l7ugSwMgHC
	 t6m2yZ72qeagrkDahGIPA/smKJrkqIB0tbqdO5fFtjhYdB1bmRHcKOWl6SCVL2GZu9
	 jn/wlTdWJEQH5tjtVPQw1QH47FhPNsTUyys2PU/EeXRxaBWxKPZll8PSAiypzqIpK8
	 /v0rhkc2U+FdA==
Date: Fri, 17 Oct 2025 14:47:27 -0700
From: Bjorn Andersson <andersson@kernel.org>
To: Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, 
	Taniya Das <quic_tdas@quicinc.com>, linux-arm-msm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Ajit Pandey <ajit.pandey@oss.qualcomm.com>, 
	Imran Shaik <imran.shaik@oss.qualcomm.com>, Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: defconfig: Change CONFIG_SM_TCSRCC_8750 from m to
 y
Message-ID: <ay4vqro266o7lk4xq3lpjjsviyllxoymfsl6gi3h6nhalsnkke@5gcpxdsgszhq>
References: <20251017-update_defconfig_tcsrcc_sm8750-v1-1-34b1b47a0bda@oss.qualcomm.com>
 <30390038-0f90-48a4-befe-475cf88ba1fb@kernel.org>
 <37f54b76-a274-4ce2-aaa9-88ba0eb84199@oss.qualcomm.com>
 <90c8dda3-f753-43dc-8bb9-d03a808c8704@kernel.org>
 <38b8468f-5006-46a3-a4ea-28e6692ef14a@quicinc.com>
 <03ac36fb-a227-438e-bdf6-f787e26008b3@kernel.org>
 <c4c907cd-ac5b-4ddc-96d4-aee840d98692@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c4c907cd-ac5b-4ddc-96d4-aee840d98692@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251017_144535_133198_EE5D6695 
X-CRM114-Status: GOOD (  34.44  )
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

On Fri, Oct 17, 2025 at 12:25:37PM +0530, Taniya Das wrote:
> 
> 
> On 10/17/2025 11:26 AM, Krzysztof Kozlowski wrote:
> > On 17/10/2025 07:49, Taniya Das wrote:
> >>
> >>
> >> On 10/17/2025 10:51 AM, Krzysztof Kozlowski wrote:
> >>> On 17/10/2025 07:16, Taniya Das wrote:
> >>>>
> >>>>
> >>>> On 10/17/2025 10:00 AM, Krzysztof Kozlowski wrote:
> >>>>> On 16/10/2025 20:53, Taniya Das wrote:
> >>>>>> The TCSR clock controller is required  during boot to provide the ref
> >>>>>> clocks to the UFS controller. Setting CONFIG_SM_TCSRCC_8750 to y ensures
> >>>>>> the UFS driver successfully probe and initialize the device.
> >>>>>>
> >>>>>> Without this change, the UFS subsystem fails to mount as a usable file
> >>>>>> system during boot.
> >>>>>
> >>>>>
> >>>>> That's not what I observed. UFS works fine, especially that it is a
> >>>>> module, so no, this is not a desired change and explanation is not only
> >>>>> insufficient but actually incorrect.
> >>>>>
> >>>>
> >>>> Krzysztof, on Pakala MTP we are observing the below issue and it
> >>>> requires the module of tscrcc to be loaded explicitly. This patch also
> >>>> aligns to how it is on all other targets.
> >>>>
> >>>> /soc@0/phy@1d80000: Failed to get clk index: 2 ret: -517
> >>>> [   10.496570] ufshcd-qcom 1d84000.ufs: freq-table-hz property not specified
> >>>> [   10.503660] ufshcd-qcom 1d84000.ufs: ufshcd_populate_vreg: Unable to
> >>>> find vdd-hba-supply regulator, assuming enabled
> >>>> [   10.514548] ufshcd-qcom 1d84000.ufs: ufshcd_populate_vreg: Unable to
> >>>> find vccq2-supply regulator, assuming enabled
> >>>> [   10.565955] platform 1d80000.phy: deferred probe pending: (reason
> >>>> unknown)
> >>>> [   10.573078] platform 1d84000.ufs: deferred probe pending:
> >>>> ufshcd-qcom: ufshcd_pltfrm_init() failed
> >>>>
> >>>
> >>>
> >>> I don't and I am testing regularly, so I assume you have incorrect
> >>> config. Maybe I have incorrect one (which works), but then commit msg is
> >>> incomplete - you must explain the bug and provide proof that this is the
> >>> correct fix for it.
> >>>
> >>
> >> We have tried booting up recently and and that is what we observed. The
> >> patch from 'm' to 'y' helps the UFS probe is successful and the rootfs
> >> is picked from ufs partitions. I will add these fail & success log
> >> snippets in the commit text.
> > 
> > That's not enough. You need to explain why UFS fails. After explaining
> > this, I guess bug in UFS would be exposed thus that one should be fixed.
> > You just provided band-aid without fixing the real problem.
> > 
> 
> When the kernel commandline uses is 'root=PARTLABEL=system', the  is a
> dependency of the UFS driver on the TCSRCC clockref during bootup and
> the TCSRCC made as a module will not provide the clocks unless we
> explicitly load the modules.

defconfig has CONFIG_SCSI_UFS_QCOM=m so your test system is obviously
loading some modules.

This implies that you're:
1) not packing the tcsrcc into your ramdisk, or
2) doing something non-standard in your ramdisk which breaks automatic module
   loading, or 
3) there's an actual issue somewhere causing the probe deferral not to
   happen

So, please look at your commit message and ask yourself *why* UFS
doesn't find the clock, *why* does =y help, etc?


We should only use =y for things required to reach and execute the
content of the ramdisk. As such, I agree with Krzysztof, this patch is
not correct.

Regards,
Bjorn

> To meet this dependency we need to load
> TCSRCC statically and move CONFIG_SM_TCSRCC_8750 from 'm' to 'y.
> This will help the UFS partitions to be identified and then the rootfs
> to be mounted from the partitions.
> 
> > NAK
> > 
> >>
> >> [    0.000000] Machine model: Qualcomm Technologies, Inc. SM8750 MTP
> >> ....
> >> [    3.133373] ufshcd-qcom 1d84000.ufs: freq-table-hz property not specified
> >> [    3.144480] ufshcd-qcom 1d84000.ufs: ufshcd_populate_vreg: Unable to
> >> find vdd-hba-supply regulator, assuming enabled
> >> [    3.144585] ufshcd-qcom 1d84000.ufs: ufshcd_populate_vreg: Unable to
> >> find vccq2-supply regulator, assuming enabled
> >> [    3.227770] ufshcd-qcom 1d84000.ufs: Resource ufs_mem not provided
> >> [    3.238319] ufshcd-qcom 1d84000.ufs: MCQ mode is disabled, err=-19
> > 
> > 
> > 
> > Best regards,
> > Krzysztof
> 
> -- 
> Thanks,
> Taniya Das
> 

