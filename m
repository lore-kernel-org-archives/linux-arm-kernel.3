Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F02AE77197
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jan 2025 15:11:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W1uQfMbvrrRqafvSAgVTa2EPJkkMKwOk6dnSq7Sa2eg=; b=Wm99bMrPffIbQpBIrO4qDcc/iM
	2L4RdGU+2Vumg3NWRnkpksPTaNIlpFThxk+m3bHOiJbbBE5JdsMcchgYjrHPAMxKMYKYeEHnf0wWy
	E1M+IkePzO+ib9IURkGSqHGVdGBr7Cpu8IEH8zIVBbSiIu5S3UOVINgNcfiyO/Oq46Gvmoo93aeOE
	Ee+1JxzbMb4KYVKwn/aUD+saxhjXtr6RRMhdGrKodm6hLg6Goyv4k92iKokq2cs4KX8Itq3xN375p
	RppCBpVe+2I8LqXKzu3c0BMPGL3OiWna2lcBCvcgUykClFFAKgTrvqD2mZLsRbdB4W5Gej/xwTac4
	0SMpOxpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVuBc-0000000CPMt-2Kzc;
	Thu, 09 Jan 2025 15:11:04 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVuAP-0000000CP4Q-24o9
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jan 2025 15:09:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id C6F975C5C06;
	Thu,  9 Jan 2025 15:09:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 551BDC4CED2;
	Thu,  9 Jan 2025 15:09:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736435388;
	bh=dyVjxrvEDQQ08muhGpvtbe35aBVJ/h1rrRcp0echcvU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YDRJbxSoJQ4JcsUh1faoteY/sVNy9vA5BM+h32TQzdaWwBHKCzgnOhzQnQl0CywTy
	 fgFviJ8CFOaokOqTkxNitiG8/Do2yJM3YsGksS9frMRzO9zFm/zIxFPUHZcdQJcmXO
	 JH7HHFLrRrPOR0/vOoCyF7eJyjHSEuEfoazgNm5JzdWj4jIAFpf2P79rR45iv7MLmK
	 DZCAPVtvPcQIVXFgIglKgEteMYCHbUvrLzJ2PxyObQju7MS5DXQwXsCEMjPSp6rKwF
	 Ep/WnycWgbQJkQDH3LMgr7nL0s8dDtFHLVpokH+5KSXhfCD8XRUS1aVbqxJosKvmsT
	 Sf5833YRySd/A==
Date: Thu, 9 Jan 2025 09:09:47 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Romain Naour <romain.naour@smile.fr>
Cc: krzk+dt@kernel.org, conor+dt@kernel.org, nm@ti.com, afd@ti.com,
	devicetree@vger.kernel.org, kristo@kernel.org,
	Romain Naour <romain.naour@skf.com>, vigneshr@ti.com,
	linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org
Subject: Re: [PATCH v4 1/2] dt-bindings: mfd: syscon: Add
 ti,j721e-acspcie-proxy-ctrl compatible
Message-ID: <173643538692.3377192.11706052160856350643.robh@kernel.org>
References: <20250109102627.1366753-1-romain.naour@smile.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250109102627.1366753-1-romain.naour@smile.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250109_070949_576477_6660CB1B 
X-CRM114-Status: GOOD (  12.99  )
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


On Thu, 09 Jan 2025 11:26:26 +0100, Romain Naour wrote:
> From: Romain Naour <romain.naour@skf.com>
> 
> The ACSPCIE_PROXY_CTRL registers within the CTRL_MMR space of TI's J721e
> SoC are used to drive the reference clock to the PCIe Endpoint device via
> the PAD IO Buffers. Add the compatible for allowing the PCIe driver to
> obtain the regmap for the ACSPCIE_CTRL register within the System
> Controller device-tree node in order to enable the PAD IO Buffers.
> 
> The Technical Reference Manual for J721e SoC with details of the
> ASCPCIE_CTRL registers is available at:
> https://www.ti.com/lit/zip/spruil1
> 
> Signed-off-by: Romain Naour <romain.naour@skf.com>
> ---
> v4: Add missing change in the second list (From Andrew Davis) [1]
>   Rebase after the ti,j784s4-acspcie-proxy-ctrl compatible fix [2]
>   [1] https://lore.kernel.org/linux-devicetree/20250103174524.28768-1-afd@ti.com/
>   [2] https://lore.kernel.org/linux-devicetree/20250103174524.28768-2-afd@ti.com/
> 
> v3: new commit
> ---
>  Documentation/devicetree/bindings/mfd/syscon.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


