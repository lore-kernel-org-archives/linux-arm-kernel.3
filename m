Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE8F2C282DE
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Mar 2025 18:09:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vQ3ImQocoFucBClygvcS1RhmiWw1E+iHsFgmdHPU/ew=; b=fjVvzWmzsR2STNqmJoLZb4FRzF
	wGAV6dTlpYCE8yrpV3tNZsNXOWAdh2G6J8D5uEGsAlcoKUtF8V+HVlVVjghYnvPimFDVGUQdOL/BO
	JFr7XsiqX5V3+3jkFZgrEYyfAWDzwIobaIsxmDF0RtqKf4nf1iUJaG5h1gsdaqjwVsCR+HPgM5/d+
	z/72GyJIothaikuNgfepNtcZtYbALZ4Ihm0oRMaJWbHqRYf/tbL1ij9m6neoFdc5OZyPkrofVxrQt
	dDvxolv92NpqxGKffEbkIGS/1ozpUaOg9hFzW5XYmFojsLkDUdnssh4scGiwGRswfGGrL9LpEAokb
	1Hohcy1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tptBT-00000008stK-26Q2;
	Wed, 05 Mar 2025 18:09:31 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpt8p-00000008sVq-2Ool
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 05 Mar 2025 18:06:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=vQ3ImQocoFucBClygvcS1RhmiWw1E+iHsFgmdHPU/ew=; b=id8iM2PKeD3Ss3mjvUwR161pFF
	O8vBPTqs80Y9udb+URFzVNizpx0915/LvIkW9qlMubq+nS9/tSlE+LJkcEA47L9N0RDYHakvJDJ/i
	0ouWrLkOSgggvpL91NnOOIcUBGlrJYAqchrqvndR6YM/7jnK/gzSDQzjzHF1c0kGPsalvoPCJ06jU
	6dsOc8oFp7D5gj+7mUU0iMiKYB3YM48Q1Q1OCKS4v/51W9UEGpqf0RwN+TSUs3aPRUFu1+ygTgmXI
	ojk8wY0is0YG4Swh96NNutxx1M48+7OezGf2fkbpIHXnc+dHPIAe6o7ned7/94+SAFjqrNmywHTw3
	Br+I1Rtg==;
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpt8m-00000000g3L-22rn
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Mar 2025 18:06:46 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-390eebcc371so3411078f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 05 Mar 2025 10:06:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741197998; x=1741802798; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vQ3ImQocoFucBClygvcS1RhmiWw1E+iHsFgmdHPU/ew=;
        b=PMe0uMhmH+ECN0z4C4/2AUqeoc9whErwFL/M94HBYsZaTs1BTDWHIuGZMfcNwOFebR
         ti1AWksoQOUpLTpREdqLK9cc9/L+y/IIirxDgWudkKVhhggPuKwnBY8ooDRly+LNJxSD
         s/q9uHCg2dS2cM4LueFhehhDFuo8k64ChPcKADm20QUoeNj7oESKmzHZozS/O6Sk4+gr
         H8n3HrrRApGvyMEiEJ8e+17ND9H1vm/T0GFsivFrSdDGrU0HNQWzx1zU8IZELxmTg4fV
         9Xt9hX04F91EQN5XBu8MJAB1JpDmMzNtOBAIk9ULM2NJivrGQ0qJy1ICJaPdqsCSl/aG
         gmtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741197998; x=1741802798;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vQ3ImQocoFucBClygvcS1RhmiWw1E+iHsFgmdHPU/ew=;
        b=QaIjgG0bYzsv1Zh1rlE5jMyXKpvsLmKZebQ+RxQN42FojwXsfSD42BB93ZOQA7TxTc
         jwHk2nfFlOC2M3ykic8j0kQgGPLlQMAWyNnpT6Nf3Uf2uCfKUP+FV/WNgQo+hv8EJn8d
         FKPRrPfTs7Id35ppWBsANwVrXXLDgMNTSHJdHfdQwrkksnXJWV014GTHdI2YNBAX2B11
         xagLUZqL8gaqw8r4wlGxh17AceBh3gnmPe5Hxfa9lX7rCfKlDOHpkw0q3adlHDzS1k98
         qzC/E27gf6kCEsMdAhx7Mzbzm/H/pUVF8j7Qn/76xZghW5xW5Ue1wFzQb05PB+BArR96
         m9Yg==
X-Forwarded-Encrypted: i=1; AJvYcCUjSPpcBVTnV++rxOV3jYNdOWx9ZlQgmmEENyR2oPgm2AWMIwCB1+HmjfYVac76vduzESUUHPVglmKAsThUK2JK@lists.infradead.org
X-Gm-Message-State: AOJu0Ywv6yI4s2of5m8aa1Bi98LfS1sJDzX9yl0MPeq5B6MJLdaSlQWh
	r+r0qDyVvvV+jNJwZfpsRhNiksRVewLjWk5IrHoD4e7SVizmTIJn
X-Gm-Gg: ASbGncvT+gH2wRIndtegvXThJvraaaJVFUnbdkJrTcaBcZf5DiU8VZbD3p7x0aOfhJ9
	/8iosQJ/iNlPUpjTYGy639pkkedm3VADm/+qMzta5paXzZG4qD0wRHtUldHbZreTP1IBVmBgClj
	TDdTLSFFKC1GHBg/2cc8QWQIkZbQ+JmwQT3Tkrw1M/+oMYNVnIEE7C67D7Vw7ZK5FRgkJrmPnif
	02qNR41SS59l7TtOMumV+4r0+6J1C5JmxghIGkibQwwtayQTGbGUbS24+kIf+pSLSixpjXwBm19
	HF2SWbDHFB5/z21tLshKgPViDN7ImzOwcZpiT9HpwSRi85tmFrN5AYBpBI6ZkoQs6oaIHS4ixIm
	KuxBGeYnRb3sh50c1ex5s
X-Google-Smtp-Source: AGHT+IG1tFvNWMKO6G6LFqagnscLlmftFC9LNAnPFI5pXvS1dut8feyFYZwx6Hi7jOMoJqthxyeJeQ==
X-Received: by 2002:a5d:64a4:0:b0:390:f641:d8bb with SMTP id ffacd0b85a97d-3911f7a9573mr3273237f8f.36.1741197997875;
        Wed, 05 Mar 2025 10:06:37 -0800 (PST)
Received: from jernej-laptop.localnet (86-58-6-171.dynamic.telemach.net. [86.58.6.171])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43bd4292f0bsm24542165e9.15.2025.03.05.10.06.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Mar 2025 10:06:37 -0800 (PST)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>,
 Andre Przywara <andre.przywara@arm.com>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 7/8] pinctrl: sunxi: Add support for the Allwinner A523
Date: Wed, 05 Mar 2025 19:06:36 +0100
Message-ID: <1819482.VLH7GnMWUR@jernej-laptop>
In-Reply-To: <20250227231447.20161-8-andre.przywara@arm.com>
References: <20250227231447.20161-1-andre.przywara@arm.com>
 <20250227231447.20161-8-andre.przywara@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250305_180644_630323_C7313B56 
X-CRM114-Status: GOOD (  10.11  )
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

Dne petek, 28. februar 2025 ob 00:14:46 Srednjeevropski standardni =C4=8Das=
 je Andre Przywara napisal(a):
> The Allwinner A523 contains pins in 10 out of the 11 possible pin banks;
> it just skips port A.
> Use the newly introduced DT based pinctrl driver to describe just the
> generic pinctrl properties, so advertise the number of pins per bank
> and the interrupt capabilities. The actual function/mux assignment is
> taken from the devicetree.
>=20
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej



