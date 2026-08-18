Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1588EC5DF74
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Aug 2026 02:07:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4Twm40/J2sIMyzBqukyBfE0U96J7aDjmNtT9OUOe934=; b=ZhM8ChVbaRDOC64S5k670FOd6H
	J0KeG422pV5/umwMVT2jJtz9MqEgO9JOyUCql3/JH9FQmum/LIdEP54W2ILDsiM+GMeMa6vEbPOxD
	R/ZYQummPfnbjZ5WCAKhiSgg29cLQsSZp/Cj6fEiHZQBgc31SDoPxnDcWM+BSF8QmyXud2BZtdRQ7
	W29bijGXyNbLrJKQF/hzuvybodrOzrGvPEGntYmXnNIqEpTQqjs/K1l5yvXpl3+SjX8Hn60MlFuCI
	HICPJ0y6aSzoAr1o0P8qBBK47l3zV8HmbZ1pbobvN6zKiqKwGoXZ5HS7jguSH8+r4QeOrCo6jcd/t
	Aqfaev1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ww9EW-000000075Aw-09yK;
	Tue, 18 Aug 2026 02:07:20 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ww9EU-000000075Ad-1IMG
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Aug 2026 02:07:18 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id DE9266020E;
	Tue, 18 Aug 2026 02:07:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D8171F00A3A;
	Tue, 18 Aug 2026 02:07:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787018836;
	bh=4Twm40/J2sIMyzBqukyBfE0U96J7aDjmNtT9OUOe934=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=IlzyTsnMemb2V5tgm9Et/RJz5dU0jGPuTuQj7gTlRMPJcqd8VTHTE95RnNxJmaIsf
	 NIwdbVnPPkLaNwpofTtvtZjn12yioC1OtPQ/wlWhDQLsJReMACM2wI1LaPwHUQ90ff
	 1tvaNHmY9+B//cCU+lcMtj3mSZYiX+T/xbKNRiiEgfpkDWw/7/Zi5p3Vzd/4873w/w
	 s9b2VnVKPJP+lVrXPprEFrFjgstT15LcgQLfRNnF0teLBejOZfENc3ks/F3ySR2is5
	 Kmczu/FnNOo2zqKdpEGj4TFYsFJj7/j/hjn+Z3D3l7Srl1MeLp96yyykN8AIuR1Eu7
	 GD61ikN+7wdHQ==
Date: Tue, 18 Aug 2026 03:07:10 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Joshua Crofts <joshua.crofts1@gmail.com>
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>, Petar Stepanovic
 <pstepanovic@axiado.com>, Akhila Kavi <akavi@axiado.com>, Prasad Bolisetty
 <pbolisetty@axiado.com>, David Lechner <dlechner@baylibre.com>, Nuno
 =?UTF-8?B?U8Oh?= <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Harshit Shah <hshah@axiado.com>,
 linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 2/2] iio: adc: add Axiado SARADC driver
Message-ID: <20260818030710.146825da@jic23-huawei>
In-Reply-To: <20260817135920.0000461d@gmail.com>
References: <20260810-axiado-ax3000-ax3005-saradc-v5-0-bb0df3ecedaa@axiado.com>
	<20260810-axiado-ax3000-ax3005-saradc-v5-2-bb0df3ecedaa@axiado.com>
	<anoYDi-bt-t6ZeeD@ashevche-desk.local>
	<20260817034541.053dac28@jic23-huawei>
	<20260817135920.0000461d@gmail.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Mon, 17 Aug 2026 13:59:20 +0200
Joshua Crofts <joshua.crofts1@gmail.com> wrote:
> 
> With the diff Jonathan sent in mind,
> 
> Reviewed-by: Joshua Crofts <joshua.crofts1@gmail.com>
> 
Added.

