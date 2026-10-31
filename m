Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9030A606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 31 Oct 2026 03:10:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=GfRNnqB8;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=BahkBwvE
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=rSQVuufJqG4DagM4PmCmZM1z/EqJK6JLyOoiv3ybUJs=; b=GfRNnqB8m5dIZI
	IHWZ/WeyfN34E81SCgI9zysfBE/6upc3ADlT1+nMb4lf3fTA0CU3hnpV9qFahtdzsPbptf/991naa
	afkV5hhL0OK1OMsvSUkEMmkufvI6LS4LO9d4TYPxTKaPA7UC20EE1YOqy17XuocGOq7JxNui8YqaL
	IybhKBCmw2pOFV0yz87zHU7RnTTrl2pI41NjBvx7Lx83VIg7CDJ9fFdMxDlOr5Rku9ii7wf02B6IQ
	OUAGdpHsJePUsANJJHaIsLrUofTJnMNJkJQefzWpebcDfiJGf+pdOeJO26dUJEo1wNEuFV7DBFNf6
	2tr4xNHMadPUQFwQ4RSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMzUC-0000000CuCC-2HMF;
	Sat, 31 Oct 2026 03:10:28 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMzUA-0000000CuBr-18PP
	for linux-arm-kernel@lists.infradead.org;
	Sat, 31 Oct 2026 03:10:27 +0000
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-c49c32650adso165167966b.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 30 Oct 2026 20:10:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793416224; x=1794021024; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rSQVuufJqG4DagM4PmCmZM1z/EqJK6JLyOoiv3ybUJs=;
        b=BahkBwvECo2AeOpwcBlXD32amFtS8rRDX5B834lYC4oHCdr/QieD30Zb7zDa6f8mw3
         /PSJEeSNyXZ5ktcsa1uVCJCmCGFYj+IgLuOB0k8eFryDqZlxkI6RqIm2gAtNuOjnpIEJ
         urU6FiyAhaWim4KqB2D2QN1Xx32ONC079MubM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793416224; x=1794021024;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rSQVuufJqG4DagM4PmCmZM1z/EqJK6JLyOoiv3ybUJs=;
        b=NM/yCglleD7zODkfUDBHslq24rqidOjPyO/kqKYgWO9wdoVCV0WLeVUHBLt/bidMZy
         j4f/bqdofQSBuvz98p4qcyhmpfam1Nm6Dg3h17x5MfyoxofY588kPJLjBPdx9Rv5eg3w
         Opd4mk1GUIG0sDQ/b5oAq5dZfxeY1+m4yJRxAvwnyXxQDnsBWWIfJiq+h6VCEzueTijl
         p3pCZTI//S0ONUVSRzpEh5MF5PEyw2g4mYcMExuuXFQ4rL1Vyq7MXgqCG69JVSeXXVpV
         J/iN3tsoxUcqq0mAPFxrp+FF5VZn9z1yEaDS27IXy8zy6izC1rUQOZ9RhefKFqUz31ak
         CSBA==
X-Forwarded-Encrypted: i=1; AKwUvBxdqtp4HgN9llb6gMaJ9XfHLLbAFo56xEupSrFmjt0ScoAsJoyN4qAeNU0AyZn1qcEIIGSxsFmJqfz4usIpgXdN@lists.infradead.org
X-Gm-Message-State: AFq9FYLQk1//DQvZyw/YCV70c5vDmvzeSoSaBp9SmFkbOk476YCJi96+
	4W+thmgagD1IUMYtkcMwFfF2pk7x59RrVDBlI4ffo032gdVC8ZernmxSxrndkjRLhTQIrB+JdA8
	I1Gx3hUPz
X-Gm-Gg: AYBFou3gHyab6RaTITIK5h9ycXnVRz+Uv6JFZHvM+uOFCntVAPx5JjO/0+CPKiRs/o6
	nrIXQmCruM9aI58rRs4ADo679fpy8jPnADkTv/ihhvk4ujNWKASSJR4qjKjzq3WwzYnK2pQokW6
	iJIAXJZOee3Y2ElIp44sCt9ObttDB32nLS0s+2adMaArFRD7MFHTiSFd+4LK/b2d0arVpGqdFCf
	M/qCVQTkJmdCTPUIueuTcGaTAqcsrnyP7v/MCFwOhxt2NhCRsdOYu3Un/1ZHOn/I90PjIX6KKPD
	bz4Rs6mrj26wIS+p1DePhJpEakoClTxDAnDnA090zb57zsczUn/CeEc10k0hj7krUsq5e+0jdnr
	pMWDhuq1eQNDjQCo4cXDH2BT8CTnlPhtTTSqT3RszqU0Hq7I6Z8auKNMrf4etqVafiV15Zq3MMv
	6aX/OjyJJvuzvK5fYRoxPfnRWO0rZPBGEbKiI0QyhFKgZBq+d3XEQmS7HZLr6M4XpkTwepgLIQc
	OxwW8o5hXbqi1x6ibOMS5USGh/z2gx7sfntTcNJY+tsdHKr2QpGfaTrtYhRseOZ3dhP+cY63XU6
	+untMSdDuk+bcyA7f9lH37Bc3wbF9OnqGh7DtKoq2pMCfcRvzDL4Gcq3Uco5HpqPPVt9
X-Received: by 2002:a17:907:80d:b0:c41:26b8:c49c with SMTP id a640c23a62f3a-c4ca7aefa45mr345089166b.10.1793416224249;
        Fri, 30 Oct 2026 20:10:24 -0700 (PDT)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com. [209.85.221.51])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4cabe8f9bbsm132738166b.67.2026.10.30.20.10.21
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Oct 2026 20:10:23 -0700 (PDT)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-48e0d885929so1070881f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 30 Oct 2026 20:10:21 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxTvm73E9+ZbXbawtEeuphxGtXIyd/R1M3rUSNMtc5IReG0FMrdnzJPFH9ZuWb0NPeMKAsHnMhzuAhZQiAESHGA@lists.infradead.org
X-Received: by 2002:a5d:5f84:0:b0:48d:eec6:308b with SMTP id
 ffacd0b85a97d-48e6e4f561bmr9818154f8f.21.1793416220997; Fri, 30 Oct 2026
 20:10:20 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261020153652.2907186-1-dianders@chromium.org>
 <CAFLszTgzpQ-donjjtcPwy5T3pfWg_u83QMh0GcdpY2JCq_s75w@mail.gmail.com> <CAD=FV=Vt6hgGJuYtv1_mBSQztWQBjmDN9CwLtVxrXcyECGx2-A@mail.gmail.com>
In-Reply-To: <CAD=FV=Vt6hgGJuYtv1_mBSQztWQBjmDN9CwLtVxrXcyECGx2-A@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 30 Oct 2026 20:10:09 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Xxn75bf6ZjRPyQ5jfWwxx9cPe8_8bV6qzAXQc+gckB-A@mail.gmail.com>
X-Gm-Features: AclHuK-bghq4wzz1qNlwlR04GGQ-u_3zjoGTgsEW-iZ0A7dRvqdHdSoL4JcYqzo
Message-ID: <CAD=FV=Xxn75bf6ZjRPyQ5jfWwxx9cPe8_8bV6qzAXQc+gckB-A@mail.gmail.com>
Subject: Re: [RFC PATCH 0/7] arm64: Add fit images for sc7180-trogdor and google,lga
To: Simon Glass <sjg@chromium.org>
Cc: Devicetree-compiler@vger.kernel.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, linux-kbuild@vger.kernel.org, 
	Brian Norris <briannorris@chromium.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Chen-Yu Tsai <wenst@chromium.org>, linux-arm-msm@vger.kernel.org, 
	Nicolas Schier <nsc@kernel.org>, Peter Griffin <peter.griffin@linaro.org>, 
	Nathan Chancellor <nathan@kernel.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, Devicetree@vger.kernel.org, 
	Julius Werner <jwerner@chromium.org>, Saravana Kannan <saravanak@kernel.org>, 
	Will Deacon <will@kernel.org>, Michal Simek <michal.simek@amd.com>, 
	=?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Alice Ryhl <aliceryhl@google.com>, Andrew Jones <andrew.jones@linux.dev>, 
	Bjorn Andersson <andersson@kernel.org>, Breno Leitao <leitao@debian.org>, 
	David Sterba <dsterba@suse.com>, Gary Guo <gary@garyguo.net>, 
	Josh Poimboeuf <jpoimboe@kernel.org>, Luis Augenstein <luis.augenstein@tngtech.com>, 
	Marco Elver <elver@google.com>, Mark Rutland <mark.rutland@arm.com>, 
	Masahiro Yamada <masahiroy@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, Nick Terrell <terrelln@fb.com>, 
	"Peter Zijlstra (Intel)" <peterz@infradead.org>, Rong Xu <xur@google.com>, 
	=?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>, 
	cros-qcom-dts-watchers@chromium.org, linux-samsung-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261030_201026_377645_3BAFA31F 
X-CRM114-Status: GOOD (  27.85  )
X-Spam-Score: -2.1 (--)
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
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,T_PDS_OTHER_BAD_TLD autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi,

On Fri, Oct 30, 2026 at 6:09=E2=80=AFPM Doug Anderson <dianders@chromium.or=
g> wrote:
>
> > The FIT_ITS path is a second way to build image.fit alongside
> > make_fit.py, and much of it repeats what make_fit.py already does: it
> > puts the root compatible from each DTB into the configuration and
> > compresses the DTBs. The series adds fdtget/fdtput, sed parsing of
> > /incbin/ paths and a shell loop in Makefile.lib to do the same for a
> > hand-written .its file, and the .its files repeat the DTB lists from
> > the Makefiles.
> >
> > Have you thought about extending make_fit.py to take the per-board
> > metadata (e.g. from a small file next to the DTs, or via
> > FIT_EXTRA_ARGS) and to run fdtfactor itself? That would avoid the
> > in-tree fdtget/fdtput, the mkimage dependency and most of the Makefile
> > logic, and trogdor would come almost for free.
>
> I certainly can do that if that's what people want. ...and, yes, I
> think it would simplify some stuff in this patch series. The
> question is: what does it look like? Is it a file that is a list
> of devicetrees along with descriptions? The list of devicetrees
> would be to limit which devicetrees are built into the FIT
> and then each would have a description. ...and yes, that would mean
> it would need to be updated in parallel with the Makefile, but I
> don't see a significantly better way to do it. Yeah, I guess that
> could work OK.
>
> If so, I think a bunch of the patches in this series will be
> dropped or look very different. I probably won't directly reply
> to your comments on patch 2, 4, 6, and 7 if we go this way.
>
> Should I give it a shot for v2?

FWIW, I did a quick prototype of this, and it is definitely a much
smaller / less invasive patch series. I've got
"sc7180-trogdor.fitconfig" and "lga.fitconfig" files. Because they are
easy to parse in python, they're in ".ini" format in my prototype. So
"lga.fitconfig" looks like this:

+# SPDX-License-Identifier: GPL-2.0 OR BSD-3-Clause
+#
+# Each configuration description encodes board and SoC matching metadata
+# for downstream packaging tools in the format:
+#   "<Model> (<key>=3D<value>,...)"
+# where <key> includes board_id, board_rev, soc_id, and soc_rev with
+# hexadecimal <value>s (in any key order).
+
+[lga-blazer.dtb]
+description =3D Blazer
(board_id=3D0x070406,board_rev=3D0x010000,soc_id=3D0x0005,soc_rev=3D0x01000=
0)
+
+[lga-frankel.dtb]
+description =3D Frankel
(board_id=3D0x070306,board_rev=3D0x010000,soc_id=3D0x0005,soc_rev=3D0x01000=
0)
+
+[lga-mustang.dtb]
+description =3D Mustang
(board_id=3D0x070506,board_rev=3D0x010000,soc_id=3D0x0005,soc_rev=3D0x01000=
0)


Happy to post a v2 RFC showing what that looks like if you want...

