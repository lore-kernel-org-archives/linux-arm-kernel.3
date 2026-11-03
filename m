Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8BA0606A327
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 04:18:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=qeSe9zMG;
	dkim=pass (2048-bit key, unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=a7t79Qzf
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=i5UScEbi5P+SKDxLk2/1WH1m35SDk+R8PVhmVEVHgPs=; b=qeSe9zMGvRrVYFWxH43mPs19nC
	mB2gkzyjjVF5DD4s+UlhoTLZF/Dbzwdbqo5YIngbxVJuQVxbzAnY+nVgLBeVOIpmxkrfc+5cKFJyQ
	U6VRVd7+x+LRXlsnBsYgbrSKC/PRSJVdC531DYo73lSHHcU+cVKmLqAG8ZqLa4c89Vh/kLeMVGI8t
	VHwOf736hGW9qVX2kwgymYs/RVerY6n7xmkjxapDLoAsxxd9VzJZ0kPkEN2nURHzrNK2HNqR77j7l
	Se5WmebQptI/FZdgvQQ4HYqxGKbY3D41yYOTTz8xqrL/Mu9STImqUnZkJYYG9z7UHVfbO1X4pOede
	xoZ6V5qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xO5ya-00000000zjf-2tmz;
	Tue, 03 Nov 2026 04:18:24 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xO5yL-00000000zjA-2P1v
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 04:18:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1793679487;
	bh=i5UScEbi5P+SKDxLk2/1WH1m35SDk+R8PVhmVEVHgPs=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=a7t79QzfSTdOmbUGBi5zuXRXLb9bnKCNXZ7ddcXCve5Iki/BJfETkutBAfN6dIsSa
	 6hWOY8+mbeiLrGyha8O5lIQ/p7UB+I0Ll4SsJPrg/ujXWKTRaiMCx6dk5CCCYfdKie
	 TDllu+3oC2+dHpqpaW5IYHSsrjguyDQBTv67x76CrDX576Gaa5lFfNlUUygdF3zoWF
	 SW2O2ZEUJSZBb14lGttfI5aBk3F8AnH39EyAwqmWdxvjwY2zhhJmgG/PgYI3aQQvgm
	 Mq+2XnwOg5SN4ix95gbCrxbwfRF44hJavRKXeW53i4kZASS28FOrji5FhIKvW28kFj
	 /HAhKA+WVXVsw==
Received: from [192.168.68.117] (unknown [180.150.112.139])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id D92A9648E3;
	Tue,  3 Nov 2026 12:18:06 +0800 (AWST)
Message-ID: <bc6e605a8c5bee59ad9bcbce5f4fe775c9c3324e.camel@codeconstruct.com.au>
Subject: Re: [PATCH] arm64: dts: aspeed: Enlarge AST2700 EVB kernel
 partition to 12 MiB
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Cooper Huang <cooper_huang@aspeedtech.com>, Rob Herring
 <robh@kernel.org>,  Krzysztof Kozlowski	 <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Joel Stanley	 <joel@jms.id.au>, Ryan Chen
 <ryan_chen@aspeedtech.com>, Billy Tsai	 <billy_tsai@aspeedtech.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, Chin-Ting Kuo
	 <chin-ting_kuo@aspeedtech.com>
Date: Tue, 03 Nov 2026 14:48:06 +1030
In-Reply-To: <20261029-ast2700-evb-kernel-part-v1-1-e6f52742c575@aspeedtech.com>
References: <20261029-ast2700-evb-kernel-part-v1-1-e6f52742c575@aspeedtech.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_201822_169605_69FFDCE7 
X-CRM114-Status: GOOD (  22.76  )
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
X-Spam-Status: No, score=-20.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Cooper,

On Thu, 2026-10-29 at 15:25 +0800, Cooper Huang wrote:
> From: Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>
>=20
> The 128 MiB flash layout of the AST2700 EVB reserves 9 MiB for the
> kernel FIT image. A FIT image containing an LZMA-compressed kernel,
> the DTB and an initramfs is already close to that size, leaving little
> room for the kernel to grow.
>=20
> Grow the kernel partition to 12 MiB and take the 3 MiB from rofs,

Why 12MiB? Why only take 3MiB?

> which now starts at 0x1020000 and shrinks from 82.875 MiB to
> 79.875 MiB. rofs still ends at 0x6000000, so the u-boot, u-boot-env
> and rwfs partitions are unchanged.
>=20
> This is the same layout used by the OpenBMC images ASPEED provides
> for the EVB [1],
>=20

Why was what was sent upstream different to what you were doing
elsewhere in the software stack? It seems oddly incoherent.=20

>  so the rofs partition described by the device tree
> also matches where those images place the filesystem.
>=20
> Link: https://github.com/AspeedTech-BMC/openbmc/blob/438e761ed38644b77ba7=
04c984cb607649bf2724/meta-aspeed-sdk/meta-ast2700-sdk/conf/machine/ast2700-=
default.conf=C2=A0[1]
> Signed-off-by: Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>
> Signed-off-by: Cooper Huang <cooper_huang@aspeedtech.com>
> ---
> Notes:
> - "Already close to that size": with mainline at c339f4010dea
> =C2=A0 (v7.3-17997), ASPEED's aspeed_g7_defconfig [2] and GCC 13.2, a FIT

A bit of a tangent, but GCC 13.2 is over 3 years old at this point.
Debian stable ships 14.2. Why such an old compiler?

> =C2=A0 image with the LZMA-compressed kernel, ast2700-evb.dtb and the
> =C2=A0 OpenBMC phosphor initramfs is about 8.99 MiB, less than 20 KiB

What are your measured sizes for the kernel vs the initramfs?

Is the initramfs content reasonable?

Andrew

> =C2=A0 below 9 MiB (the exact size varies by a few KiB between builds).
> - Upstream OpenBMC's AST2700 machines use the static-norootfs layout
> =C2=A0 (no rofs) and are unaffected; the rwfs offset does not change.
>=20
> [2] https://github.com/AspeedTech-BMC/linux/blob/76457d3afe2bd4022ca82dd9=
eb8fc48b84f0e9ab/arch/arm64/configs/aspeed_g7_defconfig
> ---
> =C2=A0arch/arm64/boot/dts/aspeed/aspeed-evb-flash-layout-128.dtsi | 6 +++=
---
> =C2=A01 file changed, 3 insertions(+), 3 deletions(-)
>=20
> diff --git a/arch/arm64/boot/dts/aspeed/aspeed-evb-flash-layout-128.dtsi =
b/arch/arm64/boot/dts/aspeed/aspeed-evb-flash-layout-128.dtsi
> index b54915f06efd..f54d53077538 100644
> --- a/arch/arm64/boot/dts/aspeed/aspeed-evb-flash-layout-128.dtsi
> +++ b/arch/arm64/boot/dts/aspeed/aspeed-evb-flash-layout-128.dtsi
> @@ -16,12 +16,12 @@ u-boot-env@400000 {
> =C2=A0	};
> =C2=A0
> =C2=A0	kernel@420000 {
> -		reg =3D <0x420000 0x900000>; // 9MB
> +		reg =3D <0x420000 0xc00000>; // 12MB
> =C2=A0		label =3D "kernel";
> =C2=A0	};
> =C2=A0
> -	rofs@d20000 {
> -		reg =3D <0xd20000 0x52E0000>; // 82.875MB
> +	rofs@1020000 {
> +		reg =3D <0x1020000 0x4fe0000>; // 79.875MB
> =C2=A0		label =3D "rofs";
> =C2=A0	};
> =C2=A0
>=20
> ---
> base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
> change-id: 20261029-ast2700-evb-kernel-part-63b3c998ea6e
>=20
> Best regards,

