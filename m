Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1211AC71135
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Jun 2025 20:35:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7FqzQMbtN46MspgzRLzfkBpN56u2tDVXmIle8ZV/dB4=; b=mSD3zMPK6I6TrrKSPnnVdnukN1
	gcpc6LedC4QFfeoF9a69LyKNr0BeKRWnQreh/DRcbdA8e40h8j4Ufj/KGV8ko0C7+vCvOPHPDIErq
	OL+c6v3RVgQ1g59iPAG8d1k31m3ZI2uwGZYGUlLEyXNhkok8vX5ax896GzWbkcZdaN/RsEV9j67D2
	5ilCHHKaL2kqsIlSbb7AWIxlsunmUL8bueQUeVsR2sd8VcXKvXT6Sei23FBt3Vbi3bHEK2hOmRZZm
	1R551WsHYkpMiJ0ETagzDn/5Ktv2FrERTHpT8MkKS1T5eZFzIqnVyukayonnIAXoIv1DI3xOftYDp
	hVST6x8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPSAI-0000000BAxb-2dT3;
	Wed, 11 Jun 2025 20:35:18 +0000
Received: from out-187.mta1.migadu.com ([95.215.58.187])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPPel-0000000Al7i-1Jlz
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Jun 2025 17:54:36 +0000
Date: Wed, 11 Jun 2025 13:53:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rosenzweig.io;
	s=key1; t=1749664472;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=7FqzQMbtN46MspgzRLzfkBpN56u2tDVXmIle8ZV/dB4=;
	b=R2yckc6bmzZk4s5WE8kaNgGeZlyfwhXLd8Za/KDmBBgDom2THZmz36Ym3HMjwRgBVG0rWb
	vMiknBmb0KbudvIGthcospMNqqc4sWJfsOjGLl4g4FK9GOHZHwfOZiBAYtkwre3kxYW21V
	z/SPFz/+eXw01gb9S6WqkxjAoewGkJ+fdmRQ5thRQUq3j+6mYlHW4P1GJX9D5t92RWSxqB
	wXz8RyLPexYeBIb3dsHnrq7uciaQTEeNAhp2MiDvjw6v13Db42a3ME4CMPgIAvVBHPoDz6
	YPDa3of5HyHXPXvZtNumP2hCVvJtcynlemUhaFCzf3AXf54vhecjj4lv8uN4+w==
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
Subject: Re: [PATCH 2/2] arm64: dts: Add Apple SoC GPU
Message-ID: <aEnCthA1AXrWqxEi@blossom>
References: <20250611-sgx-dt-v1-0-7a11f3885c60@gmail.com>
 <20250611-sgx-dt-v1-2-7a11f3885c60@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250611-sgx-dt-v1-2-7a11f3885c60@gmail.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_105435_498425_3B643324 
X-CRM114-Status: UNSURE (   4.96  )
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

Reviewed-by: Alyssa Rosenzweig <alyssa@rosenzweig.io>



