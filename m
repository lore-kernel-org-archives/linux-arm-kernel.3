Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E95E0C71135
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Jun 2025 20:28:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M04fDeushxPchuK1dMMDoSQsrz1Jp40lXk778tz1orA=; b=bG6tmNXYPdvKyWJK15EdkFjHB6
	cSC84woHvrmWZVJEhxRcXckBoWd9NDm0trT75cpovfoztF/A4drmD5RClsW6Z+zwWqQXytIGowR+D
	t/72lL2ZZcDdMoMPLY3E0pFwIE7t52+wt5MdlYHWJd4+WVgchyu1XBXPtdj/5RN5RiPwKmUIhMTob
	3FsXlo5RNVnbqxztrNsDMO/oVvLj0+24RV5gs44hj0N8HdhOlxHAIft/Lf2CqzoL3j2AejkFmk+T6
	/PdE1uY6BIfTvz/VUfOec0k9eTaKuULCNAWaXMLztINKk5J+l8gF1P10T4zQW476JbOkJfbLp1zjA
	TsFeHbNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPS41-0000000BAMZ-2IjC;
	Wed, 11 Jun 2025 20:28:50 +0000
Received: from out-173.mta0.migadu.com ([2001:41d0:1004:224b::ad])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPPSq-0000000AjdY-2TJs
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Jun 2025 17:42:18 +0000
Date: Wed, 11 Jun 2025 13:42:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rosenzweig.io;
	s=key1; t=1749663729;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=M04fDeushxPchuK1dMMDoSQsrz1Jp40lXk778tz1orA=;
	b=noL8oAUjbyjFLUAACI63HDtbuYvsW3Nr+LqdOtwNEvtyvrvrW5+RvXYbqipu8IIpJhx7uO
	sSTpWK48Zo1bECGqPvChCAIqgocuS4tqtB+pSIqfVaaGjOiGLx1E8AzaIU3x0OF45q4by0
	50p0tSUjMuuQiaLq7J+CVUIJstD3XArQq1qRr0uUfTj+5RHe7/0eozMi1eCoZ3/qGpD/BN
	UtENLrRZlPb6L4eOyJ4fqYB0P83I2DTivjnCKfKoetiqDOJVMFowapU+AyZisJyIQyOJTj
	zQFw/UUJH7+a93Ue6x66bPwqcOFK3myFirkUEecWToEM6S7Uw5TY4vixH/1sCQ==
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Alyssa Rosenzweig <alyssa@rosenzweig.io>
To: fnkl.kernel@gmail.com
Cc: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>,
	Neal Gompa <neal@gompa.dev>, David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] Bindings and DTS for Apple SoC GPUs
Message-ID: <aEm_7NECSykMX5cs@blossom>
References: <20250611-sgx-dt-v1-0-7a11f3885c60@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250611-sgx-dt-v1-0-7a11f3885c60@gmail.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_104217_155416_6B3BB97F 
X-CRM114-Status: UNSURE (   9.36  )
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

> 
> This patch series adds the DT bindings and tree entries for the GPU
> present in Apple M-series SoCs. The driver itself is in Rust and
> upstream is currently missing several prerequisite bindings, so will
> be sent later.

It would be good to include links to the kernel + m1n1 branches that
support this binding, since it's not what downstream ships.

