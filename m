Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9BECE7718B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Dec 2024 09:53:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z3kIYYav1PvSjIUXIDnTln9if7PNCtkeq4PzpUXJ76o=; b=PI03daKlDqNNcwOWU+XcT79fnz
	Zp9Liy3SNGLqWOnxWOHRnKrOwIs7bwSC3mj2qYqShRZ8XS1uMowFhbXXhnSgymV9jpFy6E4PLl4FH
	261ASg65T2ZPFHdkL8YwS/edNtQJkktI8wzxabveBaxlFIHP6789kCLqPWB6AYL6JXtolDiaZrvPM
	sXd2rttrL6oXZkd4olWq/z+lfCQVn4CD4XYU+Fl0vxrubcrw4/ypFG4DdBo0lW9k50+np0jVh10jx
	mfapJuSsoWtxgWOAif2COYeW66Tz7qoLbCyuWD8tDjjEG+Kv7QI9lNzTy3jVBJmKFvZ899cITttBs
	s9BcwjWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tR71U-0000000HW08-0ZMb;
	Fri, 27 Dec 2024 09:52:48 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tR70H-0000000HVqz-3yUK;
	Fri, 27 Dec 2024 09:51:35 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-2166651f752so96311005ad.3;
        Fri, 27 Dec 2024 01:51:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735293092; x=1735897892; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Z3kIYYav1PvSjIUXIDnTln9if7PNCtkeq4PzpUXJ76o=;
        b=Pl9CfdeoAdgm8sikRjtOybk3Tl4ngqlVmfbu+CRrq15EOIW4wv5dM1eGBVD8Ii04m1
         v8nwCc07hd//jIP2g9pwkAGWccAow2nc/6P1X4Mp94iHUekjPsAW6NKgfK5tuB+/CRSs
         aHwNxoQLZNPnPhsAc7LxMYurXKeExCHGstt7Ey7cZA4H7Y0P55OEs3ai+iWWM7TmnAQM
         SZ0Jiop5s79YLdyIWvGlqegIo7NokLtg0W6j5LBuMVUwRTT14JKxEc2DJJ9aJesNZyOS
         gOyZhtUk/cs7b675bCTj32adHQcexEUSJa/qbdfx4gw9XvJ/Urzi61mjdjj2rXlCqgMQ
         XKHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735293092; x=1735897892;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Z3kIYYav1PvSjIUXIDnTln9if7PNCtkeq4PzpUXJ76o=;
        b=B50itdH/R5JeMXfiDdimxr9Wlby7jKhcRDPL3Rhcr1Kk2K95maqybdHyUMgYzqC9Ck
         asE67SdU/btaOMd17yU738osMTXhWS2L13iWQ52VfUzaOJye5mKr/Cz/NeqDpi3XqxW/
         bJRZ1QjzVVbJ/D/CPem1aGV/vl3Riorp/Ol/FRY8kL2SooR0wJqWN9OQm4kRhmjXDcw1
         2qJpG4c9+HuNUZ6S7z/v/WF6//81mlwCoj3LV64nGjbZAMJkEKpZFSwheXowDXoZx+U/
         6Xao8yzAGkRSbRXcK13/7q/9ldjK72CmO3usq9kPM8hRBDuiJnVyjVlu/KAEvSTSJJnn
         Nacw==
X-Forwarded-Encrypted: i=1; AJvYcCVIXybhMryiNXISLhE58j4yrMDVJQdV5seWsjT5IG5wvkj9g4xoy5BRUdAg8gRwS8hm3fm/wmBOyuuPVw9l0Ng=@lists.infradead.org, AJvYcCXwfhz2rsxIU1oHTONO3G1syy7agH0v5GDbdVPTMTYmAT52zrXDDj4jOUMM9KV7vFx7sGBMXIwNU6qaxgnyugtr@lists.infradead.org
X-Gm-Message-State: AOJu0YwfbbHhF5coddnlSpnslnLh1iRss//2nGkPyxblckOdP9WGmd0v
	SRI/GGjv/csPBESXu2h6GbA6LQqZWe4Jo3xFTRHiOpKsRTSCoXxy
X-Gm-Gg: ASbGncsRcXWUriDn5pJoLjEbtiqTahXrx3s0lpyjNBEnShGP/gnGr/MaoftlhGsYXc5
	NSsIrHZNIi9fqRLKcwEKxH8PwBgxx0UEdybSH0GC8EkBvON0tK9Dx4LwQjLF3hsXmhlPjkiYP/R
	6e9lMaFMp/8C73gqOEXz81oS5gzEsIzVtEumr7/Gz9QVvVMbBTa8k/RyIl2yiKYqNxiQkuRMIt5
	saZ3RjhI2wdN4kwXmsKTJvuX64s/fH0G385SKtbdvfoqa67PiTR0iE=
X-Google-Smtp-Source: AGHT+IEVi84xuzWlTMjO2IGoIG2twBfofQsLs9LiHnpA4f3sHHWIHQkG8qFuCXh50GuernODq6lMuA==
X-Received: by 2002:a17:902:d4d2:b0:216:31aa:12fc with SMTP id d9443c01a7336-219e6eb5bf4mr327982705ad.24.1735293092447;
        Fri, 27 Dec 2024 01:51:32 -0800 (PST)
Received: from Emma ([2401:4900:1c96:94e2:5054:ff:fe53:2787])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dc9f518asm132439505ad.198.2024.12.27.01.51.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Dec 2024 01:51:31 -0800 (PST)
Date: Fri, 27 Dec 2024 09:51:25 +0000
From: Karan Sanghavi <karansanghvi98@gmail.com>
To: Markus Elfring <Markus.Elfring@web.de>
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, Alexandre Mergnat <amergnat@baylibre.com>, 
	Angelo Gioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
	David Airlie <airlied@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Shuah Khan <skhan@linuxfoundation.org>, 
	Simona Vetter <simona@ffwll.ch>, Sui Jingfeng <sui.jingfeng@linux.dev>, 
	LKML <linux-kernel@vger.kernel.org>, CK Hu =?utf-8?B?KOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
Subject: Re: [PATCH] drm/mediatek: Initialize pointer before use to avoid
 undefiend behaviour
Message-ID: <tte6ad3rxle52x3wndewyyrnszozghvpxktx2x55w26rdcea4n@rdbhzpx2wi3p>
References: <20241111-uninitializedpointer1601557-v1-1-7d03668e8141@gmail.com>
 <8a5bdda5-5e2a-4b73-91a5-849b6060e7df@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8a5bdda5-5e2a-4b73-91a5-849b6060e7df@web.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241227_015133_993422_C3D2CD7B 
X-CRM114-Status: GOOD (  17.09  )
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

On Tue, Dec 24, 2024 at 05:09:54PM +0100, Markus Elfring wrote:
> > Initialize the pointer with NULL as mtk_drm_of_get_ddp_ep_cid
> > function might return before assigning value to next pointer
> > but yet further dereference to next can lead to some undefined
> > behavior as it may point to some invalid location.
> 
> * You may occasionally put more than 62 characters into text lines
>   of such a change description.
> 
> * Please avoid a typo the summary phrase.
> 
yes sure. will keep that in mind for hte next patch. 
> 
> …
> > ---
> > Coverity Message:
> > CID 1601557: (#1 of 1): Uninitialized pointer read (UNINIT)
> > 3. uninit_use: Using uninitialized value next.
> 
> May such information become a part for the final change description?
>
Ofcourse, it shouldn't be the part of the change description. Thus i
have added them after the '---' due to which it wouldn't be the part of
the commit log (that's my uderstanding correct me if i am wrong). If it
still adds in the commit log do let me know as it hasn't been added for
other patches. 

it is just for the reference to understand more about what the error message
is generated by coverity scan.

Thank you,
karan.
> Regards,
> Markus

