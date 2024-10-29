Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7DE7D13594
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Oct 2024 07:17:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U2gbBHr5p2eyQ55QdLvmfRdklm8hkeuS5nyt8ZPmoQA=; b=AhtAf053h9d5pd20uvlQeWWTBZ
	3EBcWyaVBzoGS5xPsYG5RcATS+TNthNkegus4uZ7km/kzvjuobTK1WrawQXnqbgbMmnXlyjhkSEEC
	9E3jyJoyJxhLKQk09aw9qLI7o2f6Rbh8roWGGhVnLlWfA2mG3Do4vj3qNukO6NKdPapk4EOJW4AU5
	3JcZRsn9fmQFS6oKQu2g0J986GEkTQgbnQzmseXwuQzBc/IG+3c9g0KoVcKUgUK25iYzZChQqFYge
	6CP+mpW8lwJ8oykXdDzK7t+IyDJ8Az1MRf374gGzJHGpxYKjdPzimiDv9FZoHyPYq6SeCNrCHiGnR
	/Hl99jXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5gTX-0000000DTXu-21ka;
	Tue, 29 Oct 2024 07:17:11 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5gN2-0000000DRyR-1psQ;
	Tue, 29 Oct 2024 07:10:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 53503A414E2;
	Tue, 29 Oct 2024 07:08:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A272C4CEE3;
	Tue, 29 Oct 2024 07:10:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730185826;
	bh=EO032NXE9PkRJOzWtE2Jyo8yYUI2qKerjCpFA489KL8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ei3l9Zb3PXeU5l+wtwuGRq5uL9QbHjfUVHOG/D25ZEkIUEsrociR55GLAtNOYc7Ol
	 op87vgFPkRTAwjveEuYPuYzjMyNzdf4F26NtcQ9NnvA0fefu70+fHR4pHV23eaAGGT
	 ZoLVW2WdwRMHeM2NJmAAMx+f6FLiciGM3g0TJLCnJeZoIkvZ5utoK6OoauMRwCbdrp
	 vIWNilUX2uToPemZKFMLy4XSCvCpSDfqaY3C3jWLseJBDbXx8TVwVBH1ZvBYaNWS8Z
	 A4UAXt8MG8S7SoQ+IdKnkJruitCnLB/h/osDPVXVUaUz8et7Y6jvirEy6Jbg/31UoV
	 RSiG0B8fbfXOg==
Date: Tue, 29 Oct 2024 08:10:23 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Karan Sanghavi <karansanghvi98@gmail.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Shuah Khan <skhan@linuxfoundation.org>, Alexander Aring <alex.aring@gmail.com>, 
	Eric Anholt <eric@anholt.net>
Subject: Re: [PATCH v4] dt-bindings: power: Convert raspberrypi,bcm2835-power
 to Dt schema
Message-ID: <bdze3425qwrtlvlairw2b4xiycpkmhirzhqn2jt6jngc3bu4ta@uo4nc2lnj4sf>
References: <20241028-raspberrypi-bcm2835-power-v4-1-acf44abd45ff@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241028-raspberrypi-bcm2835-power-v4-1-acf44abd45ff@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241029_001028_601367_BB761A5A 
X-CRM114-Status: GOOD (  12.17  )
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

On Mon, Oct 28, 2024 at 04:44:12PM +0000, Karan Sanghavi wrote:
> Convert the raspberrypi,bcm2835-power binding to Dt schema
> 
> Signed-off-by: Karan Sanghavi <karansanghvi98@gmail.com>
> ---
> Changes in v4:
> - Corrected misindentations and random differences.
> - Link to v3: https://lore.kernel.org/r/20241026-raspberrypi-bcm2835-power-v3-1-6621e075d33f@gmail.com

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

<form letter>
This is an automated instruction, just in case, because many review tags
are being ignored. If you know the process, you can skip it (please do
not feel offended by me posting it here - no bad intentions intended).
If you do not know the process, here is a short explanation:

Please add Acked-by/Reviewed-by/Tested-by tags when posting new
versions, under or above your Signed-off-by tag. Tag is "received", when
provided in a message replied to you on the mailing list. Tools like b4
can help here. However, there's no need to repost patches *only* to add
the tags. The upstream maintainer will do that for tags received on the
version they apply.

https://elixir.bootlin.com/linux/v6.5-rc3/source/Documentation/process/submitting-patches.rst#L577
</form letter>

Best regards,
Krzysztof


