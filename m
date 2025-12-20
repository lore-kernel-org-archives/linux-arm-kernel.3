Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7890E668AE
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 20 Dec 2025 09:34:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1Jgt/H66f0qzL4XaSXKX9bbhKRzv15JScdtXN3TnvX8=; b=KXWa2NZ3c9iVIogdmTn1XYebmv
	5nwD3Ym/BcFVXn64NWpZyuHiCjlncgVIpyaT/OBb60Emi599lcb1NJmCBFKQ/1TGnLZHqTPVMUe+V
	YkhuP4KvqGj5oFXJKKesHF/fU0zBXRQovdeegaZ4lB+Rjl/PPBcyqvlIDX4wdOkYw1SvG6CzPmCCn
	BbgbAzTIdyV/Iky0oUIlgjvZYpXrbMV8vWLI9aMyUh6yhK1n9lsCbasQdjnMLRFfh9rGqFVEPyEyb
	LWkdANeggXe7Vsd7HQi2G9nRDmm24yor0Z7MctFn7A+pgPDLVNv4KoY3YNpc1nxONJJ8GdvYeoGW6
	/kdq3ejA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWtM4-0000000BTC0-36l4;
	Sat, 20 Dec 2025 09:34:28 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWtM3-0000000BTBr-08bg
	for linux-arm-kernel@lists.infradead.org;
	Sat, 20 Dec 2025 09:34:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 0FEBF6001A;
	Sat, 20 Dec 2025 09:34:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94BCBC4CEF5;
	Sat, 20 Dec 2025 09:34:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766223265;
	bh=eIyfjlT66Z7KZMioqTIcLRoNnJpoh8HRfoh4oqlm0qQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YnQt/gUrcZGskZZpV/DTEu6HW8WyedgO/EqRvoeRonOWfQsBHETo9w+wxcT6dTnl/
	 85oKA7QtUYAb7Pwk5OAcifycQ8Un28CYwE/NWF0IQNBSuWJD69ZGhHKp2kWvffg0io
	 ZqlmDXZTavHZ4yVTPPoQz5IhFNyrbjTwc0g2TZGlz5m9P4jITtkclkuQJyS7dVZVhE
	 qbW4IAhsu35ysHSJf95hYvzee7Zle/RO2saQNwhaa0Fuq40CHZsu/2+TUiqjazqLH9
	 WwCqoSKEMcKzZOUaqa6ZvrHZ55aLpHWZJAiAXf2G0ik2Xr21qz5/gI+vw89X1ENRXC
	 PZ+q2+Ohx3wtQ==
Date: Sat, 20 Dec 2025 10:34:21 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Alain Volmat <alain.volmat@foss.st.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Hugues Fruchet <hugues.fruchet@foss.st.com>, 
	linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/6] dt-bindings: media: st: dcmipp: add 'power-domains'
 property
Message-ID: <20251220-sociable-bald-partridge-7a67ab@quoll>
References: <20251219-stm32-mp2x-dcmipp-csi-power-domain-v1-0-a6edb2aa8154@foss.st.com>
 <20251219-stm32-mp2x-dcmipp-csi-power-domain-v1-4-a6edb2aa8154@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251219-stm32-mp2x-dcmipp-csi-power-domain-v1-4-a6edb2aa8154@foss.st.com>
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

On Fri, Dec 19, 2025 at 04:58:06PM +0100, Alain Volmat wrote:
> STM32 DCMIPP may be in a power domain which is the case for the
> STM32MP2x based boards.
> Allow a single 'power-domains' entry for STM32 DCMIPP.
> 
> Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
> ---
>  Documentation/devicetree/bindings/media/st,stm32-dcmipp.yaml | 3 +++
>  1 file changed, 3 insertions(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


