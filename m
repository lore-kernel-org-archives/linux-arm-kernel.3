Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FAC5606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Oct 2026 01:34:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=HY6mF/jr;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=N2jPUt8U
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/qjMCagPo43beTdZpO9fjGOooFBNKI+5JsBjceANaBQ=; b=HY6mF/jrvjRPDZXnBrStJiv780
	b8C3vpjVW8htASdzlNoYv9F7xcmVH7JYHS0gRjSLeGJOlIbHq7s/L8+Vq+2rT1jUxfAFEXeXoqJSr
	v5/3g5RC2tQSjM2TKFaD/XDLsIu9TSDR/e0ulW+JroIvBK++coby9zc64lkcFXwKCqiELc+xNUw/8
	eDvjQIGozt5wHp7PHbfUR6sCZv1d7E2qIyYU6ZTLFSVe5QNQvSwtiGAAN+5ZypJLlwLm9vHShVlgu
	k2Olkjh6yGTyqERPbbs+2+jUbIL+4VJeqwInwuEGm1Xh0Ng2ZhZ6p9HpHafszGFasm7u2SWD62iT/
	IHhVvbrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIyjh-00000008caF-2K2i;
	Tue, 20 Oct 2026 01:33:53 +0000
Received: from mail-dl1-x122f.google.com ([2607:f8b0:4864:20::122f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIyje-00000008cZp-1FOL
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 Oct 2026 01:33:51 +0000
Received: by mail-dl1-x122f.google.com with SMTP id a92af1059eb24-15dd124bbe7so5061938c88.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 19 Oct 2026 18:33:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792460029; x=1793064829; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=/qjMCagPo43beTdZpO9fjGOooFBNKI+5JsBjceANaBQ=;
        b=N2jPUt8UBpgXJkdwgRAeuwHHsV29bafSH84qWeiweAlKfJIxEcjn8EGYOSTPQL8zqH
         pZbytjmTwIJSW0pEzppLrySIJLyNdL0fPE0wBiVLWk7XaQuYOGkx3xb05hh4lvmistOK
         a/XM4AEEt3RWTZocejO6HLv4YGlwdTKJ8GZaU9TMWC+J971imPqUWOCfjPuZUu4IQF97
         +QIH4lLxuQnZuSx+Rri896JclBwMUi54uijzmp/F5aHt1NjbKP9JWrO5E7/yBmOfbdQZ
         +9T9tAD9XHWpyzv62oKqK6xlECllgWQm7JVjBL754MmQyWjX9rrZRsbksy1dRO65DM/Q
         HPvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792460029; x=1793064829;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/qjMCagPo43beTdZpO9fjGOooFBNKI+5JsBjceANaBQ=;
        b=iTI4AkkT0h37xKGAIBMchpGiHWZhiVhe07OmncSPXXucRzXtwRlwVXY76hAtq7TMVI
         VqA2nJeXE8ctwOBY+IW6yLJLrG3dQieXMQ02YqcTTBgdRwCChUz2Nt+ATDhFf2fkKrMG
         36DYBhtaZQ/Ld5wiPxWWNUNIyqaxbqCp5x8W+6iZUggiYXMnzDWOKUwcXCiyK7HsVhGA
         l5/fhgp2w4KMq3/w/+aPbhtkA0GNOYtDMcnjNLfGnkea87jWYxPw0pZ2cWinh54my+8n
         gsIYRbBe4XyE3/Lhyig7q3hcMmF/YZv0/cAFKfqXtsJVmyPJsZ7yDnUyY48vTcl91fFz
         8XMw==
X-Forwarded-Encrypted: i=1; AKwUvBwBTR3nLdyzJr4Nv9ln0m/kbo0oighSc27Ke8bxqOSSsNFwbEJgRdUpYfwG1L3rKD7bRoIsDcO7bqkY+ARz7eH0@lists.infradead.org
X-Gm-Message-State: AFq9FYIoDVNlHWihhT7LuiSwNyETx4/QkHAKv+uDBGXQA4IQnKgeyp3Z
	its9ZNSLPLDQh8asKGWE+5ITe2qrWlh+Ai05q2Ih60ToHjwkEcZg5tzG
X-Gm-Gg: AYBFou3vt0AfSiSbyjdvedBUA+ng5c+DdZgNWxPqbFPXx5H4RAV6LrwJ3T2lwxCF/0i
	XCpnGbDzAgqehPj6s/OCMFa3uZdewN3IOoZEttEgGrmL05fK51FXxf5zlWyXuDGlaQRFxaCkkTI
	6TbROhUnCnJCFxHF38bOtz0IkB12EzJiyJvL4TbgJpOPKRopOg7M8zBZaBbP/kd18cm6Ikn066e
	xJC429EsJcJjV/cMWXKpZzYJZdCiYn1SOUNbxu0WGgqrwsJfNJBm4i+aexFuLiAZupmJXOwxlcV
	1j+ytJFSz+5BmznzKoUn3vMcArV+Y9zDI55gUm0ZzGX4YFdy0/S24T0CKd3YTZLiHMgP52Azr9/
	ddidPNsJpZGdlnJADT08HhLYkLg7U/Ag16SREWWTF8HGiXTci1XaarX8Q8LzSXEyIGi7NLR8Iev
	vPdmsf5v67Z7IS7wPmpIXvNeCQIVETEGcDACaFV9Lga3ajQYN3QY3CmqmxMN0OmGY3VWWMW+6l7
	1sukoE61jEM
X-Received: by 2002:a05:7023:d0b:b0:186:4a57:94e5 with SMTP id a92af1059eb24-1864a5796e5mr13543435c88.34.1792460028740;
        Mon, 19 Oct 2026 18:33:48 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1831c5cb39esm33881194c88.22.2026.10.19.18.33.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 18:33:48 -0700 (PDT)
Date: Mon, 19 Oct 2026 18:33:47 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Igor Velkov <iav@iav.lv>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>,
	Chris Packham <chris.packham@alliedtelesis.co.nz>,
	Gregory CLEMENT <gregory.clement@bootlin.com>,
	linux-watchdog@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] watchdog: orion_wdt: load the pretimeout counter
 on Armada 370/XP start
Message-ID: <8f2bfa5c-0e53-4a84-b6bb-795c2c4e1475@roeck-us.net>
References: <20261012-orion-wdt-suspend-v2-0-f13cf71443ba@iav.lv>
 <20261012-orion-wdt-suspend-v2-1-f13cf71443ba@iav.lv>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261012-orion-wdt-suspend-v2-1-f13cf71443ba@iav.lv>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261019_183350_341285_7D004863 
X-CRM114-Status: GOOD (  11.81  )
X-Spam-Score: -1.5 (-)
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
X-Spam-Status: No, score=-9.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, Oct 12, 2026 at 03:46:56AM +0300, Igor Velkov wrote:
> From: Igor Velkov <iav@iav.lv>
> 
> armada370_start() enables TIMER1 for the pretimeout but, unlike
> armada375_start(), does not load its counter, so TIMER1 runs down from
> whatever value it holds and the pretimeout can fire early. Of the boards
> that use armada370_start(), only Armada XP and 98DX3236 describe the
> pretimeout interrupt in their device tree.
> 
> Load TIMER1 on start the same way armada375_start() does.
> 
> Fixes: 7a6b3d8a432d ("watchdog: orion_wdt: support pretimeout on Armada-XP")
> Link: https://sashiko.dev/#/patchset/20261012-orion-wdt-suspend-v1-1-1676cb79e29e@iav.lv?part=1
> Assisted-by: LLM
> Signed-off-by: Igor Velkov <iav@iav.lv>

Applied.

Thanks,
Guenter

