Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C46BECA1013
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Sep 2025 19:54:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=si2yUjI1luwwtYdCqfyhBqaW9ko1+J9dQRYEbQ1BEgE=; b=ATPsNW5YfrTDZ4M3Av+3bVSJak
	Diltu1XLDA5V3DBJytLhNe4kgcQXy3AlpeOoLDfh8wHZcmozGp26etUmwgZ6s+8uZgg8lWGscYOCH
	newFEateCqszR/73mg9+cQXRW28NV4AmH2KZLYA1OZvJuHybLnrDGdZi2jxTmz4SlntbQwXyOPudn
	zCNvruvtxCKDqSAm0s0O/jtWWXwZ27/eX3StsK19gFiFcT8Oo0zjuK1Q/myhaqvrJIY5+qmROIdr7
	zGMsF1YySgWDGT/JEc/tIcxmO6G4kr3WGPrRBmJJNUYG9ooI/QxgbpDdWr+k6kxnt6PFl1LrrB6Wa
	V3UuUO3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzKhe-000000012Xo-1PRm;
	Thu, 18 Sep 2025 19:54:02 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzKhc-000000012XU-0vzL
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Sep 2025 19:54:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D5BD5445C3;
	Thu, 18 Sep 2025 19:53:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C61DC4CEE7;
	Thu, 18 Sep 2025 19:53:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758225239;
	bh=XPINndy9CqjB8RtVY9lpJ7pMHtnLQVCK9BiVb/6M/Yo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iLErXogfkcD7ZzKJgdDVzD4vRiwcx3YcxGVc2TWPITUnV9Hy9Xhse1y/HqN/FX9YX
	 pjCf75S8I1ffvj7pk6POyioN6P4FxxiJOdhCTSEVR/lCrh3UehhAKMxY/kdMpa2jMo
	 AsBKJTZAvCddMtAFgaA+5vrH71sf0v98OPn/tjbFckBpxniaUyhzt48BFDWoDPN+lN
	 x50K7sD32TX7kQEhMcoTmpdHZg1iPacrdHGUS1+yI7vUS/ADHBJIwBZO/khOSBMZmN
	 BEUMqJnfCCEGR4huLxKTgnKVmAAYymykUzWXO43lmDR7QFEC7ehwUkkpqr2Twq053m
	 VFdyuicyKHxWw==
Date: Thu, 18 Sep 2025 14:53:58 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-perf-users@vger.kernel.org, Will Deacon <will@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	linux-kernel@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] dt-bindings: arm: Add Arm C1 cores and PMUs
Message-ID: <175822522990.2521066.13725879500851779588.robh@kernel.org>
References: <20250915140508.2806590-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250915140508.2806590-1-robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250918_125400_280751_394BFD88 
X-CRM114-Status: UNSURE (   9.33  )
X-CRM114-Notice: Please train this message.
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


On Mon, 15 Sep 2025 09:05:07 -0500, Rob Herring (Arm) wrote:
> Add the newly introduced Arm C1-Nano/Pro/Premium/Ultra core and PMU
> compatible strings. These cores are part of the Lumex CSS. The new names
> are replacing the long lived Cortex-A/X branding going forward.
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
>  Documentation/devicetree/bindings/arm/cpus.yaml | 4 ++++
>  Documentation/devicetree/bindings/arm/pmu.yaml  | 4 ++++
>  2 files changed, 8 insertions(+)
> 

Applied, thanks!


