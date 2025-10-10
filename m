Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71715CCD185
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Oct 2025 18:31:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=whnVLstYb2MafR1IaR8Ib9598Aps7S1ePrWvYJa7F/Y=; b=CNzITWDcR/TfO2WUXdhceQowHC
	Zq+8qxOJx/dgmLLZQN9I75n2adJJeEUBZ1a0YhoPXVdLgizdr44x52wKdP9nHbCgRfYKOpUGtoJ+6
	RFfGW4B52vemw8ZSaevSy0IsAF+TYURwoXee6zgY8+xWJnylWQV0/Mi7hf55w6gWfDGuPPNeenKVW
	BeaoBvwCURlrN4Lro++fbVA3PkfHT6bFmilklUkjqZwHWN3HOMDMywpPb1ohs71pUR2Smzuscyi8I
	W3QJHZI75jxI0Cxdkr6R9TtPeiUU/bqaCEooWBj/Ode8cjpZdU+NDn60nvstV5wGkM4Ay4rMwrYlT
	hIfZEXxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7HuB-000000099HG-1DIn;
	Fri, 10 Oct 2025 18:31:51 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7HuA-000000099HA-09AD
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Oct 2025 18:31:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 6EA856271A;
	Fri, 10 Oct 2025 18:31:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB1ADC4CEF1;
	Fri, 10 Oct 2025 18:31:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760121109;
	bh=n1Ip3VvLU5moVpOWLPfYC3hSao+rKi7mKusI1LUk6Ms=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ORudNF6LNV+Tar7mZ6lqKmbbGNMrq5scimqHf/ViC3tsvfTkijYm5d68QLoFkCiT/
	 KEYBzgF0nl2pFBA7pb4ZvEjfjdlKQP21cpAjSgCN9E7uNDD7uzxAjMiRj234gGwo7E
	 KX9cNY2eG6C0T+jp0wCcs6DpiZ/v+wE1iygmctqGPUNexAFwGoQI6Ds8XXagqus1Dy
	 GsJJ6udXfxVS3faP9AlV/VU5GVrw7OqIxjynYh4pXBfQ5hUZDW7pyAoFKqNUa4bHKt
	 d64yv/t+qH7OnKXp7qrsYqU4qmjJt6HYR5BoYXejmyrwswehIHcpXIBMS/pILG0Hq6
	 yx5ZZsVxRw/Wg==
Date: Fri, 10 Oct 2025 13:31:47 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: =?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Will McVicker <willmcvicker@google.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, kernel-team@android.com,
	linux-samsung-soc@vger.kernel.org,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Ulf Hansson <ulf.hansson@linaro.org>
Subject: Re: [PATCH v2 01/10] dt-bindings: power: samsung: add google,gs101-pd
Message-ID: <176012110602.673033.1312725793762459039.robh@kernel.org>
References: <20251009-gs101-pd-v2-0-3f4a6db2af39@linaro.org>
 <20251009-gs101-pd-v2-1-3f4a6db2af39@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251009-gs101-pd-v2-1-3f4a6db2af39@linaro.org>
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


On Thu, 09 Oct 2025 16:25:03 +0100, André Draszik wrote:
> Add support for the Google gs101 version of the Exynos power domains. A
> new compatible is needed because register fields have changed.
> 
> Reviewed-by: Peter Griffin <peter.griffin@linaro.org>
> Signed-off-by: André Draszik <andre.draszik@linaro.org>
> ---
>  Documentation/devicetree/bindings/power/pd-samsung.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


