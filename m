Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB1A5606A324
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Oct 2026 08:56:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=O2QIJf2/;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Mkj5aPXg
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=ZZQo695rVLd/9P8OSYiw403iPH4b0i2xMXdXOpikEz8=; b=O2QIJf2/hLijK0yWajAdOMGaEg
	xIQ3qenmF2Yd0pzxyVUUtnPCLs9aBjaJGCV4dGgOBsEuLdd30YU9aTvZ1i3Z4OXC4coZuF6RJdDI7
	TIR70gwC07CMFk/tbG7QdJspPGBBHxIBehXQF+t8VlZWH0OVsE5rf7+9SmdBbkX8OAxfBZ+iminIB
	RUM1M0fR3iYC+tpaCGQzi3ytFyj0vkoI+gk2iJqFJdWGeFw34A6fdFfvPhQKRr9cJ64bj4WOwTCbf
	pi06L18Sozliy68yDlgIAcLqF/5+GM9e4Nz7a13/NY7oFScNy4qkJmIBZVfIqvfCTjPjVD/G0Q0gs
	LU38HBvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLzSK-00000006bFJ-2rfP;
	Wed, 28 Oct 2026 08:56:24 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLzSH-00000006bDg-3mX4
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 Oct 2026 08:56:23 +0000
Received: by mail-ed1-x52b.google.com with SMTP id 4fb4d7f45d1cf-6b3e4764ebeso153807a12.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 28 Oct 2026 01:56:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793177779; cv=none;
        d=google.com; s=arc-20260327;
        b=ZbXYUzLAEmK5GRz48FavYcsi6ih17jzwsCWgC44wVRvvhvcdUxTIGmnF8jQ/XNq+ry
         tNBJ0KKBG26ruhjP8UcR7EjdRdPIl4afXHHfLZEkCqEKAY/dq2T21UPnm5FbeDEJ0Gzq
         2DvHzmMuO+YprU/2v5h1tXKNL4XflEZ/h52Uk9zIdwC1ln4DovLCof1ZqSPqk+zGV7iE
         5W0dJ+upXXKnDoZzjYkXRsM4ShcovFgbznPR6EowH66WKtGUzA4we04kAoZQXApCb85m
         QxXRpYAgibfDCVqOi5DDn/4WBXd1kkySbrs0XmTXxfQyBfeqFR2h02QK8WrE2hIuMUDa
         rlCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=ZZQo695rVLd/9P8OSYiw403iPH4b0i2xMXdXOpikEz8=;
        fh=nE3vPSIxNgPLMnjbkF0j1QXU/jxEUaEu4RztgfUMjHg=;
        b=ceYbuicwnMIe0E/EpN9k1aY3rFAx//CEa7ibqSYWd+S8rzpLbUWdDNBrzdvGhnI0um
         WKuXrX9WhJ2O0/zjQLX4QHfzcU5Wxy5DHRwp3rhQN1tuLrXCb89+xYChbTPuyNVGy3r/
         2XlNmPIQOeftY6NCY/D/+JR5CAileNeb9RZP2FA7qCGnIkLMWpMudY7z58YXllMlRX3j
         q4tU7FmcPAgVmln9bxaTJV0WpvwzcFlFl48f/jM9bQqyIV6Sio0fgm5g9kil5XE3HGgu
         NnGxIVrLN1BP7emtNfV1ff7AtyMvOlSCPf/5LbAs18sXHzNZ3QGCCSbgmBFC2qQNnilH
         vbvQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793177779; x=1793782579; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZZQo695rVLd/9P8OSYiw403iPH4b0i2xMXdXOpikEz8=;
        b=Mkj5aPXgzjw66OqCSVTFkzsH+Z7+iqcoCMrsK13OQwWQCydmGjEJw3QNFRIgY8VzgC
         661+aFL5ucoZ296X/Wqs7+vJKCLqxMtcwiP6hpTgSYaeycA+cgOweD7ZVD1K47Le7Z80
         /6sFXWRsy6HnR4BCn3w5WhNP2OowEBSJMUK9JBYBuvwJEJd/iFQTA/Y2DvLKJgutMpxM
         oSppXy9Aa/ZqyoPDPpnBeLTjy3yDDhj3pffNY9vBi/X5PRTzx0x7sChCvvHf6gLS14KZ
         624qWVSjhS8EMxgjVSn81Dmr5MVdoDDQuu2BEQO6/UQwge81jW+DkF79XM64VEU9iXKm
         4+JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793177779; x=1793782579;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ZZQo695rVLd/9P8OSYiw403iPH4b0i2xMXdXOpikEz8=;
        b=vNfgd3Yd45Y70KhACVVfkgMyBvVQYk2B6yoG6LqjDC/v3t1EqajNUGzZLajFAuUpaz
         6bpt5YymUqU5cjqZWTZCeTO2XY/sy6lRA7Jvvd9/rdX3DnYDGH99Qz2s5LG1sKEi1BDl
         8VSqePujJuGr1CPM4IOH1epnb7FtUHzan2gWZgPAwbSI57JUXQ//pU1LEA050FXrDl+a
         4A9OWuSHDxs6V/8UXfSoKySt76Nttfi6tFwGyOy6K+x2qtN42yNDVaEJnF66RgRdwWGa
         8gdCjt+/F6iXzyusLNkbSnDgIBIf+tadQlr9OM+3kzxi3vbO0Yz6MOLfBLirmN2hL4lo
         E0BA==
X-Forwarded-Encrypted: i=1; AKwUvBxiXhqJu7vTuVIUyt8NLAWQw4j2imSH2j3odb7vnfMICCvsgPLCRlXHcU10TAxN9HWddYTE+7L55oz/JDwbHPAg@lists.infradead.org
X-Gm-Message-State: AFq9FYLsLiWvZwFFApZsbTUgIJ7NGcUCcIVV0eSo746vkiSgIy+uj/mK
	QV+eI+bumNeRn2ksq/LKhkLgXAJZhdHpo4B9EVXsFZD12N33Z6QEIgJWhBADBYb8KKAf0DFfvQ4
	xszfC+Cpz7ANdEm0+OJbT8OCTGVzl57Q=
X-Gm-Gg: AYBFou1Rs8ea8fmZlEBuFdmIposkcPoT3NP52ArsXP1H9Wls3xi2YLELpz60zOBk5mJ
	yU+ep5c3JNIxYxI1SXxYPIC2FfOFp+KMmIW1+LMsQJLggaDg6KfSoMon3Zn1oMFS6QcPCmqgA3w
	7B96v1Df/nScdEElqJZbanqhyTt1emaOSq2s1xgp0dbR9IS5fHBzGjaGdbPqcamK7aJ9vGNdsQB
	bOfCtcQvVMot9CvQa9TFHF01vuMmnuM4qY1XKhhch71UsOmUIr+VCaWfh2q9Fz+RxPB5/udjC5z
	JIUaG3CvBRKGXJLFjnHBxF5gWN5o1xHmGlPVeewjLbrBXTNMLSCpoMLeltQDmAWIin7ODckz9+V
	/WhqK0B10F8XwhdD8usU9ue91C7UAPjxmoTE0orVPNiWiKC8C/bKiwrBuNA==
X-Received: by 2002:a05:6402:a6d2:10b0:6b1:da27:34cb with SMTP id
 4fb4d7f45d1cf-6b49cbce701mr976968a12.2.1793177778791; Wed, 28 Oct 2026
 01:56:18 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261016-dcphy-rx-v1-v5-0-e63b49eabe2d@gmail.com>
 <25254818.ouqheUzb2q@diego> <20261021024239.GA3667411-robh@kernel.org>
 <3435698.oiGErgHkdL@diego> <850be915-d42b-427e-a036-907b9364f9d2@collabora.com>
In-Reply-To: <850be915-d42b-427e-a036-907b9364f9d2@collabora.com>
From: =?UTF-8?B?5qWK5pm65oiQ?= <jason98166@gmail.com>
Date: Wed, 28 Oct 2026 16:56:06 +0800
X-Gm-Features: AclHuK9Sjf7k3U-KBE-ExwCBQXl-_hQw7npOFvb6IJVRf4k6WS3oRrSiOtSkTyI
Message-ID: <CAPwA33J1nud++bYV1JnPJqvA+ocz5H1=DnyJy3HGX4np6JxaEw@mail.gmail.com>
Subject: Re: [PATCH v5 2/8] dt-bindings: phy: rockchip,rk3588-mipi-dcphy: Add
 a cell to select TX or RX
To: Michael Riesch <michael.riesch@collabora.com>
Cc: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Manivannan Sadhasivam <mani@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Guochun Huang <hero.huang@rock-chips.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Sebastian Reichel <sebastian.reichel@collabora.com>, 
	"Bryan O'Donoghue" <bryan.odonoghue@linaro.org>, linux-phy@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261028_015621_955745_D9711343 
X-CRM114-Status: UNSURE (   8.90  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -1.9 (-)
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
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Michael,

I have just started drafting the code changes and comments following
the discussion above
(including your comments on patches 3 and 5 in v6), so it will
probably take one to two weeks.

Best regards,

Jason

