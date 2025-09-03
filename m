Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACD38CA1017
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Sep 2025 02:10:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t/ulgWiFwR6WnPcNdoSAtJQKq5PncNuo7vNG7WHcRgo=; b=PnbmLx64g+zi0vw4vx2jti3yxn
	O5r9Gv2/pMAzZgj40ziYi2mmta2tL8eUJGYb2bMtwUGnR8vxmCRx1qN+kn/aYXw9N4/di4hTm9vj6
	V6gwosJtzX7YcpvJZ9s0tZF+BAoBcDNwkmD8xNkbaToQ0Vpqm5x1rgGpnQmpnlzCyMGe5rv7eYKrY
	JrCWoF1mNhAXTDsbTDOH5cLbs4UZVmWVdLVZ5gIeJE4dSFkPm3avi1OLzw/S4e+4qKcmY2GY6g+oQ
	M6U/ugeLxM0tvy79eXBH+90ChNUhKl+OS7cvWlDs4qLHFA/TsAfeRQwluMLTBmHEXXQRdZUMTqs9u
	+HoR7ZaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utzQx-00000008F13-4A43;
	Thu, 04 Sep 2025 02:10:44 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utubW-00000007cUs-0Qyz;
	Wed, 03 Sep 2025 21:01:19 +0000
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-77250e45d36so337414b3a.0;
        Wed, 03 Sep 2025 14:01:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756933277; x=1757538077; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=t/ulgWiFwR6WnPcNdoSAtJQKq5PncNuo7vNG7WHcRgo=;
        b=fC8NfEVQYXGKC0EUEBHn4OsTez3bXrhkppO5RhAWUu7SiwcIyt73pIAcXkVmECQBok
         UsXtavH/i/Vq9mYCnPE6srmCHnPolre3rL4WmbA2X8HyWbzQqrypbRyIBqfVPdFp3CIU
         /5Vqti8stAIUSFpWL65XwOxOUJ8HyKTncsODUQ5ZiysG/TPsTYJaD5XU5gDJb3Js57xx
         FjN5cmrWtrMDlnOWn3/f5Lzy17QgS2LExSfrzKFvI5SVjFoONi+6fEBvrc319dmAawxX
         6+/++unmu9zN9s6oepMZH0UhRBZa6Ik4xNGfk+tZL0BWC05x05GIHIyPff07AR6K0wK5
         jVwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756933277; x=1757538077;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=t/ulgWiFwR6WnPcNdoSAtJQKq5PncNuo7vNG7WHcRgo=;
        b=R2ncgn+QM11VQBVfMf+3/wHkeAms90m4ykSmJTNEO+q84Yz8lTsxpcrKsjEDT53owu
         CpxCekR/Qm8I83QRnmZTF2W4NCp/Q352ej9567jOA+aFyWTzqtgtma/1SiQbKWhFpna2
         nw+MtnWf2p4R9qRddflI2zwy/Sp3M8L+zTwrbmY5FdB++XGo1YOqfGkoZNdlxe2Zw/GF
         M7XttAxtThDdQccO9WqzzHs5BJ+8nlGNVerSej6fcrgZ5eDqoxkVn3/Gjhe1bAZZBy6G
         9ZwB2Pf2G9ZK4gFzXUyuepbhnwgb6nJsP4zTyDcP3LdXIHWBfScSjHleOVcFpfOynHmS
         8mZA==
X-Forwarded-Encrypted: i=1; AJvYcCWLWm6HW0286n3nvqAD/YVY1nrzM2fOIo0Txv+iltpjOYJu5HtT05L12xklbpmBoCbhp67/mQ0GeK4OtZ6lm2k=@lists.infradead.org, AJvYcCXN5JamSa4rekGnDw6tmESia6MRLgyUz3kWyCI9sDT/UBdNe+RO/1xTGC7xo1MTSrVM9qAWyzxtkafo7SaqTTYj@lists.infradead.org
X-Gm-Message-State: AOJu0YycwsExmlKVbg9XQvaTNgV4Ni72IaGXH8iO+0peTBW+egW8buhb
	E0ChQxHuHLdN4LsW4b+61+JmA9Jqol6RPMWqce9vRz/nmCT7gk2Cf8pT
X-Gm-Gg: ASbGncvujHIdUvxZuulktPQ7T6EOo3ZBGkebF0Rr+9KAif4KUFASM9mizCqyZJ9E9lA
	f0uwSRoPOB3EeodR9C42TMVnqndrX4SNbza2qUirwGBGlHQWAE+jU/O0CHrKtyxh5cARKPMexGc
	f7rP30XSARvGWraHvwdpXO8a+UDu/OceF+QcjyQOE83bUzhYAo+0V675+fAvVnsw3Fl+BoTAQft
	dIQB8qATJVpzZa1/edsWWzJmGN4vp9zos5u0VTQyhCTswzbNhgFrzacouQafJaBH2Hq6NSe27AB
	BuxyTJil1L7Mma0GMs9tdFlnFhdhWJ/nMZRoBNFAYaEEhhEdOpB9Q7kfaqciWsHN7NNU++B4MV2
	2aMGJjSdU2dUO7ALD/gLjPH9YY+ljQnMb6EMvel0vyIw=
X-Google-Smtp-Source: AGHT+IFmpCYt7p1ydoAkbSRULtTV0VpiAIvlL44IcB4e4sl/UMWQQ2dm1zJl84YOPMOhIdmIlupGmA==
X-Received: by 2002:a05:6a20:5493:b0:243:78a:8273 with SMTP id adf61e73a8af0-243d6f8b258mr23472656637.57.1756933277061;
        Wed, 03 Sep 2025 14:01:17 -0700 (PDT)
Received: from localhost ([216.228.127.131])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b4cd366a909sm14914404a12.52.2025.09.03.14.01.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Sep 2025 14:01:16 -0700 (PDT)
Date: Wed, 3 Sep 2025 17:01:14 -0400
From: Yury Norov <yury.norov@gmail.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Heiko Stuebner <heiko@sntech.de>, Andy Yan <andyshrk@163.com>,
	mripard@kernel.org, neil.armstrong@linaro.org,
	andrzej.hajda@intel.com, jernej.skrabec@gmail.com, jonas@kwiboo.se,
	Laurent.pinchart@ideasonboard.com,
	maarten.lankhorst@linux.intel.com, rfoss@kernel.org,
	simona@ffwll.ch, tzimmermann@suse.de, knaerzche@gmail.com,
	devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	Andy Yan <andy.yan@rock-chips.com>
Subject: Re: [PATCH v7 1/2] drm/rockchip: inno-hdmi: Convert to drm bridge
Message-ID: <aLismmDJfusG0x0Z@yury>
References: <20250903110825.776807-1-andyshrk@163.com>
 <20250903110825.776807-2-andyshrk@163.com>
 <5255838.1BCLMh4Saa@phil>
 <4ox7yh3i47odinoaalzjz7d3gvx36bxbaspo6qfvvvl3jqhdiv@24ownjco3ud2>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4ox7yh3i47odinoaalzjz7d3gvx36bxbaspo6qfvvvl3jqhdiv@24ownjco3ud2>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250903_140118_145026_6ACDE329 
X-CRM114-Status: GOOD (  23.80  )
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

On Wed, Sep 03, 2025 at 03:30:47PM +0300, Dmitry Baryshkov wrote:
> On Wed, Sep 03, 2025 at 01:59:51PM +0200, Heiko Stuebner wrote:
> > Hi Andy,
> > 
> > Am Mittwoch, 3. September 2025, 13:07:38 Mitteleuropäische Sommerzeit schrieb Andy Yan:
> > > From: Andy Yan <andy.yan@rock-chips.com>
> > > 
> > > Convert it to drm bridge driver, it will be convenient for us to
> > > migrate the connector part to the display driver later.
> > > 
> > > Signed-off-by: Andy Yan <andy.yan@rock-chips.com>
> > 
> > more like a general remark, this essentially conflicts with the
> > big hiword-cleanup [0] that was merged today, as the inno-hdmi driver
> > "lost" its separate HIWORD_UPDATE macro in favor a nicer generic one.
> > 
> > I'm not sure what the best way to proceed is, apart from waiting for
> > 6.18-rc1.
> 
> I'd say, the correct way to handle would have been to:
> - merge only FIELD_PREP_WM16 addition into bitmap-for-next using
>   immutable tag
> - merge the tag + all other patches into subsystem trees. Otherwise
>   that series can cause a lot of conflicts with all affected subsystems.
> 
> Yury, would it be possible to implement this plan instead of pulling
> everything through your tree?

Yeah, this is 100% technically correct way of moving things.

The problem is that driver maintainers are usually not quick taking
this type of changes. In my experience, if we merge #1 only, we'll
end up with just another flavor of HIWORD_UPDATE(), maybe adopted
by a couple of drivers.

This is exactly opposite to the original goal of the series: nice and
almost complete consolidation of scattered HIWORD_UPDATE() versions.

So far, there's the only conflict with the others, and Andy said he's
OK to hold his series.

I would prefer to have all those patches in bitmap-for-next for a while.
If there will be more conflicts, then yeah, I'll follow your route.
Otherwise, let's keep things as they are, and encourage developers to
test their patches against linux-next, as they normally should.

Thanks,
Yury

