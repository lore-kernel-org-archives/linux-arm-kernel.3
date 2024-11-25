Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A56CCD58D4F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 Nov 2024 14:25:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UOUHyrClhYT8RMtkXeGlDQvph3N1LZNwe8gDlfAlzfE=; b=BNMZw6dR0UNDVQdzmSPCjx/3xR
	JwQiqsHnaPnVDyGkp7FJcLE1LSIuND+fz/X4KdI9A41D3yzkuxisU7Nz1JCsVZXkIaTM+AAgQr32o
	jan79i782mQcsNwKVhjCLRJgwxgoeJ3b2Qzt8W+tduLmAS2Pns7KhKIaKnC1j8tUXaHkthMkYF7tv
	4qt0wMxQbeuJxc6GowTgMCRNHhAyeVVGZrnY8k+VIEBpEuQjkmGJfc3kj+B5UA+ymFk81n+Gi+sT9
	b6ku8+GYoxPMYRSskukR9Mva0XX4EzhUvlX1vY+Rm6kllgqOHA61fitoD/wNriB/1vWly8H4zpzhL
	FG1x/3VA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFa1q-00000008Hu8-3Sxq;
	Mon, 25 Nov 2024 14:25:30 +0000
Received: from marcansoft.com ([212.63.210.85] helo=mail.marcansoft.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tFa0s-00000008Hjs-0ByL
	for linux-arm-kernel@lists.infradead.org;
	Mon, 25 Nov 2024 14:24:31 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: marcan@marcan.st)
	by mail.marcansoft.com (Postfix) with ESMTPSA id 47E7B3FB17;
	Mon, 25 Nov 2024 14:24:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=marcan.st; s=default;
	t=1732544668; bh=UOUHyrClhYT8RMtkXeGlDQvph3N1LZNwe8gDlfAlzfE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=fLZCQyIusdh8e3SDTyI7LVc9rrmfiYWSfLv9s4zriOfmK4DmNv28JPSPDsFupZtce
	 6ZszlADBdGrZQtZylk5LMQwlNqhQep3WDSIkRQpOs8AePl9hEjo1XZ9AfO/pTyJIc5
	 sbvS+3IqCZ/w+BRUu58iIGk0n5KFs1DZseO97HwvrNm4KCt+HGjADIJgbB+AGnNPlr
	 2u8j6YfRNeYYwntaCe/CmFBM7A0OCib9Dxz/JryeBK9jXCR6QNDb73NSwrJX8HbGG3
	 fKv9aTxY41oEg970X1MluDPuMTjCzgZzWeV83pV9Un/mllsYKboYyPTa+YhVQ825Tq
	 MGJSvWD4BUnKA==
Message-ID: <cc71021e-b53d-4eda-bad8-abb4df13575f@marcan.st>
Date: Mon, 25 Nov 2024 23:24:25 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] gpu: drm: adp: Add Apple Display Pipe driver
To: Sasha Finkelstein <fnkl.kernel@gmail.com>, neil.armstrong@linaro.org
Cc: Sven Peter <sven@svenpeter.dev>, Alyssa Rosenzweig
 <alyssa@rosenzweig.io>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Jessica Zhang <quic_jesszhan@quicinc.com>,
 asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Janne Grunau <j@jannau.net>
References: <20241124-adpdrm-v1-0-3191d8e6e49a@gmail.com>
 <20241124-adpdrm-v1-2-3191d8e6e49a@gmail.com>
 <10d0aa88-de2e-4856-a137-301519e58b2d@linaro.org>
 <CAMT+MTRWZWj=3AP7wyooXr49-W4vcm0ZbAoqPyEuNkQBMOaJfw@mail.gmail.com>
From: Hector Martin <marcan@marcan.st>
Content-Language: en-US
In-Reply-To: <CAMT+MTRWZWj=3AP7wyooXr49-W4vcm0ZbAoqPyEuNkQBMOaJfw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241125_062430_231456_4C124E19 
X-CRM114-Status: GOOD (  11.54  )
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



On 2024/11/25 20:24, Sasha Finkelstein wrote:
> On Mon, 25 Nov 2024 at 09:50, Neil Armstrong <neil.armstrong@linaro.org> wrote:
>>
>> So this controller only supports a single mode ???????
>>
> Most likely. On all devices it is connected to a single built-in display.

More specifically, the controller obviously supports multiple modes but
it is pre-initialized by the bootloader for the single hardwired
display's only mode. So as far as the driver is concerned, there is a
single possible mode, and there's no point in trying to be more generic
if there is no hardware that would use that.

In general, it is not possible/practical to be generic for reverse
engineered hardware with no specs documenting how to drive it
generically. You just can't know how to implement the options that are
never used in practice. I spent a lot of time on exceptions to this rule
for the GPIO and SPI controllers, and that's not going to happen for
more complex hardware like MIPI DSI.

- Hector


