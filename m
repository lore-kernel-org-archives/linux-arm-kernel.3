Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AECCFC617E
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  3 Jan 2026 17:33:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PvDgJZSsGWUt9X6Xge2QDMXByM30IpD+igDRreYuqwM=; b=xDvqIMnys/UOI17QRp5pg2GU8L
	uRAoXwnC7itdWMDHvrCEdxP2HcXeUo5cleQi7A9KuWfBQ2DNfL/Ivlg9shBIHeJ6zA2XU+o+ec7Ky
	AaBQstkgRMke16vs26wrazMNxO+aHhfzkfhukPecBspjvRFBj9LQpz1w7URrMpfHqQwrii7xVY8iZ
	Oc5K+052E0WC+yC4lf4oSxVI+vJbGQlkuRk5qcVrRJYGYcb+YYg0vwwWseO6bLZ5ddYsfttT5owVb
	3Rh0XuFdUQCGwRwzYCb16ic9g1MtGDPJq4A1iJn/LxzM/wbpCgwNBbTknsg0cV5nY+SVdbipWsCPY
	6TBWdxyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vc5Uy-00000009fj9-2HSc;
	Sat, 03 Jan 2026 17:33:08 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vc5Uv-00000009fil-1DUB
	for linux-arm-kernel@lists.infradead.org;
	Sat, 03 Jan 2026 17:33:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 5516C400DC;
	Sat,  3 Jan 2026 17:33:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ADDF0C113D0;
	Sat,  3 Jan 2026 17:33:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767461584;
	bh=iFuAMR8Cy8xCV1l5qP2ufkm0oszRW7MT41boaDMKRQc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Xp+WCPqdDf4gJb/T4X7Cm3RF8ubPLMU3T+A+zLJk2E8kNlkgeUiZQwv3EenU4joZX
	 7Tc3EdRTYNATlLAqQB8u2tZ7HSgqdWlNRRKq+Zo2WGMGyGkQHEVN7vPuUv2iWO3jjr
	 f/E12JjI683V7LIDmzMDPMlTYES4gO4AJrR7RMFkO/O+ApzHAiO45bduqNJkPCVG58
	 DCT6sSvmUyPJuPNL0t20AsoUCgQ/mOi1VxeVpOY44bT4E5uQfzUMYB2KkMaKGPVpRY
	 0Qnavw+iTW10fRjbGlAosK4u74JSJpqNNSDNKZvTo1UB/OkMzu6fGGegiuW6KpumeM
	 2AGlma1+Xj+UA==
Date: Sat, 3 Jan 2026 11:33:00 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Jie Gan <jie.gan@oss.qualcomm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Mike Leach <mike.leach@linaro.org>, James Clark <james.clark@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>, 
	Mao Jinlong <jinlong.mao@oss.qualcomm.com>, Konrad Dybcio <konradybcio@kernel.org>, 
	linux-arm-msm@vger.kernel.org, coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-binding: arm: add CTCU device for hamoa
Message-ID: <kvvagn7badh2q2y5pmcp3m2pvazmax7xwuumr36twekagvdvs6@odqinwynfvjm>
References: <20251106-enable-etr-and-ctcu-for-hamoa-v2-0-cdb3a18753aa@oss.qualcomm.com>
 <20251106-enable-etr-and-ctcu-for-hamoa-v2-1-cdb3a18753aa@oss.qualcomm.com>
 <076f6aff-4f9a-4630-8e5d-c11f0272de70@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <076f6aff-4f9a-4630-8e5d-c11f0272de70@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260103_093305_380577_B0E86355 
X-CRM114-Status: GOOD (  16.83  )
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

On Tue, Dec 23, 2025 at 05:14:11PM +0800, Jie Gan wrote:
> 
> 
> On 11/6/2025 9:57 AM, Jie Gan wrote:
> > Document the CTCU compatible for Hamoa, enabling support for the
> > CTCU device on the Hamoa platform.
> > 
> 
> Gentle reminder.
> 
> The dependency[1] has applied and I have tested this series on
> next-20251219, no conflict and work well.
> 

In your previous reply, you're stating that you will update the patch?
Are you saying that whatever concern Krzysztof had is now resolved?

Regards,
Bjorn

> [1]https://lore.kernel.org/all/176615287813.688536.723538049922655005.b4-ty@arm.com/
> 
> Thanks,
> Jie
> 
> > Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
> > ---
> >   Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml | 1 +
> >   1 file changed, 1 insertion(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml b/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
> > index 460f38ddbd73..57dede7a90e9 100644
> > --- a/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
> > +++ b/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
> > @@ -29,6 +29,7 @@ properties:
> >       oneOf:
> >         - items:
> >             - enum:
> > +              - qcom,hamoa-ctcu
> >                 - qcom,qcs8300-ctcu
> >             - const: qcom,sa8775p-ctcu
> >         - enum:
> > 
> 

