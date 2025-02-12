Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED1F4C0219E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Feb 2025 09:38:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=28ZrG67VYrx3D1mHBQEW/lHYcFEAj3xmmeyTtjgZ7YA=; b=rcpMx3n22QglbLUVayWwkqw0gb
	Pk842xogRiZSru3nbVA3kjP6k9qV+fzr7nS0G/GBBl/NYwyItU1AcLyPeAwD0MHIQeQhTGN103wn7
	zIiCgb7y6y3xKUhdA32juHM5WwYnBdl4GIkKyTv9WANb4pdT5kP3B+y1+5oYHPOPePXBqu4vxkUxU
	n2X/QgcDDfcGwW7rtQ+5L9rgjJCCW9PdgJq70MmHZ2DSxablJY2xkIO/ke3Av/KAtvsicng4s5H30
	cZsyMHiCAYE5fLhKnWqcJdNd+roJJq4GajGl+ZJMwe+wz83zSeYoNlS7WZp7urSZyYCM/qavrPapZ
	x7HlX4vg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ti9Bs-00000006oXh-3riz;
	Wed, 12 Feb 2025 09:37:56 +0000
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ti97t-00000006nKK-30j9;
	Wed, 12 Feb 2025 09:33:51 +0000
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-5dea50ee572so2305985a12.1;
        Wed, 12 Feb 2025 01:33:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739352828; x=1739957628; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=28ZrG67VYrx3D1mHBQEW/lHYcFEAj3xmmeyTtjgZ7YA=;
        b=AE8Zk77IBlhToicPNEkrRJycxYHAPKOW97Giv8EuM5p204P1DFGIa2wktadjuMiZ1S
         R/BHGQ4NApoycjMXR62QLo1+1OmpC7lmLoDpOzXoDBksCtoNNwvTTbofyAuvpdASGdPb
         MRZPVxuOV+cKEjl5BLVPC4ctZ/sA4/QV6BBbT3KxJ/F3R/Te/0UcpRA9RMXi4WPyKYt/
         UOSLeoLnrHlwcyyAAtKuSLUpYzizrZ3Smwa41+9o5hMn8sgn6THaPkPS3/cnf5HZbH3z
         Vvd90MoBxpquwKArQoqEaxcKOcemr2D+tIoKdN9uHdAg5a57kizAvm6eh9eV6/c6spuQ
         9Vng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739352828; x=1739957628;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=28ZrG67VYrx3D1mHBQEW/lHYcFEAj3xmmeyTtjgZ7YA=;
        b=MC9aHInYmVWPN6XbBXSyKHLIzAdXbQ0J8t166XLAr1QiXo6tFtVwqpC8pStpypvh7D
         m9hNUnryuvs8+ADTlLUUnqUzui6p5jSr8Y2u4A+hBGNTF9c2FCuDOWzftAVScyF/ArC5
         ExrugNANEJZ2LRTjrepYBLWB7kVHbIm2zDp7xXNyVB1lZ0+rFu/60WwbGQvxGAR6o3b5
         58JRB3pM1i+Q/8qfF8h9FOosCT3+CSewXIMYs3ef9Y5ltVeQlpTyGnzNAI/eGYeQv384
         u50iD5Napdh79FdWqgcTdxf8gAImcTQgoM64O0WLWElCelRgnJWyXaJo0bryxbZN8UU+
         55iw==
X-Forwarded-Encrypted: i=1; AJvYcCWRFsTxttO5DF7PBDmYIuwI8GSGxjLU32ecSeaAQJDWbxJUPc/chk8sJxOmW4sfErTDtcdg3blZIS9MDd4=@lists.infradead.org, AJvYcCXFh0gpDJ6ClrXbozWmDSlKHWRHCsJOSr9HYxObxiCQ6VvS0L4I0YnpagdCf02y6EjlggaVQQG11GoYropno/WN@lists.infradead.org
X-Gm-Message-State: AOJu0Yz/Mw6G8sruuZqvfk7EqLfEGb1FkTkMsR7UsBcDNIuH80SlRcrr
	jfppyOepwsH4bm2vk7YJavbcCm7HTv1dJgxpbgqTHWgJJm7uvHs7
X-Gm-Gg: ASbGnctZ1LCPXOqTp5XPukKZ3fIi+jAH94bMMBU5sx7WgWthnNt4R3iKJEhoBN5rfPG
	qtIcRNlpCq3x0GVP77bWVPtjl8BJbD6D+baBQ4KM1gTIyKSNeYa1VaOmGODeqYHo+VZffc32cUv
	1Nyvj1HXlSKcqA38lw0JaQfCH/UKQP6scNSPK9LXvsM08gQX9N0/Z2B+g6OEvf/04is3T3eRCJS
	UwSWua6sMONZfvpba94S968N0b0kzU4tKm+f+SSzjCVUsPnzTQYW3GqzaXe5RccApfZm1w71EIN
	a2GIA6V6OV6VgFt+3uyjerCEsLk1NtBM
X-Google-Smtp-Source: AGHT+IHpqQvjQqIwPaFAzknlkp4GoatkNSlei54PmBgAGgJZumwHx7ny/2UY0zjgf5S9YxNNAfvIdg==
X-Received: by 2002:a05:6402:2344:b0:5db:f52c:806c with SMTP id 4fb4d7f45d1cf-5deadde0351mr1663917a12.20.1739352827684;
        Wed, 12 Feb 2025 01:33:47 -0800 (PST)
Received: from giga-mm.home ([2a02:1210:861b:6f00:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5de51877083sm8949195a12.32.2025.02.12.01.33.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Feb 2025 01:33:47 -0800 (PST)
Message-ID: <479c4ac407207c093e9e7b46cc18fb254f2ca74c.camel@gmail.com>
Subject: Re: [PATCH 00/10] arm64 support for Milk-V Duo Module 01 EVB
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: Inochi Amaoto <inochiama@gmail.com>, Yixun Lan <dlan@gentoo.org>
Cc: soc@lists.linux.dev, Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto
	 <inochiama@outlook.com>, Lee Jones <lee@kernel.org>, Krzysztof Kozlowski
	 <krzk+dt@kernel.org>, devicetree@vger.kernel.org, Haylen Chu
	 <heylenay@outlook.com>, linux-arm-kernel@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-pm@vger.kernel.org
Date: Wed, 12 Feb 2025 10:33:43 +0100
In-Reply-To: <prrsy34bv6xskxu7afgmpdwc7lefdh7l2gtm2ejzcwk74zh6lr@23x3llxy662z>
References: <20250209220646.1090868-1-alexander.sverdlin@gmail.com>
	 <eoeyutuu4mrpsu7snkk5ll6kmm4344qsgbnncss6gerlcvvea7@usuf5v7w5ffp>
	 <77c0db160bcaa7c2a68c04a0d33a561b2834f764.camel@gmail.com>
	 <ccadcdf720d6b1055165f1404fafca9b1c6c54f7.camel@gmail.com>
	 <prrsy34bv6xskxu7afgmpdwc7lefdh7l2gtm2ejzcwk74zh6lr@23x3llxy662z>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.2 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250212_013349_787483_19C37329 
X-CRM114-Status: GOOD (  12.67  )
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

Hi Inochi!

On Wed, 2025-02-12 at 08:29 +0800, Inochi Amaoto wrote:
> > Thanks for your hints!
> > I've completely missed the RTC driver in progress [1].
> > I will provide a patch registering the reboot handler on top of the dri=
ver
> > as soon as it's accepted.
> >=20
> > [1] https://patchwork.ozlabs.org/project/rtc-linux/patch/20240428060848=
.706573-3-qiujingbao.dlmu@gmail.com/
> >=20
>=20
> As far as I know the RTC patch is no longer maintained. Maybe you can
> pick it up?

I can try... If only I can make it work...

> The patch states can be found on:
> https://github.com/sophgo/linux/wiki

Thanks for the link!

--=20
Alexander Sverdlin.


