Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13EC6C02180
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jan 2025 09:25:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3d3RRSPnGxbUUmCasDGmabONMJEwEbTvMHfKZSeZaU4=; b=SXZ7+ne6/dpcGFff+o5J1D9ur9
	KJ78MGRaOwBtb8SJckKggWLxrDVGbMGbe4qPP+Uo54EA3oEkHdfajfqH/5rCPLJksPe3x7ezT1Lk0
	3ItY6+XsUrUFlfggIdkH67PqCfUO3trfLxUQUuStBj5i5wXLUhU9g2lxtpR6M0NQgAsyA83Y6Yitq
	dvnWBERY3svkBV9DSdmmrJsBMT3WTkLavPMwPdLqUISTvYMulDPeRc2v/5jz6oAGkDDSwgdWMwXun
	R6jW6JZ8LMCCKcRGG4bMFfxGsC6ksIRfaQsQrU8UUpe6em9JYVlzjtC1BhLJsa5MVMbpNdFE5Jk/4
	Lp/YrWHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXzeW-0000000BJ74-1kMu;
	Wed, 15 Jan 2025 09:25:32 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXzZR-0000000BHZj-0yYV
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jan 2025 09:20:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id CF7515C5B70;
	Wed, 15 Jan 2025 09:19:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9DB92C4CEDF;
	Wed, 15 Jan 2025 09:20:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736932816;
	bh=9IC2ITDoqFLeYAWBTaUiKf9L85RT7I7RXmH1ALPuiPA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ngHQV0YYiGUmLQ3GMW/bSgVJyL+0cGa7o5MuWDvPhJiGMa4Vg2QFd79kgYmtc43t1
	 hMeetbu9mkfqT5QC+WL2HsNekIxQzDQyO8jHjIDEpZLHEBPZ5zY/7moJyRvk69exlH
	 jv/UvIrXWeAthY1R0Kj7okaRdvmUwUaaMU0ckPHv0AVkfG6V0AyGurzTQsLxXuhXul
	 ZORvArkMH3ikTu1L32gXYQUhIZnP1O9UhGaf/NfLYsxeG0TZRgcisnb/aVfkLjDFsR
	 sIT2t9vusb3ZgMU0oLr1KqEt3A3wjjTmWViaFM6ALK57Mh52bJhrzDJKzyPfT2lOEG
	 8xnozbUtmFmjg==
Date: Wed, 15 Jan 2025 10:20:13 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Sasha Finkelstein <fnkl.kernel@gmail.com>
Cc: Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>, 
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Jessica Zhang <quic_jesszhan@quicinc.com>, asahi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Alyssa Ross <hi@alyssa.is>
Subject: Re: [PATCH v4 1/5] dt-bindings: display: Add Apple pre-DCP display
 controller
Message-ID: <adzdihtqgtyhgr7cdisiekzqqt65uicwmgspyat4vw3kpytqya@3bvq5bnsso3g>
References: <20250114-adpdrm-v4-0-e9b5260a39f1@gmail.com>
 <20250114-adpdrm-v4-1-e9b5260a39f1@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250114-adpdrm-v4-1-e9b5260a39f1@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250115_012017_311247_918AEA38 
X-CRM114-Status: UNSURE (   9.64  )
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

On Tue, Jan 14, 2025 at 10:38:52PM +0100, Sasha Finkelstein wrote:
> Add bindings for a secondary display controller present on certain
> Apple laptops.
> 
> Signed-off-by: Sasha Finkelstein <fnkl.kernel@gmail.com>
> ---
>  .../display/apple,h7-display-pipe-mipi.yaml        | 83 ++++++++++++++++++++
>  .../bindings/display/apple,h7-display-pipe.yaml    | 88 ++++++++++++++++++++++
>  .../bindings/display/panel/apple,summit.yaml       | 58 ++++++++++++++
>  3 files changed, 229 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


