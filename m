Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B533CAC597
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Sep 2025 13:54:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lxJ7wUF8ti5gtroT9v4sZX2mR5jjHWbBOz7fHMy6A7k=; b=4uHYajp1L53593di4vwb8zfD8M
	r8ZwCD3UWLFF2vDAn+0H7v2XYn0IRntPiZWXC/V6Q8twFy5Lg0oy2/r5Qub0e96pqtnJYaNv5LOvy
	qI457mr3/rRfMO6jk45ZefVeIDhwiZ4yTom1vIkWNktWjt2Y/PKoJGGb11in0zYvvdj8dmerILtd+
	sw3wKAaQ6TWzEEHabYi3ehKaAIedGujlVjPSxTNTUacIIsu+AJNkGMV0ZeHmG1N7y5LT8NlB9oTh/
	Jmow8qGGZgDhLyzgA+xcae1gJdK8j5qEN/icgeIfx/ijqzZMxyw+TdX920OI9f6LwMpa1YEs9sVYe
	8pHWfIJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy9ep-00000004Ufn-2xKB;
	Mon, 15 Sep 2025 13:54:15 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy9en-00000004Udy-27fN
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Sep 2025 13:54:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3321540478;
	Mon, 15 Sep 2025 13:54:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E921DC4CEF1;
	Mon, 15 Sep 2025 13:54:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757944453;
	bh=qOUJV9eBECePq2CQHjVZBgTwlguw2q8KASxctp0pE/c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QwBL+zFt9/f633HO1XvfxtV3zZGajB/mazzvHBBT+HNRk7H6V2AHiirGzGJYff8IU
	 EqKEddf5besxFLMvhtubsDGeaAX/AD2rTKm+KXnbMvomGvXzlBd40G6wcF04ILWJwZ
	 9snEGSV+HlmU9hX00Ec0076BqM1+imXQs/zMBbY7hi14QuMNhbpcfxpootp58Unv0U
	 CAR3VUlQRsA+cuNrJ08oqBCWMVPdgQCJZeLOxEn71CmcdclUut+70veJUF3c74wO1O
	 b7Hub8rymrT4v+rMFtHgKdhIzXnbjAdhwKpb44fTULws+g1rMPdHmfwedhMpfpB8/a
	 bL4LV+xWUmaSw==
Date: Mon, 15 Sep 2025 08:54:12 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Nick Chan <towinchenmi@gmail.com>
Cc: Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
	asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Neal Gompa <neal@gompa.dev>, devicetree@vger.kernel.org,
	Janne Grunau <j@jannau.net>,
	Sasha Finkelstein <fnkl.kernel@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Sven Peter <sven@kernel.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/3] dt-bindings: spmi: Add Apple A11 and T2 compatible
Message-ID: <175794445094.2731798.8298770564144793280.robh@kernel.org>
References: <20250915-t8015-spmi-v4-0-758620b5f2ae@gmail.com>
 <20250915-t8015-spmi-v4-1-758620b5f2ae@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250915-t8015-spmi-v4-1-758620b5f2ae@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250915_065413_562916_DB086B8F 
X-CRM114-Status: GOOD (  10.92  )
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


On Mon, 15 Sep 2025 09:52:24 +0800, Nick Chan wrote:
> The SPMI bus found on Apple A11 and T2 SoCs are compatible with the
> existing driver for t8103's spmi so add their compatibles.
> 
> Signed-off-by: Nick Chan <towinchenmi@gmail.com>
> ---
>  Documentation/devicetree/bindings/spmi/apple,spmi.yaml | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


