Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECE0E606A33B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Oct 2026 08:29:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=J0qeAb6r;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=k0cFXBO0
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=diTjf1RR+6hk2NNUcDUFo32N0NHYnwNLtS5/2ivO+gA=; b=J0qeAb6rC5vULFhiEy6NYjEQLu
	FqF/T0d7cQlcRUvL+NxZdRT5Su3YT7FuzBhoXnVznG24hbi4BKniyblPwaLRCDoKA0zmVOu4VQHP4
	jHSaAHLgJ2Og43qQGYnH/6SCKIKvrgFqsk5dgsJOiQAfS1HjA2DZ/yTU9GGBHBr01UsRd6vEyez4L
	Wqp7/UGk1Osx4gHvYcpWK9PVeCfcAlGlztIFFYV8yYIriKbm1yYEWTzj90Ju4vLmIkRVgzaRns5Xs
	kkOBY+EMyoqT9FnUve875GVEWCTnW86SXsHTbfzV6g2uxJLa++4xKPrtfP2pBhi/psS3Hh1rbydrM
	apCoL46w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLG5T-00000001x11-2Xls;
	Mon, 26 Oct 2026 08:29:47 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLG5R-00000001x0a-2VjJ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Oct 2026 08:29:46 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-4a2000d5fb1so16922595e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 26 Oct 2026 01:29:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793003383; x=1793608183; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=diTjf1RR+6hk2NNUcDUFo32N0NHYnwNLtS5/2ivO+gA=;
        b=k0cFXBO0hS22tkmbobMMjbu9XIGIE/JjY/aImJrkzC96CnYltKKl5ALbucV92fw91Q
         fJlyCJG09QIrzitvAkJVpthjmr9i8kNg9cbCxjqVNbVMv7a+27rdmUUdDTRWO+pR8j1S
         gwoHu61Tf/dtaNK47aukq6UUchImJTrt15x+eLjychc8cRz7FNsn5YZAq5JoBav4RIyP
         fMEVJjgMz6NKCefRvFeBK+RbuGEL+QxcBuZ3ltyYlMNtTFAHcraDG+IqFT6RbSG1+Eup
         Sx0iAqx0Z30EZbbONLFxQIvAq23Sl8Da8r4YHkyEGHxYx2dHAr29Voa++OSOf0gRm2pA
         PTeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793003383; x=1793608183;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=diTjf1RR+6hk2NNUcDUFo32N0NHYnwNLtS5/2ivO+gA=;
        b=NDahMkkiLlsd157mm8okicYjJ425FzjU7H7VlUV4QHsoGYwEhxQM3mGphEQOK4hQMI
         Z7V5io6yp8q6Upo3nr6tVNU4Fm1HzBmG8Rfzwhfg4D4gc+s62dZEfQQHxNvg6wJowVSb
         aw6KtiMp5IdWaQGQrW4n61JqFK4iyw1yQOQ8bqiXVigkMMPo7XwoFPEcPSHGUm23zUin
         Wa8kgvcnizKAn63BcUQO2HVp51P9VYMsKsA9G4BrHwOb1WBOpuY1TnGoCbUUiSY/E3ak
         GdCij3I06zKs89BWfp1/oVQgByJLMVT0DkjTu87BH4inVZkpa0bwfi0H5LWMfT7VdECp
         4scQ==
X-Forwarded-Encrypted: i=1; AKwUvByGByaczPCIFiD4eeBqLGzDq+9ON8PMmNN8BebSQdnxeNmcGpF6sHaMtnipARf7idvqYQr00rQGn6jZMPPshom2@lists.infradead.org
X-Gm-Message-State: AFq9FYJHtfiltf0P26poEuFWDNTq8nXN0DQ2JziDr91Cqmi0HSFWsilG
	03mh0WNphDFjlUhkHUnyIv3eY8q8hvn8neD1sQK+Pvo/sFyT3rKWBPkD
X-Gm-Gg: AYBFou0rPpuOQs2LPQ1TfsHPqK8yBEl2ICFE4Zp9bQbGj347pKK1tmjzAM9A5V+aUf9
	mieS6J9o/Dvahqj2MotfNLwRsqjKdpCWJRsIUtBr4odTYJkDDVF6yN3V553S8tJBqrogIgt8M0J
	N+7MxXQGPZpmatXYEKVVCYxLbUktmh90Vk6VQz1sNBd4ha38PYOte1lm9a4lkk3tIvUpJRM8Htz
	AgOr67Sulf3K8wWdOjtaEw6/xkjVABcHvyb3RCbJ6WtDgxLA0itjZUdzGoolFt5aLP6G4no+QF7
	7rqabRVaer6XoZ4UuSYDcBhfME1WdvALjHqDS882l37ikwqmGCh1bZDk/ImvWUie1AX66A7M39n
	GtuiXSd/E77gVDcZXqJ6kkj+e41OW6oft1os9d2p5c9UD3yKx6ArP6SMZGqDwEQVu4PRM5MkuMN
	jzziXfUNEfsWbEho0a4hQK+YlkX0hnsETYvQEUCP46XP5Sjs3Xst3YF3LuH8be1RvB7o9R0j58/
	Ig2tCCp/pYp0praOdpCROzCSEBvPgAr+fiX22aA0yO1aGO0VBUDCCOmJLlUx3fYuvbBhqtwIexT
	YcnOqv0+s9WnVwR6hRY1EvqxvnMorVWOOazwCuONzonIdHw1pVHNfP3ZW7vFCo2IDsLV0jYXdXE
	VhEQjOyY=
X-Received: by 2002:a05:600c:4f4f:b0:4a3:5a42:b29c with SMTP id 5b1f17b1804b1-4a35acbc00bmr116641935e9.26.1793003383367;
        Mon, 26 Oct 2026 01:29:43 -0700 (PDT)
Received: from GLaDOS.station ([187.13.216.220])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a30e22csm178673445e9.2.2026.10.26.01.29.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 01:29:42 -0700 (PDT)
Date: Mon, 26 Oct 2026 09:29:39 +0100
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
Message-ID: <at8Pc9jDy0dX8Sr9@GLaDOS.station>
References: <20261023115242.11197-1-stefano.r@variscite.com>
 <att6GNZAVv64Rlnv@SMW015318>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <att6GNZAVv64Rlnv@SMW015318>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261026_012945_654269_0BB0FF78 
X-CRM114-Status: GOOD (  18.90  )
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

Hi Frank,

On Fri, Oct 23, 2026 at 10:15:36AM -0500, Frank Li wrote:
> >
> >   imx8mm-var-dart-2.2-sonata-1.4.dtb
> >     DART-MX8M Mini v2.2 on Sonata v1.4
> >
> > These are proposed names, assuming that the same DT correctly describes
> > all the hardware combinations covered by each entry.
> 
> If new boards 2.3 appear, do you plan change to
> imx8mm-var-dart-2.2-sonata-1.4-2.3.dtb?
> 
> Rename affect addtional problem or efforts when back port.

No, our intention is to keep the filename unchanged. For example,
imx8mm-var-dart-2.0-sonata-1.0.dtb would retain that name even if it
also supports later revisions, provided that the same description
remains correct for all previously supported hardware.

Regarding the filename itself, would it be acceptable to include both
the SoM and carrier hardware revisions, as in the example above?
Or is there a preferred upstream naming convention for distinguishing
these combinations? I have not found a clear example to follow where
both revisions are included in the filename.

We would introduce a separate DTS/DTB only when the hardware requires
a different description, sharing the common parts through .dtsi files.
Our preference is to distribute complete DTBs that the bootloader
can load directly.

> How about use boards compatible string? You add new compatible for new
> boards, so user know this dts cover which boards.

Could you give an example of how you would handle the root compatible
property when the same DTB is used unchanged on multiple revisions?

For instance, if SoM v2.0 and v2.1 on the same carrier can share exactly
the same DT, would you retain the existing board compatible, or
introduce revision-specific strings? How would those be represented
in the shared DTS?

Thanks,
Stefano

