Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AD9DC83F0F
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Jul 2025 10:22:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lpGeu0fct+3VmHlRdU5eb8NMKV/Ar7w1D2lbejumdKs=; b=yrwGyyxuY8CR/ya7WLDLwxi02k
	hGf+6MQ15k6uYseTpWpxyNV328LGBAnk4xW19UCloxvkqmxRUV46jrOlwbhdKAkjpQgm7fcO7ZkSa
	QRRnZ0Xv3X1YOUiFsh9nKA9Q3hERM2yxNgOmQu8fXHunKPDdjnENdEM8bWM9OglZ7Gayzvq7Kcer0
	zgrdd4LGpnvRisRzojZe/etCH/P9XAdJq57mOW0Rjx0yMjiT/RpGHSX3R10nZfWODiKSGQgD7wcog
	b6whTJFmDqAvqQTtTQJkPcA7Wa6R2byfvreWqd/B+2FZCv+KMjJsr3qAsbgmVI+7KlHGyXKl880Qg
	l1VNNaIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZ5TP-000000053YJ-0svY;
	Tue, 08 Jul 2025 10:22:51 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZ5B6-000000050Hi-1DO0;
	Tue, 08 Jul 2025 10:03:58 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-236470b2dceso35336445ad.0;
        Tue, 08 Jul 2025 03:03:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751969035; x=1752573835; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lpGeu0fct+3VmHlRdU5eb8NMKV/Ar7w1D2lbejumdKs=;
        b=ccYde1dW10BIFSAj15l4699/ADChUoVUrq8Qx8th3DT/fo4W29BjSmD5KFuMrULMHs
         WbveVRE1QPpZgrg7oM2rrhR0lH+qelY3aDAJwAMPP2Lc0D3GXu9VinzY5sx61DNzXTtp
         6dH5a1HIUWFX2OHoq5WqOQzIBhecnX6dyTu2JlH3X6UwHyVeXQTCfZ6B6R0uPvEFNlNg
         T46P/ueQPpolx9tM6Tf1KbtuIQSNqnx36LIva4Mk0tRM2pnXamm0Ch+XqviKzgKYpY7u
         6hPSFhgE2vBUuAcfnmcDSU5du17l/qF6W3zgx5FEmW1NDeyC3U17UVrse9Uf4JQvkvAy
         YR2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751969035; x=1752573835;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lpGeu0fct+3VmHlRdU5eb8NMKV/Ar7w1D2lbejumdKs=;
        b=eRQrkjNXj+m+dhgimkxCslXDEY9yvhoYdxZmhRW2igrKWwPjZ812+IYw0UiU1WC+AY
         DZ6nyke8eFQ+ms+VyS3qpIaLXItTKx+1eCOPEno875DqfC9FRUJy56CmX5egnDqK0Nyq
         mpXF3WP4s/XT4Qk1Dzsvy3R7BN50xDFsOclO6vIky2pjQZZvWWM9mExf3HJoVg3tWu8v
         8F82ojELS8Quq9e2Wrxsud//RvZZuimpXYipKPnVkWxQOpB6qw8g8X7qj5ReEXsx8V9Q
         ASo9qqDTalMeKn6Jv4f+12ok2TBKNUASjtQCszhXcVA45gyuaudv+GoFagmI/FOmZdLJ
         Xb9w==
X-Forwarded-Encrypted: i=1; AJvYcCU5fIMrXjKimhQewF89Dx0/4pHM8AGsrtC9QdW2eyZ+WljBV4Ku71unb5GJK2qI35YtNRH3dr+NECys+blJp/M=@lists.infradead.org, AJvYcCXqgoyyM6PW6p9JygHtkLZKyGmeSs38hCqeiDhHWKWoCIoNYOuqI7njSfp7ITECU5Yny3VubYOTSb+In0SB8t7Y@lists.infradead.org
X-Gm-Message-State: AOJu0YxSQmvgDW3HKr5X91c7P/iq4p68RANDDeBYDxGsVUsoE4jCbD+J
	fHRt2rvdxsLfqib94Rblj4xJmHmXrY578V4fuFZZeD6M3qNrWcIvWIJ9uxwbq5ac5RTPsYxlLQE
	Osx8rzh2uXRi2NaTi0cPpGpNg+aKXUoM=
X-Gm-Gg: ASbGncuWOlVnscHMXTgq6WZwGN0vYhtN+1Sm1VsQia11vAGUNLzG6BDeBA5kzYn8dYQ
	7WggduuU6F/s720E3m5vDnV3EE8RfiiZ2djIgv1Q75YkdwzvzxxRQAmMAAlBmyJcW0Li1QjxWBJ
	r+Rn+h8CnjKnsVlW+Ms5cdSBR0yvBhBeINHObVvzDh
X-Google-Smtp-Source: AGHT+IHCEfcIS2hUnEdB9PbPmt5ZD9T64WlU2Ot8WUjUZqgiMJ9d2john/gI6sTWhRffzI0DT19R2HBQAqTyVFgmv0M=
X-Received: by 2002:a17:903:a47:b0:23c:8f21:ac59 with SMTP id
 d9443c01a7336-23c8f21addemr149130485ad.29.1751969035426; Tue, 08 Jul 2025
 03:03:55 -0700 (PDT)
MIME-Version: 1.0
References: <20250706214111.45687-1-rosenp@gmail.com> <20250706214111.45687-4-rosenp@gmail.com>
In-Reply-To: <20250706214111.45687-4-rosenp@gmail.com>
From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Date: Tue, 8 Jul 2025 12:03:44 +0200
X-Gm-Features: Ac12FXwhjylZMsoY4rDqa01BVMXMM5PiGD4HvSivpj3vJ2MwrtIBDDKsIP82h3Y
Message-ID: <CAMhs-H9PcmyNsZsU_JujV0PkRmJX5HSc0TBMR05OWmhUP0ByYA@mail.gmail.com>
Subject: Re: [PATCH 3/6] wifi: rt2800soc: allow loading from OF
To: Rosen Penev <rosenp@gmail.com>
Cc: linux-wireless@vger.kernel.org, Johannes Berg <johannes@sipsolutions.net>, 
	yangshiji66@qq.com, ansuelsmth@gmail.com, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Stanislaw Gruszka <stf_xl@wp.pl>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, 
	"open list:MIPS" <linux-mips@vger.kernel.org>, 
	"moderated list:ARM/Mediatek SoC support" <linux-arm-kernel@lists.infradead.org>, 
	"moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250708_030356_324153_BDE5241F 
X-CRM114-Status: GOOD (  12.57  )
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

On Sun, Jul 6, 2025 at 11:41=E2=80=AFPM Rosen Penev <rosenp@gmail.com> wrot=
e:
>
> Add a single bindng to help the already present dts files load the
> driver. More are possible but there doesn't seem to be a significant
> difference between them to justify this.

typo: s/bindng/binding

>
> Use wifi name per dtschema requirements.
>
> The data field will be used to remove the custom non static probe
> function and use of_device_get_match_data.
>
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---
>  drivers/net/wireless/ralink/rt2x00/rt2800soc.c | 7 +++++++
>  1 file changed, 7 insertions(+)

With the typo fixed:

Reviewed-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>

Best regards,
    Sergio Paracuellos

