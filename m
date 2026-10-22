Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7BE2606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Oct 2026 14:16:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=CBpyn0MY;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=dcpmMRGd
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=DYTy/UTl+vBn4EAGrIttzpHzPB3aaGAMqMkXs9OYaPM=; b=CBpyn0MYbiHZPXEfQEfzxnEXZg
	EqwxhnfnDtwxRur93jd91jxKD7sJNA3cBDHjXgjALWvTih3rvCvnKKDQl3jxC+iE7SLW/1QKW0vAU
	b2Hwdye9ifstA7c0wJnpRoT+0lfjskHdjf9Kcd21KVBiiOMuAPVO9o2kAsojSXz3CR0vnmqtvei/k
	sPAirQEamVwqIvLNm9QDpjoT1MjgzokDpLBh6jQZm3ifuO8VL4+4nRLmVTs6fIJsDUj0V9R6iPLsJ
	bVYn2VBMhTyYl3M/8Rw6AEfuEyQQdThTRtucIAsYOz3nK/VrbQvGaowvbtY7HXCQMd6Plj42S6Ija
	3CWAC8tQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJtaE-0000000EHZe-3aUu;
	Thu, 22 Oct 2026 14:15:54 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJtaC-0000000EHYG-1pv8
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Oct 2026 14:15:53 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-4a0286c981dso20201615e9.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 22 Oct 2026 07:15:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792678550; x=1793283350; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DYTy/UTl+vBn4EAGrIttzpHzPB3aaGAMqMkXs9OYaPM=;
        b=dcpmMRGdFZ1Yq95vClrr+v5vTzYkgHv/UoSLJKzzpVpjp+TCQm+3KxmY3l+ij7HxID
         3SeSTJCGY8XBxpLopFP09YxL/15C3aQeY7moyckNw1vsoMqxFJGkQ8H94aMpQH439SfF
         G5rG6Ga3YYiNi6nk836NYdNj4mOxE9gdn3CiS2p2vExFOYqNz/lF9h566nRjjkIRBlzW
         sWisQn+BoWPbmBzpssfK27fLkpQVF1o3CAx1TVkXK8C+/suOPqM2T2+v/DmEXunGskn6
         3X/bdUsMugJyfy623ZrWKEQ8swbsU64EID2hr0O0c//WhyfjGlbvo7YR1661ipg2ONcu
         LXSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792678550; x=1793283350;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DYTy/UTl+vBn4EAGrIttzpHzPB3aaGAMqMkXs9OYaPM=;
        b=Pwr+3ZiFwqiHfS3nkXj9Gknpup90ZKvPkQaRaT6n+Mk9RKmMHamcmawzCDSrfjx9jC
         QtupVwI0JIBM1ZuokWmkz/pzj1U83J4K6q3GPq7YYOc4Ti4oTu+sx1kLgexapQ+HWVyY
         0b6/Kli+kHfBZcDChzZE+lYYrXJCclojpWv7JEjZegOX7M8NHA5FWbQQ4rAoNdJ3a4Jr
         InG+qLoqr+MZJo65E4QBV8iYQWJhlGiruq9os7fjWhDpKhfk95IMlI8x4Y5Dasl+/C0P
         sUt7nRRKVzSO1G1iucmIGj99MRf2qzhDuINGJFzqB/M/ZpzqKwIH3i08c7TaSq1YFw9V
         +vtQ==
X-Forwarded-Encrypted: i=1; AKwUvBwqQNasz7Lw7lhpg/opsgI81UxUK7rwD+adbhkyZQollxfu4RmdSGLoj6TjwA0ar7O8qzzQYZJR2v3XFC0Lz35z@lists.infradead.org
X-Gm-Message-State: AFq9FYIITQXTs76Jva4BKrM563XCsJ1X6GH/adTyTn1q1jsVT6d0SF9U
	zLSkoh5CREjUDPas+NtX67L4K+uwUBTj7o03+TYJbOFDgpYm/r4r2wE1
X-Gm-Gg: AYBFou3vBAwamepXHS0ILGuV8lqPYf2wlP75SyCimIxZiWLIf0I0JYdd3wOlT5xiytW
	kXnuBQTTCs8naPCWTuLQYZHAaGSVYBB0qDlKzKjGVHtNJr8kNcdJNyk6sA00wc0lx5d+b/v1kZL
	mALrbxd289OY1rnJ0DNzP4dREdcyA85Qatl8BDe55HuCnqutfj11N6AcF64sl8sL/9uwYjnB4gm
	fqq7JQZFCNvcTLkRcp0zmtLdLEvnpQQn8fa1NJXE1sCZwBTmI1Iv5xkdEaJYDEMx/McNSgtlXcb
	S5rpxfnwFc20+wjt++sus7cYh1E4C3SFfYLrQ7eRYLSHpjToi6Qhq1Q+3VPdIeKctC0k3Y9Rkje
	ccDfcLvAPDVboT1AnFzNXqxsPPsRqV5SJM6AB4SU5t85CPicE1Hzr3KK7jR95fhunr4/QvTJwVb
	ukQb/MTwgArD+afx038ZGjCemnnrJOIGnjLGXogVx8srzpDxqZ8s/TeZ2m7W1XozDDXPgcg5iYt
	UFbIsuYnpsorYsTjDnUKGiSKnQiYA6ms8lMht1rEtIbcBnd/PZme2WwWEPa087IDIl6ybQ+zGWz
	egwbbrfZLcHrFi1JGG/zHqwLidBXMJ7A0vgWZvit5026Lo0mMECTvGg=
X-Received: by 2002:a05:600c:34ca:b0:4a0:eae0:769a with SMTP id 5b1f17b1804b1-4a1fdd39e68mr111050565e9.28.1792678550121;
        Thu, 22 Oct 2026 07:15:50 -0700 (PDT)
Received: from ernest.hoecke-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a203add62dsm82627145e9.2.2026.10.22.07.15.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 07:15:49 -0700 (PDT)
Date: Thu, 22 Oct 2026 16:15:48 +0200
From: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
To: Frank Li <Frank.li@oss.nxp.com>
Cc: Francesco Dolcini <francesco@dolcini.it>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
Subject: Re: [PATCH 0/4] arm64: dts: freescale: Add Toradex iMX95 overlays
Message-ID: <ew6jybymalb3d3q7hen4qubefipnofcfzsrzyjdajuagw5fnov@b2oe5mjyz63w>
References: <20260922-v1-imx95-overlays-v1-0-694100afb4bc@toradex.com>
 <arKn0LhC5fty7dHN@SMW015318>
 <20260922165846.GA290956@francesco-nb>
 <arLJl3jyyytfS_Qw@SMW015318>
 <20260923084111.GA460930@francesco-nb>
 <arPrD4TDYhjYxFGJ@SMW015318>
 <20260924101308.GA45659@francesco-nb>
 <arU0sLhGG__lh98n@SMW015318>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <arU0sLhGG__lh98n@SMW015318>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261022_071552_491752_04F93121 
X-CRM114-Status: GOOD (  10.95  )
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
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Sep 24, 2026 at 09:33:20AM -0500, Frank Li wrote:
> [...]
> imx-uart<n>-mcu.dtso. similar case imx9-mqs.dtso.  Uart<n> is cross while
> imx famililer.
> 
> Frank
> 

Hi Frank,

v2 follows this. The UART overlays are now a single shared overlay,
imx-tdx-uart-mcu.dtso. Each module device tree labels the UART it
assigns to the Cortex-M core uart_mcu, so the same overlay also covers
the Verdin iMX8M Mini and Plus, where it is UART4 instead of LPUART2:
https://lore.kernel.org/r/20261022-v1-imx95-overlays-v2-0-c769d6eb54fd@toradex.com

The Verdin iMX95 NAU8822 BTL patch (1/4) moved to the shared NAU8822 BTL
overlay series:
https://lore.kernel.org/r/20261022-imx-nau8822-btl-v2-0-b4221ed43650@toradex.com

Best regards,
Ernest

