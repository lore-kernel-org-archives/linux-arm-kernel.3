Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07051C624D3
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Sep 2026 17:23:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ad1DukBGwLi6ArucFKVFRHpCwR2Weby1EPL9ATOHJ1c=; b=fgFh6vnM2Kfbanob2K+oJ1+8g5
	AucMBc5YyTIeunopv/krf4XE/4QxK25SuvAA2LpEop/uY/WWky8D0oYj2z6nVV/6vMF19NXigDaTO
	yvaDuCPkVrmx1Pf3r5RAobvMpKDgGPs3V/wm6Ce5d4Ek0hJhCDCTSe15JHQh2KpHKMMxHJIYVnZk2
	PA2b6qRMGCypeaTy4AgkRTAmjHKQdRUxEX4xL7UT0YYHJTRh7WGtQeeFshj/8OGfVDzIIgVYbqsH2
	kxcLVhoe2xZ/0VNoirU+6puGM2wWnHSZOQ7wZZCDKKP0WlRy1UF+gg9HghXtQRwaneoKSX0TDJnoJ
	Gmx44MUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1SCJ-0000000Coe5-0R7E;
	Tue, 01 Sep 2026 17:22:59 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1SCH-0000000CodO-2nXc
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Sep 2026 17:22:57 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 3A91043889
	for <linux-arm-kernel@lists.infradead.org>; Tue,  1 Sep 2026 17:22:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 222DC1F00ACA
	for <linux-arm-kernel@lists.infradead.org>; Tue,  1 Sep 2026 17:22:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788283377;
	bh=Ad1DukBGwLi6ArucFKVFRHpCwR2Weby1EPL9ATOHJ1c=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=hLT6pqk/N3t4GsJHKh6IsbFpP3/hTTyorJFTxXTtgNJXA6dBXcp/OsAr/8n8udXL2
	 yPmUjPQnbS7tthwscVDgkBq0SpjosQzqiNizqvhoNY9oQT6oPiGLUAcgp7cbmnMb3Q
	 FzZjM3JzC2jleBf4G97WdhXulwnZuZrKjMpUOQMSv3N39ayy9KVor+RQs1iQnnZkF8
	 A2NkG8MKPzXB6EiPADiumEzl35X73acZNA96sFjXu35zszn+mHIm/2C9zB1BIGnDfN
	 YrQ1HzKChXi0MGA2X3ERbmr4r2zuBI2tFkW6LwhYtie1Ygd6J8oea2NX2at8grVpE8
	 bZuBEPcgIAgnw==
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5b5e1340faeso1070145e87.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 01 Sep 2026 10:22:57 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBybs5QFrLRNgdPC7SaOlUsdGpDiq+2BhkeBiWK+b1INxE+3eUDB49p6UoEKrLsGTzGKhhwxUMUDw8+R2u7w0yqA@lists.infradead.org
X-Gm-Message-State: AFuF++nKw4H+Lw6dV83rKYem+B6QVa3okZQ3PCnNqq6NzDqdnXUwOsUh
	oI1aJMYfS6vgg5lTR7rJyUPHS+OYWEy04GPwBW4AUzB2iAMUJaWgm0YfrKXQKQMc77oyYrAPJO6
	BUR+2+vyIdSmMOwDh2Nv81r8nuKrdke0=
X-Received: by 2002:a05:6512:ac7:b0:5ae:b998:9134 with SMTP id
 2adb3069b0e04-5b5e68a7adfmr11827743e87.1.1788283375630; Tue, 01 Sep 2026
 10:22:55 -0700 (PDT)
MIME-Version: 1.0
References: <20260827-kuno-soc-support-v5-0-6d47636a8f09@oss.qualcomm.com> <20260827-kuno-soc-support-v5-9-6d47636a8f09@oss.qualcomm.com>
In-Reply-To: <20260827-kuno-soc-support-v5-9-6d47636a8f09@oss.qualcomm.com>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 1 Sep 2026 19:22:42 +0200
X-Gmail-Original-Message-ID: <CAD++jLnHCrhvdVCzbU5JA1qVOQ7hh7B=gwPr9QPtZdqh9ZxADw@mail.gmail.com>
X-Gm-Features: AcwNN1V_scX2qdh9lKw1huy2nxRfP13bn5JqOZZxyJX3f5glJ69SIw1ECTFLPMk
Message-ID: <CAD++jLnHCrhvdVCzbU5JA1qVOQ7hh7B=gwPr9QPtZdqh9ZxADw@mail.gmail.com>
Subject: Re: [PATCH v5 09/15] pinctrl: qcom: Add Kuno pinctrl driver
To: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>, Bartosz Golaszewski <brgl@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney@redhat.com>, Georgi Djakov <djakov@kernel.org>, 
	Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>, Robert Marko <robimarko@gmail.com>, 
	Guru Das Srinagesh <linux@gurudas.dev>, Taniya Das <taniya.das@oss.qualcomm.com>, 
	linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Thu, Aug 27, 2026 at 7:52=E2=80=AFPM Hardeep Sharma
<hardeep.sharma@oss.qualcomm.com> wrote:

> Add the TLMM pinctrl driver for the Qualcomm Kuno platform, supporting
> 110 GPIOs and their pin multiplexing, pin configuration and gpiolib
> interface through the common pinctrl-msm driver.
>
> Signed-off-by: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>

FWIW LGTM
Reviewed-by: Linus Walleij <linusw@kernel.org>

Bartosz will decide and merge when it is ready.

Yours,
Linus Walleij

