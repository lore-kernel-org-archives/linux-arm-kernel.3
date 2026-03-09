Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3297EFCD6D
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Mar 2026 09:21:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DC2bfz9jSgSPQh73n8X+NSiBVFt4UH6QKru6KBOrlBM=; b=4myQV3sfA90axYBgL4Oypljpg2
	F6bBP1lIkrM6NPw4IDofHcIzUAIyAB24f++jWctn8YUsiTgEMZDVnD+yXiv1Ubvod1nLHtPPuKRUJ
	1s3PNnqI6cP9r0uLUs4AMlFhyRdbQNT8kEixuKvKRlVUVy5+vwtQM67NvWiCw9ZhJcWNMy9KVSQPq
	XRjmjguhcUm4kpVD0GtHa45zI2AB5G877WJdmf0V8w5iPiW/gpnSSGpw1QpExvcZZeHM/y2Vihedv
	kjMopNs2BaZgGjW1wNXY6kr027G04oEImoIV0dJtdODmdNhKlgEmg/aM8LQGpIQTJK4crPGtk7XCU
	4FiktVZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzWnQ-00000006xVX-08CZ;
	Mon, 09 Mar 2026 09:21:04 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzWnO-00000006xV5-15gc
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Mar 2026 09:21:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 6829B60131;
	Mon,  9 Mar 2026 09:21:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45198C4CEF7;
	Mon,  9 Mar 2026 09:20:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773048061;
	bh=ENpCl5oytEtbIZ6+0Nre/ZmYXuoRlmObpwNAk77Gqqk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=t60ThOFhL1FOwZ2VkXMS1csZ8fp00yHZTHO7ImxMYTr0boz4FlJIu5wEK5T1BVs2T
	 wiNu/js5FufG7K7KF7UpXi5QWsMmhOjPJ42MYI/wmDasR3OQzNiZ2+55eOrjrvua4l
	 dSpl0EYZ3xC68TdBLAN5vnFKiE8CGvzCphN3aEzhArwAsRAtbO5/EB8am3Lfz3taxZ
	 wDuqmbPHdBaYUBR4LQ8hhqUdmUtiZWnvwARBlHXXXnYj9+h15CDn8fyDkxgW6bAQqd
	 JuHJALb7oiwRZxKx5L8i0KbHaw+LtPn8XGy8yiHIKKp4mP+HleLl8gElDV0FAeCcXJ
	 uUG9U+J+HLCAA==
Date: Mon, 9 Mar 2026 09:20:57 +0000
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Debbie Horsfall <debbie.horsfall@arm.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Linus Walleij <linusw@kernel.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 2/2] arm64: dts: zena: Add support for Zena CSS
Message-ID: <20260309-manipulative-inescapable-labradoodle-7a76e4@sudeepholla>
References: <20260212-zena-css-v2-0-d33ea23cb9c2@arm.com>
 <20260212-zena-css-v2-2-d33ea23cb9c2@arm.com>
 <c7124cf5-f20a-4d6f-8f2e-388127c4ad2a@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c7124cf5-f20a-4d6f-8f2e-388127c4ad2a@kernel.org>
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

On Sun, Mar 08, 2026 at 04:41:55PM +0100, Krzysztof Kozlowski wrote:
> On 12/02/2026 12:16, Debbie Horsfall wrote:
> > Introduce the Zena CSS Fixed Virtual Platform (FVP) dts. This is
> > currently the only Zena CSS variant, however the common definitions are
> > included in a common dtsi for extensibility.
> > 
> > Signed-off-by: Debbie Horsfall <debbie.horsfall@arm.com>
> 
> ...
> 
> > +
> > +	timer {
> > +		compatible = "arm,armv8-timer";
> > +		interrupts = <GIC_PPI 13 IRQ_TYPE_LEVEL_LOW>,
> > +			     <GIC_PPI 14 IRQ_TYPE_LEVEL_LOW>,
> > +			     <GIC_PPI 11 IRQ_TYPE_LEVEL_LOW>,
> > +			     <GIC_PPI 10 IRQ_TYPE_LEVEL_LOW>,
> > +			     <GIC_PPI 12 IRQ_TYPE_LEVEL_LOW>;
> > +	};
> > +
> > +	sram: sram@104000 {
> 
> This belongs in the soc node.
> 
> > +		compatible = "mmio-sram";
> > +		reg = <0x0 0x00104000 0x0 0x00001000>;
> > +		#address-cells = <1>;
> > +		#size-cells = <1>;
> > +		ranges = <0 0x0 0x00104000 0x00001000>;
> > +
> > +		scmi_shmem_tx: scpshmem-sram-section@0 {
> > +			compatible = "arm,scmi-shmem";
> > +			reg = <0x0 0x100>;
> > +		};
> > +
> > +		scmi_shmem_rx: scpshmem-sram-section@100 {
> > +			compatible = "arm,scmi-shmem";
> > +			reg = <0x100 0x100>;
> > +		};
> > +	};
> > +
> > +	memory@80000000 {
> 
> And placing this in DTSI means that zena-css comes with this memory
> mounted and it is not customizable in final FVP board.
> 

Both valid points, please post a patch addressing this based on my
for-next/juno/updates as I just applied these last night.

-- 
Regards,
Sudeep

