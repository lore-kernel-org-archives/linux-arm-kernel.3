Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FC34C282DE
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Mar 2025 08:53:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:
	Content-Transfer-Encoding:Cc:Date:In-Reply-To:From:Subject:Mime-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WE8HEXPDHlP3/Ze6vBhaSEBaCZ2xj3Huz/M2ft6sExY=; b=d3ToGNPaYSes2lvH2znduIBDKL
	Smr01mdzRW2FMDw0+ow6ZTSH5Sl5Mt9A+sZ7s+Dyj8P4xnMRxxbE8VI2ECqMywWt/aDLbhrPOnSgZ
	n3gFX0fLYOQo62IoIhfyQu4WnEBuhaC7oVjek+n/lqw9n8JlYG9jj4ynXxWkZfzQju7hewBosDAya
	57xPgjsBPISN9Po5GvEexx+N1S1SyrqXW/laG+R/LFvdkoBvrnTvWZ6sh6b5DGgbBuFAKnMLAPI3v
	Z70bBh+N14QlvkK+kMj/xe1J/Xm8wq6W4P2TALMch2ESZhjvH1823bVfhEm55rRKdObT0qaskjku0
	lnmMARIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tq6z1-0000000AOtt-34UG;
	Thu, 06 Mar 2025 08:53:35 +0000
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tq6vb-0000000AOEC-2hIP;
	Thu, 06 Mar 2025 08:50:04 +0000
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-5494bc4d796so474901e87.3;
        Thu, 06 Mar 2025 00:50:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741251002; x=1741855802; darn=lists.infradead.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WE8HEXPDHlP3/Ze6vBhaSEBaCZ2xj3Huz/M2ft6sExY=;
        b=F4lDzico2boWTPAiGvXPUQYm7s+t9GEj4CA41WzPOB1e4XmlQ6wKgRvXbl2Me2TSSu
         zRBfQNezsgz2c9U7SzgKqbSWO9iDSMRlcUE7AXpsHr5zBVqK7+3A2b++e9O2W/cssMn2
         O/gOFsSP0t24eENxz0EWHSImp3cr/1ZilFPgNd0Rb6FCM6ZB58f+zXYOMes3yx1Ki/so
         Tg6girLmsDWQ52yZ1xnf7UREPkx4MUZWLMsSWQaO/vauLfxYlhAXFQKyUBx3sgxTlOkc
         m/h8R1q5xokIskk7dYpp402VMmFBGvsgQvFI0mWAt2D3Giv6Dr6VoN4tG+30Ttt0m640
         hJ5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741251002; x=1741855802;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WE8HEXPDHlP3/Ze6vBhaSEBaCZ2xj3Huz/M2ft6sExY=;
        b=p/Olb52BR5VeQTQo4RgFkwhoJq6q4EgGtBp233gp7KBw5o3i5Gqx9qYknq5ahWUxxH
         nOqW6V74POkF6E0Svx9zZAk9etO4MVAZgTpd8d+rlt+/2k5kGsFih1BF1Pjnt8JFD5YG
         nlGy74Cnwcz1SqnjOcL/a6HT2FqMi0OO8MDD1dWkWs/A0F+S+Tsw5DSkQpvkhJ3Q2K+3
         VXlwBehq5bnLBmE2ZEDyTsomrYW/iwaAVDrdXwCANx6aD1/eE50OqrWhGakiNrjeHp7N
         FR/53KXpuRSOGNuhft4UJj6ToUJdcBGMNSVTcBCoK2y5iZp+dIsAF5fOltYWA0T6nOLL
         iTSw==
X-Forwarded-Encrypted: i=1; AJvYcCUm6TQZ4rIUdyv+v0fwpnNn+jvdDlHfcvSB8macrwl5rCWJxRyJZ7o8ti6wqyHc+Qiuj+72fFP9qOdQ95L74rTR@lists.infradead.org, AJvYcCXX9zFuvrQQ7qW9JQ6VyYL22W7OzMWhzIz4D+fkFtP4pv9dmMUkzUg7hT3vNDoVbeyjzGJRrJdywoNH4DxbZ5c=@lists.infradead.org
X-Gm-Message-State: AOJu0Yz93bQt5xGGxgGUiYOGlSSA8zjcKOUZ5QxVBG6/cOuXf04K4OZT
	uMACwxQ7809cy16UT8UFRORquXlTjSaTf4aOj9Ve+FSjspCAbIEmgp4ILw==
X-Gm-Gg: ASbGnctLvKC6OtvmNWF118ZrjlsUO9JXRbGBUt3TBlbl+HQvSw7PWAC199RJ/xHk9gs
	/UAMgICcAeUVsF6rW0XFzh36TuRvyv+eyGqcKZjZSAf4ewNgGbsnskj1tOHeBjpCxl75e19h1gd
	18SmvNDZviuKhcD1cpYgVTR+zBdeFdgdFRigXtZrNsPfUT4ohWilookujxb6WG2CSgw2EjHC50N
	BAnNq9xvqUQVjPr3eTgExRzRjCMc2647EwtnUgDlbY9emnfldEyEmtZrBbgANfGdfdp6OFmpuzQ
	mOrPABkbX+JlCdYx9GCF4d4yS6072mqfhsJsn1CQdS8y8OHO6SY8IuyEtUN159shQ3/wYRbDSzI
	EU0KS4IsKw5jkXrZtczlD9UohIg==
X-Google-Smtp-Source: AGHT+IH7rJ0bI5uRIzIqrHdOqVbIP+Y1Jj/C4uRWsNFMJDfrRYE/cGnXxp+rRBuh8BWvmklTgurn9A==
X-Received: by 2002:a05:6402:2157:b0:5e5:b9b1:8117 with SMTP id 4fb4d7f45d1cf-5e5b9b18547mr3313222a12.18.1741250533408;
        Thu, 06 Mar 2025 00:42:13 -0800 (PST)
Received: from smtpclient.apple (89-66-237-154.dynamic.chello.pl. [89.66.237.154])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5e5c766a5f7sm587786a12.58.2025.03.06.00.42.11
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 06 Mar 2025 00:42:13 -0800 (PST)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.400.131.1.6\))
Subject: Re: [PATCH 0/6] Add support for RK3588 DisplayPort Controller
From: Piotr Oniszczuk <piotr.oniszczuk@gmail.com>
X-Priority: 3
In-Reply-To: <28b0d3fc.bb3.19568f6b5f8.Coremail.andyshrk@163.com>
Date: Thu, 6 Mar 2025 09:42:00 +0100
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
Message-Id: <44213B17-FE14-4FB8-8319-1E31BBF6EAA0@gmail.com>
References: <25401bfa.291d.19564244e54.Coremail.andyshrk@163.com>
 <75189787-28E1-4FC2-8E10-4960B3877A6F@gmail.com>
 <28b0d3fc.bb3.19568f6b5f8.Coremail.andyshrk@163.com>
To: Andy Yan <andyshrk@163.com>
X-Mailer: Apple Mail (2.3826.400.131.1.6)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250306_005003_696442_824A866B 
X-CRM114-Status: UNSURE (   5.58  )
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
6 mar 2025, o godz. 01:59:
>=20
>=20
>=20
>=20
> Both of the two config options should be enabled.
> andy@Pro480:~/WorkSpace/linux-next$ rg DW_DP .config
> 4044:CONFIG_ROCKCHIP_DW_DP=3Dy

here i=E2=80=99m a bit lost=E2=80=A6.
greping on full kernel sources (with applied =
https://patchwork.kernel.org/project/linux-rockchip/list/?series=3D936784)=
 gives me no single appearance of ROCKCHIP_DW_DP=E2=80=A6
Do i miss something?



