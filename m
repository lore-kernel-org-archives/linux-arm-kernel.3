Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85EF5E77188
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jan 2025 18:46:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Date:References:In-Reply-To:Content-Type:Subject:Cc:To:From:Message-ID:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hpqHInndrX0iGC8mDRVxX2kXaaLKhzvItMvT43SHJpY=; b=3Tfn4+D0jnwxH8KV9+YmXKRQRy
	mahfGa7HCCkq/RSFjfnzFY9z94qi+UkN/zha+5CvS8CejMXczipAhQyoqWlkcKp1Tp6VauelmCj5a
	Kx3ChzRunQy7/PoAPMs3GLjTgpjhS441jokgm09VjkAVnctmtPkiVvFgoF6e+wKbUgQfAgZTf46LP
	9ZtuOJtS0q1UoTXYeVsj+teh8KviZ6AIaiDrQnUfDlcIp2daYVYxjRaP1RxsGen6AyKf6kMMtUCFQ
	VPknMfxMTisPdz+ST2ALUZyr0F2PZTOWngYyxUvi/eZV4jZ5ubTRfYC3+J8NRNXUxTd9ZoerLV/7d
	UckM5ozw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTQCn-0000000BBQg-1oeB;
	Thu, 02 Jan 2025 18:46:01 +0000
Received: from mout.gmx.net ([212.227.17.21])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tTQBY-0000000BB9Q-0Ovb
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Jan 2025 18:44:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=public-files.de;
	s=s31663417; t=1735843472; x=1736448272; i=frank-w@public-files.de;
	bh=hpqHInndrX0iGC8mDRVxX2kXaaLKhzvItMvT43SHJpY=;
	h=X-UI-Sender-Class:MIME-Version:Message-ID:From:To:Cc:Subject:
	 Content-Type:In-Reply-To:References:Date:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=czAnAfJvyfCPY7k+3SedOX+5j22KgAuZEKbaogkJxYEYfQA/xjJqscTgdVpSho5y
	 yr8sFi26elQBD+v/y1QIZakF8LS5+2pKYpqfXCLPFTfontfOc6IhCF+0AIEcti08K
	 wgqiEfWU5kf4QENHTAXMkRIfR7js1Hv2ey9UgSS9pLy28kTOkGt5f/pONkTY3TeS6
	 N93hpSdS7o9Nn8/EMLXhYVLPzrGO9oYi4sw42saGpzYvUbFvPlSrToBnpmOgIZQWo
	 pP6ps1EI01YgbsWjGbm2ZXe7I6htsBSNAifY9bpS6CRPGlBC806XD7tIuAyYDh2Fk
	 UiXebI6pDnzfq8gfAw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [217.61.146.33] ([217.61.146.33]) by
 trinity-msg-rest-gmx-gmx-live-548599f845-gxsb9 (via HTTP); Thu, 2 Jan 2025
 18:44:32 +0000
MIME-Version: 1.0
Message-ID: <trinity-a84b41b3-79c5-49b5-9786-eb89f85578cc-1735843472332@trinity-msg-rest-gmx-gmx-live-548599f845-gxsb9>
From: Frank Wunderlich <frank-w@public-files.de>
To: frank-w@public-files.de, robh@kernel.org, linux@fw-web.de
Cc: dlemoal@kernel.org, cassel@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, andrew@lunn.ch, gregory.clement@bootlin.com,
 sebastian.hesselbarth@gmail.com, linux@armlinux.org.uk,
 hdegoede@redhat.com, axboe@kernel.dk, linux-ide@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: Aw: Aw: Re: [PATCH v1 1/3] arm64: dts: marvell: Fix anyOf
 conditional failed
Content-Type: text/plain; charset=UTF-8
In-Reply-To: <trinity-796b046d-1857-413e-bb82-78e700d6b5ac-1733138371404@msvc-mesg-gmx005>
Importance: normal
References: <20241109094623.37518-1-linux@fw-web.de>
 <20241109094623.37518-2-linux@fw-web.de>
 <20241111203611.GB1887580-robh@kernel.org>
 <trinity-796b046d-1857-413e-bb82-78e700d6b5ac-1733138371404@msvc-mesg-gmx005>
Date: Thu, 2 Jan 2025 18:44:32 +0000
Sensitivity: Normal
X-Priority: 3
X-UI-CLIENT-META-MAIL-DROP: W10=
X-Provags-ID: V03:K1:LKNy9zKfnIlsz7NUTXXOtEKLalixuZlk+xPaKuoJSdmQlGlsQx4AHf7aFI2bc2+IWYKZR
 dP6v5jF8yrLsEik2VIZBAoJI6iXtONPhog/afX5jes7stZx8sYst5CG4v8dE6nR909gcT81UTMGP
 muBoR2ei0nmBt/xWhWjMlcwn/HFd/0XygDl8os6f2mJ+U8hr+Uq3KK9yHgsbN9NoI1yGxbSw5kda
 sFn2HAuqTFnvNa2a5pUQHLSxJ6NRCPpOeen1zr4OWmz3aKe/c0d7w19hXa2MBLWS176NVRrAaMKd
 NZB9O25GEgJfAcmTlXF0JxZN/NaXL0DQzRsig9JsqPBe7JDIGVinhzRCzn+WZYFvas=
UI-OutboundReport: notjunk:1;M01:P0:NLFJFR0ukHI=;pAc3xJgcxNOAej0dcvwuoRTuUqw
 1pXdfaPiyFRb177kwNNvFaXNQis5vPl70fEA1hQxWxxzxV3eMDgyTaiJT/zpPuW63KNfwHD/2
 4vh4TZyQeQEfH9kYItPXqtshaHji+C8cCb26+rEpDQ4o/0SirJYUyiG8A2vdiq9ckmbjlWwYt
 o9KgKf3fLjLf9TaA23GtlUeAJRvg6DSVVE643BMiz+gULt+XbPBKcOFW9F+nPmOl6Ajy83LYY
 ocqQJhCGV8v5xPvqZ5nTTlAxFTZsUdmbMfPB9Jk4qVsd6Lg7GU4EAUea7ETU1i1J1u15jHMgk
 FiDFMWdQqvCMgAngn/kjzbBs0cCj33F28HpFkQbPPwfCs1kIJ9pbjUlRU1TSl9sWgeN2d1vMl
 nd1fK3Jp5zfux3kI3KVZBbwVkn/VWI7gqhTPv6F9mj0Yf3R88+NkyqViwJmNpTKgCPDqR3FLW
 KX1jxaAuYRsGNAUUesZCz8bCFeI7zXcTpZDlczZ8vuqa4wrBG2ds48eUNJvoyLTk3GgQeifK7
 l6rto32iHMAuSctbrivr7zbk/UXJ+kAKuFodVNdlLwmqPhZPOJV1/xw0JFlFcj5KrpXBgGX9G
 E3Uvxkwpv6FNkiizlFTUvv8ZIRy7LADHWT4Ik1j4jY79c+oocjQzQT9TuUPzW8C0qlJVUSE3M
 I2y5m7+CAB2gCldHije/vJwNeV39E2Ko6SrqpOgrFPC/sqagG2foKayKXlCkn4AZzCkBruwvt
 1qRylPM+VIcKIEI0uamK38nYa+jvBgQC4EiuKuXh/cN8meNTjFyyvfos2brJNcCaTKHXfCn/q
 imFVU24Ihh1XUGykyxR/L4bcIqVcfustZTwqXOOKe3FHolpPvNZbrhb8fdFg+q8j6ZrmEkUGA
 e9mpJv9S85uXfH43HxZLA+U9KolV7hXelIiM=
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250102_104444_505533_2231A13F 
X-CRM114-Status: UNSURE (   7.08  )
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

is there any new state here? got no answer for my last 2 Messages

https://patchwork.kernel.org/project/linux-arm-kernel/patch/20241109094623=
.37518-2-linux@fw-web.de/

sorry for the html-entities...they came from my gmx webmailer, it is repor=
ted multiple times, but i cannot do more here :(

regards Frank


> Gesendet: Montag, 2. Dezember 2024 um 12:19
> Betreff: Aw: Re: [PATCH v1 1/3] arm64: dts: marvell: Fix anyOf condition=
al failed
>
> Hi,
>
> just a gentle ping to have it finally merged
>
> regards Frank

