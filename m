Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7CCEC369B1
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Apr 2025 06:46:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TY9Ld4HhI4x3GgeWUYkyDn8SgECOh6gNUvRgvu/3cok=; b=fIfhupoLIyWYi8QCYdOPpVaKq0
	zvKmxeBsLcEBSdcFvU0QDggXZ9YKU6ABxKu8KUsCWyTJLcZTfP3lNVT6qCdY/f0ryDQMXId0UeV/N
	Pmuzw79odMTKzqVhBgow1yOUCh7urEwlcATjgZ6nl3HoZRHg7F0DyNBk0r7GCHhA/Wc3nPdKUcDY8
	WA6mLbbltiNLCCZDUY9orbYfuxB0oiPWSP5KNyt3PB+nfbfyz/8TtinXWXtdnkOVSJT7Puv1x6GA8
	h5upa5uOB/dY6Lm+dGr6oTp4LOfPUkmwJObH//TAOmvlWlirQQjBiyrfAkFJ4YqaUDZRj3XJBtSe6
	Yc2nUCFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4wXi-00000008T7P-1RFp;
	Wed, 16 Apr 2025 06:46:42 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4wVq-00000008SdK-3Ss2
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Apr 2025 06:44:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id BB098A4B028;
	Wed, 16 Apr 2025 06:39:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F385C4CEEC;
	Wed, 16 Apr 2025 06:44:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744785885;
	bh=2QgoyFyBkjBvqoD5Ifrm8aom6MPxlvdHD2O2OdNVf5A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=c7ZNcOTp7R3go8mn78KMrvaVogeKux4vLdyiw4L3sxQoHnh3yifq/CzI4fZbJQVpX
	 9qrg/WnDlg4P5mpnwqHPpspe7AaFwKFVWN1GPII0dlpK1pJisKrVdvvlvqbmS47Xv1
	 HU8huy1m4HhrujT21i2CtK9UjL7NTM2Jgjss82UsaBMxvm0ikJa6JvKnhz0jusJoPL
	 8WgQ1JTslXWgexdZ+WuSGt87uZlNMnwUOyVY5m8HCnZ24DnXhM3/+u6tPx0cSxc2Th
	 bQYy1K1z9bIxpIGxJbX4cnj4MDTaySwuSe75cT2wGmvESNBzEP4hcE+fFOIiiv8Nw4
	 SIKyYE4PZfJmg==
Date: Wed, 16 Apr 2025 07:44:38 +0100
From: Lee Jones <lee@kernel.org>
To: Stephen Boyd <swboyd@chromium.org>
Cc: Tzung-Bi Shih <tzungbi@kernel.org>, linux-kernel@vger.kernel.org,
	patches@lists.linux.dev, Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>, devicetree@vger.kernel.org,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>, linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>,
	chrome-platform@lists.linux.dev,
	Pin-yen Lin <treapking@chromium.org>,
	Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
	=?utf-8?Q?=C5=81ukasz?= Bartosik <ukaszb@chromium.org>,
	Jameson Thies <jthies@google.com>,
	Andrei Kuchynski <akuchynski@chromium.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH 4/7] dt-bindings: Move google,cros-ec-typec binding to usb
Message-ID: <20250416064438.GE372032@google.com>
References: <20250416000208.3568635-1-swboyd@chromium.org>
 <20250416000208.3568635-5-swboyd@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250416000208.3568635-5-swboyd@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250415_234446_927593_629DC1F5 
X-CRM114-Status: GOOD (  10.33  )
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

On Tue, 15 Apr 2025, Stephen Boyd wrote:

> This binding is about USB type-c control. Move the binding to the usb
> directory as it's a better home than chrome.
> 
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: Lee Jones <lee@kernel.org>
> Cc: Benson Leung <bleung@chromium.org>
> Cc: Guenter Roeck <groeck@chromium.org>
> Cc: Tzung-Bi Shih <tzungbi@kernel.org>
> Cc: <devicetree@vger.kernel.org>
> Cc: <chrome-platform@lists.linux.dev>
> Cc: Pin-yen Lin <treapking@chromium.org>
> Cc: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
> Cc: Łukasz Bartosik <ukaszb@chromium.org>
> Cc: Jameson Thies <jthies@google.com>
> Cc: Andrei Kuchynski <akuchynski@chromium.org>
> Suggested-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Stephen Boyd <swboyd@chromium.org>
> ---
>  .../devicetree/bindings/mfd/google,cros-ec.yaml      |  2 +-

Acked-by: Lee Jones <lee@kernel.org>

>  .../{chrome => usb}/google,cros-ec-typec.yaml        | 12 ++++++------
>  2 files changed, 7 insertions(+), 7 deletions(-)
>  rename Documentation/devicetree/bindings/{chrome => usb}/google,cros-ec-typec.yaml (72%)

-- 
Lee Jones [李琼斯]

