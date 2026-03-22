Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23812D58CAF
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 22 Mar 2026 23:08:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gPKE/vSOihZuXw2svx/3Uprp/cWkpfvpVHgxhrZIESo=; b=Z//Jm/xTw/9qDvH+5QHUbCalXG
	Van4mRVcX3hL5fiMeh+vo1QHWLzMnxzDG2V8/XY8dDyPrTjqNMQPuG/08ztPqRVWV5zNiE2iPX9I3
	WQg4hlVuBuubuC30iTMLTHnYg8LwtyLnqL8Rstkacxbq4a5UnAw5rNa/I9YxST5n3WD1cY/aJjE43
	O6reqluwRsIMQ7AIWU+PJ4eFzF3GswXdiHhEMrKxGtxm2xxMsTFrx84OoSzUmYe7gHxusdBWqNslt
	anBxPjlBTzAF1hgHGFWQKPFOTCj6CqgmMB8w5fsxKP05bUraTmBsY9cbCAxqgRlCM3fHZ/45Sb3Vz
	hmGDLdUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4Rtz-0000000Fjrs-0kkb;
	Sun, 22 Mar 2026 23:08:11 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4Rtw-0000000FjrU-3cNF
	for linux-arm-kernel@lists.infradead.org;
	Sun, 22 Mar 2026 23:08:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id ECC3140A21;
	Sun, 22 Mar 2026 23:08:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B325C19424;
	Sun, 22 Mar 2026 23:08:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774220887;
	bh=cS9fnBLUaiAxDgJ4h9rJnb6mgZnkEly0eecDci0Jflo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=s1eZG+m44A34AAcPnyJ45jYAnlY5Y02ieiSkTpmTSwFgdnMvBM/lUHVsHL35m8+PX
	 x4OoFyJB26NE2aghErBEbHe1Lj3vIuTl6OqFqkO+7GXEgC6n5QT4xco5B8Vcnk6NmG
	 2j0RU204vWHN+nexvY0H6qy3U6cQjOk1kqdt9ihLPdD0avNQth2JgM0+Y7vF9DxGo5
	 B8biCHalnLNM/3wZnqrmwXlSQ+bpzA2iGZnQG2cWUb9KXOwu62AHkwwrhMSKuebV+i
	 2EnKBT01dsP0aWWJ6ju4oBfqj9Cp6hEsaJ4B/bD0Q9vQTuBU1PV7NCu1WylqdBRsnK
	 MfXBFXqI3cLPQ==
Date: Sun, 22 Mar 2026 18:08:06 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: =?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
Cc: Ulf Hansson <ulf.hansson@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	devicetree@vger.kernel.org,
	Peter Griffin <peter.griffin@linaro.org>,
	Will McVicker <willmcvicker@google.com>,
	Mark Brown <broonie@kernel.org>, kernel-team@android.com,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Juan Yescas <jyescas@google.com>
Subject: Re: [PATCH v8 04/10] dt-bindings: soc: google: gs101-pmu: allow
 power domains as children
Message-ID: <177422088580.68999.2696628451454506531.robh@kernel.org>
References: <20260318-gs101-pd-v8-0-241523460b10@linaro.org>
 <20260318-gs101-pd-v8-4-241523460b10@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260318-gs101-pd-v8-4-241523460b10@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260322_160808_922554_7E3F3DBF 
X-CRM114-Status: GOOD (  15.98  )
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


On Wed, 18 Mar 2026 15:27:49 +0000, André Draszik wrote:
> The power domains are a property of / implemented in the PMU. As such,
> they should be modelled as child nodes of the PMU.
> 
> Note:
> Because the properties added are 'required', this commit breaks DT
> validation of the existing DT for Pixel 6, but a) that's simply because
> the DT is incomplete and b) a DT update will be posted once the binding
> is accepted.
> It is not possible to write the binding such that it supports old
> (incomplete) DTs in addition to the full version, but as per above
> it's not required to keep supporting old DTs.
> 
> Signed-off-by: André Draszik <andre.draszik@linaro.org>
> ---
> v8:
> - move comment from commit message footer into body (Rob)
> - fix incorrect use of ranges in example (Rob)
> 
> v7:
> - really be consistent with quoting (Krzysztof)
> - drop invalid tested-by tag (Krzysztof)
> 
> v4:
> - consistent quoting using " (Krzysztof)
> - add samsung,dtzpc to example
> ---
>  .../bindings/soc/google/google,gs101-pmu.yaml      | 41 ++++++++++++++++++++++
>  1 file changed, 41 insertions(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


