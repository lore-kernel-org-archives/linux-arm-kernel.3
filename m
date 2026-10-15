Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9344CC6B30
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Oct 2026 10:50:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Lg7TOt6XcTyEdNiE5CmdXlCwY1B5FyDuCn0rC6jxWBQ=; b=cj2rjv+hoIbvFg0/wJnn8t1t2s
	/sxQgqA0Z2hu9d1WdTvyjEWb/m8t2WqXlCqS/oZ6nbeQIwuDYaVblqEMlAOKB+kZxFiLOh8anRtPw
	Lu3UEqrGRxVBW7pyh2DgD5/HT/uV78jqNkH04wAduxuFx3SQqLPgLIehUSprRVYQpKQak21u1anR3
	d6eeWaexZQYQ000e+2XMQbntPYrglpu2N6MxVE2Eti4apZD7gYregOaW47pjbEo7M2aJebXFdHIat
	uX/blNkJf/2MGwbqmGzrZm9JqB8NFUfU2hALfwci0j29tJ3WAJ4Mzq0d8rId0TRcnnMCE4Hn0AdUL
	8zoji5DA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHJ2q-0000000HU6R-3z3F;
	Thu, 15 Oct 2026 10:50:45 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHJ2p-0000000HU6L-3KQM
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Oct 2026 10:50:43 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 7411E42E78;
	Thu, 15 Oct 2026 10:50:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45B2E1F000C4;
	Thu, 15 Oct 2026 10:50:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792061443;
	bh=Lg7TOt6XcTyEdNiE5CmdXlCwY1B5FyDuCn0rC6jxWBQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=cNvnW9GUrhLinFBjC6477v73avjTrrQ7q2SPtXIcbbbu5XfcOxKI6PY+4Z+CmYla3
	 FB3xpamgSxabA7NqCjrru1Kkmkbg8UXyjRegetGO8dgQ1pKsOXAZRKVk8DbWfXwiB9
	 2lUpoIT5inXQlt0czvv8uyhAtt/sIZkOoZ3ypbofciipgFDYZleVxJISxCKDfpg31Q
	 1ZEH8kcWG5iaJBVFgjHM92bSd89NRYblPZxX40YCwjRrwViCrdAAMBXI9xHMu5w7tS
	 wqVgS7gIhuOXtKDUqM19JQjeI6f3dowA+9qlyMmk75lD0qbtgEndPSqpiFgRKdmg19
	 Lf1z4eufhfREA==
Date: Thu, 15 Oct 2026 12:50:38 +0200
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
To: Marc Zyngier <maz@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Sascha Bischoff <sascha.bischoff@arm.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: interrupt-controller: gicv5: Relax IRS
 properties constraints
Message-ID: <atCv_t_KPJ23UAhJ@red-moon>
References: <20261015-gicv5-irs-no-cpus-v1-0-d4b337b7f000@kernel.org>
 <20261015-gicv5-irs-no-cpus-v1-1-d4b337b7f000@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261015-gicv5-irs-no-cpus-v1-1-d4b337b7f000@kernel.org>
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

On Thu, Oct 15, 2026 at 10:20:25AM +0200, Lorenzo Pieralisi wrote:
> An IRS is architecturally allowed to be stand-alone (ie with no direct
> CPU connection).
> 
> Relax "cpus" and "arm,iaffids" properties constraints allowing a standalone
> IRS configuration.
> 
> Fixes: 7d7299bd07c6 ("dt-bindings: interrupt-controller: Add Arm GICv5")
> Signed-off-by: Lorenzo Pieralisi <lpieralisi@kernel.org>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Marc Zyngier <maz@kernel.org>
> ---
> I have not marked the patch for stable though I think it should go
> to stable kernels to fix the original schema. I am a bit nervous about
> making cpus and arm,iaffids optional but I don't think there is a way
> to keep them required and force them to be empty for an IRS with
> no CPU connection.

Hi Thomas, all,

I have noticed this is now queued into -tip (thanks), I would still appreciate
DT maintainers feedback though on the above and I still think that this must
go to stable kernels (I have not tagged the patches CC: stable as mentioned in
the cover letter but I believe the Fixes: tag will do ? If not I can send
them myself anyway).

Thanks,
Lorenzo

> ---
>  .../devicetree/bindings/interrupt-controller/arm,gic-v5.yaml     | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/interrupt-controller/arm,gic-v5.yaml b/Documentation/devicetree/bindings/interrupt-controller/arm,gic-v5.yaml
> index 86ca7f3ac281..b901e4288816 100644
> --- a/Documentation/devicetree/bindings/interrupt-controller/arm,gic-v5.yaml
> +++ b/Documentation/devicetree/bindings/interrupt-controller/arm,gic-v5.yaml
> @@ -120,13 +120,14 @@ patternProperties:
>  
>        cpus:
>          description:
> -          CPUs managed by the IRS.
> +          CPUs managed by the IRS. Omit it if the IRS has no associated CPUs.
>  
>        arm,iaffids:
>          $ref: /schemas/types.yaml#/definitions/uint16-array
>          description:
>            Interrupt AFFinity ID (IAFFID) associated with the CPU whose
>            CPU node phandle is at the same index in the cpus array.
> +          Omit it if the IRS has no associated CPUs.
>  
>      patternProperties:
>        "^its@[0-9a-f]+$":
> @@ -210,12 +211,14 @@ patternProperties:
>            - reg
>            - reg-names
>  
> +    dependencies:
> +      cpus: [ "arm,iaffids" ]
> +      arm,iaffids: [ cpus ]
> +
>      required:
>        - compatible
>        - reg
>        - reg-names
> -      - cpus
> -      - arm,iaffids
>  
>  additionalProperties: false
>  
> 
> -- 
> 2.53.0
> 

