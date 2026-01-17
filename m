Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E830ACA5FE1
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 17 Jan 2026 21:51:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=I1PliijQM6d2RaOQmu7YBFJk6r5mmdWAyzqOF7mUGUw=; b=uFscACTZavZb7uVOUdmnp/BOrY
	CC6+tG5adOsyQuAT8XmNElboJnweoVU4uzQ+g85dwarySPZTs8RpIPAcg91t2sd7JBlVKqg1xqpaS
	wuvFmoAHngqA+3y+NdZti9CCeiuEDq5pTCql1r/CW2QP7rgaf9jZIf1z3i11wMO+woWVFjwr46Z3N
	bYFp9KTA/TFnIOWu4hvuTgfqkZLuAPbdAugvofbBFqu+0HBYTy54IYCURPnq3I4i5YcIEgAmPTyle
	O9JBpUvSBI5NR0zvuFEVnfAyeRP1atzOqB0ijv1gpSrvk/EMzaILu4ZtWS2mXyXF3reTsqVxGm6qC
	ymSiP+hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhECv-0000000G2Wp-2MTa;
	Sat, 17 Jan 2026 21:51:45 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhECt-0000000G2WF-2P00
	for linux-arm-kernel@lists.infradead.org;
	Sat, 17 Jan 2026 21:51:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C4B3143BD5;
	Sat, 17 Jan 2026 21:51:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12997C4CEF7;
	Sat, 17 Jan 2026 21:51:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768686702;
	bh=b/0coEcvYCaguhsk+YDhiScezyJeihutu1g5DzC6wDU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Z5dyYsaB11Qm+4R8fcqD9BQARxzQihhkx8AO77fVZ+c2YZam2ctzR3ILV8wDYT+4j
	 Qxt5AlavAN3bX8OSanlR4wyUwV3lgqd1W/nLLRzMsGaRBWEfEhgBUk/3li9hXxfuTz
	 SCu16f+op8gFzDUl4kgqyGeDfvuEQ9eSH4tfYqQQM1rdS5r754YqTq0K40Z2wxKu93
	 XftjVvFxzwObGG8whMqfWeRt8mZGK2RewkHfdQoiSguebIsvkjCh758Hm/lfD6z4Fc
	 z26lD77qUn7Tvqxcb3Ef092hvC/LfRN5wEty/YAFsWzQs533Tq8AiA4zgoJdRHSczh
	 oEN0xajDq2SZw==
Date: Sat, 17 Jan 2026 15:51:40 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Satya Durga Srinivasu Prabhala <satya.prabhala@oss.qualcomm.com>
Cc: Sudeep Holla <sudeep.holla@arm.com>, 
	Mark Rutland <mark.rutland@arm.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, trilok.soni@oss.qualcomm.com
Subject: Re: [PATCH] firmware: smccc: default ARM_SMCCC_SOC_ID to disabled
Message-ID: <mty6ycfsugaheljicomeucsak7ziakftf22cnikinla7hvthax@f6yu4pmrpuvp>
References: <20260112-disable_smccc_soc_id-v1-1-a5bee24befb4@oss.qualcomm.com>
 <aWY6kx8Bwa_2azIl@bogus>
 <86331062-301b-40b1-9df1-78f7751508b4@oss.qualcomm.com>
 <aWgEDAlglnGrzdR4@bogus>
 <4fab824f-8067-49d7-8e6c-dedd67a8454d@oss.qualcomm.com>
 <aWoVR4oNdIHnksJQ@bogus>
 <92d90a1e-e993-4044-b152-83a8700f7b63@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <92d90a1e-e993-4044-b152-83a8700f7b63@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260117_135143_658344_07B31F40 
X-CRM114-Status: GOOD (  11.07  )
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

On Fri, Jan 16, 2026 at 12:53:18PM -0800, Satya Durga Srinivasu Prabhala wrote:
> Hello Sudeep,
> 
> Thanks for the discussion & feedback.
> 
> Wanted to check on below possibilities to disable the SMCCC SOC ID at the
> vendor end, can you help comment?
> 1. Introduce cmdline option
>    We are trying to pursue that in Android Kernel -
> https://android-review.googlesource.com/c/kernel/common/+/3912874
> 2. Mark SMCCC SMC ID driver as tristate & module as suggested by Dmitry

What happens when I boot a system with module autoloading?

What is the expected behavior of userspace when it faces two soc nodes?

Regards,
Bjorn

