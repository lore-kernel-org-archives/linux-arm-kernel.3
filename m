Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F143C021BE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Feb 2025 04:54:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tuYNKQgyX5O6FR4LUMVu38G3HkU8er1qpaOkfa4P30I=; b=GIJNF9VurEeOh7qO8OCocGZRPM
	+uF7Ty3IgiAhYuF73lyH0Kn9pF+cecctbhZx62BhA/WYUXExGz6tTNlpbrxF3oT4JoSe3cTbkHOCd
	gp8yaq88vcC6J12OS2e/yQcn8EbI8bXmwaJaFmM510s91Q0MjLcAgvqTq2ryaPU2Vono8PGLouWwU
	Gjfr5oZy2JjXLwCDdOfbD8vv8MlA67LhRhs15ssMlDo2GJKPsTviL+nphfWzEgiX3YeCWXIfe5NO8
	MJg0l0BVSbOKfwGjBg6sh6ekIMXDO7wartksn6wnXxJe8CmGbtUKXKIqkmvdwCY13orQoMBh8YBbb
	pMjTHzlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnVud-00000006KND-3bxL;
	Thu, 27 Feb 2025 04:54:19 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnVt6-00000006KIq-1I3L
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Feb 2025 04:52:45 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-22348051cf7so1068275ad.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Feb 2025 20:52:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740631963; x=1741236763; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tuYNKQgyX5O6FR4LUMVu38G3HkU8er1qpaOkfa4P30I=;
        b=RnXQezSgVOoRqZsBcnLFNYHTcYUfpGf9aUclhoreGcnVdCJFklm9JamnMOt8DstoLB
         X57wWdmMBy1u3UFCv1oESzqwodikmt0pKPzb501XK+BwFilAjfFW7Dg2st0jLo+xj7ZC
         q9rN9xpi44JpyHb74Ps63ZrwPMbm/nvSF79PO8QVLtCoJ0zNBV511CYIyiFhroBBC1+w
         H0QerdE4LSEnezXEQD72NjpCDcRZE0p11EUhgfDuQbRnp72asftaYCQh3yA+gN/23NUV
         c9srlwxZYVCD1rpagQ0k7kxAoKPW+EsXjO9hUuY+BefKkBo9Ebd6NcdLjPdUgRnJ+UtY
         Valg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740631963; x=1741236763;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tuYNKQgyX5O6FR4LUMVu38G3HkU8er1qpaOkfa4P30I=;
        b=rlDr2XBRe+ZofGW2Q0ca4sazZMqU4TvM3QedbP0EW9/M/sMAdxbclXycXmZchG6zwB
         WuDP0/vfgauDsjNOAeINT93uNUGHXBQgzwn/RaxsxRHuOTSUtCCLwix6L4P7n1BlwbND
         lNhU7436hvMmD+LT+tKp8LVG/tulWOQ66rZJu2ebT7ZcuwUcHceyqBEb1xvxxLwCaoom
         DC+nDR71BGTjQGJYPOK41rNWJ8PwbaxN1a0644DLixIoZoTti8iriaXB6ZtZt5fsUuwW
         kKpT7wGTHyNaQZcWANPieXuYA0l4IRS1U6ehlDu0IdTKG0FkakoliwlF0xJ+SxcZQ4/G
         2XDA==
X-Forwarded-Encrypted: i=1; AJvYcCWdS//o5F3ewVPVq6C8M1YDGFJFsRe4x6pOxLK7irb6cj59YcWQd79ADuuyPlPrG/sHhtb0iNivByXHEJiAOqFo@lists.infradead.org
X-Gm-Message-State: AOJu0YyHvG23/a/Re2e3lJ6pD5usppfHmjMaO4G41dYLFD4pnwoKwMen
	svd4Ko1U+e3/aAhgcGz/ACk51s9jf6NfDgN824eaqoFheY7QFIHz
X-Gm-Gg: ASbGncubok6j9zb8XekFFYw3mOOE3IA6kQylhB9bCyxJAqDNnBIE5SlVEB/kCo64cQw
	sRXE/xdvKT4GIaY8fhSh5+hm2hs44FObLoCdS+yWbpEYdyifjMykr8ziEhftz8SZwPamlHJXIge
	bWQyitU84N2gWaexbU8D1bXoIqu8zilXkVbuxKBa1S+Zt2MS0kWRLDrsvh/oOwbIEqLe3uGosvz
	jvc8Zgvg4Xfrj6LZgRiqfRGV25se1Tga42XnS/xwDuIbSaJbgMB0U8P+uCN1MDdU0/uz+tiPkM2
	rKWWe5B8FqpbN1EpyS1ektP0jDFxbDQ=
X-Google-Smtp-Source: AGHT+IFOTe85+dVh9Nr1Nayx3OAw0R9L2wT1EgUsr9R1XRN4JWbVGSkLM9SWP8BSj7wZqZPgFTcRFg==
X-Received: by 2002:a05:6a00:641a:b0:734:3d2e:18b1 with SMTP id d2e1a72fcca58-7343d2e19b4mr12435868b3a.2.1740631962677;
        Wed, 26 Feb 2025 20:52:42 -0800 (PST)
Received: from rock-5b.. ([221.220.131.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7349fe2b7d5sm535629b3a.6.2025.02.26.20.52.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Feb 2025 20:52:42 -0800 (PST)
From: Jianfeng Liu <liujianfeng1994@gmail.com>
To: peter.chen@cixtech.com
Cc: arnd@arndb.de,
	catalin.marinas@arm.com,
	cix-kernel-upstream@cixtech.com,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	krzk+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	marcin@juszkiewicz.com.pl,
	robh@kernel.org,
	will@kernel.org
Subject: Re: [PATCH v2 0/6] arm64: Introduce CIX P1 (SKY1) SoC
Date: Thu, 27 Feb 2025 12:52:36 +0800
Message-ID: <20250227045236.2830419-1-liujianfeng1994@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250226012136.854614-1-peter.chen@cixtech.com>
References: <20250226012136.854614-1-peter.chen@cixtech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250226_205244_346423_20E5BC2A 
X-CRM114-Status: GOOD (  10.75  )
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

Hi Peter,

I'm really happy to see the linux mainline upstream work sent. And I have
also reveived radxa orion o6 before the Chinese new year. I have heard
that CIX is testing vendor kernel with ACPI. And now the mainline upstream
work is based on devicetree. I want to know what the upstream work of CIX
would go in the future, are we going to toggle to ACPI instead of
devicetree?

And it would be good to let outsiders know the plan/roadmap of upstream.
For example collaboara is doing good job on upstreaming rockchip[1][2] and
mediatek[3] socs.

[1] https://gitlab.collabora.com/hardware-enablement/rockchip-3588/notes-for-rockchip-3588/-/blob/main/mainline-status.md
[2] https://gitlab.collabora.com/hardware-enablement/rockchip-3588/notes-for-rockchip-3576/-/blob/main/mainline-status.md?ref_type=heads
[3] https://gitlab.collabora.com/mediatek/aiot/wiki/-/blob/main/mainline-status.md

Best regards,
Jianfeng

