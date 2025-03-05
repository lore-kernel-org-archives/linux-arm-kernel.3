Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64B61C282DE
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Mar 2025 16:03:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z329ElrlSp3rQHppigkdIVXSICv/TbxnBscusxoOv24=; b=DH154vwX2xi/EYqmvYYWshnpyQ
	TGGsHzmum5Y2PcwFcg9306L4ST4QAGDYl6NmCzsU/LPnVtHdk9NbS0RFnvCQqHpNZjrkm/74NV5nt
	cN2BCb5kkNjhibPtDpUU4SXvEP/fgDyvEEsVNaRfZXpbE0pzli1TRrcGuFYK4ZmpYu9ybeppKDeFC
	w/dr7DDjvJpHegcWgWSdNC/kPUDKZ6jCXA/IqViMG8Ar4lYt1P6qL/aZ6AVrl5b/ZiiMdhsyq3N+h
	Ji6+fpaydQUdYKdNJwr2mX96DLA624pFw2/l5L2CqLpYYkckW7rhqntU76GAWjyG7dWi18CSAGQwb
	VagXQV4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tprDj-00000008bRJ-18VM;
	Wed, 05 Mar 2025 16:03:43 +0000
Received: from out-189.mta0.migadu.com ([2001:41d0:1004:224b::bd])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpq0e-00000008Oip-21St
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Mar 2025 14:46:11 +0000
Date: Wed, 5 Mar 2025 09:45:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rosenzweig.io;
	s=key1; t=1741185960;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Z329ElrlSp3rQHppigkdIVXSICv/TbxnBscusxoOv24=;
	b=jQZX5anT/ko5/mYm0pMPS1Y+rc5VQkGiE84sLqQvSND1ZGpDwx5bqNeIwukC8GWvTOiwpL
	1REMtXHJxYGZWst1d7jx5kxyyELwriPt9Vsy/N59jY4egAZZXQyOm7HMUHjx9fjnYzTUY6
	/wqyO6vOQtqtXYrfMxR6REWSlMGrLI+VwryHoZn4KSRDANskvTQQXxgFSeoXowrP2KjO0E
	NlcSMhJUchdJ1pr0xQDcmf32ygWMeax6BDUdGb+NK1gjW5JN6e8hQfyaXTBzHLlDyHWWLP
	ZRXJED/XUXq/nuEZJ3SCjd4kkhyqCGbtj/78++gDX5xRVOPB1LdJ1tt3c/amVg==
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Alyssa Rosenzweig <alyssa@rosenzweig.io>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jessica Zhang <quic_jesszhan@quicinc.com>, asahi@lists.linux.dev,
	Janne Grunau <j@jannau.net>,
	Sasha Finkelstein <fnkl.kernel@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, Alyssa Ross <hi@alyssa.is>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Neal Gompa <neal@gompa.dev>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Nick Chan <towinchenmi@gmail.com>
Subject: Re: [PATCH v8 0/5] Driver for pre-DCP apple display controller.
Message-ID: <Z8hjnRyCn82OrDcO@blossom>
References: <20250224-adpdrm-v8-0-cccf96710f0f@gmail.com>
 <174118223158.156873.6982508045942987984.b4-ty@rosenzweig.io>
 <Z8hZKW_F-HtzYm-w@blossom>
 <18f9658f-f2ca-4fd9-809c-ec4d198072be@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <18f9658f-f2ca-4fd9-809c-ec4d198072be@linaro.org>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250305_064609_731598_47F90B23 
X-CRM114-Status: UNSURE (   6.99  )
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

> Yeah it's because you applied the whole patchset, and discarded/skipped
> patch 3 & 4 afterwards, so b4 gets confused.
> 
> Next time specify which patch you want to apply with -P 1,2,5
> and b4 with know which patch you applied and generate a good ty patch.

Ah nice, didn't know about -P, thanks!

