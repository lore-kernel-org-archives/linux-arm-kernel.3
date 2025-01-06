Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE89AE77198
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jan 2025 22:35:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SRJ5zQMdFgK4dAX2MgR2Lkjmxo4dchPiAv78ousBkGs=; b=LOH2tsaLLekStArCjBPtv7tnNx
	NS/gLht+ZnYZbyI+SCIALD9AY/01+fZJLjP3U9DtftUIxIftNmuF3ZuBW/UH7jesnhhcGg3tPyCpN
	SVYSEErZEgefLgiLBVzTJiBxVFExOhbKXTrph8+rWsKtdmKA/c9o4Elia9QjF8jnbSth3nb2SDFKt
	cN7a8XfNxm09F4+SSe/BAYhSbBjbdXdaxbH0oB1Z8RQ04KFgYB3cQCsSp2dkKl0pIT08yyyAVYp0j
	dlnMmSCjiwXzPOYeMIBYUAMh9QthIFWUrX23EDOktOWQB8d+XCrwczzeRxiREaDqOKdwJVio44O+z
	T1W5acVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tUvhD-00000002t7I-0oIT;
	Mon, 06 Jan 2025 22:35:39 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tUvfy-00000002swq-3IM9;
	Mon, 06 Jan 2025 22:34:24 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-21628b3fe7dso209400815ad.3;
        Mon, 06 Jan 2025 14:34:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1736202861; x=1736807661; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SRJ5zQMdFgK4dAX2MgR2Lkjmxo4dchPiAv78ousBkGs=;
        b=cc8//KRe519uwqTVB2u9ZJUPnpMd4MgHfAGnRwNrJX/e9CcNThvF7BTirqN+3z1xi4
         EV2hA8k6jaOEvqZFR//d8kqntHXYxkGzVU98TnnEgtJBaZKQ2b5yuv7bRRtM4sPpT9Lu
         QyE6dU3bsEe5HM3ZSe0i2uDGEvUdIMZB+qyXhQ0YjtY0LzCSIjl8VVLqRAHJBDQaTqHN
         qI8tTGVijRoSL2OvNzCbvaMH/QxEwSy8ahzXxx3iz12oCmUD8xUl9H+ENc3J4xcIS9Sc
         sE6V88a1Wlb1JrOJ/Dqs2D30CFxV3OL5IsR3grkEfI6/YNkrISKS40kpJRbg7oMkD3p2
         6/XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736202861; x=1736807661;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SRJ5zQMdFgK4dAX2MgR2Lkjmxo4dchPiAv78ousBkGs=;
        b=CwWmqMMuI5PjPNuxHHXPb30vcQcUxt6L6saahWmbVrcR8If7rUU2Ab+iwOYlqxI69G
         ImWAZf3Dle7U+xZdxiMF84M2+LczD3Bov+TWlhrDB+NFUNchsro5UVUeISylvfjfJjIY
         s6Dsbi1PUIzk0jDbJKOfZf6udSUKy7t7jUuEKL0ECj7xx3HPrsiTRB3l6e6h60uXxsBs
         3kRYpCkMyf+jpi39VHPLE4pp4j632o1bGqxjnAEpCsRB/AJINjEI59mQOsuo2cuuzcIu
         v11Zzt++RW/0H9ghjthoSkcRWM5aoOHdZ0MdIQOMxwoZZJph3yQFDJN04oV0FcWLZxMy
         y/DQ==
X-Forwarded-Encrypted: i=1; AJvYcCVAyg4RNpLBNlSI3hU5SPHOqSOua4+EIdertNr9yT+pMG6LIfvpKOKnmrUDen34Be05KkOaI7vTm5ZVhSdjYCbC@lists.infradead.org
X-Gm-Message-State: AOJu0YyFMqUrgeoxWbkqbkgL1joaEOMV2vfbhhBp8LuYS7r7vKW47rd9
	dfPuC7yYsKaP/CSVZLJzv6iZXkytFS3E3T6BZFim+fLtg6T460YmoIYAvV+M2h9ShVPVWAfQQnh
	5ql2zryLdRwGVaJHhXnuE4yho2LUnpS6J
X-Gm-Gg: ASbGncvscx34Y+apFYB1URwfkBw+2DtVEfznATZfYadJI3TaAQrk4DCC2MidGVttDDt
	iPuWt1ZpppUBtNtMke19wdMOZOMK2bZGqIS2zAR+CEx7cChjHtRCLK/HWCS+oywaEDUf+lkE=
X-Google-Smtp-Source: AGHT+IGuUWgHSGN1lA/AsRYmUZDFO+rvMP+cWksOszeiSFwoBDZhKmY0oZmSfEmHnYRQlzYmpGLf37XLSYew5ncL1FQ=
X-Received: by 2002:a17:902:fc50:b0:215:b8c6:338a with SMTP id
 d9443c01a7336-219e6e85ccemr917173095ad.4.1736202861119; Mon, 06 Jan 2025
 14:34:21 -0800 (PST)
MIME-Version: 1.0
References: <20241231194207.2772750-1-martin.blumenstingl@googlemail.com> <20241231194207.2772750-3-martin.blumenstingl@googlemail.com>
In-Reply-To: <20241231194207.2772750-3-martin.blumenstingl@googlemail.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Mon, 6 Jan 2025 23:34:09 +0100
X-Gm-Features: AbW1kvaztPL8d6H70jEb3XF9EAvFNAZiRKy1VNxPZvUwBLqrgdTHWiSR8CCcvyM
Message-ID: <CAFBinCCC54naeaRj1ZvRDk6ha-sV=XhNrD8eHUjr30_87hViEg@mail.gmail.com>
Subject: Re: [RFC PATCH v1 2/2] iio: adc: meson: add support for the GXLX SoC
To: linux-amlogic@lists.infradead.org, linux-iio@vger.kernel.org
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, gnstark@salutedevices.com, jic23@kernel.org, 
	lars@metafoo.de, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	christianshewitt@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250106_143422_822859_56B0DB1B 
X-CRM114-Status: UNSURE (   9.33  )
X-CRM114-Notice: Please train this message.
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

On Tue, Dec 31, 2024 at 8:42=E2=80=AFPM Martin Blumenstingl
<martin.blumenstingl@googlemail.com> wrote:
[...]
> +static const struct meson_sar_adc_param meson_sar_adc_gxlx_param =3D {
> +       .has_bl30_integration =3D true,
> +       .clock_rate =3D 1200000,
> +       .regmap_config =3D &meson_sar_adc_regmap_config_gxbb,
> +       .resolution =3D 12,
> +       .disable_ring_counter =3D 1,
> +       .vref_voltage =3D VREF_VOLTAGE_1V8,
I just noticed that I did not properly rebase this locally.
VREF_VOLTAGE_1V8 only exists in a local patch of mine (to be sent
later, I assume Christian also has it in his tree which is why it
wasn't noticed).
Before this can be applied I need to change it to 1.
I'll do this once the discussion is over and then send a v2.

In other words:
Jonathan, please don't merge v1.

