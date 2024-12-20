Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4E62E77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Dec 2024 14:10:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jTxbJCi9/zDDg5XgKoXZDzE87MYo+gwANixgRPH2ZX8=; b=kBAabAhivZRXC55hGd5/QR0Ei8
	Y7Ql3KTMYuwMtZZ9SrbSh+yJCbVC5pEF3Y2BCtyVoQjhXxHHKkZbn1qlsjjLxQBnX+qfgURJ3g0Ft
	pE4wNfQzIMX2ftHZQYsBjlJB4V/2F36V/nkQR62PExpxrPjiPykVMy7tBMdKmCTdd/qeo124b0urn
	m0IjAdnUIe8xJA15pevp1k4gIwckysX8yZSovP0TwIH0jr1X33Dq4rMkR5AqV7M4KkVqtCYK4wddd
	eag7+RbCwaw5bN4XA3heXbpe+5kasnNCI4Yu7typZ7HwHgLrCExDDsEVspW38kvSWbkR8Pk1oQTVM
	ZNgiUwxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOdhU-000000056My-0O3I;
	Fri, 20 Dec 2024 14:09:56 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOdTz-000000054Ec-3m2e
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Dec 2024 13:56:01 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EAA231480;
	Fri, 20 Dec 2024 05:56:26 -0800 (PST)
Received: from bogus (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1CC9F3F720;
	Fri, 20 Dec 2024 05:55:56 -0800 (PST)
Date: Fri, 20 Dec 2024 13:55:54 +0000
From: Sudeep Holla <sudeep.holla@arm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Subject: Re: [PATCH 1/3] dt-bindings: arm,psci: Allow S2RAM power_state
 parameter description
Message-ID: <Z2V3amqWYDUWA2uM@bogus>
References: <20241028-topic-cpu_suspend_s2ram-v1-0-9fdd9a04b75c@oss.qualcomm.com>
 <20241028-topic-cpu_suspend_s2ram-v1-1-9fdd9a04b75c@oss.qualcomm.com>
 <Z1LQOmEfFy640PjG@bogus>
 <54cc4221-ba5f-4741-9033-20874265ca01@oss.qualcomm.com>
 <Z2VUiHWHgbWowdal@bogus>
 <349bac70-87e0-4870-a3f0-9f6a3b3e6824@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <349bac70-87e0-4870-a3f0-9f6a3b3e6824@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241220_055600_026711_109972C4 
X-CRM114-Status: GOOD (  24.97  )
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

On Fri, Dec 20, 2024 at 01:54:45PM +0100, Konrad Dybcio wrote:
> On 20.12.2024 12:27 PM, Sudeep Holla wrote:
> > On Thu, Dec 19, 2024 at 08:43:27PM +0100, Konrad Dybcio wrote:
> >> On 6.12.2024 11:21 AM, Sudeep Holla wrote:
> >>> On Mon, Oct 28, 2024 at 03:22:57PM +0100, Konrad Dybcio wrote:
> >>>> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> >>>>
> >>>> Certain firmware implementations (such as the ones found on Qualcomm
> >>>> SoCs between roughly 2015 and 2023) expose an S3-like S2RAM state
> >>>> through the CPU_SUSPEND call, as opposed to exposing PSCIv1.0's
> >>>> optional PSCI_SYSTEM_SUSPEND.
> >>>>
> >>>
> >>> If so, can you elaborate why s2idle doesn't work as an alternative to what
> >>> you are hacking up here.
> >>
> >> Please see other branches of this thread
> >>
> >>>
> >>>> This really doesn't work well with the model where we associate all
> >>>> calls to CPU_SUSPEND with cpuidle. Allow specifying a single special
> >>>> CPU_SUSPEND suspend parameter value that is to be treated just like
> >>>> SYSTEM_SUSPEND from the OS's point of view.
> >>>>
> >>>> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> >>>> ---
> >>>>  Documentation/devicetree/bindings/arm/psci.yaml | 6 ++++++
> >>>>  1 file changed, 6 insertions(+)
> >>>>
> >>>> diff --git a/Documentation/devicetree/bindings/arm/psci.yaml b/Documentation/devicetree/bindings/arm/psci.yaml
> >>>> index cbb012e217ab80c1ca88e611e7acc06c6d56fad0..a6901878697c8e1ec1cbfed62298ae3bc58f2501 100644
> >>>> --- a/Documentation/devicetree/bindings/arm/psci.yaml
> >>>> +++ b/Documentation/devicetree/bindings/arm/psci.yaml
> >>>> @@ -98,6 +98,12 @@ properties:
> >>>>        [1] Kernel documentation - ARM idle states bindings
> >>>>          Documentation/devicetree/bindings/cpu/idle-states.yaml
> >>>>
> >>>> +  arm,psci-s2ram-param:
> >>>> +    $ref: /schemas/types.yaml#/definitions/uint32
> >>>> +    description:
> >>>> +      power_state parameter denoting the S2RAM/S3-like system suspend state
> >>>
> >>> Yet another NACK as this corresponds to PSCI SYSTEM_SUSPEND and as per
> >>> specification it takes no such parameter. This is just misleading.
> >>>
> >>
> >> Yeah PSCI_SYSTEM_SUSPEND takes care of this on platforms that expose it.
> >>
> >
> > And those that don't advertise/expose don't get to use, simple.
>
> The spec says:
>
> "The call is equivalent to using the CPU_SUSPEND call for the
> deepest possible platform powerdown state."
>

Please take a look at the preconditions for both the calls. They are
different.

--
Regards,
Sudeep

