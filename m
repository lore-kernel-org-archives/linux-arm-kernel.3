Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E457CC5DF7D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Aug 2026 02:47:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=reG8oCx7W3u/gQWcPdLL2+Oqbj7dXw9wfH6tZtX6cpc=; b=P0QGzF4EGdyj/F9wQOVyepiNPE
	wjjFYAPUcV3spjCpS3aZqoppzCFNlajGRsPKZp4H35awTP6OkffBy7OP/cuHCDSdu63t8G6xvYZPZ
	reHeQSi6odVLSRpBjto0hxjFwNt4z2/63y4wJ+nzXAxqdGFN6SG76AG25mlAmssdb1bLx+PldBcpI
	gXEY0slZ3w0kdiPLTS9dW9Zcw4+L9jw2L3Eq2LJKzlsdSDPV4XscZb8BPyz56UiWyan0K1gyaJkNr
	YmA/L2/T1rUXge5TZhTwhaHWdwyEfyarcl0odaiZD3+iLVHuLmMLUq2kgz0RHu8YanpKdQrpjiGq5
	MuADcQAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwWKq-00000008u9O-3MDg;
	Wed, 19 Aug 2026 02:47:24 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwWKm-00000008u8y-47z6
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Aug 2026 02:47:23 +0000
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-c2055573c8cso78162366b.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Aug 2026 19:47:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1787107638; x=1787712438; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=reG8oCx7W3u/gQWcPdLL2+Oqbj7dXw9wfH6tZtX6cpc=;
        b=PM9Stw5n0/6VZWeQ8bVxvEELedpCK1fMA5un9p0Zkv9SNmgaRj3Dxdi8tpUgo1jrZo
         Y+7kOKf70BcgXHC7D10Yas50dc2uz6/j4ozHLq7YWl87SpDTlIRKJelEVA1RSJfcKtCU
         jB96nNHg7JOXDrYpAxKsZbzWw4blHg6FFOqFE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787107638; x=1787712438;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=reG8oCx7W3u/gQWcPdLL2+Oqbj7dXw9wfH6tZtX6cpc=;
        b=iheGFEsqIZYE0fFOkk5pgG2U8FNSsGGHA6jYdyFOTc2GK2lgeSA78q2uM9lhu0SHz5
         xkJ4xpUed+Z7x76CI614u7tlhX0CbaanwJPRdnTb6zNjW3Z+n3FOwY6dG51esataIa7+
         feY6Okpa2Mdoiev6BWiy9xnqW38zLPHqgce6NPCU88loT8dtS6Iu9habBTJ6523ypHJp
         t6TS4nB9vlBgC5h6B/8l+V8ekr4mwBnwbFT1kQQokPwgvZFIi+5PMRVvAHvtc7/s44Aj
         cWKtaAYR9YyRvnXp7sUHhxqBQ1fFDC0c82JW7+Av3vVbLejULnHF6rMvwTYQNNTtXTKU
         2OBw==
X-Forwarded-Encrypted: i=1; AHgh+Rp8t7XeJUzaRiXcyhYEVy7EhNZMxDleapbIQE/IxLmDao/6FpvGdI3jPQbuDWh2fr66ydG6hCeE57z7zl586b0u@lists.infradead.org
X-Gm-Message-State: AOJu0YxELtXekBMcyNH+BZ/Ou+3FC+8k+qcZywiOSGCiefZXabcabgUM
	xzjcgZXFkyPvF+oHLXh7jNaoan2QN2Sgf2vUIY+UFL7YdPSlyIsqCk4malEt2LAJdPTbrEw9Q+J
	MiVYyoC0=
X-Gm-Gg: AR+sD11tLvktx/zHu+ktaM69SB3hGdB5sXASS5TeLAzTKxQMDjHWAi6EpmLVJd/bTI7
	c5SO0BOWE5FwUNBXy7YkRRm6H083nBNEbhBO+wLGy3MrScxav3BIZ+a518ncxow24q8roExj6lc
	ym/k1pi6M0mQfv/xHo+FUUPA76jpXA8xLQz8Qw4a4YpnbhArxNvSEGkBnPjKwBRDS7FL95cX8Wc
	jmv4ycbv21c9k4nqnNtIt5K2Mbyg3rbMBDpO6vBlzZIBwXAwcZCtkXUlMOME84qqOdihv85RdIM
	acBDMNmiClTq+/8xVqcPz7D3lbyAuIvwhxC9l/f/Q7Wsxg8z298s2d2X32HbRAtAsCCI8f9Kw96
	E2NzETKDBgeP/PhioAxsodWiepc8HQegRFP1rRAQOVGphRDeTiiIReD+IRAkxnzRmUV4C6JAjom
	pvOLGmibO6DUa3S14ohVdpMB3z/1tODYZSsF3MULkqlBolckAj+tM0IoABCP+jDEUCGCDbCJFKh
	Mm3jW7Us6lqwTL6TR7svkG8EeTduqqCCRKiuA==
X-Received: by 2002:a17:907:9343:b0:c20:fda7:1856 with SMTP id a640c23a62f3a-c23e86de279mr67398266b.8.1787107625971;
        Tue, 18 Aug 2026 19:47:05 -0700 (PDT)
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com. [209.85.218.53])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c243c38af97sm15878866b.49.2026.08.18.19.47.05
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Aug 2026 19:47:05 -0700 (PDT)
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-c15d111ca99so53382566b.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Aug 2026 19:47:05 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rq90vSAUXR4BL+tfXv/RnPzu98Rbh4qS0bsNKSJtGK51+wa2tN7kaNIeCrpSkLGUJeZ/REQtFzeX9ZqcR/YF+Ng@lists.infradead.org
X-Received: by 2002:a17:907:a643:b0:c21:7f24:968e with SMTP id
 a640c23a62f3a-c23e87191camr63000666b.11.1787107623525; Tue, 18 Aug 2026
 19:47:03 -0700 (PDT)
MIME-Version: 1.0
References: <8329f199-9208-4963-b745-089610400b3b@app.fastmail.com>
In-Reply-To: <8329f199-9208-4963-b745-089610400b3b@app.fastmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 18 Aug 2026 19:46:47 -0700
X-Gmail-Original-Message-ID: <CAHk-=wh8khg-Odf9cg2jWe1jvSviTwGgKG9vUDzYNdMzgmxDhQ@mail.gmail.com>
X-Gm-Features: AcwNN1U5hCSOqELF1dgLrDX5FQMlkygk01pcrVdlrkThrmFuHxD18e8gcqt9Rlo
Message-ID: <CAHk-=wh8khg-Odf9cg2jWe1jvSviTwGgKG9vUDzYNdMzgmxDhQ@mail.gmail.com>
Subject: Re: [GIT PULL 2/4] soc: drivers for 7.3
To: Arnd Bergmann <arnd@arndb.de>
Cc: soc@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260818_194722_327055_2BBE7074 
X-CRM114-Status: GOOD (  13.05  )
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

On Tue, 18 Aug 2026 at 14:17, Arnd Bergmann <arnd@arndb.de> wrote:
>
>  .mailmap                                           |    6 +-
>  Documentation/ABI/testing/debugfs-vfio             |   26 +
>  .../ABI/testing/sysfs-bus-pci-drivers-xhci_hcd     |    2 +-
[...]
>  tools/virtio/linux/mod_devicetable.h               |   14 +
>  tools/virtio/linux/virtio_features.h               |   79 ++
>  2565 files changed, 15693 insertions(+), 8154 deletions(-)

Well, that diffstat was just garbage.  The real one looks something like this:

   121 files changed, 4566 insertions(+), 1492 deletions(-)

and actually mentions files that make sense.

This garbage diffstat is normal when you have multiple merge bases -
git will pick the first one it finds as the base for the diff, and the
diff will then contain random other contents that came from entirely
different trees.

But the fact that you have multiple merge bases also means that you
know how to merge with git, and so typically a quality pull request
would involve doing a pre-merge test in order to get the proper "this
is the diffstat you will see after a merge".

I don't actually require that kind of better pull request, but it
would make your PRs look nicer.

Hint hint,

           Linus

