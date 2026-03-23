Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B537F46112
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Mar 2026 13:39:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mFenxA60wLy1Qpftcx3hfC36h9y3OKkvXsaBNW9oRFg=; b=diSq2cbLesbIdrWhiaTZkuHXEk
	PCmF10tjRfXm7h1Q7/8kkI9JUem9oNAzYufzUTqLPX243Vs8zFuurl9QlnFToUt3FVvEN7F6n1z5T
	s0D2tTRUtDTmfEEEaCkAUlRxeEmCKcNecba5n2ZNCKIalaPVUMNSI6zhv7Q1b3hUJ1RYaJO9GVilw
	nfKARLXbN4loq/3RWtArEtgyFwXbGpkm7iD2twQnWyqzhhsPyK2GUQODME7vDxJI9G9Z1TDDCIDSY
	TKmaCDnFZbFEKlDA/FwUb2gd96pwhbx7l+aqWabFy3gn9QX+L86vQ8OiQvwXS9lqi0/d4FtxsgknS
	5Hwem5+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4fVR-0000000GqnS-4C08;
	Mon, 23 Mar 2026 13:39:46 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4fVL-0000000Gqko-0Uk8
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 23 Mar 2026 13:39:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=mFenxA60wLy1Qpftcx3hfC36h9y3OKkvXsaBNW9oRFg=; b=Du8w9V8y2VeJgB5d3tzpPuBrhD
	pVOGEsvLFuR3DS2kmNTdkflAlVgeGuMKs1NUJT716nw2ry6OluW8E+5eZBMOefFSgpgVBLe8zMJen
	yFV6klCrXLV1KywSShju3NG2pxDlxZCgjiyOBGvWsR0eUEx6H0/W+EfBJhvapq8k5cDbHvAUKc1Qw
	XTqGiALlc0Qh4/qxBN/WQkJpAoESuhhJaPBYLL3uTEjBid25XWRDBW/B1XkyyNOjagSpI3tPJBmsS
	hA2+tuNia2GW12HWE7ODXuqSGUFdcGUdTlpxoIx3B54iRc2DJpqVRGaLu+hdhp4poTYqWsMUqiDyv
	+ttwt9Dw==;
Received: from sea.source.kernel.org ([172.234.252.31])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4fVH-00000001d59-2JLj
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Mar 2026 13:39:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id BFACE43931
	for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Mar 2026 13:39:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E724C2BCFA
	for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Mar 2026 13:39:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774273171;
	bh=jkCUIidsz7gwYxrlA4jSqte/TYWbtveVTLHXjkLdtKw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=mx9l142j9/m0UI46OOb+GWAW1pORGNXxaDBuc9v6ZkakFQbzroNLCavqBJqh1RAjm
	 Dw1zr5ANEorif8nAfn1I6Icu+TzvNKp/YRggzNo7Qmrfj1UhhPAFUPMQRJCngTQVET
	 jZNxpVTD6YKXRqCdhLIUvq9UOpXy2K0ETB2nqWl43pSEskVkLJ4m9Yg9oBrFlAZ3Mc
	 EmSQ+/RbbbRdPXRrPv/1N/uhKnWDoiJ7HD7lDQP/I47QDrFGVHLT/6SKfSpD8iyQLg
	 axqzmSdYlSgx330ba43p93g20+p41gV4eI2w4TjX1qWR1392Li/APrPuy76fICRvjv
	 xSDL/C15IkqTA==
Received: by mail-yx1-f50.google.com with SMTP id 956f58d0204a3-649278a69c5so2880214d50.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Mar 2026 06:39:31 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWrsqGp2ZkD/XL68h3DIgiMTeLQaOThvSbnqxsQ81pDgMSLtdevyWG7uUdIToTnG3oyagVupaJ//7/89CySUIXR@lists.infradead.org
X-Gm-Message-State: AOJu0YwoNj5qc6/DUQ6RX8xuQ46bUKmxf19tDpwEqallAiTS8/6u1jqG
	Sb9IWToos50KMlC9njaL9UDUPh5vicGgZIw+eroR0eQ3FoHKkiSDRcOaRVrNniMEyJZlQwR6bc4
	MLfTsx+lNLqABfvq+gB9MjSkIfPtcD9s=
X-Received: by 2002:a53:ee4a:0:b0:64e:8baa:3b09 with SMTP id
 956f58d0204a3-64eaa8245a5mr9789768d50.76.1774273170889; Mon, 23 Mar 2026
 06:39:30 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1774087290.git.dan.carpenter@linaro.org> <CAMRc=McyeeEaagvkoU3MDAof_N_e+f-sVwCDak5Y7F5cQZd-7w@mail.gmail.com>
In-Reply-To: <CAMRc=McyeeEaagvkoU3MDAof_N_e+f-sVwCDak5Y7F5cQZd-7w@mail.gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 23 Mar 2026 14:39:18 +0100
X-Gmail-Original-Message-ID: <CAD++jLnmRHZ+0UFp9EppfmwLf71Qnyq40SNpvweFELdJJKeSYw@mail.gmail.com>
X-Gm-Features: AQROBzCbLfOCkGBtA0I38z2oF7Dbu2aCapqqw5ne1lBSzv9Hd8XJ8sI2hrdw5Zs
Message-ID: <CAD++jLnmRHZ+0UFp9EppfmwLf71Qnyq40SNpvweFELdJJKeSYw@mail.gmail.com>
Subject: Re: [PATCH v5 0/7] gpio: introduce a gpio driver for SCMI
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Dan Carpenter <dan.carpenter@linaro.org>, AKASHI Takahiro <akashi.tkhro@gmail.com>, 
	arm-scmi@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, 
	Cristian Marussi <cristian.marussi@arm.com>, Dan Carpenter <dan.carpenter@linaro.og>, 
	devicetree@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Rob Herring <robh@kernel.org>, 
	Sudeep Holla <sudeep.holla@kernel.org>, Andy Shevchenko <andriy.shevchenko@intel.com>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
	Vincent Guittot <vincent.guittot@linaro.org>, Khaled Ali Ahmed <Khaled.AliAhmed@arm.com>, 
	Michal Simek <michal.simek@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260323_133935_948782_19302916 
X-CRM114-Status: GOOD (  13.97  )
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

On Mon, Mar 23, 2026 at 10:58=E2=80=AFAM Bartosz Golaszewski <brgl@kernel.o=
rg> wrote:
> On Sat, Mar 21, 2026 at 11:13=E2=80=AFAM Dan Carpenter <dan.carpenter@lin=
aro.org> wrote:
> >
> > This basically abandons my earlier attempts and goes back to Takahiro
> > Akashi's driver.  Here is the link to Takahiro's patchset:
> >
> > https://lore.kernel.org/all/20231005025843.508689-1-takahiro.akashi@lin=
aro.org/
> >
> > v5: Addresses Andy's cleanups to the driver.
> >     Adrresses Krzysztof's comments about the dt spec file.
> >     And almost all the subsystem prefixes were wrong.
> >
> > v4: Addressed Andy's comments about kernel-doc
> >     Addressed Rob's comments on the spec file
> >
> > v3: Forward ported Takahiro's patches and added some fixes ups to make
> >     it work on current kernels.
>
> Once ready, how should this go in? Immutable branch in pinctrl and
> final two patches through GPIO tree?

Sounds like a plan, let's do that.

Yours,
Linus Walleij

