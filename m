Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A2F7D2ED0F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Jan 2026 09:21:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OXF/P9VEQfJJ8i8D8me4MwtOeFLxEnKqU9NmPAC1YHc=; b=j0qSyxhkbehHdKC8l3wn1LBt5O
	JtXrhZPeamNZRGVzHj503AMgxuUrgfkPfjNOBnIgR62QAEMhlUrJ8CQzzq2dZiA302UvLlywHo78R
	kLDcKIhN+N3SrSjIa6U/l6lPTsoZ6uSIbhZI4Ccsu+wj+kKSPHxBL5urZmlQ/Oha6HyJmyao9HgHa
	qZgZu4wQ2+9Z2IAl4C6Nf3FX+H70bVtbFMn+Nn+M7dMmhxlLhj4wl3omkgB2M6oJCcUOiOEy5ss/B
	dgJXLCMdGH5yn0d/Jnmo0xIhot5UNbjc09zT83tI600G7dY+VZ9pbbFjGqadw5ytF9Pj9sUnvF2I4
	SHxqtElw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vi7vH-00000003WW7-2XD8;
	Tue, 20 Jan 2026 09:21:17 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vi7vF-00000003WVe-3WgF;
	Tue, 20 Jan 2026 09:21:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=OXF/P9VEQfJJ8i8D8me4MwtOeFLxEnKqU9NmPAC1YHc=; b=JFoO3X/31ShkwGFeoJua438lVX
	I9lQFhXy/qzUijrhubYOGPYKLSBhhvGPyX4tBeGmHjfUYDNWQBHKfm9Sq8MygTdyBuf/HOPsfG4tP
	31RVUvi3YRJhRqj//hQmwVlHAGjkxAwWMaCS+vks8H3Pl/E/qe2Ux3atFsm6+3lF4oc7QAxt+8lSm
	leEad7NbM0B2LioM/a4oQzS6WD+N4kBk+kYWh/Vaznx49/Rz4h9VfGrT5w89xW97LAIiOh6c60ULN
	ZQap1RRC0ejab+OJe3hD8yuXJMzgqeOZe5TkkMmLm0ZvCTGD937bndPDAAqbyAJS3AokxDyU5mAm9
	ySVQxWig==;
Received: from gloria.sntech.de ([185.11.138.130])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vi7vD-0000000DgiO-0jIR;
	Tue, 20 Jan 2026 09:21:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=OXF/P9VEQfJJ8i8D8me4MwtOeFLxEnKqU9NmPAC1YHc=; b=BimZu0SuvzB3jaUW5oNSKxEaOu
	uB3H3zCEEpx7yA6si/29a3bsR5iKClQLYlHKfTbQFEk8Gmfzpt+z47v2bP3if1Ke0/7lrocAxi0I6
	tc+T/tBM6Pz5+/9yzGEFeZYC5BzyOpLC5j3QS0gTRKAdGEG0We3410D6IoeBzojXifV5W1oB5C8c2
	lt+LPC710XKWmU8vMpx50S+2aKaaB5Dspupzyyc/QNocLut0BI588Ganj5QG71PMidnAWVe9p7rxn
	rTWbRKfShFWUmDMHqf8GqLJFhgeoaK/Bt0yzBGCMFxxuG8m39cbaNJza5UI+pJZwGMbHkeLKXyocU
	UGHAiwmQ==;
Received: from [192.76.154.238] (helo=phil.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1vi7v3-003KRU-PW; Tue, 20 Jan 2026 10:21:02 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: Quentin Schulz <quentin.schulz@cherry.de>,
 Alexey Charkov <alchark@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Shawn Lin <shawn.lin@rock-chips.com>,
 Manivannan Sadhasivam <mani@kernel.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: rockchip: Explicitly request UFS reset pin on RK3576
Date: Tue, 20 Jan 2026 10:21:01 +0100
Message-ID: <40619400.XM6RcZxFsP@phil>
In-Reply-To: <8960787.MhkbZ0Pkbq@diego>
References: <20260119-ufs-rst-v1-1-c8e96493948c@gmail.com>
 <CABjd4YympEqbiN9-Kwv40YtaCh6bu=3PBQPyvvGgKCQbLeZmZw@mail.gmail.com>
 <8960787.MhkbZ0Pkbq@diego>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260120_092111_269105_B212570E 
X-CRM114-Status: GOOD (  11.48  )
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

Am Montag, 19. Januar 2026, 15:42:23 Mitteleurop=C3=A4ische Normalzeit schr=
ieb Heiko St=C3=BCbner:
> Am Montag, 19. Januar 2026, 15:05:16 Mitteleurop=C3=A4ische Normalzeit sc=
hrieb Alexey Charkov:
> > Happy to make a v2 with an explicit pull-down. Will wait a bit for any
> > other potential feedback though.
>=20
> I'd side with Quentin here, having the pin firmly on one state, when no-o=
ne
> (board nor driver) is caring would be my preference.
> Especially as Quentin said, this is the hardware-default too.

Also it would be good to send that v2 sooner rather than later, as we're
pretty late in the current development cycle already.
(We're after -rc6 already)


Thanks
Heiko



