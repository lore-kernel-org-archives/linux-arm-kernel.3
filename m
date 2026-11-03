Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C65DB606A326
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 22:18:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=0wz2ZPRt;
	dkim=pass (2048-bit key, unprotected) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.a=rsa-sha256 header.s=google header.b=wkbj4PiC
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=I8As4E/KdAw7NAVfm6INK2XK3D5NC24RXlj/wbGRuO4=; b=0wz2ZPRt9gd9SFoqRGxP1B587B
	RWUjGlw7wY4PD8/e3bRtCk7nFJvtL57rL8FmzwLPmvNcWg+RA0FTQ6pnq4c11tfKNia/fSsszDTmg
	IUzxw469r+vOP/+24fNIqgBpFC8uKjQSUdT41C+OxoZake8ha4M+ltWNqJKT0o0h/dvmMtmpXEmz8
	AijMOz/DQEfqh0ZU3mJ+tqO9E3ZYkT67wTItVSM5PNF4KKHSVNy/gnlNu11ud3Q+txlBXRDqRv+fp
	PGlHuw/E33GisNYMRZlF3mUVLY/wuYeOhxfuVvoTvpc5Ua2RnLXPRZOIGosD3nQxaNwljYj92OHVn
	SURyM3AQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOMpo-00000003pEd-2YJ3;
	Tue, 03 Nov 2026 22:18:28 +0000
Received: from mail-qk1-x730.google.com ([2607:f8b0:4864:20::730])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOMpl-00000003pDD-2FYl
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 22:18:27 +0000
Received: by mail-qk1-x730.google.com with SMTP id af79cd13be357-93f259cdc86so10826585a.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Nov 2026 14:18:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1793744303; x=1794349103; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=I8As4E/KdAw7NAVfm6INK2XK3D5NC24RXlj/wbGRuO4=;
        b=wkbj4PiCXxp0WG3YVkrNl/TeyhOrjCf/1vhNhCWhpJEIE26sxhRSgn36tHiCSfTdJZ
         Y2OqUbGLXr/xRmUMjDCVNxPGHPVRAJARhi8XtKPdbZH1qsH56jYT6OhMNBMBkX2sh4iz
         FCs3AAX1Y8dTRvk0sqrcQxEGFXWBcDYj+EUyreG5sxeUaxhYvXntvYBKlrMshd4r3LWR
         HYyXvVBLfqbW9SaSnyYi2N6Oa+Gslv9dSqtMiA86XZvyWVxcFmpuCDBO7MxkT5uoakg7
         YgGbS++ihlIUFjbmx5dSUapv5+Gk4tpdnsnulU/usSiacqs/WH4mCkSflRY78my2kmDc
         E9jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793744303; x=1794349103;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=I8As4E/KdAw7NAVfm6INK2XK3D5NC24RXlj/wbGRuO4=;
        b=grQnaIMOa5CjBmK6ELZ96C7jPw6GZNsRnT1lomNzwrRwR5jib2K162RvaSR+/xz/lF
         1hpRnAyaE55wOnPEQXWVJvAKXpHgggDyQY+8Lt9AGbFAiw09a6Uan9TYay0s0GXqdgTt
         pW8bWLgSrM64IOn4QKmPfP1py75NlhmeihKzJiv9xvwj5e/9DwK/OblGLUQK0EBoO9Ok
         X1bwNu0B1bmiSsBRyvJBZ1uiaFKuwt8dgqI9HD4kzwqWV3PM+TdBCvcfezpm1YJrFZNd
         7QnfjkmoYHolonJNiJ9tcp8Md3HWEvCAjiTzJ+916CFgu/2wfp1P3+bR4ovDckTs29MJ
         m7XQ==
X-Forwarded-Encrypted: i=1; AKwUvBwHAhqhTaB+a8gBL5q+hrPovuYKh53BY4PofmdZg3z5c+KW4UYzDJ4ww1WL3T8btNZRNQx1NpIyEEU8o6i0cndT@lists.infradead.org
X-Gm-Message-State: APuU4Z8s7lJn/A/SURLR6zcYcy+qpOrUa2HD6i7yEoux3GbNd/CaDRPV
	mMRJ4QriEZSKXnStm6MnudGLK+HBS8x/TV9KpnshwWjsIcFSan8DpilZe8MoyQJ6Dw==
X-Gm-Gg: AYBFou3wk9apoxs2wCO+B0UZ1cQr+TT4a5sFB5TEBWUSnz6hxf3qWmh/05jO5pMCDSP
	Nq3/Slp9WDTZHNv/FipG1PUZ+s5LAsyy8diBG+lKJqsiOzw1uHk+OPyjfL0om8BKmEoYDWg0XIA
	4cpdfsF20pGj3TaCj8OmU5uCETimzvOOXOOafwwA4G8WUbegpZgNmXTzNMJID6eulNrPqNmE2Q5
	+SnTbgD9TVprX6eNwhxGwZHHuK9fk5b6V8lz2CQRpEsPsLgCVE3dvibj9gYcgcAEuHHCXUXFxQr
	aU1KBoUugSj4VYznfo4hIiAZAhrH0pfZiIRY2CwtsWpK3SXaqBl6l11UOtBmNHyZML3/9rutMWo
	29Rd2mgelIy40Gtr2AUOss/5xbDVqAYDNEijoYqEHnclzSgIY2IYa0JzRtJzZ5CZdarnRE1hKF3
	Pr5n3/7cSDEIphwTu3Y5u6Srj5M/OC+03/zmGA/alq5prV5ChkupAhH5TN+o0G7QwR2DFvl6dto
	MhJAUk8GIYpWDkso2zwjWJtTblR+8CjKYZbnblREa4/ckOvUHagMbHhBbglKtTNad6MMq1570cp
	38cM50nWFmq/SN0m07pwAneU5Q8A
X-Received: by 2002:a05:620a:3183:b0:93e:f4f4:346 with SMTP id af79cd13be357-94421796ea3mr2392800885a.39.1793744303281;
        Tue, 03 Nov 2026 14:18:23 -0800 (PST)
Received: from rowland.harvard.edu ([2601:19b:d01:d210::66b0])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-945d47e72fbsm40889685a.18.2026.11.03.14.18.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 14:18:22 -0800 (PST)
Date: Tue, 3 Nov 2026 17:18:19 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
Cc: gregkh@linuxfoundation.org, michal.simek@amd.com, robh@kernel.org,
	saravanak@kernel.org, linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH] usb: host: ehci-xilinx-of: remove the driver
Message-ID: <3c385fb1-551a-4717-a1e8-77b123cec0e7@rowland.harvard.edu>
References: <20261103181722.2174208-1-radhey.shyam.pandey@amd.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261103181722.2174208-1-radhey.shyam.pandey@amd.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_141825_905638_60196A2C 
X-CRM114-Status: GOOD (  13.75  )
X-Spam-Score: -2.0 (--)
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
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Nov 03, 2026 at 11:47:21PM +0530, Radhey Shyam Pandey wrote:
> The Xilinx XPS USB host controller is legacy soft IP for PPC405 and
> MicroBlaze FPGA designs.
> 
> This IP core relies on Xilinx Platform Studio (XPS) and the ISE Design
> Suite, both of which were discontinued by Xilinx years ago. Furthermore,
> modern AMD toolchains (Vivado Design Suite and Vitis) provide no support
> for the legacy PLB (Processor Local Bus) architecture used by this core.
> As a result, no new hardware designs can be built using this IP.
> 
> Nothing in the upstream tree carries its "xlnx,xps-usb-host-1.00.a"
> compatible string, no defconfig enables CONFIG_XPS_USB_HCD_XILINX, and
> the compatible was never documented as a binding.
> 
> It is also one of the few remaining users of the deprecated glue model
> where the .c file is #included into ehci-hcd.c rather than built as its
> own object.
> 
> Given the complete obsolescence of the supporting hardware development
> tools and the lack of upstream users, remove the dead driver.
> 
> Signed-off-by: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
> ---

Acked-by: Alan Stern <stern@rowland.harvard.edu>

