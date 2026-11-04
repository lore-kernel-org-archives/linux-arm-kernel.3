Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DF77606A32C
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Nov 2026 11:08:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=MsblJOe7;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jSU087KA
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=v2kkoBBpinJ3jfPzo2XnA08muXsaPFPKEp5aH+bJ0ZA=; b=MsblJOe7qdQoLkqobDNXa4HOjo
	hjaVoI7RNxtpkuid+VSMUmCXYSTy2I5WZdyWyYo47ARJO7/eU6TDxjoy6eWeg0T+cG6kvys09CAoh
	Lu6/04MyhioveUGA0Bovake/S/3Vs6mpHnAHY36ZFp0DvCvSyqw9FE3nfw7CBLfYMz2J3LEgJzYed
	6LSgFEH5N465HiykyB1Hr721wKlT0TR45U+Ez41NdPMKxdFkH+EJHOtajZ3tOF+CpLj9v/EX9kMWV
	BF4Dd3nGQNQOw+Q6idQzEc9ZQZjZdOnbwrSAPZvp6IjqOdsLhf9Pnp2X3v7M/a1D8JXT36JXVSyCa
	wNI4LmEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOYr8-000000056y4-1feE;
	Wed, 04 Nov 2026 11:08:38 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOYr7-000000056xk-1Euu
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Nov 2026 11:08:37 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id B8BEA4460D;
	Wed,  4 Nov 2026 11:08:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A03131F000C1;
	Wed,  4 Nov 2026 11:08:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793790516;
	bh=v2kkoBBpinJ3jfPzo2XnA08muXsaPFPKEp5aH+bJ0ZA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=jSU087KAuu45zyKfvaXitY89KrhnaZcZf7HurTODHAYx8clu6KmScGip5Iv96odOU
	 4gwCE9PnuAo5YUw7ChvD4MTu0CZpE5xNBtEF+GHjRukBuQqN21tPnruSdsaNcnNyHE
	 ly4rDIULMKTvwEnDCD4Fx2RRa9cppGmDEE5vQzukaXru/ff6zjkEcAnGLrSCXJcbea
	 03B/F7VmW9hiiwlML5KfIzLjrpl4x5eGneZu6c1DXyRLJ8750tu8GLpHO3p4zDjI3h
	 tfJ0R8zf46AdBOG4pTm+wctsciOYOCq8HxFg1S2U1rhF193m9y5uNYjF7K3iRP7DmS
	 n0JIGntFLgsAg==
Date: Wed, 4 Nov 2026 12:08:32 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Chi-Wen Weng <cwweng.linux@gmail.com>
Cc: jic23@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, dlechner@baylibre.com, nuno.sa@analog.com, andy@kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, cwweng@nuvoton.com
Subject: Re: [PATCH v3 1/2] dt-bindings: iio: adc: Add Nuvoton MA35D1 EADC
Message-ID: <20261104-daffy-infrared-boobook-aeae26@quoll>
References: <20261030031501.130290-1-cwweng.linux@gmail.com>
 <20261030031501.130290-2-cwweng.linux@gmail.com>
 <20261102-bald-mysterious-alpaca-13b8fa@quoll>
 <0f0324f4-48d8-471e-b35f-7f2d541a70ee@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <0f0324f4-48d8-471e-b35f-7f2d541a70ee@gmail.com>
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
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, Nov 02, 2026 at 06:20:56PM +0800, Chi-Wen Weng wrote:
> > "int" is redundant, so honestly names should rather go away completely.
> > 
> > > +
> > > +  clocks:
> > > +    maxItems: 1
> > > +
> > > +  resets:
> > > +    maxItems: 1
> > 
> > Best regards,
> > Krzysztof
> 
> Hi Krzysztof,
> 
> Thank you for the review.
> 
> I will shorten the commit message in v4 and keep it focused on the
> hardware aspects that are not obvious from the binding itself, rather
> than repeating the properties added by the patch.
> 
> I will also simplify the interrupt description. The detailed ADINT3
> source information can be kept in the controller description where
> needed, rather than repeated in the interrupts property.

That's LLM generated confirmation. Typical respond to prompt. Great way
to get yourself on the deprioritized list.

Best regards,
Krzysztof


