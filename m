Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E039CF6497
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Nov 2025 00:09:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fxsxdD7YuT1egFvvLn0e2G1Af8bpOHKGSorczfneMUM=; b=eQ6/HiGbwG9cb84kJg6RRXLk2t
	oq/T6bIEGpq2XvvliwRE8nivJWNYwD5l5L459w0JXyRO003EqichSqr+jEtzq3jR5tqkD/h8pWtCO
	ZelgN830031yFDIpE2Fpm8c6R5C3JIKlbxueijj8nRdUXu04GYo2dpZXXtXy1760OTfJMYQNw2JGW
	NfeWnQjGVhTEJuv+SzXVKGIi+bmBWvVvCnHh5JLXc6hzk0BZuB4DK0rs69g5QGe2REB5ujn87feSz
	OMht7/5DqutLmsS6dQpqmgi5DleF6yy7Oc1f7bBPaYKIPbkPPhTqiNnVguEAVjCZLKwdAZxcEOyiN
	ykndZrhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLsF2-00000005rgZ-392x;
	Thu, 20 Nov 2025 00:09:40 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLsF1-00000005rfh-1pgw
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Nov 2025 00:09:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 9717360010;
	Thu, 20 Nov 2025 00:09:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DEA58C4CEF5;
	Thu, 20 Nov 2025 00:09:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763597348;
	bh=bI1hJPeepEDCllDijUB6qbqgSNpihc1cIDuIMmez/q8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Oimvl6kVMjefJr0p46lkwTVZpA1S/VXpJrh6kB2QI8hrej31IgA76bY8dvOECDUHE
	 Z31pJgXwNwlq8lTDNg9kX+TBDofM6AC9WjYDiN7MIDbHD4BCzRmz17CVTlXOu0sruV
	 WOz2R+DI2cUSEsOj+f5wk3Z7Oc/9QEz9ga2gkjCeniXrL6fxyQoaiYGtpkSQ01M7pC
	 ElbSmiID/k9kMu4MtulpkGRJ1Yh5m943XuQw8gb5OAgMJksp9uEz4s9uv2md7w9wc3
	 YMQ/LhEIMA7TE212GbIwR/WLwcVoK/bOvR9efJGdsEPNnW+pRivvcg8XKr5Se356Br
	 ming3fpVmNuVg==
Date: Wed, 19 Nov 2025 18:09:06 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Peter Griffin <peter.griffin@linaro.org>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, dan.carpenter@linaro.org,
	Conor Dooley <conor+dt@kernel.org>,
	linux-samsung-soc@vger.kernel.org, willmcvicker@google.com,
	devicetree@vger.kernel.org, Alim Akhtar <alim.akhtar@samsung.com>,
	kernel-team@android.com, arnd@arndb.de,
	=?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>
Subject: Re: [PATCH v2 1/2] dt-bindings: soc: samsung: exynos-pmu: remove
 syscon for google,gs101-pmu
Message-ID: <176359734563.3602720.3498297116767646950.robh@kernel.org>
References: <20251114-remove-pmu-syscon-compat-v2-0-9496e8c496c7@linaro.org>
 <20251114-remove-pmu-syscon-compat-v2-1-9496e8c496c7@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251114-remove-pmu-syscon-compat-v2-1-9496e8c496c7@linaro.org>
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


On Fri, 14 Nov 2025 12:00:16 +0000, Peter Griffin wrote:
> Since commit ba5095ebbc7a ("mfd: syscon: Allow syscon nodes without a
> "syscon" compatible") it is possible to register a regmap without the
> syscon compatible in the node.
> 
> Update the bindings for google,gs101-pmu so that the syscon compatible is
> no longer required. As it isn't really correct to claim we are compatible
> with syscon (as a mmio regmap created by syscon will not work on gs101).
> 
> Additionally (with the benefit of hindsight) PMU register writes were never
> working with a MMIO syscon on gs101, so the ABI break is justified.
> 
> Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> ---
> Changes in v2:
>  - Update commit description (Krzysztof)
>  - Change Items to enum, remove const (Krzysztof)
>  - Checkpatch warning commit msg length (Krzysztof)
> ---
>  Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


