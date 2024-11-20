Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51ADCD6E2D2
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Nov 2024 08:29:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SnrNpt481bFjFOWYHOj8+5+1Y/gn4MZcw71jG86uXjQ=; b=hVf2U+WP8fNHxtJdap7ELXb7Jn
	KAXkyFXVxai9vbPG7nWiOdrTK1BrmrkmkB4tHhO8Sh1w7MBDGVXGko5H+4fFYgAGeO1ihRXniaZZM
	MqBCeUb2q/WgzaVcyjwqEMKqQ44m9pwYPJdfnM2h3crhtNRGfvQ+79W5444gLZpwTW9QAeT5SvTyF
	CPPYayg5yOvlaCbhyKTLtwwJwy2czbKV1T6Q2iMAKBpy2SJXpvvpHVHuavCLM+KUld3NHPjNkxzfb
	DDEBEblvmT3teAOzPJX52hYAHRdJesTaQ/AafJvZ9JiJafrnCEo5gYJzGqP5bwamSH5o6AezH1JY8
	J/Wqr7NQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDg5D-0000000EkrF-2Ft0;
	Wed, 20 Nov 2024 08:29:07 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tDg49-0000000EkcV-0DHU
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 Nov 2024 08:28:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id DFA23A42D62;
	Wed, 20 Nov 2024 08:26:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3CBE5C4CECD;
	Wed, 20 Nov 2024 08:27:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732091280;
	bh=SnrNpt481bFjFOWYHOj8+5+1Y/gn4MZcw71jG86uXjQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hyf4p+jLqWNpvWPhWsWUyWiof86UtkM/be6WhrO+1+y5UMS67WXaDKys1sJA6+HBM
	 Sc+z7k88o1jfLp4f5vtKYeMmcQK4oKh+0tPhkEI+MsqxjEjaAImZdPM3+FMQm9y+L8
	 vPtNW+AZ5gNudF8x+iF176dMQaAnnmqfS98tBXGiUW7fCs2g9fannURoEHNBC/K5MT
	 496Oazw3dBaYyxuvWY/Cus/hp/LYFVM5TlHQVjJaM8DnQxTMofj9TuLMq+ccauGtZc
	 UubDdP3qE/EYhdQKxaxxr12R0wM8sIM3Zx599eXzqQ9pHYBCq6m/9mCXc+6N7u3dQk
	 EYNV+7pspIVXw==
Date: Wed, 20 Nov 2024 09:27:56 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Matt Coster <matt.coster@imgtec.com>
Cc: Frank Binns <frank.binns@imgtec.com>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Nishanth Menon <nm@ti.com>, 
	Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>, dri-devel@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Randolph Sapp <rs@ti.com>, Darren Etheridge <detheridge@ti.com>
Subject: Re: [PATCH v2 04/21] dt-bindings: gpu: img: Allow dma-coherent
Message-ID: <dvqeqopwztjk2odgtdzsncklj36aaii3wsmzsf4b2qlsv55ru5@wplvvf6oqmvz>
References: <20241118-sets-bxs-4-64-patch-v1-v2-0-3fd45d9fb0cf@imgtec.com>
 <20241118-sets-bxs-4-64-patch-v1-v2-4-3fd45d9fb0cf@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241118-sets-bxs-4-64-patch-v1-v2-4-3fd45d9fb0cf@imgtec.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241120_002801_155435_26DA26BE 
X-CRM114-Status: UNSURE (   9.17  )
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

On Mon, Nov 18, 2024 at 01:01:56PM +0000, Matt Coster wrote:
> This attribute will be required for the BXS-4-64 MC1 and will be enabled in
> the DTS for the TI k3-j721s2 in a subsequent patch; add it now so
> dtbs_check doesn't complain later.

That's not a reason. You add it because device is DMA coherent, not for
some imaginary future checker errors.

Best regards,
Krzysztof


