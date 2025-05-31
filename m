Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EA92C5AE59
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 31 May 2025 06:50:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a5ZWLH4632Zz40l3FU4iRpheZh29+AsfRRhpH0NFHZY=; b=TYEO4qYzZnDg+dUQ4yiJ3i5c75
	blgla3K5l3h5gkFDLKU5XxROphD0fItMj+Qk+AT/rEwcyVM+sifLOe7nWSFMiqe4PBENrbkc8duYB
	kbFdkm18VKViKoLqaLsBUUXvp4i5d/5UrKrq083Q6kyY26Sk2b/J8O7D3WhoNge8++T0TWXm5CAse
	nQ6aOrWSmCRnEYqAkxkbkZq5UyhbF9d840I847VnhXakrneQgGubFw2yLW/gEVuHsEVZYVoFHBCnP
	3H4CYiOU27X16dWvaB5X+jcyd2Jy4pgTCZ9gDhV9lyLUiuHfciX3Z0O6JpkxdGOn7U1CEtOGKDvP+
	c+uG1/FQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uLG2f-00000003RwA-3L9X;
	Sat, 31 May 2025 06:50:05 +0000
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uLG0W-00000003Rlq-2LGp
	for linux-arm-kernel@lists.infradead.org;
	Sat, 31 May 2025 06:47:54 +0000
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-7399838db7fso2557234b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 30 May 2025 23:47:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748674071; x=1749278871; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=a5ZWLH4632Zz40l3FU4iRpheZh29+AsfRRhpH0NFHZY=;
        b=yRHCTEb+E3nEnXXUsuFlcWC74fgWd56MhERVsReu7uqlsy8OLKV2yG0XPfldkINqVC
         wrYSMnmHSH9i55jFu7PD0sNeaL/yItNHue43e61G25u9fx1yYGwCpU3nyv1+IzEK9q4y
         GLpwiqaTyzfVFHsrrrWsA6cwC0aXnoBE6MfENEnPolOqNltwm1kRnKeqMALxqMLNRFSq
         FGEay/e9XZ69jWkeaf0uP8vagQjFTb7gfckFa398wcBDT2mhijBmlivSlyeu8eAsXK3V
         3tLk2oezsyB4noRF1nBqF8gn9ftGDfViVi0Sh69J+Q5HDSsubnKCKqLKaMdnkk2CnUrH
         AL+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748674071; x=1749278871;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=a5ZWLH4632Zz40l3FU4iRpheZh29+AsfRRhpH0NFHZY=;
        b=AAlRCb80BM55clzqbD5ufuxzK/Yl30sdza2FTVY8Of3RryVFyy6ljr/DIRFw+1nzUQ
         FwAW5eoSoP3kmQpeW10WnX+2VkPkBva0ptUuUNzd/x7y1KrkLqZgzPFvfWaUbOr+h9Zm
         wMSEwX5OlEw3G75mQC2vEF5hP1vvINCdpR3Fm6D+70sg8pedFQWMwJ1l1dcsdZtp/RB1
         Oh1uBIjN8GX3VYsfbHXyVS44UR9huT8pf+kEEqbxVrKBuecihHQEIp0CF06WGBZwyUP5
         HPna1QX4UDoTz/HD8q9IJka+5seT/pBqMwnf7CIees1Xtefv9200LWC7djm0Lg6ox3Am
         H3NQ==
X-Forwarded-Encrypted: i=1; AJvYcCVrpeG5MYLbY7RXHcPLbFtfDQJGakkIyUnyYTeLe2CVBs/hATK0Tm23frc3BsMF1LJms6JOuzVj63Yvuj0cPuKV@lists.infradead.org
X-Gm-Message-State: AOJu0YxM4UqIM7702gRMAffdMbp39dcOfJ/bFmUIgOY/HSwvV/27Skc6
	aKKFdM7bjaqDL3SgvU+gLzDbAJZis+64kCNZCqWgl3SQ0q1z4Fm8gyllXiatQSpHRQ==
X-Gm-Gg: ASbGncsQmAjJh6g/DS2jfUccLF3Pp0e0mpzmASc/NoNxh1Fj0lX9kmCW4fzr4TcKTyN
	qyPqp5bCtvIbEm5rIrzcWayUr/HHPQggfpfdzNGIX+ZvWGefkxBpN0PCsl3DRJA3ukiieGr0GLg
	9STGUjKeC62EQQdjRwcZIjFQwM9RfH5c25su4a07NqYgM1KHJpkFJTHIL42iqu2IAvyLFOeLMZH
	EED5DjgeuKEfxE7BcbkISE6asAsI9LmYo1ZPHcpOWqi+cgiSJDWc0uT8VJ63FOgnapaNepqfwlv
	1F7l2g/ZUhcbIWntKqViCVToC5pmikUOWsVNFeZB8h5FurbnGUrHhItjRyJAGw==
X-Google-Smtp-Source: AGHT+IEKL4fPM3xoNxSzuxpYqv6nyVtXsn84i+gad0ylQKNT3LCGJ0g2SDcStXdW+/7FoA7i3aHggA==
X-Received: by 2002:a05:6a00:179b:b0:73d:fdd9:a55 with SMTP id d2e1a72fcca58-747bdd85a07mr9014475b3a.8.1748674071613;
        Fri, 30 May 2025 23:47:51 -0700 (PDT)
Received: from thinkpad ([120.56.204.95])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-747afe966easm4032172b3a.4.2025.05.30.23.47.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 May 2025 23:47:51 -0700 (PDT)
Date: Sat, 31 May 2025 12:17:43 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Niklas Cassel <cassel@kernel.org>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>, 
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Heiko Stuebner <heiko@sntech.de>, Wilfred Mallawa <wilfred.mallawa@wdc.com>, 
	Damien Le Moal <dlemoal@kernel.org>, Hans Zhang <18255117159@163.com>, 
	Laszlo Fiat <laszlo.fiat@proton.me>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v2 1/4] PCI: dw-rockchip: Do not enumerate bus before
 endpoint devices are ready
Message-ID: <domwxd2beelpnuuzgbxuizqnfo24aekhtxsahodsbfkpc3n6fd@rahjejxklr47>
References: <76F22449-6A2D-4F64-BF23-DF733E6B9165@kernel.org>
 <20250530194347.GA217284@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250530194347.GA217284@bhelgaas>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250530_234752_600225_51A96A58 
X-CRM114-Status: GOOD (  17.22  )
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

On Fri, May 30, 2025 at 02:43:47PM -0500, Bjorn Helgaas wrote:
> On Fri, May 30, 2025 at 07:24:53PM +0200, Niklas Cassel wrote:
> > On 30 May 2025 19:19:37 CEST, Bjorn Helgaas <helgaas@kernel.org> wrote:
> > >
> > >I think all drivers should wait PCIE_T_RRS_READY_MS (100ms) after exit
> > >from Conventional Reset (if port only supports <= 5.0 GT/s) or after
> > >link training completes (if port supports > 5.0 GT/s).
> > >
> > >> So I don't think this is a device specific issue but rather
> > >> controller specific.  And this makes the Qcom patch that I dropped a
> > >> valid one (ofc with change in description).
> > >
> > >URL?
> > 
> > PATCH 4/4 of this series.
> 
> If you mean
> https://lore.kernel.org/r/20250506073934.433176-10-cassel@kernel.org,
> that patch merely replaces "100" with PCIE_T_PVPERL_MS, which doesn't
> fix anything and is valid regardless of this Plextor-related patch
> ("PCI: dw-rockchip: Do not enumerate bus before endpoint devices are
> ready").

It is patch 2/4:
https://lore.kernel.org/all/20250506073934.433176-8-cassel@kernel.org

- Mani

-- 
மணிவண்ணன் சதாசிவம்

