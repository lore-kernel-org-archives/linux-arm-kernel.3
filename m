Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C010DC8303A
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Jul 2025 10:05:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dcd4NU6FYr604eOyyCsaYvr/dR8yRtKW86HNNymhJ7U=; b=CgAIsasb4mREQU5HMFv+Nd5+nO
	TfRdf3Vi+HSRUDEYKQx7nu7Apjd/8fKGnlfmmw9y7s+q/+CwAkdxO6DRRtrF1plrm6VMYUShPvPJI
	hLZFVXpE/M3S18HwdKxXjYYJLOezKz2CcYqmMiO4Ylj0wFFhHM/xx2NMJb+lB+TCZ1L+YCJIRlm41
	pdU1PsHp+ibMcpgOw5KLarjpM9j1NWEw4DHFHbUpjGcjyWckPtOZiwgFNCaa+cbN4Gkxoy3TeHa1R
	eKTDLnBTFgVnwZ+QhjxyWRTrXfr3DZvjrMOaCIxjMnF+y4Ax740+preX6SI/3gyNT3sIETMCNGTUX
	DSyMv6hQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWXrc-00000004gS6-0tSU;
	Tue, 01 Jul 2025 10:05:20 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWXme-00000004fI9-3LMJ;
	Tue, 01 Jul 2025 10:00:13 +0000
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-ae0dd7ac1f5so937958366b.2;
        Tue, 01 Jul 2025 03:00:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751364011; x=1751968811; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=dcd4NU6FYr604eOyyCsaYvr/dR8yRtKW86HNNymhJ7U=;
        b=cxZylHcjF8rwqnS+YudER6v/2E+Fyl7jpCIQwVTC11/wSXG/i0CZ5B9h2EcyAfd13p
         k/ye9R/AvhZmP7vzc8BBAU6STggam7Zs55Yj4JpaeGhqmdPHq1a7I+EJJcN2RqWCAd+e
         RqIcbKrhSWwC9wWYQPGqO9UfY6r25TK/tu7uShR6WbTQ6SUaXvZrRDhxEK8pBc1PALXh
         mjBrsplyf7yXjPfoKf5BV0TCYW/w/PL/mJumug2mCgfxG2hEPuNsUb/LW5BSxab+PYz4
         03JCU+QUNUgsX0FP1u/tjwZflv+CHhAf1OVqK+CeAAmwQS+vYUN3FhibjPBzof8hYJig
         1lyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751364011; x=1751968811;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dcd4NU6FYr604eOyyCsaYvr/dR8yRtKW86HNNymhJ7U=;
        b=rZw15OTqjd5wIMlIshlyYv5053IlSR2a+VGIXeu9ip9YEiBvlx5BaO1XEVqkWukF6I
         8MaSpmvF/dyiBiUxfNIh3/8fc0W4e5UARJwwKeXKGDPiMgmtxPefIvCxMO8b8W51oIaG
         jcIFJEczn0/6IXQX+RUnUcQa8J66VlASdSNOoyLJjUGgsqM6LfXRLT9u+s7FOW3ho3BQ
         8/8YwcwSdm4GO6FIpBBzaVKPgS1kNyK/aiuJ72S25O0+RTD0qhmknB2Eb9bUiG5QETDz
         6VW8KMi9kFumUaEMB49/WEI1cMjkCNJ00/QoOOGWUqNv06pG+6lLU8Ih/1CS1kq/KKSF
         iSng==
X-Forwarded-Encrypted: i=1; AJvYcCVqjvLmAPqD8j72Qg1yL9Rn3QqmMuFELZAQNolWMKvLaYLUuLvekk2n6IeUjZ2vQddFk8dus7AABVIF0sxK@lists.infradead.org, AJvYcCXYekZmdZPS/3VcONHAbOYJdW4d/lpbViaom3uRePOaEqfYclgiWFSMA62J1ciAFGWDYENePZFwes7+6omM0ZyOng==@lists.infradead.org
X-Gm-Message-State: AOJu0YwOFPnv/rluuvOOlw63yEXqS6B+kLAao7+Ajvuzo0S3GZT/kl2p
	yenOYq5lfZVGHgINNxo2PSH69M/z5L6GHiGBvzzMTuLgD5KhImEwlgh74JeDKIo08UXirE6ZExN
	JDXTgnCWZjtMZURQ3tufVe1T4s0IxtZc=
X-Gm-Gg: ASbGncuHMqjuHDSTMIdtUOGqUOrhW8AqCNEfygKEWl4PoV4JhmFdZz6R09hAIeLuQ6S
	dX0VD+lom5dMYYJc5XJmwW09RBUGqFKYmzOFindrNrl3kFRF6e02ZDbFrTDXzy/x3Y9AhFP/rhK
	JZTfljg1mPyJVnHHPnfnUH6Tbm58hpH/MR2YK5FXw1
X-Google-Smtp-Source: AGHT+IFVGg9I7ij138HqjSz3k5NX/sRlfBODxu7bE94U+eCEWNa8PihnyeL2ytQK8bGikHE/btLURU84ZtWswTf1e94=
X-Received: by 2002:a17:906:7308:b0:ae0:ce90:4b6c with SMTP id
 a640c23a62f3a-ae3501a6b84mr1520367566b.49.1751364010417; Tue, 01 Jul 2025
 03:00:10 -0700 (PDT)
MIME-Version: 1.0
References: <20250628015328.249637-1-da@libre.computer>
In-Reply-To: <20250628015328.249637-1-da@libre.computer>
From: Anand Moon <linux.amoon@gmail.com>
Date: Tue, 1 Jul 2025 15:29:53 +0530
X-Gm-Features: Ac12FXyQuaHFFKC-1pIWDliDfzZokX1a7f9rk99GbHKLqTGFlt79NOp9T2kO1fE
Message-ID: <CANAwSgTH67T9SBQSFQgFjvyrxNCbtfd9ZaCDZFACWA=ZQ-PYtQ@mail.gmail.com>
Subject: Re: [RFC] mmc: meson-gx-mmc: add delay during poweroff
To: Da Xue <da@libre.computer>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, linux-mmc@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250701_030012_837219_1A8A1727 
X-CRM114-Status: GOOD (  13.20  )
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

Hi Da,

On Sat, 28 Jun 2025 at 09:15, Da Xue <da@libre.computer> wrote:
>
> Regulators controlling the SD card power need some settling time for SD
> cards to fully reset from UHS modes. The regulator framework seems to
> ignore falling times set in the device tree causing a few boards with the
> same hardware implementation to hang on reboot because the SD card still
> had some voltage and did not reset properly to be initialized again.
>
> Add a delay sufficiently long for the voltage to drop so that the SD card
> can reset properly. Otherwise the reboot will hang at missing SD card
> especially with Samsung cards.
>
Although the driver defines reset identifiers such as
RESET_SD_EMMC_A, RESET_SD_EMMC_B, and RESET_SD_EMMC_C,
It does not implement proper reset controller functionality,
specifically lacking support
for reset_control_assert() and reset_control_deassert() operations.

Thanks
-Anand

