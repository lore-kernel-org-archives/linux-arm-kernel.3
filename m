Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72BC5CA0EE8
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 Aug 2025 10:46:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rrV+7QCzZxU5WdpD1VvGW4S12MBiDSjiBfxWhMo3siM=; b=rUZXp3wMaK+YmFDiBARumMisIa
	qAix2s7YSV0nbFooWIrhmAvvV+dILWvjI8E4LiS4VnWd0z4qXZZH6xOi2Uiocjec1UY8jNzT9FVU7
	a2VvolUtH+b3kbbvkRqSaBNZtkMRe+S80n2vcjGltfL2AwezK5DAN9CfnawuNDUe9BBOKnvLLZJoi
	OiZvFVNo0LOwhEovrn7RTOvbrqGs2IQ0lRqOxt4Htg49Bc3kmzAET7z8V68ZPS3t9chlZbOJL3MYJ
	ZND/Sd8UlOHx/0LC1dSHeDm2Kne0aPigm3gdjisHvhyrmmkfCJpnHUHMR4qbmoyGymJbRcVv0u4T3
	OrXC9cfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umVTY-0000000Gdgh-1ikE;
	Thu, 14 Aug 2025 10:46:28 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umTx5-0000000GM7r-0t8e
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 Aug 2025 09:08:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 265916020E;
	Thu, 14 Aug 2025 09:08:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 441AFC4CEED;
	Thu, 14 Aug 2025 09:08:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755162529;
	bh=SrgIKHyQzZsNRjZjaedpryVUikg6Qu1TuEDXZ4F66GY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IEhar6bMklvfkyPidpHaCkPhVHC2IBI1dey6oRukc416ApLx9OQoXpnokam4Iu3IO
	 3EhE8j6+HI4tbeLxI0Jo5xc4UpYECb8jj0Xa0GKvLoUxlR6d8ueXSFChmDOuF/7H/e
	 iFVDPVV3Y53BKP6ribAcTfPkS/Lf/9N63cEIYz7ZaZQIYG6iXdk6SPhQI2OT8cjEDV
	 Krs1Zlt5macbMAGdvULwB1vLxE3+8jZehLY42zDEHBoE1XxG4FVWmE/WWqdriKWj+6
	 DSAmRogyfDzfzNltXHf4B5+cT89ZfHionEfAof148q7RynLlADN8wBpD/T8pLCZKwi
	 0JqK1RQh7lJvw==
Date: Thu, 14 Aug 2025 11:08:47 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
Cc: Yannick Fertre <yannick.fertre@foss.st.com>, 
	Philippe Cornu <philippe.cornu@foss.st.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Christophe Roullier <christophe.roullier@foss.st.com>, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 01/13] dt-bindings: display: st: add new compatible to
 LTDC device
Message-ID: <20250814-resolute-lime-raven-de4fa5@kuoka>
References: <20250812-drm-misc-next-v2-0-132fd84463d7@foss.st.com>
 <20250812-drm-misc-next-v2-1-132fd84463d7@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250812-drm-misc-next-v2-1-132fd84463d7@foss.st.com>
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

On Tue, Aug 12, 2025 at 03:48:58PM +0200, Raphael Gallais-Pou wrote:
> +else:
> +  properties:
> +    clocks:
> +      maxItems: 4

minItems instead

> +    clock-names:
> +      maxItems: 4

minItems instead

> +
>  additionalProperties: false

Best regards,
Krzysztof


