Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1A37D1BDE3
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 Nov 2024 18:55:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=y9ByzT5rhkqv1UFXFeAa7XDWoMGVN9DTUnpFtsiZv98=; b=35MqwYcPpm6cyVss/MohVNUhgn
	KckZE9QmjejaLDBa9bOnVAuajYvuLfSFeW60JADfLJE/xxLSWOSIofG/dT5+nAA9COe0sOMa/swzz
	kcFyiBrlU/hMn5+bouJULbptBYVpIjBGgG8AL915EvkBwoGKwSOjyi18qabcmrMyT2NlYhW4Z+Yba
	T2qIhZpQj2GfzZlg88Ps16/oHV6Ll5BOOQ86r09WdOwDD+rL6mXR+VpgeQXkCX2Ba2m7B9ui+DJzn
	u+zPTQwRMS4rctKm1BOIvdPfbExMgZm1+Pz7txaItva+dr50jDlB7woqaN+KuXbda0qg8H1lDdTUm
	E5u2cIZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t82ET-0000000EpTe-2K6D;
	Mon, 04 Nov 2024 18:55:21 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t829g-0000000Ep2k-2ljy
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 Nov 2024 18:50:26 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-20cceb8d8b4so29445025ad.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 04 Nov 2024 10:50:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1730746223; x=1731351023; darn=lists.infradead.org;
        h=mime-version:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=y9ByzT5rhkqv1UFXFeAa7XDWoMGVN9DTUnpFtsiZv98=;
        b=G92xOdZSFDa86BsskKbi/zNswmdifi9xGesarVmiIm+60Ma0oOX7hmSr39ULwdmIVc
         A8gIrFRC3mpWfWXgAD9T2YSRlsAZ0iORTsgf2OwAgrGk42XL5GP2ji2NbL/vkU628L0Y
         hclJiEV21TZAjCawZji8S6VW3X+EnlSAInxNNdy90HNJhOJXaqvZcCiXYwOSurtAedOh
         xykuyqAathZWphLRxGCQ8PgenpZfMc49KcJLivGbmzbvAoGdXlAhEMPeb3vSwjWwPfHu
         8scLILedHSZWtTdL7bXsGI9Y+ugiTH37cggGFNP7OIxJWhOBAUkYOh6nOhZf9cex2Mud
         0ntA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730746223; x=1731351023;
        h=mime-version:message-id:date:subject:cc:to:from:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=y9ByzT5rhkqv1UFXFeAa7XDWoMGVN9DTUnpFtsiZv98=;
        b=VH3tmPJGWqf5k4mC/0tzbQ8XHmDjaCa0568paZPXA20k6ZlI6TzFUoGKAJxk0R1chS
         mYU9QuVfs5J8XS82tDb0UfKyYKVGrDEp/nsgJDJknjXCwoifXnjX9tuSjzDcynQ0WZiz
         3QnN/JFSTwLElxxJj3dr8h9TB07MX5/ESynXv8Qp0l256MhhwCgY1VM5MHjOcbD8dzNC
         69sTIPgI+DyzwZiHz2PVlRnjJVDyqnyy5/b1kr1XId1/Rw7H43a1FUnmhlwh+n0v6VLg
         f18qGCo+ZoRKaYtuFgYWbUPOCr63plJnqp35KYB2k3hNBmLisDwf5ssSsoGdpjJq4EFE
         A8ow==
X-Forwarded-Encrypted: i=1; AJvYcCU48GTPu3VecouqNIlk/LwsmZCWXnhlCzM2Cw0cyhME73G7/asghm9GB3HWheev8wUKSbEi+1hO3gSazXBUGBsJ@lists.infradead.org
X-Gm-Message-State: AOJu0Ywx3qUCCkZdkc+Mfdj4t4MILvvNv4OQ36nVLRn2bRq6s2R+xk4e
	dbvweRYwKVDWAhUpSm64iUeGEeZGX3R3CNDO6KiC1xff91hMwaavQe8iQaBp80k=
X-Google-Smtp-Source: AGHT+IH49Bn3FifJ33FPD5Gz33gFu44F9HIMX+OnVbzafXRnP5Wsu0eGXm5Lc/0fHXbLXgtkonLylg==
X-Received: by 2002:a17:902:dac6:b0:205:8763:6c2d with SMTP id d9443c01a7336-211056b2c5dmr236699765ad.9.1730746223147;
        Mon, 04 Nov 2024 10:50:23 -0800 (PST)
Received: from localhost ([97.126.177.194])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-211056ef03bsm64652515ad.37.2024.11.04.10.50.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Nov 2024 10:50:22 -0800 (PST)
From: Kevin Hilman <khilman@baylibre.com>
To: soc@kernel.org
Cc: linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] soc: ti: driver updates for v6.13
Date: Mon, 04 Nov 2024 10:50:22 -0800
Message-ID: <7hplnaomtt.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241104_105024_930051_E2EB63ED 
X-CRM114-Status: UNSURE (   7.40  )
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

The following changes since commit 9852d85ec9d492ebef56dc5f229416c925758edc:

  Linux 6.12-rc1 (2024-09-29 15:06:19 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/khilman/linux-omap.git tags/omap-for-v6.13/drivers-signed

for you to fetch changes up to d8ee46b226ace0110f82233ba4c06ff1742ae443:

  thermal/ti-soc-thermal: Fix typos (2024-10-04 14:37:23 -0700)

----------------------------------------------------------------
soc: ti: driver updates for v6.13

----------------------------------------------------------------
Andrew Kreimer (1):
      thermal/ti-soc-thermal: Fix typos

Jinjie Ruan (1):
      soc: ti: smartreflex: Use IRQF_NO_AUTOEN flag in request_irq()

 drivers/soc/ti/smartreflex.c                      | 4 ++--
 drivers/thermal/ti-soc-thermal/dra752-bandgap.h   | 4 ++--
 drivers/thermal/ti-soc-thermal/omap4xxx-bandgap.h | 8 ++++----
 drivers/thermal/ti-soc-thermal/omap5xxx-bandgap.h | 4 ++--
 4 files changed, 10 insertions(+), 10 deletions(-)

