Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB3EFC02198
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  8 Feb 2025 19:20:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Subject:Cc:To:
	From:Message-Id:Date:Content-Type:Content-Transfer-Encoding:Mime-Version:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=9lEsYqWgRDt529xNjU4hFu5Vyvfjt/7+jIaEl8raibQ=; b=h0S3VIcrqmjH3Y3qxmYidP1GmH
	Nxo7rNv9knHVmqBXzLqMvmt69Wck0oGEE4bLHc/Y33tTk/eK+YwGXrJHHFXEP6lKWrgBCFzTzfL77
	Y90FCr+1WCwj8gFjD0PtIe9DeqEqUU9E96+KJtu5G2b9nVtG+F9eMVXlKrJu5aA9C77eO1iHfrA+9
	FGOI4+rnLjolgczwJoYeu2k2/tiOW2s/KpVswmcDgl8zwbDhBufFOPhF57ExPifn9uDVLVkGCQ40V
	+WzY4j6Ub59UZkY86Fe9hjuLwDD6OYweYwVWFVcQTdOOzIEsZQn536+kqC34Gucw5eFkmzYd6OCkM
	WGYeQq8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgqMw-0000000DQXk-4Bs7;
	Sat, 08 Feb 2025 19:19:59 +0000
Received: from sendmail.purelymail.com ([34.202.193.197])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgqLZ-0000000DQJu-1A6l
	for linux-arm-kernel@lists.infradead.org;
	Sat, 08 Feb 2025 19:18:34 +0000
DKIM-Signature: a=rsa-sha256; b=ANSDsMOku8tw4g3MhMNF7FVdF3xhxkcHzQN3UFBNBrGG54WSwwN8GTJWXEYpax351OoQ6SE9z6xLEM+Hb10hi8eTdReoBIZU/KotcT1RZnbDXQP+hBvo745b9pdge7GDyFiT0ITRrOaCcIPBdM5bGYKErUQP/qLDhzn4HNmj5VHv58avhsS7DDYh//W1jJCyzSaGHoRGsNcfHSIyHG4SHIee8QKEVhNl0XQAOLt9hvxm2q7HiNcwBMds/fUmWT8i2zsmi0qs0ffg1agl+ho63RHMhdPBWeN30J7XqkmmJinM4s5vo5ZwyXtfkIFUCOnpw8Al2TYbBK+eSItVOlOnfg==; s=purelymail2; d=purelymail.com; v=1; bh=OhQ+fXCXOE67/Bljde/YBk2XhUW9Cvw2pDZsUUCWyfk=; h=Feedback-ID:Received:Date:From:To:Subject;
Feedback-ID: 68229:10037:null:purelymail
X-Pm-Original-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 1785052960;
          (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
          Sat, 08 Feb 2025 19:18:16 +0000 (UTC)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 08 Feb 2025 19:18:14 +0000
Message-Id: <D7NB1L54MHGG.MHALKBC8531M@mentallysanemainliners.org>
From: "Umer Uddin" <umer.uddin@mentallysanemainliners.org>
To: <wachiturroxd150@gmail.com>
Cc: <alim.akhtar@samsung.com>, <krzk@kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-samsung-soc@vger.kernel.org>
Subject: Re: [PATCH v1 9/9] arm64: dts: exynos990: define all PERIC USI
 nodes
X-Mailer: aerc 0.20.0
In-Reply-To: <20250205222223.613-10-wachiturroxd150@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250208_111833_411477_F5561528 
X-CRM114-Status: UNSURE (   4.47  )
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

Hi Denzeel, thank you for your patches.

> +                     samsung,mode =3D <USI_V2_UART>;
[...]
> +                     samsung,mode =3D <USI_V2_I2C>;

Although these definitions are valid, there are two issues. these will
never compile as you have forgotten to include the header file
"dt-bindings/soc/samsung,exynos-usi.h". Also USI_V2* definitions are
deprecated and you shoulud use USI_MODE* definitions instead.

> +                             fifo-depth =3D <256>

You are missing a semi-colon. (This applies for nodes spi_8, spi_9 and
spi_10).

Please rectify these errors.

Regards, Umer

