Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC9B8C36000
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Mar 2025 13:01:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:Date:Cc:To:From:Subject:Message-ID:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=tMXqvTBhDsmIU46dwieyVJOz1wRi4N2crzClzNAU/UQ=; b=1WKi1VNRS6eP1f01UlFRpAK+RH
	mAPzem5y6hg0InNpyq6eCX25Nl0+cCNnmd6J/7mCJj8CzDeLKIu9UZeyGOebRiqBWOOxik9UsQW36
	3JXBCLQdYz/9yb8CggRoHrNEB6GjSmMF96BtXTlLbBgGZ6uAdHFNYGXk8T3UIt6xcC3aEuB6zr4jJ
	JvMpo7ctR1qcE7MQsmQ5Vc+dJLhu9znIEzBBs+8c/qXFrcR2yM7cPUBqwSzGQDzgmY/GEkJ0Z5Gfw
	jMFMixLKEm1zfj/IHZBeseXsELGYY7NNhAzIWFbAeXc2KS4ZrpvB4VI5o1BJTUac16BGgfpfTaR4c
	sCIbWfoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvbzr-0000000EqFm-0aZx;
	Fri, 21 Mar 2025 13:01:11 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvbwj-0000000Epml-1SuT;
	Fri, 21 Mar 2025 12:57:58 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-4393dc02b78so13071015e9.3;
        Fri, 21 Mar 2025 05:57:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742561875; x=1743166675; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:date:cc:to:from
         :subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=tMXqvTBhDsmIU46dwieyVJOz1wRi4N2crzClzNAU/UQ=;
        b=VVFqGHsJu2q7bPHNHVjeSH5M0ct8zqNGAH2JNEwcBhmXWQHPQnilqkhGbVfqZpQ0ec
         gOb9kMiD51+76YAnLdeKlf4iItToYaEFNhreflQXn8tgnJxWYyLLR84+MS/jWnw4mmjr
         n66AAWU2K59VgfKb5WFIMpSiyzSaruJRRu9iE3G/kqPBf20jl6MEfYGGAWrcnj8cJCK7
         w8TM/fBwAJabpIWwQhtvnRBEQugwjywh72/ipB30BIBGy3EnXiUMGGeut+NhpuflUilh
         eM2LxOuYz3bmCipFiZyc/98eC+uWITipo4yLypRNiKU+0RDZpuRzF6rWm0H157sAGNRA
         mStA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742561875; x=1743166675;
        h=mime-version:user-agent:content-transfer-encoding:date:cc:to:from
         :subject:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tMXqvTBhDsmIU46dwieyVJOz1wRi4N2crzClzNAU/UQ=;
        b=wwdm07dvw+i1Z4hSFk2YMcgnhVXCzx+oobfICox3nsClFZfM1ToAYuyZOplMsIMfNF
         4KlVwLgAG8wPNQFsFTmyIsCsN+S78eh52DibLXQKhcUSK5F/hXBYIlxmNGWBWbW8XI8K
         fzt1EPxjXLEqKlcOsn/FS4qhQscBYf4Cz8LoQb9hNTkqOlJ9vXw9s9DAsytC2vHAwfBw
         5y8aXNq/AhpMhHJsMgPcBh7ThAJmpV6lXRzp4HnOUWk34PRPC0PfXCmYVdIhhCuFriWn
         rAbdit7XdtMBQ1xAWW5EtSDoxemRo9k6+Ozh8F5+l8B4GLgDMjNvrphc6MDClDeP18Xq
         dzqA==
X-Forwarded-Encrypted: i=1; AJvYcCUQXa6OiMaon5ZcxWCmrVkNGqHC3VlGG4GjNQuuAj76e2llR/vMXRJr3TvaPGtNo2ym3uBHJOllmdmX5KFh3ZuB@lists.infradead.org, AJvYcCVyK2nMXANRWAHW8V5KdGph2nc21L4rLvs8lsjGAEDvN5nvBMT2bBFY8/WzZ6ngqMKnjwcqi1WYNsx31ueSjso=@lists.infradead.org
X-Gm-Message-State: AOJu0YxAvZWt0txSVuLk3SKqOPedR61cIBHN8x8JUXw3hsoe7THABKxq
	nr+pB62aYHEDSqKYN5NtifhYeT64SS8/R6zOBIsT5i6kOL8tpOi3
X-Gm-Gg: ASbGncu40aEuGVqIGFHjeMIPpAPk/6u7hiIaSmB3Ivyn4yQ5rK0mdphou04+UKbEsWV
	3p7gWdrMwZ59L1lTAU3kZUYM3Sq7J0vk/F7UgMrGmJ0jSUFHRws0qq2D/0m6zQ88YAiS2aSluJ6
	yr96ctYFj5eXSHXxPNXPcOGv9q6fOT78sWcQqcw7qsklVwm+2U8lvtlyrqVY6vGhVXHkF+IAQD/
	02gkoiTlqjG/jY840z7OrReU8yumspVxJZ8ClCTg39Yn1cb6hGLGTQfTyw4HfeQ+zt28BcMEHV1
	niLbwoY7RADJEdlLSsubmtli6PcpjjX9HOth27dNofIuXg2WGyGfuL5QDvYFv+TvSSA9VPgqX9u
	dTqMHKIEvm8KoqQ==
X-Google-Smtp-Source: AGHT+IGWi+Gt4v13gDghCGe+Jbu5Q3l2IMxPm/TVT4lgzDqW9EW/9FUF0r63MdffknW3eQkELufzyQ==
X-Received: by 2002:a05:600c:5488:b0:43c:fe5e:f040 with SMTP id 5b1f17b1804b1-43d50a219a4mr31708785e9.23.1742561874835;
        Fri, 21 Mar 2025 05:57:54 -0700 (PDT)
Received: from uefi-arm64.Home (236.red-88-30-84.staticip.rima-tde.net. [88.30.84.236])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d43f331dasm78492825e9.8.2025.03.21.05.57.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Mar 2025 05:57:54 -0700 (PDT)
Message-ID: <365ccddfba110549202b3520f4401a6a936e82a8.camel@gmail.com>
Subject: [PATCH] spi-rockchip: Fix register out of bounds access
From: Luis de Arquer <ldearquer@gmail.com>
To: linux-spi@vger.kernel.org, linux-rockchip@lists.infradead.org
Cc: broonie@kernel.org, heiko@sntech.de,
 linux-arm-kernel@lists.infradead.org,  Robin Murphy <robin.murphy@arm.com>,
 luis.dearquer@inertim.com
Date: Fri, 21 Mar 2025 13:57:53 +0100
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250321_055757_404511_DD4F8422 
X-CRM114-Status: UNSURE (   8.83  )
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

From: Luis de Arquer <luis.dearquer@inertim.com>

Do not write native chip select stuff for GPIO chip selects.
GPIOs can be numbered much higher than native CS.
Also, it makes no sense.

Signed-off-by: Luis de Arquer <luis.dearquer@inertim.com>
---
 drivers/spi/spi-rockchip.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/spi/spi-rockchip.c b/drivers/spi/spi-rockchip.c
index 1bc012fce..1a6381de6 100644
--- a/drivers/spi/spi-rockchip.c
+++ b/drivers/spi/spi-rockchip.c
@@ -547,7 +547,7 @@ static int rockchip_spi_config(struct rockchip_spi *rs,
 	cr0 |=3D (spi->mode & 0x3U) << CR0_SCPH_OFFSET;
 	if (spi->mode & SPI_LSB_FIRST)
 		cr0 |=3D CR0_FBM_LSB << CR0_FBM_OFFSET;
-	if (spi->mode & SPI_CS_HIGH)
+	if ((spi->mode & SPI_CS_HIGH) && !(spi_get_csgpiod(spi, 0)))
 		cr0 |=3D BIT(spi_get_chipselect(spi, 0)) << CR0_SOI_OFFSET;
=20
 	if (xfer->rx_buf && xfer->tx_buf)
--=20
2.43.0



