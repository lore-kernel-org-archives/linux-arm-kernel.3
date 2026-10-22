Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1CD8606A32D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Oct 2026 16:45:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=BOSQ5JF9;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=eIrsUFw9
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=CzD89pGzOgOnG8GG0pKfl9YPmTEtR6RkDZF0eraj8Us=; b=BOSQ5JF9UGzcGS
	zIWYJ7/2kJYqC8Njha6+bTg2wnfnYaakwb5gR7hOHxNVfbwlaxJpDSs37IPMGK9bBWZEV1wIYfPxH
	qm4V4dhOja2NnEC5fwh6rp+Wmx7QjckejsEOBzX4AP+FGoLy/nYwgaoXsCZqrFJgcpw5ym8Z+x7qq
	cfSdKQT/jKFj1q66nhj9S4PIcax1gpUD8SdC2UgfjwNVwuGB4/t16vAa5mae1a8zeEMNUGjEmMcBT
	l8b7bwkJ3BZWkr8KBZ2QNyZ1vFPRuF+X3j+7Y7XnlWa3+ro7fJsTBDQfpRX1/XWEJfaIimWoX8BQn
	PadEx8+jP11KDq+dORGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJvub-0000000EXA9-02dP;
	Thu, 22 Oct 2026 16:45:05 +0000
Received: from mail-dl1-x122f.google.com ([2607:f8b0:4864:20::122f])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJvuY-0000000EX9F-1bQB
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Oct 2026 16:45:03 +0000
Received: by mail-dl1-x122f.google.com with SMTP id a92af1059eb24-185fd3a4ca3so1321956c88.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 22 Oct 2026 09:45:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792687501; x=1793292301; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CzD89pGzOgOnG8GG0pKfl9YPmTEtR6RkDZF0eraj8Us=;
        b=eIrsUFw9FVqez8fJQA67u+s31NGVuuNdtr/zfna2I2M0dQHVcyLKCrskeqXVW7Rg8C
         YmAi+YiL/6rdN2eSx2nApV6fRBH40FFyfDF66TG3+5McmmZ76deYwp23+Eb43unyEEzp
         BAxHDz/rrzb6Amp3tiOL7+tJzOXq8co87ufZj6euZcyBk3qUCEex9iobPLtc3bSppYty
         xCEkWynDwCzb5K5GOxK9aU9IBgaPt7lZwqxSp7mbcZnY1GElAPu1crWVU1RO41yfwDZF
         6mlj/H0THiY3Pw7IuCIK8tW/Mh1GbIrD8zcp2VaGohfz6gq6+B3clq3rDE9/8x2Mj4i1
         MSzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792687501; x=1793292301;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=CzD89pGzOgOnG8GG0pKfl9YPmTEtR6RkDZF0eraj8Us=;
        b=eTkRL2K57AQnIvEBwbDGzodL/ZdkWKSuV7SGPQDSm9P8S6i+XrqhPa2oWjlYMcYrCj
         ISvvrhJeVm10Ld/IHP+KWmqvp2FhKcPXwTPbPc4xFQqlOE7sAy6rPOPyCEaeY9Lz9ZIE
         OwjIj3ZKmLs1VO60wYrl1V5U6pAsWORcNK8nu2Y9/VlClfNxyBiA17xKMD96lKuzgtuV
         B+PFFbJQ7AqSRAjIPQqWC2Yc/BC2tn17u9FBO+nr7eUQRH5T4QchDswEJzhWLuwgz/Vd
         l1By3jTNg7r0NMvJGTd1XS6uu8Mtlf5yT5yt4t7FMqxgv8SWgsof5QzgNR3puGwvQiJv
         pj8g==
X-Forwarded-Encrypted: i=1; AKwUvBwU5x74nUnlTy7J6SraFWUvGfSRVOFkgq+kF5C+2vynd01fgevk4ec5GVCj/wWi2hLaNqjAoYx5kaU24wBtwntf@lists.infradead.org
X-Gm-Message-State: AFq9FYJq0qF3zWkhhh3wihN3Omu1MStgz1r4rgRyAWB3dhE3PNsiOS2b
	dAQMgycijsD+Ur/aNH8UsYJPTUJnivxpeqaP5Asxs/1WK/J4weuGgMXn
X-Gm-Gg: AYBFou13VwdjC4eyuGJsFSwu7jbMccVFSb4rnGki4/ZorJ3Ai5jUPDGqLn3AabdnGMP
	/Bb/44Q3TUnR2/h0Rt3wwLJMsJmLMx8YHyDe33EMjHrQJ3y0miU/Pq976zS6C8H9TQGJwvm2BXt
	TSEEOHRceLWIMvvSY1FkpsWEaClL64JO+D9uJ1zphzLaVYazYcmq90m/VYCt6UDqUKaTS3eyH8h
	Rza5X3KnNYWUKXhiPTODORM/6UkJWxu8fcpIosyLeyISpZrly4/WT2sX16MLStvETGO4DpCnxBL
	daaFnPMo5lUGGFnoKK+2z2Dktp+Nngj5KC3bSMQpfUbi+uuiDCpMRkU3xSN4HiQWbFpMwjbhwYO
	45W5miRXYW97gmKtI+SkgV0BHfs++5FXoInvEu6IQRRg3wn6I/GPuU4gu4uJvtPGWbZbscRWUJ5
	P7xo9uvC+5XndRPp7mSJ7RI10Bl2ZzGewG6GX5MOpQk4cUKbHWEfTti/JnYmBO2PSNWdbIgFGIg
	GszQPe3SsB6Hq/GzGgr+QUvYFWHboFfS0/+/rB77PLE57bZ6mIoiLQkYuQ2ovjxebTm/iERy6mO
	plVMSrka2apVR7PX0lNYV9ybkJFDTMdxZWWABU+1sWbIvQnjb5q2K1T6ilU7ruEAtbEAenZSRiQ
	bEIzVprnTWac=
X-Received: by 2002:a05:7023:a8b:b0:143:72b1:9004 with SMTP id a92af1059eb24-190a87a3b70mr7623767c88.45.1792687501102;
        Thu, 22 Oct 2026 09:45:01 -0700 (PDT)
Received: from kapoor.iiserb.ac.in ([203.18.51.239])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1903a180adasm15841782c88.8.2026.10.22.09.44.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 09:45:00 -0700 (PDT)
From: Arnav Kapoor <kapoorarnav43@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Frank Li <Frank.li@oss.nxp.com>,
	Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Nuno Sa <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	linux-iio@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] iio: adc: fsl-imx25-gcq: check the return value of the
Date: Thu, 22 Oct 2026 22:14:50 +0530
Message-ID: <20261022164452.201416-1-kapoorarnav43@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <ato7b3ydggC9X0_-@ashevche-desk.local>
References: <20261021225450.628499-1-kapoorarnav43@gmail.com> <ato7b3ydggC9X0_-@ashevche-desk.local>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261022_094502_445808_C2CB9116 
X-CRM114-Status: UNSURE (   9.25  )
X-CRM114-Notice: Please train this message.
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
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

(Resending as plain text, my earlier reply was rejected by one of the
lists.)

On Thu, Oct 22, 2026 at 07:35:59PM +0300, Andy Shevchenko wrote:
> I consider this change an unneeded churn until you come up with real life
> example of how MMIO fails

You and Frank are right. The regmap here is a plain
devm_regmap_init_mmio() without a clock, so the accesses can't return an
error, and the uninitialized-data case can't happen either. Please drop
this patch.

Thanks to both of you for the review. And Andy, thank you for going
through all of my patches today, the feedback has been very helpful.

Arnav

