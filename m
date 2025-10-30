Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3391FCCF9F1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Oct 2025 10:52:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:In-Reply-To:References:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XBHnBHSuMYckJCLbgZCu2OahfUnKzTUzjWVCcpE6wBc=; b=PXr+86BJmyXJ+sm3Ay03SJ7GLd
	y+24OaWcI4qk+iCygjA9iClBm9GpdZsJG32EuGcCdjeW5kl+oDMYr5XxBzWTwsR4jv5Y0PIwvXxQs
	/SApm+LxtcsBGeferalarJTrPNaGCKmy2PnS8Ld3NhvfEPig7FG+/oYWCXyDXbLpUscSIvED7XWkj
	8NjQVpuzTYiGmxjlqerJRTwEe2sXmGaZurfEnR0BspNrTMaEhQRMcNeV/PpwmHBmgLWK5VKwqFVgh
	nhKsy/mWtdTtv2rdAOs0crycCJcBc0263BdCGrZ4Rt8p/Q7gDzj/r8KdNweezTYMj0M+SuNqopFlo
	M+RxB7rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEQGZ-000000041em-2rfr;
	Thu, 30 Oct 2025 10:52:27 +0000
Received: from out-181.mta1.migadu.com ([2001:41d0:203:375::b5])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEQGW-000000041dQ-2OHP
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Oct 2025 10:52:25 +0000
Date: Thu, 30 Oct 2025 10:50:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=postmarketos.org;
	s=key1; t=1761821531;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XBHnBHSuMYckJCLbgZCu2OahfUnKzTUzjWVCcpE6wBc=;
	b=fRb0pGmiX3dK8gJZa/zjS1z3dJEB9uuqxQT5osdza1NGSdi0lHhhDfiqNCTqSSxuOdCutE
	TtGUGf9YypwzUGmubEkjG8lMMFdFXkWq9Lcd9riJSOPKCwMrurjtuoaW0qPhUJVlSAoTSe
	qrkkfOoffCkvPDrPNLwWaVNmC2KCRUdGnHnarRcYSyxSZejDIqqhLkGL/hkf3VdmefsS5v
	pYr+ao12rw7hjomsHXvZDxGHRRFnM9fASbnSRDTeJD4UnlwwHQRx46IiWPbMFatzp2e8kv
	3OmV6LQF5OfTwin8zGkIA17VE42nTlRvvZtWg1MV9FaXs/JWAkBnh5gqDsx7gw==
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Ferass El Hafidi <funderscore@postmarketos.org>
To: linux-amlogic@lists.infradead.org, Zhentao Guo <zhentao.guo@amlogic.com>, Christian Hewitt <christianshewitt@gmail.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org
Subject: Re: [PATCH 0/3] Add Amlogic stateless H.264 video decoder for S4
References: <20251027-b4-s4-vdec-upstream-v1-0-620401813b5d@amlogic.com> <B9A578FB-BF95-47E1-B202-B59897C2C898@gmail.com> <9a8e0391-c73f-4913-88e1-0a278d99f90d@amlogic.com>
In-Reply-To: <9a8e0391-c73f-4913-88e1-0a278d99f90d@amlogic.com>
Message-ID: <t4xy6q.vhi5j58gpfcw@postmarketos.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset=utf-8; format=flowed
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251030_035224_741995_181AF9CD 
X-CRM114-Status: GOOD (  14.97  )
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

On Tue, 28 Oct 2025 11:08, Zhentao Guo <zhentao.guo@amlogic.com> wrote:
>
>在 2025/10/27 20:57, Christian Hewitt 写道:
>> [christianshewitt@gmail.com appears similar to someone who previously sent you email, but may not be that person. Learn why this could be a risk at https://aka.ms/LearnAboutSenderIdentification ]
>>
>> [ EXTERNAL EMAIL ]
>>
>>> On 27 Oct 2025, at 9:42 am, Zhentao Guo via B4 Relay <devnull+zhentao.guo.amlogic.com@kernel.org> wrote:
>>>
>>> Introduce initial driver support for Amlogic's new video acceleration
>>> hardware architecture, designed for video stream decoding.
>>>
>>> Compared to the current Amlogic video decoder hardware architecture,
>>> this new implementation eliminates the Esparser hardware component,
>>> enabling direct vb2 buffer input. The driver is designed to support
>>> the V4L2 M2M stateless decoder API. The initial phase includes support
>>> for H.264 decoding on Amlogic S805X2 platform.
>> It would be nice if you can outline the additional hardware the driver
>> plans to support so reviewers have perspective on where we are now, and
>> what more be coming? - the community would also like to understand if
>> this driver will supersede the stalled driver attempt in staging.
>Yes, we will follow Amlogic's overall upstream progress to support more 
>hardware
>platforms in the future. The next step will be adding support for 
>A311D2(T7) platform.
>We also plan to replace the stalled driver with the new stateless 
>decoder driver.
>The new stateless driver is fully compatible with the old G12/SM1 
>platforms, making
>this transition feasible.

That's awesome news! But how about the older platforms such as GXBB
(S905), GXL (S905X) and AXG (A113D)? Will support for them also be added
or not?

I and probably many other people still have interest on these older
SoCs.. they otherwise run Mainline linux mostly fine, so if a working
vdec driver comes along for these, that would be great!

Best regards,
Ferass

