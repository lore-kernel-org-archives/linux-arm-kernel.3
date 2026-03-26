Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6794910A88E1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Mar 2026 15:58:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8hjbkzpYN6SEyYHTqhvZQT64dEOhLI3aoAivH4zr/qc=; b=soJ6Z1+LxASbhm22lMtvUqMFAk
	kLngdJIUDgpWoOdSEUPcgXBClFfgpJMnf4Fu+kbcBrKUSltdwHaWd2EBTHTn9bsDp+WyH8xBqASOO
	C34tCtgmBNF8Igh5ksqiw/45A3w5aTub+uemDS+ExVvFy+4Yn6bWcAzm3JTv3XQu9MFVpbsDSmIc+
	gsy3Xi3Mn7XVCrTGk8e9TAHsh8ffZCTQPhMb5N1Bro7XwVSywKw6UdZOclgX2IBut5kQCfhG/b5a3
	pAojGrkGQXGXAUOtdK98UzFtVUeG4LFshD2rP6tfmq/m/EGUf4mO6FiBHqj5KTdDOiYdzNljGVPAw
	1Prb53wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5n6i-00000005oMs-1IMz;
	Thu, 26 Mar 2026 15:58:52 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5n6f-00000005oM8-2XjG
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Mar 2026 15:58:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id F2CF843C57;
	Thu, 26 Mar 2026 15:58:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01FFDC116C6;
	Thu, 26 Mar 2026 15:58:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774540728;
	bh=tTQxD9EHRYahV5vajLwoH5cOmwDwYqTZzE3aTrnmmRA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BAcWM7ct+tSe96JXMXQjjuR+xRmsdakYqdUam7sAe1arIjeds+uoCtqwyQEcnIwRm
	 oddaBY8DCQZMFEmELY6vZXE18Hh4Hp/gHAEjydww9YpcK3OfHb7OQot5VlMtVUEQlj
	 yS5mxCVqf6t6luH62UWpXv2e3AP9Ro6DkJ7Fa+rw5/rDi0deE/gIE25empz+u2mTZT
	 77IMGTOkIvrEsbnJs7pQImnJiaEZAjkISToUzlxFFR1t3+2EqIprUULe3I39IQlDNL
	 KposIUGT64pgRYNa9w0hhwRwBl8ZnKwDoBdM51MZzhorgldWQWp+QuD+4ur1MOXKJ/
	 gLEJIvjbsTQQQ==
Date: Thu, 26 Mar 2026 10:58:45 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Ayushi Makhija <quic_amakhija@quicinc.com>
Cc: konrad.dybcio@linaro.org, robh+dt@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, dmitry.baryshkov@linaro.org, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, quic_rajeevny@quicinc.com, quic_vproddut@quicinc.com
Subject: Re: [PATCH] arm64: dts: qcom: sm8750-mtp: Set sufficient voltage for
 panel nt37801
Message-ID: <acVWseivbxLQ_uDM@baldur>
References: <20260323102229.1546504-1-quic_amakhija@quicinc.com>
 <acHwvzjcvqNxUjm3@baldur>
 <ccb11c2a-4cf1-4486-be71-d4bcc983cee6@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ccb11c2a-4cf1-4486-be71-d4bcc983cee6@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260326_085849_684327_54F53A06 
X-CRM114-Status: GOOD (  23.58  )
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

On Thu, Mar 26, 2026 at 03:06:52PM +0530, Ayushi Makhija wrote:
> On 3/24/2026 7:34 AM, Bjorn Andersson wrote:
> > On Mon, Mar 23, 2026 at 03:52:29PM +0530, Ayushi Makhija wrote:
> >> The NT37801 Sepc V1.0 chapter "5.7.1 Power On Sequence" states
> >> VDDI=1.65V~1.95V, so set sufficient voltage for panel nt37801.
> >>
> > 
> > Please add Fixes: tag.
> > 
> 
> Hi Bjorn,
> 
> Sure, will add in new patchset.
> 
> >> Signed-off-by: Ayushi Makhija <quic_amakhija@quicinc.com>
> > 
> > Please start using your oss.qualcomm.com address.
> > 
> >> ---
> >>  arch/arm64/boot/dts/qcom/sm8750-mtp.dts | 2 +-
> >>  1 file changed, 1 insertion(+), 1 deletion(-)
> >>
> >> diff --git a/arch/arm64/boot/dts/qcom/sm8750-mtp.dts b/arch/arm64/boot/dts/qcom/sm8750-mtp.dts
> >> index 3837f6785320..6ba4e69bf377 100644
> >> --- a/arch/arm64/boot/dts/qcom/sm8750-mtp.dts
> >> +++ b/arch/arm64/boot/dts/qcom/sm8750-mtp.dts
> >> @@ -462,7 +462,7 @@ vreg_l11b_1p0: ldo11 {
> >>  
> >>  		vreg_l12b_1p8: ldo12 {
> >>  			regulator-name = "vreg_l12b_1p8";
> >> -			regulator-min-microvolt = <1200000>;
> >> +			regulator-min-microvolt = <1650000>;
> > 
> > Are you sure it's not supposed to be 1.8V, given the name of the rail?
> > 
> > Regards,
> > Bjorn
> 
> There was already discussion regarding the minimum voltage for this regulator on sm8550 target
> on other upstream patch. 
> 
> Link: https://lore.kernel.org/all/aQQdQoCLeKhYtY7W@yuanjiey.ap.qualcomm.com/
> 
> This values is according to the NT37801 panel sec
> "The NT37801 Sepc V1.0 chapter "5.7.1 Power On Sequence" states 
> VDDI=1.65V~1.95V."
> 

Yes, so the panel requires 1.65V, so regulator-min-microvolt needs to be
at least that. But regulator-min-microvolt should account for all the
consumers of the rail, are there any others?

Which leads me to my question, the people designing the board named the
rail VREG_L12B_1P8 in the schematics, why didn't they name it
VREG_L12B_1P65?

Please check all the consumers and make the regulator-min-microvolt work
for all of them - if that's 1.65V, then your change is good.

Regards,
Bjorn

> Thanks,
> Ayushi
> 
> >>  			regulator-max-microvolt = <1800000>;
> >>  			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> >>  			regulator-allow-set-load;
> >> -- 
> >> 2.34.1
> >>
> 

