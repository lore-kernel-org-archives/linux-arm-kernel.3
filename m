Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D86EC02198
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Feb 2025 21:41:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JYy8fjkDA7iBj98dXF/92fNIUiQwOXz7sUb4p7sUfrQ=; b=WGY+CNGtRNzZsoUKDRV0KMCcpF
	nBa/0CZJ5+nOBYe+oh6oP5mKKz+o0+y08v0wfu1Yw4OW1SgMZEJDHGymL2ghXbhYMyoBtAJk0xqPn
	EiNaDjL1uVEzV3aZiu1eYoD9xiTOaKDfVFqgTlREtTFN9O6BSMLgKJXHpRc6gAlIOH/BehRQTcD9a
	c9kX8h4a4b22ei6h+5oWxJbg+7/1JuTUKix0Oq5r8WKmc4u6nZLbVGaD5WWzhYz8Qn4oTpqNc/4I/
	LeiT7CqhVhbBiVPgnLDaOm4ugTHUsrq36y+QOc55HWIfUNqaM89jTwakbIZRBjJQN0t9tQMlFkNZA
	7iVuG26g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thbWN-00000001Wme-3cFq;
	Mon, 10 Feb 2025 21:40:51 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thaNT-00000001KZj-1wZh
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Feb 2025 20:27:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 383745C5C42;
	Mon, 10 Feb 2025 20:26:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76950C2BCF6;
	Mon, 10 Feb 2025 20:27:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739219254;
	bh=cL+PKhmX30jHbo2cscQxptMC1LXNOM5ta/EiQGb3AxA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=jhVMwDcM9/SfG7eKGrJ0NOuLx75OH78xOzvUpR+PFUGHM8v+dPoeQuEDegreBWCEC
	 ytY3qgn2rLt5QA4dVE1Xiu9e32yq7huQ4DFtL7olXxN6buNmlGeo1bfH5XsSR3+Pww
	 MGbEkDiwKDUIxyT6VwJz5/wjAmC8r6dpHDx1afCb7BDarebp36qgepsjiO+D9xnfR0
	 LJsk1JF2OmG52TgcGkTeN7HcTM2vardQlhBSpFVDy9YMgGsSk/DJYW2pbE+bGsjAWO
	 4ymoWJ3ctbLei7RMhAsVu/lFtCSzoDkXgDhSdNbRINaHNVt0MtEy2Y8dtf3YsCCVu1
	 c5NTpup6CIKBQ==
Date: Mon, 10 Feb 2025 21:27:28 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>
Cc: Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 linux-kernel@vger.kernel.org, "Guilherme G. Piccoli" <gpiccoli@igalia.com>,
 James Clark <james.clark@linaro.org>, Johannes Berg
 <johannes@sipsolutions.net>, Mike Leach <mike.leach@linaro.org>, Suzuki K
 Poulose <suzuki.poulose@arm.com>, Tony Luck <tony.luck@intel.com>,
 bpf@vger.kernel.org, coresight@lists.linaro.org,
 linux-arm-kernel@lists.infradead.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-hardening@vger.kernel.org,
 linux-wireless@vger.kernel.org
Subject: Re: [PATCH 00/27] Improve ABI documentation generation
Message-ID: <20250210212728.64667005@foz.lan>
In-Reply-To: <87h651zm7d.fsf@trenco.lwn.net>
References: <cover.1739182025.git.mchehab+huawei@kernel.org>
	<87h651zm7d.fsf@trenco.lwn.net>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_122735_595004_B3331C81 
X-CRM114-Status: GOOD (  33.77  )
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

Em Mon, 10 Feb 2025 11:30:46 -0700
Jonathan Corbet <corbet@lwn.net> escreveu:

> Mauro Carvalho Chehab <mchehab+huawei@kernel.org> writes:
>=20
> > Hi Jon/Greg,
> >
> > This series replace get_abi.pl with a Python version.
> >
> > I originally started it due to some issues I noticed when searching for
> > ABI symbols. While I could just go ahead and fix the already existing
> > script, I noticed that the script maintainance didn't have much care ov=
er
> > all those years, probably because it is easier to find Python programme=
rs
> > those days.
> >
> > Also, the code is complex and was not using modules or classes and
> > were using lots of global variables.
> >
> > So, I decided to rewrite it in Python. I started with a manual conversi=
on
> > for each function. Yet, to avoid future maintainership issues, I opted =
to
> > divide the main code on three classes, each on a sepaparate file.
> >
> > Just like the original RFC, I opted to keep the Sphinx kernel-abi module
> > on three different phases:
> >
> > - call get_abi.py as an exec file;
> > - import AbiParser on a minimal integration scenario;
> > - cleanup the code to avoid needing to parse line numbers from the text.
> >
> > This way, if something goes wrong, it would be easier to just revert any
> > offending patches, It also provides a better rationale about what each
> > logical change is doing.
> >
> > The initial patches on this series do some preparation work and
> > cleans some ABI symbol bugs that lack ":" delimiter.
> >
> > I opted to place on this series the Sphinx and Python version updates.
> >
> > I still have ~10 patches here with additional cleanups, from the origin=
al
> > series I sent as RFC but let's get the main changes merged first. =20
>=20
> OK, I have applied this set - it seems to work for me, though it does
> lead to some changes in the organization of
> Documentation/admin-guide/abi.html in the output.

Yes. I moved the files part to separate files, as IMHO this would
make easier for people to navigate.
=20
> It would be nice if, eventually, we could put the README link up at the
> top rather than under "ABI file",

Moving its position is not hard: all we need to do is to change abi.rst
file. See the enclosed patch.

> or even just include its contents
> there directly.


>=20
> Anyway, let's see how this goes :)
>=20
> Thanks,
>=20
> jon

Thanks,
Mauro

=46rom e1b864d1d333d94430420d1d6fc15ea7d8a99b4b Mon Sep 17 00:00:00 2001
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Date: Mon, 10 Feb 2025 21:24:06 +0100
Subject: [PATCH] docs: ABI: move README contents to the top

The ABI documentation looks a little bit better if it starts
with the contents of the README is placed at the beginning.

Suggested-by: Jonathan Corbet <corbet@lwn.net>
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

diff --git a/Documentation/admin-guide/abi-readme-file.rst b/Documentation/=
admin-guide/abi-readme-file.rst
deleted file mode 100644
index 6172e4ccbda2..000000000000
--- a/Documentation/admin-guide/abi-readme-file.rst
+++ /dev/null
@@ -1,6 +0,0 @@
-.. SPDX-License-Identifier: GPL-2.0
-
-ABI README
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
-
-.. kernel-abi:: README
diff --git a/Documentation/admin-guide/abi.rst b/Documentation/admin-guide/=
abi.rst
index 15a2dcb1388c..2067336353ae 100644
--- a/Documentation/admin-guide/abi.rst
+++ b/Documentation/admin-guide/abi.rst
@@ -4,6 +4,11 @@
 Linux ABI description
 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
=20
+ABI README
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+
+.. kernel-abi:: README
+
 ABI symbols
 -----------
=20
@@ -21,7 +26,6 @@ ABI files
 .. toctree::
    :maxdepth: 2
=20
-   abi-readme-file
    abi-stable-files
    abi-testing-files
    abi-obsolete-files


