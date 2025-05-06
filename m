Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8FEBC3ABBC
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 May 2025 06:30:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7QMw+5nA2GGVua9gtBE8dFrWvOjPIYNtXm8x/tSpfgU=; b=wkDlqqEk2ylhfvsZzFjuhKbFU9
	oymXZ+FtXNJjiVufNibZDXQRHjIHvpXTIYnOagivwwoOemVcsv0gDYek57iYN9kYni4F0SvmqbZrD
	sgcscIgyCft18X8oTQv01tS1AFGTgvffy8emt9DqI6aXcXVSKUKt5+KSc0hTtObFc6EZuh/NwRH8t
	6mHEN6tabeg6yvRhlC/4ClwjN+1JvHwbH+dIQAubAIbi7rW1Bu86wcyPDHyINvGfwePGNuXMl4h6U
	FCv5VBAYes+iKLBLVK4LulPAszt9pf1bHddARFgGlkuxzFbAkKGMZEzyVtHs8A04CnN99Q4YNCUxJ
	PUmXyUIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCBoN-0000000Agch-0QYH;
	Tue, 06 May 2025 06:29:51 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCB71-0000000AVmr-2lop;
	Tue, 06 May 2025 05:45:05 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-22438c356c8so50925255ad.1;
        Mon, 05 May 2025 22:45:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1746510303; x=1747115103; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7QMw+5nA2GGVua9gtBE8dFrWvOjPIYNtXm8x/tSpfgU=;
        b=Ma/PMjLEAdIW571z2iDqemdeWJEJEtJEqf/lO03eIXuTcJJxGg78nmv8KScexBYwIX
         UzN782RUukSGI6bwyKKeSVtdnGW9ugZZszQujHbqPYi1EjmcXeTq2yazHTeWHQH4BU7/
         XG40Hda8Sy0NJWDuWDT4teDNSsRnF+YVHAW2e+8o7xS3HZQSP+z54l7eRzkiEejun4i8
         dBQj1xdUWZwSNP/58Y951YE5N98eIRzQOj8DrwAZR/CUTXv5IpMptNUCdQOTFh64+kUN
         IxzcYNou99FScYAypi+1hZQymbgcPh3SVnia091pnOhtrvSvyOA1PlEwYxBQRcQ5BltD
         NUJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746510303; x=1747115103;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7QMw+5nA2GGVua9gtBE8dFrWvOjPIYNtXm8x/tSpfgU=;
        b=pLO/lu6Zl6hNG25tcunKl5M7u5GHwHWgs/L9oQlWmA//BjeOJ3NO2tBKcMtdUre4dP
         B+/RB3+EWCQM7zsuaefn8gf66b+yN5JEShokhcZ2NLtpNSbfEMy0BHrEl9vpdel3hpwP
         Uc6EbaTXPDY8FJlcNzPIDy37nXOfclIdddUwgI4oBE07MtF//4OZZAvwP/2+KRunDhyo
         lJGg5eT/EGvszUMALlXxSloz4KDJbOQ8a61PerxLVC4IJuRzJgLw6Kx4mClwfAaMmTdC
         eMgPC6F2NXFI8NEzOQINr4196th+A/OtAQ0NVPyVnNf+KzWge+TqZRdNaocjLdjzWaC7
         ge9A==
X-Forwarded-Encrypted: i=1; AJvYcCUbAiDEaLnDztWjR86eWOUdEFVNEztZLMlYwX394JwtGF93oomySlzKH1i0REnUVG+EAD/ol6Z1EO0KsBFunpy8rg==@lists.infradead.org, AJvYcCXcLbdIb4dNM0UFdeR2QLcRk0XQig+lyjPn2fDgjFbT4RBjaOD730ZgaBWOe6oFPpNC9FZ4F0DJdjo9Bux5@lists.infradead.org
X-Gm-Message-State: AOJu0YwHIcOtdaBk8KWu/mJhps0aN9nxZPBd7mQZ9aByqfQB8gwul7f0
	qQEgz24jY16Xy1rSgLz9elFXr2wYn0QjykvaB4aHaSQfkuGOwz2t/PZ83TgIXz8azKkLm5Frk+2
	HAZURIR43GXWusuRoaVZPYdzPfiQ=
X-Gm-Gg: ASbGnctt7DsC/uhz1mZNJxfBIdN5/AVfAPbP10V8RO1Q73VYwhhlRrHMw2+bVDmExXb
	Awh+L2pmkkagg3X8p2kjKke/nVIsTZ+Fh5g0LybYgdxciLkHAQvqAiuktxJzqhniOv/zaT1imDK
	Gp/HAX6HJg/kVN4lC6VVlFc4ZBTiyuHAgTXyMlf78kIVBC4+Q=
X-Google-Smtp-Source: AGHT+IEAtjZAiVW9FmeIPs+b2L0Cy/C7fmszykHtPtzqcf1LWGqQ9MrO3WWZWQisFX6hdN6dX2Pwfb6vvI+jq0mf724=
X-Received: by 2002:a17:903:1ac3:b0:216:7926:8d69 with SMTP id
 d9443c01a7336-22e1ea95042mr127743175ad.47.1746510302790; Mon, 05 May 2025
 22:45:02 -0700 (PDT)
MIME-Version: 1.0
References: <20250428-fernsehfee-v2-0-293b98a43a91@posteo.net> <20250428-fernsehfee-v2-3-293b98a43a91@posteo.net>
In-Reply-To: <20250428-fernsehfee-v2-3-293b98a43a91@posteo.net>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Tue, 6 May 2025 07:44:51 +0200
X-Gm-Features: ATxdqUE0-lwrubrO18uAn6fPR3DZquMt1RXTKqplWpMfrQ3jLYv5ONhvDdTbeEQ
Message-ID: <CAFBinCBVZeGk1QXMhwqQR9k9vJqDR3Hew2gxMxGZh4+SdbARFg@mail.gmail.com>
Subject: Re: [PATCH v2 3/4] ARM: dts: amlogic: Add TCU Fernsehfee 3.0
To: j.ne@posteo.net
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250505_224503_699375_8E3D38CE 
X-CRM114-Status: GOOD (  10.33  )
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

On Mon, Apr 28, 2025 at 12:44=E2=80=AFPM J. Neusch=C3=A4fer via B4 Relay
<devnull+j.ne.posteo.net@kernel.org> wrote:
>
> From: "J. Neusch=C3=A4fer" <j.ne@posteo.net>
>
> Fernsehfee[1] ("TV fairy") 3.0 is a set-top box with HDMI input and
> output ports. It originally ran Android 4.4 and a Linux 3.10 kernel.
>
> The following features are tested and known to work:
>
> - Ethernet
> - Power LED (switching between green and red)
> - Power button
> - eMMC
> - SD Card
> - USB
> - Wifi
>
> The following features are untested or not working:
>
> - HDMI input and output
> - Infrared remote control input and output
>
> [1]: https://fernsehfee.de/ (German), https://telefairy.com/ (English)
>
> Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
> Signed-off-by: J. Neusch=C3=A4fer <j.ne@posteo.net>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

