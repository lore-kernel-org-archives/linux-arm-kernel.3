Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20B44606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Oct 2026 17:00:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=2nMc1FOo;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=I89K9qme
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=BBemIOG3KuKqxJ/h5u8qdNoWNATVBlUDjRGyS3stVBE=; b=2nMc1FOoTmG6QYnKrpnne7P5gn
	m+nm8uqjyqT57N2nIS+9OuFmjSuPYnkpc6nDFCS1l4HglHfcgwcDb58NijHkb0tVFiOdiVN/tTsxH
	642c1DJ2L+/06zRX0MAViTOF7fJBygMn74dFXNgN6OCvDIGZCTAjL2AdkyOmHVg657x05fy5BD/aT
	zDF7mADQdEBKHPt0J2Vek0fckMGbaUo5hk5EK37whsEYhRqTDXhfKhbbJ0ahwLVhjtS7+qA/Hqq1I
	EqE2hCLO1HftM+hHOx1mxkAFAs6/P2KEqwQoKO2GfbNSw5MNKo4+iILbXDKW2+pnzrxKIUnIbL5ZA
	kbcnMieQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLO39-00000002wnN-3SRE;
	Mon, 26 Oct 2026 16:59:55 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLO37-00000002wmh-1KBY
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Oct 2026 16:59:54 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-48441a2ba1bso2073706f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 26 Oct 2026 09:59:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793033991; x=1793638791; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BBemIOG3KuKqxJ/h5u8qdNoWNATVBlUDjRGyS3stVBE=;
        b=I89K9qmeZdZ/3gMnCrh+2+qSA+MptXMhRnsLwS0//tWMuxgd5cBs4wr67rsePCBnl1
         7Wvymt3FltTRKhqwMxJ1xCKRVWslF/UNZqZGPbyLtXf08tdCS+f4Y7KHoIMyAnaVG4vQ
         TE/ZHEJsuiQGm9ONOEGZYp97RGMPsxOUjsTVI5/5oLQTmGq7PxjY8yllbL2UZHJpNcCN
         Aou2qSVTBGAk0n7KUnzBQRkil4vJNUeflQxUMDEb0I448hSDxmsKOmX0A+NhVqLeq4FK
         8yIGC7ZIYWDaG8U+CrALRm4yRa3jRVlrwSxkqQryuLfurrSyBpPdnKxhUS0dqINqQuCf
         r2WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793033991; x=1793638791;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BBemIOG3KuKqxJ/h5u8qdNoWNATVBlUDjRGyS3stVBE=;
        b=fU88cU9f3EeufLCEAmF4aZ/0rcrrXH0ZZiBliy0hwBIgWGAGgHg6oGK1QjFhvgZ0xC
         AqUm9mpppgRk3CAJ+OYi7AjfL5NauUmft6Se+ageppaOTwgKQuWHFT47zweGxaaa/3dV
         UM5PeSr/IeEze5237FtyG5snXO3ODZMKAmrL9LpKyC4tBx3T9tFS0/lMpdXXzhQygf7g
         s2d5ap4C/6E8V6Ztve/ckPcyimYCOSTowPPDGp9vbYeZE2wM104BEFf2vWp/uaSlA3zH
         btgAQkZjzpoedfVNgvfATV+IHgmsIQCRoQKEd1dugGsxHp32YHMoVx+A9dLuHyRC7frz
         sjSQ==
X-Forwarded-Encrypted: i=1; AKwUvByid72eiIxP9NgBcWGWESmNEaA7A+1f/H3GRGK6o9OS00qPikIest/UEGv2bxjCGglfAhu3OO6y0LZWdQBxkq5u@lists.infradead.org
X-Gm-Message-State: AFq9FYJ/5ycTFCVHozt8R9G3LMry+kVD9Uf7A+2KgOAmz2CCNvgfKx7l
	dQ36hyGhVZRWzt4KFCN08LB16O293nGwYBHCEq3rAY+DWfGw8c60sTTj
X-Gm-Gg: AYBFou3JzGMvh8KWrey1vDl80LpHB9XiY4N7H2UNQv1k5xbrX90QVLyprvAzUYuNOyI
	3fT+VUi54Ng8/PGjh2AebSzVVxU1M6bqQ+kq1/waNCtWjooB01cscxdkFnWtcFx7FMq1vNKt6o2
	zBBcpw9VcAMprgGuFJIxxB0YLyYmTNUlLnZYXy9B1OVclRAx/smENsK1OfpL3qG42IKHiLEJfTu
	H0vavnzmUt6aKuwhJ6UK6V3/LRxO4kjqEhCzQIoIvZkWRxUnMX2vxqCVNacAeGSfzMGjeHGxFJo
	e2dUhUztVJNrHG/UZxnEmmdXz9rZGPTQMsYotnUfKNfTAjg896JnaUetqJSm6uRPuV4Rh960zfZ
	zSUkoMw+gwYJ2m0rAVZqyipyyvbI2LyXv4r/svQs5mGru0dbc3CmEGj1M6reRKrO9P/rCYsMZFw
	xIGQGCcl4qEQWjVCosxou0lYVutOGGbLEBH+9JHtZkwyGdHkWpMNR/B/mYTYE+3A4nTbbzRKoch
	Wn4Tmt4xYQdG8Y/U1L9HlvHClMsR1Xzu+YJTCMGYzIx7Mu63w0dM21FVEm+J+wHAoM0fLN0yaIw
	/D4rb3yjVCgSGfGLBEqTv/whZaW81WpdQl8ye4JyZmn6fFNGLL5dwm85VX4e39+ury4B5aaKIeW
	kZO1tPg==
X-Received: by 2002:a05:6000:4021:b0:486:f42f:6860 with SMTP id ffacd0b85a97d-48e3eba4d70mr13645153f8f.56.1793033991164;
        Mon, 26 Oct 2026 09:59:51 -0700 (PDT)
Received: from GLaDOS.station ([187.13.216.220])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebd4bc5sm17405886f8f.34.2026.10.26.09.59.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 09:59:50 -0700 (PDT)
Date: Mon, 26 Oct 2026 17:59:47 +0100
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
To: Frank Li <Frank.li@oss.nxp.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev,
	Stefano Radaelli <stefano.r@variscite.com>,
	linux-arm-kernel@lists.infradead.org, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	pierluigi.p@variscite.com, Nate.D@variscite.com,
	Peng Fan <peng.fan@nxp.com>, Shawn Guo <shawnguo@kernel.org>
Subject: Re: [RFC] arm64: dts: freescale: Supporting Variscite SoM and
 carrier revisions
Message-ID: <at-HA7K_cWub_arR@GLaDOS.station>
References: <20261023115242.11197-1-stefano.r@variscite.com>
 <att6GNZAVv64Rlnv@SMW015318>
 <at8Pc9jDy0dX8Sr9@GLaDOS.station>
 <at-BsPCwPGlpnuJ5@SMW015318>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <at-BsPCwPGlpnuJ5@SMW015318>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261026_095953_380340_978D1709 
X-CRM114-Status: GOOD (  15.43  )
X-Spam-Score: -1.9 (-)
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
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, Oct 26, 2026 at 11:37:04AM -0500, Frank Li wrote:
> 
> Is it for created dtb file? We generally doesn't finial results.
> 

I meant the source .dts filenames committed to the kernel tree,
as well as the resulting .dtb filenames.

Would a name such as imx8mm-var-dart-2.0-sonata-1.0.dts be acceptable
upstream, including both the SoM and carrier hardware revisions?
We would keep that filename unchanged when later compatible
revisions can use the same description.

> 
> It should be fine only if dts can be shared. It is okay to generate differe
> combination dtb file by using makefile.
> 

Thanks. Our proposed approach is to share the common and
revision-specific descriptions through .dtsi files, with small
top-level .dts files selecting the appropriate SoM/carrier
combination through includes. We would then list the corresponding
.dtb targets in the Makefile and compile them into complete DTBs
that the bootloader can load directly.

> 
> Yes, need revision-specific compatible string.
> 
> compatible = "SoM2.1-carrier-0.1", "SoMv2.0-carrier-0.2", ....
> 

Understood. When a new revision can share the existing description,
we would add its revision-specific compatible to the same DTS,
retain the existing strings, and update the corresponding binding.

For example, if SoM v2.1 on Sonata v1.0 can use the same description
as SoM v2.0 on Sonata v1.0, we would add the new compatible to the
existing DTS. The resulting DTB would continue to serve both
revisions under the same filename, provided that the description
and all declared compatibilities remain correct for both.

Thanks,
Stefano

