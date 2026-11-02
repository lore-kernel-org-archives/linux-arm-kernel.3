Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CFF5607039A
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 17:36:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=UtBBCsln;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Zbfq8XJ1
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=RgAiywsBelbLFo1/0q+f+El0xcDDf13+2s79/Xr1ciw=; b=UtBBCslnLqs9aV/8P3Q8TsTdyh
	VbrwVls8/s62KlyLOYY90eMQpfsiM+8RMg6ZKPh8JJabSECLrMW5zvVpJrkVU4ZtP3/aQLTrMJbwm
	ES5eMYnzDhhLnYZZBol15aEa9MsprahgoM87h8kgDZaOn7EvF4RCTHpt5yZYOVgodSeelmua/TGt/
	rtlDUXafA+XgMPLDCzLFtBtBywIog8lSi2rlNaQvpT8ovTS7Xfad66WEwyu++jT0ouIUXJj6Vhdxy
	d5wPLP114a1Y0ltLnfL6zBTHmQCPpjTWgUfyOVmUFoqjPJD4oXBKv7+/e3dh9XsdySY6gbFm1OlWy
	fnSO6WIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNvxO-0000000HTsq-45ua;
	Mon, 02 Nov 2026 17:36:30 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNvxM-0000000HTrI-0kj4
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Nov 2026 17:36:29 +0000
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-c4cac7a7d3cso395504766b.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Nov 2026 09:36:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793640985; cv=none;
        d=google.com; s=arc-20260327;
        b=bd86odKPq21UcPVL+WwYyxcZLCjLV6AHI5kCqKSCx0VwsRQT5u/jDME+V7PNxcJ94n
         0r5R/m7yEURHmhxVrQ1takYTQ74jva1/CSy7qt+FfDeE9jQaITXvhzrXknwSN98MXet+
         Sfyg2x3Tz/7N/XcSFGWtBREd2Gme1nm94ka0Igmk8k3TkpAhthbRIAzUZPnlDAa/6Rhb
         rSz3qYl+QnyyGreeI3zdAvxU/tNS06pNWLhNjppxZcsSK/f6IUpherM9yx2aOu8aoHda
         2d3QVWwUWCYCXMZd4W860MbutATXkDnRaLBJHlK6EOVUsi6qkY2194xHGrzjr9QUWZGv
         4xiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=RgAiywsBelbLFo1/0q+f+El0xcDDf13+2s79/Xr1ciw=;
        fh=5WgR8kcvAFRGyBLmwyMUBkfbf5VcwgwI0kh624BTkCg=;
        b=cfmyr4WyUz7OssyZXfrmfuv01AvPGVvt9n+Glh2nBqrXJm1ya0ZjNEnIl6WEUvNWj3
         7lYxMmmy7y2/E+t7s6e8CVVC5xHRE3pcOb09ZfRy2ZdFBP+r4pxrjKDdVmkQVo2s6/YD
         UvuwDGv1ZsR28mHd2nshxYenCpAIGJO+p3w7n6Al97YpbdPJKEfblzodLA67/p0ML5no
         uuUy4mg8b6UI8AdMOhdeLjxW0aH5n1UfypQlbFumAfv8l5vSL7A+NxcgimId2OwytP7B
         Bf6DbVrheo/ula6gESU+bJbna9YG9DJxgjyaQ1mHMFE5YSpYEDr0aL2aAd5SUzSXVNOK
         I9sg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793640985; x=1794245785; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RgAiywsBelbLFo1/0q+f+El0xcDDf13+2s79/Xr1ciw=;
        b=Zbfq8XJ1UoJppMVS2teV/bfXWUiaWbO+X0C37tYDO5QHhqb4tqrOuQx6llpi5J4GDX
         /mkozJlE3TasBr2qWVMOm72uiC/lU1r1lDk2HBpv0blnBIbYL1q3V5GuaBuV1MINEL0P
         CqhDTtu1S9VKsH/rymK0PL3aatcZ+3alZ/5LsX/QtRsaoYkePucX1/NsPpQGIOdGap+k
         kRjDD1h3XVBC8kqgv5Ip1zSILaKQyhwF0UODDYTYHbFEY5Nu2MUuh2garhLn7U4+d1Po
         7hDaUHsPIyliuY7naqg8vty+0z0AgsTrolTm7HOTqBTO1NmSaQ7yGkgwXW+78u+qqU1i
         HYrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793640985; x=1794245785;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=RgAiywsBelbLFo1/0q+f+El0xcDDf13+2s79/Xr1ciw=;
        b=yogsLPAnj2ZGu/Vl6NQdl1JgYKhD/1C0YPSMc9ow2rkP79jdmlutAM30O5tDHsdrXf
         PuZYDlNfTKYX9aZl/LNxBzGmwGBPn6rhXFGjL0UHU3csNRZJ75yiF9ybpPO4pZ/2UgLK
         IUD+EfayqOc9zfcuQccU3k05fb8bltKfaw6525ZSFru1lfCn7EePduVNCtp5Nm1SWJrU
         M3hdJ6ksgKoSeAfBCkABT3bKtqylIRVR3AkUJwftmII73fmbZbrWb8IlbK4Iqlbg5xL7
         vOHZsjBtKhDWrCHkZXXh4WmgMZ1c4VKkZcFyhiqE1v1pujKCDa00CzID+gM9VQqb/Gd6
         7hCA==
X-Forwarded-Encrypted: i=1; AKwUvBzP2KYL3S0/YtJZkLMDAf6zsBboFu55HUgkmTtHZbNJB/RwEFhfGl4cOf/MEmbFinRrdEU65Nb2XM29nXW2vVht@lists.infradead.org
X-Gm-Message-State: APuU4Z/Ex1D2jDkAB4h7JvsQ02o1P+AwvXwwHIgsB2DeYnDemb6ZBCS4
	a5N4J/EvnDo1WsAIWVfL8Hoypg04BiMTAbP1cgSmSp0aodXZyRQChiSBp9kuHGdw+mjwoxOIEfL
	ht/1XeI2XDwSe2lFTQaqpN3ClPOjo8QYnlQ==
X-Gm-Gg: AYBFou3jLmFmYexemjumQCsdN3GrokO12Jmriz/9kyd7Svr3yvHZ4HmZt58c55LxSbC
	L1gm+Il+yBDB+a6Jwxlezz7L5HlGI7Tnei0OpRnzibFf8q+OXl7TejK7YxXtLEU8T4StMlfCZhq
	P38gubd9fQqj8xCiomuLp3O1vLddI/pEA4DPMlcIntskO4+PN5F2dnOGM6Vi8u8ZT4eGIQ716/N
	tLGNFL3LVAAuHHw1BnQVg5uoTR8DrwRZNZh0v0NpsBaW/mihPm5353npJhi+jl6ZiM3KbqWo47V
	XFCmHSojTw+RpBV/mBYKfIYYcqHaAX42BCZORUSbgouh1QNmqPG71M/FBKlYQ5Bxby3WyHqaKFF
	hCMq64XA7+eOqcC2Gi+W7YJKoWBj30HUPhrzssqkJWBrg3Hfs/lBcVTnj
X-Received: by 2002:a17:907:6d0f:b0:c26:1649:47ad with SMTP id
 a640c23a62f3a-c4ca7a9ef61mr913462566b.35.1793640985367; Mon, 02 Nov 2026
 09:36:25 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261102170227.1719206-1-pbrobinson@gmail.com>
In-Reply-To: <20261102170227.1719206-1-pbrobinson@gmail.com>
From: Sander Speetjens <sander.speetjens@gmail.com>
Date: Mon, 2 Nov 2026 18:36:12 +0100
X-Gm-Features: AclHuK-CyDEaCXVZkgO_fdjPqIxjUfqHnveWflDZ6jueAfoJaul35aOiuTuRmYA
Message-ID: <CAAOJLPH92mu4cbpRCvKrDnRtscW3XjYHvpWZ6xkCooreQMpETg@mail.gmail.com>
Subject: Re: [PATCH] firmware: raspberrypi: Add bcm2712 revD compatible check
To: Peter Robinson <pbrobinson@gmail.com>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>, bcm-kernel-feedback-list@broadcom.com, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, linux-rpi-kernel@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-rtc@vger.kernel.org, 
	Stefan Wahren <wahrenst@gmx.net>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_093628_230505_3A0B706A 
X-CRM114-Status: GOOD (  11.21  )
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
X-Spam-Status: No, score=-7.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, 2 Nov 2026 at 18:02, Peter Robinson <pbrobinson@gmail.com> wrote:
>
> The bcm2712 revD doesn't contain the base SoC compatible of the revC
> because they're not fully compatible, we need to check both else we
> don't match for newer devices and the RTC doesn't get enumerated.
>
> Fixes: dba67294e2151 ("rtc: Add Raspberry Pi 5 RTC driver")
> Signed-off-by: Peter Robinson <pbrobinson@gmail.com>
Reviewed-by: Sander Speetjens <sander.speetjens@gmail.com>

