Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAC89C5DF81
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Aug 2026 23:48:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=faVdfbMyKRC0yZz7duQHLz6OqzYJS783yM+QPhqaBsQ=; b=qO28I9gxyc9Zk1Walhiojv2hQO
	xg0MJeznOtziEkYKuVun2BEAGt70n4jAjce0S49sZVmajexTe1fsWVJy88ZEN6DcreJKo8Ejv4oC6
	4UtDmp9MOlS5eQHNRjF5CxG6EEbf8bvJrfXTLmjKy3gM//rzQgTE+M59KxhdBlY7rmTzFjN/xWt6Y
	3pRaFgKIcnoD9psubrKkm7VJ+czg4HEWumbU+bWmzPQLm/LPbciO7iDz0ggNjHaK+CqTe6rc4HsTY
	Xf5kEZaWGLY3iEE8VQInJQqbic1MxcmFmIm+AX4ocOiTCLTttYBrYqFwtg056N+n24baABDb0Vzu+
	x6V6VoNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxCUf-0000000CMoe-0P1S;
	Thu, 20 Aug 2026 23:48:21 +0000
Received: from mail-yw1-x1131.google.com ([2607:f8b0:4864:20::1131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxCUc-0000000CMo7-38p1
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Aug 2026 23:48:19 +0000
Received: by mail-yw1-x1131.google.com with SMTP id 00721157ae682-81ff017d420so23589607b3.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 20 Aug 2026 16:48:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1787269697; x=1787874497; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=faVdfbMyKRC0yZz7duQHLz6OqzYJS783yM+QPhqaBsQ=;
        b=V13xlfywjaa+4h9v4726FFAj5lSub2d5YYgkx/cFM0OU7VHrnCTctlP2csbdSdnIli
         uZwt3YlYI7YcpP61ln53bd1fMcdMg8xtlMTQRREt0tFosqoVi+LVy9qRHDS/H/BYyQ+Z
         tMiOXMUpJvrUTi3zJLumBRTo2uPe+kCG0zmm4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787269697; x=1787874497;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=faVdfbMyKRC0yZz7duQHLz6OqzYJS783yM+QPhqaBsQ=;
        b=eq6Wg/qugp+BsP04XidZWpi8H+M6gBo1aBV8bOpetBnV/Sf138STHuTu5VSMUkJG6T
         J5GsRtVxX2Q4vJ/g/gad2IeDsf4k7oHqMlXPxoxYdjOseYe/vNFMwNAeQcLLR8OHSf/e
         +ff4rurNH5RCzCWe6I5MPP4Zz2w8HibOsFOGVG2Z35kP6PODfGquKUZUG2jwZa6ZJVKA
         Kv2XZDzCPyVHhj7D2isrUC6DQmNlik33QBynbvrJO5NG46pNAj3vJnF2PE9klOsnbX/E
         ANY1+Vb9gpoUNL8gJ0U4UGdLUmIGdD/8kQUhvT7KmbdbrE2PK+4mb31ci4pZ44d60D5P
         nTEA==
X-Forwarded-Encrypted: i=1; AHgh+RqhqiA+gZ1CG9i/Vz+yp4eK2qdRVVlWDL5KSSafglq0JyC/SrFiL29SEx4SYGK2RcpOMe4zFCKM1tRGcaOKBhYw@lists.infradead.org
X-Gm-Message-State: AFuF++kX4rSHgkX22xzqlWTV9c6G6uOI2L0y0mthtgBDheU1kiYKRQ0z
	RReeIWnZwNjFvwcMZd8w4H0VczpnQHs0it+k19nLbjMAp+BroCGZySbxWQl6j830i+fqOd+UHDJ
	D5ro=
X-Gm-Gg: AR+sD10To1HjhW9+PO4906Dq1yQGgfm0R8JlaJU0OwXKB+z6iUxph075VKdjdO9RbYn
	HPJtbITGd9k/dKpRZh6XpQVsYOkST7eSXKncnIhTykUdJoORFw0vUP7TrwpeDZtnV2KLkW4Jr6d
	dFyvepjrel9mhHQ9unjV2NWNHejs3sW63iSuu4kF4epxqR+lQxQT5meQzk1l6v2PQtkqDXtRuGF
	SaYdD3wtq/Jh+xMrn2OT1dVgGNg9a48g81cVK+Dw2P+cKo+cmZL2m04a4RImgfZ6TzJ8D0nbj9w
	U6asCKyj/sTtQ6+PMT235pMv1gfGj0w2UzCmrFqXsILW545FGK6G+TrO6MmNzTk/S4+A0CrllX8
	ZXmsFpDJxmk79Ouwii+VZLeQJ9MP1eKjUy3MsU51qXQkWWR4n78bLxn/8S81ou1dv73wmKcTBUe
	Os6w/s5/Zm7davSURfaq1qxKMDN9EjtgJh/oMPUJcRctrwAoG8bh8iBSHthhQyg4vUqb+smiOPo
	hbOg2UrcG5o5EEaWRArRtvdMmvm5d3gCqXm7g==
X-Received: by 2002:a05:690c:b96:b0:82d:8dc0:9cf with SMTP id 00721157ae682-8470c1665aemr46575247b3.13.1787269697359;
        Thu, 20 Aug 2026 16:48:17 -0700 (PDT)
Received: from mail-yx1-f45.google.com (mail-yx1-f45.google.com. [74.125.224.45])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-845186c0dacsm33058047b3.36.2026.08.20.16.48.16
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Aug 2026 16:48:17 -0700 (PDT)
Received: by mail-yx1-f45.google.com with SMTP id 956f58d0204a3-66c7a743cf8so517791d50.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 20 Aug 2026 16:48:16 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RpD2RdV8qZitBDQNrKYXpG0GtAAt1BYFV0Oh2skuJa85jo5Q2o58ZE9SLaa7JRX7OH4lrA/EWDkjWA3+2DPagYN@lists.infradead.org
X-Received: by 2002:a05:6102:3032:b0:747:560c:e7e0 with SMTP id
 ada2fe7eead31-778f05babd5mr1953525137.1.1787269272014; Thu, 20 Aug 2026
 16:41:12 -0700 (PDT)
MIME-Version: 1.0
References: <20260722-contrib-pg-pixel10-initial-dts-v2-0-3abae9717feb@linaro.org>
 <20260722-contrib-pg-pixel10-initial-dts-v2-4-3abae9717feb@linaro.org>
 <20260724-dancing-skunk-of-novelty-72c1b8@quoll> <CAD=FV=U0HUdjPcg+5Vx8_ag0zLd3CZx5w5SFr38p+YwRnC_G6w@mail.gmail.com>
 <CAD=FV=V2+D1m5L-0d81W3E_ih2us-SrddeBUAJtMybpQons7Ww@mail.gmail.com>
 <c0657108-1958-4c4c-b5f5-0eb24e81b2b4@kernel.org> <CAD=FV=VY4AeAf=TMZfJYRo6C0iSqmL-P0GzxRvZHfnNsf+GnYQ@mail.gmail.com>
 <56db332f-a18e-4a9e-be9d-67d2e25c3666@kernel.org>
In-Reply-To: <56db332f-a18e-4a9e-be9d-67d2e25c3666@kernel.org>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 20 Aug 2026 16:40:58 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WUMKGRUbAyd7XFFc-NGoJEKRwu4MaUnEQUDB9Mq6YYXA@mail.gmail.com>
X-Gm-Features: AcwNN1XRfcu1Y9Mu4rBPOaQuheZikf-15PdNleMMKujFPqm2AwjeBRozlHD45_0
Message-ID: <CAD=FV=WUMKGRUbAyd7XFFc-NGoJEKRwu4MaUnEQUDB9Mq6YYXA@mail.gmail.com>
Subject: Re: [PATCH v2 4/5] arm64: dts: google: Add initial dts for frankel/blazer/mustang
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor@kernel.org>, 
	Peter Griffin <peter.griffin@linaro.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Jiri Slaby <jirislaby@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Linus Walleij <linusw@kernel.org>, 
	Drew Fustini <fustini@kernel.org>, Kees Cook <kees@kernel.org>, Tony Luck <tony.luck@intel.com>, 
	"Guilherme G. Piccoli" <gpiccoli@igalia.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-serial@vger.kernel.org, 
	soc@lists.linux.dev, Juan Yescas <jyescas@google.com>, RD Babiera <rdbabiera@google.com>, 
	Brian Norris <briannorris@google.com>, William McVicker <willmcvicker@google.com>, 
	kernel-team@android.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260820_164818_857928_619F6774 
X-CRM114-Status: GOOD (  35.59  )
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

Hi,

On Wed, Aug 19, 2026 at 11:03=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.o=
rg> wrote:
>
> > I'm happy to document. Can you please point to how / where I would
>
> Description of:
> Documentation/devicetree/bindings/ufs/ufs-common.yaml

Got it.

If you tell me that the patch won't be instantly NAKed I'd be happy to
post an addition to this file saying:

If this UFS controller has a well-known ID <N>, a "ufsN" alias may be
created in the "aliases" node. If this UFS controller is a singleton
(no other UFS controllers in the system), a "ufs0" alias may be
created in the "aliases" node.


> And obviously, as with every binding/ABI, you also need open-source,
> upstream user of this.

As I understand it, this isn't truly policy. I know DT folks often
want to look at an open-source driver to ensure the hardware is
described correctly. I also know that a badly written but
"open-source" driver doesn't justify landing your bindings. ...but in
this case, it doesn't feel like there is any complexity understanding
what's going on.


> > document this? As far as I can tell, no aliases are documented today,
>
> git grep disagrees with you, e.g. second paragraph of serial.yaml.

Ah, I see! I was looking for something more formal. Something like a
list of allowed aliases or something that would automatically validate
which aliases are permitted. You're just saying to document this in
prose.

Thank you for clarifying. I didn't understand this based on your
previous emails.


> > I think I've presened my problem fairly concretely [1]. If you hate
>
> There is no description of the problem at [1], except "bootloader adds
> the same type of calibration data".
>
> So I repeat my questions: to every UFS node? To every node? To one UFS
> node (but how do you guarantee that?)?

I'm sure it's not what you want to hear, but I guess my answer would
be "for these boards".

In my opinion, this would be fine as an ABI contract between the
device trees intended to run on Pixel 10 phones and the Pixel 10
bootloader. While I'm still of the opinion that people should be
allowed to include UFS aliases in general and it would be handy if
that affected the "dev/ufsN" node created in Linux, I know that's not
a popular opinion among DT maintainers. If upstream would allow a less
"generic" sounding alias "google,ufs =3D <&xyz>" I could do that, but I
doubt that would make you any happier.


> I gave you two solutions, depending on actual upstream need of this. If
> you have the second case - so not the boot device - then you basically
> want to re-implement overlays which you cannot. Use overlays, which
> gives you nice stable and build-time verifiable label/phandle.

I'm not quite clear on the "overlay" suggestion here. You're saying
that we should require the base device tree to be compiled with "-@"?
...and not because we necessarily have any overlays upstream, but
because the bootloader will generate an overlay dynamically? Compiling
with "-@" would mean we could give a "ufs:" label to the UFS node and
with "-@" that would be preserved. The bootloader could then use the
"ufs:" label to find the node. When compiling with "-@", the exposed
labels are essentially ABI. Did I get that right?

That's a pretty neat idea. If you confirm that's what you mean, I can
see about implementing it. It would also be nice if you could confirm
that this was an OK thing to do even though the bootloader is
closed-source.

We'd obviously want a comment in the device tree itself indicating
that the "ufs:" label is consumed by the bootloader so it doesn't get
removed.


-Doug

