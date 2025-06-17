Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EAD0C71157
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Jun 2025 20:33:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ytge0DvQREpsX3FPr8UiIpU+73HOBfPpUENAsXp5RGw=; b=kV7eTQKoCxGSWY9MetCBLsW7nZ
	NOTzef3TFcyliOLq9GhVEyGbspH7+lgFG2UgwCXRtEisee1i7XCDIRBdnftOZPHoIZ+u3H9kWDoAo
	qTvY0JFTPvyy0pM87anrLrU57fPmtWX9W1CCugyr/Mt82/e/CFCDR4zaGE8Pzixsho4izxLHowVRx
	2vuW7f8y0seL4vSxpC6se/rDzZ9xSqE2BPWUPQhTBtDJRRawQjhCwFx7mz2F7b03CUz3FdQs4qrc1
	grPnJcKgzYTUMz+WRKKxzeFKlLJJmhYMB7UvDx9lYCFvI2fjwQbXOtZkDnCo8/zomjBCqdhy8oB4Q
	GH791zEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRczU-00000008Lyd-0wUk;
	Tue, 17 Jun 2025 20:33:08 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRcxJ-00000008LqH-06sS;
	Tue, 17 Jun 2025 20:30:54 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-23526264386so61134605ad.2;
        Tue, 17 Jun 2025 13:30:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750192252; x=1750797052; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ytge0DvQREpsX3FPr8UiIpU+73HOBfPpUENAsXp5RGw=;
        b=iW0maKkM9urvr2+piZVaq3vVC0Q8PUwAwschA4WJvjsWYkAUAkFEc3oKqgTL7I6VtN
         +yknvySUQv5tL4HXtxuQk5XJjBTY5RSXjQcQ04tTl0fiFEZeHUHfs2YICJ/3Kmlg8lth
         Wu4m7oLL1jc188NKcl5zwXcAOQaZITUh74txm6ZOPqehWU6fKYuQjNC4jZNHdeikPlkb
         6Lb/u3OdtQnirS+Au/bIJ9xoE5diOn+hVEHja8biFZjg1lViJIOFKk51Yk+S7twjiH7h
         DsHoFgii6C85NE/zgvfd147jaJYv68CkHLVRukL7eqWy0z1wmAw7A8ZYhelopByxet4L
         6lQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750192252; x=1750797052;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ytge0DvQREpsX3FPr8UiIpU+73HOBfPpUENAsXp5RGw=;
        b=hm74tm26WJ1uDdwmIt4MUbqeCFIvmDz53unleWJ+c1ioHUwkxQiczXkOzG3fPyZw+e
         25B07JypCEUHExjoc2tL2B27RFyEimCrXfFoT6OmENilIkYXidGje3Q27r2L/k6dHzhd
         E9OJYKNSEYlYxAxHYwndCWwAkoUqRXwjYEtO4e2wo0w+4CgR4TQ9r3WrMtcKLrlRBS7b
         7EHjgFBlpmxMiNOlLhsRF+PKQE4N+4y8BefA5ps5vKVkXJUbolzVRWwdbppfGBacD+xA
         57ZEhKmrj6LgAcFhuWwE/S8+fcxyAviSWtOqExQDCzVUub+3HAcUiXt+MNwuT1FscwFS
         WeXw==
X-Forwarded-Encrypted: i=1; AJvYcCV5LuzEoy1gaMnT77FXb5fki3Rmb3hrvb9rcLP93ZIZxfprkRsYFw5NmGFzdqzvJ7Q5spjM1zq0t71lfw1ZW+0u@lists.infradead.org, AJvYcCW/jXakIZiNdOQ8/j6bOT5Cnfiy+vHlgYKGjhqSd9gi8k8RgOYTc9NkYURJPX3mKgHuz2iei4Zvd3mFmrygPKw=@lists.infradead.org
X-Gm-Message-State: AOJu0Yz1HTHrplTLgR1La/4ibYMtVIPklCUgAmyhMWpp4sxIkLxZTL+s
	5X8LbI+DHXSghGnLhQkFMv8Deg4c72PkjynjFWUivOlQZzhLwha9P2mn
X-Gm-Gg: ASbGncupP+PHf1UkXUO0S+3PJyoDumEaaHdwyAHkvocOMofzhRjlTLVuPQQeSCX2e0A
	3BV6pszZ1IeQRp42yAhgBf+CveyzK4kqLs/PPLfEhv0DZXgpQIbNntFU7NXPqnoWn+5xgjEI8Jw
	bMj4Facj4VFSgKsluSnx43A/csHhUHlIf8JXCzC0ZOWefxQ0iLd7WjlyJcay9OxSDr2VH5VuPgd
	dBMQjcEsgr0lKKCl7EVGZkMuauGp/P++vWzdkfNoxA7Ocb5c16SguG+5b8F1NVuZB56lAOdRW83
	Wzt+OeQ/gzDdX3lCT2mnnOW4WuyZHtEunq5ItcsWn2tfdWystTk2DO1LM+HSy3A=
X-Google-Smtp-Source: AGHT+IEl1LF76euKDmEK2b2BXIXslDp9/iHoV2XPh1E20bcvG0JJxY9n8fjrWmH0V9E0TDySKBwOcA==
X-Received: by 2002:a17:903:b88:b0:234:9094:3fb1 with SMTP id d9443c01a7336-2366b3c2d82mr257503495ad.35.1750192249605;
        Tue, 17 Jun 2025 13:30:49 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:8d7d:9cdc:2836:83cb])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b2fe1642e0asm9364972a12.17.2025.06.17.13.30.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 13:30:49 -0700 (PDT)
Date: Tue, 17 Jun 2025 13:30:45 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-input@vger.kernel.org, 
	Douglas Anderson <dianders@chromium.org>, "Rob Herring (Arm)" <robh@kernel.org>
Subject: Re: [PATCH v3 1/6] dt-bindings: HID: i2c-hid: elan: Introduce Elan
 eKTH8D18
Message-ID: <zcdks6nwmnahlgp6vvbxmmlbfbafzluuxgb52byiisuoy7ewzu@kao7yhx2u3qt>
References: <20250617082004.1653492-1-wenst@chromium.org>
 <20250617082004.1653492-2-wenst@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250617082004.1653492-2-wenst@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250617_133053_063948_B87EA17F 
X-CRM114-Status: GOOD (  14.20  )
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

On Tue, Jun 17, 2025 at 04:19:58PM +0800, Chen-Yu Tsai wrote:
> The Elan eKTH8D18 touchscreen controller is an I2C HID device with a
> longer boot-up time. Power sequence timing wise it is compatible with
> the eKTH6A12NAY, with a power-on delay of at least 5ms, 20ms
> out-of-reset for I2C ack response, and 150ms out-of-reset for I2C HID
> enumeration, both shorter than what the eKTH6A12NAY requires.
> Enumeration and subsequent operation follows the I2C HID standard.
> 
> Add a compatible string for it with the ekth6a12nay one as a fallback.
> No enum was used as it is rare to actually add new entries. These
> chips are commonly completely backward compatible, and unless the
> power sequencing delays change, there is no real effort being made to
> keep track of new parts, which come out constantly.
> 
> Also drop the constraints on the I2C address since it's not really
> part of the binding.
> 
> Reviewed-by: Douglas Anderson <dianders@chromium.org>
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>

Applied, thank you.

-- 
Dmitry

