Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09FBC606A327
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 08:38:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=J3Xtmy3L;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Gx36y+EF
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=8d0vDitzezDWa7J6bkNN1sM4Lg1Dh0lgOVgctT1VpEs=; b=J3Xtmy3L8ZdAKg
	sISFvuGMOxemyePXQ2IPE/ZL5GmAX5/U3VtUnYKrz1KKMikSxoqUN3/D8n2GNxYD7r2y5P/wptLkB
	7XkTiV5OzejrmWVpB71AeW3ece4AnkpUcBe+5M6691YXe6CM1AnuSlCbdYfTpNVI/IyQg1hzL1Xki
	mDaT8uu4P5SpXBeRda/j9pK9xJ2SBe8Yw+iU6LyKr6ZtWkK/ITH8XT6y99mw0HPs1uQkjX5ief80I
	NueORwEKmALneQL2R7LWQ2YQ+mO+K9kq01Tm3FXAWXCvbBHVw35LuQRDqvd9CCaMi097q6s2u7ZA1
	K5IIDwVLykGQpxFHvtZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNnYO-0000000Ft9e-416q;
	Mon, 02 Nov 2026 08:38:08 +0000
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNnYN-0000000Ft9L-0XzZ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Nov 2026 08:38:08 +0000
Received: by mail-pg1-x530.google.com with SMTP id 41be03b00d2f7-cdadf7e248aso925988a12.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Nov 2026 00:38:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793608686; x=1794213486; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8d0vDitzezDWa7J6bkNN1sM4Lg1Dh0lgOVgctT1VpEs=;
        b=Gx36y+EFtDXNeq36RZTjon+hZGLiEU3ZT0nfHJDTpze1U8qXB46AcFQymOwT8ZfJpv
         S0OSKDtnf0tWFe9PIuhqbSvvAZ4kT2gUDh7CiVE3PrhJga1S/s+CAMfLM+SBJU/BKivZ
         CluSnsRmwGE7mqZtAsZwfmOKWUP1Ywpw9p/L5RZEb8NMh75HuuJAIFvGg2cnSgqPrWc7
         4R+EDogB+KNulKy9r5bJdHyaSBV4u5BNf7jkeSDELUsWm1igHJ1wynVwe9uTGegce6LM
         JiEu+EwbCLevIMMp/BNcP/y4WLhE4qHF8N8l9xMXkMz+r6CLTeGk/l3MMwZPtQi3nlKh
         JXNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793608686; x=1794213486;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8d0vDitzezDWa7J6bkNN1sM4Lg1Dh0lgOVgctT1VpEs=;
        b=1pHpN4hN9tZbbwCBkCBFk95hr+53oC6HoyaTzh4txg0cPxXKld7DhvzBiduCJTuI/k
         1+D7i6nAxhZwN10be+R8OMFwW8+4tKOZFr/Lndc84IBZlX81NvBDKVBzAiBRWh3pDoGv
         qKqP6z3JGCS+2twPd1lx8pLesLdyM3HEGEw0iD1o1fyHc2Hp/2J0/IbqRRpW72ZgpogX
         e8nAn6lir8GrV0WFHNHRczrr4lt+SBFB93ZqGbS7NkiF3gz4xONWNzfx7pyH1uHpuTGh
         VHcQYLDaR1tfEC8pcRkKcOZD8jhnwFJ4/JSsFo2JFxIoI61wnNZY/xpFkvoR48aEY3x0
         exQg==
X-Forwarded-Encrypted: i=1; AKwUvBxbFKzjtw1pZSp+fTUWKUXJhiYHwUhVGtqMNbgDDscDkIROr1BbRR7mDyojXGSDnyspxNwyodvBaGg1DReGO/Ll@lists.infradead.org
X-Gm-Message-State: APuU4Z+hWWjhlHnYRpql1BuAWNdsxtuL6ZV4swE1jk1wmYLLkL9srd5T
	qnvD/nLCjfsOKARPexMVFSYkHd9QhHoNa30W04gdlgmkaqG1ciEghvTS
X-Gm-Gg: AYBFou2fxH/3/a2xqwz7LUu3yvJ4o/i7he2qhbfRIXt7A10b54Rewlmo4OocJw/yuTE
	ddaHX4KuIbMlV6aqdK75TV5wTPfbrZlV/hh/xDdYD1VSu6bsp3VlOio/X1jrTVzpYAFXuT3YTEi
	zsHWzRuetHP6aBgiPjl4l0Zij9s/6lv25954OrxyMAQn1ZDoGkR7SdxDc5PiobpOU37TNmfQUA3
	MLLA19YsWk0sOLwqgfqEMLaWN8d6B9XIrs4fyz99XBI85YcLO3nqXPSrwn9MpAB56JiUACF53Us
	YVg4R6Lb+f1C/oqDQoahbrnkw2pxjPJUZMFDU3ZBSOUyoklQMQTxJlPXk68jiJnwf1TDkBj1qq+
	IuK/hPqlRpKNn1NgYZhYgQw1YOcAovpYkkWCA5JlWugib7GozUvJkrqFvKOfJuCPyWjlhq7lYKf
	VHPY+vaVg00NtcGxNkEw2NAn7sC2cWLX6Yw8Hcsw0MhOrcqlgeIBHEgWNkmu2oI5NDsR02qtJUM
	4s9hSapx5K80mWDL/lcASu7FIm2qlF9Ul/mtJ/UKga17qJTCx1Eet2Vo7yNdg5okVPTadlH1aAs
	7itxE7RZUTJAYzpcfcjyi+4bDQTc9QRPLWdyNgZ7Sjk2m1pDH4C9zEA8R/PrJiPdSFA3b+u5kLa
	TqEWVm+lm6Hm+aWKs6ebK+aRmNk3gAy/lT8FUHQYq7WbPce78ltg5MkV/mZwzIplaDOAySA01ue
	t4TcRGPDKgd6Iylg==
X-Received: by 2002:a17:90b:5648:b0:3ad:93b4:718f with SMTP id 98e67ed59e1d1-3ae89879b52mr8145082a91.65.1793608685557;
        Mon, 02 Nov 2026 00:38:05 -0800 (PST)
Received: from spider.bream-herring.ts.net ([103.6.151.236])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae85f3e087sm7861463a91.1.2026.11.02.00.38.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 00:38:05 -0800 (PST)
From: Matthias Goergens <matthias.goergens@gmail.com>
To: Wei-Lin Chang <weilin.chang@arm.com>,
	Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>
Cc: Fuad Tabba <fuad.tabba@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org,
	Randy Dunlap <rdunlap@infradead.org>,
	linux-kernel@vger.kernel.org,
	workflows@vger.kernel.org
Subject: Re: [PATCH v2] Documentation/process: Add a maintainer entry profile for KVM/arm64
Date: Mon,  2 Nov 2026 16:37:59 +0800
Message-ID: <20261102083759.1561867-1-matthias.goergens@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <6urqt376s23fcyr5pchfrrowvjoo6acg5xt4ujkft7gww6sagj@jxz5rqihtkja>
References: <20261030083351.3040604-1-matthias.goergens@gmail.com> <6urqt376s23fcyr5pchfrrowvjoo6acg5xt4ujkft7gww6sagj@jxz5rqihtkja>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_003807_191870_733714A2 
X-CRM114-Status: UNSURE (   9.86  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Sat, 31 Oct 2026 21:03:17 +0000, Wei-Lin Chang wrote:
>> +Minor problems are often fixed up by the maintainers when applying; if they
>> +say "no need to resend", don't.
>
> The second half of this is a little silly :P
> What about just:
>
> Minor problems are often fixed up by the maintainers when applying; ask
> if you are unsure whether to resend.

Agreed, that reads better.  I'll use your wording in v3.

Thanks,
Matthias

