Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94F47D65C46
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Dec 2025 13:34:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nlTbisg9JoHlU7KO2hYMEkRsoKyN4AECUu6vPXElY3I=; b=K2h6lzTODJCNh2PD9SeA4SB+Xx
	/1n0mm5oHz2jaigaB5cJKreyArCQ5HwgTn4ouapPp/8elb1iePSle9d0gz0LsavkPQ3Rn8dAKgxRW
	Y9kkdjGCDuV/yAk1qObC/CeBiiLmz3lpO3ecBoilguUNS+t/q30BuynS8AsOynQzVfNZzAZDCFrjv
	t9SpTMSx/4M2rQ5VrMlXgFXTmv5vrQXSNNQjxoVyZCowoMhWH+pjIEyvv2Sw9jB7WLsrS/w+ie9F6
	taqyin6WPO+Xv6dA7SnFsmMeDscu8TA2gvUBafshTJYQYIiDbbrS6wX9n3U76ZyBQZkCru/PQYPxl
	ygC9KikQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVrg0-00000006rgC-3sC3;
	Wed, 17 Dec 2025 13:34:48 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVrfv-00000006rdy-3utk;
	Wed, 17 Dec 2025 13:34:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 0C845444E6;
	Wed, 17 Dec 2025 13:34:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD577C113D0;
	Wed, 17 Dec 2025 13:34:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765978482;
	bh=WbdwYa16DoWEN3/Yr3ZaWWyy2Z5ondfDmYkQkpRb1w4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=geltRgvBm39rAwgQ1NV0VCrxJsi4mQabC5ra3uEZbjEbJRMGnBEjnozr0GbS58oA3
	 XIyekP5dO+Q3sAX4Stmiqp9IzlsrYMYorbBWnrh9ZhReJX+X4PY10UNjOJtSc2OBPw
	 Hl7GgdvVcfl+2g3IysGfSoF2C6vtgFfGRlQoEnwJQlI7fZX5+NwsDllQ4AaIJsncYt
	 UbdlD64bh7Fcqz1Wo23uTDeE8hUIyELSP+Vd3dP7/9vkwJfw5aUAN6QATdcMHzDS6P
	 VKfzBrl08GFv08hDif1j+B2/D+mtSzvGUIgaSy1I94Y5PNK75yHVyqe3A4DQUibk4Z
	 8bbUPxvCVVtyw==
Date: Wed, 17 Dec 2025 07:34:40 -0600
From: Rob Herring <robh@kernel.org>
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Heiko Stuebner <heiko@sntech.de>, kernel@collabora.com,
	linux-input@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v2 1/4] dt-bindings: input: adc-keys: allow
 linux,input-type property
Message-ID: <20251217133440.GA724723-robh@kernel.org>
References: <20251215-rock4d-audio-v2-0-82a61de39b4c@collabora.com>
 <20251215-rock4d-audio-v2-1-82a61de39b4c@collabora.com>
 <20251217-tough-ultra-junglefowl-f1a9ae@quoll>
 <6778765.lOV4Wx5bFT@workhorse>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6778765.lOV4Wx5bFT@workhorse>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251217_053443_988842_78AA231A 
X-CRM114-Status: GOOD (  22.67  )
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

On Wed, Dec 17, 2025 at 01:57:46PM +0100, Nicolas Frattaroli wrote:
> On Wednesday, 17 December 2025 09:31:15 Central European Standard Time Krzysztof Kozlowski wrote:
> > On Mon, Dec 15, 2025 at 01:29:29PM +0100, Nicolas Frattaroli wrote:
> > > adc-keys, unlike gpio-keys, does not allow linux,input-type as a valid
> > > property. This makes it impossible to model devices that have ADC inputs
> > > that should generate switch events.
> > 
> > The solution is to use unevaluatedProps instead, which also allows
> > dropping other properties.
> > 
> > Best regards,
> > Krzysztof
> > 
> > 
> 
> Hi Krzysztof,
> 
> to understand the motivation behind this suggestion correctly:
> are the "linux," vendor prefixed properties, especially with regards
> to key codes, generally a bit of a thorn in the side of DT bindings
> maintainers?

Not really. Most have existed for decades. New ones get extra scrutiny 
and often end up dropping the linux prefix.

> I'd imagine so since they technically tie the DT to a specific OS
> kernel (though of course, others are free to translate those key
> codes). And the whole idea of configuring which code is emitted
> from something is basically abusing DT for configuring software
> rather than describing hardware.
> 
> I'm mainly interested because this is a thought that has been in
> the back of my mind for a while now, and I'm curious if the DT
> binding maintainers happen to have arrived at the same impassé,
> where linux,input-type et al abuse the DT model for something we
> would tell any other vendor not to abuse it for, but no better
> solution exists right now to achieve the same thing.

Not sure what the BSDs do here. It's never come up that I remember. Best 
I can tell is they just make it a userspace problem. So every possible 
keyboard needs a keymap file. Though I'm not sure how that would work 
with GPIO keys as you don't really have a scan code.

Rob

