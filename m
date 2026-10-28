Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A711160A2601
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Oct 2026 09:38:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=yliLEu+U;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fTz4ccFy
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:References:MIME-Version:In-Reply-To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=wOpo207OEwIctZbL0yPki45XtYqA5r1JdptjDpx6mIo=; b=yliLEu+U++4euaGOT/wlisnJkn
	IA1Xqukiy9GNrTNyXeFh5g6lE5m2EPtUO8/oOAFw0t5MtBnShZyXmvGEUE3D6QhIidEkRy0klpkMF
	AMvWMAf4HzxqO2S2nBmXW1wOv7DmDBYnUIoJDAqup71PsGSP3m/G0cRuC6smNxznmJEwWWB28R+aH
	f/q3GMqbtPaebttIN9VTjR7TE08kq5Y9M0OwBKHHNNhIFRH9I0X7ybI/MreaFaz2CG82dtkewdpSh
	y10dEF/ewca84THmj+clkpcnGkptMISopo3TDR1MMZQg+3aUkOURo1F+lEXw2jVI+ukxMPSMlRUHU
	NXa5vU8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM071-00000006gGM-37cF;
	Wed, 28 Oct 2026 09:38:27 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM070-00000006gG1-1ahW
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 Oct 2026 09:38:26 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id E075B444F2
	for <linux-arm-kernel@lists.infradead.org>; Wed, 28 Oct 2026 09:38:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BDBF61F031EA
	for <linux-arm-kernel@lists.infradead.org>; Wed, 28 Oct 2026 09:38:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793180305;
	bh=wOpo207OEwIctZbL0yPki45XtYqA5r1JdptjDpx6mIo=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=fTz4ccFygFqrLoGtnIUHOqwYAG6fYE83eAzaKKKFTGrFdbqiyeG/xOdDlpbWljBj5
	 5V6xdBINwYU5kocYciXsQsl86nG4vrMADyaBoGICOH5SM52l6lMFMVsUuePcwpd0nk
	 dqsLjl1bgVEXkSKvvBlyt/4fvoEGoZPymlRX6HulIa2tbiCQvsXUeYPp4K3IUVrqRU
	 pYkgAmPxiymSttYf90sD3iHqe3+rcjhblkBwBr3nhPmk5/7ostKSP2aFHP8Aoo6ME5
	 BA5mvwUjZk8wNBLra4DsKT3qmgjZC2uJF2DNqeQ9/eHo66ETgnyVIkVrdJ4CTpoy8c
	 oOvJG1pWVoFTA==
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-3ab3b29a1d4so5028401fa.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 28 Oct 2026 02:38:25 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzfz+YdZF7B9QN6AmUPBF8IcviiTPKQpi7cg2gkShseND1IcmToG4eOX5uoHHEtEZrJXiwyOLSAiHWwSUJHANoP@lists.infradead.org
X-Gm-Message-State: AFq9FYKtmUBkjI1RcRDdP1I50RgzGQbkPSSuDeinyJp8N8d3rMfsg9A6
	qzYeq5aUHfRoTjWk7s1mFRQkCipeM5HQkMFxxzjMaOuYmlPhyVq6BJ8qDczegzCM8bQ1xBsf2UJ
	A7xB8ZXB5/OU9qzJ5Q32nH3W8ecvZM0zPGMlh1qGMtA==
X-Received: by 2002:a05:651c:1593:b0:3a6:95a:52a6 with SMTP id
 38308e7fff4ca-3ac9cf82d06mr3952511fa.20.1793180304502; Wed, 28 Oct 2026
 02:38:24 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 28 Oct 2026 05:38:23 -0400
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 28 Oct 2026 05:38:23 -0400
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20261024-samsung-kp-v4-1-e21253295e68@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261024-samsung-kp-v4-0-e21253295e68@gmail.com> <20261024-samsung-kp-v4-1-e21253295e68@gmail.com>
Date: Wed, 28 Oct 2026 05:38:23 -0400
X-Gmail-Original-Message-ID: <CAMRc=Mf9fcYRZcqGnNeg+sz4bo8n7AngbWkb8jPBXKwzUqpE5g@mail.gmail.com>
X-Gm-Features: AclHuK-0IY-K4Sj4xF2g0AMS5-uqQjH_1YFYYyMfdx08al6vG1--BGlVHEhA67A
Message-ID: <CAMRc=Mf9fcYRZcqGnNeg+sz4bo8n7AngbWkb8jPBXKwzUqpE5g@mail.gmail.com>
Subject: Re: [PATCH v4 1/4] mfd: wm831x: Support software nodes for DCDC regulators
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: mfd@lists.linux.dev, linux-samsung-soc@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, patches@opensource.cirrus.com, 
	linux-kernel@vger.kernel.org, Lee Jones <lee@kernel.org>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Peter Griffin <peter.griffin@linaro.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Russell King <linux@armlinux.org.uk>, 
	Mark Brown <broonie@kernel.org>, Charles Keepax <ckeepax@opensource.cirrus.com>, 
	Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>, Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Sun, 25 Oct 2026 06:03:12 +0100, Dmitry Torokhov
<dmitry.torokhov@gmail.com> said:
> Allow passing software nodes to wm831x DCDC regulators via PMIC platform
> data. This is useful for non-DT/non-ACPI platforms that want to
> associate device properties (like DVS GPIOs) with the regulator devices
> using software nodes.
>
> Add software node pointers to the PMIC platform data and have the MFD
> core assign them to the buckv cells.
>
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> ---

Acked-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

