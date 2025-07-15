Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81CDBC83F17
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Jul 2025 09:12:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RWritYCN5g5pbGNVdS7uOitde6lUvDNW8r61mTT/h1I=; b=EzZP6+OEgbl7iqT4brI+72jjZE
	z5xYBGYrmQ9xdl5Hahs6ti1CxWb43BdI7RUC1yCIHWJO8DSVWZmNMqPuoIi0GqF8x2ShIwoE0MrQx
	2asS591nV7Oh8l5WUYJb/GYPtvSeIrQb+LBJDhXPxinReC91h0zCsSIgw0wd7+L/MsVQsoLSnKeKE
	H9r7CSoyAlTf0iRpQsNT0fPTZS2jd972zdGoB+QTW/MYXkS52NP9lsOHiyYZAHeb3tg/VoixSPgPp
	8hjkIwKRGlUF/6Q4b393d8sdXpMPn9xBmiywwaf4dB3panQij/rIuh1QNWs2Bpu61BLJ71hsdA576
	02A28UYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubbiF-00000004dV6-1BN2;
	Tue, 15 Jul 2025 09:12:35 +0000
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubavz-00000004Vac-2RwU;
	Tue, 15 Jul 2025 08:22:44 +0000
Received: by mail-pj1-x1033.google.com with SMTP id 98e67ed59e1d1-31329098ae8so3875695a91.1;
        Tue, 15 Jul 2025 01:22:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752567763; x=1753172563; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RWritYCN5g5pbGNVdS7uOitde6lUvDNW8r61mTT/h1I=;
        b=KUDJwOqDE0prEwzgsSQP+cCdhvI6aciiQ0bCrexyPJAjoHgfYxIl4koWDP4aWRJd4j
         N/nLRhKeSxC0aTI6Whu4+s5771rAdMFmLojOsKwtS13DIXat83wXln/xLQMf3fUIJrts
         JjFk1mjd9HCxYHf95DJjmrs1XFIb3vL9CTb6ZBNH/fAYxOxj+Jz/Rha/gc+nrv3T02zd
         VqrKQHXHmdcVqrsj+ANc3DcVo+YrBO6S6Clcxc46Tcq3ucE/GlfCTeFysjVKLWUtt6Zd
         kh0KsaTDLTv7OO2l9yQywZrZazWUbYI615bqqPX+tK97eSfMO9Rd6Kglaj9mV4Nn4HLO
         xsXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752567763; x=1753172563;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RWritYCN5g5pbGNVdS7uOitde6lUvDNW8r61mTT/h1I=;
        b=DFLdW1HOUagkZMZ4k71QrnbkfiSxAYjlZqXF/53XSsBwDNWUyDTqH8urbFAdJ8r4Pb
         uE6njuHoO5apyzJ6CSeZ6lOBa6KmRCITlCbRPmpFR6a/ZUTEGE2YecIBncGArblnbpkV
         Ov2oilRJ9jx7oYBBU0GH+ZrICubxuBc9EJTDqM9v8rWWJf2G0JbEgeA4Ri/8E4tEXQ2E
         pFNxFgVIfhmh9EALuTAzjbTWh7vdZpN28yV2Gdn4y5Ry/dpDATgM6KTWiKi8nlFkN6D8
         MgOVu06oac61ET7wS2RiioM44Z/BhkZ48usZ+gBp5Foiq2cA5cyH12Tu1MoBgLZnV0UK
         bkuQ==
X-Forwarded-Encrypted: i=1; AJvYcCUZQ02iKA3SIdc+NoH6zblOuArq/nM/ft91/ENNpmIV+tShxqQcf4XtQU3rGEpILHItXBSbi3ZDRQ6Iru1O58R4@lists.infradead.org, AJvYcCWcEQ6r84SqKmplQ9IzsS7Gfr0MWJjrpgYtXb3M4K2EJiwqTQMj1P6hA7/gGgTSOS96ymJhas1GxGaKTQxx4E0=@lists.infradead.org
X-Gm-Message-State: AOJu0YzmnGI9UC44oah7JDIA7jCaZ8iX6RUeFMcpNdE8qdhxVFygqlW3
	JI+h9w692icg34qk3glX3mHN57z4YFtDJmVPNcwqMenrz2NBE/PE9oZxD7fUJpkaGaqzxbDaDBR
	jlAt5RNX0hmoP2fTpvvBT9BZ3JkJ3/JX49fGPeXf2Z/Q/
X-Gm-Gg: ASbGncthT+7dlPhBlgcJpx/8fg678ke3peovh92evz/gePAiUx5lyjtQswAvvzVtlVu
	sl3SUDGjxbbYeU1aQ4YzJ7NnBIMm26eZ0ZWXQ2mjttBES2/J8JZw/BVy4EHAPPiqP07q2CCXl3O
	SMu6YI0zrtz47VKd9H56I2a1l8vITX8DuXxvN5Te3o0lJhYMsAJnIgHetnWFR4Mw8bZKR6ht3yu
	aR2
X-Google-Smtp-Source: AGHT+IFMxGCTEEHrdB/kCBZaEP2hviqLVU3pJ2QVRJLd/x1wtIgr5OBebZnjJManRyxnm1Ft0Bmiw8ilHs47bZtO0xI=
X-Received: by 2002:a17:90b:17ca:b0:30a:3e8e:ea30 with SMTP id
 98e67ed59e1d1-31c8f9ba0f7mr4109857a91.11.1752567762558; Tue, 15 Jul 2025
 01:22:42 -0700 (PDT)
MIME-Version: 1.0
References: <20250712210448.429318-1-rosenp@gmail.com> <20250712210448.429318-7-rosenp@gmail.com>
In-Reply-To: <20250712210448.429318-7-rosenp@gmail.com>
From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Date: Tue, 15 Jul 2025 10:22:31 +0200
X-Gm-Features: Ac12FXwMmQCfsqg5mbExKPqdb145bDccah5wrkdnBfsA3tKTWDoudoBn9JT36WU
Message-ID: <CAMhs-H_w9f334A-T5OfbngCZ4bgM+uJ27WAff2Q+k9dJhHr96w@mail.gmail.com>
Subject: Re: [PATCHv4 wireless-next 6/7] MIPS: dts: ralink: mt7620a: add wifi
To: Rosen Penev <rosenp@gmail.com>
Cc: linux-wireless@vger.kernel.org, Johannes Berg <johannes@sipsolutions.net>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Stanislaw Gruszka <stf_xl@wp.pl>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, 
	"open list:MIPS" <linux-mips@vger.kernel.org>, 
	"moderated list:ARM/Mediatek SoC support" <linux-arm-kernel@lists.infradead.org>, 
	"moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250715_012243_621305_0BB1207D 
X-CRM114-Status: UNSURE (   8.26  )
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

On Sat, Jul 12, 2025 at 11:06=E2=80=AFPM Rosen Penev <rosenp@gmail.com> wro=
te:
>
> MT7620A devices all contain a wifi device as part of the SOC. Add it
> here to get it working.
>
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---
>  arch/mips/boot/dts/ralink/mt7620a.dtsi | 10 ++++++++++
>  1 file changed, 10 insertions(+)

Reviewed-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>

Thanks,
    Sergio Paracuellos

