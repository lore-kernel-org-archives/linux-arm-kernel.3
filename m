Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2541C369D1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Apr 2025 02:01:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:To:Subject:
	Message-ID:Date:From:MIME-Version:Reply-To:Cc:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=oi2E46jx11E6P8igzC1fG0bFDRSDTXcSRpMpk983nrY=; b=0JYFErFNQO+p20NRxivfun2jtY
	iDcL+UIFVDUw81k1k8Pojnx8lB5fO3I4LxOEFUMZmThpwQsxfS+R0XgmMOKXJqRat8fBqXHTe4qUy
	MNs35OZHD/MfXeLRW/crD6pfDJPQnVyhpA7cA3P6WKTaiqinPy8QpqajvWs9QJY0830FKR0MA3fbi
	4ee9Jtj5G0re8C77t4KsYYBFltkrikfKl5bHBVeSDW2gaA08qMOspz6IUaiqLrvo6c/D4um4fVhWx
	nNY1qj4msoLG+8Q6iy3GQg7sfZB04tKVqFbK+8w07sdMdwWc3Y7TkZRhhN+e5hncb31V6EmrhRvaW
	Cd6EuNZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u88Na-0000000Fk0i-207H;
	Fri, 25 Apr 2025 02:01:26 +0000
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u88Lj-0000000FjrN-1YyL
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Apr 2025 01:59:32 +0000
Received: by mail-pg1-x536.google.com with SMTP id 41be03b00d2f7-b12b984e791so1511412a12.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Apr 2025 18:59:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745546370; x=1746151170; darn=lists.infradead.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=oi2E46jx11E6P8igzC1fG0bFDRSDTXcSRpMpk983nrY=;
        b=LFSzC00eojfHCiwrY7728yikSfVmHCnz/kbfsSbhauQEKli9/XIlW0kNAesgWvt5in
         mhEH4/KvbG2KIbzCuzAjcXa3i0ZNEjVZfByvUqfT3ZzzKH5U7GqU86F86xG+wR+ZDKMd
         ey8OnetWlkJWdd3hizqlJs5QheO1LxfsyWJTN/fpLx1eXEw9uppQGknbVaeYyxYzTTde
         1qYj8guA/tEqLpP+pU3eyqixWobfh1Ty6D1KWXUtVtwtAmSA211zJEM3OAGJHtni5o4G
         LGlnDFZs8JBuDQNJnh9WsLAuInp7K4TOEyGhTZmUfW/3ENHT1ScoSuA/2eM2yDlAEkwg
         dAig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745546370; x=1746151170;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oi2E46jx11E6P8igzC1fG0bFDRSDTXcSRpMpk983nrY=;
        b=J1ec5/YJl5d2O52C2cciHw0HK3UWy1tpYR9HcTFzOJq0Ea1xodlXJJQbnJ0vXp70Fm
         qM3xuNZjecmMXxTR4SZlt6cj8grpy7TyYMZh4ZJ0cpZv9U3Vd1TSXbIOpFkUUHKG8/EP
         VolTCVudBb/dp9sLUdfB5/foH0Z+lPGPtMmisYahZ7Db7JDnY8ZN4jtiSfmvAD/F6i08
         qGZovMYhFCB4R+LSB1KyPbtC4U5DUuBt3xSK/QiJ4EMPO91yS4Fig6J938NrT1CgbHt8
         RlQTKhlSOgsTgJXCXmC1Ad0n2kCHWdjTKRbR7xfwParjGkopnaiBT++D3tuP/TTP7y9i
         AtgA==
X-Forwarded-Encrypted: i=1; AJvYcCUhshq4KkVgIUeo0HQFvsc86mygOlSMQwUBJb0UZBxPD4Mpg6T1zKrooSxfVETa/uhUBnJdsdKYBJ0OhQ4LtkuB@lists.infradead.org
X-Gm-Message-State: AOJu0YxWuZ8O+SD4jMXKbswf87yl//a3J+RKFo+j6+uzquyxYDZoYIqQ
	d3VaQ6CkJ6M43JPQxQ3flMWP+Ch+KLrJvi4p8yrcP7Jpf6UxsuihEWDQSgHog4u/urgT1N4GvKc
	Ljd3kivvtm1X8PpuEQMpTU9FcANQ=
X-Gm-Gg: ASbGncvhXT/yrgRD/ABb6KnFYxB8TwyUwniAyW/QUQ6qxYvqyFoXYPCxbaErZLzSISY
	/iQTIxX57VMq3aE8l4/RV4PrVhRJ2H3eb/C+o+4XrdbJisoP41R0LFSgEPLnJR97vQj76cWywbL
	frwqMl73VFkOxrDkjHcashV09/b5hj6pi6
X-Google-Smtp-Source: AGHT+IE+zVM4WpEuyOpPXj2HuMzgLGXY1M8RKFwF+Rhj/9AiRqxl6HW9J6mp5sKp80FFW5u/q6NHC6lDdZMUIYvZGBg=
X-Received: by 2002:a05:6a21:108f:b0:1f5:7e57:501c with SMTP id
 adf61e73a8af0-2045b9f2751mr579130637.39.1745546369927; Thu, 24 Apr 2025
 18:59:29 -0700 (PDT)
MIME-Version: 1.0
From: Adam Ford <aford173@gmail.com>
Date: Thu, 24 Apr 2025 20:59:18 -0500
X-Gm-Features: ATxdqUH2ucRW9Ou2xib10t4cq9PF3I2OJH1I9z5HZpvuCEak-7VO3uZSElmYo3w
Message-ID: <CAHCN7xKy7w0Kwf8Oyjd6dFLzAhiGiqdaYOj=qfA4kSRthD5Law@mail.gmail.com>
Subject: i.MX8M Nano ISI Channel Question
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, linux-media <linux-media@vger.kernel.org>, imx@lists.linux.dev, 
	arm-soc <linux-arm-kernel@lists.infradead.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Peng Fan <peng.fan@nxp.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250424_185931_411542_DAE61362 
X-CRM114-Status: GOOD (  14.62  )
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

NXP-

I am trying use Libcamera to capture video on an i.MX8M Nano.
(Hopefully, this makes Laurent smile)

I noticed that it has a maximum capture of 1080 lines when I query it
with Libcamera, but the same camera on the Mini can capture at higher
rates.  The multimedia overview states it can handle 1 unprocessed
camera stream at 4kp30 without scaling.  The Nano's Ref manual later
states that each processing channel has one line buffer, and each line
buffer can store up to 2048 pixels.  It continues to describe when
processing higher resolution images like 4k, the line buffer from
other channels can be combined.

Section 13.4.3.5 of the Nano's Ref manual (Rev 2, dated 07/2022)
explicitly goes into detail on how to capture up to 4k image
resolution by combining channel 'n' with channel 'n+1' which implies
there are at least two channels.

Section 13.4.5.1 states the registers are dedicated for each channel
and spaced 64KB apart, but then the following table only shows the
base address for one, and Table 2-6 shows the ISI size is 64KB.

The driver is currently written to only support 1 channel.  When
reading through the driver, it appears to require one IRQ per channel,
so I looked through the Nano's IRQ table (7-1), and found there are
three:
ISI Camera Channel 0 Interrupt - 16
ISI Camera Channel 1 Interrupt - 42
ISI Camera Channel 2 Interrupt - 43

I attempted to enable a second channel by modifying the .num_channels
= 2 value in the driver, and I modified my device tree to assign a
second IRQ (42), but when I query the pipeline with libcamera, it
still doesn't show an available resolution ov 2592x1944 that is
supported by the camera and work on the Mini without the ISI system.

Can someone tell me how many channels are actually available, and
whether or not  4Kp30 video is really available on the Nano?

Thank you,

adam

