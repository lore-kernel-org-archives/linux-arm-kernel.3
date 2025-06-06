Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E245CC61CE7
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Jun 2025 17:51:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QkCC156cFLZ32G7VZvrODLuLWj+/VBaRP7kkagtS93k=; b=r766R7vB6IBVj90jC4MW4PFR9L
	ahT8bkr2Qsj9JvoWhyjQqsFe5ONGvAEPeNdpkTwdGTbSyBnWynQZAc7tQGzrn0QOjTTUsO4NFoIJu
	7z1WeAZ6QOssv+8F2h1PQqKnyf62ZHABVnzl/QGhJZAwOx4AT5IeTeleNHGFUrBDpgoMQGOY/zaqz
	LE4KjWBQ2ph889PCypKixX5ZH87ZY7J46I9VUHg228j/UxTy42iwUO6Xz22g9SSIjN/rKReGgBAYN
	hMQE32826QkkuMEZpBU5+Yi/ADjGQv+FXIOyz4IrmoNi8cvbdW8UYEuzsk1YApxLXoUacNZipNar8
	91qDDHtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNbDo-00000000l1T-3nAi;
	Fri, 06 Jun 2025 17:51:16 +0000
Received: from mail-ed1-x541.google.com ([2a00:1450:4864:20::541])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNbBh-00000000ksJ-1IL6;
	Fri, 06 Jun 2025 17:49:06 +0000
Received: by mail-ed1-x541.google.com with SMTP id 4fb4d7f45d1cf-60700a745e5so1558734a12.3;
        Fri, 06 Jun 2025 10:49:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749232144; x=1749836944; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QkCC156cFLZ32G7VZvrODLuLWj+/VBaRP7kkagtS93k=;
        b=BI7Qti8IxjdiG7/gqU0QmkT0lP9Y4C27kp6Px41W+n/pl9DLItbTuvdEz2uTwA6GaO
         ItYx9FMFFu94Jd3OUvWPHTYId8OjECz12DV2DBpzq1Yd89VA3BP6mAsnYS6GbtB2+Gyk
         LsnAI/zyr2qaGmkEZcj2aucmTNsCqA1I06poPO02+usi2RzRrzrCY2e+CmviDpL3jonD
         OJPAzUyjfnopRj1Eyvp0rHY70+9Rbr3iTi6bGO6PR2+QSUP3meE4lUJjPPvA8m5/xvMJ
         Ju1oGA41XCdpqQDK3ojGbMW6bd8rEJ76tq2V0bAvvwDx6bB6GxVcbvETnNFqxRrHca7p
         dYwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749232144; x=1749836944;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QkCC156cFLZ32G7VZvrODLuLWj+/VBaRP7kkagtS93k=;
        b=pJOvUk5JCgRbalMKrrwJ9uXsqOY56roLP4ro0RGEuDenfbZRs8H2r7xox/Jr23T17O
         XQaK1hx0EUO1hw1lC0yBAGMEHay5j19t3eXtDhSVHNM30PL6DwMOFGqdpuMn8B9QKuLr
         AEVB7BDR6db/MY12orFZiiEj2ym80VMLsNVfXtSGs6wJ/cqbh4LtAfFRkFmwNOgZDseq
         8+9pslWiaEMxQXgPjOJ1/m24tq98vgnKus+Z5lhVf7yEsR0x6EmyTGIlNeRauI224Zzg
         wqSXfWS7BpFQt3JSwoDs7Bngq8dAi5mJY+EqA7IntCJhWw1ekJgF7y3SAssOExL03jvc
         oReQ==
X-Forwarded-Encrypted: i=1; AJvYcCV2X2TZtFalBE1o+P9qc2IGuW9zn2OYnfiXAbPXbF/jt6WkxMSy1d3Aocor3oMN7p9h1LTHJDEXwhTL9qxwFjXv@lists.infradead.org, AJvYcCVe3Z76VfiIcrJ0H7lTJsobXOXq08vqEM0qtp8SwUsCmDz20AJsA7b9gMpHooCc4cX+zIjLexdPdhCYs6qW1IE=@lists.infradead.org
X-Gm-Message-State: AOJu0YyCe/YnZDjgJI+8WA7T2UkiEKWHBcMkowHq1ADx+1WEkrLy64JL
	xcJGT9EqkD13DcrostA/FfbAm52O7kslm9a8/ovrbOTrXufANJofeqdtod3xCpSQCfTIjuz3COS
	rtjTcYD76y//uvzyWuDcPCMnglYZaJ2o=
X-Gm-Gg: ASbGncuxcIa7G98SPBtN6keMawvzfky/S1hbVoryXjvr/P8qHirjfVCVTddFNW57m10
	wDflp6i+ALZWJAnsUhBTdFUYsbR6bWp8wDuegJsHc1jS4i11kplg+PLmpTxYuisd6AyvuMEaltt
	qioRMbHBcKJPxQewe3PWgLIZH+NFyksZ2X2K4uaNoO1DM=
X-Google-Smtp-Source: AGHT+IHXAoU/5KkMHOwPj/9FFVapAMcrkwidaA20pDZe+6fW4OeNUdufuvg0OsHg+lbWtoD1W9V+6MaUGDrLNkTMyhA=
X-Received: by 2002:a17:907:60d1:b0:adb:2462:d921 with SMTP id
 a640c23a62f3a-ade1a9160c3mr401179666b.5.1749232143541; Fri, 06 Jun 2025
 10:49:03 -0700 (PDT)
MIME-Version: 1.0
References: <20250606071709.4738-1-chenqiuji666@gmail.com> <ff77f70e-344d-4b8a-a27f-c8287d49339c@linaro.org>
 <CANgpojXWk1zvu32bMuGgkVGVNvPw+0NWmSUC62Sbc3WcUXAd3A@mail.gmail.com> <ca3ce8df-aa4f-4422-8455-29db2440d8d5@linaro.org>
In-Reply-To: <ca3ce8df-aa4f-4422-8455-29db2440d8d5@linaro.org>
From: Qiu-ji Chen <chenqiuji666@gmail.com>
Date: Sat, 7 Jun 2025 01:48:51 +0800
X-Gm-Features: AX0GCFs2ajWvvueyvPNV-snyunQFsI1e-MJEy6pQ_bQ_hu8xTMdazrmACi39OKk
Message-ID: <CANgpojV51R5sKvowPiMk5MRAzJ3KZoti6mRXjD3Knfz6kk6+MA@mail.gmail.com>
Subject: Re: [PATCH] dmaengine: mediatek: Fix a flag reuse error in mtk_cqdma_tx_status()
To: Eugen Hristev <eugen.hristev@linaro.org>
Cc: sean.wang@mediatek.com, vkoul@kernel.org, matthias.bgg@gmail.com, 
	angelogioacchino.delregno@collabora.com, dmaengine@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-kernel@vger.kernel.org, baijiaju1990@gmail.com, stable@vger.kernel.org, 
	kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250606_104905_351588_CB0C6DF2 
X-CRM114-Status: GOOD (  16.28  )
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

Hello Eugen,

Thank you for discussing this with me!

In this specific code scenario, the lock acquisition order is strictly
fixed (e.g., pc->lock is always acquired before vc->lock). This
sequence is linear and won't interleave with other code paths in a
conflicting nested pattern (e.g., the pc =E2=86=92 vc sequence never coexis=
ts
with a potential vc =E2=86=92 pc sequence). Therefore, a standard spin_lock=
()
is sufficient to safely prevent deadlocks, and explicitly declaring a
nesting level via spin_lock_nested() is unnecessary.

Additionally, using spin_lock_nested() would require specifying an
extra nesting subclass parameter. This adds unnecessary complexity to
the code and could adversely affect maintainability for other
developers working on it in the future.

Best regards,
Qiu-ji Chen

> On 6/6/25 12:14, Qiu-ji Chen wrote:
> >> On 6/6/25 10:17, Qiu-ji Chen wrote:
> >>> Fixed a flag reuse bug in the mtk_cqdma_tx_status() function.
> >> If the first spin_lock_irqsave already saved the irq flags and disable=
d
> >> them, would it be meaningful to actually use a simple spin_lock for th=
e
> >> second lock ? Or rather spin_lock_nested since there is a second neste=
d
> >> lock taken ?
> >>
> >> Eugen
> >>
> >
> > Hello Eugen,
> >
> > Thanks for helpful suggestion. The modification has been submitted in
> > patch v2 as discussed.
> >
> > Best regards,
> > Qiu-ji Chen
>
> You are welcome, but in fact I suggested two alternatives. Any reason
> you picked this one instead of the other ?

