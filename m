Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99503E81BD3
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Feb 2026 17:58:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7CKgCxZAAUT1HusqPU+zj7XPVhCGxirQM1iuFr5+TFI=; b=SFiD/INJ4XwzE1QVkdPSjucLog
	kawU1pxC+LVHz7bieI+ErMWNo+wixJvciZxcIqkAZBUv6WZc3IuZ9bY/6hMZYPEd4aXO44ACm5cR2
	PP9u0LGa5Jtm71YyJ8PMdIHSo9s/scqrVDh53q5GLjgYZy3W8VUAKknU/+slIrOFeSs3I9u2q9Kvz
	nHrIEMMcyPmkIHAkbylhyqm+KiPQQiG3jOTx12ffHRCmZ8mldvoy/gScziEKrur8VdeQFp1DhYWVJ
	2PHtUiMZNZxdenIquPhbht0iGbi39+vkfPc/WRA1hqCQ+b5/mDymohKF5otnkTzPCJNbJNETjhyVI
	GEHfIByw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpVWn-0000000FobH-2exK;
	Mon, 09 Feb 2026 17:58:29 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpVWl-0000000Foau-0cBY
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Feb 2026 17:58:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B726840BEC;
	Mon,  9 Feb 2026 17:58:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 642C2C16AAE;
	Mon,  9 Feb 2026 17:58:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770659906;
	bh=vxxNB6nWgY4FeC3V5k11CvbrJUV7Z/hmMTpSNLsLNYY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TX3H99972Qth3fjJt7lnW+yMbsYjeoJojgZeRvCZ3IxPlw9u+b/Sn0ZG+byjFcPSi
	 dOsp9XYpZKiDIeYjqmnoja08c4N+PSTVf2Aj4yhceOIFa8dp/rw7/jVP8X+fs12K+C
	 vF59Dhb8oOkxuyeEBabgcYbX/vECmOnbFe33w28a+piwe5LMiAEOCN/7BZeNNVd3kI
	 iBG1/uVHXUYsV8iQJe6WzTJcLFHYSNLjJ2eoyP8mYDv7hPcqu3+V9R1W4CUsElbFzD
	 Q6hRPJ9WQVfk/xWGFZe+cIvSRfVQq88nJ65vr5l73m6XGpXjUgmaaV/PgVR/uxKVHH
	 eQcmel4SSF71g==
Date: Mon, 9 Feb 2026 11:58:25 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Dominik Haller <d.haller@phytec.de>
Cc: conor+dt@kernel.org, Laurent.pinchart@ideasonboard.com,
	linux-arm-kernel@lists.infradead.org, adrien.grassein@gmail.com,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Jonas Karlman <jonas@kwiboo.se>,
	Andrzej Hajda <andrzej.hajda@intel.com>, upstream@lists.phytec.de,
	David Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Robert Foss <rfoss@kernel.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	devicetree@vger.kernel.org, krzk+dt@kernel.org,
	jernej.skrabec@gmail.com, Maxime Ripard <mripard@kernel.org>,
	Simona Vetter <simona@ffwll.ch>, onas@kwiboo.se
Subject: Re: [PATCH 5/6] dt-bindings: display: bridge: lt8912b: Drop reset
 gpio requirement
Message-ID: <177065990345.1493489.15126893179740897544.robh@kernel.org>
References: <20260130205820.83189-1-d.haller@phytec.de>
 <20260130205820.83189-6-d.haller@phytec.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260130205820.83189-6-d.haller@phytec.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260209_095827_226744_2C96E5AE 
X-CRM114-Status: GOOD (  10.35  )
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


On Fri, 30 Jan 2026 12:58:15 -0800, Dominik Haller wrote:
> Drop the gpio reset from the list of required properties. The bridge works
> fine with a reset not managed by Linux. In the driver itself the gpio is
> already flagged as optional.
> 
> Signed-off-by: Dominik Haller <d.haller@phytec.de>
> ---
>  .../devicetree/bindings/display/bridge/lontium,lt8912b.yaml      | 1 -
>  1 file changed, 1 deletion(-)
> 

Applied, thanks!


