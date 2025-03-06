Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52E80C282D1
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Mar 2025 14:10:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:
	Content-Transfer-Encoding:Cc:Date:In-Reply-To:From:Subject:Mime-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kWV8ljageqb0izUaC+/nzAbBvrv81I+4eNjdwXRR/Fs=; b=SM/U84KtOcEGfilaDihfs7fCed
	zMVDhHU77YMah3GXPcHUDT7tMxNp1Kz5Oevut4YIndjU1jCZaNhOAskWmy3BDXc+eoIUsJVrwyPNb
	hpf+yirvf/fovo1T+Vh+2Jfpxd2RbCyKLHoymvsAF4wmR1SWmcjdBFnL5d5Uc9eveTg9xHXW1Stdg
	kc2Q/eMBNVLRBfFxVO43Ti+bLpFgakxkpwbM+AdoJNG+j9gplQe6sE+OHWXKTHGeD1eB9FMmkNKit
	v3cjcI++R+TPeVoWvDRkaAmXm/kMisQydlUys6cQEAvlSaDJM5mObV22nd4u3FVav0eGl/mlCXPp1
	knLShlJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqBvP-0000000B9ld-3iav;
	Thu, 06 Mar 2025 14:10:11 +0000
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqBtn-0000000B9ZU-2rx4;
	Thu, 06 Mar 2025 14:08:33 +0000
Received: by mail-ed1-x531.google.com with SMTP id 4fb4d7f45d1cf-5e57c81d5d0so839488a12.2;
        Thu, 06 Mar 2025 06:08:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741270110; x=1741874910; darn=lists.infradead.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kWV8ljageqb0izUaC+/nzAbBvrv81I+4eNjdwXRR/Fs=;
        b=FKzXl6ImPAK42sC4/r/SbrkaIkgX+QCY/eUxKAT7n+mPiEEWucFBbt9ID4aDHPekho
         UYZgXkuunboZpUtlDygraK4WpqNw/Kwt0UV4+AhVShcH9j4iXSA7+VxvV22aFdAxnn2K
         CKkzPdAKscEAJrjGlrw6e53asWlE3ojz9gGrrWCrU0+r1WvSI9/bQ9llC8rBl1r9as6o
         6YSHuRvLI8f4/ob8q+2e+QIQpbaL51V15TgkL8n9eGNTyOfM7wTGz0HUwIZDpN/kOhoQ
         MYYFwGVcd73SzOj1Zgcp8KBHqjU63294a1/WUovl9/U52aefxr5x70hUxvA2Zneq2nHB
         m7Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741270110; x=1741874910;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kWV8ljageqb0izUaC+/nzAbBvrv81I+4eNjdwXRR/Fs=;
        b=YbJLyN3U2zywwsv/1GTmBQpthafPOO6MrZK+DUfAjzX2RY/HxPQsWhs4tE/QXPGZCg
         T4evuYbL7W0t5EwGTvo3n2XUDNqSRsk0cwIE6IQi/gwwu9+RU/4WwUqkPAm15umgmN5E
         uhqA5IfhLDzfuSkZgjOhymWM5Af7FtatNsvMHzxfbUiXk2BofcMgJtz1o/D3+C/26NdY
         VW9sDNuzQiBIVIC4+1GLS/abE0a5IEzC6oRIJy7G9Zk+BcVC30IfZPWW3l46/rbsk9+R
         TNi24lTbyNTbaHItbqVY0ekeu31BxnDCHH3GhYBYkkGgFtkuuUGNzyfr3oEB93vRnHaI
         cOLw==
X-Forwarded-Encrypted: i=1; AJvYcCU8sLlt4aGQjBVdIGs9BNHkFlLy/ixZH4r8LWA9OhyvAEbMa15GwbY1ewJ0IHeTQ9rjBzaeylpOTE87CISvs8I=@lists.infradead.org, AJvYcCWASSjc/4YBUf6ZJSoJoBgBOjCh4LQRwAZ4DrLC3g2m+Bc/OvcvajqofXRNpgSa3uLrat7dh+38LrBiTewqiNnt@lists.infradead.org
X-Gm-Message-State: AOJu0Yw8kB/l6wZJezpSDMOTmECObd0Tta6ADPBV7Rq9VRhjQpABwc5w
	E7BdepuWgAkax+ElOnLPUMBGq2OXFzxWM5iHb48o95hCsE2uJ/1R
X-Gm-Gg: ASbGnctWiGbWBDEJ1zUNuu7yhQNU+xiwoeEgWcOg9nK+TUMlUJun2CKl9SJZGdAZ0Sf
	1IyMrf10cEat+3oaHz3sifbyD/jUUJih3RUfnnvJG8p7cKaEUp6fYWii6w8y/3VdgKEUoF3ynfw
	gfOktOAL0fmM32NBIQ+SfzY4PZg7kf9fyTW2SQxH7YFUNidpHfYFbCbXmuBt0EzL13hGzfMXc6P
	uQ4Jk3fCv/KmSE4gSz4hD1irafnqKFXjlUYGiv/g5OHhwsldwIn+L8fyjasMV/1LHuqC33q6xPS
	ZBYR/E4H27XaeoScifN9eVDwTI8s//YpAs2aWziHK1e5Q2JSzo/j+GaPkf2e/GgxPu4ma7vtKwJ
	DiaXeykzqMDYVjRpOe2hdECKvdQ==
X-Google-Smtp-Source: AGHT+IEjOK8tItru0CnDJMfpuW+YocWEOgCRwuy6WiSEato+NxCIl7mKq10KFt+G6Q2r3z6rTWjduA==
X-Received: by 2002:a05:6402:2186:b0:5e5:be7f:a1f6 with SMTP id 4fb4d7f45d1cf-5e5be7fa870mr8495205a12.1.1741270109496;
        Thu, 06 Mar 2025 06:08:29 -0800 (PST)
Received: from smtpclient.apple (89-66-237-154.dynamic.chello.pl. [89.66.237.154])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5e5c7475e9dsm989794a12.30.2025.03.06.06.08.26
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 06 Mar 2025 06:08:28 -0800 (PST)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.400.131.1.6\))
Subject: Re: [PATCH 0/6] Add support for RK3588 DisplayPort Controller
From: Piotr Oniszczuk <piotr.oniszczuk@gmail.com>
X-Priority: 3
In-Reply-To: <46c0d239.a4f5.1956b619b97.Coremail.andyshrk@163.com>
Date: Thu, 6 Mar 2025 15:08:14 +0100
Cc: heiko@sntech.de,
 neil.armstrong@linaro.org,
 sebastian.reichel@collabora.com,
 devicetree@vger.kernel.org,
 hjc@rock-chips.com,
 mripard@kernel.org,
 linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org,
 yubing.zhang@rock-chips.com,
 dri-devel@lists.freedesktop.org,
 Andy Yan <andy.yan@rock-chips.com>,
 krzk+dt@kernel.org,
 robh@kernel.org,
 linux-arm-kernel@lists.infradead.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <252BB2E2-4BC5-4402-953D-F7B30EA5DE14@gmail.com>
References: <25401bfa.291d.19564244e54.Coremail.andyshrk@163.com>
 <75189787-28E1-4FC2-8E10-4960B3877A6F@gmail.com>
 <28b0d3fc.bb3.19568f6b5f8.Coremail.andyshrk@163.com>
 <44213B17-FE14-4FB8-8319-1E31BBF6EAA0@gmail.com>
 <74c154b6.8c50.1956aa8c8d2.Coremail.andyshrk@163.com>
 <1573D5D6-AFED-4D92-8112-B0C6BB52D5FF@gmail.com>
 <46c0d239.a4f5.1956b619b97.Coremail.andyshrk@163.com>
To: Andy Yan <andyshrk@163.com>
X-Mailer: Apple Mail (2.3826.400.131.1.6)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250306_060831_722891_1B208243 
X-CRM114-Status: UNSURE (   7.07  )
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



> Wiadomo=C5=9B=C4=87 napisana przez Andy Yan <andyshrk@163.com> w dniu =
6 mar 2025, o godz. 13:15:
>=20
> Hi Piotr,
>=20
>=20
>=20
> Then when you DP cable plugin, you can run command as bellow to see if =
the driver detects the HPD:
>=20
> # cat /sys/class/drm/card0-DP-1/status=20
> connected
> #=20
>=20


Andy,
Thx!

With above changes i=E2=80=99m getting =E2=80=9Econnected=E2=80=9D.
Also it looks crtc gets reasonable mode: =
https://gist.github.com/warpme/d6220e3cc502086a4c95f05bd9f9cf0c

Still black screen however... =20=

