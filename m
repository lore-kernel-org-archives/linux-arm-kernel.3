Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FA4EC83F17
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Jul 2025 01:20:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tjEHzcojVOquMjpcLqm6cVK36uSQ8Eu5COVGkmUWzN4=; b=wpjABAFXSsuQh6cJEPGo9OLim0
	eii/eRy1RDKOSc0r8Ax9mGfiKIq3ahaweJO35TC5c/xTmb+YEVMpm2Gg89Za08Y04YYMZyZzyFEgi
	DF/5A0nFHonOtvoK+R2amqLvU90C0xLeEnQpS/aX4b0Mw0Uno4hKVDDW3vOeoIlO5jhJhPtUZWUev
	l8KzK89LGfP4L1BASVuniYCfAmdobWHxpp1fzwf4ZNWr1YqoKvVeXYm1EEj+KpU4FDTUxmBMXIWs8
	J9OnawwrPo+xdMxVSI2p62w10gzWOSQglUWKvJJPAjYyjIW5AAiT1NQzQBj+goAPPvo12+DMosltg
	dbg6DtTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ua2QY-0000000DQlS-2EVs;
	Fri, 11 Jul 2025 01:19:50 +0000
Received: from mail-yb1-xb36.google.com ([2607:f8b0:4864:20::b36])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZzwY-0000000DAyL-2oeQ;
	Thu, 10 Jul 2025 22:40:44 +0000
Received: by mail-yb1-xb36.google.com with SMTP id 3f1490d57ef6-e7569ccf04cso1319050276.0;
        Thu, 10 Jul 2025 15:40:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752187241; x=1752792041; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tjEHzcojVOquMjpcLqm6cVK36uSQ8Eu5COVGkmUWzN4=;
        b=MMQ+yLDkH3iM1VK0x8cfUd2k6pgAhzKFRq+STCiTtrqogMtBa0vn3cl0drNigM4K2d
         TIZXRVxC+2lU6nQlRMzmlojTte8ZmBLIfrsZ47j/h3PObiKb+U93i/5IqR7BR63p960j
         xRJuYET33RHWecBkH43sgU77ebISveSrWKIgcXlZ85u2DRzOKc7099MzSCCU9aH4k+EW
         81LB2h1396YtQKvCrkRh1Nqq8uB/psgXzPCz5O+pbIaop6DqY6QzjWqictI0DkpuYcJy
         ZEIxHiL/JIDEy8v4b87u19o3B5+GbrMwbjLCGfT+o7YznEcZZlitH3dPbya+gF4vO/Gn
         LgXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752187241; x=1752792041;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tjEHzcojVOquMjpcLqm6cVK36uSQ8Eu5COVGkmUWzN4=;
        b=HvMKx3CnSbyv5ogL0V84X/9oQDjnR3EbYatLyXVqP/MChwFEWpSUQIA7SOAqfbeHHi
         q/PSkGlgSmtWkvJMN3h8oh7v63C6mf8u9UdxYGB70JWWybwhvc0l4FBQdrvGPXy+vV7D
         S3IpqmIjtUfKe3g5kp4R5h8WeVe9XtS9qi5kp6KgCw7yN+fLaIKj+pJkeUSYh++xQ4WJ
         a1CPJCT3nb9PYVSwpZrsihEPxWfYsL8RzrPL4+yU1cw/cjVxm+c8DDZk5g+YJSrUFwvb
         Zja31RX79gK6axyLSRSHISlx3qvLSO+IT4mQVbGhfmDyi8RvFaQ3GRc+ohpcykDy+LNJ
         YAdQ==
X-Forwarded-Encrypted: i=1; AJvYcCWyhpnW4FYPEUGlNTAPqDLd6SWy39O7UzI427wdqJXrmzvH6GXmUQheIGfdSJW2vUdopPIOsU0HcpXT9l7dwt0=@lists.infradead.org, AJvYcCXHRg/Upqoy/hg0g3C/8au38tMBNWYQHDBiTeWoPVfN+bNceD501mHEAJAcpWzaRmQG8+dB1DlWcZUgjlwHEQvO@lists.infradead.org
X-Gm-Message-State: AOJu0YyJY4s+SbooLr223pABXSosQpGfOecHiFejthIX1hu0i/azPhLh
	VVEk2dLAda7Vf+1RIZ3frM6SvEMf6XLNvzqG6sR57L5QmEq/F4CZbcvJWKu9/73GCfGGBX0SYmB
	qp3kO1AOn9YAVa/s8wBjJH0Yq+3Br4PU=
X-Gm-Gg: ASbGncsrsddr9sNM6wT4NgaP2KBLALqcNcGr2DVPWwIJSqPxcFz5bOzBrQsYuyztKIn
	u5YTkctAtPW9EMtJmu/B+1AdEAC3werzUwifX2KRFskN1KMFzWGG+JVW7ezFzQ6ChDJYkjUaFHP
	AwQHHQXol2So+/rcFYZdGnPZUnXWEKXP7cI0PY07YuEyXRt6G3aOKjwXK8obK6Uk9HQJ7hr1/C/
	NyVj91FpljWTNcYMdoh
X-Google-Smtp-Source: AGHT+IEcq/nuQELJt2SqXJKHpdDPbGMsj7TkPRuHpdotlpq8FmL8miL36Xx2WEXiLy0vPD9zntYMqNZ5ly1AAjSx8HI=
X-Received: by 2002:a05:690c:3805:b0:70d:f3bb:a731 with SMTP id
 00721157ae682-717d78bfc7dmr16423417b3.9.1752187241474; Thu, 10 Jul 2025
 15:40:41 -0700 (PDT)
MIME-Version: 1.0
References: <20250710200820.262295-1-rosenp@gmail.com> <20250710200820.262295-8-rosenp@gmail.com>
 <d8b0abb2-1a12-42bf-aafd-4cd1e21babd6@kernel.org>
In-Reply-To: <d8b0abb2-1a12-42bf-aafd-4cd1e21babd6@kernel.org>
From: Rosen Penev <rosenp@gmail.com>
Date: Thu, 10 Jul 2025 15:40:30 -0700
X-Gm-Features: Ac12FXwR-CsOo2JS8-K-DTfqed89LUEmhHHewOheVSMf_oSCLFqU7Yfw7qzFLM8
Message-ID: <CAKxU2N-c2tHBYWBM+FJGqdSaqzw9u0O8e0G7AVqk6b0QdRnPTw@mail.gmail.com>
Subject: Re: [PATCHv3 wireless-next 7/7] dt-bindings: net: wireless: rt2800: add
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-wireless@vger.kernel.org, Johannes Berg <johannes@sipsolutions.net>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Stanislaw Gruszka <stf_xl@wp.pl>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, 
	"open list:MIPS" <linux-mips@vger.kernel.org>, 
	"moderated list:ARM/Mediatek SoC support" <linux-arm-kernel@lists.infradead.org>, 
	"moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250710_154042_710989_D85BBE86 
X-CRM114-Status: GOOD (  12.47  )
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

On Thu, Jul 10, 2025 at 2:40=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On 10/07/2025 22:08, Rosen Penev wrote:
> > Add device-tree bindings for the RT2800 SOC wifi device found in older
> > Ralink/Mediatek devices.
> >
> > Signed-off-by: Rosen Penev <rosenp@gmail.com>
> > ---
> >  .../bindings/net/wireless/ralink,rt2800.yaml  | 47 +++++++++++++++++++
> >  1 file changed, 47 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/net/wireless/rali=
nk,rt2800.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/net/wireless/ralink,rt28=
00.yaml b/Documentation/devicetree/bindings/net/wireless/ralink,rt2800.yaml
> > new file mode 100644
> > index 000000000000..8c13b25bd8b4
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/net/wireless/ralink,rt2800.yaml
>
> Filename should match compatible. You were already changing something
> here...
hrm? that makes no sense. Various drivers have multiple compatible lines.
>
> Best regards,
> Krzysztof

