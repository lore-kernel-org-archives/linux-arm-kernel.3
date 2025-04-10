Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8524C3601E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Apr 2025 07:32:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YV128qhGuAyvX2XLDTOXX2NTQVmvho5pgSBUUl0uM3I=; b=HZ2KogKsMOgIHliO1b/y0JHb+E
	zCXzj0UIVbddK+yzkVrz/DxdGT2tDF2ZkPFJzGtWRTZZniWaVsUgSXqmz3P04fLGxO7crmaUu8jPD
	fguiU9lTPchBdk4N0dXMrB4hB3V8Xf9IzwBg2uTzt/42437XtflTCxVNbIiY3XHDV9dzNbSvfxvu6
	qPwjWbPZ+Li7lw/yMz0e7irsW+6HHCLblr5cnbpwQfuFLMJ9ETB3bgY5P706uZ9C/WM7CeayWuxNF
	n6NiyhNqUAvIMia87K7qaRpLe9UUqIUxMDAcKugUSmwJD/zFneHU1Et1p/ui5ojnrsexVze00q2Vu
	c3MpQEkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2mOl-00000009ZSd-2iVd;
	Thu, 10 Apr 2025 07:32:31 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2ldm-00000009PVU-0PpU;
	Thu, 10 Apr 2025 06:43:59 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-43d04ea9d9aso1895475e9.3;
        Wed, 09 Apr 2025 23:43:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744267437; x=1744872237; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YV128qhGuAyvX2XLDTOXX2NTQVmvho5pgSBUUl0uM3I=;
        b=WAjDAjoY26qldf6iW0wQQkbkU4K8v6tO1nei1I3ylypxoedCNKxR0jh8eFvtcbrKMZ
         2mQbIMo5um9iYJmhSiJMT6jNmzJ92b43rBJAn2y8tGPkr0Maext+1X7/UhT4Nst7bR/+
         Avg4y9J/60DR+U/gosC5Sc0SadXARHMMlpsmlcLdGxuPhSdzmDiTGedXsdjX6RBVCIE0
         3ruxe7BlbG3oB7d0YqglfAI3vcxDcheb+M0cwIyRxCdj91YDBt2p1W/Mf3Dvl3FkqkqN
         2XMPEBEpPUID35q7IYzYKTG2+gsa+4TbaPCUw5awiXVXnAWvbihtDq928fPBrUy+U1SZ
         LEwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744267437; x=1744872237;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YV128qhGuAyvX2XLDTOXX2NTQVmvho5pgSBUUl0uM3I=;
        b=WoANAZGbidbqk7XpQPoOFv6Hzkph9pvsTlTSyaPwc518agVmOAHBOO7vVaBIquV5yC
         ZmM5EKWMgHxB0Z7wzCbTRXKNNm0QQDJvwupKroRt4SAcHzO6/WAW5IRyZavS1gBjwAQ9
         GTdlVqeMbLt+3k+vMqvAXSCT0nVh4mZxGFADWTw4VVREMPuHbDgFhGSR6iJ2WD8XakHo
         J3UYmdDeOzcG2wdgkm9yFrsw4ACgtq+W/OyoCMVi8bCnxVE43PPCyX4BwgLC5snaB6BR
         aAxU6U40pImNq1jDYB4Usk8l5ReN41h+E62KsGKLf6J/88R7zc1Ao7avVAMfZYgxZ2pn
         0B5Q==
X-Forwarded-Encrypted: i=1; AJvYcCUwb0cHGnE2zhBimh2xVfS5U4ZuWsyPrCbcDAJJ41MOh4ge8Q3bOZh9cotIt1HLEzM+o+auT7BqCvkLz31dlvRVpw==@lists.infradead.org, AJvYcCVcsv89ozJTjZhJBlVIjxvaz9jBsYw1T9vZo7quD1Q8HuSehGCtYQ5gSo8dM3DVsyTtALJxTBMNPOq/zUDJVrQ=@lists.infradead.org, AJvYcCVuJfbFJq2PbT98aoj3xyL/3gpHUmOdwOdRjWUle9CXdL1dNUHnhb+p84qJ/twi1OGgLP/FSNYzvjp+mC67@lists.infradead.org, AJvYcCWPRupjcCOca7L7OEZycUTaALTRyePtJqVDLsCZg7FoShUA86bohDYj5PfnFQxfQMT2pInD8EcY3Jsjv54MVZo=@lists.infradead.org
X-Gm-Message-State: AOJu0YzF1X7t8tBkRKqSur5jx2KDSuieBartv+uzwaDbXu/6EJajQMRx
	JYaYBhEQaEzFOKcIyw7mtOiz5B8Wm6j2Ew90Drx269aVMxFCoT2X
X-Gm-Gg: ASbGnct3TknRp0Qmzxz7FuOwyvy9Q1Mj6RYXrdA2w7zA2qShM58/MiY2ZXA027KAFGn
	F9VoU6tieMUh24NXaqstrLzuh0kUdb90DEIwQ3nx/g1JsaCwPFpGFn8YCkCTDzlrGUT9bJ+zBv0
	t9k+c5bvHdc9IHtyD21pdD90AXiVQ6w9Z5rf0AxGAmHNZ1tSa3g2UB4W72a1eQJYsdheG4cUufF
	itqb1kbKNFHUtH+38uflUn+lL/nJCt9tJQMg19NT1lwp3YHSzlvTlk15acMESHFbYUCS+aKpbF5
	m+QUlDmCoFT4q0c3+woCk5ZRzMbDqOiIEnig8nLdEMoFs6/WFgZmngAg1Pk4dF4ou7XfKIm/kBa
	fTjatvZYbhNSVPX9m
X-Google-Smtp-Source: AGHT+IEL1gPJzOAzRp7flPkyN4Ef+Ndtjxrjlvobznu4GMFiYPht20jH1k+dVvg8c3EBb+I0DiJViw==
X-Received: by 2002:a05:600c:3512:b0:43c:f689:dd with SMTP id 5b1f17b1804b1-43f2d7e9229mr11997625e9.19.1744267436516;
        Wed, 09 Apr 2025 23:43:56 -0700 (PDT)
Received: from jernej-laptop.localnet (86-58-6-171.dynamic.telemach.net. [86.58.6.171])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43f207cb692sm46662105e9.40.2025.04.09.23.43.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 23:43:56 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Samuel Holland <samuel@sholland.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Viresh Kumar <viresh.kumar@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Vincenzo Frascino <vincenzo.frascino@arm.com>,
 Liviu Dudau <liviu.dudau@arm.com>, Sudeep Holla <sudeep.holla@arm.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
 Stephen Boyd <sboyd@kernel.org>, zhouyanjie@wanyeetech.com,
 Conor Dooley <conor@kernel.org>, Nicolas Ferre <nicolas.ferre@microchip.com>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 Steen Hegelund <Steen.Hegelund@microchip.com>,
 Daniel Machon <daniel.machon@microchip.com>, UNGLinuxDriver@microchip.com,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Heiko Stuebner <heiko@sntech.de>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, "Rob Herring (Arm)" <robh@kernel.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, linux-mips@vger.kernel.org,
 imx@lists.linux.dev, linux-rockchip@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 01/19] arm64: dts: allwinner: h5/h6: Drop spurious
 'clock-latency-ns' properties
Date: Thu, 10 Apr 2025 08:43:52 +0200
Message-ID: <4999502.31r3eYUQgx@jernej-laptop>
In-Reply-To: <20250403-dt-cpu-schema-v1-1-076be7171a85@kernel.org>
References: <20250403-dt-cpu-schema-v1-0-076be7171a85@kernel.org>
 <20250403-dt-cpu-schema-v1-1-076be7171a85@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250409_234358_139252_B30C5FCD 
X-CRM114-Status: UNSURE (   6.59  )
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

Dne petek, 4. april 2025 ob 04:59:22 Srednjeevropski poletni =C4=8Das je Ro=
b Herring (Arm) napisal(a):
> 'clock-latency-ns' is not a valid property for CPU nodes. It belongs in
> OPP table (which has it). Drop them from the CPU nodes.
>=20
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej




