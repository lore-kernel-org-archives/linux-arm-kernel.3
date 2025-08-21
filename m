Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E13E3CA0EEB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 Aug 2025 11:46:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ipM60zkIS0QNv16XfEDyhkR9uYtuFPpDW8RH88hyb/A=; b=IDCxFC57AXeI0UparBr+mE84QS
	ad4uXw3X5v3/sfkJHMWxAFp+bnqLhmz0TNNCR4sqcGVswTJJVgxcoXnJ5YU8tK8h2d1yggwsVxk2g
	Mz99RA2bs3eaawaQ+9aFRZzstHrmVA47+gip+MZpWP7m7ef8y76b+nDvQtpE3F+Bbxfk4iEtGXkd4
	J5KFNHZ+Zs/A6ROjYD/JC6H/5su2Smly8654T3ej43/86PWwPxp238erOe0k8DygyXiZ+yoDpj7Tt
	Ce9K1SBeb071n/dmONFEEZb4cxQZQME4pNWf+SpsU3Zr3H4UPmPS7tWrj3Lpm3idUFDThgS0DAkAj
	4wE4POiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1up3ki-0000000GnX6-28X9;
	Thu, 21 Aug 2025 11:46:44 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1up122-0000000GJX9-2dJ3
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 Aug 2025 08:52:28 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DFDC4168F;
	Thu, 21 Aug 2025 01:52:17 -0700 (PDT)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 339333F58B;
	Thu, 21 Aug 2025 01:52:24 -0700 (PDT)
Date: Thu, 21 Aug 2025 09:52:21 +0100
From: Cristian Marussi <cristian.marussi@arm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Cristian Marussi <cristian.marussi@arm.com>,
	Deepti Jaggi <quic_djaggi@quicinc.com>,
	Sudeep Holla <sudeep.holla@arm.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel@oss.qualcomm.com,
	Nikunj Kela <quic_nkela@quicinc.com>
Subject: Re: [PATCH v6] dt-bindings: firmware: arm,scmi: allow multiple
 instances
Message-ID: <aKbeRVsLpXcpiyHb@pluto>
References: <20250730-8255-scmi-v6-1-a7d8ba19aded@quicinc.com>
 <e5c5c2da-ae77-4738-9f0f-33c51111f91c@quicinc.com>
 <aKbTKq04umCgS_eL@pluto>
 <a59908c9-38d8-492d-9e3f-5560d272689b@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a59908c9-38d8-492d-9e3f-5560d272689b@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250821_015226_753444_3BEF59E0 
X-CRM114-Status: GOOD (  21.79  )
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

On Thu, Aug 21, 2025 at 10:29:00AM +0200, Krzysztof Kozlowski wrote:
> On 21/08/2025 10:04, Cristian Marussi wrote:
> > On Wed, Aug 20, 2025 at 11:44:26AM -0700, Deepti Jaggi wrote:
> >>
> >> On 7/30/25 14:30, Deepti Jaggi wrote:
> >>> From: Nikunj Kela <quic_nkela@quicinc.com>
> >>>
> > 
> > Hi,
> > 
> >>> Allow multiple SCMI instances by extending the scmi node name to include
> >>> an instance number suffix.
> >>>
> >>> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> >>> Reviewed-by: Cristian Marussi <cristian.marussi@arm.com>
> >>> Signed-off-by: Nikunj Kela <quic_nkela@quicinc.com>
> >>> Signed-off-by: Deepti Jaggi <quic_djaggi@quicinc.com>
> >>> ---
> >>> Changes in v6:
> >>>          - Dropped 'this change' from description
> >>> 	- Link to v5: https://lore.kernel.org/all/20250423005824.3993256-1-quic_djaggi@quicinc.com
> >>>
> >>> Changes in v5:
> >>>          - Added Reviewed-by tag
> >>> 	- Link to v4: https://lore.kernel.org/all/20240910163456.2383372-1-quic_nkela@quicinc.com
> >>>
> >>> Changes in v4:
> >>>          - Dropped 'virtual' from subject and description
> >>> 	- Link to v3: https://lore.kernel.org/all/20240905201217.3815113-1-quic_nkela@quicinc.com
> >>>
> >>> Changes in v3:
> >>>          - Added Reviewed-by tag
> >>>          - Removed the patch from original series[1]
> >>>
> >>> Changes in v2:
> >>>          - Fixed scmi nodename pattern
> >>>
> >>> [1]: https://lore.kernel.org/all/20240903220240.2594102-1-quic_nkela@quicinc.com/
> >>> ---
> >>>   Documentation/devicetree/bindings/firmware/arm,scmi.yaml | 2 +-
> >>>   1 file changed, 1 insertion(+), 1 deletion(-)
> >>>
> >>> diff --git a/Documentation/devicetree/bindings/firmware/arm,scmi.yaml b/Documentation/devicetree/bindings/firmware/arm,scmi.yaml
> >>> index abbd62f1fed0993ab98fa44bdb9a0575f8e1c78e..be817fd9cc34b14009a3b1d69e78b802215571b6 100644
> >>> --- a/Documentation/devicetree/bindings/firmware/arm,scmi.yaml
> >>> +++ b/Documentation/devicetree/bindings/firmware/arm,scmi.yaml
> >>> @@ -27,7 +27,7 @@ anyOf:
> >>>   properties:
> >>>     $nodename:
> >>> -    const: scmi
> >>> +    pattern: '^scmi(-[0-9]+)?$'
> >>>     compatible:
> >>>       oneOf:
> >>>
> >>> ---
> >>> base-commit: 0b90c3b6d76ea512dc3dac8fb30215e175b0019a
> >>> change-id: 20250728-8255-scmi-ed963ef8f155
> >>
> >> Gentle ping!!
> 
> You cannot ping gently while screaming!!! (you see how gentle this feels?)
> 
> >> Could you please review the patch?
> >>
> > 
> > I thought this was already reviewed/acked and merged since ages....
> > ...also the wording-change in the commit message LGTM.
> > 
> > Reviewed-by: Cristian Marussi <cristian.marussi@arm.com>
> 
> It was. Twice! This is just unjustified ping.

I'd like to add a new tag at this point.

Reviewed-!!-by-!!: Cristian Marussi <cristian.marussi@arm.com>

:P

Cheers,
Cristian

