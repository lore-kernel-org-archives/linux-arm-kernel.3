Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC9ADC02198
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Feb 2025 12:02:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:
	Content-Transfer-Encoding:Cc:Date:In-Reply-To:From:Subject:Mime-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GI3W9qR1fQieAycCsuIaEjCDuBJjNXKEwknKksP2WWw=; b=LtsP09JAzpPnSpjnvU6/Ui09XG
	VGxCmjNHOKIq2SgzRMlodTnjEFcSUMCPlsDwzNC87I7cBPcUxEhx9Rtk5uJssseF0Phvsvv7ynp6r
	fjsZdwx8LCFe66rFL3Asxnne2N43QwX8dZLjHd93KQhQqzTSMtU42r6FPP315SuBddoYmFnA8gTXJ
	J6QRknoFIjj2Wtj1h5USwhkQFuiqnJTQdfseJZBogrv6aKFOeIIPvktMa43isSrKZOuW1I+nDTLYG
	JWXYB1oxkuXgfbPmJdfuBUh8UiBbJfpGf7yJo9mE+HWefEHMVAsw5lE1CD5ve99GqybxrUuj1ryqT
	8hzcit4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiuOF-0000000Emp4-45oL;
	Fri, 14 Feb 2025 12:01:51 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiuMm-0000000Emdq-2RMf;
	Fri, 14 Feb 2025 12:00:22 +0000
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-ab771575040so615434266b.1;
        Fri, 14 Feb 2025 04:00:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739534419; x=1740139219; darn=lists.infradead.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GI3W9qR1fQieAycCsuIaEjCDuBJjNXKEwknKksP2WWw=;
        b=eB7O27yxvbtmhH7fcDYyZyak8srmZ4n4SJBefbK6uWBCVkuxjAaDQtCjHzOBkb0CJY
         u3FFE0bA9NHS1s0T8bOwHmb9D/UXwA2bWYbHkpM8+vwuHaGwtscfA4H9h8DCB5oo0oNx
         XDJOF0rsxefveIqHroiEWOJbzcB+5ZE1LwyP26467tr0/r2RTGx8W+6GTm3Xk6WAGEMD
         BZoWR7P1+ag1QaZeemm4CZHTtvU9MDKlnA8O/LvwXFFAzZCRrup97vmssm/sJGIvt68o
         wXe4sr+bTRP7iA/bghRCUZS5tmwillPxz7zLQx8IjCKTrYoJEbxQtKrHDVkGIWRCpLNt
         VraA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739534419; x=1740139219;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GI3W9qR1fQieAycCsuIaEjCDuBJjNXKEwknKksP2WWw=;
        b=Hp1Zc4QR2EyORT2RGVS57q0a0xq2NsamdonEuw4Bq/aBb49d5c4lz3faNTH9QcoUBp
         uq+AK2ORDVVHGJjXjDLyZJfrZBTYsFQmJRpQZu3M2HUYepmzqkZDlEQcOMu29b6Xm/Yo
         i0Iupsm2+2tT7QAdGDAu+T7NOLagEB/AGbhnmWPS8W8swASG1H//jnoqvCH10DUW1H3h
         Wf0yoanBUtIPNqCUkkgr/RMZOP9EXUHy3JpKADfOf1YP35H8GzitP/Iwum6rAU9yGcKi
         sT1Lckk+ayDkReZukHXl8CV4cB1U8dhpeVznZoS+kIs9SuME9eQz+ibxh/2WWI98PISC
         oQ/g==
X-Forwarded-Encrypted: i=1; AJvYcCU2tYXL+1TRjN0kkfhdENJqaSQjDRX1Kzg3NOT8cc5h2EYN/LrTG4mY05CLscrKaYwFBsc9iQSD8vDML8lfLkeY@lists.infradead.org, AJvYcCUA5ajmskgQhh2sLZKhyOlsXHn/8SM9xCHLGcf2Z4Lp6GyKGsvybPnV+CiOkOrp7j4kCC8q57OqYZoigeZ/yCQ=@lists.infradead.org, AJvYcCUjlSABHeaOd26/xPghnmzXfy8N25zBSkPpzzK0akiyU87A/fgMeybdtHpqs1c+TxomVe2ELONHj1Xc@lists.infradead.org
X-Gm-Message-State: AOJu0YxBDr+qksloisfwVBcPfQxmWcmJ4HCkV7JoNueopmz8MGFUr6z4
	p0UhZrS/tKP46zd3yQMskw2jy47Otdw/wuVE0/zExLlLpPHux93C
X-Gm-Gg: ASbGncsCLJgSIY19pvWNhY1w1iLyfLyjMCN0wNjVY6W1ZxTL8OgsLy8xl7zRxe1dLoa
	ZY0fwaZeXxfrtgP3jm9ehP6opEJHnUWW6wkzSy8AltR46M4yqQQZoPtbHrLgPgatqXMOlHgDwT9
	7gjTY02p5gXMhO63YuU86Qupm36tVJ57qISaPohREMbdMWi4tGB7/kY1mISVLOak6rGShhqyUXw
	I8qAHbTxi3rU3Fd62zlANUennedwOWrDyUi5umk3y59YgiRbRzojhvb67fKurF7ee/wnBNcPDMF
	Y6DE90p5Bxpdr+hmJf77WVtoVh3ns1WpeTF2sbWCYvPxRwoNCvt6ZqQCwiNIKMGRhFIcFKNY
X-Google-Smtp-Source: AGHT+IEuZ76Lk8B5kT7BpvuBO88bUmgM7KzRYxZvjjTT1LTHSgCtEgbI85Tx+usx0aBQ6F7U8VS0vA==
X-Received: by 2002:a17:906:fe02:b0:ab7:c11:a980 with SMTP id a640c23a62f3a-aba510aecf0mr643697766b.17.1739534416957;
        Fri, 14 Feb 2025 04:00:16 -0800 (PST)
Received: from smtpclient.apple (89-66-237-154.dynamic.chello.pl. [89.66.237.154])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5dece1c416asm2819667a12.18.2025.02.14.04.00.14
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 14 Feb 2025 04:00:15 -0800 (PST)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.400.131.1.6\))
Subject: Re: [PATCH v6 00/14] Add eDP support for RK3588
From: Piotr Oniszczuk <piotr.oniszczuk@gmail.com>
In-Reply-To: <tg6eyew4qahuxqakmmejne7xx2rkouj6htp55acun4ajz2irz2@vlmvqv3zc5vc>
Date: Fri, 14 Feb 2025 13:00:03 +0100
Cc: Damon Ding <damon.ding@rock-chips.com>,
 heiko@sntech.de,
 robh@kernel.org,
 conor+dt@kernel.org,
 algea.cao@rock-chips.com,
 rfoss@kernel.org,
 devicetree@vger.kernel.org,
 linux-phy@lists.infradead.org,
 linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org,
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
Message-Id: <C81810F2-6E9B-4DCC-85D1-CCB63CBFBFEA@gmail.com>
References: <20250123100747.1841357-1-damon.ding@rock-chips.com>
 <5044FFCB-B325-40D0-BA82-03AF64EAF029@gmail.com>
 <tg6eyew4qahuxqakmmejne7xx2rkouj6htp55acun4ajz2irz2@vlmvqv3zc5vc>
To: Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: Apple Mail (2.3826.400.131.1.6)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250214_040020_623585_CF165886 
X-CRM114-Status: GOOD (  20.55  )
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



> Wiadomo=C5=9B=C4=87 napisana przez Sebastian Reichel =
<sebastian.reichel@collabora.com> w dniu 13 lut 2025, o godz. 18:26:
>=20
> Hello Piotr,
>=20
>=20
> The RK3588 has two different DP controllers. The one handled in this
> series should get the eDP port running, which is routed to the
> "eDP Panel" in the block diagram on page 3 of the Rock 5 ITX =
schematics.
> So this series adds support for using "HDMI/eDP TX0" and "HDMI/eDP =
TX1"
> in DP mode.
>=20
> The port routed to HDMI0 via RA620 is the other DP controller, which
> also exists twice: "TYPEC0/DP0" and "TYPEC1/DP1". This DP controller
> is not yet supported upstream and there is no pending patchset. As far
> as I know Rockchip plans to work on preparing upstream support for =
that
> soon.
>=20

Oh - this is very valuable info and explains a lot.
Thx.=20

> Note, that the two DisplayPort controllers are completely different.
> The HDMI/eDP controller is a design from Analogix and the TypeC/DP
> controller is a design from Synopsys.
>=20
> P.S.: Heiko merged support for HDMI1 (RK3588 SoC level) recently. So =
you
> should be able to get that running by some DT additions to the Rock 5
> ITX board DT with the latest linux-next code :)
>=20

And it works perfectly on all my 3588 bards (including audio and my cec =
addition)
But only on boards using both hdmi tx0 and tx1 to hdmi0/hdmi1 ports.

on rock5 itx: =20

With both hdmi tx0 and tx1 enabled in dts it looks like kernel detects =
hdmi tx0 as connected and tries read edid.=20
As nothing is connected to J11 (eDP con) - i=E2=80=99m getting i2c ddc =
timeouts=20
[   54.188880] dwhdmiqp-rockchip fde80000.hdmi: i2c read timed out
[   54.292207] dwhdmiqp-rockchip fde80000.hdmi: i2c read timed out
[   54.395554] dwhdmiqp-rockchip fde80000.hdmi: i2c read timed out


disabling hdmi0 makes kernel talking to hdmi1 but with issues:=20
[    0.540446] dwhdmiqp-rockchip fdea0000.hdmi: registered DesignWare =
HDMI QP I2C bus driver
[    0.541230] rockchip-drm display-subsystem: bound fdea0000.hdmi (ops =
dw_hdmi_qp_rockchip_ops)
[    0.542285] [drm] Initialized rockchip 1.0.0 for display-subsystem on =
minor 0
[    0.542933] rockchip-drm display-subsystem: [drm] Cannot find any =
crtc or sizes
[    0.543605] rockchip-drm display-subsystem: [drm] Cannot find any =
crtc or sizes

and here i=E2=80=99m a bit puzzled as on other 3588 boards (i.e. rock5b) =
- when i connected monitor to hdmi1 - all works perfectly
(kernel, OS and app nicely skipping hdmi0 and talking to actually =
connected hdmi1 port. all works)=20

on rock5 itx this not works.

my observations so far are:
-on rock5 itx hdmi0 is falsely detected as connected - even when eDP =
connector (J11) has nothing connected
-on rock5 itx disabling hdmi0 in dts breaks hdmi1=20
-on other 3588 (e.g. rock 5b) disabling hdmi0 in dts NOT breaks hdmi1 =20=


strange=E2=80=A6.

  =20

> Greetings,
>=20
> -- Sebastian
> _______________________________________________
> Linux-rockchip mailing list
> Linux-rockchip@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-rockchip


