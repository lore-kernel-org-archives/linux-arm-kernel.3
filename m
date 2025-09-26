Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34B07CAC5B9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 26 Sep 2025 14:07:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:MIME-Version:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=StcU61O7Bduu+n3ctrkb4ORbTcaBshXBtfrgjHAaeAE=; b=sasbK1xabgP4QKgfVuI4vczUhN
	valxlUOXcbWqGgyWUJLM9EOqwc6ETo5eAKsH/Q4HM/Oa7IHIlnfuX08WV//w95Molv+s87bbE/xJb
	ED1AXfqCHQw4x8EMuxOhLp0QPZgMeifEOTpbg83pQsXs02D9uf5md9Qkbc9gtZudJmii6KagPQbP5
	AUw+iR/mdoJ0TkZUgw5elgl0rqsEaaj//pZ4x12swIfWqWrsjz1rrjQGpOrMduIGlSsgVFYxPxCkC
	grN2lHRa/g/DLo6MwzzRUihh21WSvCwxSUDDdBwhsSe9+a4SZ9AVyItYslklAOhk8+mg/kUDAFnWo
	s70DJ1BQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v296T-00000001pMi-3TM2;
	Fri, 26 Sep 2025 14:07:17 +0000
Received: from mail-qt1-x835.google.com ([2607:f8b0:4864:20::835])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v296Q-00000001pJ1-2R8m
	for linux-arm-kernel@lists.infradead.org;
	Fri, 26 Sep 2025 14:07:16 +0000
Received: by mail-qt1-x835.google.com with SMTP id d75a77b69052e-4dcc9cebfdfso374231cf.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 26 Sep 2025 07:07:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1758895632; x=1759500432; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=StcU61O7Bduu+n3ctrkb4ORbTcaBshXBtfrgjHAaeAE=;
        b=ZQKqzBIcFcrdWJH9jhJo6WjTo4lVHi2LyX4/xFbde+0Dp1WaEBXw18pKqHuvxuXyNP
         uInf1Lj+prsH+GD8SPA9LlyZ/wyBWFxaZvOSQYn75ZqEOrSFhAxczwcWhdodbqpbW5IC
         wxE2ZeTYj5iufL1SD0Ow/DqRAlpRNGaE8PKPsMAypEfExSZHEXnGrtrr7HoDLmVPMrzB
         7SjRgokp5uX5peO6v9C4n37wMIZZbldUieVtBJy1NlslVvhuyEbb5L1nz8GAvjW1O9Kj
         KWx4ptb7wLxgtuk8p8liLZtw0nO1B6dEbMLXtLezSDrKtOc3qYGypcWluQLskMJeKosw
         0TWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758895632; x=1759500432;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=StcU61O7Bduu+n3ctrkb4ORbTcaBshXBtfrgjHAaeAE=;
        b=fjJiYz1DPJDk1iA3qlg6Yn51n/DB//D4GMgDeSROxSryN7UchS4hTHzzcg12HCKdv2
         7SvL9EjashLqnVuWTGFAXD9v9K9/mRWx3N8WvP4ld1IQiaj0s6FE9P1iAUrwAXOuFB4g
         6goZYudiO96LpHdWR6hZpBOF7kx45qgdUF2ryAswsfwKT3nu3GRQrGPowW9mH2M/SJvf
         Lcxzllm4vOWyUJlNq7ryoJ5Y2kF/p8anxBhCkc19x5NUJPjIxcSn22Af7z0XspImIQzt
         c8PoCIwwssl/oetd6ADL2gBqepUT2sRNqfuFKRy/5bx48v0Ddzpjdpb0jLcHOwy7E+Oz
         u7Ag==
X-Forwarded-Encrypted: i=1; AJvYcCWUKDVg43F6Hy3eebAe1DJ0syk5rdgF1eFq7sjxAavtjal2/omTTGj57E+fP2sAnYJdVFvZwawgZXQASr7tvT7C@lists.infradead.org
X-Gm-Message-State: AOJu0YysOSR+m2kHzOdmjiU1Jjnj93A7GZBljJaK0Fifo/Kg9dZ0p5/6
	UGFGowp7gbn1Mw860KsxOH/W1kBgCtlq2V8Xnz4dqGQX+UkErF/HBxdMlkVPGxFQSf0a1m55j1K
	WTauwmwu27KT+HMdjTC638iqYUekDxz53rRyy3AIj
X-Gm-Gg: ASbGncv7do9W4DIn/3i85pO87/PqzvBEem4UshYeSUZsKxMb+ELz5ymXrhgamwL4Vjz
	HbU2yWXrbOxurEbWSrTCBc2DSX2GKvCre2McSgGgiFzyf6YenIG66Y0nrJucLKDkCuE3WhlmeI4
	vi7FPhnEN6w9s6R/J2tOF2LNvSbS2UEgQyZdm56nn4gHwecQvQXzfJ97hvrhO/uhhZYoK2Dbh+I
	QbrTQ+p2MQ0vLbp6ZJkagOUVHUs/v+k5qA4oxUq
X-Google-Smtp-Source: AGHT+IG58XmVVP4JYJU1AfrUfvapvQBotoDRlseFBHxJw51RyRcpKv6Ocibos4E3WKcK0v3GK2U8+crTo++BhUDtQrU=
X-Received: by 2002:ac8:5754:0:b0:4b6:2d44:13c4 with SMTP id
 d75a77b69052e-4dd1814d82dmr5668941cf.10.1758895631929; Fri, 26 Sep 2025
 07:07:11 -0700 (PDT)
MIME-Version: 1.0
From: Mostafa Saleh <smostafa@google.com>
Date: Fri, 26 Sep 2025 15:07:00 +0100
X-Gm-Features: AS18NWDXUhX2c5Ql_neW8IBl1rstnr2mdAIs4XtgEZx5rukS5nC-KjFNy7VgTYk
Message-ID: <CAFgf54oYjUEg9KkQUzneYTZH1Z8cX56va5M0853eWPFaYT+Z2A@mail.gmail.com>
Subject: Support for Rock PI-4b
To: devicetree@vger.kernel.org, 
	"moderated list:ARM SMMU DRIVERS" <linux-arm-kernel@lists.infradead.org>, linux-rockchip@lists.infradead.org, 
	open list <linux-kernel@vger.kernel.org>
Cc: Rob Herring <robh@kernel.org>, krzk+dt@kernel.org, conor+dt@kernel.org, 
	Heiko Stuebner <heiko@sntech.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250926_070714_622031_572E3CC5 
X-CRM114-Status: UNSURE (   9.57  )
X-CRM114-Notice: Please train this message.
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

Hi,

I am trying to run Linux[1] on my Rock PI-4b, which I see is supported in
the kernel in =E2=80=9Crk3399-rock-pi-4b.dts=E2=80=9D.

However, compiling =E2=80=9Cdefconfig=E2=80=9D (ARM64) and flashing my Imag=
e doesn=E2=80=99t
work,
It just hangs before any console (even with earlycon), I tried to also use
some of the vendor configs with no luck.
I did some research and found that [2], which indicates that the upstream
support has been broken for some years?

Has anyone tried to flash a recent kernel successfully on it? or any
tips are greatly appreciated.
Otherwise, maybe it can be removed to avoid misleading other developers
(I got this board to do some upstream kernel development on)

[1] base: 4ff71af020ae59ae2d83b174646fc2ad9fcd4dc4
[2] https://wiki.radxa.com/Rockpi4/dev/kernel-mainline

Thanks,
Mostafa

