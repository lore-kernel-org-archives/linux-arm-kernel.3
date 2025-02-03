Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7D6AC02193
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Feb 2025 09:43:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7peDE4226gPyH9UcLU1dQdA0OBGIDudGsx9OB9dUlfk=; b=XX0ehc/nTS/YvNLrRdD8A6h8i0
	gdz9UY8zHnMQStHMuiD1UwfxJ51z4FCLm1APK88cjNsOfdl20UvEDijq7rVf86T7KbiNeB8FzMkbb
	GUz0cpMzSzDcZkDcf0bbvZkkn2CzTCU8h9DwG6AEe5S4YGQDOWbCxIR+vnKdrhsphSNj4O+1jC3bg
	l8KCgPf8O5rd9/OuSQNk7cV58j0u9dX5T33EE0bCArLZ4olhaHeggLoFx+Aly+TTZvVF7s0i7OlUz
	HEn9PwfpLbZMYvTUB6bfVSI+psTuB0XdVNGXkE30XZslAyHMWi7w8UVgjpsIn3kmOkuo684A1v0eT
	WhoV3MfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tesys-0000000F1a7-1xXK;
	Mon, 03 Feb 2025 09:43:02 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tesu1-0000000F10i-35EG;
	Mon, 03 Feb 2025 09:38:03 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-385e06af753so2017184f8f.2;
        Mon, 03 Feb 2025 01:38:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738575480; x=1739180280; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=7peDE4226gPyH9UcLU1dQdA0OBGIDudGsx9OB9dUlfk=;
        b=JYHungmCwUHRcdUT5DbEfqncjSic/JOiJa/cLNfAcL84u6rzoMjm90qyQHzssZ8rwC
         +uaoRL3CNoCEp54MEvL+j0oNT606mt5j5PLmzO4ujHdisz8tkFurEnQJJoPHJQcabXoH
         JZUrlyTIML57/u184yjb8zm+Tc1WMo8HtubEYTmkO61ixhXs+FauQB21OibU0zMz3dSG
         ZRUaTuctyJ0Kv26kSOFBaVRxnjpDzm1ZVndczDWV8y4kBuCouyvSwvJuzQ3ZI6gYiTSz
         E4QED3yjGXv+VH3PeS2WilYzNlR2rdq9xU47SU9bgVhPjZDLOWHLPdxJ4cnrjLQjA8gU
         jDKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738575480; x=1739180280;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7peDE4226gPyH9UcLU1dQdA0OBGIDudGsx9OB9dUlfk=;
        b=HlCmKNQel0keglrDIDKK4QzgMnRZtHbV9OD/duTuz3lv7jZFwTWt3HyD6wk7m4P5hq
         pzG1WOmb2HeLFzWGNylMaFdihPlBB+aj3T3yYqr5VgpWSx6bB/foVr8Ha528aJvm4uga
         w/G31+Nl3qLRcOdhUoHpHZwZQhohu2R1IoJyllPOFPZGBsoD95cp3MOvPNm4aSjwHH22
         565xNPj12EQpU1zKXuM5KPmS4RugbgRSSdZVkY0OTNg50XuNJFmWW9lPKgbPLW+qasSk
         MixIRmyPpYnUflGWBZ9HMdeQLFNms1EG77/N4pb5bj+LyLlg78lfNtV0OOulvpJ8jhZe
         N0sQ==
X-Forwarded-Encrypted: i=1; AJvYcCUdaG2zh63pfr6pZMyl3c/OK64EIv2hnWp9tb8J4SoMkvjf0riB5sPJIIwacxf3xXHk/seyVxysjRSIIyCs4wpn@lists.infradead.org, AJvYcCXqEnWhGgNSgwZ/3UR3ILxB0Ih5H68L9i2UO6xWJ2hMPa4bcYNaTI3TuZ38YLChpLPGE1B42xLHMZrnw1b1/H8=@lists.infradead.org
X-Gm-Message-State: AOJu0YzaUspWE1ancaO7QQiRXqeEJ5Apnql2CRe8E0jBqE13GNS0ngSe
	uoeWp1eLNvjgTYsmEIXudAc8ExDIuuXbkLv/GrPE3wL5l4SlRlwI
X-Gm-Gg: ASbGncupjr+0xQA353mbdI9uOMHZw1ZliLPRNXv8v+bUVn0Lr9TQzwxAlIVC/Wy0lJw
	SwI+tSZ5iIF1aPgmFDlXzXGPdW6hETaSsG+F629Yh7ypeUF8CyDkCj3ycX3N2AbRWWTpsc6TMUd
	l4HwflZSWhTRCc2rDBU/YMkH+WBuFzJDJbzdKassiLcCYb8GgHq/orovHaGh+zxtVmMUlZIZyp6
	lMgy80Gk5J5l7q51qXqp0t349HTcEDndbCkzhDnLPIFkHDFS6SMsvr0ahwmIjf8nWCG/aN4RFrj
	/LpGFyZShQhmCS7cJg==
X-Google-Smtp-Source: AGHT+IHdEwQPMp/IYjrBUKP9SI3ANoh6a27II8NCdtsAqFDvpkqpssdT12J2jM47RJ7YS6f0++FlHA==
X-Received: by 2002:a05:6000:188d:b0:38a:88bc:a8e3 with SMTP id ffacd0b85a97d-38c519699demr17237624f8f.33.1738575479649;
        Mon, 03 Feb 2025 01:37:59 -0800 (PST)
Received: from [10.176.235.56] ([137.201.254.41])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c5c121951sm12114646f8f.45.2025.02.03.01.37.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 01:37:59 -0800 (PST)
Message-ID: <ceeee4f93b22ab53c4243eec85449a95b0305c70.camel@gmail.com>
Subject: Re: [PATCH v3 1/8] scsi: ufs: core: Pass target_freq to
 clk_scale_notify() vop
From: Bean Huo <huobean@gmail.com>
To: Ziqi Chen <quic_ziqichen@quicinc.com>, quic_cang@quicinc.com, 
 bvanassche@acm.org, mani@kernel.org, beanhuo@micron.com,
 avri.altman@wdc.com,  junwoo80.lee@samsung.com, martin.petersen@oracle.com,
 quic_nguyenb@quicinc.com,  quic_nitirawa@quicinc.com,
 quic_rampraka@quicinc.com
Cc: linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org, Alim Akhtar
 <alim.akhtar@samsung.com>, "James E.J. Bottomley"
 <James.Bottomley@HansenPartnership.com>, Peter Wang
 <peter.wang@mediatek.com>,  Stanley Jhu <chu.stanley@gmail.com>, Manivannan
 Sadhasivam <manivannan.sadhasivam@linaro.org>,  Matthias Brugger
 <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>,  Andrew Halaney
 <ahalaney@redhat.com>, Eric Biggers <ebiggers@google.com>, Minwoo Im
 <minwoo.im@samsung.com>,  open list <linux-kernel@vger.kernel.org>,
 "moderated list:UNIVERSAL FLASH STORAGE HOST CONTROLLER DRIVER..."
 <linux-mediatek@lists.infradead.org>, "moderated list:ARM/Mediatek SoC
 support:Keyword:mediatek" <linux-arm-kernel@lists.infradead.org>
Date: Mon, 03 Feb 2025 10:37:56 +0100
In-Reply-To: <20250203081109.1614395-2-quic_ziqichen@quicinc.com>
References: <20250203081109.1614395-1-quic_ziqichen@quicinc.com>
	 <20250203081109.1614395-2-quic_ziqichen@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4-0ubuntu2 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250203_013801_773945_8B7B921F 
X-CRM114-Status: GOOD (  10.85  )
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

On Mon, 2025-02-03 at 16:11 +0800, Ziqi Chen wrote:
> From: Can Guo <quic_cang@quicinc.com>
>=20
> Instead of only two frequencies, if OPP V2 is used, the UFS devfreq
> clock
> scaling may scale the clock among multiple frequencies, so just
> passing
> up/down to vop clk_scale_notify() is not enough to cover the
> intermediate
> clock freqs between the min and max freqs. Hence pass the target_freq
> ,
> which will be used in successive commits, to clk_scale_notify() to
> allow
> the vop to perform corresponding configurations with regard to the
> clock
> freqs.
>=20
> Signed-off-by: Can Guo <quic_cang@quicinc.com>
> Co-developed-by: Ziqi Chen <quic_ziqichen@quicinc.com>
> Signed-off-by: Ziqi Chen <quic_ziqichen@quicinc.com>

I have reviewed patches [1/8], [2/8], [3/8], [4/8] in the v2, since you
just changed coding types, and typos , but no logic change in v3. Add
my review tag agaion:

Reviewed-by: Bean Huo <beanhuo@micron.com>=20

