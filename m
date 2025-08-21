Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 556AFCA0FE2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 Aug 2025 15:41:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Kww3Z8XQpKUqnrzv3IhCXTW3D/QqhIcasmUvK1+uYck=; b=nmLnKQjkhug/rUEnozwcdc1xgw
	OzZ3p4Bu0ycKohTfQA3PfOlBHiD98Zu3mSkRKuxdgfLbxurluVbT7OeBFt4m7c6mpkmN/uVKz/OKy
	jah7+QyqusteR3WXr+8ujgIFe3BbWFiFKUTViG3CC4eVeAwl5qH/EiHbVYWy1RuZiA2lrxLIoHnY5
	NPQK4CxgfbvxIGjRhfGmTcEnxdt/tzBZBFphxqAoNP3CN4336G7xIG782WYdiaPvHIDo5z70cNBSJ
	SF3zDJDpQrUZlVggShGzN3gDAxvhKBy/Bs8ut1v7P8opojQiAZhSaubpAGjskIdTOQtUv7AF7LzkB
	KisH7l5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1up7PV-0000000HQr2-2net;
	Thu, 21 Aug 2025 15:41:05 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1up4hp-0000000Gwt3-0xli;
	Thu, 21 Aug 2025 12:47:50 +0000
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-afcb7a3b3a9so129135366b.2;
        Thu, 21 Aug 2025 05:47:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755780467; x=1756385267; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Kww3Z8XQpKUqnrzv3IhCXTW3D/QqhIcasmUvK1+uYck=;
        b=g7+8XQ9c+8WMrB24m5pfsg2NADeppZ2YTmwOad7RL8Lqz5z19Sq6r872C7BnQ3VdGi
         1exetMVr2YivK/1lkoK3hUGQJv9ZBYG38QATQ76XPsulzqqFbf4Zk+cGSvsMu0r2ll5a
         lBvauaMT1Go2tkuz1oPyRh1EBlvxUzHoo234mv83VagWH8FV6s/hK7/Y3fMZvziy0si6
         6dc3bdjwozd5ayqf+++KCeXv6c6nSPsvkULgZzmBA8Alj6FOxpvhCqob11ZNwyavbEVU
         yR6jvU8qYOTz4WgR/VRgT4E/BrCcDPjrZvw81mYgU58896ic0osNP0+VeH5loQoFVflo
         5ouA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755780467; x=1756385267;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Kww3Z8XQpKUqnrzv3IhCXTW3D/QqhIcasmUvK1+uYck=;
        b=Ssf9hF2OjHwu+EFbgaBn+Hs+6Qn38o/ixunGQLiua9oj0AEMb+3Ql6aX71Xmxw4yFo
         63Y1HvybiprHStphR7dn5KkbBMI+jQ8qoNEBbywCcvMs/E9E6K0S2qNv+TNj3uwWkvcY
         afQt7o6WiIt+CCddWKBOjQ4SBS+/h+dAvk04/kgYzTcsDGUAjNY7iZgaDsqFK9R/9Dar
         epiDqdqr9J0p6zHftFtNBIrUzUlRcgqIB0M+AjmtrKljg+mEEWSgs7ac1D7//o4T7A7z
         EDESOjYuysddMhVlgDceEMZ7vhC4zJx5N5KWnu5SRJVqY7L2xX4yAb+MoEE2U5fXyf3+
         5c+A==
X-Forwarded-Encrypted: i=1; AJvYcCVUiEXVCSNPuXGvNYHPLhZRD2rnw+HG2uXJzi08UecWWT3hsKvIZeT9sGuG4TQVwlYokZO71Ns7n5OzKMfoxRYqUQ==@lists.infradead.org, AJvYcCXB4B4JBgq81r+6nm5bM6nIOhXZpE8eJxtqEQ+pvNdkicQKHYYvKqoEiVzuGRmR39CddyxbAcFRKxvkPIqW@lists.infradead.org, AJvYcCXIcgZhy8L3sESp94jz8oyhCX/6yb+iqe1HWzyAyUWs9n49TF/019P9djy8oyGysGInB0Bm97lD789E1kwUqk4=@lists.infradead.org
X-Gm-Message-State: AOJu0YzyxwoteV7QYpCUD9y2aEa39fAxchh82fzVqhFq9slrOPmcj3hE
	0G2bVk7z6YRn4dyxmaOI3UkQQ09hFSq0cAgKyb2iv56RcmltmgXRscMgNAQiRZMnOMPtCEmeMvJ
	GImoj2p0KXpUoQeIKRt6fRHeBn8aXik4=
X-Gm-Gg: ASbGncv/sUNhZkcrRVz1tyJa4Z/rn6pzSZUSVAltq78jTPXGH63cMJxmjJEi2ojcpgr
	FPYYZ3JapQk09PuRVIZCx8DB5cPfb2Vrf8MDSrh5ujkOkDOStAbAlhzRN5+woNpA9462KQuX1ym
	DcuXaUMHiWeqLfB0y5rTqOCNCL7XHYeE4+OS/qmjkAcva3vlU4GW1KerFEHIz4slWzfv324CY0w
	M5WigUj7w==
X-Google-Smtp-Source: AGHT+IEPEbjECYdBW0nd8xX8lWG/FeWz08nR/1JcSgRS+BCimYdArukTA+i3b9djOGPovIzmf+wskUZ5f9vMyM/jPZM=
X-Received: by 2002:a17:907:9711:b0:ae3:5e27:8e66 with SMTP id
 a640c23a62f3a-afe07a7efc8mr229517766b.27.1755780467264; Thu, 21 Aug 2025
 05:47:47 -0700 (PDT)
MIME-Version: 1.0
References: <20250821080723.525379-1-zhao.xichao@vivo.com> <CAHp75VeDvK8cOr=rVGj_hVX5YzXM-UqrWRBgUrhiA1wzYn7C_w@mail.gmail.com>
 <CAKv63uvfHYATd7ZFweZ0LMfTLt-idHVgYJqOV8PvzaNeigbt9w@mail.gmail.com>
In-Reply-To: <CAKv63uvfHYATd7ZFweZ0LMfTLt-idHVgYJqOV8PvzaNeigbt9w@mail.gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 21 Aug 2025 15:47:10 +0300
X-Gm-Features: Ac12FXyAa-NWG2kjb3jWIL5sg7tG4bcy5ylXKO82itEKrqXswF6DvDsUv85LdDQ
Message-ID: <CAHp75VdL9kV2fyi63zqPZnW4CaeYPmJ74tmGEgU=M7FSYBv0ww@mail.gmail.com>
Subject: Re: [PATCH 0/7] iio: Remove dev_err_probe() if error is -ENOMEM
To: Crt Mori <cmo@melexis.com>
Cc: Xichao Zhao <zhao.xichao@vivo.com>, Jonathan Cameron <jic23@kernel.org>, 
	David Lechner <dlechner@baylibre.com>, =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Andreas Klinger <ak@it-klinger.de>, Haibo Chen <haibo.chen@nxp.com>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Marius Cristea <marius.cristea@microchip.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Heiko Stuebner <heiko@sntech.de>, 
	Francesco Dolcini <francesco@dolcini.it>, 
	=?UTF-8?Q?Jo=C3=A3o_Paulo_Gon=C3=A7alves?= <jpaulo.silvagoncalves@gmail.com>, 
	Hugo Villeneuve <hvilleneuve@dimonoff.com>, Gustavo Silva <gustavograzs@gmail.com>, 
	Tomasz Duszynski <tomasz.duszynski@octakon.com>, Jagath Jog J <jagathjog1996@gmail.com>, 
	Per-Daniel Olsson <perdaniel.olsson@axis.com>, Waqar Hameed <waqar.hameed@axis.com>, 
	Yasin Lee <yasin.lee.x@gmail.com>, Julien Stephan <jstephan@baylibre.com>, 
	"open list:IIO SUBSYSTEM AND DRIVERS" <linux-iio@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, 
	"open list:NXP i.MX 7D/6SX/6UL/93 AND VF610 ADC DRIVER" <imx@lists.linux.dev>, 
	"moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, 
	"open list:ARM/Amlogic Meson SoC support" <linux-amlogic@lists.infradead.org>, 
	"open list:ARM/Rockchip SoC support" <linux-rockchip@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250821_054749_274782_B9038CE8 
X-CRM114-Status: UNSURE (   6.08  )
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

On Thu, Aug 21, 2025 at 2:50=E2=80=AFPM Crt Mori <cmo@melexis.com> wrote:
>
> Sorry duplicate - as I commented on driver.

Yep, answered there.


--=20
With Best Regards,
Andy Shevchenko

