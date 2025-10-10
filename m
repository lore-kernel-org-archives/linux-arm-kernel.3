Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1B03CCA476
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Oct 2025 14:14:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WAtDJnbP+YhJe5uLNaouK8tSzc45sXMIG4YHvV7HSXc=; b=RlLZTZ9j3P27nkDgp9QEmAk1nD
	jmJoNAE1MOnDribL5iEq8ix+ERDyhV7JSkIKeUDOZkteOKQQWaCacrbHprZLunLUuIB6FnRQw6Fyp
	MGcQmQcMLvwZvk/5TvzWJeKflqpbVb5MlaCOUm/Easb2CNwly9eAK2lE56s9Ixe5RnVVsBXUIbSjX
	ZdQOyMYOtDXsnprojWOO+6NoKQhfB/pvJ6WYisewHivvYrklG5AmXu+VE60z4usgj7AKo4x7dR2L/
	JFI7/+ie7r20DRNPAN9jkGFVf4DI3WXebi3LFZXd5qEZy+/udZVpAzw9LV7onC14lYe/cCx5yi0di
	rJ4vzl5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7Dsf-00000008e1v-06Wt;
	Fri, 10 Oct 2025 14:14:01 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7Dse-00000008e1Z-1b7q
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Oct 2025 14:14:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 7A79F6265E;
	Fri, 10 Oct 2025 14:13:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8969C4CEF1;
	Fri, 10 Oct 2025 14:13:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760105639;
	bh=A/9vTnU0ngIvMSKiBV7pVXM9Nx6z4gz//N6Gk+nd5r8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GYD5jrSUgbAZexvCkuk9uiJYWiz0fDuY7Oh8X+fFOlFcjEfHPQ73ELn0MZEBOGWTG
	 6Kzade07nj7deIgGH3OF2zZYVxBVjbXt2ldD7mRubGg5Uc/s+PJQe9lq7fVViTnogp
	 xVffTZPZNyyEKI+ZK+YoT7eZQsskunkq1Ui5u2qEejXsNFZqSTHEC3V1n2pXV7FjUg
	 OUJT7/JP9kNsHc8FxzRiwR+GI9fFkqXOu8EHMMAnTcjqrduDgNF65AmcF+5LKSSW97
	 NmvBzPiZ4i8JNE1im3zel/3oe09HI5KzEjgrmTrCdLIgd8tWL2uMppcuJ7GlsYBUNa
	 QPgV6/wdIOhTA==
Date: Fri, 10 Oct 2025 09:13:57 -0500
From: Rob Herring <robh@kernel.org>
To: =?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Will McVicker <willmcvicker@google.com>, kernel-team@android.com,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org
Subject: Re: [PATCH v2 03/10] dt-bindings: soc: samsung: gs101-pmu: allow
 power domains as children
Message-ID: <20251010141357.GA219719-robh@kernel.org>
References: <20251009-gs101-pd-v2-0-3f4a6db2af39@linaro.org>
 <20251009-gs101-pd-v2-3-3f4a6db2af39@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251009-gs101-pd-v2-3-3f4a6db2af39@linaro.org>
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

On Thu, Oct 09, 2025 at 04:25:05PM +0100, André Draszik wrote:
> The power domains are a property of / implemented in the PMU. As such,
> they should be modelled as child nodes of the PMU.
> 
> Signed-off-by: André Draszik <andre.draszik@linaro.org>
> 
> ---
> Note: Ideally, the newly added properties (ranges, etc.) should only be
> 'required' if "^power-domain@[0-9a-f]+$" exists as a patternProperty,
> as they're needed only in that case. As-is, this patch now causes
> warnings for existing DTs as they don't specify the new properties (and
> they shouldn't need to). Only if DTs are updated to include
> power-domains, such an update should also add the new properties.
> 
> I've not been able to come up with the correct schema syntax to achieve
> that. dependencies, dependentRequired, and dependentSchemas don't seem
> to support patterns. Similarly,
>   - if:
>       required:
>         - ...
>     then:
>       required:
>         - ...
> 
> doesn't allow patterns in the 'if' block (or I didn't get the syntax
> right).

This is a known limitation in json-schema. Not sure if they've come up 
with a solution yet.

Rob

