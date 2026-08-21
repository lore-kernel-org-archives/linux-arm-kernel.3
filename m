Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1319AC5DF8C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Aug 2026 20:25:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mryiVXJsQPAfn16G5ANn/TmUWuuegZkOuiE8/arXclI=; b=u7Vz8qrryijFeF42LXJcD7W2wo
	/JEqg+Oq+CFPOjHZMQ2qNbVm0u2r04UwmZKVxwWMevasUyYJXgoo2uiCctUAErWVoDdD7rWNDR2Uv
	NOBSR7Mibo4LXcic1b0NsnIofgren1HR+d+T/6354XoWYMmyM0Ht1aidslVr6DKyxfoKz91h0qTqp
	2bQfe4msmP3F45RbCXZnQeiVu0Rgej1lygQn9Cav5TvOcd0GrCqA1FqHy0/sWIjJIxzvEjgPqm01b
	kBIlA6/B3bFheYplCLp2g4GRi7A3BZ3oLKVOJROiJN1ure53ThqRpNrRZ3FKuVaIB6I/t3TLvZ2Az
	fJVwPWtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxVnY-0000000E2eR-3r8G;
	Fri, 21 Aug 2026 20:25:08 +0000
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxVnV-0000000E2di-1XP2
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Aug 2026 20:25:06 +0000
Received: by mail-pg1-x533.google.com with SMTP id 41be03b00d2f7-c9cf07d2df6so935525a12.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 21 Aug 2026 13:25:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787343904; x=1787948704; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=mryiVXJsQPAfn16G5ANn/TmUWuuegZkOuiE8/arXclI=;
        b=DudXl9EjLLs4ZWPb9jNYd81Bmwjw33AvmE1tH+BCgK9qmj2zgsSMwElJlXXQEE6O1O
         a3+ZbawnDRnz6SY6gjo62zqVdQB9x2N3wvIPell/DCqdYFRQrmnVxZL8MRb2cuI++BQm
         t9meqrdqtmiVI1Jer580KNUkt/OoG75hKQz2894ay76zkBj0P+InmjbNKJlbZWFDQhlU
         eAqnySVWnvw6F+YwPd5UwYdBX5SKLKauy2uZLsTWErQhFQaL7Q2g6964mRXV/iVPSexN
         Sx7d1eRTmg7Uz1xk0oyTPeiJ+SniN6i/W2PhJEKR0NrNKIEWWJT0/Wg6uCidcoYUkC/w
         mP6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787343904; x=1787948704;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mryiVXJsQPAfn16G5ANn/TmUWuuegZkOuiE8/arXclI=;
        b=jMy9Vsh9kz27yQ+F/2RuJPtBZoAjDUt6n/GcTcflf+I2+slmDuC3QJ+DJ98scJkHQY
         OtLWSXo5QqPF3i23q1TnV6tLjGPUqtUm5mTKCzAnZ78a9ImFl7NBeV1VdREVrAuHAOeu
         zXBoJgBnfORcFx9pooA6BUPBQYpoa7ugIi6ecHehGcr58Yt6d5wAIXLTZJZ22HJQbLS6
         qf/uVB9B0HZmryZaAoVa6oORKILzvBrLuqr/a7ziOg+Atd2e1bsjADUEydwp2KfGRtnl
         JBSw0ebDQqoexx0nxI270NAB/qt8CpB1HJ5gC6rgLhc3f3BCWSNuJRKT1EDXwntnbeuj
         IKlw==
X-Forwarded-Encrypted: i=1; AHgh+RrYEpa50iRacy51wZz270nAG7+kA6B4NrxRThk0ChyvtPGDOEjtzQiBHj0im83PlyOByzMGfoCc2dsaDVG58oRy@lists.infradead.org
X-Gm-Message-State: AFuF++mN9c+TVccHWSZSRo01ZMQ0ynbo0dirmt5G+z5I/Dn/8eF3kDyg
	l2xmEhpFuYpfIHhWePdRG22iZeGBGcqRKOLiu1IJRT/YHm2lMnpJHIjl
X-Gm-Gg: AR+sD11OdFzOP8EzVKy+3D1sBEBXUXF62NKYBWSfOXX41zyxlyLUIW2zJNWFxVZG7xk
	GEIjdctGwdHte7z7MNzCly0SE06ZonbR8tOday4CpKmRg1xGR4BILXk48vC0RXCv5f00Wk3Mbot
	8huu/SGfyLy1FUNE2ckt2THDta7N/8TYegD8Pe8wmhsX+H9rLrpv0iNMt1NJlWNKkV3jl5YeE9C
	P72H1H/wbEf6B7kdF6xvhRPeVDDDS2D8fwQLSJBelo6ZCcncRFZT5kxwBrDS8GUeyaLcCX5dFqP
	MEfSbOGzLkOKFA9qO/lS5pmVLTTnPVb1ucNlI69sMJjYs5q8F6hD7ykyWi6OytqBRVnc7H+eH8k
	5AIu6/fbMbFvJXboBdoGQ9rBys7OY0owELUjmda4hFYtStJZzoAzHo2b5wHUzSi0yVpJt3wzzo5
	9JmmCuJwKL5j9GDujV1TJBzFu7sQS6yP8MF8M509NA9P9UjNuLhQLp2RpnQb15q3g8NuxFO5zE5
	Am8dtKsQvGe
X-Received: by 2002:a05:6a20:938c:b0:3c3:9c4e:de3a with SMTP id adf61e73a8af0-3cd2febd396mr15299852637.6.1787343903678;
        Fri, 21 Aug 2026 13:25:03 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327bef3cde4sm33854320eec.4.2026.08.21.13.25.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 13:25:01 -0700 (PDT)
Date: Fri, 21 Aug 2026 13:24:59 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Zexin Wang <ot_zexin.wang@mediatek.com>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	light.chen@mediatek.com, Fred-WY.Chen@mediatek.com,
	Yt.Hsieh@mediatek.com, linux-watchdog@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v4] watchdog: sbsa_gwdt: add early_enable module parameter
Message-ID: <9cd5d894-6a70-4d23-a477-71568c032562@roeck-us.net>
References: <20260817023838.6459-1-ot_zexin.wang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260817023838.6459-1-ot_zexin.wang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260821_132505_470506_CAACEDE3 
X-CRM114-Status: GOOD (  18.22  )
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

On Mon, Aug 17, 2026 at 10:37:49AM +0800, Zexin Wang wrote:
> On SBSA platforms using standard UEFI firmware (such as EDK II), the
> watchdog timer is often enabled during early boot stages but explicitly
> disabled by the firmware before handing over control to the OS (e.g.,
> during ExitBootServices). This is done to prevent unintended resets
> while the OS is loading, assuming the OS watchdog driver will take over.
> 
> However, this leaves a protection gap. If the system hangs between the
> firmware handover and the userspace watchdog daemon startup, the hardware
> watchdog will not fire to recover the system. For safety-critical systems
> that require continuous hardware watchdog protection from the earliest
> possible moment, this gap is problematic.
> 
> Add an 'early_enable' module parameter to allow the kernel driver to
> re-enable the watchdog immediately during probe if it was left disabled
> by the firmware. By setting the WDOG_HW_RUNNING status bit, the watchdog
> core is instructed that the hardware is active. As a result, the core's
> pre-userspace handler (controlled by 'handle_boot_enabled') will
> automatically issue periodic keepalives until userspace opens the device.
> 
> This bridges the protection gap seamlessly without requiring firmware
> modifications and without risking unintended resets during kernel boot.
> 
> The parameter defaults to false to preserve the traditional behavior.
> 
> Signed-off-by: Zexin Wang <ot_zexin.wang@mediatek.com>

Applied.

Thanks,
Guenter

