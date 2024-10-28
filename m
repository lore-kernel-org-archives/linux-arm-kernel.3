Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03120D1359C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Oct 2024 12:24:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RWcxSE4UatI1A76VSCuunJn/cxuWm4V1GW48Va12z3s=; b=bJNgkDKbLECIRWTdDg8MVTko3k
	PCjEZIujJjoOcPfbvsGHoo2fY3phFPPJ8cCoV3REBe69zxxz9QW+FeymQJwT6zuJfx81X/2HFSy9F
	01YsRZT1Ur3vayMAlT6TuDl2v2HccDDEAZszyijjJCQTllO0neqmPVS10feWKjiXPJXSaNOvXcVOv
	/hzrHyyXV8pnXZuVK3X71R+Iy4XEwbOtpFbVycUcSaR35ja6+63Ih0llNs9Q716nb/RybSUzJtBnJ
	GrxY92zKI5Jw5ahRWgqBS/K8MPWY/dxwhK/OKzgYjQly7naGCRTPpJ2YeE0irHJT35f48olq2EtYd
	An7eypQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5Ona-0000000Ajpb-3vrU;
	Mon, 28 Oct 2024 12:24:42 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5Olx-0000000AjSb-1hXY
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Oct 2024 12:23:03 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BB68213D5;
	Mon, 28 Oct 2024 05:23:29 -0700 (PDT)
Received: from bogus (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5FA963F73B;
	Mon, 28 Oct 2024 05:22:57 -0700 (PDT)
Date: Mon, 28 Oct 2024 12:22:54 +0000
From: Sudeep Holla <sudeep.holla@arm.com>
To: Cristian Marussi <cristian.marussi@arm.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org, james.quinlan@broadcom.com,
	f.fainelli@gmail.com, vincent.guittot@linaro.org,
	etienne.carriere@st.com, peng.fan@oss.nxp.com, michal.simek@amd.com,
	quic_sibis@quicinc.com, quic_nkela@quicinc.com,
	dan.carpenter@linaro.org, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	Sudeep Holla <sudeep.holla@arm.com>, Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH v3 6/7] dt-bindings: firmware: arm,scmi: Add missing
 vendor string
Message-ID: <Zx-CHlAb61FWdzkA@bogus>
References: <20241028120151.1301177-1-cristian.marussi@arm.com>
 <20241028120151.1301177-7-cristian.marussi@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241028120151.1301177-7-cristian.marussi@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241028_052301_507645_6FA8DAC7 
X-CRM114-Status: GOOD (  19.66  )
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

On Mon, Oct 28, 2024 at 12:01:50PM +0000, Cristian Marussi wrote:
> Recently introduced max-rx-timeout-ms optionao property is missing a
> vendor prefix.
>
> Add the vendor prefix from the original committer.
>

It should be "arm," not "nxp," just because NXP happens to introduce that.
It just highlight that the property is X vendor specific and here it is
associated with SCMI and specifically Arm SCMI, so "arm,". If for some
reason nxp or any other vendor overrides this definition and need to add
additional property then they can add their own vendor name into that
property.

If there are no objections, I can fix it up when applying.

> Fixes: 3a5e6ab06eab ("dt-bindings: firmware: arm,scmi: Introduce property max-rx-timeout-ms")
> Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
> ---
> Note that this fixes a commit that has been merged in v6.12-rc1...so it
> should not present any backward compatibility issue.
> ---
> Cc: Rob Herring <robh@kernel.org>
> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: devicetree@vger.kernel.org
> Cc: Peng Fan <peng.fan@nxp.com>
> ---
>  Documentation/devicetree/bindings/firmware/arm,scmi.yaml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/firmware/arm,scmi.yaml b/Documentation/devicetree/bindings/firmware/arm,scmi.yaml
> index 9d6e1147f9e9..e331da4d606b 100644
> --- a/Documentation/devicetree/bindings/firmware/arm,scmi.yaml
> +++ b/Documentation/devicetree/bindings/firmware/arm,scmi.yaml
> @@ -124,7 +124,7 @@ properties:
>        atomic mode of operation, even if requested.
>      default: 0
>  
> -  max-rx-timeout-ms:
> +  nxp,max-rx-timeout-ms:
>      description:
>        An optional time value, expressed in milliseconds, representing the
>        transport maximum timeout value for the receive channel. The value should
> -- 
> 2.47.0
> 

--
Regards,
Sudeep

