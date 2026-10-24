Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E759606A31D
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 24 Oct 2026 07:17:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=33NAhpkt;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=DNTBiK03
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=kh/xa8HGjahPAuh2OoEJ1AULPxuRAadGF7CKojxM7CU=; b=33NAhpktkdwLtPp6O0qKB+HSwG
	6MDLW+tEoUWSLVZ4tyBsjLRI2L3PS8CzVnCQxyiF9QeGt0tcfo41DZpyQ9U3SVyWXllUBpRuYZtET
	tpyMwhFmQJAQSfA2HCz7IAn78aE60x2WRIJTh2o3os3x8nqMtFQh5cRDQZOJ/N1T12t3R++llKXYE
	D9rtlyfDLGLjGgWV3gzwf0K/zTpLDufNbK8J6nUDWTum9b+ZxH1Nf9tnFviLjss9eNYUBFus8bZWb
	AZrQ5NEnq8/07LOKAbiv9wviJoWjGS590+Jb7l3sWE4/CzUTCt34fqn9Pou8wPPeOXgNpL26fJZaL
	pOlx/gtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKVzg-0000000HXpE-1412;
	Sat, 24 Oct 2026 07:16:44 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKVze-0000000HXol-28Ra
	for linux-arm-kernel@lists.infradead.org;
	Sat, 24 Oct 2026 07:16:43 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-48c45111bebso776882f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 24 Oct 2026 00:16:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792826200; x=1793431000; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=kh/xa8HGjahPAuh2OoEJ1AULPxuRAadGF7CKojxM7CU=;
        b=DNTBiK03GwT2h5sySgmaHc6oYGGqlXoyUmqp0MR8paqi39ISQIAwxcCNdVgr39bbvW
         5UUTm82T04I3xR0+53uFCWof6L2PEqP6Geq5F1t4Ekdw3003U37dk0aYmYOHkWwRHbnu
         M6pBVOgAzibvi2yHrA6xPGyWtTYyvkWRdKpSG68t1V2mQIMSvt5nwiX+8znNj22Kc54b
         i4DwvcPYtVVE4NiTuAILoPJpZof/DOnMZNZsmU3BwKdisnkzsE9rgnCDat1Qsc85Kv76
         SpF0UrkBLwqIkPCcMqsPdxzoWGS/C9i3Nf7RE5ai0PIKW2yhlumifT5r5n2UoNgT2jEe
         bSOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792826200; x=1793431000;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=kh/xa8HGjahPAuh2OoEJ1AULPxuRAadGF7CKojxM7CU=;
        b=tZeFLSD9hGXVJAwXZXHjK0eGp7QULRLbL3Klel8QAff9GdSARJ5yzpl/7Fzm2O4FV9
         F7fuaM9CJVs69JpUI5ebNSBX8MzWbBeE69qn6324KeuTfF3geR/N/zOxmuI0I/dks8td
         3RoY0kI4ShoJaI+Rmh4LTD9o4KdPwVJ8uot4iYo3xiihRaMKnmDF7O8FtozsfnVb/eKE
         jRZtK1iEakMke3x6eZPmAjYW9nk6tdbPcEJ22DnNK+DIEf8jFcun8DGWj0tUKQCHCaBW
         RgLFvDHnXin5MWulEcO5x3lIZjiC/xM6Xt9e9L7iDvB8odOJjidofZnAaVJqeY2QP5M1
         BJyQ==
X-Forwarded-Encrypted: i=1; AKwUvBzOrNnjeAP1kZBPPPAxA+oSxHL53013EvL6EBjLtgowGAPLtrZljtvrSPYlaXDHPBXyUxE126xDxY8iqCI8Y1Vb@lists.infradead.org
X-Gm-Message-State: AFq9FYLD+bXRyLlRZMELmuktn2Jg/Q739yRqCwgEOztLJAChWUj4SrRv
	A9vQoOxq/Xb5NJuw1fnCF0l0KBLKiZ5hcr5uSRHcixXsNkV/icIR0kGu
X-Gm-Gg: AYBFou0Q09gNUsxzLmYHuOoeaGCpQUdsaEkX8VN49j9dfAm4K02/AAvQ/dFQpf8yZU3
	D8Hsle6K89hEm2Y9E8AtakdpgxQSlNzKqamX+Jj2cEFiOCkdsBFR6iO0CeBKrRvDvm947tuURNp
	rPZffeScq1SMeYOj31IOmY6y50ps1Z2kTZYRe+IU8NFVL5i0uUnwGNXS+4/HU1JxvFjdKE9jpWx
	Ajc6Gkxisx2y3s1a1J9NvmKr7QCdKs8PM7DENIQFlbSgh3XhImuamAcpoodCEI13GmrO49eHalC
	n1Q306aKQeAsozlF8kVuFysh0IVscVLz1nepJaR7+heKghwSHDB7vWjD/uo1EUEslTzlVX0wjn1
	Eahedo61lTf5ZJtTokJdn2bZlOh8JaTOay4t92NGjvRFpo31pVRGGlCJB+gxpkD8KJ5y97dFBAX
	b9ewFmRw8B7zkAWsp5VkaOo4EySdGjDVuPxqXSWXUbZtHmPJP8NQpH2tdxF8wRTtQcE41ov8cwh
	Y0KigFb7zVQs2XuQ8icBNC5rOpqIbTQO04ZPmrU+LFivfKst+UgrOj5MSnK1uTcl78h5hWd2Nfg
	YS4QHYbySyK8fMwZMPgU4U9+VG75ab/WMPl5W2F4nUxCKnCUUrgXzqj8zOciVSWHDJ6o4k5FgtC
	a+EmVdo6eQ1z/TtqCHWietALRx/kkgKkCUzv6mCgSFeBXo2OrpDSDe8ywng==
X-Received: by 2002:a05:6000:46d4:b0:48c:6fa4:fc89 with SMTP id ffacd0b85a97d-48e3eb8672amr976542f8f.12.1792826199930;
        Sat, 24 Oct 2026 00:16:39 -0700 (PDT)
Received: from unknown748F3CBA5068 (dynamic-2a02-3100-9da9-5f01-d5f0-7ecf-afa4-4bc6.310.pool.telefonica.de. [2a02:3100:9da9:5f01:d5f0:7ecf:afa4:4bc6])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebd4d8dsm2794954f8f.36.2026.10.24.00.16.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 00:16:39 -0700 (PDT)
Date: Sat, 24 Oct 2026 09:16:37 +0200
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
Cc: Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	linux-pwm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] pwm: atmel: Fix prescaler for periods of 2^32 clock
 cycles or more
Message-ID: <atxaqNeZdj_-gAKM@gmail.com>
References: <20261016161221.16553-1-kmehltretter@gmail.com>
 <atnHHaOwTkI78_tc@monoceros>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <atnHHaOwTkI78_tc@monoceros>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261024_001642_567083_09425DE4 
X-CRM114-Status: GOOD (  14.67  )
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

Hi Uwe,

On Thu, Oct 22, 2026 at 10:29:42AM +0100, Uwe Kleine-König wrote:
> >  
> >  	if (shift > PWM_MAX_PRES) {
> >  		dev_err(pwmchip_parent(chip), "pres exceeds the maximum value\n");
> 
> just above this code snippet there is:
> 
> 	unsigned long long cycles = state->period;
> 
>         /* Calculate the period cycles and prescale value */
>         cycles *= clkrate;
>         do_div(cycles, NSEC_PER_SEC);
> 
> there is another overflow happening here if state->period * clkrate
> doesn't fit into an u64. A complete fix converts that to:
> 
> 	cycles = mul_u64_u64_div_u64(state->period, clkrate, NSEC_PER_SEC);
> 
> which prevents an overflow if clkrate ≤ NSEC_PER_SEC.
> The latter can be asserted by checking that at probe time after calling
> clk_rate_exclusive_get().
> 
> The options now are I apply your patch anyhow and the above can be
> addressed later, or you rework your patch to a complete fix. What is
> your preference?
> 

Good point. I took a look at this and will send an improved patch soon. 

Karl

