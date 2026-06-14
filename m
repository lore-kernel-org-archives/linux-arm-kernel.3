Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 010A4CD98C5
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 14 Jun 2026 14:08:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vZ6sLuNEBwb2pkhd5qu/rn+wBwxOy1DXeVTlXK6rZDU=; b=R/w5ua4Bj5DYJ7W16bm6KqZGmT
	6POeGzcYJMolMEDRqhu9gwxP+XdmSzJzDby2BH1uRYiNg9YXgY9oJVXtpqCoPyKsA1o4RGaP2QFzl
	88vYDPa2/mI7jQ66h0KQYvNFcB2Aeo61q3ypnOueElwi2TRXnuagwxxnGyO2VvOxvIbjTNgK+5ERi
	ozDy8nODrZLbrrKQGKxzQ2l7E/8pwDlUmcUhOf800KBbU0ywNBSn0bM7ReO7n9X51m1hZpKEl1z71
	dGkNdsEDMyaFvi/41Q2jTyXfCTpDGnrxXm6OhKbsnRPIKMbm821m5bAxfXv3ivf3ydplWuL0HBVig
	pM2bTdSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYlVU-0000000D42Y-3qMu;
	Sun, 14 Jun 2026 14:08:12 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYlVS-0000000D42A-3Og8
	for linux-arm-kernel@lists.infradead.org;
	Sun, 14 Jun 2026 14:08:12 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-45ef616daf6so2758593f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 14 Jun 2026 07:08:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781446089; x=1782050889; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vZ6sLuNEBwb2pkhd5qu/rn+wBwxOy1DXeVTlXK6rZDU=;
        b=Q2xH6aNzZLJvO+wZM1s4fKK+zsC6jZQu99czV0o19/7XtG17tUBTc1pVc+j48xcA6A
         Q2h1RSI2yLR7SMeMjgbLLp2fvRKMGX3hc6c5Qdv34yfFXhKG/C2j2Oj+IRDXys67BW/9
         GyvSU47sfaNLPCwKeWzKxYWPfNe2f19yRM4/1g1Wc5rf8KOLCD3iu1yH76YDMxDWDZSF
         XnIpZ+Anr/BtdxsnAlYsaG2ciQkxqXuNR1aZsNx4LiGs5CvkvTo1SOGN2wJGDqvBrJJY
         hSwDx6gZ+0LH+rq5zf/w9oWC/xx7E07O2XppARN+jju0nImqwnFjfJ8HjSHzMTUOkFT+
         Skyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781446089; x=1782050889;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vZ6sLuNEBwb2pkhd5qu/rn+wBwxOy1DXeVTlXK6rZDU=;
        b=ida+iZWR7iTYj/c5cq2Eul/+4bhdvqwDkt8qw5tdsocBYVFuqBi7rypkKq1c89zu6V
         i8Amlxs2CicJ+sjMt20/9huNUF82fWNsupFtgfY778bX6ednA3iSB8UZrF0GUlOaPEst
         m1z8yHzCTrgB4PjS9Q0cT8xX5wXHvQczkLnNfFNPXcbSuSOO3QRJ2UH0QXdkZVkHkebm
         anb3+JWxfDd4ul/pbYKRygKUPo9VK+8dsC4HUJjTzT7wkwtcbC8J08FphzibacVyDkMy
         COX08M2A8LDvHC38mnqUeqK2aXpUSBhS4Pjt2WLDyAOG+bZrbdLhT8mjyrguinoa4KGJ
         Zpgg==
X-Forwarded-Encrypted: i=1; AFNElJ+oGAN8yhS5hEe+iIyU8u9Ljm7i15Zgh1Z5gu4hnLiweE1tU5y/GC2F2uArpsnxk4CdZ0/WWYcgg29JUdW8uysE@lists.infradead.org
X-Gm-Message-State: AOJu0Yy5Il4tdFh+wfdozj/d5qoNOWC1ccoqyEp081qZOcnZ/d8YCgDg
	npRwL7YZnlTxHPKP/NFYEmc/1bqvUKxDt0ASHJfZW2KzhlF/tfLLB18X
X-Gm-Gg: Acq92OFnFJosikdPySyVc6+c769M6gmobikrkK6hgsnHu8bq2TvtZLCeDSvoFinyXi5
	F4B+ZZTSIOxDTNxbFfpQiPuy3n0lG0cjQchVe4RVxp5GQAiYDdldzciN7Lv1VNyFHhdN+K1NvI/
	dnk7ZaOnG0N9S9kfhKR1ghlouPuwfH0bOx14NrGYqpYauMZ5r/qA/2O+Qcfel8J/BhdrviAiqEr
	+mojJtY1Z9B2DySAVKfPrZdOf7W38qBVOSgmUuRjJ3VVWvrZ02OLtb5meFDZay5ssbumKq6AKak
	DFbdXE5Yx6M5c5vjPrxXLifi17M0KxzKg57UBAf6h5sHIBVisGXWVu38X0xeUDGQJuRsHT//vHm
	AIuLGNMB/t3Rf5rbpxmjgmNxDWwAmtDF11fA7MF9W4bQb1c9pHZo58cNOT3pZipagudv6JjKhYQ
	3/e4zMwPjLTauOW5m3kmwk0PCF+rm0ow9LgVpljOPTuzNy
X-Received: by 2002:a05:6000:984:b0:460:3234:293d with SMTP id ffacd0b85a97d-4606dbce8a5mr14655307f8f.40.1781446086390;
        Sun, 14 Jun 2026 07:08:06 -0700 (PDT)
Received: from jernej-laptop.localnet ([188.159.248.16])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4606f26f450sm27152837f8f.10.2026.06.14.07.08.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Jun 2026 07:08:05 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: wens@kernel.org, Krzysztof Kozlowski <krzk@kernel.org>
Cc: samuel@sholland.org, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 mturquette@baylibre.com, sboyd@kernel.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org
Subject: Re: [PATCH v2 7/8] dt-bindings: display: allwinner: Split H616 DE33 layer reg
 space
Date: Sun, 14 Jun 2026 16:08:04 +0200
Message-ID: <nIKN_benRn2Bk8SDZrkMCA@gmail.com>
In-Reply-To: <032c1099-40ab-470e-8cc3-af6d3cad22d4@kernel.org>
References: <20260509190015.79086-1-jernej.skrabec@siol.net>
 <ahNuuaVlDl0KvOSj@home.wens.tw>
 <032c1099-40ab-470e-8cc3-af6d3cad22d4@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260614_070810_867910_1893E9E9 
X-CRM114-Status: GOOD (  29.69  )
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

Dne ponedeljek, 25. maj 2026 ob 14:10:38 Srednjeevropski poletni =C4=8Das j=
e Krzysztof Kozlowski napisal(a):
> On 24/05/2026 23:33, Chen-Yu Tsai wrote:
> > Hi,
> >=20
> > (resent from new email)
> >=20
> > On Thu, May 14, 2026 at 2:04=E2=80=AFPM Krzysztof Kozlowski <krzk@kerne=
l.org> wrote:
> >>
> >> On Sat, May 09, 2026 at 09:00:14PM +0200, Jernej Skrabec wrote:
> >>> From: Jernej Skrabec <jernej.skrabec@gmail.com>
> >>>
> >>> As it turns out, current H616 DE33 binding was written based on
> >>> incomplete understanding of DE33 design. Namely, planes are shared
> >>> resource and not tied to specific mixer, which was the case for previ=
ous
> >>> generations of Display Engine (DE3 and earlier).
> >>>
> >>> This means that current DE33 binding doesn't properly reflect HW and
> >>> using it would mean that second mixer (used for second display output)
> >>> can't be supported.
> >>>
> >>> Remove layer register space, which will be represented with additional
> >>> node, and replace it with phandle, which will point to that new, shar=
ed
> >>> node. That way, all mixers can share same layers.
> >>>
> >>> There is no user of this binding yet, so changes can be made safely,
> >>> without breaking any backward compatibility.
> >>
> >> There is user. git grep gives me:
> >> drivers/gpu/drm/sun4i/sun8i_mixer.c
> >>
> >> which means this is a released ABI. As I understood, the old code was
> >=20
> > We held off on merging the DT changes so that we could rework this.
> > I can't find the actual request though. It was probably over IRC.
> >=20
> >> working fine but just did not support all use cases. Why this cannot be
> >> kept backwards compatible?
> >=20
> > AFAIK the "planes" block is shared between two display mixers. As the
> > commit message explains, this prevents using the second mixer, since
> > only one of them can claim and map the register space. And on the H700
> > (which is the same die as the H616 discussed here but with more exposed
> > interfaces), there could actually be a use case for the second mixer.
>=20
> It explains why you want to make the changes but not why you cannot keep
> it backwards compatible.

I guess it can be backward compatible, but I don't think it makes sense.
Yes, original driver implemented original DT bindings, but there is no node
which uses that binding. If there is no user of that, why would driver
need to support it nevertheless? Supporting only actually used DT binding
allows for better code architecture, as there is no need to support second,
unused path. It also simplifies testing, since developer doesn't need to
test both paths if code is changed in that area.

Best regards,
Jernej

Best regards,
Jernej



