Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CDAECDB479
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Jun 2026 05:19:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wwH4JKRwdgPVqXhvs8JvCENushgrOY1a28q/t+owUbc=; b=vQ5RbMfFzqq1NysKmD4c3hbk65
	nyipNEw8CoRl6OOZRjCsWWxtu1I90nrPoVBLV4gh0Bju4zA5d9YMVwI9miTpNpOeauPMBnFTgZ0pS
	m28an2Mfgv9iVzP3j1fvxGjuFyaTgZ12jjw3KUg3vZVfec/NrP8eUJ0giHhqLqxHPs/WO8mjR1y3f
	Sv8bKppd8n+cCVvNcXyK0bb7Hc2r/cLECdKHF9z2exYk+AFIju+f5GNOGXn+RxPys/R9eBCB0VwtU
	u3/fY+XeiXyfURskUSuzvYQMfAd//d85+Kq9tyAau+Bm5gdzbULmnvX5WjaVxmTH3KcrFGi1jpnYq
	Lrrb3frA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcG10-000000079sD-1EOp;
	Wed, 24 Jun 2026 05:19:10 +0000
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcG0w-000000079rO-3Ukq
	for linux-arm-kernel@lists.infradead.org;
	Wed, 24 Jun 2026 05:19:08 +0000
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-8454c5a280aso1017620b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Jun 2026 22:19:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1782278345; x=1782883145; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=wwH4JKRwdgPVqXhvs8JvCENushgrOY1a28q/t+owUbc=;
        b=PWGh2cD7qeI6DXQBEBBoPqsAn6+UIDCbL2F7QOpPDoax6Ure6W6sc9tgPE6r9JKWIz
         77pzhrhwGAj/bLTT1FND+yInwZWjPQvTbbxapaDBhU5OvN2RBpD2QUChzjpLj44RO8Xn
         ZSMle1p2F2b/5+TsAtgcnq7W5eKDMj1tA1Bmk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782278345; x=1782883145;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wwH4JKRwdgPVqXhvs8JvCENushgrOY1a28q/t+owUbc=;
        b=V+H4DQbSO9BeFyp2EfItKvxJ/7NMcwx1xDZr3ChAa1XQ3DJwai6cnEKuqchp/wJnRi
         sAMROQXfD/o6Wb37a0nsQ0M2cYo7oEbMUS1f2VP1diokOrBGYtnEedf+HqJ4g9VQMWdu
         oD+RfDO9IOUKFAIQZ+u27Be3ymt/m60SdjJuTOIv9z2iyZlb+Mojy5cJ3jsuIbsJ2osU
         Gca4JgXQHCxdah5oo/GhH3rjthJJTrsC1538ss0YEfh+DrizV5T9PoY9OSTfFf7U3RFH
         KVSAaNsWKiBj22I5K/RO3sWEHmJaotC0g2+qlObegbK7mcQwxGmHVzA7g0DrZka0Ho1J
         QoUg==
X-Forwarded-Encrypted: i=1; AFNElJ+amrmiBW4xhkh3vLGqJZdcO5XrZ3Pscpk9GMK8gFlF+PquguoQz1pAq2BLQ3jVGQiB09a33t/K+xfPL2eSaHM1@lists.infradead.org
X-Gm-Message-State: AOJu0YyQdfm/Z+dOaTlmkGjr3ydb9Bmnyz0OepvvTH6tpgEs009odg2Z
	RcgEGEOFyvcdc/JHy8mX7tfFFhGC1r8L5mO9fFnMQlEL97Hn4voqXZ2a8qgnMcZ9LQ==
X-Gm-Gg: AfdE7cnc+PY2c3CTxTDknmdCsXiQXmzMyeY/Xf9fGQrFHlrDH/Bno8+mQH95jgY9Z0g
	LJBVZYP62r474SdN7LDkW84ODNCPYwkPr2RjW205UxzdeT+Vbl7IE3ciktqC80/MpXdx71hJlvB
	zgM84YbdZ8wDJXCUdhcaOS7IMKhHUen+9mbENfrLI59pRJwr1yuQzay06PObCiv8V6WzsTzHUEM
	TubX6c4uoy2RpODusPowlfKlHipG1tpUHdTaRgNVDay17zuW2N4tNBtpWKKwpnBSQrJxdNG6COb
	XZkkyNnDYzpsR4kUNZ6PGZQlQDRweCSyuGrOxt18y2i7HtzYokHcybvZiGrV5wn7byY6d5P/stA
	YkZKeZfTobENaB5IUvt02IS/VFVCvmOdVohv+J95HWGlKzL/yHHF1+bwa9P0ECaeHbgE4pS/T7G
	bJxE6eRDitdtog2ai2v5GFI0KQMa0ERWhtZt4kpEgRThxgb+Ehwwxl
X-Received: by 2002:a05:6a00:859d:b0:842:dd4:d9e2 with SMTP id d2e1a72fcca58-84591a1946amr5158854b3a.0.1782278345062;
        Tue, 23 Jun 2026 22:19:05 -0700 (PDT)
Received: from google.com ([2a00:79e0:2031:6:1287:5d13:b2d6:c6ab])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-845a4127bd0sm894643b3a.53.2026.06.23.22.19.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 22:19:04 -0700 (PDT)
Date: Wed, 24 Jun 2026 14:19:00 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Marcel Holtmann <marcel@holtmann.org>, 
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>, Sean Wang <sean.wang@mediatek.com>
Cc: Tomasz Figa <tfiga@chromium.org>, linux-bluetooth@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: Re: [PATCH v4 0/2] Bluetooth: btmtksdio: teardown fixes
Message-ID: <ajtoXTaBEMSyGADX@google.com>
References: <20260618031338.1011410-1-senozhatsky@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260618031338.1011410-1-senozhatsky@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260623_221906_905423_4DB7FA44 
X-CRM114-Status: GOOD (  10.20  )
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

On (26/06/18 12:13), Sergey Senozhatsky wrote:
> This fixes several teardown issues:
> 
>      INFO: task kworker/u17:0:189 blocked for more than 122 seconds.
>      __cancel_work_timer+0x3f4/0x460
>      cancel_work_sync+0x1c/0x2c
>      btmtksdio_flush+0x2c/0x40
>      hci_dev_open_sync+0x10c4/0x2190
>      [..]
> 
> close/flush can deadlock when run concurrently with btmtksdio_txrx_work().
> In addition btmtksdio_txrx_work() re-enables interrupts regardless of
> close/flush being executed on another CPU.
> 
> v3 -> v4:
> - fix commit message linter warnings/errors (tabs, subject line over 80
>   chars).
> 
> Sergey Senozhatsky (2):
>   Bluetooth: btmtksdio: test for BUS IO errors in btmtksdio_txrx_work()
>   Bluetooth: btmtksdio: call cancel_work_sync() out of host lock scope

Do the patches look good enough to pick up?

