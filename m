Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 958BB606A31B
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 04:54:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=aIB+bmmX;
	dkim=fail reason="signature verification failed" (4096-bit key, unprotected) header.d=alien8.de header.i=@alien8.de header.a=rsa-sha256 header.s=alien8 header.b=ZAa4Q1Y8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=ZDNxzWK7YpZlxTsXfg5V1qkMa52zlYAF5ggUQoqT++c=; b=aIB+bmmX8mAtk6
	I1BowUMhqGdisOoiWnUEPRUDo5YrlMh5T61uJXWb185vBkHgW0ZobwnmWf5g9Py6R2OmJ+rWHm7Qi
	kjn4P/SjN7/5P5Jb8vllfcwDLoOYuqFl2JqGegZCtH7p3jrw4NsseVumkYbH2ymevqkDImHSXC7yb
	MNLSv4YO4uP1rHNKHApTOpXJALrFpJhVfGG7NokrWC8A/85v/QugzUMEuNBdEZbm3E/I3iBQmzVR3
	Gl98g1ii016mx//9Brp2/3FYY3VkK3fFWx155KV9p9omB12uYX8NEmtC8qvTCZV6E3LhdI/azkNWf
	11VofogS1LuNuNuhNrzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOpU3-00000007pGj-2mAK;
	Thu, 05 Nov 2026 04:53:55 +0000
Received: from mail.alien8.de ([65.109.113.108])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOpU0-00000007pFk-0jvY;
	Thu, 05 Nov 2026 04:53:54 +0000
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 292CF40E0184;
	Thu,  5 Nov 2026 04:53:42 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=fail (4096-bit key)
	reason="fail (body has been altered)" header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id 3_rAxhbUVBXB; Thu,  5 Nov 2026 04:53:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1793854419; bh=nrGcHTqOtpGTvsPDx/bmdCPRbhy65nSxqLA3PtWK+ls=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZAa4Q1Y8uQOXS99gQyK/P+nRvFObN5CmOSyDOcaLr6q1SB8IU/8HE3M6sZ4VuZJ4B
	 73VVrzRHKqbpbY/X431R7SgZQedtdjQZwk/3UftOatv7Uofdon0kp8b+Rhh/U1yGVB
	 EEvngoxgPANcXZByYcr53QyfmdgVxO9RNVaWYB6Q4EotX1ROx5/CoQSjixD12k9WYn
	 mCWXFSGsv/cUAWZ9MeprBYbaAwEI5TEDJFw9POJxJGEKJzwwf996qYNsc0hTwnMvE4
	 ru72pCqArlOUIBNN5kzpH/0sNMYnqzf9JTX/C6e6GkVWACV9HwvFVj6gp+6bPjOnYW
	 mJlsoc6ajm9xpZinAyjjNE5Hi/ym02fvHms3yU1WDzJhJmh7gxYjQpwbVr1qqocNiD
	 SKARca8kHjOBQkVdoyrMW0mEx6sOPk09mvZkVd7oiVTP1RNQQN/XLV8ezEZCZDqECq
	 m4XujHyiwZ71dCL75nSJenlHOlMZIGj7zVWyprgk/ZzP4XzfovI0RunDXuvbGOEJKe
	 1g80Wn7noaqHuR/UeifpTFad0i1om4GoxFdsKlxWhPHrzR967Q9oebORecZvBu7VCa
	 JbzJet6ww2paUI8ZSqg1IznlG1sk1Lw2eR7zoaoJNoaZrJj1kOsgFWjLqd3FHoWj2f
	 6pD0KqNRAexvx6Gz9rCr2VLA=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::42])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 52B6C40E0140;
	Thu,  5 Nov 2026 04:53:24 +0000 (UTC)
Date: Wed, 4 Nov 2026 20:53:21 -0800
From: Borislav Petkov <bp@alien8.de>
To: Santino Wang =?utf-8?B?KOeOi+S/iuWCkSk=?= <Santino.Wang@mediatek.com>
Cc: "jonathan.cameron@oss.qualcomm.com" <jonathan.cameron@oss.qualcomm.com>,
	"linux-edac@vger.kernel.org" <linux-edac@vger.kernel.org>,
	Sidney Chang =?utf-8?B?KOW8teWxpeW5syk=?= <Sidney.Chang@mediatek.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Fred-WY Chen =?utf-8?B?KOmZs+WogeWuhyk=?= <Fred-WY.Chen@mediatek.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Light Chen =?utf-8?B?KOmZs+aYseWFiSk=?= <Light.Chen@mediatek.com>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"tony.luck@intel.com" <tony.luck@intel.com>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
	"mchehab@kernel.org" <mchehab@kernel.org>,
	Arnab Layek <Arnab.Layek@mediatek.com>
Subject: Re: [RFC PATCH 00/11] soc: mediatek: add a DRAM ECC error handling
 driver
Message-ID: <20261105045321.GAauwLwdk2PSruRAcw@fat_crate.local>
References: <20261102092334.138759-1-santino.wang@mediatek.com>
 <20261102123642.000044cf@oss.qualcomm.com>
 <20261102124434.00007741@oss.qualcomm.com>
 <78ce4a6ef441cb9836466e9ae5e72ffe21a88242.camel@mediatek.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <78ce4a6ef441cb9836466e9ae5e72ffe21a88242.camel@mediatek.com>
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261104_205352_383979_0BE0BE2F 
X-CRM114-Status: UNSURE (   9.20  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -1.7 (-)
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
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Nov 05, 2026 at 04:19:27AM +0000, Santino Wang (=E7=8E=8B=E4=BF=8A=
=E5=82=91) wrote:
> Which existing interfaces would you recommend for obtaining retirement
> status from each memory owner? With that information available, can ite=
ms
> 5=E2=80=937 be maintained in userspace, or would they require support f=
rom an MTK
> driver?

mm/memory-failure.c

Look how the others use it.

What you write above sounds like you need an EDAC driver which collects a=
nd
reports errors. Look at examples in drivers/edac/ and there's some
documentation in Documentation/edac/. Perhaps ask AI too.

If the stuff you need is not there, you can extend the existing interface=
s by
justifying the extensions properly.

But what you have - a completely separate RAS implementation, homegrown
somewhere else in the kernel doesn't fly. I'm actually wondering how you =
even
managed to do this driver without *finding* all the RAS/EDAC glue we have=
 in
the kernel. Googling for it would've told you that there's something...

HTH.

--=20
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette

