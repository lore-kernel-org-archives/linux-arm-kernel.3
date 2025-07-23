Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 049BAC83F17
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Jul 2025 05:11:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0FStFjQJRSnimXHyHWru2haWH8xozWmwOHfrR9egPvw=; b=tB3zwT1yI8oDUOoQ6gZruAfGX7
	gszgKQWWlBKGZHmLPW9dvhwwDBUuUsB7xkgMOpf4nhSsB2T1/Mf/JAe+4Hqz6144vrdX6qF4RunDa
	eJDAHlX0q/y2LRybyaqtP4S9zwHenV2bJtoDJIp4UzgR70qBxjirS0oJsdMOnVrTLovb9pb5DMqo7
	T/noNDyky3/Kbsl2/U8mlShhLrdrvg+5iAQDlVHr3zHnHPaoR5hYhKlNPWlHxb8Xypbn9Aqx186YJ
	RIoZOmGrEEGUHDNUWJYSucrTuBbqEY+SNdYD78r1nPGBJmCjzyPc5abcwg03OVYOS0euRIUcwlkgh
	3H98oULA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueRl3-000000042Pd-3qmK;
	Wed, 23 Jul 2025 05:11:13 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueRdr-000000041w7-1PCG;
	Wed, 23 Jul 2025 05:03:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 75495461FE;
	Wed, 23 Jul 2025 05:03:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3714AC4CEE7;
	Wed, 23 Jul 2025 05:03:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753247026;
	bh=HNdcDInfR5691ALsx7YFA6KQ881CsZllB61Hu6dp+sc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=T1eJpYtP362i6QpQB+Gyr3nVNU4ib/ncXo5a8bynYbCbVde1E4PIfSG1viBeQFXri
	 rZLxYRWbemEoP9mMxnTuF8rtwfg06RtoWNz8PEsbqTHnts0Wd/mVt6y819T/xD6RuL
	 mOFHzLVYKVP+pxhxcOYL4QotHxlwjOfbPo/CG7bHZ3R9w/FM9zzx8hvkrN+lR0uFOy
	 8nlygR5DDHvtsEJREgk2Y0HvV+R97GxJwshMLUEnM+VMnSchUU/mvhERqjU8tbRDM3
	 Tsen+b8Ztg/WXn7szBtQsSckYKxW5tObFakUNVKOcgxh8F21AF5wjxGYwH4C9rZreM
	 w64dgibb0Ew6w==
Date: Wed, 23 Jul 2025 00:03:45 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Xianwei Zhao <xianwei.zhao@amlogic.com>
Cc: Liming Xue <liming.xue@amlogic.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Guillaume La Roque <glaroque@baylibre.com>,
	linux-arm-kernel@lists.infradead.org,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Lukasz Luba <lukasz.luba@arm.com>, Zhang Rui <rui.zhang@intel.com>,
	linux-pm@vger.kernel.org
Subject: Re: [PATCH v2 1/3] dt-bindings: thermal: amlogic: Add compatible
 string for C3
Message-ID: <175324702489.1243031.2642099886679126022.robh@kernel.org>
References: <20250722-c3-thermal-v2-0-b2231b4be79e@amlogic.com>
 <20250722-c3-thermal-v2-1-b2231b4be79e@amlogic.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250722-c3-thermal-v2-1-b2231b4be79e@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250722_220347_394816_680E6D71 
X-CRM114-Status: UNSURE (   9.08  )
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


On Tue, 22 Jul 2025 19:26:27 +0800, Xianwei Zhao wrote:
> Add the compatible properties for Amlogic C3 SoC family.
> C3 family supports only one thermal node - CPU thermal
> sensor.
> 
> Signed-off-by: Liming Xue <liming.xue@amlogic.com>
> Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
> ---
>  Documentation/devicetree/bindings/thermal/amlogic,thermal.yaml | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


