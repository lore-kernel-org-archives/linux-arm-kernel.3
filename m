Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06DFACD4840
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 May 2026 16:22:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e19MX8CU+PB58q/Ph/E5Ue6KATJv/lo98521aDrCffw=; b=Xq3qjXrHiBVlSOUZGNsI3Gynsm
	0hsmb9P/ysMzbtfPtPzsdUPEr+hLWDkG4R2fYt6NV9GnxiRibdlp14+2o7wTrIr3lJQZbn4o0ZRQF
	R3ehuCT0/BvVldIXQda8iDBQFFZR0GZMRPPhtkLSj8jtE26hRBzcAVU9JOXKK0m+7eEPWJFPN+gZJ
	iENO3XTsWpWOUed1jiP6+8rVQQC+pJxofG0Pb5knTGp+0GOqPHZUQb+PzpG5ojK8v8p/7UQvTo9bn
	Qz1XbOtybqYBN7e5ICRjM5c/dAgFipsKGOpqm5ZK8kiqmdGs2oyC6wEDcpm24ad4vxe45YkFEJNhm
	hf0Rq0Vg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMTOg-0000000EBuR-2vyD;
	Mon, 11 May 2026 16:22:22 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMTOe-0000000EBtx-46C3;
	Mon, 11 May 2026 16:22:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=e19MX8CU+PB58q/Ph/E5Ue6KATJv/lo98521aDrCffw=; b=MbDZGJJA2zJE49ZweDpsYq5zv7
	ogcwH0fkFPL14yerWhMPsz8uBalhpCEyWwNS67rjL0TJ7zjyhkuAZGji2y/cSK36XwYNsOGc8C4mc
	X/oekTvcwC7i7R9MxxeoKu34tVIL0i56KO05xOgkEq7nLk/QP5yqU7pcIufU6klb6rX8vnnOMNg1x
	H+4e5GYh22QajRFBn5JiCfQ2pQK1YnUMa6pawf7R1NZZ4WRxbVMzj/Q0zrWHddYFx8vYmVA/gkYiX
	TSpFbUTrnSSgePAYZc8Q+V+zdVeGQ2/kl8/JVsySCFM8/85i0vpE8YNNuRmLINI0XT5/i29n5ON9y
	cQA3qEUw==;
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMTOS-0000000CIik-186B;
	Mon, 11 May 2026 16:22:18 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1778516507; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=nQA6Y6JO4vlyV7DDVuzOlG2yGYi5kGtKuIxJfJ9vZW3RaQZ5TZFs3DyVe5doq9QFkadyJ2ahPO27f7Koef+GBoQVlbAmeDB8QXSPFpqxgFpbRPVCC+xaaL+stI5G0Yu/LufPP307oFStV/kWRuSxycNftkCyTN2X5sDq0ItjVGY=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1778516507; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=e19MX8CU+PB58q/Ph/E5Ue6KATJv/lo98521aDrCffw=; 
	b=e62aMLyUokucuOkHduLUqEuFNl3s7rGu+zDhLmM1m/Dq0CPDgyDCzKT9VPciaL9Ug73wcSbzxnKzxe1K0zw+tixBfydWhHN3CWvq/dFxgyqUVol4q03G6RfqTE+jmVRSGLPgwIy+mp9FiTMfVacjZF4Dk1SeQ1/YTM/UZBNz0BU=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1778516507;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Content-Type:Message-Id:Reply-To;
	bh=e19MX8CU+PB58q/Ph/E5Ue6KATJv/lo98521aDrCffw=;
	b=aVA5ALESMkFpnXqD29o2M8OghNp+RcroIizOSQCjgentZBrUVJiZmL9Vn5lOeaxg
	MlriF7P3GeiNYQRhUmrsAjwLNn8j+hJ6+QPvLWWEgPK/LHV3LRiG31DbX4mzeCg0J3X
	RdMSvQM6vC6BeT8Z5tjqNuzKmPqy0zzm3tu+Quho=
Received: by mx.zohomail.com with SMTPS id 17785165060441003.195712507633;
	Mon, 11 May 2026 09:21:46 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Heiko Stuebner <heiko@sntech.de>
Cc: kernel@collabora.com, linux-input@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Subject: Re: [PATCH v3 0/4] ROCK 4D audio enablement
Date: Mon, 11 May 2026 18:21:40 +0200
Message-ID: <wE1x9P2vQlC8kihOSm9uOA@collabora.com>
In-Reply-To: <20260408-rock4d-audio-v3-0-49e43c3c2a68@collabora.com>
References: <20260408-rock4d-audio-v3-0-49e43c3c2a68@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260511_172209_551109_F8A6B164 
X-CRM114-Status: GOOD (  25.98  )
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

Hi Alexandre, and other maintainers,

On Wednesday, 8 April 2026 19:49:38 Central European Summer Time Nicolas Frattaroli wrote:
> The ROCK 4D uses an ADC input to distinguish between a headphone (i.e.,
> no mic) and a headset (i.e., with mic). After some searching, it appears
> that the closest we can get to modelling this is by sending a particular
> switch input event.
> 
> So this series modifies the adc-keys bindings, extends the adc-keys
> driver to allow sending other input types as well, and then adds the
> analog audio nodes to ROCK 4D's device tree.
> 
> It should be noted that analog capture from the TRRS jack currently
> results in completely digitally silent audio for me, i.e. no data other
> than 0xFF. There's a few reasons why this could happen, chief among them
> that my SAI driver is broken or that the ES8328 codec driver is once
> again broken. The DAPM routes when graphed out look fine though. So the
> DTS part is correct, and I can fix the broken capture in a separate
> follow-up patch that doesn't have to include DT people.
> 
> Another possibility is that my phone headset, despite being 4 rings and
> having a little pin hole at the back of the volume doodad, does not
> actually have a microphone, but in that case I'd still expect some noise
> in the PCM. Maybe it's just shy.
> 
> Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> ---
> Changes in v3:
> - bindings: use unevaluatedProperties instead of explicitly mentioning
>   linux,input-type.
> - Link to v2: https://lore.kernel.org/r/20251215-rock4d-audio-v2-0-82a61de39b4c@collabora.com
> 
> Changes in v2:
> - Drop HDMI audio patch, as it was already merged.
> - adc-keys: rename "keycode" to "code".
> - adc-keys: make the keycode (now "code") local a u32 instead of an int
> - adc-keys: only allow EV_KEY and EV_SW for now. Rename patch
>   accordingly.
> - adc-keys: Add another patch to rework probe function error logging.
> - Link to v1: https://lore.kernel.org/r/20250630-rock4d-audio-v1-0-0b3c8e8fda9c@collabora.com
> 
> ---
> Nicolas Frattaroli (4):
>       dt-bindings: input: adc-keys: allow all input properties
>       Input: adc-keys - support EV_SW as well, not just EV_KEY.
>       Input: adc-keys - Use dev_err_probe in probe function
>       arm64: dts: rockchip: add analog audio to ROCK 4D
> 
>  .../devicetree/bindings/input/adc-keys.yaml        | 17 ++--
>  arch/arm64/boot/dts/rockchip/rk3576-rock-4d.dts    | 90 ++++++++++++++++++++++
>  drivers/input/keyboard/adc-keys.c                  | 88 ++++++++++-----------
>  3 files changed, 147 insertions(+), 48 deletions(-)
> ---
> base-commit: 8de395f35e79d9168a78504fed495578ec7bac52
> change-id: 20250627-rock4d-audio-cfc07f168a08
> 
> Best regards,
> --  
> Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> 
> 

What's the path forward here? All the patches are reviewed, but it
has been almost a month without them being applied now.

Which tree(s) would this be applied to, and who should I poke?

Thanks :)

Kind regards,
Nicolas Frattaroli




