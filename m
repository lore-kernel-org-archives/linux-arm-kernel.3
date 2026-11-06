Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6A8D606A329
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Nov 2026 11:16:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=1EFfECFm;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dO6W+C2v
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=wbqbZlCH7YXcVsufdxHlWbVJML/TMT3EJO6Q4weCv7o=; b=1EFfECFmD92F2APdWrryrqSmzN
	OyN7DXPwVVQWlGvKdevsMVFhUEHrEMpA1D3YFSDSBKHJvvZEitS1mwLhQaDxoV/ud5WhXyNI6p/7z
	UizHfNFFW+NuFxhvevWs9WLG+3ZeTCxhoegu20GNeCnljs60Ndsq95Pog0udKaKk/Fc7W299lcMqt
	fmeR+M/taSgUOONsudfY4r7osXNxTp5pOUq/Vm0MbFunbAPcpncbpN1rabqfRLQaK6f0Uzr1YlmD5
	1eay6+GG+v14u6TWutN8zwo6fI7SDcyVBu4X9XCgk+pkl8QDHzDF9A05aqV5ScQF1jqmwm2pIScg+
	Uz/jmSvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPHvV-0000000C7Rm-1zzD;
	Fri, 06 Nov 2026 11:16:09 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPHvT-0000000C7R7-3lF2
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Nov 2026 11:16:08 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 7844840770;
	Fri,  6 Nov 2026 11:16:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74D331F0089F;
	Fri,  6 Nov 2026 11:16:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793963767;
	bh=wbqbZlCH7YXcVsufdxHlWbVJML/TMT3EJO6Q4weCv7o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=dO6W+C2vZVjfBxkb094IePRjcbEh9989thGug6bb/G63BtQ6kCSRD200KjL+dc4sM
	 1zYW2eJn7N3kQzs9bSCGopMIWJuNyL8oMaJfECNmoFgTAnTOtuqqPtdjVUsLTgJ1i7
	 yMy6hZzEUH0PlfaMVV07FAC9gJE8v55hyZBngniY0c1lyza/uAb4G13FjHb0a+wfs4
	 mtrMecqNiA+wJd9ZanP/ZzuIj/la8B0BxAgAClPTSKY7zUUDXJIHs4eZU6L6bAjS0c
	 RDarZErMJYsXhzDjLPZ1JoU38IzG7v3XBBP1Qu8ajb2KS54rxPG+HR2jbGjOmoEjGs
	 Y6l7rnGJU1OIA==
Date: Fri, 6 Nov 2026 12:16:03 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Arnav Kapoor <kapoorarnav43@gmail.com>
Cc: Sai Krishna Potthuri <sai.krishna.potthuri@amd.com>, 
	Conall O'Griofa <conall.ogriofa@amd.com>, Jonathan Cameron <jic23@kernel.org>, 
	Salih Erim <salih.erim@amd.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	David Lechner <dlechner@baylibre.com>, Nuno =?utf-8?B?U8Oh?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Michal Simek <michal.simek@amd.com>, 
	Andy Shevchenko <andriy.shevchenko@intel.com>, stable@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/2] dt-bindings: iio: adc: xlnx,zynqmp-ams: limit
 external channels to 30-50
Message-ID: <20261106-funky-dainty-puma-c6bd43@quoll>
References: <20261104164510.105359-1-kapoorarnav43@gmail.com>
 <20261104164510.105359-2-kapoorarnav43@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261104164510.105359-2-kapoorarnav43@gmail.com>
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, Nov 04, 2026 at 10:15:00PM +0530, Arnav Kapoor wrote:
> Channels 20 to 29 of the PL-SYSMON block are its fixed channels (PL
> temperature to VCCADC), which the driver always provides. Only channels
> 30 to 50 (the differential input, VUser0-3 and VAux0-15) are external
> channels that can be described as "channel@N" child nodes, yet the
> binding accepts any N from 20 to 50. Listing one of the fixed channels
> there only makes the driver add it a second time.
> 
> Limit the child nodes to channels 30 to 50.
> 
> Fixes: 39dd2d1e251d ("dt-bindings: iio: adc: Add Xilinx AMS binding documentation")

Drop, no bug is fixed here. Driver should simply not register such
channels second time, so it's a driver bug, not a binding.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


