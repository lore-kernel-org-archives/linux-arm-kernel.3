Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2260EC77B7C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Jun 2025 20:40:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:
	Content-Transfer-Encoding:Cc:Date:In-Reply-To:From:Subject:Mime-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DXl0cMLudBpdlj8wR8LOIlD5+oXM7nXzkbSpaXpGmEw=; b=X6PaNfAz84uyFk8p0l0C+NLXUi
	gqn722SRLLhOWzAp7Npwi9Z+Rtf/ZCPP8EytThMfbmLA+qsDSqC01Q3jtVDib/w/LkjTwHRkD/WjL
	Riu3UF7ercm/cESj23qnCaqiv56iAJPutMzbNcfI8n/9N317KUNc/og2OM+GFhlVYSbazJDs/mWbn
	dzL4kBdRuQEdhetRJXmFIPa3h6zvYuUZkUT7dy0je1d74AGAF8VdI4xDcov47iAylE+/i6nv0F06q
	NEeEubExLfArWEALzzxl+nU0AcN6evvbO5zenn0xxIRMBgijUQ0TCaaxnugBoSKPpcBjqAekakNRb
	1aeZaV8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTnxW-00000003wGC-34ht;
	Mon, 23 Jun 2025 20:40:06 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTihT-000000039Uj-1aq5;
	Mon, 23 Jun 2025 15:03:12 +0000
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-607ec30df2bso8651612a12.1;
        Mon, 23 Jun 2025 08:03:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750690989; x=1751295789; darn=lists.infradead.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DXl0cMLudBpdlj8wR8LOIlD5+oXM7nXzkbSpaXpGmEw=;
        b=VT6qtlcxNxLc+moOwVGevKfduJ8VktJiHD5eTS+SFzxjAvQOOkK55MQKGo/MxZLuf2
         Xln/YTcFxo6UFPLxq7jKwp4zh9DcTgUEVzLFMyqrUCk3kyQGj8noNyW52HC4A5OIpvtw
         3yvMJibFMPhP+/X3aBUcNNFhzAdbWs5TmI4xR3k8kFQjtPX1shVaM5ZSSe/BD4RipAbb
         JxubwId/eICewvo2ts2zZBXv60WELhQiWU0yxwA4UimiA4JCqLznEr/ZNkDXJHli/SYr
         Bg4uqCnNa0CU9fpXJo1N6p7EY3NU1Lw7opMAI7JrbLgjpIyrV5ewTDDx4dxXu3sU10oy
         52JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750690989; x=1751295789;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DXl0cMLudBpdlj8wR8LOIlD5+oXM7nXzkbSpaXpGmEw=;
        b=Y0ecnpc5C3OYMih8jmkc4Flh4O3O6DTp9fHntSv0rS/JQl71+bs573mutaehkLzw6i
         +jtsEAVQNmojcHM1w7pJ5bhMEAAmNiqVmVWyUWGgrLBj8ESWtvl0+HfRQuH1mGYdWGI+
         kEUnMaqGasFPhVJmr/+WDOah4dodQuqcO6HiypS3MLZwXOB4YWDxuUyVQdx1AZkRgdrA
         aMqCSrdgkVOmHWXlx4u+dod6IQjT4eSMTbj5tzfSQ9TarmrASPykLWr5GGD0OJ1gkhGl
         63hjFP3g9KtdkDks/jGwk1aCEAz7/NLleXCpFCXhKNotR7GYTrRspFUf7nz495AQ2J3I
         Laxg==
X-Forwarded-Encrypted: i=1; AJvYcCVVqrjCTMw27LF66Mp1pTBEA8GjU5gR3S4Ltep06Sm4asqU4tLYeeA52eN3MpxRpum24//BGFJ1PeicC43u+WMf@lists.infradead.org, AJvYcCViHa1GR9/ftNrCHGKWY/JIhbt5rxft72rOLDq4HXcvh1fR6KZBV/qEIIskDZNKO6z1M/vqbu685lFOP73DQIU=@lists.infradead.org
X-Gm-Message-State: AOJu0Yxyv8ceDBlL7F2vIJbUpSX4if0GCwTRKHoCwTI+PNytVAGohXWX
	5NRWH+pPXm60Jw0MD06mGROfNefq9URz00z/Gs1U+LZEmu0fwEYxOmST
X-Gm-Gg: ASbGncvsYdyfhHD6cbXsCVpLua9KJbftWOEYXCwmRLvP/U/WrvNxWzdilswlnYC8F8h
	bRZQpip+C1eGWuSuVaeHYKX26usJfBkr2+0K8AA3dlhyNf49e3mczhluVBxJrY3zQxCNLVUPMQL
	0B30fldVoIS0MYZzC3Bw25359DB2cvl/aFz2W1r5rjuUfQqu+npqFvTrrw0DosU03dASs1J+X5i
	OFXYWjiOVr1gzNbO+ZexVDqMGcIosmtxFxCf/8+5jx79IIwklxUC+kbT+vY39x5HdL/knTyWCcu
	mf/U88OQRRTJYG6AVUMI/4u1R3pm0w5rS7WZ27ft8KPWPIMuzae9G4Gg0jyO4P8lzHnvQvcS0oU
	73zWZ2QbQ8Q==
X-Google-Smtp-Source: AGHT+IGgziI+e+vJ+MXDsuPrI0s48ZwgitoKIP9UnUUKH8556Bz5CkOWTC/xSH8NNs/2JksNufd3YQ==
X-Received: by 2002:a05:6402:34d2:b0:607:f42f:d5eb with SMTP id 4fb4d7f45d1cf-60a1cd1af9amr12209304a12.7.1750690988966;
        Mon, 23 Jun 2025 08:03:08 -0700 (PDT)
Received: from smtpclient.apple ([89.66.237.154])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-60a18ce62f9sm6107984a12.68.2025.06.23.08.03.07
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 23 Jun 2025 08:03:08 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.600.51.1.1\))
Subject: Re: [PATCH 1/4] arm64: dts: rockchip: list all CPU supplies on ArmSoM
 Sige5
From: Piotr Oniszczuk <piotr.oniszczuk@gmail.com>
In-Reply-To: <CABjd4Yz4NbqzZH4Qsed3ias56gcga9K6CmYA+BLDBxtbG915Ag@mail.gmail.com>
Date: Mon, 23 Jun 2025 17:02:56 +0200
Cc: Heiko Stuebner <heiko@sntech.de>,
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
 XiaoDong Huang <derrick.huang@rock-chips.com>,
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 Jonas Karlman <jonas@kwiboo.se>
Content-Transfer-Encoding: quoted-printable
Message-Id: <36711B65-DD45-4539-BD9C-0382936FD0A3@gmail.com>
References: <20250603-sige5-updates-v1-0-717e8ce4ab77@gmail.com>
 <3286000.Y6S9NjorxK@phil>
 <CABjd4YyaNF1zosFFi6hEsZanPDxoaa1h4Dpd6uTPRwA3BZn0=w@mail.gmail.com>
 <5897576.DvuYhMxLoT@phil>
 <CABjd4Yy8WeXKmmxh2-TjjF5-ABy-NzzJsWpt1KvSjJqTHh0Xwg@mail.gmail.com>
 <CABjd4Yz4NbqzZH4Qsed3ias56gcga9K6CmYA+BLDBxtbG915Ag@mail.gmail.com>
To: Alexey Charkov <alchark@gmail.com>
X-Mailer: Apple Mail (2.3826.600.51.1.1)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250623_080311_416665_F5F8DECB 
X-CRM114-Status: UNSURE (   9.70  )
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



> Wiadomo=C5=9B=C4=87 napisana przez Alexey Charkov <alchark@gmail.com> =
w dniu 23 cze 2025, o godz. 15:58:
>=20
> On Mon, Jun 23, 2025 at 1:19=E2=80=AFPM Alexey Charkov =
<alchark@gmail.com> wrote:
>>=20
>>=20
>=20
> Okay, I've bisected this.
>=20
> TLDR: Linux and u-boot seem to have nothing to do with it, opensource
> TF-A doesn't work, binary BL31 starting with v1.09 do not work. BL31
> v1.08 and earlier work fine.


just fyi:=20
to confirm: replacing only bl31 to 1.08 makes all good
with perf gov. clocks staying on 2200/2300
clock estimations are predictable, constant and estimating constantly =
2400
ux is =E2=80=9Elike=E2=80=9D on 3588

Alexey: many thx for finding root cause component!
 =20
  =20=

