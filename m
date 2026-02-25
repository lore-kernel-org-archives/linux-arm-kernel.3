Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E4F2F357DA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Feb 2026 10:23:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N3aUeA28ncvE2kAm7dvD3alfaI2SO/lLeVYKn6UM5Fk=; b=C96nzHMhy+iA6dWCqrHjuq1cup
	tnd0ubaTd6cyZSHlPbAi31xNLXsiE+hK2mgRjiN4mD/GiFW+TaNPdW+RAbatypS84Qj4pEDYXjyDp
	1SJNcYGzYXjB5PxkDLXg/695eZzyuxpv8nGtDXm6epBkzMbBC9phUxRvrpCz0Bg2etj4TLYZXUv89
	E02MMVKSaigfNRZvJSk5uZumEXKx+m810RgQTN4CX9+Fbo8OjC2VWCq/dMrmcpvq3s90otPbqDTmM
	nAruyCbcl2LmICXQoPw3l4BH0/L2BkGJH8V3DizK9bb7ey0kylxw8ByjayURm1gfRQaS6oTaa9Kp6
	UHAaBguA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvC3D-00000003li0-0MP8;
	Wed, 25 Feb 2026 10:23:27 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvC3B-00000003lho-36RB
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Feb 2026 10:23:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 3170A600AE;
	Wed, 25 Feb 2026 10:23:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F846C2BC86;
	Wed, 25 Feb 2026 10:23:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772015004;
	bh=N3aUeA28ncvE2kAm7dvD3alfaI2SO/lLeVYKn6UM5Fk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VmItdglRA+UuO46w5Z5bb11g59x96XQdEjDCaWeRyFRIqTMZ1jynbxhCLgvRD9oMd
	 3X+56hCCDaP1JxuFD4w4hWASY7ARs50gPZZUHprxGSmuoadF45oBgc/y9mFxfNIvm3
	 3zeZGsGDFOa/VJLTYVIwDFMWZPG8RQlN/pb9kPbGdsOCf5jWvFSr9bPs7M1cHwLygS
	 5m150kauZAW57NBAndMa5oKz7rL/m1moqFqpdD3CWEvgcPIcnwmgnLPTKytYLDcCRI
	 CRLRXF8pQNjb8TCPSBrcDXhSl8LoRNumLymVn94UrduysqXPUNE9fjZKb4LUrstrrB
	 RinFbdaYOVJaQ==
Date: Wed, 25 Feb 2026 11:23:21 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Abin Joseph <abin.joseph@amd.com>
Cc: vkoul@kernel.org, Frank.Li@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, michal.simek@amd.com, 
	radhey.shyam.pandey@amd.com, git@amd.com, dmaengine@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] dt-bindings: dmaengine: xlnx,axi-dma: Convert
 bindings into yaml
Message-ID: <20260225-athletic-bittern-of-beauty-598ec2@quoll>
References: <20260225050521.160724-1-abin.joseph@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260225050521.160724-1-abin.joseph@amd.com>
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

On Wed, Feb 25, 2026 at 10:35:21AM +0530, Abin Joseph wrote:
> Convert the bindings document for Xilinx DMA from txt to yaml.
> No changes to existing binding description.

Subject - not YAML.
See also:
https://elixir.bootlin.com/linux/v6.17-rc3/source/Documentation/devicetree/bindings/submitting-patches.rst#L18

Best regards,
Krzysztof


