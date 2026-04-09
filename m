Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40110EA3C5F
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Apr 2026 13:36:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4q98U3K1TmWYHQA9TQnuPqcT5jcbNJzk2jJe5L1liLg=; b=hzOaRAOd6qgG2meaHbpNH60u55
	8Om/O58R4fV2Jv14aIPfs6EIS69dK5WnPECMO9JCKZ+c4IAb1DgAhCuncfsgCvE/YiHv6E5fh8KVk
	GKlmtHAZfqfItjiYob93mRoXanDrtExs+3xVjrWBhrWiuI8+QUN9zVmUCzyqvvlg8hlmKX88dv05L
	YJGE1UT4gr+/fQS/1hJtGXAs0csaM2QTvaLRRESxLimAFiA7hA6tjGV68OR5h8149Nl38Mc7mwW3t
	WOim8h3KaFuVVZezy6ag/317cnSFOi37OQGLuqfs8y0NWanUcLdtG6f1YdSl6HcZmPzzQG1if8s/T
	I9jQbToA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wApY4-0000000AX9d-0vKd;
	Thu, 09 Apr 2026 13:35:56 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wApY2-0000000AX9G-1lI7
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Apr 2026 13:35:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 67FBE409C0;
	Thu,  9 Apr 2026 13:35:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24461C4CEF7;
	Thu,  9 Apr 2026 13:35:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775741752;
	bh=MWnfDUX5Bn1amz9RWj+IvqpmjxnGH9WloQN74pV7aos=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ir/bjUW9ThRhaZ203luNRVUsqGSeIUoUU8tPBLVV5ANuPqk/k7JlZVBb/Ns8U9dMB
	 HJGs52+D01DoLh7gVyZTGuF4Ru1SNXfCPC3SMyXPx5vAMLF7qNJNEvQVI20VF6MglW
	 iudkSFtfG4LeyqvRYqyLTYcaAL1KcvxJElPrmwsOg803b6DOdXu4CIs022WwhP0ytJ
	 lBvCwRfx89GEbfJAJ6bsIHoWZUcdA8huRgoy9r7P4uJM7upGKGrMcu+dJs0UB3mRWN
	 GQ3RPgwmWuSzJFx7RE91wPxdYcsd8LWR0JlQktEOlDoVSCT6mAHEiCIr8de//yssjs
	 Vc+nGmeI0QGEQ==
Date: Thu, 9 Apr 2026 08:35:48 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Ayushi Makhija <quic_amakhija@quicinc.com>
Cc: konrad.dybcio@linaro.org, robh+dt@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, dmitry.baryshkov@linaro.org, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, quic_rajeevny@quicinc.com, quic_vproddut@quicinc.com
Subject: Re: [PATCH] arm64: dts: qcom: sm8750-mtp: Set sufficient voltage for
 panel nt37801
Message-ID: <adeq_lGG0x3sekUU@baldur>
References: <20260323102229.1546504-1-quic_amakhija@quicinc.com>
 <acHwvzjcvqNxUjm3@baldur>
 <ccb11c2a-4cf1-4486-be71-d4bcc983cee6@quicinc.com>
 <acVWseivbxLQ_uDM@baldur>
 <75d22f54-eb55-4e55-9582-5b407f41ee81@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <75d22f54-eb55-4e55-9582-5b407f41ee81@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260409_063554_572444_FBF1F28C 
X-CRM114-Status: GOOD (  28.75  )
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

On Thu, Apr 09, 2026 at 11:14:10AM +0530, Ayushi Makhija wrote:
> On 3/26/2026 9:28 PM, Bjorn Andersson wrote:
> > On Thu, Mar 26, 2026 at 03:06:52PM +0530, Ayushi Makhija wrote:
> >> On 3/24/2026 7:34 AM, Bjorn Andersson wrote:
> >>> On Mon, Mar 23, 2026 at 03:52:29PM +0530, Ayushi Makhija wrote:
> >>>> The NT37801 Sepc V1.0 chapter "5.7.1 Power On Sequence" states
> >>>> VDDI=1.65V~1.95V, so set sufficient voltage for panel nt37801.
> >>>>
> >>>
> >>> Please add Fixes: tag.
> >>>
> >>
> >> Hi Bjorn,
> >>
> >> Sure, will add in new patchset.
> >>
> >>>> Signed-off-by: Ayushi Makhija <quic_amakhija@quicinc.com>
> >>>
> >>> Please start using your oss.qualcomm.com address.
> >>>
> >>>> ---
> >>>>  arch/arm64/boot/dts/qcom/sm8750-mtp.dts | 2 +-
> >>>>  1 file changed, 1 insertion(+), 1 deletion(-)
> >>>>
> >>>> diff --git a/arch/arm64/boot/dts/qcom/sm8750-mtp.dts b/arch/arm64/boot/dts/qcom/sm8750-mtp.dts
> >>>> index 3837f6785320..6ba4e69bf377 100644
> >>>> --- a/arch/arm64/boot/dts/qcom/sm8750-mtp.dts
> >>>> +++ b/arch/arm64/boot/dts/qcom/sm8750-mtp.dts
> >>>> @@ -462,7 +462,7 @@ vreg_l11b_1p0: ldo11 {
> >>>>  
> >>>>  		vreg_l12b_1p8: ldo12 {
> >>>>  			regulator-name = "vreg_l12b_1p8";
> >>>> -			regulator-min-microvolt = <1200000>;
> >>>> +			regulator-min-microvolt = <1650000>;
> >>>
> >>> Are you sure it's not supposed to be 1.8V, given the name of the rail?
> >>>
> >>> Regards,
> >>> Bjorn
> >>
> >> There was already discussion regarding the minimum voltage for this regulator on sm8550 target
> >> on other upstream patch. 
> >>
> >> Link: https://lore.kernel.org/all/aQQdQoCLeKhYtY7W@yuanjiey.ap.qualcomm.com/
> >>
> >> This values is according to the NT37801 panel sec
> >> "The NT37801 Sepc V1.0 chapter "5.7.1 Power On Sequence" states 
> >> VDDI=1.65V~1.95V."
> >>
> > 
> > Yes, so the panel requires 1.65V, so regulator-min-microvolt needs to be
> > at least that. But regulator-min-microvolt should account for all the
> > consumers of the rail, are there any others?
> > 
> > Which leads me to my question, the people designing the board named the
> > rail VREG_L12B_1P8 in the schematics, why didn't they name it
> > VREG_L12B_1P65?
> > 
> > Please check all the consumers and make the regulator-min-microvolt work
> > for all of them - if that's 1.65V, then your change is good.
> > 
> > Regards,
> > Bjorn
> 
> Hi Bjorn,
> 
> There is only one consumer of VREG_L12B_1P8 rail, i.e. NT37801 panel.
> So regulator-min-microvolt as 1.65V should be fine for VREG_L12B_1P8 rail.
> 

Had to look it up myself. MTP power grid says it should be 1.8V.

Thank you,
Bjorn

> Thanks,
> Ayushi
> 

