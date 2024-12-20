Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D51CE77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Dec 2024 11:28:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3lvWSXUpWgpwlqcJap0Ctxg3A9lUnCqq72k4C5g1cWk=; b=yc9eVvn4Wij4sycr7oEtWGaUGq
	w+SJpP26gS7wMmwB9iRZfssrvsdNm088aF9EGqIC7e3laqvpoy5ZfbqJkQkh58Kf4pdX0gK7mITFk
	uHPlGmJyVY/imbcvIzIva4HXThNt/iX7ux+hXfPnQyYJPRpfqx4SbfFwHfpukQYJLb7Es8zurMlm8
	iJz8VxOvdTzqY3y/sS5mVlQe1nIrthwMgKgQT806YfDSVoL1kQ4zPvXYM/PBWbt0GRePTJwyrwY66
	c404isPHrLssmSoYIi/BjeF7bBRUPVRw9WdgDvtJDTDeZKM2RP3fQ3k/IuTGLM90dTPSQqFaegmPt
	BZshvKHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tObB9-00000004ljo-2hgR;
	Fri, 20 Dec 2024 11:28:23 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOb9z-00000004lX4-2Av1
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Dec 2024 11:27:12 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CFB221480;
	Fri, 20 Dec 2024 03:27:36 -0800 (PST)
Received: from bogus (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D60593F58B;
	Fri, 20 Dec 2024 03:27:06 -0800 (PST)
Date: Fri, 20 Dec 2024 11:27:04 +0000
From: Sudeep Holla <sudeep.holla@arm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Subject: Re: [PATCH 1/3] dt-bindings: arm,psci: Allow S2RAM power_state
 parameter description
Message-ID: <Z2VUiHWHgbWowdal@bogus>
References: <20241028-topic-cpu_suspend_s2ram-v1-0-9fdd9a04b75c@oss.qualcomm.com>
 <20241028-topic-cpu_suspend_s2ram-v1-1-9fdd9a04b75c@oss.qualcomm.com>
 <Z1LQOmEfFy640PjG@bogus>
 <54cc4221-ba5f-4741-9033-20874265ca01@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <54cc4221-ba5f-4741-9033-20874265ca01@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241220_032711_652873_CDBE9408 
X-CRM114-Status: GOOD (  32.58  )
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

On Thu, Dec 19, 2024 at 08:43:27PM +0100, Konrad Dybcio wrote:
> On 6.12.2024 11:21 AM, Sudeep Holla wrote:
> > On Mon, Oct 28, 2024 at 03:22:57PM +0100, Konrad Dybcio wrote:
> >> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> >>
> >> Certain firmware implementations (such as the ones found on Qualcomm
> >> SoCs between roughly 2015 and 2023) expose an S3-like S2RAM state
> >> through the CPU_SUSPEND call, as opposed to exposing PSCIv1.0's
> >> optional PSCI_SYSTEM_SUSPEND.
> >>
> > 
> > If so, can you elaborate why s2idle doesn't work as an alternative to what
> > you are hacking up here.
> 
> Please see other branches of this thread
> 
> > 
> >> This really doesn't work well with the model where we associate all
> >> calls to CPU_SUSPEND with cpuidle. Allow specifying a single special
> >> CPU_SUSPEND suspend parameter value that is to be treated just like
> >> SYSTEM_SUSPEND from the OS's point of view.
> >>
> >> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> >> ---
> >>  Documentation/devicetree/bindings/arm/psci.yaml | 6 ++++++
> >>  1 file changed, 6 insertions(+)
> >>
> >> diff --git a/Documentation/devicetree/bindings/arm/psci.yaml b/Documentation/devicetree/bindings/arm/psci.yaml
> >> index cbb012e217ab80c1ca88e611e7acc06c6d56fad0..a6901878697c8e1ec1cbfed62298ae3bc58f2501 100644
> >> --- a/Documentation/devicetree/bindings/arm/psci.yaml
> >> +++ b/Documentation/devicetree/bindings/arm/psci.yaml
> >> @@ -98,6 +98,12 @@ properties:
> >>        [1] Kernel documentation - ARM idle states bindings
> >>          Documentation/devicetree/bindings/cpu/idle-states.yaml
> >>  
> >> +  arm,psci-s2ram-param:
> >> +    $ref: /schemas/types.yaml#/definitions/uint32
> >> +    description:
> >> +      power_state parameter denoting the S2RAM/S3-like system suspend state
> > 
> > Yet another NACK as this corresponds to PSCI SYSTEM_SUSPEND and as per
> > specification it takes no such parameter. This is just misleading.
> > 
> 
> Yeah PSCI_SYSTEM_SUSPEND takes care of this on platforms that expose it.
>

And those that don't advertise/expose don't get to use, simple.

> DEN0022F.b Section 6.5. recommends that CPU_SUSPEND StateID includes
> a field for system-level power down states. This binding change only
> adds a way for DT-based platforms to associate such state with S2RAM
> suspend.
>

Sure, just use the CPU_SUSPEND bindings that already exist. No need to
define this as some special case if it is exposed as CPU_SUSPEND idle
state. Not sure why you want to do it differently. I understand the
need to handle it different in the kernel, but I don't understand to
define the new bindings for that. Just use the existing bindings for the
idle states. Again I see no exception for this case.

> That may be a bit Linux-specific whereas bindings are supposed to be
> OS-agnostic, but since we effectively want one PSCI state for deep
> suspend regardless of the OS, I would think this kind of hint is fine.
>

Exactly, that's the reason for not changing this into special case and
special binding for that special case created.

--
Regards,
Sudeep

