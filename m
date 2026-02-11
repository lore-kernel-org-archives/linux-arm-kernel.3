Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE698ECD6EE
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Feb 2026 20:59:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FFjPuFFBCjdXEWe5Xmeo7Fh+8/ZCi4FI6cxpcm5nGaE=; b=Xx2QwEiBQBPyb5jSt4vsN0roJG
	0lBqdqkt2IPIbnuKdb32aA33XPvkT5R1AZ+ihA/nELcNBNj/BcZkcQDfmBwHnkTzQ70wJ6ajmKGuj
	O5PKSDmilwvpd5ZpFJYI/DQJYpKd5HatwbMtPKmnWIu2c+ztgbHlzUZyw3mUVwPvGN32RaS6aPEmV
	pnPtV3rGuxKu+nMwAzGbQt3/pL1rMmegdysLZn1CBLc4ZBB6jv59cUYo4MHYH4fRbAZof27IMZN9v
	K5STPpAkfg9y8hGk0247bPKLCBPyFKp3CMdXeFxUj8jIbqGnlFtV62v+7IUh440aq/8zYchPEPDdC
	KeRti3mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqHIc-000000012q6-3qsi;
	Wed, 11 Feb 2026 20:59:02 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqHIb-000000012py-1ANn
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Feb 2026 20:59:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 2214860010;
	Wed, 11 Feb 2026 20:59:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A15EBC4CEF7;
	Wed, 11 Feb 2026 20:58:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770843539;
	bh=qdCaHBM1vsBZYUsiwQrhAgP75Pv4fk+r6MNmnFrGo58=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qYLfzg7jzD96tci/rXKGqs/81bavX1iBCE8FR3GapJZKETE91rDNxGzZAkP1gcQAy
	 KRP4yVtBb+MKhsg8yZrKYgtRqqLlJk024qEdA+TRD8fYD4IlboKPho+v70yGX8WO1W
	 48zKlPnlele6pP6oFcsDSYSvQ3xPPgIF4VrNGg0+k/mu7ILJqHSecm+shFQ/Hhnb2l
	 6Ojgtfjm6fRd54LLgcafgpDOrI1bnOQfF2gYAi0yacGPJEWrs6F5HsTViJvgJRZ5SR
	 okQvEx1A7b6ESa+RWBMSDTjUQ9XwJ0fXuz1CPHqfZ+rn5UCTzQZaB6w8yTWhX1FBZO
	 Hy6kBhDpCCejA==
Date: Wed, 11 Feb 2026 14:58:53 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: =?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
	Ulf Hansson <ulf.hansson@linaro.org>, kernel-team@android.com,
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	Will McVicker <willmcvicker@google.com>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Juan Yescas <jyescas@google.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>
Subject: Re: [PATCH v5 01/10] dt-bindings: soc: google: add google,gs101-dtzpc
Message-ID: <177084353310.3872540.16740879904970139914.robh@kernel.org>
References: <20260205-gs101-pd-v5-0-ede49cdb57a6@linaro.org>
 <20260205-gs101-pd-v5-1-ede49cdb57a6@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260205-gs101-pd-v5-1-ede49cdb57a6@linaro.org>
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


On Thu, 05 Feb 2026 21:42:29 +0000, André Draszik wrote:
> The Exynos Distributed TruztZone Protection Control (D_TZPC) provides
> an interface to the protection bits that are included in the TrustZone
> design in a secure system. It configures each area of the memory as
> secure or non-secure.
> 
> Signed-off-by: André Draszik <andre.draszik@linaro.org>
> ---
>  .../bindings/soc/google/google,gs101-dtzpc.yaml    | 42 ++++++++++++++++++++++
>  MAINTAINERS                                        |  1 +
>  2 files changed, 43 insertions(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


