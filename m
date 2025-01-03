Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52E6FE77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jan 2025 15:32:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BxHhQidADsZYijaS3zKgdvU9SQtnlays+edgk6k/XtM=; b=BSehTIIG8/L2UiqXbpD6DfZZbv
	K9b77AIEiAZBWvRZbQCCj6dDvAfqyZkXd5fBxtZlXkMo47CU3pzTSKZYaVuTuNKejCKZYmMuRqxel
	yCQJPXe+iIpUzV8IEpYem4WUCe/KPLj8qZNy72hmHTgYtCGsEcR9+PODqI8O7zuVak3K6imzbMpeb
	X6wBN301ZTPQar0IR3x1vGcJy7wLoJF0l9HS9vHlZyH1SPPJiejypo8iTWKxXfkeIgvjrnC96SL2D
	BJiYa0UAWb/o10avad5ZeJP2WDvC2kcSKcCQE6Lk56vHCKBqHiqxhIHCo5C0RM0WsQYBShrq43GAB
	ncy0UpUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTjfC-0000000DIED-2f76;
	Fri, 03 Jan 2025 15:32:38 +0000
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tTjco-0000000DHaK-35zq;
	Fri, 03 Jan 2025 15:30:12 +0000
Received: by mail-ed1-x531.google.com with SMTP id 4fb4d7f45d1cf-5d7e3f1fdafso25549720a12.0;
        Fri, 03 Jan 2025 07:30:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735918209; x=1736523009; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=BxHhQidADsZYijaS3zKgdvU9SQtnlays+edgk6k/XtM=;
        b=SEDqU7Ow+ZdqgFR7+KWyL9nZ45Cla5WPsaiqkMhmyoPrZMX8wiMqfJmiIAFGYDFnEQ
         uhRU6c6TPfTFazQ+/i0iql+U6RgRB6XZkiuWUbbRNiaGLTeyvFUV0TV+RMEZtwtvlUsN
         ud+f3tAfyypBDYploFNcsZQussyyRvH/t3GChplTVNpPL84S7W+5AALgvoUTAsLLcqos
         uUnWS8quBBLhcq/26bnwHzjfd5yJBB54Qz6gdmvNpVIN/t5RcLidoGoBL/jbSGrTs9+O
         Z1A/yAMuyaFQ+o3IPiQiIX/Ub7IS6z5pIfOR3dlz8GJTIV7WQes90FfIBGVvugzKvJq0
         0DtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735918209; x=1736523009;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BxHhQidADsZYijaS3zKgdvU9SQtnlays+edgk6k/XtM=;
        b=l2bXjz+H1NC/Gy/oxTv8iU7kS2NaJPREpEhFTU2u47HzNffdjNbPTuOX9ttvj7dZHx
         zUjVkgj9jaej4wnZQuHhdkQNy7AHM7nr170HirpDNWZehK5H56ursE7x4c7og6l47nha
         tQfO1Zt0sxof2W7G0/Hxgks9RexlnkJvIBHcf14yh2d/WnSR5GcmqYlEe/3nAqS+InZM
         ijdfbxZ92luwGJ05nsyMdKlpiDOGTEjRDskTFayAH9ussS7OuZ9m0dYJtRVcJJFayXHk
         +Oq3rZkboVBC6/Xr+JF/yMoQLpk1bOqmkq7DSc0P42boOXynEuqtQE8LeX3ElsYP/iIB
         N5wg==
X-Forwarded-Encrypted: i=1; AJvYcCU5iXjTRMf4Nogy7yLOJ+vkL2GoPZ/H+AZMx05G8tCw1LvPD4/imexT7kkpXZX8ynyd2nNISP8dH/xReKRggJ4=@lists.infradead.org, AJvYcCXvNMbopizLcjzIfnHgCvoRQtKMwwRb+H6NQOQfFbc8JOYD5EDIw84FFf+P1lgbLwQnKKfWkUH4MUoGxzSj/tMB@lists.infradead.org
X-Gm-Message-State: AOJu0Ywvi0zdrCVM6BrSoIgDbm042H6Mbi/PJfZnHtIq42d5BE8Pun8t
	wIxoNK9OEjkDiX0TTFYKTzULgKFlW/l1zdipKhA9tQBjIUeIMpGSOSwEekDKShhCMC1ftyqal3w
	YCciye4nW4oIAHI9qdGrBk2gzkxg=
X-Gm-Gg: ASbGncv/DNvec498AmAkAADyLRskn6p9q/CAA3qW/JRLCpjQWLu3NPQXNauaD+Yf5MR
	FUFYKYBTyYweySvEDGnN2H+Q/oWhIa4ZwG78iNQ==
X-Google-Smtp-Source: AGHT+IEPhcS9BPyqvGIlQM2qXRZWsDDIi6z7TAAUpcov+fr9Fgzy4hHGMc+y4Zxj9EpJBFID0GYe0Wlb3V6uYMu3fCI=
X-Received: by 2002:a05:6402:401b:b0:5d0:c098:69 with SMTP id
 4fb4d7f45d1cf-5d81dde75a3mr47865343a12.16.1735918208507; Fri, 03 Jan 2025
 07:30:08 -0800 (PST)
MIME-Version: 1.0
References: <20240809073610.2517-1-linux.amoon@gmail.com> <Z3fKkTSFFcU9gQLg@ryzen>
 <CANAwSgS5ZWGTP+A11r_qFSrjWZH_DqsM89MLiP+1VAxhz+e+2A@mail.gmail.com>
 <Z3fzad51PIxccDGX@ryzen> <CANAwSgQEunirUf3O3FJJAUsQu9mQYD_Y40uJ_zMYDZYVy5J=wQ@mail.gmail.com>
 <Z3f4JQZ6yYV1BJ-b@ryzen> <CANAwSgRTcHuDNLvPJAs7ZaV-NnepeOkHj_kVc5OAJtP03hd6pQ@mail.gmail.com>
 <Z3f95RXj7GhZZHEP@ryzen>
In-Reply-To: <Z3f95RXj7GhZZHEP@ryzen>
From: Anand Moon <linux.amoon@gmail.com>
Date: Fri, 3 Jan 2025 20:59:51 +0530
Message-ID: <CANAwSgQEb7rWFaeEO3Mb8LAwK6A5mrCyQFEysmSpeVdhoRWrtw@mail.gmail.com>
Subject: Re: [PATCH v2] PCI: dw-rockchip: Enable async probe by default
To: Niklas Cassel <cassel@kernel.org>
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>, 
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, Heiko Stuebner <heiko@sntech.de>, 
	linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250103_073010_777467_2E16DB50 
X-CRM114-Status: GOOD (  21.46  )
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

Hi Niklas

On Fri, 3 Jan 2025 at 20:40, Niklas Cassel <cassel@kernel.org> wrote:
>
> On Fri, Jan 03, 2025 at 08:36:18PM +0530, Anand Moon wrote:
> > > >
> > > > We need to enable the GMAC PHY and reset it using the proper GPIO pin
> > > > (PCIE_PERST_L).
> > > > Please refer to the schematic for more details.
> > >
> > > The PERST# GPIO is already asserted + deasserted from the PCIe Root Complex
> > > (host) driver:
> > > https://github.com/torvalds/linux/blob/v6.13-rc5/drivers/pci/controller/dwc/pcie-dw-rockchip.c#L191-L206
> > >
> > > which will cause the endpoint device (a RTL8125 NIC in this case)
> > > to be reset during bootup.
> > >
> > Thanks for letting me know. It seems like a workaround.
> > I'll try to disable this and test it again.
> >
> > My point is that we haven't enabled the GMAC PHY (device nodes)
> > and must properly reset the GMAC.
> >
> > We're relying on the code above hack to do that job.
>
> I do not think it is a hack.
>
> If you look in most PCIe controller drivers, they toggle PERST before
> enumerating the bus:
> $ git grep gpiod_set_value drivers/pci/controller/
>

Ok, understood. However, we have multiple reset lines per controller,
so the PCIe driver will reset these lines using gpiod_set_value.

PCIE30X4_PERSTn_M1_L
PCIE30x1_0_PERSTn_M1_L
PCIE_PERST_L
>
> Kind regards,
> Niklas

Thanks
-Anand

