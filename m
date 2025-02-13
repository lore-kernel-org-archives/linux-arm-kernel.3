Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 274A6C021A6
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Feb 2025 18:16:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:
	Content-Transfer-Encoding:Cc:Date:In-Reply-To:From:Subject:Mime-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/L8X4e7idHOInm1E1NvmDqFmI3f3xIs3AaNrbgOvVqo=; b=l1CcF8gCMp8q+WNhNL6kGNszjj
	CMdW90oAfD9+FhFZUntm2YTjEsB751H3iJ/lisylt7+Sf47LdHgblOW6Kkph24LEzSOytVP3gT4qQ
	oHLQvDlcHhMZPDIhtiGzfCtWqT375w46MAMbGGJMXnNLw69EwqUQLV0dNCad/scTWywGZOzKUZxKN
	0kW84vuVZ1zJkAOEEuNgWrwrOf9Ry5OSkxK3fEsiqupg0DKfmAjRWFTKFPV1mqxWH1ChBsHY8kBg5
	bjMrQFaGkpSncIo9Z/NO9cclsLUpshIrkzif/IQT80Apcul8yGKxTfO+Tio+q0gnEzTf10Y85KAjE
	AZrXslCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tidkk-0000000CBWz-1gb1;
	Thu, 13 Feb 2025 18:15:58 +0000
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tictj-0000000BzMQ-2YCr;
	Thu, 13 Feb 2025 17:21:12 +0000
Received: by mail-ed1-x531.google.com with SMTP id 4fb4d7f45d1cf-5dec996069aso1942143a12.2;
        Thu, 13 Feb 2025 09:21:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739467270; x=1740072070; darn=lists.infradead.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/L8X4e7idHOInm1E1NvmDqFmI3f3xIs3AaNrbgOvVqo=;
        b=BogrwheX1lsWxFKIf2vDsJUYb3i3WghCblo44997I2w3mtOOaL4RWqSHvMKvpiUoDt
         16nx5TeDYaLnoG38+kKZjoHS7nOwdzk6TPq2RklQEZDeTmhWBzEPmhJSFVJ+jd04cHPh
         7LiIaJfJvoHdR05xlipNGEoAqiHVvWf7ejh4UsTDIgGRCpbzWnjd4iHtIwU35Qqh0JbZ
         5813rhieHC/cPdZ4og7lsj4iR7IYWVrViVx3PX2Rs1JSkreuqjlwEm/XWp2XE3gNp5hi
         vUWUlhLVjcyC+O8PL0qDRnQ13xs3PLqX55B2niY4zelT//y2uoLywfuDPghN+MdGXjCS
         /ZHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739467270; x=1740072070;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/L8X4e7idHOInm1E1NvmDqFmI3f3xIs3AaNrbgOvVqo=;
        b=Tg0kAAY516iQkNSZwzYSTzKzy4g5bCKQUp+nT2dpqKoRFa1g0CRe6BAcUuUBb5YFAb
         cB/YntjIa+rHMjrtJYmw/p2zM8dI+s/oIAHPtLWvgPe2Xf4jgzMVhKJ+QmoIukxoL6GY
         lOy5GMVuN2H+57uDnN8ZPZOSDOa+x2tX8EXPC5SVmf4wAHgUpmjWgqsdNnuthe2Qcufw
         rtf8oEsmDbOkUrlsAoaENRIMdaQWXLJNuZoNuhzfaCW+uqpWDr1BCW2TG6CijOH5vrCl
         ILBB57WeeXCBJE6HoNzFmEmwDENYq2x/tqvqTieN2xODrjtm/XqvZvWnYS3qMNjYRkoq
         tfHg==
X-Forwarded-Encrypted: i=1; AJvYcCVAcBXpO8Ky4d29EZ0ymq3f2zw81EK9aqaygEkiZtJzlGOjVTBCxT5k68WMPB/ESkfHZRgi2JVY0WaBQAMwJYJM@lists.infradead.org, AJvYcCW6gQu7MQ/qyC4cwOakrddNvPHFtkcaUafLbqEmzz28oeXQEpBanSbwrDSYUcJ85Q8oVg5wMQhbBTr6Rxc0tWc=@lists.infradead.org, AJvYcCWxxfa36YLzL7LiFIRZerGPSjWCNYJkKD/HgG0MsIZ4bpFgzQMvmdFiQGbKce5n4+O1MXniOIKzbu+I@lists.infradead.org
X-Gm-Message-State: AOJu0YyOXXGkHhqb9sh2q2514aUhQqcIOwVFA5SjqG5oaKaFEgNSCOfM
	UIxdXA+xrsRzPHFQcUbj8V35zy/39nEPybDet1F5GCOj4SU0EP7jLCufObw4
X-Gm-Gg: ASbGnctpdtlzhCvZOzjeurbmxO+JxYjOsAqK75WJXhcgncL1wnx4A76mt+I2lhrlRVw
	68Jqft9PuyIFgzfeDpjDOIU33KLW4l7agH4ltzYI1kLvM/AyxpMVW088d6VU6X+59QmGe26l1RY
	3DRclZbsB6vsJyOQYkUQvMG71vHquOA2069ljXYUJB+2Ut7adp31x7Bhe4MKSQAq7hfd6+sdGwp
	ZflMM5cRrYbo5fo8m7ww1n7c8aB9m/JTGo1ztN8NTZmJt4UEviXVYAdhT8l3t55gkOgWpBQ5vaH
	nV3dl5s/DOvWbKoc2hPNSF31wQMlFjvXXtwl3aJbRB/3fwLytUfNu2LgcwCfRPeUqUuvXGX9
X-Google-Smtp-Source: AGHT+IErHbsUtfgzkzhuHG33dvhjaZL2J0Jo8G6oOoESna+1j7QGmuOo4G7y0Y6m+8a3iiqQL9uH6g==
X-Received: by 2002:a05:6402:3553:b0:5d9:82bc:ad06 with SMTP id 4fb4d7f45d1cf-5deadd7b8b8mr7475158a12.3.1739467269631;
        Thu, 13 Feb 2025 09:21:09 -0800 (PST)
Received: from smtpclient.apple (89-66-237-154.dynamic.chello.pl. [89.66.237.154])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5dece1d349esm1490025a12.33.2025.02.13.09.21.08
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 13 Feb 2025 09:21:09 -0800 (PST)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.400.131.1.6\))
Subject: Re: [PATCH v6 00/14] Add eDP support for RK3588
From: Piotr Oniszczuk <piotr.oniszczuk@gmail.com>
In-Reply-To: <D7RH63Z1VBBD.1AIOQJIWPZIXS@cknow.org>
Date: Thu, 13 Feb 2025 18:20:57 +0100
Cc: Damon Ding <damon.ding@rock-chips.com>,
 Heiko Stuebner <heiko@sntech.de>,
 Rob Herring <robh@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Algea Cao <algea.cao@rock-chips.com>,
 Robert Foss <rfoss@kernel.org>,
 devicetree@vger.kernel.org,
 linux-phy@lists.infradead.org,
 linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 sebastian.reichel@collabora.com,
 dri-devel@lists.freedesktop.org,
 hjc@rock-chips.com,
 kever.yang@rock-chips.com,
 dmitry.baryshkov@linaro.org,
 vkoul@kernel.org,
 andy.yan@rock-chips.com,
 krzk+dt@kernel.org,
 linux-arm-kernel@lists.infradead.org,
 l.stach@pengutronix.de
Content-Transfer-Encoding: quoted-printable
Message-Id: <59278550-BD6E-454C-AB31-084E13C19409@gmail.com>
References: <20250123100747.1841357-1-damon.ding@rock-chips.com>
 <5044FFCB-B325-40D0-BA82-03AF64EAF029@gmail.com>
 <D7RH63Z1VBBD.1AIOQJIWPZIXS@cknow.org>
To: Diederik de Haas <didi.debian@cknow.org>
X-Mailer: Apple Mail (2.3826.400.131.1.6)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250213_092111_651220_B78CDD39 
X-CRM114-Status: GOOD (  13.97  )
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



> Wiadomo=C5=9B=C4=87 napisana przez Diederik de Haas =
<didi.debian@cknow.org> w dniu 13 lut 2025, o godz. 17:56:
>=20
> On Thu Feb 13, 2025 at 3:54 PM CET, Piotr Oniszczuk wrote:
>>=20
>>=20
>=20
> I don't know if it's relevant, but while HDMI0 got enabled for quite a
> few devices in 6.13, it did NOT get enabled for Rock 5 ITX.
> I made a local patch (which does the same thing as was done for Rock =
5B)
> but I have no idea if it actually works (I don't have the board).
>=20
> Maybe you need that for eDP to work?
>=20
> Cheers,
>  Diederik
> <0001-arm64-dts-rockchip-Enable-HDMI0-on-ROCK-5-ITX.patch>

Diederik,
Thx for looking on this.

Im afraid patch will not make hdmi0 working as rock5 itx board has hdmi0 =
designed to use 3588 eDP1 + eDP->HDMI converter (in-house developed =
rk620 chip).

I suspect we need:=20
-enable eDP1 support (hope Damon code can do this easily)
-map eDP to port0 in vop2 (port1 should be mapped to eDP/HDMI tx1)
-set typeC1/eDP1 mux to eDP1
Then maybe we should have hdmi0 working?

Im curious a bit about vop port mappings: maybe we can go with generic =
approach like:

eDP/HDMI tx0 -> port0  =20
eDP/HDMI tx1 -> port1  =20
typeC0/eDP0 -> port2 (+ exception for for rock5 itx: typeC1/eDP1 -> =
port2)



   =20

=20=

