Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FE3ECA0EEB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 Aug 2025 13:34:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=klo+XFEvSxDbRvszeVuLQ9UUUmf4KQE8ZDJKanIvf3o=; b=FvMPavHXodwfLk2cp4tfKB7nZK
	VAflIz2e/GVZ2Nu5QYPETDPFqOYCOIhqECngP0IlOOA6Fra5KOitvaRwY01dl5HNz8gq6txH6oKN7
	ElLO6B3N2IpJliI+X7ez9eNl2Sf1H9LtdFWUiWe+MUg2t4yu2VHJDEgv1bpSWujpNUmEZjZMGXHdg
	V+4/r78hrHPoN5I7qSydQS3XPtAJQ9k6IBjkq/6TtUoB8W1LnvRDmd8ZxgBz00wSE5ZPTVqkuKF9q
	VnszOTXXxvu3vOMpZSB6Wd7LPqFK4tFRwK00moSPPL1xXdBauibtbfEuE9f+rrZ2XR9vT35h/O1Tb
	JWNIW4HA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1up5QW-0000000H46Y-1gt6;
	Thu, 21 Aug 2025 13:34:00 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1up2Er-0000000GY3y-1D3y
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 Aug 2025 10:09:46 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 23CCE152B;
	Thu, 21 Aug 2025 03:09:33 -0700 (PDT)
Received: from bogus (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2F3663F63F;
	Thu, 21 Aug 2025 03:09:39 -0700 (PDT)
Date: Thu, 21 Aug 2025 11:09:36 +0100
From: Sudeep Holla <sudeep.holla@arm.com>
To: Cristian Marussi <cristian.marussi@arm.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Deepti Jaggi <quic_djaggi@quicinc.com>,
	Rob Herring <robh@kernel.org>, Sudeep Holla <sudeep.holla@arm.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, <arm-scmi@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<kernel@oss.qualcomm.com>, Nikunj Kela <quic_nkela@quicinc.com>
Subject: Re: [PATCH v6] dt-bindings: firmware: arm,scmi: allow multiple
 instances
Message-ID: <aKbwYALhw3ZFqGii@bogus>
References: <20250730-8255-scmi-v6-1-a7d8ba19aded@quicinc.com>
 <e5c5c2da-ae77-4738-9f0f-33c51111f91c@quicinc.com>
 <aKbTKq04umCgS_eL@pluto>
 <a59908c9-38d8-492d-9e3f-5560d272689b@linaro.org>
 <aKbeRVsLpXcpiyHb@pluto>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aKbeRVsLpXcpiyHb@pluto>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250821_030945_417768_2606197F 
X-CRM114-Status: GOOD (  24.53  )
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

On Thu, Aug 21, 2025 at 09:52:21AM +0100, Cristian Marussi wrote:
> On Thu, Aug 21, 2025 at 10:29:00AM +0200, Krzysztof Kozlowski wrote:
> > On 21/08/2025 10:04, Cristian Marussi wrote:
> > > On Wed, Aug 20, 2025 at 11:44:26AM -0700, Deepti Jaggi wrote:
> > >>
> > >> On 7/30/25 14:30, Deepti Jaggi wrote:
> > >>> From: Nikunj Kela <quic_nkela@quicinc.com>
> > >>>
> > > 
> > > Hi,
> > > 
> > >>> Allow multiple SCMI instances by extending the scmi node name to include
> > >>> an instance number suffix.
> > >>>
> > >>> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> > >>> Reviewed-by: Cristian Marussi <cristian.marussi@arm.com>
> > >>> Signed-off-by: Nikunj Kela <quic_nkela@quicinc.com>
> > >>> Signed-off-by: Deepti Jaggi <quic_djaggi@quicinc.com>
> > >>> ---
> > >>> Changes in v6:
> > >>>          - Dropped 'this change' from description
> > >>> 	- Link to v5: https://lore.kernel.org/all/20250423005824.3993256-1-quic_djaggi@quicinc.com
> > >>>
> > >>> Changes in v5:
> > >>>          - Added Reviewed-by tag
> > >>> 	- Link to v4: https://lore.kernel.org/all/20240910163456.2383372-1-quic_nkela@quicinc.com
> > >>>
> > >>> Changes in v4:
> > >>>          - Dropped 'virtual' from subject and description
> > >>> 	- Link to v3: https://lore.kernel.org/all/20240905201217.3815113-1-quic_nkela@quicinc.com
> > >>>
> > >>> Changes in v3:
> > >>>          - Added Reviewed-by tag
> > >>>          - Removed the patch from original series[1]
> > >>>
> > >>> Changes in v2:
> > >>>          - Fixed scmi nodename pattern
> > >>>
> > >>> [1]: https://lore.kernel.org/all/20240903220240.2594102-1-quic_nkela@quicinc.com/
> > >>> ---
> > >>>   Documentation/devicetree/bindings/firmware/arm,scmi.yaml | 2 +-
> > >>>   1 file changed, 1 insertion(+), 1 deletion(-)
> > >>>
> > >>> diff --git a/Documentation/devicetree/bindings/firmware/arm,scmi.yaml b/Documentation/devicetree/bindings/firmware/arm,scmi.yaml
> > >>> index abbd62f1fed0993ab98fa44bdb9a0575f8e1c78e..be817fd9cc34b14009a3b1d69e78b802215571b6 100644
> > >>> --- a/Documentation/devicetree/bindings/firmware/arm,scmi.yaml
> > >>> +++ b/Documentation/devicetree/bindings/firmware/arm,scmi.yaml
> > >>> @@ -27,7 +27,7 @@ anyOf:
> > >>>   properties:
> > >>>     $nodename:
> > >>> -    const: scmi
> > >>> +    pattern: '^scmi(-[0-9]+)?$'
> > >>>     compatible:
> > >>>       oneOf:
> > >>>
> > >>> ---
> > >>> base-commit: 0b90c3b6d76ea512dc3dac8fb30215e175b0019a
> > >>> change-id: 20250728-8255-scmi-ed963ef8f155
> > >>
> > >> Gentle ping!!
> > 
> > You cannot ping gently while screaming!!! (you see how gentle this feels?)
> > 
> > >> Could you please review the patch?
> > >>
> > > 
> > > I thought this was already reviewed/acked and merged since ages....
> > > ...also the wording-change in the commit message LGTM.
> > > 
> > > Reviewed-by: Cristian Marussi <cristian.marussi@arm.com>
> > 
> > It was. Twice! This is just unjustified ping.
> 
> I'd like to add a new tag at this point.
> 
> Reviewed-!!-by-!!: Cristian Marussi <cristian.marussi@arm.com>
> 

I wish I could apply something fancy like this 😁. I will apply it soon.

-- 
Regards,
Sudeep

