Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E92ECCD1BE
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Oct 2025 06:34:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D2PTmYOT8hDSErFJQKrvndrwlAQoD632GmelzECD21A=; b=OxewNpjBZ0286Yvz6jDoW7ESFt
	MmWBUC+cO6RajjBsbB9dF/DPjvcq/zPJiah6ibhvzexDvr1CDtlL9l2sDgBKHNg/PuQOGoAKq4MbB
	pnQTq3HdqwBBXDycRlyxe47mFrf6dzaZtWBFNa88SSet5dJCT++HfqaqeJ84liqwbtZ7xnRUdCxu8
	8QKvFW+wX+43ZxElB7yaPHXlVfwxYFlU2nSaGd+VXGq2pDHeVxSis4fSwVzDdci6iWxXGd8E6plTd
	0h9cbDZ2uSpcLzu9yEio/e21NpspMerlEnRPRZFvn3gI0gnMbC9levnU6MRbQlqcvJK6m+E8pgvZi
	zg+fq42A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBSQs-00000001gK1-3IqY;
	Wed, 22 Oct 2025 06:34:50 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBSQq-00000001gJT-1v2y
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Oct 2025 06:34:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1942A40595;
	Wed, 22 Oct 2025 06:34:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5908DC4CEE7;
	Wed, 22 Oct 2025 06:34:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761114888;
	bh=D2PTmYOT8hDSErFJQKrvndrwlAQoD632GmelzECD21A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZDO4qd8f22vFrYaO0/g2y2okUHkPeHwKrJyZHuzVii/PTBZtNvdJB++osfbbYH1mt
	 Ve89PKu1ILbGtMtnjTKqs3aoI/SXMCzpMrEVM00QF2VYDWNjaciAPPEwWkxtMkyRdq
	 oXLRqZShToaoQ9aMCIUwUnHpZF19PvDT+XM7JHfyIuVoiy3K+JrTq6zoPRjukDQ6Wz
	 03SCoRpSqj+dJj/tjXZC52svfvOhjGlXqB4LMsEqUz2rdda65pl3sHsyiwaFaXRaa+
	 hckVcONQx8yJzefLKdrlPpZuBgtINnyPGw7THqY+Tbj6wjB0toc4xATH8/EqpQ4CH7
	 hdvk2y6h0pfrQ==
Date: Wed, 22 Oct 2025 08:34:45 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: =?utf-8?B?QW5kcsOp?= Draszik <andre.draszik@linaro.org>
Cc: Alim Akhtar <alim.akhtar@samsung.com>, Rob Herring <robh@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Ulf Hansson <ulf.hansson@linaro.org>, Marek Szyprowski <m.szyprowski@samsung.com>, 
	Peter Griffin <peter.griffin@linaro.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	Will McVicker <willmcvicker@google.com>, kernel-team@android.com, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org
Subject: Re: [PATCH v3 02/10] dt-bindings: soc: samsung: exynos-pmu: move
 gs101-pmu into separate binding
Message-ID: <20251022-tremendous-literate-markhor-a7b98f@kuoka>
References: <20251016-gs101-pd-v3-0-7b30797396e7@linaro.org>
 <20251016-gs101-pd-v3-2-7b30797396e7@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20251016-gs101-pd-v3-2-7b30797396e7@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251021_233448_535295_F0E0EB2B 
X-CRM114-Status: GOOD (  11.40  )
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

On Thu, Oct 16, 2025 at 04:58:35PM +0100, Andr=C3=A9 Draszik wrote:
> The gs101-pmu binding is going to acquire various additional (pattern)
> properties that don't apply to other PMUs supported by this binding.
>=20
> To enable this, move google,gs101-pmu into a separate binding.

You did not copy all the properties which effectively drops certain
things from the binding, e.g. clocks, interrupt-controller and maybe
more. Please list them in commit msg and explain they are not applicable
to GS101.

>=20
> Signed-off-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
>=20
> ---
> v3:
> - use additionalProperties, not unevaluatedProperties
> - fix path in $id (Rob)
> - drop comment around 'select' (Rob)

Best regards,
Krzysztof


