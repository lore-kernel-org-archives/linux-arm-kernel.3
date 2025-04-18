Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51545C369AB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Apr 2025 10:33:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vyt8vlbCUmrgxaje/SGVdwJgpors68AcKgtfPJppRuw=; b=R0ooG0zoca7LNDzarzz/Ds+EeN
	Rnl96GuEIJi4Mo0g+ie/G2BojZNp3m1ml9RTiwMZYPUyCxSz1EJPTJe1VzQPva4bBHtyWPVpIOlh3
	dSAp1ussp4uw250CHcx+hc0+0KmsC15f3P2a5omTzbHgHejSR0OYNINYNht4926cys+O19MRsniw8
	vAmvVAErSwj6ish2qjQPDKD7nd2B0GIWRznZT8N2PjEbKkBztuklhaCaRLqXgn01ozVdy7dRQBZX+
	RWMgwzW8vQw9TZLcJX7Edm44fn6GyJtVYRaJ+lid4S42oAuXT3mE3qq7WhY+27v+eRd6W6x3m1Bym
	nVvQ/iFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5j1i-0000000FsIh-41b2;
	Fri, 18 Apr 2025 10:32:54 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5iua-0000000Frag-2iKV;
	Fri, 18 Apr 2025 10:25:33 +0000
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-5e61da95244so2961979a12.2;
        Fri, 18 Apr 2025 03:25:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744971931; x=1745576731; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=vyt8vlbCUmrgxaje/SGVdwJgpors68AcKgtfPJppRuw=;
        b=BkOX+SoDIA7L+i1haEZNAPP5ePJy+99X03NKcFsLGOhDXiXBM82N+A+dIXSiXhi318
         OreuZY6VC2SDR5GFR5or/WJAlD7uo4Yl7n5HkBXONXOk5qjSb5YpYP+Kt39byaHsjs7Q
         XYXUfsgTxiw/rWrSoZLTPPCdqsr55t+lwK5Y+1/8u8jWAx2O4kcB683c/kpGLoAoaixy
         p+S978f2Sd/mi7sJqTL+oKFhiIMWx68OE8hk0MMlj1ic407EUTYh8vDN/sA4b2+tqIKL
         CBqeVT/QgYHdyNJOK/t89dmN2W64PUqwVGADXGrUZS2AE2D5sjMRTiKrOrZkO0SyABFj
         d5kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744971931; x=1745576731;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vyt8vlbCUmrgxaje/SGVdwJgpors68AcKgtfPJppRuw=;
        b=OXUy8FWT5bgHuDO4tAGvP9rKqQ89TvE7k/+hWwxg/5xVe2FleB4AstzW/Qey1x3CiF
         ntli6nvM42BmBtnt/LbS8FMWgp/0ssAAfW6dSrE0HZDLLmVR9ayCMheZXoygHFxhjQ4E
         SHmn3KyMGecpsyE0+SPUUybTw+nziRcxurycsmMYgJSX3BVoFrQWlY2Vsp7t/wTJQM+o
         yibgwqS1kMuVQq90PMKSbSWzvg4qJQ9cPup/ub1f9Edk2pZbEzJPDryAoaEmyR5tygxi
         aWAk0LfOe1I7dYyDsPvGBukP/zsokkQ4iTdJy/+xGDFjWoiZRals2RnSCcrrtZUvIaNf
         Nw0Q==
X-Forwarded-Encrypted: i=1; AJvYcCVNzND+awn9P7emH/V0Q/U50zz/iI5b6IwctR6IwPXZnTj+JOxr8YFICWeE+1CE/obpFjhEzbfs9PLPMdAqcR+K@lists.infradead.org, AJvYcCWrs379AyGw0ES5kqq1z20zdJp8KA330SIcsw665W7H2KnP151v+DPL87T3/YvuV8Tui1okP2xQur31x1aqlrI=@lists.infradead.org
X-Gm-Message-State: AOJu0Yyvua546Mjh+YGA0ylPfLdBKNwI9xUlLO2r+uWj+0eACF27oDuA
	W9lczYHKDh5foX5DGUgp+cp6PFk4ULBmeFYmmaivAqM6b6un5QTwcfAKXl0h6Os=
X-Gm-Gg: ASbGncv1e4SVOKQT36aCyQrqlqCWl5Bg9udHve5v8bDYa/rCAkzgbzzC+TVpp1F9Sxy
	oqv8ulpnm7j++uXh7697Zvdu5CV3ctp+Q3h7Mpfe1KCg6S0nP5ywW/9JkLu6MYfuh1ltW7PoW9F
	ms3RWJNtGYx7iAdChUcpAjJ2InE8KX5WtfjyB8CjyhVQ1LXl1hmjKkc7aPXpcDPm8kn/FiilaY2
	umQjw8i/Ff4CAtoBy90vc6qnF6MkvOI+ThzOsPeFitLfe3ywS4etDh2PKInnDb2H3u8ch/NfVAR
	UnlzNp9raCiOnEuGlV2bJRm3e5NqLjCzTL8D/q9wrICP1eBH1yjJbgjEg1gZZbFn1aTLj7ROU4y
	3/DIu7Yv9pgqN/bM=
X-Google-Smtp-Source: AGHT+IFJu/NfcqWAjNuPs+r5w0auetjnU6mwnE3w1maeyZRnlV35H6XNIlmASm/PfX9aMr3HbzbBqw==
X-Received: by 2002:a5d:47c9:0:b0:39e:e588:6746 with SMTP id ffacd0b85a97d-39efbb240e7mr1584070f8f.57.1744970263248;
        Fri, 18 Apr 2025 02:57:43 -0700 (PDT)
Received: from ?IPv6:2001:818:ea56:d000:56e0:ceba:7da4:6673? ([2001:818:ea56:d000:56e0:ceba:7da4:6673])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39efa4a4b68sm2247940f8f.87.2025.04.18.02.57.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Apr 2025 02:57:42 -0700 (PDT)
Message-ID: <494ee0cc5be01cb6a4db29d7f1a11dcee22850d6.camel@gmail.com>
Subject: Re: [PATCH 1/8] iio: adc: dln2-adc: use aligned_s64 for timestamp
From: Nuno =?ISO-8859-1?Q?S=E1?= <noname.nuno@gmail.com>
To: David Lechner <dlechner@baylibre.com>, Jonathan Cameron
 <jic23@kernel.org>,  Nuno =?ISO-8859-1?Q?S=E1?= <nuno.sa@analog.com>, Andy
 Shevchenko <andy@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Lars-Peter Clausen <lars@metafoo.de>,  Michael Hennerich
 <Michael.Hennerich@analog.com>, Cosmin Tanislav
 <cosmin.tanislav@analog.com>, Tomasz Duszynski <tduszyns@gmail.com>,
 Jean-Baptiste Maneyrol <jean-baptiste.maneyrol@tdk.com>,  Andreas Klinger
 <ak@it-klinger.de>, Petre Rodan <petre.rodan@subdimension.ro>
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Date: Fri, 18 Apr 2025 09:58:04 +0100
In-Reply-To: <20250417-iio-more-timestamp-alignment-v1-1-eafac1e22318@baylibre.com>
References: <20250417-iio-more-timestamp-alignment-v1-0-eafac1e22318@baylibre.com>
	 <20250417-iio-more-timestamp-alignment-v1-1-eafac1e22318@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.4 (3.52.4-2.fc40) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250418_032532_677429_66D0E736 
X-CRM114-Status: GOOD (  13.34  )
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

On Thu, 2025-04-17 at 11:52 -0500, David Lechner wrote:
> Follow the pattern of other drivers and use aligned_s64 for the
> timestamp. This will ensure the struct itself it also 8-byte aligned.
>=20
> Signed-off-by: David Lechner <dlechner@baylibre.com>
> ---

With the fixes tag:

Reviewed-by: Nuno S=C3=A1 <nuno.sa@analog.com>

> =C2=A0drivers/iio/adc/dln2-adc.c | 2 +-
> =C2=A01 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/iio/adc/dln2-adc.c b/drivers/iio/adc/dln2-adc.c
> index
> a1e48a756a7b519105393f77c4aebde1f2f85d50..359e26e3f5bcfe16d723f621bdfc01d=
f2dfcf6a9
> 100644
> --- a/drivers/iio/adc/dln2-adc.c
> +++ b/drivers/iio/adc/dln2-adc.c
> @@ -466,7 +466,7 @@ static irqreturn_t dln2_adc_trigger_h(int irq, void *=
p)
> =C2=A0	struct iio_dev *indio_dev =3D pf->indio_dev;
> =C2=A0	struct {
> =C2=A0		__le16 values[DLN2_ADC_MAX_CHANNELS];
> -		int64_t timestamp_space;
> +		aligned_s64 timestamp_space;
> =C2=A0	} data;
> =C2=A0	struct dln2_adc_get_all_vals dev_data;
> =C2=A0	struct dln2_adc *dln2 =3D iio_priv(indio_dev);
>=20


