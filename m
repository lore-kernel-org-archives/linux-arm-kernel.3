Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26759C02183
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jan 2025 14:36:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:
	Content-Transfer-Encoding:Cc:Date:In-Reply-To:From:Subject:Mime-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+McQPymEmOdhf0WLe0EFmpoE0UjFeiDotGFY4kS0D0g=; b=HaPuANO0hkSxUwMLvHRjaV3Blj
	hp4cVhTpzqF8SKMPYaztkanUus3Wdphub1USwwWkPilVWDWq3B9H3seCpnaB3lPyOhpH/yssToaZy
	RWFGZEGe93nRD0XpnpUJZO+wIdxKillhZR/t9b9RHQurcibra0IL7YehHot1rjbIcghaTWgB0itrs
	eE4iP12c6iuzNbcGN1USMx9sFmZRzjxMS9fPWqc8xzEGzU+r6VNHHKQh4CG91eqcl6CLrcr2yvVyl
	CyxwgQ8Q1fGPoExFjuxZfFfGuZ8agoqsJ7jIn4HSY2d+KW4VWkgVFheg4MXoLYgkfRb+rzkmPbjZy
	AoIUBi2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYQzE-0000000FC2A-3RNw;
	Thu, 16 Jan 2025 14:36:44 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYQxy-0000000FBho-1o8g;
	Thu, 16 Jan 2025 14:35:27 +0000
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-5d9b6b034easo2091411a12.3;
        Thu, 16 Jan 2025 06:35:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737038124; x=1737642924; darn=lists.infradead.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+McQPymEmOdhf0WLe0EFmpoE0UjFeiDotGFY4kS0D0g=;
        b=IfU+EIDx6xWwgvngb/uhO2iNKbpXX5Fq5IfrY5fLUfUGeGu0YbSoDbFIUcnTo1gKa6
         itk8b5z9SfNAs6dMh1N20+r6qNDYSp6Q7kA8er4sOMjZgyVOzf40qMo+7RJSFET0kWqs
         wFUaedsiB7yot9e8nJT3O3ekcoIP1dvAlthulKppLsh6eRFc4T2D/Xr/3P+ukkSdILhO
         sEy9FdG+IbBwqsutnxG/8fgdTDUcWotzVtEKCHxdS3bOskUKjZ6CE8qZZa/1OVr4fA35
         ZNrWSq9gKoWQDwWZzGwH0LS70l5gjdSOvyoKSxVwgJzTnxQK6y6vkEmF6ZCYnp4JBYLK
         KHuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737038124; x=1737642924;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+McQPymEmOdhf0WLe0EFmpoE0UjFeiDotGFY4kS0D0g=;
        b=kV+e2hCb1DGeHiHU0Bray68dcGIa+dRrPteAWMbnqX9RHJ9NYzyy3G6kgPSlNToFlX
         6bzCgizw/kBoyRk+Egls7ZxhiAiviCYIRchpFlTIFooQE6nUwo0Q3ZS+OLHcroHTaXqC
         Aq6IN8Hlr9xnXPmWP/1vDodbXvksCtpyHRcwrMJenJD3mekYkf67D7lyo0P/ew3M7kDX
         t7PaEyUys0WYqlfp2K2VosUPA7DbiRzrnc+blaz0FU/+Vw2wl74l81IiojKrWLjDGIZS
         rUsg1IBqHi+auZqKm2NhgfIFH29SleowCmCQkzO6mk5FlceCfvExLr11ZcWAZy7qfwRU
         CYMw==
X-Forwarded-Encrypted: i=1; AJvYcCUSiQUV7nhXhCC/c4MJ7MKdL6u/3a+BkIKi8nYXpxRiT+ltWYmTNxgTj9Nd3l4viE0opujFXpk9lsgzKjTiMlk=@lists.infradead.org, AJvYcCVDi2ZcB7N2DDTbaztWC+o61Iyfx/Q55Lkxd3CDgiTiiOFes2hq1CBDorDutpKeCQO/0yc5iolUGuwb@lists.infradead.org, AJvYcCXiIGIWZdPGjjBT3O56Ai7JaJ5ppR8PdOfhIgzxtYHZ7HIteV4fa2ey+358ThG5nu4UQuAlSSpTpTTIYxWzUN64@lists.infradead.org
X-Gm-Message-State: AOJu0Yy+kdiNmq9KWFl4OPxZtnPa8lUjjP9j28u6oTEcMxtLscUrPHEN
	hWNIKLlQSNk2OLgaa5VhbbBrAcuwWp68qL4m10AJcSUm6tm3j1/Z
X-Gm-Gg: ASbGncs4AwQ/+c/kZMHCrNVqVQsWcIqNKX8XaKYDUPREc3PAgHh5Zl6+udVVvdCRTqQ
	0jKNi0TpBsuYmjWqHP3ZxGVY83KTIk7d34FhRgPkfHGm0sBRJRua2I7Dq/b/NIbRbcgNHiCYDVz
	Ygc/kMEs4hhEKyfXX7C14yhU5KxCgeaQbc4I9c5zKLfy2z87Gik5RZf4Hf9ZWJH8Eam4Uof7qQm
	6nJXJDaNEubQrlomQGNQFTqqcPk9/eqIoZzlkKbiefMaEhbnrxaGXfkgXT17UoVoLg6agCIqDUS
	Zva4aJXHE4mgXYYaGOGWhSMTzxRDJkELkBcrqQ==
X-Google-Smtp-Source: AGHT+IF22GYVRQI+1Y1KzRsqCWEDA0Rkne28OZTlDzi7yq1Grymd0Rj0WG4k8w+WrzsYR8ss+QgyYw==
X-Received: by 2002:a05:6402:2695:b0:5d9:f70a:47ec with SMTP id 4fb4d7f45d1cf-5d9f70a4a74mr10793460a12.15.1737038124352;
        Thu, 16 Jan 2025 06:35:24 -0800 (PST)
Received: from smtpclient.apple (89-66-237-154.dynamic.chello.pl. [89.66.237.154])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5db7364272esm19585a12.12.2025.01.16.06.35.20
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 16 Jan 2025 06:35:23 -0800 (PST)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.300.87.4.3\))
Subject: Re: [RFC PATCH v1 0/6] rockchip: add a functional usb3 phy driver for
 rk3328
From: Piotr Oniszczuk <piotr.oniszczuk@gmail.com>
In-Reply-To: <CAMdYzYoCj9FsyHdTQAOV4DFpD7OdMDaJ0R=BBxXG-SLguy512Q@mail.gmail.com>
Date: Thu, 16 Jan 2025 15:35:08 +0100
Cc: Heiko Stuebner <heiko@sntech.de>,
 Algea Cao <algea.cao@rock-chips.com>,
 Michael Turquette <mturquette@baylibre.com>,
 kever.yang@rock-chips.com,
 linux-phy@lists.infradead.org,
 wulf@rock-chips.com,
 zyw@rock-chips.com,
 Dragan Simic <dsimic@manjaro.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Rob Herring <robh@kernel.org>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 linux-clk@vger.kernel.org,
 linux-rockchip@lists.infradead.org,
 devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Arnd Bergmann <arnd@arndb.de>,
 Jonas Karlman <jonas@kwiboo.se>,
 frank.wang@rock-chips.com,
 Elaine Zhang <zhangqing@rock-chips.com>,
 Alex Bee <knaerzche@gmail.com>,
 william.wu@rock-chips.com,
 Zhang Yubing <yubing.zhang@rock-chips.com>,
 Johan Jonker <jbx6244@gmail.com>,
 linux-arm-kernel@lists.infradead.org,
 Trevor Woerner <twoerner@gmail.com>,
 Stephen Boyd <sboyd@kernel.org>,
 linux-kernel@vger.kernel.org,
 Vinod Koul <vkoul@kernel.org>,
 FUKAUMI Naoki <naoki@radxa.com>,
 Diederik de Haas <didi.debian@cknow.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <F69CE715-C0E4-4FCD-943C-89CC1D3E848D@gmail.com>
References: <20250115012628.1035928-1-pgwipeout@gmail.com>
 <2EEA8028-8E4A-4588-A480-E5FF0F7BE82E@gmail.com>
 <CAMdYzYo2W1hLgiH697AdRSUbhBU4rU2uB=N6EMWMD2-0R+VLBA@mail.gmail.com>
 <B1C9DA16-F285-4AD0-AE4E-AF1A5CA20932@gmail.com>
 <CAMdYzYrxX=RsSZja-3+zLZUSpyLoRz8Zm0w0hTfL3RQ9cjqgOw@mail.gmail.com>
 <3536B507-8658-4377-A1AC-2C5D9093BDEB@gmail.com>
 <CAMdYzYoCj9FsyHdTQAOV4DFpD7OdMDaJ0R=BBxXG-SLguy512Q@mail.gmail.com>
To: Peter Geis <pgwipeout@gmail.com>
X-Mailer: Apple Mail (2.3826.300.87.4.3)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250116_063526_470454_708155BB 
X-CRM114-Status: UNSURE (   7.90  )
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



> Wiadomo=C5=9B=C4=87 napisana przez Peter Geis <pgwipeout@gmail.com> w =
dniu 16 sty 2025, o godz. 15:02:
>=20
>>=20
>=20
> I'm at a loss here, I applied the patches to a clean 6.9 tree and even
>>=20

oh maybe issue is in kernel age?
6.9 seems a bit quite old.
i=E2=80=99m on 6.12.9=E2=80=A6.=

