Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3674BC35FF3
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Mar 2025 18:53:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Jt5WSssG+OEvsuPkFz6BZY4vYElG8JeyaALVDa3jMX0=; b=v3QvZm+lVrYSGZEqa8drP/Ow1/
	VuiRWoYxQBxrcuqarEI2Cu8k7ozOzLHjjAe/bUy8g9CAUmz/XDEjlLjHeTWK9X+QdyPgd/2iqGoGd
	Xh6Rfi8EtH5j0ZwYDLTUb2CUXBufbDwZsqW0a964ZrcCWK8ekULKakoeRjGYlqNgn47aedhCPSW9u
	uRea9UWZw82NWHAJU1ysAdKhjxY8W1tjiP7qV59qc1rSJUhY7ahTj0dUCCAshrpVe8NVEZgGAAxty
	QAcDwEAZsecFSyuoVjSxjc3B24S7/VW0dy4mVCGljlBA/Smsah2z5u21QLLYjmapBn60J05eJw+x3
	Soed2Low==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsng2-0000000CElI-2D3P;
	Thu, 13 Mar 2025 18:53:06 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsnKs-0000000CCNM-40nt;
	Thu, 13 Mar 2025 18:31:16 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-223959039f4so28916655ad.3;
        Thu, 13 Mar 2025 11:31:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741890674; x=1742495474; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Jt5WSssG+OEvsuPkFz6BZY4vYElG8JeyaALVDa3jMX0=;
        b=ZL4YkUlJhKeNLQ9v5pQ7LDhsoe3g3nTfrsv8zXLjGAOTBofcJyBbXbKsinaxsc4VsL
         +Ueb38m9Q/Gd4N6AWCH7qggp0z5AdKQ6K07swL0mmH5++BL+HIFhApeaQCX6xTma5kYl
         zjShFmki+ZI0eY7DeoH+APkF/5A5DY5PuDrJYo6WRT/CxYzVXSEyxVPMVqgrGNqxhUwF
         BMRQpBMd1+9pTAgs+j7PaTLa4TcSgjHvJKbbJ97bX6PSRsOCuM+BYlUzL7+FjQPc8cPB
         DUcdsYTD3foUF8W52xrZekgvZwMIvrydXL4mqA8CkgEJZvOY0nwCasXzUUnpkoBVLIUX
         FbHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741890674; x=1742495474;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Jt5WSssG+OEvsuPkFz6BZY4vYElG8JeyaALVDa3jMX0=;
        b=g0whNuGDbR/sXuLJJ1Gm1lAzufRq3rir5N9Ar71EhLF5MJXviMoXuVuz6Kldy7nhID
         l2lm3fV7uqGyvoEkZnCjsm/sHtqM4stzLZSAu+LrCBYqDPITe279v+1cEDhBzd7O7dFS
         InzHC4mS9i3+4eTTFvLl2vjnYxL7Gt1Ex5ejR9x9x2eilNKDaxNz8cr/NIu63vpU584e
         lYwOVQFclBYTGi4g52ocecvSkoUn6TV9fwpXFoEmSSPlwBGoaSFgLrEWB+0IBXwV6/yB
         OlAMRzlslj5rVq2R/XCDF6Bzqo+KdFoX+AsQd42XJgJSxsT2/EKzl4v0cd884T2ycYDM
         OT/Q==
X-Forwarded-Encrypted: i=1; AJvYcCV3u0mkzk5R0Xgx2+7dEovgXCaTuYxzTKM44HB/DZw5FHq3r/LvyqJDsOdDThVdzvoVo0M7Qzph+QPGNqYbE/0V@lists.infradead.org, AJvYcCVEvlYIVHr8h7otkU8Pm42unz90l9XgUU9ZogpMWJvpnwPswxghEUw++NaHdM2s/KzukG1uAdMVF5uEyU0=@lists.infradead.org
X-Gm-Message-State: AOJu0YzzQ+Fvk7PYw3f/QUw+EpWE5wfIsyDbV9PsgklR8RAeEqOGKiLJ
	avW5YnSNNFrukechJDMnFRduNGWV/YYin1kql0GRag+e3RWR1lP9
X-Gm-Gg: ASbGncvTa/4IDwqlVZQoJAxSMXeirzQIV1lrbadepgxD/kFmoFzRlap/JstFuQxKKcc
	S/5vzrBfD5Jvpk122UY5l+7xbUGxLOUK7vjm8dngcJ5bOm0GlG2h4MCrbn2OY8dPDP4n+T5MNCP
	I1n4MIpFV4NxoYGILfAPYc1+fTpR+0B0Jpcx28/WTy767GPP1u7RQN0LlDD2gE3yDL3w5ZkzSKW
	N4lJnRg+g8Tbaaj3qy4OsLUNQp47+aVh4nsuD/yfmEJm+lkTdovPRNnlD+XcT8DWjkp1h7D4aiz
	hFpYkMjYgxjFoLdTrmCcicX2IuD7eb/DRmxkw5Pf8FFLeO52lTC5MbGhAg==
X-Google-Smtp-Source: AGHT+IHUyL3JZBiKaHL1hLSTeQrgywlLwwEUN5of1N0Gy8TC0X3IRTq509SX5+fcaAZt7Xsc6jRvwQ==
X-Received: by 2002:a17:902:d48f:b0:220:fb23:48df with SMTP id d9443c01a7336-225dd8ed442mr5472005ad.36.1741890673680;
        Thu, 13 Mar 2025 11:31:13 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3011926599csm4185647a91.35.2025.03.13.11.31.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Mar 2025 11:31:13 -0700 (PDT)
Date: Thu, 13 Mar 2025 11:31:12 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Maxime Ripard <mripard@kernel.org>
Cc: Kees Cook <kees@kernel.org>, Alessandro Carminati <acarmina@redhat.com>,
	linux-kselftest@vger.kernel.org, David Airlie <airlied@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>,
	=?iso-8859-1?Q?Ma=EDra?= Canal <mcanal@igalia.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Daniel Diaz <daniel.diaz@linaro.org>,
	David Gow <davidgow@google.com>,
	Arthur Grillo <arthurgrillo@riseup.net>,
	Brendan Higgins <brendan.higgins@linux.dev>,
	Naresh Kamboju <naresh.kamboju@linaro.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Alessandro Carminati <alessandro.carminati@gmail.com>,
	Jani Nikula <jani.nikula@intel.com>,
	dri-devel@lists.freedesktop.org, kunit-dev@googlegroups.com,
	linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
	linux-sh@vger.kernel.org, loongarch@lists.linux.dev, x86@kernel.org
Subject: Re: [PATCH v4 00/14] Add support for suppressing warning backtraces
Message-ID: <c8287bde-fa1c-4113-af22-4701d40d386e@roeck-us.net>
References: <20250313114329.284104-1-acarmina@redhat.com>
 <202503131016.5DCEAEC945@keescook>
 <20250313-abiding-vivid-robin-159dfa@houat>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250313-abiding-vivid-robin-159dfa@houat>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250313_113114_997869_E5A8F8EA 
X-CRM114-Status: GOOD (  12.66  )
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

On Thu, Mar 13, 2025 at 06:24:25PM +0100, Maxime Ripard wrote:
> > 
> > Yeah, as with my prior review, I'm a fan of this. It makes a bunch of my
> > very noisy tests much easier to deal with.
> 
> And for the record, we're also affected by this in DRM and would very
> much like to get it merged in one shape or another.
> 

I was unable to get maintainers of major architectures interested enough
to provide feedback, and did not see a path forward. Maybe Alessandro
has more success than me.

Guenter

